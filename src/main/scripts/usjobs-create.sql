create sequence hibernate_sequence minvalue 80;

    create table applications (
        app_id int4 not null,
        cover_letter text,
        email varchar(255),
        first_name varchar(255),
        last_name varchar(255),
        phone_number varchar(255),
        date_applied timestamp,
        job_id int4,
        resume_id int4,
        seeker_id int4,
        primary key (app_id)
    );

    create table authorities (
        user_id int4 not null,
        role varchar(255)
    );

    create table degrees (
        degree_id int4 not null,
        education_level varchar(255),
        date_end timestamp,
        major varchar(255),
        school varchar(255),
        date_start timestamp,
        user_id int4,
        primary key (degree_id)
    );

    create table employer_reviews (
        employer_review_id int4 not null,
        employer_review varchar(255),
        employer_id int4,
        user_id int4,
        primary key (employer_review_id)
    );

    create table favorites (
        job_id int4 not null,
        user_id int4 not null
    );

    create table job_postings (
        job_id int4 not null,
        date_closed timestamp,
        date_posted timestamp,
        enabled boolean default true,
        opened boolean default true,
        job_description text,
        job_title varchar(255),
        location varchar(255),
        contact_email varchar(255),
        contact_first_name varchar(255),
        contact_title varchar(255),
        contact_last_name varchar(255),
        contact_phone varchar(255),
        salary int4,
        website varchar(255),
        employer_id int4,
        primary key (job_id)
    );

    create table job_reviews (
        job_review_id int4 not null,
        job_review varchar(255),
        job_id int4,
        user_id int4,
        primary key (job_review_id)
    );

    create table jobs_applied (
        job_id int4 not null,
        user_id int4 not null
    );

    create table resumes (
        resume_id int4 not null,
        file_data bytea,
        name varchar(255),
        file_name varchar(255),
        file_path varchar(255),
        upload_date timestamp,
        user_id int4,
        primary key (resume_id)
    );

    create table user_phones (
        user_id int4 not null,
        phone varchar(255)
    );

    create table users (
        user_type varchar(31) not null,
        user_id int4 not null,
        city varchar(255),
        state varchar(255),
        street varchar(255),
        zip varchar(255),
        email varchar(255),
        enabled boolean not null,
        employer_name varchar(255),
        first_name varchar(255),
        last_name varchar(255),
        password varchar(255) not null,
        reported boolean not null,
        supress_contact boolean,
        username varchar(255) not null,
        employer_website varchar(255),
        current_job_title varchar(255),
        experience text,
        is_notified boolean,
        keywords varchar(255),
        primary key (user_id)
    );

    alter table users
        add constraint UK_r43af9ap4edm43mmtq01oddj6 unique (username);

    alter table applications
        add constraint FKskjjnjxbf1ir89jh5ts9mh0p4
        foreign key (job_id)
        references job_postings;

    alter table applications
        add constraint FKbhnfs5wwy14wdm2f1wam8qkhf
        foreign key (resume_id)
        references resumes;
    
    alter table applications 
        add constraint FKbipd4utha945ggyvtsyair097 
        foreign key (seeker_id) 
        references users;

    alter table authorities
        add constraint FKk91upmbueyim93v469wj7b2qh
        foreign key (user_id)
        references users;

    alter table degrees
        add constraint FKbl34awt7dptaxwwwifbj1sn1q
        foreign key (user_id)
        references users;

    alter table employer_reviews
        add constraint FKcdpvu4cr5ws90fash60xife7g
        foreign key (employer_id)
        references users;

    alter table employer_reviews
        add constraint FK86k1w8enbn7sra4r5p9v2pg94
        foreign key (user_id)
        references users;

    alter table favorites
        add constraint FKk7du8b8ewipawnnpg76d55fus
        foreign key (user_id)
        references users;

    alter table favorites
        add constraint FK5lfwy7d3x413b8qf89vryg3ce
        foreign key (job_id)
        references job_postings;

    alter table job_postings
        add constraint FKj4agtqmtm23giac4xnr0hilnx
        foreign key (employer_id)
        references users;

    alter table job_reviews
        add constraint FKpu8955mlgpc7mdorismea43bk
        foreign key (job_id)
        references job_postings;

    alter table job_reviews
        add constraint FK1kbkloahpup1tjoriwq38mfj7
        foreign key (user_id)
        references users;

    alter table jobs_applied
        add constraint FKa854477pp1picvjugj8t5m720
        foreign key (user_id)
        references users;

    alter table jobs_applied
        add constraint FK7vagh5oswjxnawgb30asknx4o
        foreign key (job_id)
        references job_postings;

    alter table resumes
        add constraint FK340nuaivxiy99hslr3sdydfvv
        foreign key (user_id)
        references users;

    alter table user_phones
        add constraint FKnup2o0u3x7dudj4ky81oiio13
        foreign key (user_id)
        references users;

    insert into users (user_type, user_id, city, state, street,
                       zip, email, enabled, first_name,
                       last_name, password, reported, username,
                       current_job_title, experience, supress_contact, is_notified, keywords) values
                      ('SEEKER', 1, 'New Brunswick', 'NJ', '467 Durham Court',
                       '08901', 'loc.truong@testemail.com', true, 'Loc',
                       'Truong', 'password@1', false, 'loc',
                       'Software Engineering', '4 years', false, true, 'engineer, assistant, accountant');

    insert into users (user_type, user_id, city, state, street,
                       zip, email, enabled, first_name,
                       last_name, password, reported, username,
                       current_job_title, experience, supress_contact, is_notified, keywords) values
                      ('SEEKER', 2, 'Henderson', 'KY', '398 Augusta Drive',
                       '42420', 'steve.shim@testemail.com', true, 'Steve',
                       'Shim', 'password@1', false, 'steve',
                       'Software Engineering', '5 years', false, true, 'receptionist, taxi, driver');

    insert into users (user_type, user_id, city, state, street,
                       zip, email, enabled, first_name,
                       last_name, password, reported, username,
                       employer_website, employer_name, supress_contact) values
                      ('EMPLOYER', 3, 'Cambridge', 'MA', '852 Ridge Road',
                       '02138', 'jordan.ton@testemail.com', true, 'Jordan',
                       'Ton', 'password@1', false, 'jordan',
                       'www.google.com/career', 'Google', false);

    insert into users (user_type, user_id, city, state, street,
                       zip, email, enabled, first_name,
                       last_name, password, reported, username,
                       employer_website, employer_name, supress_contact) values
                      ('EMPLOYER', 4, 'Hackensack', 'NJ', '225 Woodland Avenue',
                       '07601', 'james.sunthonlap@testemail.com', true, 'James',
                       'Sunthonlap', 'password@1', false, 'james',
                       'www.nasa.gov/career', 'NASA', false);

    insert into users (user_type, user_id, city, state, street,
                       zip, email, enabled, first_name,
                       last_name, password, reported, username,
                       current_job_title, supress_contact) values
                      ('ADMIN', 5, 'LA', 'CA', '5154 State University Drive',
                       '90032', 'cy.sun@csula.edu', true, 'Chengyu',
                       'Sun', 'password@1', false, 'cysun',
                       'System Administrator', false);

    insert into authorities values
    	(1, 'ROLE_SEEKER'),
    	(2, 'ROLE_SEEKER'),
    	(3, 'ROLE_EMPLOYER'),
    	(4, 'ROLE_EMPLOYER'),
    	(5, 'ROLE_ADMIN');

    insert into job_postings (enabled, opened, job_id, date_closed, date_posted, job_description, job_title, location, contact_email, contact_first_name, contact_title, contact_last_name, contact_phone, salary, website, employer_id)
	  values (true, true, 1, null, null, 'We are looking for a full-stack engineer with solid front end experience. You must be passionate about APIs and services, and competent in the data that support them. You will be developing, supporting and enhancing Web and internal applications.',
            'Software Engineer', 'Dallas, TX', 'joe@nasa.hr.gov', 'joe', 'software engineer', 'smith', '999-955-5555', 200000, 'www.nasa.gov', 4);

    insert into job_postings (enabled, opened, job_id, date_closed, date_posted, job_description, job_title, location, contact_email, contact_first_name, contact_title, contact_last_name, contact_phone, salary, website, employer_id)
	  values (true, true, 2, null, null, 'Qualifications:
            SolidWorks (SCWP preferred)
            BSME preferred or CSWP with strong skills
            3-5 years Machine Design
            Strong GD&T
            Assembly & Tooling design
            Knowledge of EPDM
            Responsibilities:

            Create detailed solid models of assemblies
            Participate in configuration meetings
            Follow drawings thru final release',
            'Mechanical Engineer', 'Los Angeles, CA', 'joe@nasa.hr.gov', 'joe', 'Engineering Boss', 'smith', '999-955-5555', 120000, 'www.nasa.gov', 4);


    insert into job_postings (enabled, opened, job_id, date_closed, date_posted, job_description, job_title, location, contact_email, contact_first_name, contact_title, contact_last_name, contact_phone, salary, website, employer_id)
	  values (true, false, 3, null, null, 'Analytical Linguists work across Google to drive improvements in quality, classification,
            information structure, and natural language understanding and generation. As an Analytical Linguist you
            will work both on complex projects spanning multiple products, groups, and disciplines, and on tightly
            focused efforts to produce specific product components or answer specific research questions. Analytical
            Linguists work in many different areas and arrive with a wide variety of skills—your specialization might
            involve natural language processing and understanding, phonology, phonetics, syntax, semantics, ontology,
            program management, human subject research, experimental design, statistics, corpus linguistics, large scale
            data acquisition, or any combination. This team is part of some of the most groundbreaking and exciting work
            at Google. It''s our goal to use insights from linguistics and related fields to constantly improve our products.

            As an Analytical Linguist on the Text Classification team, you will collaborate with software engineers, product
            managers and language experts to build high-quality text classifiers for the display advertising ecosystem.
            You will develop taxonomies and category sets, working closely with key stakeholders to understand product r
            equirements. You will set data labeling policies, and design, build, and curate labeled cross-language datasets
            for classifier training and evaluation. You will build and evaluate custom classifiers using state-of-the-art machine
            learning tools and techniques to help Google better understand the web and its users.

			      Users come first at Google. Nowhere is this more important than on our Advertising & Commerce team: we believe
            that ads and commercial information can be highly useful to our users if, and only if, that information is relevant
            to what our users wish to find or do. Hundreds of thousands of advertisers worldwide use AdWords to promote their
            products; hundreds of thousands of publishers use AdSense to serve relevant ads on their website; and business
            around the world use our commerce products (like Google Offers, Google Shopping, and Google Wallet) to support
            their online businesses and bring users into their offline stores. We build and maintain the platforms that have made
            Google what it is today, and are constantly innovating to deliver the most effective advertising and commerce opportunities of tomorrow.',
            'Linguist, Text Classification', 'Los Angeles, TX', 'kelly@google.com', 'Kelly', 'HR', 'Smith', '999-955-5555', 88888, 'www.google.com', 3);

    insert into job_postings (enabled, opened, job_id, date_closed, date_posted, job_description, job_title, location, contact_email, contact_first_name, contact_title, contact_last_name, contact_phone, salary, website, employer_id)
	  values (true, true, 4, null, null, 'YouTube''s Technology Solutions Organization is a global organization dedicated to developing and managing the company''s
            largest and most strategic partnerships. We work closely with the YouTube product, engineering, and content teams to address
            our partners'' most pressing and complex technology challenges. You''ll lead deployments, optimize implementations, and handle
            integrations to build strong, successful, long-term partnerships.

			      As the Head of Content Operations for YouTube, you will manage and lead a team of technically savvy, operations partner liaisons to support
            entertainment and content industry partners, in order to onboard content in a scalable manner. You will collaborate with multiple internal
            stakeholders including Business Development, Product Management, and Engineering to lead and define industry workflow development while
            providing technical and operations support to our networks and digital content providers.

			      YouTube has grown into a community used by over 1 billion people across the globe to access information, share video, and shape culture. 
            The YouTube team helps budding creators build careers, creates products like YouTube Kids, YouTube Music, and YouTube Gaming, and engages
            communities around shared passions and global conversations. Together, we empower the world to create, broadcast, and share.',
            'Head of Content Operations, YouTube', 'Los Angeles, TX', 'kelly@google.com', 'Kelly', 'HR', 'Smith', '999-955-5555', 88888, 'www.google.com', 3);
	
	insert into job_postings (enabled, opened, job_id, date_closed, date_posted, job_description, job_title, location, contact_email, contact_first_name, contact_title, contact_last_name, contact_phone, salary, website, employer_id)
	  values (true, true, 5, null, null, 'Office administrator is responsible for many operations of the company. The individual must be able to diversity his or herself among many different tasks for the company. 
			This position entails working in our accounting software doing basic accounting tasks such as accounts payable, invoicing, entering bills, some accounts receivable, collecting credit card payments from 
			customers, collection calls, processing orders for sales, data entry, filing, answering phones, gathering data for projects and ensuring all information is complete before passing on to the design team, 
			restocking files, some office manager duties, and other various clerical tasks. This position includes being the gatekeeper for other departments and shielding unnecessary phone calls for the different 
			personnel. This position must be proficient in organizational skills, communication, and possess excellent customer services skills.',
            'Receptionist', 'New York, NY', 'hiring@truss.com', 'John', 'Recruiter', 'Smith', '555-555-5555', 25000, 'www.indeed.com', 3);
