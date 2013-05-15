
    create table j3_address (
        id int8 not null,
        sort_code varchar(10),
        tmodel_key varchar(255),
        use_type varchar(255),
        address_id int8 not null,
        primary key (id)
    );

    create table j3_address_line (
        id int8 not null,
        key_name varchar(255),
        key_value varchar(255),
        line varchar(80) not null,
        address_id int8 not null,
        primary key (id)
    );

    create table j3_auth_token (
        auth_token varchar(51) not null,
        authorized_name varchar(255) not null,
        created timestamp not null,
        last_used timestamp not null,
        number_of_uses int4 not null,
        token_state int4 not null,
        primary key (auth_token)
    );

    create table j3_binding_category_bag (
        id int8 not null,
        entity_key varchar(255) not null,
        primary key (id),
        unique (entity_key)
    );

    create table j3_binding_descr (
        id int8 not null,
        descr varchar(255) not null,
        lang_code varchar(26),
        entity_key varchar(255) not null,
        primary key (id)
    );

    create table j3_binding_template (
        access_point_type varchar(255),
        access_point_url varchar(4096),
        hosting_redirector varchar(255),
        entity_key varchar(255) not null,
        service_key varchar(255) not null,
        primary key (entity_key)
    );

    create table j3_business_category_bag (
        id int8 not null,
        entity_key varchar(255) not null,
        primary key (id),
        unique (entity_key)
    );

    create table j3_business_descr (
        id int8 not null,
        descr varchar(255) not null,
        lang_code varchar(26),
        entity_key varchar(255) not null,
        primary key (id)
    );

    create table j3_business_entity (
        entity_key varchar(255) not null,
        primary key (entity_key)
    );

    create table j3_business_identifier (
        id int8 not null,
        key_name varchar(255),
        key_value varchar(255) not null,
        tmodel_key_ref varchar(255),
        entity_key varchar(255) not null,
        primary key (id)
    );

    create table j3_business_name (
        id int8 not null,
        lang_code varchar(26),
        name varchar(255) not null,
        entity_key varchar(255) not null,
        primary key (id)
    );

    create table j3_business_service (
        entity_key varchar(255) not null,
        business_key varchar(255) not null,
        primary key (entity_key)
    );

    create table j3_canonicalization_method (
        id int8 not null,
        algorithm varchar(255),
        primary key (id)
    );

    create table j3_category_bag (
        id int8 not null,
        primary key (id)
    );

    create table j3_clerk (
        clerk_name varchar(255) not null,
        cred varchar(255),
        publisher_id varchar(255) not null,
        node_name varchar(255),
        primary key (clerk_name)
    );

    create table j3_client_subscriptioninfo (
        subscription_key varchar(255) not null,
        last_notified timestamp,
        fromClerk_clerk_name varchar(255),
        toClerk_clerk_name varchar(255),
        primary key (subscription_key)
    );

    create table j3_contact (
        id int8 not null,
        use_type varchar(255),
        entity_key varchar(255) not null,
        primary key (id)
    );

    create table j3_contact_descr (
        id int8 not null,
        descr varchar(255) not null,
        lang_code varchar(26),
        contact_id int8 not null,
        primary key (id)
    );

    create table j3_discovery_url (
        id int8 not null,
        url varchar(4096) not null,
        use_type varchar(255) not null,
        entity_key varchar(255) not null,
        primary key (id)
    );

    create table j3_email (
        id int8 not null,
        email_address varchar(4096) not null,
        use_type varchar(255),
        contact_id int8 not null,
        primary key (id)
    );

    create table j3_instance_details_descr (
        id int8 not null,
        descr varchar(255) not null,
        lang_code varchar(26),
        tmodel_instance_info_id int8 not null,
        primary key (id)
    );

    create table j3_instance_details_doc_descr (
        id int8 not null,
        descr varchar(255) not null,
        lang_code varchar(26),
        tmodel_instance_info_id int8 not null,
        primary key (id)
    );

    create table j3_key_data_value (
        id int8 not null,
        key_data_name varchar(255),
        key_data_type varchar(255),
        key_data_value oid,
        key_data_value_string text,
        key_data_value_key int8,
        key_info_key int8,
        primary key (id)
    );

    create table j3_key_info (
        id int8 not null,
        xml_id varchar(255),
        primary key (id)
    );

    create table j3_keyed_reference (
        id int8 not null,
        key_name varchar(255),
        key_value varchar(255) not null,
        tmodel_key_ref varchar(255),
        category_bag_id int8,
        keyed_reference_group_id int8,
        primary key (id)
    );

    create table j3_keyed_reference_group (
        id int8 not null,
        tmodel_key varchar(255),
        category_bag_id int8 not null,
        primary key (id)
    );

    create table j3_node (
        name varchar(255) not null,
        client_name varchar(255) not null,
        custody_transfer_url varchar(255) not null,
        factory_initial varchar(255),
        factory_naming_provider varchar(255),
        factory_url_pkgs varchar(255),
        inquiry_url varchar(255) not null,
        juddi_api_url varchar(255),
        proxy_transport varchar(255) not null,
        publish_url varchar(255) not null,
        security_url varchar(255) not null,
        subscription_url varchar(255) not null,
        primary key (name)
    );

    create table j3_object_type (
        id int8 not null,
        encoding varchar(255),
        mime_type varchar(255),
        xml_id varchar(255),
        signature_key int8 not null,
        primary key (id)
    );

    create table j3_object_type_content (
        id int8 not null,
        content oid,
        object_type_key int8 not null,
        primary key (id)
    );

    create table j3_overview_doc (
        id int8 not null,
        overview_url varchar(255),
        overview_url_use_type varchar(255),
        entity_key varchar(255),
        tomodel_instance_info_id int8,
        primary key (id)
    );

    create table j3_overview_doc_descr (
        id int8 not null,
        descr varchar(1024) not null,
        lang_code varchar(26),
        overview_doc_id int8,
        primary key (id)
    );

    create table j3_person_name (
        id int8 not null,
        lang_code varchar(26),
        name varchar(255) not null,
        contact_id int8 not null,
        primary key (id)
    );

    create table j3_phone (
        id int8 not null,
        phone_number varchar(50) not null,
        use_type varchar(255),
        contact_id int8 not null,
        primary key (id)
    );

    create table j3_publisher (
        authorized_name varchar(255) not null,
        email_address varchar(255),
        is_admin varchar(5),
        is_enabled varchar(5),
        max_bindings_per_service int4,
        max_businesses int4,
        max_services_per_business int4,
        max_tmodels int4,
        publisher_name varchar(255) not null,
        primary key (authorized_name)
    );

    create table j3_publisher_assertion (
        from_key varchar(255) not null,
        to_key varchar(255) not null,
        from_check varchar(5) not null,
        key_name varchar(255) not null,
        key_value varchar(255) not null,
        tmodel_key varchar(255) not null,
        to_check varchar(5) not null,
        primary key (from_key, to_key)
    );

    create table j3_reference (
        id int8 not null,
        digest_method varchar(255),
        digest_value oid,
        type varchar(255),
        uri varchar(255),
        xml_id varchar(255),
        signed_info_key int8 not null,
        primary key (id)
    );

    create table j3_service_category_bag (
        id int8 not null,
        entity_key varchar(255) not null,
        primary key (id),
        unique (entity_key)
    );

    create table j3_service_descr (
        id int8 not null,
        descr varchar(1024) not null,
        lang_code varchar(26),
        entity_key varchar(255) not null,
        primary key (id)
    );

    create table j3_service_name (
        id int8 not null,
        lang_code varchar(26),
        name varchar(255) not null,
        entity_key varchar(255) not null,
        primary key (id)
    );

    create table j3_service_projection (
        business_key varchar(255) not null,
        service_key varchar(255) not null,
        primary key (business_key, service_key)
    );

    create table j3_signature (
        id int8 not null,
        xml_id varchar(255),
        binding_template_key varchar(255),
        business_key varchar(255),
        business_service_key varchar(255),
        key_info int8 not null,
        publisher_key varchar(255),
        signature_value int8 not null,
        signed_info int8 not null,
        tmodel_key varchar(255),
        primary key (id)
    );

    create table j3_signature_method (
        id int8 not null,
        algorithm varchar(255),
        primary key (id)
    );

    create table j3_signature_transform (
        id int8 not null,
        transform varchar(255),
        reference_key int8 not null,
        primary key (id)
    );

    create table j3_signature_transform_data_value (
        id int8 not null,
        content_bytes oid,
        content_type varchar(255),
        signature_transform_key int8 not null,
        primary key (id)
    );

    create table j3_signature_value (
        id int8 not null,
        value_bytes oid,
        xml_id varchar(255),
        primary key (id)
    );

    create table j3_signed_info (
        id int8 not null,
        xml_id varchar(255),
        canonicalization_method int8 not null,
        signature_method int8 not null,
        primary key (id)
    );

    create table j3_subscription (
        subscription_key varchar(255) not null,
        authorized_name varchar(255) not null,
        binding_key varchar(255),
        brief bool,
        create_date timestamp not null,
        expires_after timestamp,
        last_notified timestamp,
        max_entities int4,
        notification_interval varchar(255),
        subscription_filter text not null,
        primary key (subscription_key)
    );

    create table j3_subscription_chunk_token (
        chunk_token varchar(255) not null,
        data int4 not null,
        end_point timestamp,
        expires_after timestamp not null,
        start_point timestamp,
        subscription_key varchar(255) not null,
        primary key (chunk_token)
    );

    create table j3_subscription_match (
        id int8 not null,
        entity_key varchar(255) not null,
        subscription_key varchar(255) not null,
        primary key (id)
    );

    create table j3_temp_key (
        entity_key varchar(255) not null,
        tx_id varchar(255) not null,
        primary key (entity_key, tx_id)
    );

    create table j3_tmodel (
        deleted bool,
        lang_code varchar(26),
        name varchar(255) not null,
        entity_key varchar(255) not null,
        primary key (entity_key)
    );

    create table j3_tmodel_category_bag (
        id int8 not null,
        entity_key varchar(255) not null,
        primary key (id),
        unique (entity_key)
    );

    create table j3_tmodel_descr (
        id int8 not null,
        descr varchar(255) not null,
        lang_code varchar(26),
        entity_key varchar(255) not null,
        primary key (id)
    );

    create table j3_tmodel_identifier (
        id int8 not null,
        key_name varchar(255),
        key_value varchar(255) not null,
        tmodel_key_ref varchar(255),
        entity_key varchar(255) not null,
        primary key (id)
    );

    create table j3_tmodel_instance_info (
        id int8 not null,
        instance_parms varchar(8192),
        tmodel_key varchar(255) not null,
        entity_key varchar(255) not null,
        primary key (id)
    );

    create table j3_tmodel_instance_info_descr (
        id int8 not null,
        descr varchar(255) not null,
        lang_code varchar(26),
        tmodel_instance_info_id int8 not null,
        primary key (id)
    );

    create table j3_transfer_token (
        transfer_token varchar(51) not null,
        expiration_date timestamp not null,
        primary key (transfer_token)
    );

    create table j3_transfer_token_keys (
        id int8 not null,
        entity_key varchar(255),
        transfer_token varchar(51) not null,
        primary key (id)
    );

    create table j3_uddi_entity (
        entity_key varchar(255) not null,
        authorized_name varchar(255) not null,
        created timestamp,
        modified timestamp not null,
        modified_including_children timestamp,
        node_id varchar(255),
        primary key (entity_key)
    );

    alter table j3_address 
        add constraint FKF83236BE75D860FB 
        foreign key (address_id) 
        references j3_contact;

    alter table j3_address_line 
        add constraint FKC665B8D5F8B8D8CF 
        foreign key (address_id) 
        references j3_address;

    alter table j3_binding_category_bag 
        add constraint FKCF34B2376A68D45A 
        foreign key (id) 
        references j3_category_bag;

    alter table j3_binding_category_bag 
        add constraint FKCF34B237CFBD88B7 
        foreign key (entity_key) 
        references j3_binding_template;

    alter table j3_binding_descr 
        add constraint FK5EA60911CFBD88B7 
        foreign key (entity_key) 
        references j3_binding_template;

    alter table j3_binding_template 
        add constraint FKD044BD6A2E448F3F 
        foreign key (service_key) 
        references j3_business_service;

    alter table j3_binding_template 
        add constraint FKD044BD6AD1823CA5 
        foreign key (entity_key) 
        references j3_uddi_entity;

    alter table j3_business_category_bag 
        add constraint FKD6D3ECB06A68D45A 
        foreign key (id) 
        references j3_category_bag;

    alter table j3_business_category_bag 
        add constraint FKD6D3ECB0BEB92A91 
        foreign key (entity_key) 
        references j3_business_entity;

    alter table j3_business_descr 
        add constraint FK3A24B4B8BEB92A91 
        foreign key (entity_key) 
        references j3_business_entity;

    alter table j3_business_entity 
        add constraint FKCA61A0CD1823CA5 
        foreign key (entity_key) 
        references j3_uddi_entity;

    alter table j3_business_identifier 
        add constraint FKB0C7A652BEB92A91 
        foreign key (entity_key) 
        references j3_business_entity;

    alter table j3_business_name 
        add constraint FK43F526F4BEB92A91 
        foreign key (entity_key) 
        references j3_business_entity;

    alter table j3_business_service 
        add constraint FK5D4255ACD1823CA5 
        foreign key (entity_key) 
        references j3_uddi_entity;

    alter table j3_business_service 
        add constraint FK5D4255ACEF04CFEE 
        foreign key (business_key) 
        references j3_business_entity;

    alter table j3_clerk 
        add constraint FK34DC7D9F6BB0F935 
        foreign key (node_name) 
        references j3_node;

    alter table j3_client_subscriptioninfo 
        add constraint FKDF04CC095BFC6733 
        foreign key (fromClerk_clerk_name) 
        references j3_clerk;

    alter table j3_client_subscriptioninfo 
        add constraint FKDF04CC09F3CE9C04 
        foreign key (toClerk_clerk_name) 
        references j3_clerk;

    alter table j3_contact 
        add constraint FK7551BEEABEB92A91 
        foreign key (entity_key) 
        references j3_business_entity;

    alter table j3_contact_descr 
        add constraint FK56CA9E6C2E3FD94F 
        foreign key (contact_id) 
        references j3_contact;

    alter table j3_discovery_url 
        add constraint FKA042FDAABEB92A91 
        foreign key (entity_key) 
        references j3_business_entity;

    alter table j3_email 
        add constraint FK34F910E62E3FD94F 
        foreign key (contact_id) 
        references j3_contact;

    alter table j3_instance_details_descr 
        add constraint FK3CC165902B115C6F 
        foreign key (tmodel_instance_info_id) 
        references j3_tmodel_instance_info;

    alter table j3_instance_details_doc_descr 
        add constraint FK447324492B115C6F 
        foreign key (tmodel_instance_info_id) 
        references j3_tmodel_instance_info;

    alter table j3_key_data_value 
        add constraint FK74B7E072843143EF 
        foreign key (key_data_value_key) 
        references j3_key_data_value;

    alter table j3_key_data_value 
        add constraint FK74B7E07238C90470 
        foreign key (key_info_key) 
        references j3_key_info;

    alter table j3_keyed_reference 
        add constraint FK350C8454E075C8D7 
        foreign key (keyed_reference_group_id) 
        references j3_keyed_reference_group;

    alter table j3_keyed_reference 
        add constraint FK350C84541DB72652 
        foreign key (category_bag_id) 
        references j3_category_bag;

    alter table j3_keyed_reference_group 
        add constraint FKF6224ED41DB72652 
        foreign key (category_bag_id) 
        references j3_category_bag;

    alter table j3_object_type 
        add constraint FK98BBFA04BC6AD65 
        foreign key (signature_key) 
        references j3_signature;

    alter table j3_object_type_content 
        add constraint FK987A913E71FA643E 
        foreign key (object_type_key) 
        references j3_object_type;

    alter table j3_overview_doc 
        add constraint FK5CD8D0E8C5BF8903 
        foreign key (entity_key) 
        references j3_tmodel;

    alter table j3_overview_doc 
        add constraint FK5CD8D0E8E8CE1B36 
        foreign key (tomodel_instance_info_id) 
        references j3_tmodel_instance_info;

    alter table j3_overview_doc_descr 
        add constraint FK36FB9EA9BDC711C 
        foreign key (overview_doc_id) 
        references j3_overview_doc;

    alter table j3_person_name 
        add constraint FKCB7B8AFF2E3FD94F 
        foreign key (contact_id) 
        references j3_contact;

    alter table j3_phone 
        add constraint FK359202B82E3FD94F 
        foreign key (contact_id) 
        references j3_contact;

    alter table j3_publisher_assertion 
        add constraint FK8A102449E3544929 
        foreign key (to_key) 
        references j3_business_entity;

    alter table j3_publisher_assertion 
        add constraint FK8A102449CCEE22D8 
        foreign key (from_key) 
        references j3_business_entity;

    alter table j3_reference 
        add constraint FK493A4F951E480746 
        foreign key (signed_info_key) 
        references j3_signed_info;

    alter table j3_service_category_bag 
        add constraint FK185A68076A68D45A 
        foreign key (id) 
        references j3_category_bag;

    alter table j3_service_category_bag 
        add constraint FK185A680748D0656D 
        foreign key (entity_key) 
        references j3_business_service;

    alter table j3_service_descr 
        add constraint FKB6D63D4148D0656D 
        foreign key (entity_key) 
        references j3_business_service;

    alter table j3_service_name 
        add constraint FKCC1BE94B48D0656D 
        foreign key (entity_key) 
        references j3_business_service;

    alter table j3_service_projection 
        add constraint FK629F290F2E448F3F 
        foreign key (service_key) 
        references j3_business_service;

    alter table j3_service_projection 
        add constraint FK629F290FEF04CFEE 
        foreign key (business_key) 
        references j3_business_entity;

    alter table j3_signature 
        add constraint FKC05CA90256E87DED 
        foreign key (publisher_key) 
        references j3_publisher;

    alter table j3_signature 
        add constraint FKC05CA90271CD8948 
        foreign key (binding_template_key) 
        references j3_binding_template;

    alter table j3_signature 
        add constraint FKC05CA90212F40D40 
        foreign key (business_service_key) 
        references j3_business_service;

    alter table j3_signature 
        add constraint FKC05CA9028ACE9A26 
        foreign key (signed_info) 
        references j3_signed_info;

    alter table j3_signature 
        add constraint FKC05CA9027CE6418E 
        foreign key (signature_value) 
        references j3_signature_value;

    alter table j3_signature 
        add constraint FKC05CA9025793CF55 
        foreign key (tmodel_key) 
        references j3_tmodel;

    alter table j3_signature 
        add constraint FKC05CA902DA6C2DD0 
        foreign key (key_info) 
        references j3_key_info;

    alter table j3_signature 
        add constraint FKC05CA902EF04CFEE 
        foreign key (business_key) 
        references j3_business_entity;

    alter table j3_signature_transform 
        add constraint FK726346F9256790B 
        foreign key (reference_key) 
        references j3_reference;

    alter table j3_signature_transform_data_value 
        add constraint FK3242526C7B88B2A4 
        foreign key (signature_transform_key) 
        references j3_signature_transform;

    alter table j3_signed_info 
        add constraint FKD2E7E5BB877110CC 
        foreign key (canonicalization_method) 
        references j3_canonicalization_method;

    alter table j3_signed_info 
        add constraint FKD2E7E5BB1A25896 
        foreign key (signature_method) 
        references j3_signature_method;

    alter table j3_subscription_match 
        add constraint FK5B9C2F19BEEE42E5 
        foreign key (subscription_key) 
        references j3_subscription;

    alter table j3_tmodel 
        add constraint FK83C8072BD1823CA5 
        foreign key (entity_key) 
        references j3_uddi_entity;

    alter table j3_tmodel_category_bag 
        add constraint FK7E0859DB6A68D45A 
        foreign key (id) 
        references j3_category_bag;

    alter table j3_tmodel_category_bag 
        add constraint FK7E0859DBC5BF8903 
        foreign key (entity_key) 
        references j3_tmodel;

    alter table j3_tmodel_descr 
        add constraint FK63DFF1EDC5BF8903 
        foreign key (entity_key) 
        references j3_tmodel;

    alter table j3_tmodel_identifier 
        add constraint FKD5FB623DC5BF8903 
        foreign key (entity_key) 
        references j3_tmodel;

    alter table j3_tmodel_instance_info 
        add constraint FKDC6C9004CFBD88B7 
        foreign key (entity_key) 
        references j3_binding_template;

    alter table j3_tmodel_instance_info_descr 
        add constraint FKD826B4062B115C6F 
        foreign key (tmodel_instance_info_id) 
        references j3_tmodel_instance_info;

    alter table j3_transfer_token_keys 
        add constraint FK8BBF49185ED9DD48 
        foreign key (transfer_token) 
        references j3_transfer_token;

    create sequence hibernate_sequence;

    create sequence juddi_sequence;
