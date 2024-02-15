--1. Retrieve the list of all open positions along with their associated project details.
select v.jobRoel, p.*
from Vacancy v, VacancyProject vp, Project p
where v.VID = vp.VID and vp.PID = p.PID and V.status = 'Open';

--2. List all candidates who have applied for any open position.
select c."name" 
from Candidate c, Vacancy v
where c.VID = v.VID and v.status = 'Open' and c.applystatus ='Applied';

--3. Display the details of all projects that currently have open positions.
select p.*
from Vacancy v, VacancyProject vp, Project p
where v.VID = vp.VID and vp.PID = p.PID and V.status = 'Open';

--4. Retrieve the list of all candidates who have not yet applied for any open position.
select c.cid , c."name" 
from Candidate c, Vacancy v
where c.VID = v.VID and v.status = 'Open' and c.applystatus ='Not-Applied';

--5. List all projects along with the count of open positions for each project.
select P."name", COUNT(V.VID) as open_positions
from Project P, VacancyProject VP, Vacancy V
where P.PID = VP.PID and VP.VID = V.VID and V.status = 'Open'
group by P.PID, P.name, P.description, P.startDate, P.endDate, P.status;

--6. Display the details of all candidates who have applied for more than one open position.
select c.*
from Candidate c, Vacancy v
where c.CID = v.VID and v.status = 'Open' and c.applystatus = 'Applied'
group by c.CID, c.name, c.position, c.status, c.applyStatus
having COUNT(v.VID) > 1

--7. List all projects along with the total number of candidates who have applied for open positions in each project.
select p.name, COUNT(c.CID) as  totalcandidates
from Candidate c, Vacancy v, VacancyProject vp, Project p
where c.VID = v.VID and v.VID = vp.VID and vp.PID = p.PID and v.status  = 'Open' and c.applystatus = 'Applied'
group by p.name

--8. Retrieve the details of all interviews scheduled for a specific project.
select i.*
from Interview i, Project p 
where p.pid  = i.pid and p.pid = 'P11'

--9. Display the count of interviews conducted for each project.
select p.name, COUNT(i.id)
from Interview i, Project p
where i.pid = p.pid 
group by p.name

--10. List all candidates who have attended interviews for any project along with their interview details.
select c.cid , c.name
from interview i, candidate c, candidateinterview ci
where c.cid = ci.cid and ci.id = i.id 
order by c.cid asc

--11. Retrieve the average rating given to each candidate across all interviews.
select ci.CID, AVG(if.rating) as average_rating
from CandidateInterview ci, InterviewFeedback if
where ci.ID = if.ID
group by ci.CID;


--12. Display the details of all candidates who have received a rating of 5 in any interview.
select c.CID, c.name
from CandidateInterview ci, InterviewFeedback if, Candidate c 
where ci.ID = if.ID and c.cid = ci.cid and if.rating = 5

--13. List all interviewers along with the count of interviews they have conducted.
select ii.IID, iw.name, COUNT(II.ID) as interview_count
from InterviewerInterview ii, interviewer iw
where ii.iid = iw.iid 
group by ii.IID, iw.name

--14. Retrieve the details of all interviews conducted on a specific date.
select *
from interview
where interviewdate = '2024-01-15'

--15. Display the average rating given to candidates for interviews conducted by each interviewer.
select ii.iid , AVG(if.rating) as average_rating
from interview i, interviewfeedback if, interviewerinterview ii
where i.id = ii.id and i.id = if.id 
group by ii.iid 

--16. List all candidates who have attended interviews for more than one project.
select ci.cid, p.name
from candidateInterview ci, project p, interview i 
where ci.id  = i.id and p.pid = i.pid 
group by ci.cid, p.name
having COUNT(ci.id) > 1;

--17. Retrieve the details of all interviews where the candidate was rejected.
select i.*
from interview i, interviewfeedback if
where i.id = if.id and if.rating < 3

--18. Display the details of all candidates who have received the highest rating in any interview.
select ci.cid , c.name, c.position, c.status, c.vid 
from candidateinterview ci, interviewfeedback if, candidate c 
where ci.id = if.id and c.cid = ci.cid 
group by ci.cid, c.name, c.position, c.status, c.vid 
having max(if.rating) = 5 

--19. List all candidates who have received an average rating above a certain threshold.
select CID
from CandidateInterview
group by CID
having AVG((select rating from InterviewFeedback where InterviewFeedback.ID = CandidateInterview.ID)) > 3; -- Assuming the threshold is 3



--20. Retrieve the details of all interviews conducted for a specific candidate.
select *
from interview i 
where id in (select id from candidateinterview where cid = 'C1')


--21. Write a query to retrieve all candidates who got a rating of 4 and passed the
interview after being interviewed by a particular interviewer (say “Nuwan”)
within last 3 months.

select c.*
from candidate c, interview i, interviewer iw, interviewfeedback if, candidateinterview ci, interviewerinterview iiw
where c.cid = ci.cid and i.id  = iiw.id and if.id = i.id and if.iid =iw.iid and ci.id  = i.id and if.rating = 4 and iw.name = 'Isuru Jayalath' 
and i.interviewdate >= current_date - interval '3 months' and if.rating >= 3








