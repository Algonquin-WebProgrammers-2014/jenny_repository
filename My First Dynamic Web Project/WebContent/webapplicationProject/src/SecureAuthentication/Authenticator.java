/**
 * Responsible for encrypting the password using the salt and hash algorithm
 * 
 * With the help of this particular websites:
 * 
 * http://en.wikipedia.org/wiki/Salt_(cryptography)
 * https://crackstation.net/hashing-security.htm
 * 
 * @author Rodolfo Navalon
 * @version 0.1
 * @see Authenticator
 * **/

package SecureAuthentication;

import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Arrays;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;


public class Authenticator {

	/**
	 * Constructs secret keys using the Password-Based Key Derivation Function function
	 * **/
	public static final String	HASH_ALGORITHM			= "PBKDF2WithHmacSHA256";
	
	/**
	 * The bit size of the Hash and Salt. Default value of 192 which will generate
	 * 48 characters in hex representation.
	 * **/
	public static final int 	SALT_KEY_BIT_SIZE 		= 192;
	public static final int 	HASH_KEY_BIT_SIZE 		= 192;
	
	/**
	 * The maximum and minimum iteration cycles of the hash used in AES algorithm.
	 * The greater the iteration the slower the hash is created. 
	 * Mainly used to slow the attackers that are using Brute-Force.
	 * **/
	public static final int 	SLOWNESS_FACTOR_MAX 	= 9999;
	public static final int 	SLOWNESS_FACTOR_MIN		= 2000;
		
	/**
	 * Constructs secret keys using the Password-Based Key Derivation Function function
	 * 
	 * @param password		the String password converted in char array
	 * @return		the salt and hashed password that was generated by PBKDF2
	 * @throws NoSuchProviderException 
	 * **/
	public static String createHashPassword(char[] password) throws InvalidKeySpecException, NoSuchAlgorithmException, NoSuchProviderException 
	{
		//create secureRandom instance using the Sun's SHA1PRNG
		SecureRandom sr = SecureRandom.getInstance("SHA1PRNG", "SUN");
		
		//generate a Cryptographically Secure Pseudo-Random Number Generated salt
		byte[] salt = generateSecureRandomSalt(sr, SALT_KEY_BIT_SIZE/8);
		
		//generate a Cryptographically Secure Pseudo-Random Number Generated SLOWNESS_FACTOR
		int iteration = generateSecureRandomIterator(sr, SLOWNESS_FACTOR_MAX, SLOWNESS_FACTOR_MIN);
		
		byte[] hashedPassword = createPBKDF2(password, salt, iteration, HASH_KEY_BIT_SIZE);
		
		return iteration + ":" + createHexFromByte(salt) + ":" + createHexFromByte(hashedPassword);	
	}
	
	/**
	 * Constructs secret keys using the Password-Based Key Derivation Function function
	 * 
	 * @param password			the String password in char array
	 * @param salt				the random generated salt
	 * @param iterationCount	the number of cycles/iteration/slownessFactor
	 * @param keyLength			the length of the derived key
	 * 
	 * @return					The encoded hash password	
	 * **/
	public static byte[] createPBKDF2(char[] password, byte[] salt, int iterationCount, int keyLength) throws InvalidKeySpecException, NoSuchAlgorithmException
	{
		KeySpec spec = new PBEKeySpec(password, salt, iterationCount, keyLength);
		return SecretKeyFactory.getInstance(HASH_ALGORITHM).generateSecret(spec).getEncoded();
	}
	
	/**
	 * Generate a secure random byte[] salt
 	 * 
	 * @param sr	the object of the SecureRandom class
	 * @param size	the byte size of the array
	 * @return		the random generated byte array
	 * **/
	public static byte[] generateSecureRandomSalt(SecureRandom sr, int size)
	{
		byte[] salt = new byte[size];
		sr.nextBytes(salt);
		return salt;
	}
	
	/**
	 * Generate a secure integer random for the iteration on a given range
	 * 
	 * Adds another layer to security to the hash, each of the hash will have
	 * random iteration ranging from 2000-9999 
	 * 
	 * @param max	the maximum range of the random iterator
	 * @param min	the minimum range of the random iterator
	 * @param sr	the object of the SecureRandom class
	 * @return		the random generated iteration integer
	 * **/
	public static int generateSecureRandomIterator(SecureRandom sr, int max, int min)
	{
		return sr.nextInt((max - min) + 1) + min;
	}
	

	/**
	 * Check if the the given password is equivalent to the hash.
	 * Convert the password to hash using the <b>iteration</b> and 
	 * <b>salt</b> of the given hash.
	 * 
	 * @param password	the password to check
	 * @param hash		the hash from the database
	 * @return			if the password is identical to the given salt & hash
	 * **/
	public static boolean validatePassword(String password, String hash) throws InvalidKeySpecException, NoSuchAlgorithmException
	{
		//split the password from the database
		String [] split = hash.split(":");
		
		int iteration = Integer.parseInt(split[0]);
		byte[] salt = createByteFromHex(split[1]);
		byte[] passwordHash = createByteFromHex(split[2]);
		
		byte[] checkPasswordHash = createPBKDF2(password.toCharArray(), salt, iteration, passwordHash.length * 8);
		
		return Arrays.equals(passwordHash,checkPasswordHash);
	}
	
//	private static boolean slowEquals(byte[] a, byte[] b)
//    {
//        int diff = a.length ^ b.length;
//        for(int i = 0; i < a.length && i < b.length; i++)
//            diff |= a[i] ^ b[i];
//        return diff == 0;
//    }
	
	/**
	 * Create a one-to-one mapping of given bytes to hex
	 * that convert byte array to String hex.
	 * 
	 * Allow leading 0 on the left side of the hex.
	 * 
	 * @param password 		the byte array of the password
	 * **/
	public static String createHexFromByte(byte[] password)
	{
		BigInteger bi = new BigInteger(1,password);		
		String hex = bi.toString(16);
		int padding = (password.length * 2) - hex.length();
		
		if(padding > 0)
			return String.format("%0" + padding + "d" , 0) + hex;
		else
			return hex;
	}
	
	/**
	 * Create a byte array representation of the hex.
	 * 
	 * @param hex 		the String hex representation
	 * **/
	public static byte[] createByteFromHex(String hex)
	{
		byte [] bArray = new byte[hex.length() / 2];
		
		for(int i = 0; i < bArray.length; i++)
		{
			int index = i * 2;
			int value = Integer.parseInt(hex.substring(index, index + 2), 16);
			bArray[i] = (byte)value;
		}
		return bArray;
	}
	
}
