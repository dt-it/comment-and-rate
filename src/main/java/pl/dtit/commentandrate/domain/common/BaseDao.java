package pl.dtit.commentandrate.domain.common;

import pl.dtit.commentandrate.config.DataSourceProvider;

import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

//Obiekt DataSource i pobieranie z niego nowych połączeń - część wspólna dla WSZYSTKICH DAO
public class BaseDao {
    private final DataSource dataSource;

    public BaseDao() {
        try {
            this.dataSource = DataSourceProvider.getDataSource();
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }

    public Connection getConnection(){
        try {
            return dataSource.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
