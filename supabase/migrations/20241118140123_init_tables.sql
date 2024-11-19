create extension if not exists "postgis" with schema "extensions";


create table "public"."profiles" (
    "profiles_id" uuid not null,
    "user_id" uuid,
    "name" character varying(25)
);


alter table "public"."profiles" enable row level security;

create table "public"."reviews" (
    "review_id" uuid not null,
    "user_id" uuid not null,
    "trip_id" uuid not null,
    "rating" integer,
    "comments" text,
    "created_at" timestamp with time zone default CURRENT_TIMESTAMP,
    "updated_at" timestamp with time zone default CURRENT_TIMESTAMP
);


alter table "public"."reviews" enable row level security;

create table "public"."trip_participants" (
    "trip_id" uuid not null,
    "user_id" uuid not null
);


alter table "public"."trip_participants" enable row level security;

create table "public"."trips" (
    "trip_id" uuid not null,
    "user_id" uuid not null,
    "route" geometry(LineString,4326),
    "description" text,
    "existence_kind" character varying(50) default 'created'::character varying,
    "price" double precision,
    "start_date" timestamp with time zone,
    "end_date" timestamp with time zone,
    "created_at" timestamp with time zone default CURRENT_TIMESTAMP,
    "updated_at" timestamp with time zone default CURRENT_TIMESTAMP
);


alter table "public"."trips" enable row level security;

CREATE UNIQUE INDEX profiles_pkey ON public.profiles USING btree (profiles_id);

CREATE UNIQUE INDEX reviews_pkey ON public.reviews USING btree (review_id);

CREATE UNIQUE INDEX trip_participants_pkey ON public.trip_participants USING btree (trip_id, user_id);

CREATE UNIQUE INDEX trips_pkey ON public.trips USING btree (trip_id);

alter table "public"."profiles" add constraint "profiles_pkey" PRIMARY KEY using index "profiles_pkey";

alter table "public"."reviews" add constraint "reviews_pkey" PRIMARY KEY using index "reviews_pkey";

alter table "public"."trip_participants" add constraint "trip_participants_pkey" PRIMARY KEY using index "trip_participants_pkey";

alter table "public"."trips" add constraint "trips_pkey" PRIMARY KEY using index "trips_pkey";

alter table "public"."profiles" add constraint "profiles_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."profiles" validate constraint "profiles_user_id_fkey";

alter table "public"."reviews" add constraint "reviews_rating_check" CHECK (((rating >= 1) AND (rating <= 5))) not valid;

alter table "public"."reviews" validate constraint "reviews_rating_check";

alter table "public"."reviews" add constraint "reviews_trip_id_fkey" FOREIGN KEY (trip_id) REFERENCES trips(trip_id) not valid;

alter table "public"."reviews" validate constraint "reviews_trip_id_fkey";

alter table "public"."reviews" add constraint "reviews_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."reviews" validate constraint "reviews_user_id_fkey";

alter table "public"."trip_participants" add constraint "trip_participants_trip_id_fkey" FOREIGN KEY (trip_id) REFERENCES trips(trip_id) not valid;

alter table "public"."trip_participants" validate constraint "trip_participants_trip_id_fkey";

alter table "public"."trip_participants" add constraint "trip_participants_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."trip_participants" validate constraint "trip_participants_user_id_fkey";

alter table "public"."trips" add constraint "trips_existence_kind_check" CHECK (((existence_kind)::text = ANY ((ARRAY['created'::character varying, 'pending'::character varying, 'ended'::character varying, 'cancelled'::character varying])::text[]))) not valid;

alter table "public"."trips" validate constraint "trips_existence_kind_check";

alter table "public"."trips" add constraint "trips_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."trips" validate constraint "trips_user_id_fkey";

grant delete on table "public"."profiles" to "anon";

grant insert on table "public"."profiles" to "anon";

grant references on table "public"."profiles" to "anon";

grant select on table "public"."profiles" to "anon";

grant trigger on table "public"."profiles" to "anon";

grant truncate on table "public"."profiles" to "anon";

grant update on table "public"."profiles" to "anon";

grant delete on table "public"."profiles" to "authenticated";

grant insert on table "public"."profiles" to "authenticated";

grant references on table "public"."profiles" to "authenticated";

grant select on table "public"."profiles" to "authenticated";

grant trigger on table "public"."profiles" to "authenticated";

