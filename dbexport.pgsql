--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.5.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_tools_dashboard_preferences; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE admin_tools_dashboard_preferences (
    id integer NOT NULL,
    data text NOT NULL,
    dashboard_id character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE admin_tools_dashboard_preferences OWNER TO sdlr;

--
-- Name: admin_tools_dashboard_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE admin_tools_dashboard_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_tools_dashboard_preferences_id_seq OWNER TO sdlr;

--
-- Name: admin_tools_dashboard_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE admin_tools_dashboard_preferences_id_seq OWNED BY admin_tools_dashboard_preferences.id;


--
-- Name: admin_tools_menu_bookmark; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE admin_tools_menu_bookmark (
    id integer NOT NULL,
    url character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE admin_tools_menu_bookmark OWNER TO sdlr;

--
-- Name: admin_tools_menu_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE admin_tools_menu_bookmark_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_tools_menu_bookmark_id_seq OWNER TO sdlr;

--
-- Name: admin_tools_menu_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE admin_tools_menu_bookmark_id_seq OWNED BY admin_tools_menu_bookmark.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO sdlr;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO sdlr;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO sdlr;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO sdlr;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO sdlr;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO sdlr;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO sdlr;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO sdlr;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO sdlr;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO sdlr;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO sdlr;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO sdlr;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: champschedule_employee; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE champschedule_employee (
    id integer NOT NULL,
    dob date,
    employment_status character varying(20),
    first_name character varying(30),
    last_name character varying(30),
    license_expiration date,
    license_number character varying(30),
    license_state character varying(15),
    group_id integer,
    subgroup_id integer
);


ALTER TABLE champschedule_employee OWNER TO sdlr;

--
-- Name: champschedule_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE champschedule_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE champschedule_employee_id_seq OWNER TO sdlr;

--
-- Name: champschedule_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE champschedule_employee_id_seq OWNED BY champschedule_employee.id;


--
-- Name: champschedule_event; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE champschedule_event (
    id integer NOT NULL,
    title character varying(30)
);


ALTER TABLE champschedule_event OWNER TO sdlr;

--
-- Name: champschedule_event_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE champschedule_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE champschedule_event_id_seq OWNER TO sdlr;

--
-- Name: champschedule_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE champschedule_event_id_seq OWNED BY champschedule_event.id;


--
-- Name: champschedule_eventdetail; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE champschedule_eventdetail (
    id integer NOT NULL,
    "end" timestamp with time zone,
    start timestamp with time zone,
    is_daily_detail boolean DEFAULT false,
    location_id integer,
    employee_id integer,
    event_id integer
);


ALTER TABLE champschedule_eventdetail OWNER TO sdlr;

--
-- Name: champschedule_eventdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE champschedule_eventdetail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE champschedule_eventdetail_id_seq OWNER TO sdlr;

--
-- Name: champschedule_eventdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE champschedule_eventdetail_id_seq OWNED BY champschedule_eventdetail.id;


--
-- Name: champschedule_group; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE champschedule_group (
    id integer NOT NULL,
    group_name character varying(30) NOT NULL
);


ALTER TABLE champschedule_group OWNER TO sdlr;

--
-- Name: champschedule_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE champschedule_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE champschedule_group_id_seq OWNER TO sdlr;

--
-- Name: champschedule_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE champschedule_group_id_seq OWNED BY champschedule_group.id;


--
-- Name: champschedule_location; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE champschedule_location (
    id integer NOT NULL,
    location_name character varying(30) NOT NULL,
    location_color character varying(7) NOT NULL
);


ALTER TABLE champschedule_location OWNER TO sdlr;

--
-- Name: champschedule_location_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE champschedule_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE champschedule_location_id_seq OWNER TO sdlr;

--
-- Name: champschedule_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE champschedule_location_id_seq OWNED BY champschedule_location.id;


--
-- Name: champschedule_perdiemrange; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE champschedule_perdiemrange (
    id integer NOT NULL,
    pd_month character varying(30) NOT NULL,
    pd_start date,
    pd_end date
);


ALTER TABLE champschedule_perdiemrange OWNER TO sdlr;

--
-- Name: champschedule_perdiem; Type: VIEW; Schema: public; Owner: sdlr
--

CREATE VIEW champschedule_perdiem AS
 SELECT champschedule_employee.id AS employee_id,
    champschedule_employee.first_name,
    champschedule_employee.last_name,
    champschedule_employee.group_id,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Jan-Mar'::text) THEN t4.pd_days
            ELSE NULL::bigint
        END) AS days_jantomar,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Jan-Mar'::text) THEN t4.pd_amount
            ELSE NULL::bigint
        END) AS jantomar,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Mar-Apr'::text) THEN t4.pd_days
            ELSE NULL::bigint
        END) AS days_martoapr,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Mar-Apr'::text) THEN t4.pd_amount
            ELSE NULL::bigint
        END) AS martoapr,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Apr-May'::text) THEN t4.pd_days
            ELSE NULL::bigint
        END) AS days_aprtomay,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Apr-May'::text) THEN t4.pd_amount
            ELSE NULL::bigint
        END) AS aprtomay,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'May-Jun'::text) THEN t4.pd_days
            ELSE NULL::bigint
        END) AS days_maytojun,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'May-Jun'::text) THEN t4.pd_amount
            ELSE NULL::bigint
        END) AS maytojun,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Jun-Jul'::text) THEN t4.pd_days
            ELSE NULL::bigint
        END) AS days_juntojul,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Jun-Jul'::text) THEN t4.pd_amount
            ELSE NULL::bigint
        END) AS juntojul,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Jul-Aug'::text) THEN t4.pd_days
            ELSE NULL::bigint
        END) AS days_jultoaug,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Jul-Aug'::text) THEN t4.pd_amount
            ELSE NULL::bigint
        END) AS jultoaug,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Aug-Sep'::text) THEN t4.pd_days
            ELSE NULL::bigint
        END) AS days_augtosep,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Aug-Sep'::text) THEN t4.pd_amount
            ELSE NULL::bigint
        END) AS augtosep,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Sep-Oct'::text) THEN t4.pd_days
            ELSE NULL::bigint
        END) AS days_septooct,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Sep-Oct'::text) THEN t4.pd_amount
            ELSE NULL::bigint
        END) AS septooct,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Oct-Nov'::text) THEN t4.pd_days
            ELSE NULL::bigint
        END) AS days_octtonov,
    avg(
        CASE
            WHEN ((t4.pd_month)::text = 'Oct-Nov'::text) THEN t4.pd_amount
            ELSE NULL::bigint
        END) AS octtonov
   FROM (( SELECT t3.employee_id,
            t3.pd_month,
            t3.pd_days,
            (t3.pd_days * 35) AS pd_amount
           FROM ( SELECT t2.employee_id,
                    t2.pd_month,
                    sum(t2.days) AS pd_days
                   FROM ( SELECT t1.employee_id,
                            t1.start,
                            t1."end",
                            t1.location_id,
                            t1.pd_start,
                            t1.pd_end,
                            t1.pd_month,
                            t1.max_start,
                            t1.min_end,
                                CASE
                                    WHEN ((((t1.min_end)::date - (t1.max_start)::date) + 1) > 0) THEN (((t1.min_end)::date - (t1.max_start)::date) + 1)
                                    ELSE 0
                                END AS days
                           FROM ( SELECT t.employee_id,
                                    t.start,
                                    t."end",
                                    t.location_id,
                                    t.pd_start,
                                    t.pd_end,
                                    t.pd_month,
CASE
 WHEN (t.pd_start > t.start) THEN (t.pd_start)::timestamp with time zone
 ELSE t.start
END AS max_start,
CASE
 WHEN (t.pd_end < t."end") THEN (t.pd_end)::timestamp with time zone
 ELSE t."end"
END AS min_end
                                   FROM ( SELECT champschedule_eventdetail.employee_id,
    champschedule_eventdetail.start,
    champschedule_eventdetail."end",
    champschedule_eventdetail.location_id,
    champschedule_perdiemrange.pd_start,
    champschedule_perdiemrange.pd_end,
    champschedule_perdiemrange.pd_month
   FROM (champschedule_eventdetail
     CROSS JOIN champschedule_perdiemrange)
  WHERE (champschedule_eventdetail.location_id <> ALL (ARRAY[1, 3, 4, 12]))) t) t1) t2
                  GROUP BY t2.employee_id, t2.pd_month) t3) t4
     RIGHT JOIN champschedule_employee ON ((t4.employee_id = champschedule_employee.id)))
  GROUP BY champschedule_employee.id, champschedule_employee.first_name, champschedule_employee.last_name, champschedule_employee.group_id;


