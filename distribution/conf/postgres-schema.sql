/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = config_info   */
/******************************************/
create table public.config_info
(
    id           serial
        primary key,
    data_id      varchar(255)                                                            not null,
    group_id     varchar(255) default NULL::character varying,
    content      text                                                                    not null,
    md5          varchar(32)  default NULL::character varying,
    gmt_create   timestamp    default '2010-05-05 00:00:00'::timestamp without time zone not null,
    gmt_modified timestamp    default '2010-05-05 00:00:00'::timestamp without time zone not null,
    src_user     text,
    src_ip       varchar(20)  default NULL::character varying,
    app_name     varchar(128) default NULL::character varying,
    tenant_id    varchar(128) default ''::character varying,
    c_desc       varchar(256) default NULL::character varying,
    c_use        varchar(64)  default NULL::character varying,
    effect       varchar(64)  default NULL::character varying,
    type         varchar(64)  default NULL::character varying,
    c_schema     text,
    encrypted_data_key text NOT NULL,
    constraint uk_configinfo_datagrouptenant
        unique (data_id, group_id, tenant_id)
)
    with (orientation = row, compression = no);

comment on table public.config_info is 'config_info';

comment on column public.config_info.id is 'id';

comment on column public.config_info.content is 'content';

comment on column public.config_info.md5 is 'md5';

comment on column public.config_info.gmt_create is '创建时间';

comment on column public.config_info.gmt_modified is '修改时间';

comment on column public.config_info.src_user is 'source user';

comment on column public.config_info.src_ip is 'source ip';

comment on column public.config_info.tenant_id is '租户字段';

comment on column public.config_info.encrypted_data_key is '秘钥';

alter table public.config_info
    owner to postgres;
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = config_info_aggr   */
/******************************************/
create table public.config_info_aggr
(
    id           serial
        primary key,
    data_id      varchar(255) not null,
    group_id     varchar(255) not null,
    datum_id     varchar(255) not null,
    content      text         not null,
    gmt_modified timestamp    not null,
    app_name     varchar(128) default NULL::character varying,
    tenant_id    varchar(128) default ''::character varying,
    constraint uk_configinfoaggr_datagrouptenantdatum
        unique (data_id, group_id, tenant_id, datum_id)
)
    with (orientation = row, compression = no);

comment on table public.config_info_aggr is '增加租户字段';

comment on column public.config_info_aggr.id is 'id';

comment on column public.config_info_aggr.data_id is 'data_id';

comment on column public.config_info_aggr.group_id is 'group_id';

comment on column public.config_info_aggr.datum_id is 'datum_id';

comment on column public.config_info_aggr.content is '内容';

comment on column public.config_info_aggr.gmt_modified is '修改时间';

comment on column public.config_info_aggr.tenant_id is '租户字段';

alter table public.config_info_aggr
    owner to postgres;
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = config_info_beta   */
/******************************************/
create table public.config_info_beta
(
    id           serial
        primary key,
    data_id      varchar(255)                                                             not null,
    group_id     varchar(128)                                                             not null,
    app_name     varchar(128)  default NULL::character varying,
    content      text                                                                     not null,
    beta_ips     varchar(1024) default NULL::character varying,
    md5          varchar(32)   default NULL::character varying,
    gmt_create   timestamp     default '2010-05-05 00:00:00'::timestamp without time zone not null,
    gmt_modified timestamp     default '2010-05-05 00:00:00'::timestamp without time zone not null,
    src_user     text,
    src_ip       varchar(20)   default NULL::character varying,
    tenant_id    varchar(128)  default ''::character varying,
    encrypted_data_key text NOT NULL,
    constraint uk_configinfobeta_datagrouptenant
        unique (data_id, group_id, tenant_id)
)
    with (orientation = row, compression = no);

comment on table public.config_info_beta is 'config_info_beta';

comment on column public.config_info_beta.id is 'id';

comment on column public.config_info_beta.data_id is 'data_id';

comment on column public.config_info_beta.group_id is 'group_id';

comment on column public.config_info_beta.app_name is 'app_name';

comment on column public.config_info_beta.content is 'content';

comment on column public.config_info_beta.beta_ips is 'betaIps';

comment on column public.config_info_beta.md5 is 'md5';

comment on column public.config_info_beta.gmt_create is '创建时间';

comment on column public.config_info_beta.gmt_modified is '修改时间';

comment on column public.config_info_beta.src_user is 'source user';

comment on column public.config_info_beta.src_ip is 'source ip';

comment on column public.config_info_beta.tenant_id is '租户字段';

comment on column public.config_info_beta.encrypted_data_key is '秘钥';

