console.clear();
console.log("\n\n", "~~~~   =====  Script Started  =====   ~~~~", "\n");

const wait = (seconds) => new Promise((res, rej) => setTimeout(res, seconds * 1000));

import { Client } from 'pg'

const client = new Client({
    user: "umairanwar",
    password: "umairanwar",
    host: "localhost",
    port: 5432,
    database: "practice"
}); 

try {
    await client.connect();
} catch (err) {
    console.error("Error: Client couldn't connect.");
    process.exit(-1);
}

try {

	let student_id = (await client.query("SELECT MAX(student_id)::INT AS max FROM students")).rows[0].max + 1;
	let departments = ['Cyber Security', 'Chemical Engineering', 'Management Sciences', 'Computer Science', 'Mechanical Engineering'];
	
	for (let i = 1; i <= 500; i++) {
		let query = `INSERT INTO students (student_id, name, department, gpa) VALUES `;
		for (let j = 0; j < 100000; j++) {
			const dept = departments[Math.floor(Math.random() * departments.length)];
			query += ` (${student_id}, 'Student # ${student_id}', '${dept}', ${Math.round(Math.random()*300 + 100)/100}),`;
			student_id++;
		}
		query = query.slice(0, -1) + ";";
		await client.query(query);
		console.log(`\nPhase ${i} Completed\n`);
		if (i % 50 === 0) {
			console.log(`\n==== Waiting ====\n`);
			await wait(15);
		}
	}



} catch (err) {
    console.error("Error: Couldn't insert users.");
    process.exit(-3);
}

try {
    await client.end();
} catch (err) {
    console.warn("Warning: Couldn't end the client connection.");
    process.exit(-4);
}

console.log("\n", "~~~~   =====  Script Ended  =====   ~~~~", "\n");