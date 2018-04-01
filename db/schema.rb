# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180401120912) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street1",          limit: 255
    t.string   "street2",          limit: 255
    t.string   "city",             limit: 255
    t.string   "region",           limit: 255
    t.string   "postcode",         limit: 255
    t.string   "country_code",     limit: 2
    t.text     "full_address",     limit: 65535
    t.string   "address_type",     limit: 16
    t.integer  "addressable_id",   limit: 4
    t.string   "addressable_type", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "addresses", ["address_type"], name: "index_addresses_on_address_type", using: :btree
  add_index "addresses", ["addressable_id", "addressable_type"], name: "index_addresses_on_addressable_id_and_addressable_type", using: :btree

  create_table "agile_colors", force: :cascade do |t|
    t.integer "container_id",   limit: 4
    t.string  "container_type", limit: 255
    t.string  "color",          limit: 255
  end

  add_index "agile_colors", ["container_id"], name: "index_agile_colors_on_container_id", using: :btree
  add_index "agile_colors", ["container_type"], name: "index_agile_colors_on_container_type", using: :btree

  create_table "agile_data", force: :cascade do |t|
    t.integer "issue_id",     limit: 4
    t.integer "position",     limit: 4
    t.integer "story_points", limit: 4
  end

  add_index "agile_data", ["issue_id"], name: "index_agile_data_on_issue_id", using: :btree
  add_index "agile_data", ["position"], name: "index_agile_data_on_position", using: :btree

  create_table "attachments", force: :cascade do |t|
    t.integer  "container_id",   limit: 4
    t.string   "container_type", limit: 30
    t.string   "filename",       limit: 255, default: "", null: false
    t.string   "disk_filename",  limit: 255, default: "", null: false
    t.integer  "filesize",       limit: 8,   default: 0,  null: false
    t.string   "content_type",   limit: 255, default: ""
    t.string   "digest",         limit: 40,  default: "", null: false
    t.integer  "downloads",      limit: 4,   default: 0,  null: false
    t.integer  "author_id",      limit: 4,   default: 0,  null: false
    t.datetime "created_on"
    t.string   "description",    limit: 255
    t.string   "disk_directory", limit: 255
  end

  add_index "attachments", ["author_id"], name: "index_attachments_on_author_id", using: :btree
  add_index "attachments", ["container_id", "container_type"], name: "index_attachments_on_container_id_and_container_type", using: :btree
  add_index "attachments", ["created_on"], name: "index_attachments_on_created_on", using: :btree

  create_table "auth_sources", force: :cascade do |t|
    t.string  "type",              limit: 30,    default: "",    null: false
    t.string  "name",              limit: 60,    default: "",    null: false
    t.string  "host",              limit: 60
    t.integer "port",              limit: 4
    t.string  "account",           limit: 255
    t.string  "account_password",  limit: 255,   default: ""
    t.string  "base_dn",           limit: 255
    t.string  "attr_login",        limit: 30
    t.string  "attr_firstname",    limit: 30
    t.string  "attr_lastname",     limit: 30
    t.string  "attr_mail",         limit: 30
    t.boolean "onthefly_register",               default: false, null: false
    t.boolean "tls",                             default: false, null: false
    t.text    "filter",            limit: 65535
    t.integer "timeout",           limit: 4
  end

  add_index "auth_sources", ["id", "type"], name: "index_auth_sources_on_id_and_type", using: :btree

  create_table "boards", force: :cascade do |t|
    t.integer "project_id",      limit: 4,                null: false
    t.string  "name",            limit: 255, default: "", null: false
    t.string  "description",     limit: 255
    t.integer "position",        limit: 4,   default: 1
    t.integer "topics_count",    limit: 4,   default: 0,  null: false
    t.integer "messages_count",  limit: 4,   default: 0,  null: false
    t.integer "last_message_id", limit: 4
    t.integer "parent_id",       limit: 4
  end

  add_index "boards", ["last_message_id"], name: "index_boards_on_last_message_id", using: :btree
  add_index "boards", ["project_id"], name: "boards_project_id", using: :btree

  create_table "changes", force: :cascade do |t|
    t.integer "changeset_id",  limit: 4,                  null: false
    t.string  "action",        limit: 1,     default: "", null: false
    t.text    "path",          limit: 65535,              null: false
    t.text    "from_path",     limit: 65535
    t.string  "from_revision", limit: 255
    t.string  "revision",      limit: 255
    t.string  "branch",        limit: 255
  end

  add_index "changes", ["changeset_id"], name: "changesets_changeset_id", using: :btree

  create_table "changeset_parents", id: false, force: :cascade do |t|
    t.integer "changeset_id", limit: 4, null: false
    t.integer "parent_id",    limit: 4, null: false
  end

  add_index "changeset_parents", ["changeset_id"], name: "changeset_parents_changeset_ids", using: :btree
  add_index "changeset_parents", ["parent_id"], name: "changeset_parents_parent_ids", using: :btree

  create_table "changesets", force: :cascade do |t|
    t.integer  "repository_id", limit: 4,          null: false
    t.string   "revision",      limit: 255,        null: false
    t.string   "committer",     limit: 255
    t.datetime "committed_on",                     null: false
    t.text     "comments",      limit: 4294967295
    t.date     "commit_date"
    t.string   "scmid",         limit: 255
    t.integer  "user_id",       limit: 4
  end

  add_index "changesets", ["committed_on"], name: "index_changesets_on_committed_on", using: :btree
  add_index "changesets", ["repository_id", "revision"], name: "changesets_repos_rev", unique: true, using: :btree
  add_index "changesets", ["repository_id", "scmid"], name: "changesets_repos_scmid", using: :btree
  add_index "changesets", ["repository_id"], name: "index_changesets_on_repository_id", using: :btree
  add_index "changesets", ["user_id"], name: "index_changesets_on_user_id", using: :btree

  create_table "changesets_issues", id: false, force: :cascade do |t|
    t.integer "changeset_id", limit: 4, null: false
    t.integer "issue_id",     limit: 4, null: false
  end

  add_index "changesets_issues", ["changeset_id", "issue_id"], name: "changesets_issues_ids", unique: true, using: :btree

  create_table "checklist_template_categories", force: :cascade do |t|
    t.string  "name",     limit: 255
    t.integer "position", limit: 4,   default: 1
  end

  create_table "checklist_templates", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "project_id",     limit: 4
    t.integer "category_id",    limit: 4
    t.integer "user_id",        limit: 4
    t.boolean "is_public"
    t.text    "template_items", limit: 65535
    t.boolean "is_default",                   default: false
    t.integer "tracker_id",     limit: 4
  end

  add_index "checklist_templates", ["tracker_id"], name: "index_checklist_templates_on_tracker_id", using: :btree

  create_table "checklists", force: :cascade do |t|
    t.boolean  "is_done",                default: false
    t.string   "subject",    limit: 512
    t.integer  "position",   limit: 4,   default: 1
    t.integer  "issue_id",   limit: 4,                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commented_type", limit: 30,    default: "", null: false
    t.integer  "commented_id",   limit: 4,     default: 0,  null: false
    t.integer  "author_id",      limit: 4,     default: 0,  null: false
    t.text     "comments",       limit: 65535
    t.datetime "created_on",                                null: false
    t.datetime "updated_on",                                null: false
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id", using: :btree
  add_index "comments", ["commented_id", "commented_type"], name: "index_comments_on_commented_id_and_commented_type", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "middle_name",     limit: 255
    t.string   "company",         limit: 255
    t.string   "phone",           limit: 255
    t.string   "email",           limit: 255
    t.string   "website",         limit: 255
    t.string   "skype_name",      limit: 255
    t.date     "birthday"
    t.string   "avatar",          limit: 255
    t.text     "background",      limit: 65535
    t.string   "job_title",       limit: 255
    t.boolean  "is_company",                    default: false
    t.integer  "author_id",       limit: 4,     default: 0,     null: false
    t.integer  "assigned_to_id",  limit: 4
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "cached_tag_list", limit: 255
    t.integer  "visibility",      limit: 4,     default: 0,     null: false
  end

  add_index "contacts", ["assigned_to_id"], name: "index_contacts_on_assigned_to_id", using: :btree
  add_index "contacts", ["author_id"], name: "index_contacts_on_author_id", using: :btree
  add_index "contacts", ["company"], name: "index_contacts_on_company", using: :btree
  add_index "contacts", ["email"], name: "index_contacts_on_email", using: :btree
  add_index "contacts", ["first_name"], name: "index_contacts_on_first_name", using: :btree
  add_index "contacts", ["is_company"], name: "index_contacts_on_is_company", using: :btree

  create_table "contacts_deals", id: false, force: :cascade do |t|
    t.integer "deal_id",    limit: 4
    t.integer "contact_id", limit: 4
  end

  add_index "contacts_deals", ["contact_id"], name: "index_contacts_deals_on_contact_id", using: :btree
  add_index "contacts_deals", ["deal_id"], name: "index_contacts_deals_on_deal_id", using: :btree

  create_table "contacts_issues", id: false, force: :cascade do |t|
    t.integer "issue_id",   limit: 4, default: 0, null: false
    t.integer "contact_id", limit: 4, default: 0, null: false
  end

  add_index "contacts_issues", ["contact_id"], name: "index_contacts_issues_on_contact_id", using: :btree
  add_index "contacts_issues", ["issue_id"], name: "index_contacts_issues_on_issue_id", using: :btree

  create_table "contacts_projects", id: false, force: :cascade do |t|
    t.integer "project_id", limit: 4, default: 0, null: false
    t.integer "contact_id", limit: 4, default: 0, null: false
  end

  add_index "contacts_projects", ["contact_id"], name: "index_contacts_projects_on_contact_id", using: :btree
  add_index "contacts_projects", ["project_id"], name: "index_contacts_projects_on_project_id", using: :btree

  create_table "contacts_queries", force: :cascade do |t|
    t.integer "project_id",    limit: 4
    t.string  "name",          limit: 255,   default: "",    null: false
    t.text    "filters",       limit: 65535
    t.integer "user_id",       limit: 4,     default: 0,     null: false
    t.boolean "is_public",                   default: false, null: false
    t.text    "column_names",  limit: 65535
    t.text    "sort_criteria", limit: 65535
    t.string  "group_by",      limit: 255
    t.string  "type",          limit: 255
  end

  add_index "contacts_queries", ["project_id"], name: "index_contacts_queries_on_project_id", using: :btree
  add_index "contacts_queries", ["user_id"], name: "index_contacts_queries_on_user_id", using: :btree

  create_table "contacts_settings", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "value",      limit: 65535
    t.integer  "project_id", limit: 4
    t.datetime "updated_on"
  end

  add_index "contacts_settings", ["project_id"], name: "index_contacts_settings_on_project_id", using: :btree

  create_table "custom_field_enumerations", force: :cascade do |t|
    t.integer "custom_field_id", limit: 4,                  null: false
    t.string  "name",            limit: 255,                null: false
    t.boolean "active",                      default: true, null: false
    t.integer "position",        limit: 4,   default: 1,    null: false
  end

  create_table "custom_fields", force: :cascade do |t|
    t.string  "type",            limit: 30,    default: "",    null: false
    t.string  "name",            limit: 30,    default: "",    null: false
    t.string  "field_format",    limit: 30,    default: "",    null: false
    t.text    "possible_values", limit: 65535
    t.string  "regexp",          limit: 255,   default: ""
    t.integer "min_length",      limit: 4
    t.integer "max_length",      limit: 4
    t.boolean "is_required",                   default: false, null: false
    t.boolean "is_for_all",                    default: false, null: false
    t.boolean "is_filter",                     default: false, null: false
    t.integer "position",        limit: 4,     default: 1
    t.boolean "searchable",                    default: false
    t.text    "default_value",   limit: 65535
    t.boolean "editable",                      default: true
    t.boolean "visible",                       default: true,  null: false
    t.boolean "multiple",                      default: false
    t.text    "format_store",    limit: 65535
    t.text    "description",     limit: 65535
  end

  add_index "custom_fields", ["id", "type"], name: "index_custom_fields_on_id_and_type", using: :btree

  create_table "custom_fields_projects", id: false, force: :cascade do |t|
    t.integer "custom_field_id", limit: 4, default: 0, null: false
    t.integer "project_id",      limit: 4, default: 0, null: false
  end

  add_index "custom_fields_projects", ["custom_field_id", "project_id"], name: "index_custom_fields_projects_on_custom_field_id_and_project_id", unique: true, using: :btree

  create_table "custom_fields_roles", id: false, force: :cascade do |t|
    t.integer "custom_field_id", limit: 4, null: false
    t.integer "role_id",         limit: 4, null: false
  end

  add_index "custom_fields_roles", ["custom_field_id", "role_id"], name: "custom_fields_roles_ids", unique: true, using: :btree

  create_table "custom_fields_trackers", id: false, force: :cascade do |t|
    t.integer "custom_field_id", limit: 4, default: 0, null: false
    t.integer "tracker_id",      limit: 4, default: 0, null: false
  end

  add_index "custom_fields_trackers", ["custom_field_id", "tracker_id"], name: "index_custom_fields_trackers_on_custom_field_id_and_tracker_id", unique: true, using: :btree

  create_table "custom_values", force: :cascade do |t|
    t.string  "customized_type", limit: 30,    default: "", null: false
    t.integer "customized_id",   limit: 4,     default: 0,  null: false
    t.integer "custom_field_id", limit: 4,     default: 0,  null: false
    t.text    "value",           limit: 65535
  end

  add_index "custom_values", ["custom_field_id"], name: "index_custom_values_on_custom_field_id", using: :btree
  add_index "custom_values", ["customized_type", "customized_id"], name: "custom_values_customized", using: :btree

  create_table "deal_categories", force: :cascade do |t|
    t.string  "name",       limit: 255, null: false
    t.integer "project_id", limit: 4
  end

  add_index "deal_categories", ["project_id"], name: "index_deal_categories_on_project_id", using: :btree

  create_table "deal_processes", force: :cascade do |t|
    t.integer  "deal_id",    limit: 4, null: false
    t.integer  "author_id",  limit: 4, null: false
    t.integer  "old_value",  limit: 4
    t.integer  "value",      limit: 4, null: false
    t.datetime "created_at"
  end

  add_index "deal_processes", ["author_id"], name: "index_deal_processes_on_author_id", using: :btree
  add_index "deal_processes", ["deal_id"], name: "index_deal_processes_on_deal_id", using: :btree

  create_table "deal_statuses", force: :cascade do |t|
    t.string  "name",        limit: 255,                    null: false
    t.integer "position",    limit: 4
    t.boolean "is_default",              default: false,    null: false
    t.integer "color",       limit: 4,   default: 11184810, null: false
    t.integer "status_type", limit: 4,   default: 0,        null: false
  end

  create_table "deal_statuses_projects", id: false, force: :cascade do |t|
    t.integer "project_id",     limit: 4, default: 0, null: false
    t.integer "deal_status_id", limit: 4, default: 0, null: false
  end

  add_index "deal_statuses_projects", ["project_id", "deal_status_id"], name: "index_deal_statuses_projects_on_project_id_and_deal_status_id", using: :btree

  create_table "deals", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "background",     limit: 65535
    t.string   "currency",       limit: 255
    t.integer  "duration",       limit: 4,                              default: 1
    t.decimal  "price",                        precision: 20, scale: 2
    t.integer  "price_type",     limit: 4
    t.integer  "project_id",     limit: 4
    t.integer  "author_id",      limit: 4
    t.integer  "assigned_to_id", limit: 4
    t.integer  "status_id",      limit: 4
    t.integer  "contact_id",     limit: 4
    t.integer  "category_id",    limit: 4
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "due_date"
    t.integer  "probability",    limit: 4
  end

  add_index "deals", ["author_id"], name: "index_deals_on_author_id", using: :btree
  add_index "deals", ["category_id"], name: "index_deals_on_category_id", using: :btree
  add_index "deals", ["contact_id"], name: "index_deals_on_contact_id", using: :btree
  add_index "deals", ["project_id"], name: "index_deals_on_project_id", using: :btree
  add_index "deals", ["status_id"], name: "index_deals_on_status_id", using: :btree

  create_table "deals_issues", force: :cascade do |t|
    t.integer "issue_id", limit: 4, default: 0, null: false
    t.integer "deal_id",  limit: 4, default: 0, null: false
  end

  add_index "deals_issues", ["deal_id"], name: "index_deals_issues_on_deal_id", using: :btree
  add_index "deals_issues", ["issue_id"], name: "index_deals_issues_on_issue_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.integer  "project_id",  limit: 4,     default: 0,  null: false
    t.integer  "category_id", limit: 4,     default: 0,  null: false
    t.string   "title",       limit: 255,   default: "", null: false
    t.text     "description", limit: 65535
    t.datetime "created_on"
  end

  add_index "documents", ["category_id"], name: "index_documents_on_category_id", using: :btree
  add_index "documents", ["created_on"], name: "index_documents_on_created_on", using: :btree
  add_index "documents", ["project_id"], name: "documents_project_id", using: :btree

  create_table "email_addresses", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,                   null: false
    t.string   "address",    limit: 255,                 null: false
    t.boolean  "is_default",             default: false, null: false
    t.boolean  "notify",                 default: true,  null: false
    t.datetime "created_on",                             null: false
    t.datetime "updated_on",                             null: false
  end

  add_index "email_addresses", ["user_id"], name: "index_email_addresses_on_user_id", using: :btree

  create_table "enabled_modules", force: :cascade do |t|
    t.integer "project_id", limit: 4
    t.string  "name",       limit: 255, null: false
  end

  add_index "enabled_modules", ["project_id"], name: "enabled_modules_project_id", using: :btree

  create_table "enumerations", force: :cascade do |t|
    t.string  "name",          limit: 30,  default: "",    null: false
    t.integer "position",      limit: 4,   default: 1
    t.boolean "is_default",                default: false, null: false
    t.string  "type",          limit: 255
    t.boolean "active",                    default: true,  null: false
    t.integer "project_id",    limit: 4
    t.integer "parent_id",     limit: 4
    t.string  "position_name", limit: 30
  end

  add_index "enumerations", ["id", "type"], name: "index_enumerations_on_id_and_type", using: :btree
  add_index "enumerations", ["project_id"], name: "index_enumerations_on_project_id", using: :btree

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", limit: 4, null: false
    t.integer "user_id",  limit: 4, null: false
  end

  add_index "groups_users", ["group_id", "user_id"], name: "groups_users_ids", unique: true, using: :btree

  create_table "import_items", force: :cascade do |t|
    t.integer "import_id", limit: 4,     null: false
    t.integer "position",  limit: 4,     null: false
    t.integer "obj_id",    limit: 4
    t.text    "message",   limit: 65535
  end

  create_table "imports", force: :cascade do |t|
    t.string   "type",        limit: 255
    t.integer  "user_id",     limit: 4,                     null: false
    t.string   "filename",    limit: 255
    t.text     "settings",    limit: 65535
    t.integer  "total_items", limit: 4
    t.boolean  "finished",                  default: false, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "issue_categories", force: :cascade do |t|
    t.integer "project_id",     limit: 4,  default: 0,  null: false
    t.string  "name",           limit: 60, default: "", null: false
    t.integer "assigned_to_id", limit: 4
  end

  add_index "issue_categories", ["assigned_to_id"], name: "index_issue_categories_on_assigned_to_id", using: :btree
  add_index "issue_categories", ["project_id"], name: "issue_categories_project_id", using: :btree

  create_table "issue_relations", force: :cascade do |t|
    t.integer "issue_from_id", limit: 4,                null: false
    t.integer "issue_to_id",   limit: 4,                null: false
    t.string  "relation_type", limit: 255, default: "", null: false
    t.integer "delay",         limit: 4
  end

  add_index "issue_relations", ["issue_from_id", "issue_to_id"], name: "index_issue_relations_on_issue_from_id_and_issue_to_id", unique: true, using: :btree
  add_index "issue_relations", ["issue_from_id"], name: "index_issue_relations_on_issue_from_id", using: :btree
  add_index "issue_relations", ["issue_to_id"], name: "index_issue_relations_on_issue_to_id", using: :btree

  create_table "issue_statuses", force: :cascade do |t|
    t.string  "name",               limit: 30, default: "",    null: false
    t.boolean "is_closed",                     default: false, null: false
    t.integer "position",           limit: 4,  default: 1
    t.integer "default_done_ratio", limit: 4
  end

  add_index "issue_statuses", ["is_closed"], name: "index_issue_statuses_on_is_closed", using: :btree
  add_index "issue_statuses", ["position"], name: "index_issue_statuses_on_position", using: :btree

  create_table "issues", force: :cascade do |t|
    t.integer  "tracker_id",       limit: 4,                     null: false
    t.integer  "project_id",       limit: 4,                     null: false
    t.string   "subject",          limit: 255,   default: "",    null: false
    t.text     "description",      limit: 65535
    t.date     "due_date"
    t.integer  "category_id",      limit: 4
    t.integer  "status_id",        limit: 4,                     null: false
    t.integer  "assigned_to_id",   limit: 4
    t.integer  "priority_id",      limit: 4,                     null: false
    t.integer  "fixed_version_id", limit: 4
    t.integer  "author_id",        limit: 4,                     null: false
    t.integer  "lock_version",     limit: 4,     default: 0,     null: false
    t.datetime "created_on"
    t.datetime "updated_on"
    t.date     "start_date"
    t.integer  "done_ratio",       limit: 4,     default: 0,     null: false
    t.float    "estimated_hours",  limit: 24
    t.integer  "parent_id",        limit: 4
    t.integer  "root_id",          limit: 4
    t.integer  "lft",              limit: 4
    t.integer  "rgt",              limit: 4
    t.boolean  "is_private",                     default: false, null: false
    t.datetime "closed_on"
  end

  add_index "issues", ["assigned_to_id"], name: "index_issues_on_assigned_to_id", using: :btree
  add_index "issues", ["author_id"], name: "index_issues_on_author_id", using: :btree
  add_index "issues", ["category_id"], name: "index_issues_on_category_id", using: :btree
  add_index "issues", ["created_on"], name: "index_issues_on_created_on", using: :btree
  add_index "issues", ["fixed_version_id"], name: "index_issues_on_fixed_version_id", using: :btree
  add_index "issues", ["priority_id"], name: "index_issues_on_priority_id", using: :btree
  add_index "issues", ["project_id"], name: "issues_project_id", using: :btree
  add_index "issues", ["root_id", "lft", "rgt"], name: "index_issues_on_root_id_and_lft_and_rgt", using: :btree
  add_index "issues", ["status_id"], name: "index_issues_on_status_id", using: :btree
  add_index "issues", ["tracker_id"], name: "index_issues_on_tracker_id", using: :btree

  create_table "journal_details", force: :cascade do |t|
    t.integer "journal_id", limit: 4,     default: 0,  null: false
    t.string  "property",   limit: 30,    default: "", null: false
    t.string  "prop_key",   limit: 30,    default: "", null: false
    t.text    "old_value",  limit: 65535
    t.text    "value",      limit: 65535
  end

  add_index "journal_details", ["journal_id"], name: "journal_details_journal_id", using: :btree

  create_table "journals", force: :cascade do |t|
    t.integer  "journalized_id",   limit: 4,     default: 0,     null: false
    t.string   "journalized_type", limit: 30,    default: "",    null: false
    t.integer  "user_id",          limit: 4,     default: 0,     null: false
    t.text     "notes",            limit: 65535
    t.datetime "created_on",                                     null: false
    t.boolean  "private_notes",                  default: false, null: false
  end

  add_index "journals", ["created_on"], name: "index_journals_on_created_on", using: :btree
  add_index "journals", ["journalized_id", "journalized_type"], name: "journals_journalized_id", using: :btree
  add_index "journals", ["journalized_id"], name: "index_journals_on_journalized_id", using: :btree
  add_index "journals", ["user_id"], name: "index_journals_on_user_id", using: :btree

  create_table "member_roles", force: :cascade do |t|
    t.integer "member_id",      limit: 4, null: false
    t.integer "role_id",        limit: 4, null: false
    t.integer "inherited_from", limit: 4
  end

  add_index "member_roles", ["member_id"], name: "index_member_roles_on_member_id", using: :btree
  add_index "member_roles", ["role_id"], name: "index_member_roles_on_role_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.integer  "user_id",           limit: 4, default: 0,     null: false
    t.integer  "project_id",        limit: 4, default: 0,     null: false
    t.datetime "created_on"
    t.boolean  "mail_notification",           default: false, null: false
  end

  add_index "members", ["project_id"], name: "index_members_on_project_id", using: :btree
  add_index "members", ["user_id", "project_id"], name: "index_members_on_user_id_and_project_id", unique: true, using: :btree
  add_index "members", ["user_id"], name: "index_members_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "board_id",      limit: 4,                     null: false
    t.integer  "parent_id",     limit: 4
    t.string   "subject",       limit: 255,   default: "",    null: false
    t.text     "content",       limit: 65535
    t.integer  "author_id",     limit: 4
    t.integer  "replies_count", limit: 4,     default: 0,     null: false
    t.integer  "last_reply_id", limit: 4
    t.datetime "created_on",                                  null: false
    t.datetime "updated_on",                                  null: false
    t.boolean  "locked",                      default: false
    t.integer  "sticky",        limit: 4,     default: 0
  end

  add_index "messages", ["author_id"], name: "index_messages_on_author_id", using: :btree
  add_index "messages", ["board_id"], name: "messages_board_id", using: :btree
  add_index "messages", ["created_on"], name: "index_messages_on_created_on", using: :btree
  add_index "messages", ["last_reply_id"], name: "index_messages_on_last_reply_id", using: :btree
  add_index "messages", ["parent_id"], name: "messages_parent_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.integer  "project_id",     limit: 4
    t.string   "title",          limit: 60,    default: "", null: false
    t.string   "summary",        limit: 255,   default: ""
    t.text     "description",    limit: 65535
    t.integer  "author_id",      limit: 4,     default: 0,  null: false
    t.datetime "created_on"
    t.integer  "comments_count", limit: 4,     default: 0,  null: false
  end

  add_index "news", ["author_id"], name: "index_news_on_author_id", using: :btree
  add_index "news", ["created_on"], name: "index_news_on_created_on", using: :btree
  add_index "news", ["project_id"], name: "news_project_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.string   "subject",     limit: 255
    t.text     "content",     limit: 65535
    t.integer  "source_id",   limit: 4
    t.string   "source_type", limit: 255
    t.integer  "author_id",   limit: 4
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer  "type_id",     limit: 4
  end

  add_index "notes", ["author_id"], name: "index_notes_on_author_id", using: :btree
  add_index "notes", ["source_id", "source_type"], name: "index_notes_on_source_id_and_source_type", using: :btree
  add_index "notes", ["type_id"], name: "index_notes_on_type_id", using: :btree

  create_table "open_id_authentication_associations", force: :cascade do |t|
    t.integer "issued",     limit: 4
    t.integer "lifetime",   limit: 4
    t.string  "handle",     limit: 255
    t.string  "assoc_type", limit: 255
    t.binary  "server_url", limit: 65535
    t.binary  "secret",     limit: 65535
  end

  create_table "open_id_authentication_nonces", force: :cascade do |t|
    t.integer "timestamp",  limit: 4,   null: false
    t.string  "server_url", limit: 255
    t.string  "salt",       limit: 255, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",               limit: 255,   default: "",    null: false
    t.text     "description",        limit: 65535
    t.string   "homepage",           limit: 255,   default: ""
    t.boolean  "is_public",                        default: true,  null: false
    t.integer  "parent_id",          limit: 4
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "identifier",         limit: 255
    t.integer  "status",             limit: 4,     default: 1,     null: false
    t.integer  "lft",                limit: 4
    t.integer  "rgt",                limit: 4
    t.boolean  "inherit_members",                  default: false, null: false
    t.integer  "default_version_id", limit: 4
  end

  add_index "projects", ["lft"], name: "index_projects_on_lft", using: :btree
  add_index "projects", ["rgt"], name: "index_projects_on_rgt", using: :btree

  create_table "projects_trackers", id: false, force: :cascade do |t|
    t.integer "project_id", limit: 4, default: 0, null: false
    t.integer "tracker_id", limit: 4, default: 0, null: false
  end

  add_index "projects_trackers", ["project_id", "tracker_id"], name: "projects_trackers_unique", unique: true, using: :btree
  add_index "projects_trackers", ["project_id"], name: "projects_trackers_project_id", using: :btree

  create_table "queries", force: :cascade do |t|
    t.integer "project_id",    limit: 4
    t.string  "name",          limit: 255,   default: "", null: false
    t.text    "filters",       limit: 65535
    t.integer "user_id",       limit: 4,     default: 0,  null: false
    t.text    "column_names",  limit: 65535
    t.text    "sort_criteria", limit: 65535
    t.string  "group_by",      limit: 255
    t.string  "type",          limit: 255
    t.integer "visibility",    limit: 4,     default: 0
    t.text    "options",       limit: 65535
  end

  add_index "queries", ["project_id"], name: "index_queries_on_project_id", using: :btree
  add_index "queries", ["user_id"], name: "index_queries_on_user_id", using: :btree

  create_table "queries_roles", id: false, force: :cascade do |t|
    t.integer "query_id", limit: 4, null: false
    t.integer "role_id",  limit: 4, null: false
  end

  add_index "queries_roles", ["query_id", "role_id"], name: "queries_roles_ids", unique: true, using: :btree

  create_table "recently_vieweds", force: :cascade do |t|
    t.integer  "viewer_id",   limit: 4
    t.integer  "viewed_id",   limit: 4
    t.string   "viewed_type", limit: 255
    t.integer  "views_count", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "recently_vieweds", ["viewed_id", "viewed_type"], name: "index_recently_vieweds_on_viewed_id_and_viewed_type", using: :btree
  add_index "recently_vieweds", ["viewer_id"], name: "index_recently_vieweds_on_viewer_id", using: :btree

  create_table "repositories", force: :cascade do |t|
    t.integer  "project_id",    limit: 4,     default: 0,     null: false
    t.string   "url",           limit: 255,   default: "",    null: false
    t.string   "login",         limit: 60,    default: ""
    t.string   "password",      limit: 255,   default: ""
    t.string   "root_url",      limit: 255,   default: ""
    t.string   "type",          limit: 255
    t.string   "path_encoding", limit: 64
    t.string   "log_encoding",  limit: 64
    t.text     "extra_info",    limit: 65535
    t.string   "identifier",    limit: 255
    t.boolean  "is_default",                  default: false
    t.datetime "created_on"
  end

  add_index "repositories", ["project_id"], name: "index_repositories_on_project_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string  "name",                    limit: 30,    default: "",        null: false
    t.integer "position",                limit: 4,     default: 1
    t.boolean "assignable",                            default: true
    t.integer "builtin",                 limit: 4,     default: 0,         null: false
    t.text    "permissions",             limit: 65535
    t.string  "issues_visibility",       limit: 30,    default: "default", null: false
    t.string  "users_visibility",        limit: 30,    default: "all",     null: false
    t.string  "time_entries_visibility", limit: 30,    default: "all",     null: false
    t.boolean "all_roles_managed",                     default: true,      null: false
  end

  create_table "roles_managed_roles", id: false, force: :cascade do |t|
    t.integer "role_id",         limit: 4, null: false
    t.integer "managed_role_id", limit: 4, null: false
  end

  add_index "roles_managed_roles", ["role_id", "managed_role_id"], name: "index_roles_managed_roles_on_role_id_and_managed_role_id", unique: true, using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "name",       limit: 255,   default: "", null: false
    t.text     "value",      limit: 65535
    t.datetime "updated_on"
  end

  add_index "settings", ["name"], name: "index_settings_on_name", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type"], name: "index_taggings_on_taggable_id_and_taggable_type", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "time_entries", force: :cascade do |t|
    t.integer  "project_id",          limit: 4,                         null: false
    t.integer  "user_id",             limit: 4,                         null: false
    t.integer  "issue_id",            limit: 4
    t.float    "hours",               limit: 24,                        null: false
    t.string   "comments",            limit: 1024
    t.integer  "activity_id",         limit: 4,                         null: false
    t.date     "spent_on",                                              null: false
    t.integer  "tyear",               limit: 4,                         null: false
    t.integer  "tmonth",              limit: 4,                         null: false
    t.integer  "tweek",               limit: 4,                         null: false
    t.datetime "created_on",                                            null: false
    t.datetime "updated_on",                                            null: false
    t.string   "confirmation_status", limit: 255,  default: "pending"
    t.string   "kind",                limit: 255,  default: "overtime"
  end

  add_index "time_entries", ["activity_id"], name: "index_time_entries_on_activity_id", using: :btree
  add_index "time_entries", ["created_on"], name: "index_time_entries_on_created_on", using: :btree
  add_index "time_entries", ["issue_id"], name: "time_entries_issue_id", using: :btree
  add_index "time_entries", ["project_id"], name: "time_entries_project_id", using: :btree
  add_index "time_entries", ["user_id"], name: "index_time_entries_on_user_id", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,  default: 0,  null: false
    t.string   "action",     limit: 30, default: "", null: false
    t.string   "value",      limit: 40, default: "", null: false
    t.datetime "created_on",                         null: false
    t.datetime "updated_on"
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id", using: :btree
  add_index "tokens", ["value"], name: "tokens_value", unique: true, using: :btree

  create_table "trackers", force: :cascade do |t|
    t.string  "name",              limit: 30, default: "",    null: false
    t.boolean "is_in_chlog",                  default: false, null: false
    t.integer "position",          limit: 4,  default: 1
    t.boolean "is_in_roadmap",                default: true,  null: false
    t.integer "fields_bits",       limit: 4,  default: 0
    t.integer "default_status_id", limit: 4
  end

  create_table "user_preferences", force: :cascade do |t|
    t.integer "user_id",   limit: 4,     default: 0,    null: false
    t.text    "others",    limit: 65535
    t.boolean "hide_mail",               default: true
    t.string  "time_zone", limit: 255
  end

  add_index "user_preferences", ["user_id"], name: "index_user_preferences_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",              limit: 255, default: "",    null: false
    t.string   "hashed_password",    limit: 40,  default: "",    null: false
    t.string   "firstname",          limit: 30,  default: "",    null: false
    t.string   "lastname",           limit: 255, default: "",    null: false
    t.boolean  "admin",                          default: false, null: false
    t.integer  "status",             limit: 4,   default: 1,     null: false
    t.datetime "last_login_on"
    t.string   "language",           limit: 5,   default: ""
    t.integer  "auth_source_id",     limit: 4
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "type",               limit: 255
    t.string   "identity_url",       limit: 255
    t.string   "mail_notification",  limit: 255, default: "",    null: false
    t.string   "salt",               limit: 64
    t.boolean  "must_change_passwd",             default: false, null: false
    t.datetime "passwd_changed_on"
  end

  add_index "users", ["auth_source_id"], name: "index_users_on_auth_source_id", using: :btree
  add_index "users", ["id", "type"], name: "index_users_on_id_and_type", using: :btree
  add_index "users", ["type"], name: "index_users_on_type", using: :btree

  create_table "versions", force: :cascade do |t|
    t.integer  "project_id",      limit: 4,   default: 0,      null: false
    t.string   "name",            limit: 255, default: "",     null: false
    t.string   "description",     limit: 255, default: ""
    t.date     "effective_date"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "wiki_page_title", limit: 255
    t.string   "status",          limit: 255, default: "open"
    t.string   "sharing",         limit: 255, default: "none", null: false
  end

  add_index "versions", ["project_id"], name: "versions_project_id", using: :btree
  add_index "versions", ["sharing"], name: "index_versions_on_sharing", using: :btree

  create_table "watchers", force: :cascade do |t|
    t.string  "watchable_type", limit: 255, default: "", null: false
    t.integer "watchable_id",   limit: 4,   default: 0,  null: false
    t.integer "user_id",        limit: 4
  end

  add_index "watchers", ["user_id", "watchable_type"], name: "watchers_user_id_type", using: :btree
  add_index "watchers", ["user_id"], name: "index_watchers_on_user_id", using: :btree
  add_index "watchers", ["watchable_id", "watchable_type"], name: "index_watchers_on_watchable_id_and_watchable_type", using: :btree

  create_table "week_shedule_agreements", force: :cascade do |t|
    t.date     "week_begin_at"
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "wiki_content_versions", force: :cascade do |t|
    t.integer  "wiki_content_id", limit: 4,                       null: false
    t.integer  "page_id",         limit: 4,                       null: false
    t.integer  "author_id",       limit: 4
    t.binary   "data",            limit: 4294967295
    t.string   "compression",     limit: 6,          default: ""
    t.string   "comments",        limit: 1024,       default: ""
    t.datetime "updated_on",                                      null: false
    t.integer  "version",         limit: 4,                       null: false
  end

  add_index "wiki_content_versions", ["updated_on"], name: "index_wiki_content_versions_on_updated_on", using: :btree
  add_index "wiki_content_versions", ["wiki_content_id"], name: "wiki_content_versions_wcid", using: :btree

  create_table "wiki_contents", force: :cascade do |t|
    t.integer  "page_id",    limit: 4,                       null: false
    t.integer  "author_id",  limit: 4
    t.text     "text",       limit: 4294967295
    t.string   "comments",   limit: 1024,       default: ""
    t.datetime "updated_on",                                 null: false
    t.integer  "version",    limit: 4,                       null: false
  end

  add_index "wiki_contents", ["author_id"], name: "index_wiki_contents_on_author_id", using: :btree
  add_index "wiki_contents", ["page_id"], name: "wiki_contents_page_id", using: :btree

  create_table "wiki_pages", force: :cascade do |t|
    t.integer  "wiki_id",    limit: 4,                   null: false
    t.string   "title",      limit: 255,                 null: false
    t.datetime "created_on",                             null: false
    t.boolean  "protected",              default: false, null: false
    t.integer  "parent_id",  limit: 4
  end

  add_index "wiki_pages", ["parent_id"], name: "index_wiki_pages_on_parent_id", using: :btree
  add_index "wiki_pages", ["wiki_id", "title"], name: "wiki_pages_wiki_id_title", using: :btree
  add_index "wiki_pages", ["wiki_id"], name: "index_wiki_pages_on_wiki_id", using: :btree

  create_table "wiki_redirects", force: :cascade do |t|
    t.integer  "wiki_id",              limit: 4,   null: false
    t.string   "title",                limit: 255
    t.string   "redirects_to",         limit: 255
    t.datetime "created_on",                       null: false
    t.integer  "redirects_to_wiki_id", limit: 4,   null: false
  end

  add_index "wiki_redirects", ["wiki_id", "title"], name: "wiki_redirects_wiki_id_title", using: :btree
  add_index "wiki_redirects", ["wiki_id"], name: "index_wiki_redirects_on_wiki_id", using: :btree

  create_table "wikis", force: :cascade do |t|
    t.integer "project_id", limit: 4,               null: false
    t.string  "start_page", limit: 255,             null: false
    t.integer "status",     limit: 4,   default: 1, null: false
  end

  add_index "wikis", ["project_id"], name: "wikis_project_id", using: :btree

  create_table "workflows", force: :cascade do |t|
    t.integer "tracker_id",    limit: 4,  default: 0,     null: false
    t.integer "old_status_id", limit: 4,  default: 0,     null: false
    t.integer "new_status_id", limit: 4,  default: 0,     null: false
    t.integer "role_id",       limit: 4,  default: 0,     null: false
    t.boolean "assignee",                 default: false, null: false
    t.boolean "author",                   default: false, null: false
    t.string  "type",          limit: 30
    t.string  "field_name",    limit: 30
    t.string  "rule",          limit: 30
  end

  add_index "workflows", ["new_status_id"], name: "index_workflows_on_new_status_id", using: :btree
  add_index "workflows", ["old_status_id"], name: "index_workflows_on_old_status_id", using: :btree
  add_index "workflows", ["role_id", "tracker_id", "old_status_id"], name: "wkfs_role_tracker_old_status", using: :btree
  add_index "workflows", ["role_id"], name: "index_workflows_on_role_id", using: :btree

end
