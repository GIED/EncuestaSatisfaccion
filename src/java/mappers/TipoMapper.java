package mappers;



import beans.Cat_TipoParticipanteBean;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TipoMapper implements Mapper {

    public Object mapRow(ResultSet rs) throws SQLException {
        Cat_TipoParticipanteBean dat = new Cat_TipoParticipanteBean();
        
       
        if (rs.getString("id_tipo") != null) {
            dat.setID_TIPO(rs.getString("id_tipo").trim());
        } else {
            dat.setID_TIPO(rs.getString("id_tipo"));
        }
        if (rs.getString("descripcion") != null) {
            dat.setDESCRIPCION(rs.getString("descripcion").trim());
        } else {
            dat.setDESCRIPCION(rs.getString("descripcion"));
        }
        
         
        return dat;
    }

}