alter table public.config_info_beta
    owner to postgres;
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = config_info_tag   */
/******************************************/
create table public.config_info_tag
(
    id           serial
        primary key,
    data_id      varchar(255)                                                            not null,
    group_id     varchar(128)                                                            not null,
    tenant_id    varchar(128) default ''::character varying,
    tag_id       varchar(128)                                                            not null,
    app_name     varchar(128) default NULL::character varying,
    content      text                                                                    not null,
    md5          varchar(32)  default NULL::character varying,
    gmt_create   timestamp    default '2010-05-05 00:00:00'::timestamp without time zone not null,
    gmt_modified timestamp    default '2010-05-05 00:00:00'::timestamp without time zone not null,
    src_user     text,
    src_ip       varchar(20)  default NULL::character varying,
    constraint uk_configinfotag_datagrouptenanttag
        unique (data_id, group_id, tenant_id, tag_id)
)
    with (orientation = row, compression = no);

comment on table public.config_info_tag is 'config_info_tag';

comment on column public.config_info_tag.id is 'id';

comment on column public.config_info_tag.data_id is 'data_id';

comment on column public.config_info_tag.group_id is 'group_id';

comment on column public.config_info_tag.tenant_id is '租户字段';

comment on column public.config_info_tag.tag_id is 'tag_id';

comment on column public.config_info_tag.app_name is 'app_name';

comment on column public.config_info_tag.content is 'content';

comment on column public.config_info_tag.md5 is 'md5';

comment on column public.config_info_tag.gmt_create is '创建时间';

comment on column public.config_info_tag.gmt_modified is '修改时间';

comment on column public.config_info_tag.src_user is 'source user';

comment on column public.config_info_tag.src_ip is 'source ip';

alter table public.config_info_tag
    owner to postgres;
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = config_tags_relation   */
/******************************************/
create table public.config_tags_relation
(
    id        bigint       not null,
    tag_name  varchar(128) not null,
    tag_type  varchar(64)  default NULL::character varying,
    data_id   varchar(255) not null,
    group_id  varchar(128) not null,
    tenant_id varchar(128) default ''::character varying,
    nid       serial
        primary key,
    constraint uk_configtagrelation_configidtag
        unique (id, tag_name, tag_type)
)
    with (orientation = row, compression = no);

comment on table public.config_tags_relation is 'config_tag_relation';

comment on column public.config_tags_relation.id is 'id';

comment on column public.config_tags_relation.tag_name is 'tag_name';

comment on column public.config_tags_relation.tag_type is 'tag_type';

comment on column public.config_tags_relation.data_id is 'data_id';

comment on column public.config_tags_relation.group_id is 'group_id';

comment on column public.config_tags_relation.tenant_id is 'tenant_id';

alter table public.config_tags_relation
    owner to postgres;
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = group_capacity   */
/******************************************/
create table public.group_capacity
(
    id                serial
        primary key,
    group_id          varchar(128) default ''::character varying                              not null
        constraint uk_group_id
            unique,
    quota             integer      default 0                                                  not null
        constraint group_capacity_quota_check
            check (quota >= 0),
    usage             integer      default 0                                                  not null
        constraint group_capacity_usage_check
            check (usage >= 0),
    max_size          integer      default 0                                                  not null
        constraint group_capacity_max_size_check
            check (max_size >= 0),
    max_aggr_count    integer      default 0                                                  not null
        constraint group_capacity_max_aggr_count_check
            check (max_aggr_count >= 0),
    max_aggr_size     integer      default 0                                                  not null
        constraint group_capacity_max_aggr_size_check
            check (max_aggr_size >= 0),
    max_history_count integer      default 0                                                  not null
        constraint group_capacity_max_history_count_check
            check (max_history_count >= 0),
    gmt_create        timestamp    default '2010-05-05 00:00:00'::timestamp without time zone not null,
    gmt_modified      timestamp    default '2010-05-05 00:00:00'::timestamp without time zone not null
)
    with (orientation = row, compression = no);

comment on table public.group_capacity is '集群、各Group容量信息表';

comment on column public.group_capacity.id is '主键ID';

comment on column public.group_capacity.group_id is 'Group ID，空字符表示整个集群';

comment on column public.group_capacity.quota is '配额，0表示使用默认值';

comment on column public.group_capacity.usage is '使用量';

comment on column public.group_capacity.max_size is '单个配置大小上限，单位为字节，0表示使用默认值';

comment on column public.group_capacity.max_aggr_count is '聚合子配置最大个数，，0表示使用默认值';

comment on column public.group_capacity.max_aggr_size is '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';

comment on column public.group_capacity.max_history_count is '最大变更历史数量';

comment on column public.group_capacity.gmt_create is '创建时间';

comment on column public.group_capacity.gmt_modified is '修改时间';

