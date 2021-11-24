
ALTER TABLE origination_enquiry DROP CONSTRAINT FK_ORIGINATION_ENQ_ANSWERED_USER
GO
ALTER TABLE origination_enquiry DROP CONSTRAINT FK_ORIGINATION_ENQ_COUNTRY
GO
ALTER TABLE origination_enquiry DROP CONSTRAINT FK_ORIGINATION_ENQ_CPTY
GO
ALTER TABLE origination_enquiry DROP CONSTRAINT FK_ORIGINATION_ENQ_MODIFIED_USER
GO
ALTER TABLE origination_enquiry DROP CONSTRAINT FK_ORIGINATION_ENQ_ORG_FACILITY
GO
ALTER TABLE origination_enquiry DROP CONSTRAINT FK_ORIGINATION_ENQ_ORG_LIMIT
GO
ALTER TABLE origination_enquiry DROP CONSTRAINT FK_ORIGINATION_ENQ_ORIGINATION_PACK
GO
ALTER TABLE origination_enquiry DROP CONSTRAINT FK_ORIGINATION_ENQ_RESPONSIBLE_USER_GROUP
GO
ALTER TABLE origination_enquiry DROP CONSTRAINT PK_ORIGINATION_ENQUIRY
GO


ALTER TABLE document DROP CONSTRAINT FK_DOCUMENT_ORIGINATION_ENQUIRY
GO
DROP TABLE origination_enquiry
GO


-- FIO-41 Enquiry
CREATE TABLE origination_enquiry (
	origination_enquiry_id bigint DEFAULT NEXT VALUE FOR [SQ_ORGENQ] NOT NULL,
	origination_enquiry_type varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	origination_pack_id bigint NULL,
	country_id bigint NULL,
	cpty_id bigint NULL,
	origination_facility_id bigint NULL,
	origination_limit_id bigint NULL,
	origination_limit_path nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	enquiry nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	answer nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	answered_user_id bigint NULL,
	answered_date datetime NULL,
	modified_user_id bigint NULL,
	modified_date datetime NULL,
	responsible_user_group_id bigint NULL,
	reject nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_ORIGINATION_ENQUIRY PRIMARY KEY (origination_enquiry_id)
);

GO
ALTER TABLE origination_enquiry ADD CONSTRAINT FK_ORIGINATION_ENQ_ANSWERED_USER FOREIGN KEY (answered_user_id) REFERENCES app_user(app_user_id);
GO
ALTER TABLE origination_enquiry ADD CONSTRAINT FK_ORIGINATION_ENQ_COUNTRY FOREIGN KEY (country_id) REFERENCES country(country_id);
GO
ALTER TABLE origination_enquiry ADD CONSTRAINT FK_ORIGINATION_ENQ_CPTY FOREIGN KEY (cpty_id) REFERENCES cpty(cpty_id);
GO
ALTER TABLE origination_enquiry ADD CONSTRAINT FK_ORIGINATION_ENQ_MODIFIED_USER FOREIGN KEY (modified_user_id) REFERENCES app_user(app_user_id);
GO
ALTER TABLE origination_enquiry ADD CONSTRAINT FK_ORIGINATION_ENQ_ORG_FACILITY FOREIGN KEY (origination_facility_id) REFERENCES origination_facility(origination_facility_id);
GO
ALTER TABLE origination_enquiry ADD CONSTRAINT FK_ORIGINATION_ENQ_ORG_LIMIT FOREIGN KEY (origination_limit_id) REFERENCES origination_limit(origination_limit_id);
GO
ALTER TABLE origination_enquiry ADD CONSTRAINT FK_ORIGINATION_ENQ_ORIGINATION_PACK FOREIGN KEY (origination_pack_id) REFERENCES origination_pack(origination_pack_id);
GO
ALTER TABLE origination_enquiry ADD CONSTRAINT FK_ORIGINATION_ENQ_RESPONSIBLE_USER_GROUP FOREIGN KEY (responsible_user_group_id) REFERENCES user_group(user_group_id);
GO

ALTER TABLE [dbo].[document] 
ADD CONSTRAINT FK_DOCUMENT_ORIGINATION_ENQUIRY
FOREIGN KEY (origination_enquiry_id) REFERENCES [dbo].[origination_enquiry](origination_enquiry_id);
GO
