package org.apache.juddi.config;

public interface Property {
    public final static String JDDU_SUBSCRIPTION_MAXENTITIES="juddi.subscription.maxentities";
    public final static String JUDDI_ROOT_PUBLISHER = "juddi.root.publisher";
    public final static String JUDDI_LOAD_INSTALL_DATA = "juddi.load.install.data";
    public final static String JUDDI_PERSISTENCEUNIT_NAME = "juddi.persistenceunit.name";
    public final static String JUDDI_AUTHENTICATOR = "juddi.authenticator";
    public final static String JUDDI_AUTHENTICATOR_URL = "juddi.authenticator.url";
    public final static String JUDDI_CONFIGURATION_RELOAD_DELAY = "juddi.configuration.reload.delay";
    public final static String JUDDI_LOCALE = "juddi.locale";
    public final static String JUDDI_OPERATOR_EMAIL_ADDRESS = "juddi.operatorEmailAddress";
    public final static String JUDDI_MAX_LENGTH = "juddi.maxNameLength";
    public final static String JUDDI_MAX_NAME_ELEMENTS = "juddi.maxNameElementsAllowed";
    public final static String JUDDI_MAX_BUSINESSES_PER_PUBLISHER = "juddi.maxBusinessesPerPublisher";
    public final static String JUDDI_MAX_SERVICES_PER_BUSINESS = "juddi.maxServicesPerBusiness";
    public final static String JUDDI_MAX_BINDINGS_PER_SERVICE = "juddi.maxBindingsPerService";
    public final static String JUDDI_MAX_TMODELS_PER_PUBLISHER = "juddi.maxTModelsPerPublisher";
    public final static String JUDDI_CRYPTOR = "juddi.cryptor";
    public final static String JUDDI_KEYGENERATOR = "juddi.keygenerator";
    public final static String JUDDI_SECURITY_DOMAIN = "juddi.securityDomain";
    public final static String JUDDI_USERSFILE = "juddi.usersfile";
    public final static String JUDDI_MAX_ROWS = "juddi.maxRows";
    public final static String JUDDI_MAX_IN_CLAUSE = "juddi.maxInClause";
    public final static String JUDDI_ROOT_PARTITION = "juddi.rootPartition";
    public final static String JUDDI_NODE_ID = "juddi.nodeId";
    public final static String JUDDI_TRANSFER_EXPIRATION_DAYS = "juddi.transfer.expiration.days";
    public final static String JUDDI_AUTHENTICATE_INQUIRY = "juddi.authenticate.Inquiry";
    public final static String JUDDI_AUTH_TOKEN_EXPIRATION = "juddi.auth.token.Expiration";
    public final static String JUDDI_AUTH_TOKEN_TIMEOUT = "juddi.auth.token.Timeout";
    public final static String JUDDI_ENFORCE_REFERENTIAL_INTEGRITY = "juddi.validation.enforceReferentialIntegrity";
    public final static String JUDDI_SUBSCRIPTION_EXPIRATION_DAYS = "juddi.subscription.expiration.days";
    public final static String JUDDI_NOTIFICATION_START_BUFFER = "juddi.notification.start.buffer";
    public final static String JUDDI_NOTIFICATION_INTERVAL = "juddi.notification.interval";
    public final static String JUDDI_NOTIFICATION_ACCEPTABLE_LAGTIME = "juddi.notification.acceptable.lagtime";
    public final static String JUDDI_NOTIFICATION_MAX_TRIES = "juddi.notification.max.tries";
    public final static String JUDDI_NOTIFICATION_LIST_RESET_INTERVAL = "juddi.notification.list.reset.interval";
    public final static String JUDDI_SUBSCRIPTION_CHUNKEXPIRATION_MINUTES = "juddi.subscription.chunkexpiration.minutes";
    public final static String JUDDI_JNDI_REGISTRATION = "juddi.jndi.registration";
    public final static String JUDDI_RMI_PORT = "juddi.rmi.port";
    public final static String JUDDI_RMI_REGISTRATION = "juddi.rmi.registration";
    public final static String JUDDI_RMI_REGISTRY_PORT = "juddi.rmi.registry.port";
    public final static String JUDDI_SUBSCRIPTION_NOTIFICATION = "juddi.subscription.notification";
    public final static String JUDDI_EMAIL_PREFIX = "juddi.mail.smtp.prefix";
    public final static String JUDDI_EMAIL_FROM   = "juddi.mail.smtp.from";
    public final static String DEFAULT_JUDDI_EMAIL_PREFIX = "juddi.";
    public final static String DEFAULT_CRYPTOR = "org.apache.juddi.cryptor.DefaultCryptor";
    public final static String DEFAULT_USERSFILE = "juddi-users.properties";
    public final static String DEFAULT_XML_USERSFILE = "juddi-users.xml";
    public final static String DEFAULT_ENCRYPTED_XML_USERSFILE = "juddi-users-encrypted.xml";
    public final static String DEFAULT_SECURITY_DOMAIN = "java:/jaas/other";
    public final static boolean DEFAULT_LOAD_INSTALL_DATA = true;
    public final static String DEFAULT_BASE_URL = "http://localhost:8080/juddiv3";
    /* Allowing the the user to override jpa persistence properties in the juddi.properties file */
    public final static String PERSISTENCE_PROVIDER = "persistenceProvider";
    public final static String DATASOURCE = "hibernate.connection.datasource";
    public final static String HBM_DDL_AUTO = "hibernate.hbm2ddl.auto";
    public final static String DEFAULT_SCHEMA = "hibernate.default_schema";
    public final static String HIBERNATE_DIALECT = "hibernate.dialect";
    /**
     * @since 3.2
     */
    public final static String JUDDI_FINE_GRAIN_ACCESS_CONTROL_PROVIDER = "juddi.fineGrainAccessControlProvider";
}
