package mappers;


import beans.Cat_Nom_EveBean;
import beans.EncabezadoBean;
import java.sql.ResultSet;
import java.sql.SQLException;

public class NombreEventoMapper implements Mapper {

    public Object mapRow(ResultSet rs) throws SQLException {
        Cat_Nom_EveBean dat = new Cat_Nom_EveBean();
        
       
        if (rs.getString("id_nom_eve") != null) {
            dat.setID_NOM_EVE(rs.getString("id_nom_eve").trim());
        } else {
            dat.setID_NOM_EVE(rs.getString("id_nom_eve"));
        }
        if (rs.getString("descripcion") != null) {
            dat.setDESCRIPCION(rs.getString("descripcion").trim());
        } else {
            dat.setDESCRIPCION(rs.getString("descripcion"));
        }
        
         
        return dat;
    }

}