grant truncate on table "public"."profiles" to "authenticated";

grant update on table "public"."profiles" to "authenticated";

grant delete on table "public"."profiles" to "service_role";

grant insert on table "public"."profiles" to "service_role";

grant references on table "public"."profiles" to "service_role";

grant select on table "public"."profiles" to "service_role";

grant trigger on table "public"."profiles" to "service_role";

grant truncate on table "public"."profiles" to "service_role";

grant update on table "public"."profiles" to "service_role";

grant delete on table "public"."reviews" to "anon";

grant insert on table "public"."reviews" to "anon";

grant references on table "public"."reviews" to "anon";

grant select on table "public"."reviews" to "anon";

grant trigger on table "public"."reviews" to "anon";

grant truncate on table "public"."reviews" to "anon";

grant update on table "public"."reviews" to "anon";

grant delete on table "public"."reviews" to "authenticated";

grant insert on table "public"."reviews" to "authenticated";

grant references on table "public"."reviews" to "authenticated";

grant select on table "public"."reviews" to "authenticated";

grant trigger on table "public"."reviews" to "authenticated";

grant truncate on table "public"."reviews" to "authenticated";

grant update on table "public"."reviews" to "authenticated";

grant delete on table "public"."reviews" to "service_role";

grant insert on table "public"."reviews" to "service_role";

grant references on table "public"."reviews" to "service_role";

grant select on table "public"."reviews" to "service_role";

grant trigger on table "public"."reviews" to "service_role";

grant truncate on table "public"."reviews" to "service_role";

grant update on table "public"."reviews" to "service_role";

grant delete on table "public"."trip_participants" to "anon";

grant insert on table "public"."trip_participants" to "anon";

grant references on table "public"."trip_participants" to "anon";

grant select on table "public"."trip_participants" to "anon";

grant trigger on table "public"."trip_participants" to "anon";

grant truncate on table "public"."trip_participants" to "anon";

grant update on table "public"."trip_participants" to "anon";

grant delete on table "public"."trip_participants" to "authenticated";

grant insert on table "public"."trip_participants" to "authenticated";

grant references on table "public"."trip_participants" to "authenticated";

grant select on table "public"."trip_participants" to "authenticated";

grant trigger on table "public"."trip_participants" to "authenticated";

grant truncate on table "public"."trip_participants" to "authenticated";

grant update on table "public"."trip_participants" to "authenticated";

grant delete on table "public"."trip_participants" to "service_role";

grant insert on table "public"."trip_participants" to "service_role";

grant references on table "public"."trip_participants" to "service_role";

grant select on table "public"."trip_participants" to "service_role";

grant trigger on table "public"."trip_participants" to "service_role";

grant truncate on table "public"."trip_participants" to "service_role";

grant update on table "public"."trip_participants" to "service_role";

grant delete on table "public"."trips" to "anon";

grant insert on table "public"."trips" to "anon";

grant references on table "public"."trips" to "anon";

grant select on table "public"."trips" to "anon";

grant trigger on table "public"."trips" to "anon";

grant truncate on table "public"."trips" to "anon";

grant update on table "public"."trips" to "anon";

grant delete on table "public"."trips" to "authenticated";

grant insert on table "public"."trips" to "authenticated";

grant references on table "public"."trips" to "authenticated";

grant select on table "public"."trips" to "authenticated";

grant trigger on table "public"."trips" to "authenticated";

grant truncate on table "public"."trips" to "authenticated";

grant update on table "public"."trips" to "authenticated";

grant delete on table "public"."trips" to "service_role";

grant insert on table "public"."trips" to "service_role";

grant references on table "public"."trips" to "service_role";

grant select on table "public"."trips" to "service_role";

grant trigger on table "public"."trips" to "service_role";

grant truncate on table "public"."trips" to "service_role";

grant update on table "public"."trips" to "service_role";

create policy "profiles_rls"
on "public"."profiles"
as permissive
for all
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "reviews_rls"
on "public"."reviews"
as permissive
for all
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "trip_p_rls"
on "public"."trip_participants"
as permissive
for all
to authenticated
using ((trip_id IN ( SELECT trips.trip_id
   FROM trips
  WHERE (trips.user_id = ( SELECT auth.uid() AS uid)))));


create policy "trips_rls"
on "public"."trips"
as permissive
for all
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id));



