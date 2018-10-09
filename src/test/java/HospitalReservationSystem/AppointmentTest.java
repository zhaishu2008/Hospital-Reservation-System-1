/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HospitalReservationSystem;

import java.util.Date;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Administrator
 */
public class AppointmentTest {
    
    public AppointmentTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getComments method, of class Appointment.
     */
    
  
    @Test(expected=NullPointerException.class)
    public void testGetComments() {
        System.out.println("getComments");
        Appointment instance = null;
        String expResult = "";
        String result = instance.getComments();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setComments method, of class Appointment.
     */
    @Test(expected=NullPointerException.class)
    public void testSetComments() {
        System.out.println("setComments");
        String comments = "";
        Appointment instance = null;
        instance.setComments(comments);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTime method, of class Appointment.
     */
    @Test(expected=NullPointerException.class)
    public void testGetTime() {
        System.out.println("getTime");
        Appointment instance = null;
        String expResult = "";
        String result = instance.getTime();
        assertNull(result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setTime method, of class Appointment.
     */
    @Test(expected=NullPointerException.class)
    public void testSetTime() {
        System.out.println("setTime");
        String time = "";
        Appointment instance = null;
        instance.setTime(time);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDate method, of class Appointment.
     */
    @Test(expected=NullPointerException.class)
    public void testGetDate() {
        System.out.println("getDate");
        Appointment instance = null;
        Date expResult = null;
        Date result = instance.getDate();
        assertNull(result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setDate method, of class Appointment.
     */
    @Test(expected=NullPointerException.class)
    public void testSetDate() {
        System.out.println("setDate");
        Date date = null;
        Appointment instance = null;
        instance.setDate(date);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUsername method, of class Appointment.
     */
    @Test(expected=NullPointerException.class)
    public void testGetUsername() {
        System.out.println("getUsername");
        Appointment instance = null;
        String expResult = "";
        String result = instance.getUsername();
        assertNull(result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setUsername method, of class Appointment.
     */
    @Test(expected=NullPointerException.class)
    public void testSetUsername() {
        System.out.println("setUsername");
        String username = "";
        Appointment instance = null;
        instance.setUsername(username);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDoctorname method, of class Appointment.
     */
    @Test(expected=NullPointerException.class)
    public void testGetDoctorname() {
        System.out.println("getDoctorname");
        Appointment instance = null;
        String expResult = "";
        String result = instance.getDoctorname();
        assertNull(result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setDoctorname method, of class Appointment.
     */
    @Test(expected=NullPointerException.class)
    public void testSetDoctorname() {
        System.out.println("setDoctorname");
        String doctorname = "";
        Appointment instance = null;
        instance.setDoctorname(doctorname);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of isStatus method, of class Appointment.
     */
    @Test(expected=NullPointerException.class)
    public void testIsStatus() {
        System.out.println("isStatus");
        Appointment instance = null;
        boolean expResult = false;
        boolean result = instance.isStatus();
        assertNull(result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setStatus method, of class Appointment.
     */
    @Test(expected=NullPointerException.class)
    public void testSetStatus() {
        System.out.println("setStatus");
        boolean status = false;
        Appointment instance = null;
        instance.setStatus(status);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