ALTER TABLE champschedule_perdiem OWNER TO sdlr;

--
-- Name: champschedule_perdiemrange_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE champschedule_perdiemrange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE champschedule_perdiemrange_id_seq OWNER TO sdlr;

--
-- Name: champschedule_perdiemrange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE champschedule_perdiemrange_id_seq OWNED BY champschedule_perdiemrange.id;


--
-- Name: champschedule_race; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE champschedule_race (
    id integer NOT NULL,
    scheduled_date date,
    location_id integer,
    series_id integer,
    track_id integer
);


ALTER TABLE champschedule_race OWNER TO sdlr;

--
-- Name: champschedule_race_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE champschedule_race_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE champschedule_race_id_seq OWNER TO sdlr;

--
-- Name: champschedule_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE champschedule_race_id_seq OWNED BY champschedule_race.id;


--
-- Name: champschedule_series; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE champschedule_series (
    id integer NOT NULL,
    name character varying(20),
    code character varying(10)
);


ALTER TABLE champschedule_series OWNER TO sdlr;

--
-- Name: champschedule_series_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE champschedule_series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE champschedule_series_id_seq OWNER TO sdlr;

--
-- Name: champschedule_series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE champschedule_series_id_seq OWNED BY champschedule_series.id;


--
-- Name: champschedule_subgroup; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE champschedule_subgroup (
    id integer NOT NULL,
    subgroup_name character varying(30) NOT NULL,
    group_id integer
);


ALTER TABLE champschedule_subgroup OWNER TO sdlr;

--
-- Name: champschedule_subgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE champschedule_subgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE champschedule_subgroup_id_seq OWNER TO sdlr;

--
-- Name: champschedule_subgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE champschedule_subgroup_id_seq OWNED BY champschedule_subgroup.id;


--
-- Name: champschedule_track; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE champschedule_track (
    id integer NOT NULL,
    name character varying(30),
    code character varying(10)
);


ALTER TABLE champschedule_track OWNER TO sdlr;

--
-- Name: champschedule_track_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE champschedule_track_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE champschedule_track_id_seq OWNER TO sdlr;

--
-- Name: champschedule_track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE champschedule_track_id_seq OWNED BY champschedule_track.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO sdlr;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO sdlr;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO sdlr;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO sdlr;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO sdlr;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO sdlr;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO sdlr;

--
-- Name: schedule_calendar; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE schedule_calendar (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL
);


ALTER TABLE schedule_calendar OWNER TO sdlr;

--
-- Name: schedule_calendar_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE schedule_calendar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedule_calendar_id_seq OWNER TO sdlr;

--
-- Name: schedule_calendar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE schedule_calendar_id_seq OWNED BY schedule_calendar.id;


--
-- Name: schedule_calendarrelation; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE schedule_calendarrelation (
    id integer NOT NULL,
    object_id integer NOT NULL,
    distinction character varying(20),
    inheritable boolean NOT NULL,
    calendar_id integer NOT NULL,
    content_type_id integer NOT NULL
);


ALTER TABLE schedule_calendarrelation OWNER TO sdlr;

--
-- Name: schedule_calendarrelation_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE schedule_calendarrelation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedule_calendarrelation_id_seq OWNER TO sdlr;

--
-- Name: schedule_calendarrelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE schedule_calendarrelation_id_seq OWNED BY schedule_calendarrelation.id;


--
-- Name: schedule_event; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE schedule_event (
    id integer NOT NULL,
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    end_recurring_period timestamp with time zone,
    color_event character varying(10),
    calendar_id integer,
    creator_id integer,
    rule_id integer
);


ALTER TABLE schedule_event OWNER TO sdlr;

--
-- Name: schedule_event_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE schedule_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedule_event_id_seq OWNER TO sdlr;

--
-- Name: schedule_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE schedule_event_id_seq OWNED BY schedule_event.id;


--
-- Name: schedule_eventrelation; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE schedule_eventrelation (
    id integer NOT NULL,
    object_id integer NOT NULL,
    distinction character varying(20),
    content_type_id integer NOT NULL,
    event_id integer NOT NULL
);


ALTER TABLE schedule_eventrelation OWNER TO sdlr;

--
-- Name: schedule_eventrelation_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE schedule_eventrelation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedule_eventrelation_id_seq OWNER TO sdlr;

--
-- Name: schedule_eventrelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE schedule_eventrelation_id_seq OWNED BY schedule_eventrelation.id;


