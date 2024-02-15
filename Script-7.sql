-- Sample data for Interviewer table
INSERT INTO Interviewer (IID, name, department, position, contactno) VALUES
('I10', 'Isuru Jayalath', 'Human Resources', 'HR Manager', '0772986311'),
('I20', 'Saman Rathnayake', 'Technology', 'Software Engineer', '0771152483'),
('I30', 'Thilina Amarasekara', 'Technology', 'Software Engineer', '0712549635'),
('I40', 'Jayalath Ekanayake', 'Technology', 'Software Engineer', '0725896358');

-- Sample data for project table
INSERT INTO project (PID, name, description, startDate, endDate, status) VALUES
('P11', 'Project X', 'Developing a new software application', '2024-01-01', '2024-06-30', 'In Progress'),
('P22', 'Project Y', 'Implementing a new database system', '2024-02-01', '2024-08-31', 'Planning'),
('P33', 'Project X', 'Designing the ER diagram', '2024-02-11', '2024-10-08', 'Hold'),
('P44', 'Project Y', 'Implementing a new application', '2024-01-25', '2025-09-01', 'In Progress');

-- Sample data for Vacancy table
INSERT INTO Vacancy (VID, jobRoel, status) VALUES
('V110', 'Software Developer', 'Open'),
('V220', 'Database Administrator', 'Closed'),
('V330', 'QA Engineer', 'Open'),
('V440', 'Software Developer', 'Closed');

-- Sample data for Interview table
INSERT INTO Interview (ID, interviewDate, interviewTime, PID, VID) VALUES
('IW1500', '2024-01-15', '10:00:00', 'P11', 'V110'),
('IW1510', '2024-02-20', '14:30:00', 'P22', 'V220'),
('IW1520', '2024-02-15', '18:00:00', 'P33', 'V330'),
('IW1530', '2024-01-02', '13:30:00', 'P44', 'V440');

-- Sample data for InterviewFeedback table
INSERT INTO InterviewFeedback (IID, ID, IFID, rating, category, expectedLevel) VALUES
('I10', 'IW1500', 'IF1111', 4, 'Technical Skills', 5),
('I20', 'IW1510', 'IF8888', 3, 'Communication', 4),
('I30', 'IW1520', 'IF1111', 5, 'Technical Skills', 5),
('I40', 'IW1530', 'IF8888', 2, 'Communication', 4);

-- Sample data for Candidate table
INSERT INTO Candidate (CID, name, position, status, applyStatus, VID) VALUES
('C1', 'Kumara Jayawarna', 'Software Developer', 'Active', 'Applied', 'V110'),
('C2', 'Damith Jayasekara', 'Database Administrator', 'Active', 'Applied', 'V220'),
('C3', 'Isuru Jayalath', 'Software Developer', 'Active', 'Applied', 'V110'),
('C4', 'Damith Jayasekara', 'Database Administrator', 'Active', 'Not-Applied', 'V330');

-- Sample data for InterviewerInterview table
INSERT INTO InterviewerInterview (ID, IID) VALUES
('IW1500', 'I10'),
('IW1510', 'I20'),
('IW1520', 'I30'),
('IW1530', 'I40');

-- Sample data for VacancyProject table
INSERT INTO VacancyProject (PID, VID) VALUES
('P11', 'V110'),
('P22', 'V220'),
('P11', 'V330'),
('P33', 'V220');

-- Sample data for CandidateInterview table
INSERT INTO CandidateInterview (CID, ID) VALUES
('C1', 'IW1500'),
('C2', 'IW1510'),
('C4', 'IW1520'),
('C3', 'IW1510');

-- Sample data for GeneralInformation table
INSERT INTO GeneralInformation (IIID, ID, isProjectSpecific, targetStartDate, isReferral) VALUES
('IN100', 'IW1500', 'Yes', '2024-02-01', 'No'),
('IN200', 'IW1510', 'No', NULL, 'Yes'),
('IN300', 'IW1520', 'Yes', '2024-02-01', 'No'),
('IN400', 'IW1510', 'No', NULL, 'Yes');

-- Sample data for ProjectInformation table
INSERT INTO ProjectInformtion (IIID, ID, natureOfRecruiment) VALUES
('IN100', 'IW1500', 'Software Development'),
('IN200', 'IW1510', 'Database Management'),
('IN300', 'IW1510', 'Software Development'),
('IN400', 'IW1520', 'Database Management');
