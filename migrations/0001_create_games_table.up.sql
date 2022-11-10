CREATE TABLE IF NOT EXISTS users (
  "id" uuid PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE IF NOT EXISTS fields (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "address" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE IF NOT EXISTS games (
  "id" uuid PRIMARY KEY,
  "field_id" uuid NOT NULL,
  "start_time" timestamptz NOT NULL DEFAULT (now()),
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE IF NOT EXISTS attendees (
  "id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "game_id" uuid NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE IF NOT EXISTS groups (
  "id" uuid PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE IF NOT EXISTS members (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "group_id" uuid NOT NULL,
  "member_type" varchar NOT NULL DEFAULT 'member',
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE IF NOT EXISTS profile (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "nationality" varchar NOT NULL,
  "age" int NOT NULL,
  "gender" varchar,
  "position" varchar NOT NULL,
  "level" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE IF NOT EXISTS reports (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "game_id" uuid NOT NULL,
  "assists" int NOT NULL,
  "goals" int NOT NULL,
  "attendance" int NOT NULL,
  "man_of_the_match" int NOT NULL,
  "involvement" int NOT NULL,
  "attitude" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);


ALTER TABLE "games" ADD FOREIGN KEY ("field_id") REFERENCES "fields" ("id");

ALTER TABLE "attendees" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "attendees" ADD FOREIGN KEY ("game_id") REFERENCES "games" ("id");

ALTER TABLE "members" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "members" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "profile" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "reports" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "reports" ADD FOREIGN KEY("game_id") REFERENCES "games" ("id")

-- CREATE INDEX ON "users" ("email");
-- CREATE INDEX ON "fields" ("name");
-- CREATE INDEX ON "fields" ("address");
-- CREATE INDEX ON "games" ("field_id");
-- CREATE INDEX ON "attendees" ("game_id");
-- CREATE INDEX ON "reports" ("user_id");
-- CREATE INDEX ON "profile" ("user_id");
-- CREATE INDEX ON "groups" ("name");
-- CREATE INDEX ON "members" ("user_id");
-- CREATE INDEX ON "members" ("group_id");