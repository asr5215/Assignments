import java.io.*;
import java.security.MessageDigest;
import java.util.*;

import javax.xml.bind.DatatypeConverter;
/*
 * Alexander Rhone
 * COMP 597 – Computer Forensics
 * Assignment #1
 */
public class Assignment1 {
	static int [] array;
	public static void main(String[] args) throws Exception{
		Scanner sc = new Scanner (System.in);
		System.out.println("Enter the text file.");
		String filename = sc.nextLine();
		BufferedReader reader = new BufferedReader(new FileReader(filename));
		MessageDigest digest;
		MessageDigest digestcopy;
		System.out.println("Enter the type of hash that you want to run.");
		System.out.println("1: MD5");
		System.out.println("2: SHA-1");
		System.out.println("3: SHA-256");
		int typeofhash = Integer.valueOf(sc.nextLine());
		if (typeofhash == 1){
			digest = MessageDigest.getInstance("MD5");
			digestcopy = MessageDigest.getInstance("MD5");
		}
		if (typeofhash == 2){
			digest = MessageDigest.getInstance("SHA-1");
			digestcopy = MessageDigest.getInstance("SHA-1");
		}
		else{// (typeofhash == 3){
			digest = MessageDigest.getInstance("SHA-256");
			digestcopy = MessageDigest.getInstance("SHA-256");
		}
		System.out.println("Enter the number of character modifications you would like to have");
		int numberofcharactermodifications = Integer.valueOf(sc.nextLine());
		StringBuilder messagehold = new StringBuilder("");
		// loop to take in all the input from the file
		try{
			String hold;
			while((hold = reader.readLine()) != null){
				messagehold.append(hold);
			}
		}
		catch (Exception e){
			
		}
		String message = messagehold.toString();
		byte[] hash = digest.digest(message.toString().getBytes("UTF-8"));
		String encodedhash = DatatypeConverter.printBase64Binary(hash);
		int length = message.length();
		array = new int[length];
		long start = System.nanoTime();
		// determines what each character should be replaced to
		for (int i = 0; i < numberofcharactermodifications; i++){
			array[i] = 1;
		}
		int lowest = 0;
		StringBuilder messagecopy = new StringBuilder(message);
		int collisions = 0;
		// Determines what each character is going to be replaced from array
		for (int i = lowest; i < lowest + numberofcharactermodifications; i++){
			if (array[i] < 10){
				messagecopy.replace(i, i + 1, "" + array[i]);
			}
			else{
				messagecopy.replace(i, i + 1, "" + (char) (array[i] + 97 - 10));
			}
		}
		// gets the hash value for the new string
		byte[] hashcopy = digestcopy.digest(messagecopy.toString().getBytes("UTF-8"));
		String encodedhashcopy = DatatypeConverter.printBase64Binary(hashcopy);
		if (encodedhashcopy.equals(encodedhash) && !message.equals(messagecopy.toString())){
			collisions++;
		}
		int copies = 1;
		// loop that flips all possible characters
		while (true){
			messagecopy = new StringBuilder(message);
			boolean istrue = true;
			// determines what each character should be replaced to
			for (int i = lowest; i < lowest + numberofcharactermodifications + 1 && istrue && i < length; i++){
				array[i] = (array[i] + 1) % 62;
				if(array[i] != 0){
					istrue = false;
				}
			}
			// makes sure there is no index out of bounds error and if the last character comes back to 0 stops the loop
			if (lowest + numberofcharactermodifications == length){
				if (array[lowest + numberofcharactermodifications - 1] == 0){
					break;
				}
			}
			else if (array[lowest + numberofcharactermodifications] != 0){
				lowest++;
			}
			// Determines what each character is going to be replaced as from array
			for (int i = lowest; i < lowest + numberofcharactermodifications && i < length; i++){
				//System.out.print(array[i]);
				if (array[i] < 10){
					messagecopy.replace(i, i + 1, "" + array[i]);
				}
				else if (array[i] < 36){
					messagecopy.replace(i, i + 1, "" + (char) (array[i] + 97 - 10));
				}
				else{
					messagecopy.replace(i, i + 1, "" + (char)(array[i] + 65 - 36));
				}
			}
			// checks if there is a collision
			hashcopy = digestcopy.digest(messagecopy.toString().getBytes("UTF-8"));
			encodedhashcopy = DatatypeConverter.printBase64Binary(hashcopy);
			if (encodedhashcopy.equals(encodedhash) && !message.equals(messagecopy.toString())){
				collisions++;
			}
			copies++;
		}
		long end = System.nanoTime();
		System.out.println("Number of copies tested: " + copies);
		System.out.println("Number of collisions: " + collisions);
		long elapsedtime = end - start;
		System.out.println("Elapsed time: " + ((double)elapsedtime/ 1000000000.0) + "seconds");
	}

}