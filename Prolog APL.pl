% CMPS 5113: Advanced Prog Language Concepts
% Program 2: Logic Programming using Prolog
% Names: Brett Mitchell and Chintan Mehta

% Explanation: The following program represents necessary information using facts and logic in Prolog. Various colleges of MSU, different departments of the college, department chairs and the respective faculty are represented using "Facts". The relationship between these "Facts" are represented using "Rules".

% FACTS FOR THE 6 COLLEGES OF MSU
college(sciAndMath, msu).
college(bizz, msu).
college(fineArts, msu).
college(health, msu).
college(humanities, msu).
college(edu, msu).

% FACTS FOR THE 7 DEPARTMENTS WITHIN THE SCIENCE AND MATH COLLEGE OF MSU
dept(bio, sciAndMath).
dept(chem, sciAndMath).
dept(cs, sciAndMath).
dept(geo, sciAndMath).
dept(math, sciAndMath).
dept(engg, sciAndMath).
dept(phys, sciAndMath).

% FACTS FOR THE CHAIRS WITHIN EACH DEPARTMENT OF MSU
chair(willis, bio).
chair(hansen, chem).
chair(stringfellow, cs).
chair(price, geo).
chair(mitchell, math).
chair(desai, engg).
chair(hansen, phys).

% FACTS FOR THE FACULTY WITHIN EACH DEPARTMENT OF MSU
faculty(scales, bio).
faculty(cook, bio).
faculty(shao, chem).
faculty(fulton, chem).
faculty(johnson, cs).
faculty(morgan, cs).
faculty(rosscoe, geo).
faculty(mahmud, geo).
faculty(knox, math).
faculty(hood, math).
faculty(guo, engg).
faculty(brink, engg).
faculty(dunn, phys).
faculty(sharma, phys).


% RULES

% RULES FOR FACULTY WITHIN THE DEPARTMENT
faculty(Faculty, Dept) :- chair(Faculty, Dept).

% RULES FOR DEPARTMENT AS PART OF COLLEGE
part_of(Dept, College) :- dept(Dept, College).

% RULES FOR COLLEGE AS PART OF THE UNIVERSITY
part_of(College, University) :- college(College, University).

% RULES FOR DEPARTMENT AS PART OF UNIVERSITY
part_of(Dept, University) :- dept(Dept, College), college(College, University).

% RULES FOR FACULTY WORKING FOR THE DEPT, CHAIR, COLLEGE, AND UNIVERSITY
works_for(Faculty, Dept) :- faculty(Faculty, Dept).
works_for(Faculty, Chair) :- faculty(Faculty, Dept), chair(Chair, Dept).
works_for(Faculty, College) :- faculty(Faculty, Dept), dept(Dept, College).
works_for(Faculty, University) :- college(College, University), works_for(Faculty, College).