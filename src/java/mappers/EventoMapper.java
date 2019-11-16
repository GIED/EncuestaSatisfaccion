package mappers;


import beans.Cat_EventoBean;
import beans.EncabezadoBean;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EventoMapper implements Mapper {

    public Object mapRow(ResultSet rs) throws SQLException {
        Cat_EventoBean dat = new Cat_EventoBean();
        
       
        if (rs.getString("id_evento") != null) {
            dat.setID_EVENTO(rs.getString("id_evento").trim());
        } else {
            dat.setID_EVENTO(rs.getString("id_evento"));
        }
        if (rs.getString("nombre_evento") != null) {
            dat.setNOM_EVENTO(rs.getString("nombre_evento").trim());
        } else {
            dat.setNOM_EVENTO(rs.getString("nombre_evento"));
        }
        
         
        return dat;
    }

}
