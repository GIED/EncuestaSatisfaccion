/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mappers;

import beans.Cat_EventoBean;
import beans.Res_ConBean;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class regEncMapper implements Mapper{
    
     public Object mapRow(ResultSet rs) throws SQLException {
         Res_ConBean dat = new Res_ConBean();
        
       
        if (rs.getString("FOLIO") != null) {
            dat.setFOLIO(rs.getString("FOLIO").trim());
        } else {
            dat.setFOLIO(rs.getString("FOLIO"));
        }
        if (rs.getString("ENCUESTAS") != null) {
            dat.setENCUESTAS(rs.getString("ENCUESTAS").trim());
        } else {
            dat.setENCUESTAS(rs.getString("ENCUESTAS"));
        }
        
         
        return dat;
    }
    
}
