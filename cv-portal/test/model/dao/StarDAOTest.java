/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao;

import model.bean.Star;
import static org.junit.Assert.*;
import org.junit.Test;

/**
 *
 * @author lucas
 */
public class StarDAOTest {
    
    public StarDAOTest() {
    }

    @Test
    public void consulta() {
        StarDAO dao = new StarDAO();
        Star star = Star.newStar();

        for(Star s: dao.SearchNameObject(star)){
            System.out.println("nome do objeto"+s.getNameCat());
            System.out.println(s.getRaCat());
        }
    }
    
}
