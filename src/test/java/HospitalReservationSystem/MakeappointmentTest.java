/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HospitalReservationSystem;

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
public class MakeappointmentTest {
    
    public MakeappointmentTest() {
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
     * Test of getSelecteddepartment method, of class Makeappointment.
     */
    @Test(expected=NullPointerException.class)
    public void testGetSelecteddepartment() {
        System.out.println("getSelecteddepartment");
        Makeappointment instance = null;
        String expResult = "";
        String result = instance.getSelecteddepartment();
        assertNull(result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setSelecteddepartment method, of class Makeappointment.
     */
    @Test(expected=NullPointerException.class)
    public void testSetSelecteddepartment() {
        System.out.println("setSelecteddepartment");
        String selecteddepartment = "";
        Makeappointment instance = null;
        instance.setSelecteddepartment(selecteddepartment);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getSelecteddoctor method, of class Makeappointment.
     */
    @Test(expected=NullPointerException.class)
    public void testGetSelecteddoctor() {
        System.out.println("getSelecteddoctor");
        Makeappointment instance = null;
        String expResult = "";
        String result = instance.getSelecteddoctor();
        assertNull(result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setSelecteddoctor method, of class Makeappointment.
     */
    @Test(expected=NullPointerException.class)
    public void testSetSelecteddoctor() {
        System.out.println("setSelecteddoctor");
        String selecteddoctor = "";
        Makeappointment instance = null;
        instance.setSelecteddoctor(selecteddoctor);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
