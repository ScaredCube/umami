-- RenameIndex visitor
ALTER TABLE `session` RENAME INDEX `session_session_id_key` TO `visitor_visitor_id_key`;
ALTER TABLE `session` RENAME INDEX `session_created_at_idx` TO `visitor_created_at_idx`;
ALTER TABLE `session` RENAME INDEX `session_website_id_idx` TO `visitor_website_id_idx`;
ALTER TABLE `session` RENAME INDEX `session_website_id_created_at_idx` TO `visitor_website_id_created_at_idx`;
ALTER TABLE `session` RENAME INDEX `session_website_id_created_at_hostname_idx` TO `visitor_website_id_created_at_hostname_idx`;
ALTER TABLE `session` RENAME INDEX `session_website_id_created_at_browser_idx` TO `visitor_website_id_created_at_browser_idx`;
ALTER TABLE `session` RENAME INDEX `session_website_id_created_at_os_idx` TO `visitor_website_id_created_at_os_idx`;
ALTER TABLE `session` RENAME INDEX `session_website_id_created_at_device_idx` TO `visitor_website_id_created_at_device_idx`;
ALTER TABLE `session` RENAME INDEX `session_website_id_created_at_screen_idx` TO `visitor_website_id_created_at_screen_idx`;
ALTER TABLE `session` RENAME INDEX `session_website_id_created_at_language_idx` TO `visitor_website_id_created_at_language_idx`;
ALTER TABLE `session` RENAME INDEX `session_website_id_created_at_country_idx` TO `visitor_website_id_created_at_country_idx`;
ALTER TABLE `session` RENAME INDEX `session_website_id_created_at_subdivision1_idx` TO `visitor_website_id_created_at_subdivision1_idx`;
ALTER TABLE `session` RENAME INDEX `session_website_id_created_at_city_idx` TO `visitor_website_id_created_at_city_idx`;

-- RenameIndex visitor_data
ALTER TABLE `session_data` RENAME INDEX `session_data_created_at_idx` TO `visitor_data_created_at_idx`;
ALTER TABLE `session_data` RENAME INDEX `session_data_session_id_idx` TO `visitor_data_session_id_idx`;
ALTER TABLE `session_data` RENAME INDEX `session_data_website_id_idx` TO `visitor_data_website_id_idx`;

-- RenameIndex website_event
ALTER TABLE `website_event` RENAME INDEX `website_event_session_id_idx` TO `website_event_visitor_id_idx`;
ALTER TABLE `website_event` RENAME INDEX `website_event_website_id_session_id_created_at_idx` TO `website_event_website_id_visitor_id_created_at_idx`;

-- RenameColumn
ALTER TABLE `session` CHANGE `session_id` `visitor_id` VARCHAR(36) NOT NULL;

ALTER TABLE `session_data` CHANGE `session_data_id` `visitor_data_id` VARCHAR(36) NOT NULL;
ALTER TABLE `session_data` CHANGE `session_id` `visitor_id` VARCHAR(36) NOT NULL;
ALTER TABLE `session_data` CHANGE `event_key` `visitor_key` VARCHAR(500) NOT NULL;

ALTER TABLE `website_event` CHANGE `session_id` `visitor_id` VARCHAR(36) NOT NULL;
ALTER TABLE `website_event` ADD `session_id` VARCHAR(36) NOT NULL AFTER `visitor_id`;

-- RenameTable
RENAME TABLE `session` TO `visitor`;
RENAME TABLE `session_data` TO `visitor_data`;

-- CreateIndex
CREATE INDEX `website_event_website_id_visitor_id_created_at_idx` ON `website_event`(`website_id`, `visitor_id`, `created_at`);