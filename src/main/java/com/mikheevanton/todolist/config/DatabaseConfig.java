package com.mikheevanton.todolist.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

@Configuration
@EnableJpaRepositories("com.mikheevanton.todolist.repository")
@EnableTransactionManagement
@PropertySource("classpath:db.properties")
@ComponentScan("com.mikheevanton.todolist")
public class DatabaseConfig {
    @Resource
    private Environment environment;

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(){
        LocalContainerEntityManagerFactoryBean managerFactoryBean = new LocalContainerEntityManagerFactoryBean();
        managerFactoryBean.setDataSource(dataSource());
        managerFactoryBean.setPackagesToScan(environment.getRequiredProperty("db.entity.package"));
        managerFactoryBean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        managerFactoryBean.setJpaProperties(getHibernateProperties());

        return managerFactoryBean;
    }

    @Bean
    public DataSource dataSource(){
        BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setUrl(environment.getRequiredProperty("db.url"));
        basicDataSource.setDriverClassName(environment.getRequiredProperty("db.driver"));
        basicDataSource.setUsername(environment.getRequiredProperty("db.username"));
        basicDataSource.setPassword(environment.getRequiredProperty("db.password"));

        basicDataSource.setInitialSize(Integer.parseInt(environment.getRequiredProperty("db.initialSize")));
        basicDataSource.setMaxIdle(Integer.parseInt(environment.getRequiredProperty("db.maxIdle")));
        basicDataSource.setMinIdle(Integer.parseInt(environment.getRequiredProperty("db.minIdle")));
        basicDataSource.setTimeBetweenEvictionRunsMillis(Integer.parseInt(environment.getRequiredProperty("db.timeBetweenEvictionRunsMillis")));
        basicDataSource.setMinEvictableIdleTimeMillis(Integer.parseInt(environment.getRequiredProperty("db.minEvictableIdleTimeMillis")));
        basicDataSource.setTestOnBorrow(Boolean.parseBoolean(environment.getRequiredProperty("db.testOnBorrow")));
        basicDataSource.setValidationQuery(environment.getRequiredProperty("db.validationQuery"));


        return basicDataSource;
    }

    @Bean
    public PlatformTransactionManager transactionManager(){
        JpaTransactionManager tm = new JpaTransactionManager();
        tm.setEntityManagerFactory(entityManagerFactory().getObject());
        return tm;
    }

    private Properties getHibernateProperties() {
        try {
            Properties prop = new Properties();
            InputStream io = getClass().getClassLoader().getResourceAsStream("hibernate.properties");
            prop.load(io);
            return prop;

        }catch (IOException e){
            throw new IllegalArgumentException("Can't find hibernate properties");
        }
    }
}
