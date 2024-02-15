CREATE TABLE Interviewer(
	IID VARCHAR(100) primary key not null,
	name VARCHAR(100) not null,
	department VARCHAR(100) not null,
	position VARCHAR(50) not null,
	contactno VARCHAR(10) not null
);

create table project(
	PID VARCHAR(100) primary key not null,
	name VARCHAR(150) not null,
	description VARCHAR(255) not null,
	startDate DATE not null,
	endDAte DATE not null,
	status VARCHAR(50) not null
	
);

create table Vacancy(
	VID VARCHAR(100) primary key not null,
	jobRoel VARCHAR(100) not null,
	status VARCHAR(50) not null
);

create table Interview(
	ID VARCHAR(100) primary key not null,
	interviewDate DATE not null,
	interviewTime TIME not null,
	PID VARCHAR(100) not null,
	VID VARCHAR(100) not null,
	foreign key (VID) references Vacancy(VID),
	foreign key (PID) references Project(PID)
);

create TABLE InterviewFeedback(
	IID VARCHAR(100) not null,
	ID VARCHAR(100) not null,
	IFID VARCHAR(100) not null,
	rating INT not null,
	category VARCHAR(200) not null,
	expectedLevel INT not null,
	foreign key (IID) references Interviewer(IID),
	foreign key (ID) references Interview(ID),
	primary key(IID, IFID)
);


create table Candidate(
	CID VARCHAR(100) primary key not null,
	name VARCHAR(100) not null,
	position VARCHAR(50) not null,
	status VARCHAR(50) not null,
	applyStatus VARCHAR(50) not null,
	VID VARCHAR(100) not null,
	foreign key (VID) references Vacancy(VID)
);

create table InterviewerInterview(
	ID VARCHAR(100) not null,
	IID VARCHAR(100) not null,
	foreign key (IID) references Interviewer(IID),
	foreign key (ID) references Interview(ID),
	primary key(IID, ID)
	
);

create table VacancyProject(
	PID VARCHAR(100) not null,
	VID VARCHAR(100) not null,
	foreign key (VID) references Vacancy(VID),
	foreign key (PID) references Project(PID),
	primary key(VID, PID)
);

create table CandidateInterview(
	CID VARCHAR(100) not null,
	ID VARCHAR(100) not null,
	foreign key (CID) references Candidate(CID),
	foreign key (ID) references Interview(ID),
	primary key(CID, ID)
);

create table GeneralInformation(
	IIID VARCHAR(100) primary key not null,
	ID VARCHAR(100) not null,
	isProjectSpecific VARCHAR(50) not null,
	targetStartDate DATE,
	isReferral VARCHAR(50) not null,
	foreign key (ID) references Interview(ID)
	
);


create table ProjectInformtion(
	IIID VARCHAR(100) primary key not null,
	ID VARCHAR(100) not null,
	natureOfRecruiment VARCHAR(100) not null,
	foreign key (ID) references Interview(ID)
);








