--
-- Name: schedule_occurrence; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE schedule_occurrence (
    id integer NOT NULL,
    title character varying(255),
    description text,
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone NOT NULL,
    cancelled boolean NOT NULL,
    original_start timestamp with time zone NOT NULL,
    original_end timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    event_id integer NOT NULL
);


ALTER TABLE schedule_occurrence OWNER TO sdlr;

--
-- Name: schedule_occurrence_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE schedule_occurrence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedule_occurrence_id_seq OWNER TO sdlr;

--
-- Name: schedule_occurrence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE schedule_occurrence_id_seq OWNED BY schedule_occurrence.id;


--
-- Name: schedule_rule; Type: TABLE; Schema: public; Owner: sdlr
--

CREATE TABLE schedule_rule (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    description text NOT NULL,
    frequency character varying(10) NOT NULL,
    params text
);


ALTER TABLE schedule_rule OWNER TO sdlr;

--
-- Name: schedule_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: sdlr
--

CREATE SEQUENCE schedule_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedule_rule_id_seq OWNER TO sdlr;

--
-- Name: schedule_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdlr
--

ALTER SEQUENCE schedule_rule_id_seq OWNED BY schedule_rule.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY admin_tools_dashboard_preferences ALTER COLUMN id SET DEFAULT nextval('admin_tools_dashboard_preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY admin_tools_menu_bookmark ALTER COLUMN id SET DEFAULT nextval('admin_tools_menu_bookmark_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_employee ALTER COLUMN id SET DEFAULT nextval('champschedule_employee_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_event ALTER COLUMN id SET DEFAULT nextval('champschedule_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_eventdetail ALTER COLUMN id SET DEFAULT nextval('champschedule_eventdetail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_group ALTER COLUMN id SET DEFAULT nextval('champschedule_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_location ALTER COLUMN id SET DEFAULT nextval('champschedule_location_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_perdiemrange ALTER COLUMN id SET DEFAULT nextval('champschedule_perdiemrange_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_race ALTER COLUMN id SET DEFAULT nextval('champschedule_race_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_series ALTER COLUMN id SET DEFAULT nextval('champschedule_series_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_subgroup ALTER COLUMN id SET DEFAULT nextval('champschedule_subgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_track ALTER COLUMN id SET DEFAULT nextval('champschedule_track_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_calendar ALTER COLUMN id SET DEFAULT nextval('schedule_calendar_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_calendarrelation ALTER COLUMN id SET DEFAULT nextval('schedule_calendarrelation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_event ALTER COLUMN id SET DEFAULT nextval('schedule_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_eventrelation ALTER COLUMN id SET DEFAULT nextval('schedule_eventrelation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_occurrence ALTER COLUMN id SET DEFAULT nextval('schedule_occurrence_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_rule ALTER COLUMN id SET DEFAULT nextval('schedule_rule_id_seq'::regclass);


--
-- Data for Name: admin_tools_dashboard_preferences; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY admin_tools_dashboard_preferences (id, data, dashboard_id, user_id) FROM stdin;
\.


--
-- Name: admin_tools_dashboard_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('admin_tools_dashboard_preferences_id_seq', 1, false);


--
-- Data for Name: admin_tools_menu_bookmark; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY admin_tools_menu_bookmark (id, url, title, user_id) FROM stdin;
\.


--
-- Name: admin_tools_menu_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('admin_tools_menu_bookmark_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
25	Can add eventdetail	9	add_eventdetail
26	Can change eventdetail	9	change_eventdetail
27	Can delete eventdetail	9	delete_eventdetail
28	Can add employee	10	add_employee
29	Can change employee	10	change_employee
30	Can delete employee	10	delete_employee
61	Can add rule	21	add_rule
62	Can change rule	21	change_rule
63	Can delete rule	21	delete_rule
64	Can add occurrence	22	add_occurrence
65	Can change occurrence	22	change_occurrence
66	Can delete occurrence	22	delete_occurrence
67	Can add calendar relation	23	add_calendarrelation
68	Can change calendar relation	23	change_calendarrelation
69	Can delete calendar relation	23	delete_calendarrelation
70	Can add event	24	add_event
71	Can change event	24	change_event
72	Can delete event	24	delete_event
73	Can add event relation	25	add_eventrelation
74	Can change event relation	25	change_eventrelation
75	Can delete event relation	25	delete_eventrelation
76	Can add calendar	26	add_calendar
77	Can change calendar	26	change_calendar
78	Can delete calendar	26	delete_calendar
79	Can add bookmark	27	add_bookmark
80	Can change bookmark	27	change_bookmark
81	Can delete bookmark	27	delete_bookmark
82	Can add dashboard preferences	28	add_dashboardpreferences
83	Can change dashboard preferences	28	change_dashboardpreferences
84	Can delete dashboard preferences	28	delete_dashboardpreferences
85	Can add location	29	add_location
86	Can change location	29	change_location
87	Can delete location	29	delete_location
88	Can add group	30	add_group
89	Can change group	30	change_group
90	Can delete group	30	delete_group
91	Can add subgroup	31	add_subgroup
92	Can change subgroup	31	change_subgroup
93	Can delete subgroup	31	delete_subgroup
94	Can add event	32	add_event
95	Can change event	32	change_event
96	Can delete event	32	delete_event
97	Can add track	33	add_track
98	Can change track	33	change_track
99	Can delete track	33	delete_track
100	Can add series	34	add_series
101	Can change series	34	change_series
102	Can delete series	34	delete_series
103	Can add race	35	add_race
104	Can change race	35	change_race
105	Can delete race	35	delete_race
106	Can add perdiemrange	36	add_perdiemrange
107	Can change perdiemrange	36	change_perdiemrange
108	Can delete perdiemrange	36	delete_perdiemrange
109	Can add perdiem	37	add_perdiem
110	Can change perdiem	37	change_perdiem
111	Can delete perdiem	37	delete_perdiem
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('auth_permission_id_seq', 111, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$30000$tl1fJFuu0Sm9$XFEAWPlqCJu+/vdqbG9zdOHYO57aarjwdpd/7zzj3jM=	2017-08-09 05:20:25.607915-05	f	testuser				f	t	2017-07-27 20:50:17.503183-05
1	pbkdf2_sha256$30000$YcNSPbxmZFaI$KDJG7TW+ZcMYwpZgyB3Z8JSc3u9sIJbq0dPq45FLdII=	2017-09-05 09:23:54.263005-05	t	webadm			ash@champtire.com	t	t	2017-07-27 16:31:51.815113-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: champschedule_employee; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY champschedule_employee (id, dob, employment_status, first_name, last_name, license_expiration, license_number, license_state, group_id, subgroup_id) FROM stdin;
5	1968-02-01	Full Time	John Steven	Casper	\N	\N		\N	\N
6	1972-10-11	\N	test	test	\N	\N	\N	1	\N
7	1966-11-21	FullTime	Todd Edward	Carpenter	2018-11-21	21351270	NC	\N	\N
17	1980-10-03	FullTime	Barney Cedeno	Bailey	\N	26214716	NC	2	1
18	1980-10-24	FullTime	Kelly Ray	Campbell	\N	26515295	NC	2	1
19	1969-12-28	FullTime	David Andrew	Charest	\N	38392034	NC	2	3
20	1966-01-18	FullTime	Shawn Mahan	Hall	\N	10540808	TX	2	2
21	1962-10-03	FullTime	Wallace 	Hayes 	\N	457139	ME	2	1
22	1971-01-02	FullTime	Stephen Roy	Mistretta	\N	35402184	NC	2	2
23	1983-10-07	FullTime	Nathan Philmore	Eller	\N	29342700	NC	2	3
24	1974-03-08	FullTime	Shawn Michael	Winters	\N	32527918	NC	2	2
25	1961-03-28	FullTime	Dale Lloyd	Butterfield	\N	36194442	NC	2	3
26	1975-02-28	FullTime	Andrew James	Fisher	\N	34374217	NC	1	\N
27	1960-06-21	FullTime	Eric Scot	Randall	\N	2776325	NC	1	\N
28	1981-04-30	FullTime	Mark Daniel	Chafin	\N	20817163	NC	1	\N
29	1968-02-01	FullTime	John Steven	Casper	\N	7632275	NC	1	\N
30	1971-03-09	FullTime	Richard	McBride	\N	7699197	NC	1	\N
31	1970-07-03	FullTime	Walter D II	Sprague	\N	108927313	NY	1	\N
32	1951-11-17	FullTime	Lyle Russell	Wheeler	\N	31262382	NC	1	\N
33	1965-07-21	FullTime	Bruce R	Bates	\N	RP101613	OH	3	\N
34	1967-07-26	FullTime	Tamara J	Bates	\N	RK606024	OH	3	\N
35	1954-09-23	FullTime	Joshua	Rikelman	\N	32185355	NC	3	\N
36	1967-09-25	FullTime	Eugene Lawrence Jr	Griffith	\N	G613212673450	FL	3	\N
37	1975-06-06	FullTime	Gary Wayne	Stockton Jr.	\N	34383766	NC	4	\N
38	1982-10-04	FullTime	Francisco Palafox	Palafox	\N	27459209	NC	4	\N
39	1974-04-17	FullTime	Damien Jake	Banks	\N	B520170741370	FL	4	\N
40	1951-08-03	FullTime	Robin Eugene	Angle	\N	20581647	NC	5	\N
41	1973-12-14	FullTime	Christopher Alan	Beach	\N	31425036	NC	5	\N
42	1976-08-25	FullTime	Eric Lester	Burgoyne	\N	20756380	NC	6	\N
43	1967-09-12	FullTime	Darin Allen	Miller	\N	2677793	NC	6	\N
44	1981-08-16	FullTime	James Lee Jr	Floyd	\N	26133234	NC	6	\N
45	1962-06-18	FullTime	Larry James	Stone	\N	7714914	NC	6	\N
46	1971-07-19	FullTime	Kevin E Sr.	Banks	\N	27354662	NC	6	\N
47	1981-12-27	FullTime	Scotty Lee	VanWagner 	\N	42502265	NC	6	\N
48	1973-06-09	FullTime	Aaron Durand	Sipes	\N	8431618	NC	6	\N
49	1979-10-06	FullTime	Jason Michael	McGuire	\N	24520401	NC	6	\N
50	1964-11-21	FullTime	Todd Michael	Bixby	\N	30323812	NC	7	\N
51	1966-10-01	FullTime	David Alan	Vestal	\N	2809709	NC	7	\N
52	1976-12-04	FullTime	Mark A	Hadley	\N	680889648	NY	7	\N
53	1981-01-21	FullTime	Bryan L	Kleinsasser	\N	934007	SD	7	\N
54	1972-07-25	FullTime	Christopher Michael	Pease	\N	8144510	NC	8	\N
55	1977-07-09	PartTime	Brett Alan	Kubia	\N	39924891	NC	8	\N
56	1974-08-14	PartTime	Jamie Michael	Rolewicz	\N	21820171	NC	\N	\N
57	1966-01-15	FullTime	Kevin Patrick	Mahl	\N	26011950	NC	\N	\N
58	1973-03-27	FullTime	Charles Clare	Hafer	\N	30593849	NC	\N	\N
59	1987-10-01	PartTime	Oscar Zachary	Yzaguirre	\N	33545646	NC	\N	\N
60	1963-08-25	FullTime	Allen Earl	Towne	\N	29670533	NC	\N	\N
61	\N	Inactive	Richard H	Mahl	\N	RS666778	OH	\N	\N
62	\N	Inactive	James	Brown	\N	8150420	NC	\N	\N
63	\N	Inactive	Chris	Estes	\N	36054145	NC	\N	\N
64	\N	Inactive	Robert	Gaston	\N	K01209976	KS	\N	\N
65	\N	Inactive	Jim	Medaglia	\N	59286683	GA	\N	\N
66	\N	Inactive	John	Robinson	\N	889690	NC	\N	\N
67	\N	Inactive	Scott	Berguson	\N	22667843	PA	\N	\N
68	\N	Inactive	Shawn	Burke	\N	RQ967082	OH	\N	\N
69	\N	Inactive	Tim	Janes	\N	751822568	NY	\N	\N
70	\N	Inactive	Travis	Watts	\N	K01759773	KS	\N	\N
71	\N	PartTime	Robert	Malone	\N	781342036	NY	\N	\N
72	\N	Inactive	Terry	Coley	\N	8764627	NC	\N	\N
73	\N	Inactive	Joey	Laney	\N	5316568	NC	\N	\N
74	\N	PartTime	Larry Michael	Rolewicz	\N	28027095	NC	\N	\N
75	\N	Inactive	Pete	Maresca	\N	M620660543280	FL	\N	\N
76	\N	Inactive	Troy	Repard	\N	22344356	PA	\N	\N
\.


--
-- Name: champschedule_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('champschedule_employee_id_seq', 76, true);


--
-- Data for Name: champschedule_event; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY champschedule_event (id, title) FROM stdin;
1	unload tires
2	load wheels
3	dismount tires
\.


--
-- Name: champschedule_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('champschedule_event_id_seq', 3, true);


--
-- Data for Name: champschedule_eventdetail; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY champschedule_eventdetail (id, "end", start, is_daily_detail, location_id, employee_id, event_id) FROM stdin;
162	2017-09-02 03:00:00-05	2017-09-02 03:00:00-05	f	1	28	\N
166	2017-09-09 06:03:15-05	2017-09-07 06:03:15-05	f	6	26	\N
167	2017-09-09 06:03:15-05	2017-09-07 06:03:15-05	f	6	27	\N
169	2017-09-08 06:09:12-05	2017-09-07 06:09:12-05	f	8	26	\N
\.


--
-- Name: champschedule_eventdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('champschedule_eventdetail_id_seq', 169, true);


--
-- Data for Name: champschedule_group; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY champschedule_group (id, group_name) FROM stdin;
1	Air Titan
2	Box Truck
3	Coach
4	Saturday Box
5	TV
6	Wheels
7	Xfinity
8	Manager
\.


--
-- Name: champschedule_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('champschedule_group_id_seq', 8, true);


--
-- Data for Name: champschedule_location; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY champschedule_location (id, location_name, location_color) FROM stdin;
5	Michigan	#3a87ad
6	Bristol	#3a87ad
7	Darlington	#3a87ad
8	Richmond	#3a87ad
9	Chicago	#3a87ad
10	New Hampshire	#3a87ad
12	Charlotte	#3a87ad
1	PTO	#C70039
2	Track-Off	#581845
3	Home-Off	#05480C
4	Shop	#1B0852
\.


--
-- Name: champschedule_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('champschedule_location_id_seq', 12, true);


--
-- Data for Name: champschedule_perdiemrange; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY champschedule_perdiemrange (id, pd_month, pd_start, pd_end) FROM stdin;
1	Jan-Mar	2017-01-01	2017-03-14
2	Mar-Apr	2017-03-15	2017-04-14
3	Apr-May	2017-04-15	2017-05-14
4	May-Jun	2017-05-15	2017-06-14
5	Jun-Jul	2017-06-15	2017-07-14
6	Jul-Aug	2017-07-15	2017-08-14
7	Aug-Sep	2017-08-15	2017-09-14
8	Sep-Oct	2017-09-15	2017-10-14
9	Oct-Nov	2017-10-15	2017-11-30
\.


--
-- Name: champschedule_perdiemrange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('champschedule_perdiemrange_id_seq', 9, true);


--
-- Data for Name: champschedule_race; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY champschedule_race (id, scheduled_date, location_id, series_id, track_id) FROM stdin;
3	2017-09-03	\N	3	\N
10	2017-09-15	\N	3	\N
11	2017-09-23	\N	3	\N
12	2017-09-30	\N	3	\N
1	2017-09-03	7	1	1
2	2017-09-02	7	2	1
4	2017-09-09	8	1	2
5	2017-09-17	9	1	3
6	2017-09-24	10	1	4
7	2017-09-08	8	2	2
8	2017-09-16	9	2	3
9	2017-09-23	10	2	4
\.


--
-- Name: champschedule_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('champschedule_race_id_seq', 12, true);


--
-- Data for Name: champschedule_series; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY champschedule_series (id, name, code) FROM stdin;
1	Monster Energy Cup	MEC
2	Xfinity	NXS
3	Camping World Truck	CTS
\.


--
-- Name: champschedule_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('champschedule_series_id_seq', 3, true);


--
-- Data for Name: champschedule_subgroup; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY champschedule_subgroup (id, subgroup_name, group_id) FROM stdin;
1	Group 1	2
2	Group 2	2
3	Group 3	2
\.


--
-- Name: champschedule_subgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('champschedule_subgroup_id_seq', 3, true);


--
-- Data for Name: champschedule_track; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY champschedule_track (id, name, code) FROM stdin;
1	Darlington Raceway	DARL
2	Richmond International Raceway	RICH
3	Chicagoland Speedway	CHIC
4	New Hampshire Motor Speedway	LOUD
\.


--
-- Name: champschedule_track_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('champschedule_track_id_seq', 4, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-07-27 20:50:17.535235-05	2	testuser	1	[{"added": {}}]	4	1
2	2017-07-27 21:16:34.179636-05	2	Aishwarya	1	[{"added": {}}]	10	1
3	2017-07-27 21:16:43.147987-05	3	ash	1	[{"added": {}}]	10	1
4	2017-07-27 21:17:15.713055-05	1	tire load	1	[{"added": {}}]	9	1
5	2017-07-27 21:17:35.256285-05	2	wheel load	1	[{"added": {}}]	9	1
6	2017-07-28 08:13:25.453748-05	4	test	1	[{"added": {}}]	10	1
7	2017-07-28 11:08:21.50145-05	5	John Steven	1	[{"added": {}}]	10	1
8	2017-07-28 11:19:12.012015-05	1	Air Titan	1	[{"added": {}}]	30	1
9	2017-07-28 11:19:33.403962-05	2	Box Truck	1	[{"added": {}}]	30	1
10	2017-07-28 11:20:01.008901-05	3	Coach	1	[{"added": {}}]	30	1
11	2017-07-28 11:20:49.349976-05	4	Saturday Box	1	[{"added": {}}]	30	1
12	2017-07-28 11:20:52.986739-05	5	TV	1	[{"added": {}}]	30	1
13	2017-07-28 11:21:02.45043-05	6	Wheels	1	[{"added": {}}]	30	1
14	2017-07-28 11:21:12.112076-05	7	Xfinity	1	[{"added": {}}]	30	1
15	2017-07-28 11:21:52.219843-05	1	Group 1	1	[{"added": {}}]	31	1
16	2017-07-28 11:22:04.010643-05	2	Group 2	1	[{"added": {}}]	31	1
17	2017-07-28 11:25:29.668883-05	1	Daytona	1	[{"added": {}}]	29	1
18	2017-07-28 11:25:39.127038-05	2	Talladega	1	[{"added": {}}]	29	1
19	2017-07-28 11:25:46.87254-05	3	Charlotte	1	[{"added": {}}]	29	1
20	2017-07-28 11:25:58.13963-05	4	Homestead	1	[{"added": {}}]	29	1
21	2017-07-28 23:06:45.892261-05	3	test	1	[{"added": {}}]	9	1
22	2017-08-04 06:01:52.420604-05	8	test 4	2	[{"changed": {"fields": ["start", "end"]}}]	9	1
23	2017-08-04 13:57:51.921326-05	9		1	[{"added": {}}]	9	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 23, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
9	champschedule	eventdetail
10	champschedule	employee
21	schedule	rule
22	schedule	occurrence
23	schedule	calendarrelation
24	schedule	event
25	schedule	eventrelation
26	schedule	calendar
27	menu	bookmark
28	dashboard	dashboardpreferences
29	champschedule	location
30	champschedule	group
31	champschedule	subgroup
32	champschedule	event
33	champschedule	track
34	champschedule	series
35	champschedule	race
36	champschedule	perdiemrange
37	champschedule	perdiem
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('django_content_type_id_seq', 37, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-07-27 16:22:28.890966-05
2	auth	0001_initial	2017-07-27 16:22:28.954093-05
3	admin	0001_initial	2017-07-27 16:22:28.976962-05
4	admin	0002_logentry_remove_auto_add	2017-07-27 16:22:28.990465-05
5	contenttypes	0002_remove_content_type_name	2017-07-27 16:22:29.019911-05
6	auth	0002_alter_permission_name_max_length	2017-07-27 16:22:29.030745-05
7	auth	0003_alter_user_email_max_length	2017-07-27 16:22:29.04522-05
8	auth	0004_alter_user_username_opts	2017-07-27 16:22:29.057788-05
9	auth	0005_alter_user_last_login_null	2017-07-27 16:22:29.068808-05
10	auth	0006_require_contenttypes_0002	2017-07-27 16:22:29.070531-05
11	auth	0007_alter_validators_add_error_messages	2017-07-27 16:22:29.080178-05
12	auth	0008_alter_user_username_max_length	2017-07-27 16:22:29.093266-05
13	champschedule	0001_initial	2017-07-27 16:22:29.279703-05
14	dashboard	0001_initial	2017-07-27 16:22:29.311385-05
15	menu	0001_initial	2017-07-27 16:22:29.341201-05
16	schedule	0001_initial	2017-07-27 16:22:29.529702-05
17	sessions	0001_initial	2017-07-27 16:22:29.541059-05
18	champschedule	0002_auto_20170728_1539	2017-07-28 10:40:11.483664-05
19	champschedule	0003_auto_20170801_1528	2017-08-01 10:28:47.442002-05
20	champschedule	0004_auto_20170803_1515	2017-08-03 10:15:54.3681-05
21	champschedule	0005_employee_location	2017-08-03 16:19:12.701809-05
22	champschedule	0006_remove_csevent_all_day	2017-08-04 13:16:47.86265-05
23	champschedule	0007_auto_20170810_1304	2017-08-10 08:04:36.866308-05
24	champschedule	0008_auto_20170815_1609	2017-08-15 11:09:57.48875-05
25	champschedule	0009_auto_20170815_1632	2017-08-15 11:32:43.779265-05
26	champschedule	0010_auto_20170822_1523	2017-08-22 11:22:21.112888-05
27	champschedule	0011_series_code	2017-08-22 11:24:14.041923-05
28	champschedule	0012_perdiemrange	2017-08-25 15:05:23.60455-05
29	champschedule	0013_auto_20170830_1055	2017-08-30 05:55:23.246171-05
30	champschedule	0014_auto_20170906_2258	2017-09-06 17:58:34.976316-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('django_migrations_id_seq', 30, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
amkq9d8wvwpf9zzd39db4wvj8awd6xlq	OWEwMzA0OGNlYTdkZjUzNThiYTFlZDY3Mzg4OWI2YzhiNDEzNGI0MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiIwZTkxNzc4MDdhOTIyMmUzMzU2NGQ3OTJkMjE3YjZhODFjMDNjMzlkIn0=	2017-08-11 09:48:28.043412-05
ciiwf3cwaj99wqzuv1v89t7vuf6k22gk	Mjc2ZDU1NWNmYjJlODUzMTdkOTRlYjlkMTI2MmM1MWU2YmNmYTQwYTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2NjNlNmY1YzE4NmIzYWM3N2Y4ZWE2NTM2N2NlN2NmMTc4YzhmNTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-08-15 15:33:07.680068-05
ri12ow273vfop9pqey3ld7x8xqsp3s0d	Mjc2ZDU1NWNmYjJlODUzMTdkOTRlYjlkMTI2MmM1MWU2YmNmYTQwYTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2NjNlNmY1YzE4NmIzYWM3N2Y4ZWE2NTM2N2NlN2NmMTc4YzhmNTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-08-16 08:07:35.772445-05
mi2rm9n7mc5n9j07skgwpgh38spsurcl	ZjdlYWJmYjFjMjk3ZWE2OTgyN2Y5MWE2YzVkNTk3NDk5YTAxMGQxNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI5NjYzZTZmNWMxODZiM2FjNzdmOGVhNjUzNjdjZTdjZjE3OGM4ZjU4In0=	2017-08-21 06:26:14.682822-05
2a1dkcti4pfxith8msboc0yctwlb5b0m	ZTUxM2JmNzY0ZGNkNWMzMTg5OWI4ZjkxNGMwOWUyNTMzZTRiNjJhYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlOTE3NzgwN2E5MjIyZTMzNTY0ZDc5MmQyMTdiNmE4MWMwM2MzOWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2017-08-23 04:57:47.492812-05
kttbfwaxtcdncvek3kgeikeaiq8tr5yh	ZTUxM2JmNzY0ZGNkNWMzMTg5OWI4ZjkxNGMwOWUyNTMzZTRiNjJhYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlOTE3NzgwN2E5MjIyZTMzNTY0ZDc5MmQyMTdiNmE4MWMwM2MzOWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2017-08-23 05:20:25.61118-05
i0ss6qe2wn43b2mm57pgqx72664fmxpd	YWZjYjhiYzY0MWQ3OWNmYWQ5YTRhNDc4YjFhNDRhNzk5N2YyM2RhYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2NjNlNmY1YzE4NmIzYWM3N2Y4ZWE2NTM2N2NlN2NmMTc4YzhmNTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-08 08:09:59.117956-05
d6sl5f2lz54md24rvqcprp1p4d1b8ldz	N2UyMjIyMjkyN2Y3ZTlmODNiNDYzM2U5MmU2ZTVmZDMyNDg5YjJiNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTY2M2U2ZjVjMTg2YjNhYzc3ZjhlYTY1MzY3Y2U3Y2YxNzhjOGY1OCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-11 19:36:53.826071-05
yej8t82redx8gxp1kjer6vp3yor8tv7r	OTNmNGE1NTkzZjU0ZmI3MTM2MGJiYTljNzRlMWJkNjYyYWIzN2FlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTY2M2U2ZjVjMTg2YjNhYzc3ZjhlYTY1MzY3Y2U3Y2YxNzhjOGY1OCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-09-19 09:23:54.265603-05
\.


--
-- Data for Name: schedule_calendar; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY schedule_calendar (id, name, slug) FROM stdin;
\.


--
-- Name: schedule_calendar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('schedule_calendar_id_seq', 1, false);


--
-- Data for Name: schedule_calendarrelation; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY schedule_calendarrelation (id, object_id, distinction, inheritable, calendar_id, content_type_id) FROM stdin;
\.


--
-- Name: schedule_calendarrelation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('schedule_calendarrelation_id_seq', 1, false);


--
-- Data for Name: schedule_event; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY schedule_event (id, start, "end", title, description, created_on, updated_on, end_recurring_period, color_event, calendar_id, creator_id, rule_id) FROM stdin;
\.


--
-- Name: schedule_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('schedule_event_id_seq', 1, false);


--
-- Data for Name: schedule_eventrelation; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY schedule_eventrelation (id, object_id, distinction, content_type_id, event_id) FROM stdin;
\.


--
-- Name: schedule_eventrelation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('schedule_eventrelation_id_seq', 1, false);


--
-- Data for Name: schedule_occurrence; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY schedule_occurrence (id, title, description, start, "end", cancelled, original_start, original_end, created_on, updated_on, event_id) FROM stdin;
\.


--
-- Name: schedule_occurrence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('schedule_occurrence_id_seq', 1, false);


--
-- Data for Name: schedule_rule; Type: TABLE DATA; Schema: public; Owner: sdlr
--

COPY schedule_rule (id, name, description, frequency, params) FROM stdin;
\.


--
-- Name: schedule_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdlr
--

SELECT pg_catalog.setval('schedule_rule_id_seq', 1, false);


--
-- Name: admin_tools_dashboard_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY admin_tools_dashboard_preferences
    ADD CONSTRAINT admin_tools_dashboard_preferences_pkey PRIMARY KEY (id);


--
-- Name: admin_tools_dashboard_preferences_user_id_74da8e56_uniq; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY admin_tools_dashboard_preferences
    ADD CONSTRAINT admin_tools_dashboard_preferences_user_id_74da8e56_uniq UNIQUE (user_id, dashboard_id);


--
-- Name: admin_tools_menu_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY admin_tools_menu_bookmark
    ADD CONSTRAINT admin_tools_menu_bookmark_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: champschedule_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_employee
    ADD CONSTRAINT champschedule_employee_pkey PRIMARY KEY (id);


--
-- Name: champschedule_event_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_event
    ADD CONSTRAINT champschedule_event_pkey PRIMARY KEY (id);


--
-- Name: champschedule_eventdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_eventdetail
    ADD CONSTRAINT champschedule_eventdetail_pkey PRIMARY KEY (id);


--
-- Name: champschedule_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_group
    ADD CONSTRAINT champschedule_group_pkey PRIMARY KEY (id);


--
-- Name: champschedule_location_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_location
    ADD CONSTRAINT champschedule_location_pkey PRIMARY KEY (id);


--
-- Name: champschedule_perdiemrange_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_perdiemrange
    ADD CONSTRAINT champschedule_perdiemrange_pkey PRIMARY KEY (id);


--
-- Name: champschedule_race_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_race
    ADD CONSTRAINT champschedule_race_pkey PRIMARY KEY (id);


--
-- Name: champschedule_series_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_series
    ADD CONSTRAINT champschedule_series_pkey PRIMARY KEY (id);


--
-- Name: champschedule_subgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_subgroup
    ADD CONSTRAINT champschedule_subgroup_pkey PRIMARY KEY (id);


--
-- Name: champschedule_track_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_track
    ADD CONSTRAINT champschedule_track_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: schedule_calendar_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_calendar
    ADD CONSTRAINT schedule_calendar_pkey PRIMARY KEY (id);


--
-- Name: schedule_calendarrelation_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_calendarrelation
    ADD CONSTRAINT schedule_calendarrelation_pkey PRIMARY KEY (id);


--
-- Name: schedule_event_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_event
    ADD CONSTRAINT schedule_event_pkey PRIMARY KEY (id);


--
-- Name: schedule_eventrelation_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_eventrelation
    ADD CONSTRAINT schedule_eventrelation_pkey PRIMARY KEY (id);


--
-- Name: schedule_occurrence_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_occurrence
    ADD CONSTRAINT schedule_occurrence_pkey PRIMARY KEY (id);


--
-- Name: schedule_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_rule
    ADD CONSTRAINT schedule_rule_pkey PRIMARY KEY (id);


--
-- Name: admin_tools_dashboard_preferences_e8701ad4; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX admin_tools_dashboard_preferences_e8701ad4 ON admin_tools_dashboard_preferences USING btree (user_id);


--
-- Name: admin_tools_menu_bookmark_e8701ad4; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX admin_tools_menu_bookmark_e8701ad4 ON admin_tools_menu_bookmark USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: champschedule_employee_0e939a4f; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX champschedule_employee_0e939a4f ON champschedule_employee USING btree (group_id);


--
-- Name: champschedule_employee_cd51192c; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX champschedule_employee_cd51192c ON champschedule_employee USING btree (subgroup_id);


--
-- Name: champschedule_eventdetail_4437cfac; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX champschedule_eventdetail_4437cfac ON champschedule_eventdetail USING btree (event_id);


--
-- Name: champschedule_eventdetail_dcc97e32; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX champschedule_eventdetail_dcc97e32 ON champschedule_eventdetail USING btree (employee_id);


--
-- Name: champschedule_eventdetail_e274a5da; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX champschedule_eventdetail_e274a5da ON champschedule_eventdetail USING btree (location_id);


--
-- Name: champschedule_race_2edb7cf7; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX champschedule_race_2edb7cf7 ON champschedule_race USING btree (track_id);


--
-- Name: champschedule_race_a08cee2d; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX champschedule_race_a08cee2d ON champschedule_race USING btree (series_id);


--
-- Name: champschedule_race_e274a5da; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX champschedule_race_e274a5da ON champschedule_race USING btree (location_id);


--
-- Name: champschedule_subgroup_0e939a4f; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX champschedule_subgroup_0e939a4f ON champschedule_subgroup USING btree (group_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: schedule_calendar_2dbcba41; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_calendar_2dbcba41 ON schedule_calendar USING btree (slug);


--
-- Name: schedule_calendar_slug_ba17e861_like; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_calendar_slug_ba17e861_like ON schedule_calendar USING btree (slug varchar_pattern_ops);


--
-- Name: schedule_calendarrelation_417f1b1c; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_calendarrelation_417f1b1c ON schedule_calendarrelation USING btree (content_type_id);


--
-- Name: schedule_calendarrelation_df2e10dc; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_calendarrelation_df2e10dc ON schedule_calendarrelation USING btree (calendar_id);


--
-- Name: schedule_event_3700153c; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_event_3700153c ON schedule_event USING btree (creator_id);


--
-- Name: schedule_event_7f021a14; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_event_7f021a14 ON schedule_event USING btree ("end");


--
-- Name: schedule_event_94196829; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_event_94196829 ON schedule_event USING btree (end_recurring_period);


--
-- Name: schedule_event_df2e10dc; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_event_df2e10dc ON schedule_event USING btree (calendar_id);


--
-- Name: schedule_event_e1150e65; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_event_e1150e65 ON schedule_event USING btree (rule_id);


--
-- Name: schedule_event_ea2b2676; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_event_ea2b2676 ON schedule_event USING btree (start);


--
-- Name: schedule_event_start_89f30672_idx; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_event_start_89f30672_idx ON schedule_event USING btree (start, "end");


--
-- Name: schedule_eventrelation_417f1b1c; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_eventrelation_417f1b1c ON schedule_eventrelation USING btree (content_type_id);


--
-- Name: schedule_eventrelation_4437cfac; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_eventrelation_4437cfac ON schedule_eventrelation USING btree (event_id);


--
-- Name: schedule_occurrence_4437cfac; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_occurrence_4437cfac ON schedule_occurrence USING btree (event_id);


--
-- Name: schedule_occurrence_7f021a14; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_occurrence_7f021a14 ON schedule_occurrence USING btree ("end");


--
-- Name: schedule_occurrence_ea2b2676; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_occurrence_ea2b2676 ON schedule_occurrence USING btree (start);


--
-- Name: schedule_occurrence_start_5fc98870_idx; Type: INDEX; Schema: public; Owner: sdlr
--

CREATE INDEX schedule_occurrence_start_5fc98870_idx ON schedule_occurrence USING btree (start, "end");


--
-- Name: admin_tools_dashboard_preferen_user_id_8f768e6c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY admin_tools_dashboard_preferences
    ADD CONSTRAINT admin_tools_dashboard_preferen_user_id_8f768e6c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_tools_menu_bookmark_user_id_0382e410_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY admin_tools_menu_bookmark
    ADD CONSTRAINT admin_tools_menu_bookmark_user_id_0382e410_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: champschedule_emplo_group_id_61e49531_fk_champschedule_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_employee
    ADD CONSTRAINT champschedule_emplo_group_id_61e49531_fk_champschedule_group_id FOREIGN KEY (group_id) REFERENCES champschedule_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: champschedule_employee_id_c6f779d3_fk_champschedule_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_eventdetail
    ADD CONSTRAINT champschedule_employee_id_c6f779d3_fk_champschedule_employee_id FOREIGN KEY (employee_id) REFERENCES champschedule_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: champschedule_event_event_id_4fc8fbee_fk_champschedule_event_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_eventdetail
    ADD CONSTRAINT champschedule_event_event_id_4fc8fbee_fk_champschedule_event_id FOREIGN KEY (event_id) REFERENCES champschedule_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: champschedule_location_id_83877bfb_fk_champschedule_location_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_eventdetail
    ADD CONSTRAINT champschedule_location_id_83877bfb_fk_champschedule_location_id FOREIGN KEY (location_id) REFERENCES champschedule_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: champschedule_location_id_b2b7ccdd_fk_champschedule_location_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_race
    ADD CONSTRAINT champschedule_location_id_b2b7ccdd_fk_champschedule_location_id FOREIGN KEY (location_id) REFERENCES champschedule_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: champschedule_rac_series_id_eb6fd5a0_fk_champschedule_series_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_race
    ADD CONSTRAINT champschedule_rac_series_id_eb6fd5a0_fk_champschedule_series_id FOREIGN KEY (series_id) REFERENCES champschedule_series(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: champschedule_race_track_id_a4147155_fk_champschedule_track_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_race
    ADD CONSTRAINT champschedule_race_track_id_a4147155_fk_champschedule_track_id FOREIGN KEY (track_id) REFERENCES champschedule_track(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: champschedule_subgr_group_id_737d32f6_fk_champschedule_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_subgroup
    ADD CONSTRAINT champschedule_subgr_group_id_737d32f6_fk_champschedule_group_id FOREIGN KEY (group_id) REFERENCES champschedule_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: champschedule_subgroup_id_52a649f7_fk_champschedule_subgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY champschedule_employee
    ADD CONSTRAINT champschedule_subgroup_id_52a649f7_fk_champschedule_subgroup_id FOREIGN KEY (subgroup_id) REFERENCES champschedule_subgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schedule_cal_content_type_id_f2a42f5b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_calendarrelation
    ADD CONSTRAINT schedule_cal_content_type_id_f2a42f5b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schedule_calendarr_calendar_id_0a50be2e_fk_schedule_calendar_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_calendarrelation
    ADD CONSTRAINT schedule_calendarr_calendar_id_0a50be2e_fk_schedule_calendar_id FOREIGN KEY (calendar_id) REFERENCES schedule_calendar(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schedule_eve_content_type_id_d4187723_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_eventrelation
    ADD CONSTRAINT schedule_eve_content_type_id_d4187723_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schedule_event_calendar_id_eb1c700f_fk_schedule_calendar_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_event
    ADD CONSTRAINT schedule_event_calendar_id_eb1c700f_fk_schedule_calendar_id FOREIGN KEY (calendar_id) REFERENCES schedule_calendar(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schedule_event_creator_id_d2ffab6e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_event
    ADD CONSTRAINT schedule_event_creator_id_d2ffab6e_fk_auth_user_id FOREIGN KEY (creator_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schedule_event_rule_id_90b83d31_fk_schedule_rule_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_event
    ADD CONSTRAINT schedule_event_rule_id_90b83d31_fk_schedule_rule_id FOREIGN KEY (rule_id) REFERENCES schedule_rule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schedule_eventrelation_event_id_8c57a7b4_fk_schedule_event_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_eventrelation
    ADD CONSTRAINT schedule_eventrelation_event_id_8c57a7b4_fk_schedule_event_id FOREIGN KEY (event_id) REFERENCES schedule_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schedule_occurrence_event_id_ade47cd8_fk_schedule_event_id; Type: FK CONSTRAINT; Schema: public; Owner: sdlr
--

ALTER TABLE ONLY schedule_occurrence
    ADD CONSTRAINT schedule_occurrence_event_id_ade47cd8_fk_schedule_event_id FOREIGN KEY (event_id) REFERENCES schedule_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

