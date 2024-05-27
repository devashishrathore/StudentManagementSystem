package sms.model;

public class Student {

	private int studentId;
	private String fullName;
	private String phoneNo;
	private String fees;
	private String location;
	private String highestEducation;
	private String previousExperience;
	private String group;
	private String mockScore;

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getFees() {
		return fees;
	}

	public void setFees(String fees) {
		this.fees = fees;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getHighestEducation() {
		return highestEducation;
	}

	public void setHighestEducation(String highestEducation) {
		this.highestEducation = highestEducation;
	}

	public String getPreviousExperience() {
		return previousExperience;
	}

	public void setPreviousExperience(String previousExperience) {
		this.previousExperience = previousExperience;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getMockScore() {
		return mockScore;
	}

	public void setMockScore(String mockScore) {
		this.mockScore = mockScore;
	}

	public Student(int studentId, String fullName, String phoneNo, String fees, String location,
			String highestEducation, String previousExperience, String group, String mockScore) {
		super();
		this.studentId = studentId;
		this.fullName = fullName;
		this.phoneNo = phoneNo;
		this.fees = fees;
		this.location = location;
		this.highestEducation = highestEducation;
		this.previousExperience = previousExperience;
		this.group = group;
		this.mockScore = mockScore;
	}

	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", fullName=" + fullName + ", phoneNo=" + phoneNo + ", fees=" + fees
				+ ", location=" + location + ", highestEducation=" + highestEducation + ", previousExperience="
				+ previousExperience + ", group=" + group + ", mockScore=" + mockScore + "]";
	}
}
