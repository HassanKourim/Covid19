/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package icpcasuitcontest_1;

import java.util.Scanner;

/**
 *
 * @author f
 */
public class ICPCAsuitContest_1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        Scanner scan = new Scanner(System.in);
        long a = scan.nextLong();
        long b = scan.nextLong();
        long k = scan.nextLong();
        win(a,b,k);
    }
    
    // B. Memo and Momo
    static void win(long a, long b, long k){
        if (a % k == 0 && b % k == 0){
            System.out.println("Both");
        }else if (a % k == 0 && b % k != 0){
            System.out.println("Memo");
        }else if (a % k != 0 && b % k == 0){
            System.out.println("Momo");
        }else if (a % k != 0 && b % k != 0){
            System.out.println("No One");
        }
    }
    
    
    
    /*
    // A. winter sales
    // to know the originalPrice you can calculate price / (1- discount * 100)
    static void discount(double x , int p){
        double originalPrice =  p / (1-(x / 100));
        System.out.println(originalPrice);
        
    } // end discount method
    */
    
} // end the class 