alter table public.group_capacity
    owner to postgres;
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = his_config_info   */
/******************************************/
create table public.his_config_info
(
    id           bigint                                                                  not null
        constraint his_config_info_id_check
            check (id >= 0),
    nid          serial
        primary key
        constraint his_config_info_nid_check
            check (nid >= 0),
    data_id      varchar(255)                                                            not null,
    group_id     varchar(128)                                                            not null,
    app_name     varchar(128) default NULL::character varying,
    content      text                                                                    not null,
    md5          varchar(32)  default NULL::character varying,
    gmt_create   timestamp    default '2010-05-05 00:00:00'::timestamp without time zone not null,
    gmt_modified timestamp    default '2010-05-05 00:00:00'::timestamp without time zone not null,
    src_user     text,
    src_ip       varchar(20)  default NULL::character varying,
    op_type      char(10)     default NULL::bpchar,
    tenant_id    varchar(128) default ''::character varying,
    encrypted_data_key text NOT NULL
)
    with (orientation = row, compression = no);

comment on table public.his_config_info is '多租户改造';

comment on column public.his_config_info.app_name is 'app_name';

comment on column public.his_config_info.tenant_id is '租户字段';

comment on column public.his_config_info.encrypted_data_key is '秘钥';

alter table public.his_config_info
    owner to postgres;
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = tenant_capacity   */
/******************************************/
create table public.tenant_capacity
(
    id                serial
        primary key
        constraint tenant_capacity_id_check
            check (id >= 0),
    tenant_id         varchar(128) default ''::character varying                              not null
        constraint uk_tenant_id
            unique,
    quota             integer      default 0                                                  not null
        constraint tenant_capacity_quota_check
            check (quota >= 0),
    usage             integer      default 0                                                  not null
        constraint tenant_capacity_usage_check
            check (usage >= 0),
    max_size          integer      default 0                                                  not null
        constraint tenant_capacity_max_size_check
            check (max_size >= 0),
    max_aggr_count    integer      default 0                                                  not null
        constraint tenant_capacity_max_aggr_count_check
            check (max_aggr_count >= 0),
    max_aggr_size     integer      default 0                                                  not null
        constraint tenant_capacity_max_aggr_size_check
            check (max_aggr_size >= 0),
    max_history_count integer      default 0                                                  not null
        constraint tenant_capacity_max_history_count_check
            check (max_history_count >= 0),
    gmt_create        timestamp    default '2010-05-05 00:00:00'::timestamp without time zone not null,
    gmt_modified      timestamp    default '2010-05-05 00:00:00'::timestamp without time zone not null
)
    with (orientation = row, compression = no);

comment on table public.tenant_capacity is '租户容量信息表';

comment on column public.tenant_capacity.id is '主键ID';

comment on column public.tenant_capacity.tenant_id is 'Tenant ID';

comment on column public.tenant_capacity.quota is '配额，0表示使用默认值';

comment on column public.tenant_capacity.usage is '使用量';

comment on column public.tenant_capacity.max_size is '单个配置大小上限，单位为字节，0表示使用默认值';

comment on column public.tenant_capacity.max_aggr_count is '聚合子配置最大个数';

comment on column public.tenant_capacity.max_aggr_size is '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';

comment on column public.tenant_capacity.max_history_count is '最大变更历史数量';

comment on column public.tenant_capacity.gmt_create is '创建时间';

comment on column public.tenant_capacity.gmt_modified is '修改时间';

alter table public.tenant_capacity
    owner to postgres;

create table public.tenant_info
(
    id            serial
        primary key,
    kp            varchar(128) not null,
    tenant_id     varchar(128) default ''::character varying,
    tenant_name   varchar(128) default ''::character varying,
    tenant_desc   varchar(256) default NULL::character varying,
    create_source varchar(32)  default NULL::character varying,
    gmt_create    bigint       not null,
    gmt_modified  bigint       not null,
    constraint uk_tenant_info_kptenantid
        unique (kp, tenant_id)
)
    with (orientation = row, compression = no);

comment on table public.tenant_info is 'tenant_info';

comment on column public.tenant_info.id is 'id';

comment on column public.tenant_info.kp is 'kp';

comment on column public.tenant_info.tenant_id is 'tenant_id';

comment on column public.tenant_info.tenant_name is 'tenant_name';

comment on column public.tenant_info.tenant_desc is 'tenant_desc';

comment on column public.tenant_info.create_source is 'create_source';

comment on column public.tenant_info.gmt_create is '创建时间';

comment on column public.tenant_info.gmt_modified is '修改时间';

alter table public.tenant_info
    owner to postgres;

create table public.users
(
    username varchar(50)  not null
        primary key,
    password varchar(500) not null,
    enabled  boolean      not null
)
    with (orientation = row, compression = no);

alter table public.users
    owner to postgres;

create table public.roles
(
    username varchar(50) not null,
    role     varchar(50) not null
)
    with (orientation = row, compression = no);

alter table public.roles
    owner to postgres;

create table public.permissions
(
    role     varchar(50) not null,
    resource varchar(255) default ''::character varying,
    action   varchar(8)   default ''::character varying
)
    with (orientation = row, compression = no);

alter table public.permissions
    owner to postgres;

-- 用户名：nacos 密码：nacos
INSERT INTO users (username, password, enabled) VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', TRUE);

INSERT INTO roles (username, role) VALUES ('nacos', 'ROLE_ADMIN');