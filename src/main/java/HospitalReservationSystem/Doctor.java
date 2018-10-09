        /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HospitalReservationSystem;

/**
 *
 * @author Jesse
 */
public class Doctor extends User{
    private int staffcode;
    
    public Doctor(){}
    
    public boolean staffSignup(Doctor d){
        return 123123==d.staffcode;
    }

    public int getStaffcode() {
        return staffcode;
    }

    public void setStaffcode(int staffcode) {
        this.staffcode = staffcode;
    }
    
}
