//
//  JobEntry.swift
//  candidate
//
//  Created by shinsuke.tomita@bizreach.co.jp on 2015/02/02.
//  Copyright (c) 2015年 Iwami. All rights reserved.
//

import Foundation

@objc

class JobEntryGen {
    class func genEntryJob(jobId: Int, headerImageViewUrl: String?, logoImgUrl: String, companyName: String, jobName: String) -> JobEntryJob {
        let entryJob = JobEntryJob()
        entryJob.jobId = jobId
        entryJob.jobImgUrl = headerImageViewUrl == nil || headerImageViewUrl == "" ? nil : headerImageViewUrl
        entryJob.companyLogoUrl = logoImgUrl
        entryJob.companyName = companyName
        entryJob.jobName = jobName
        return entryJob
    }
    /*
    class func getEntryJobs() -> [JobEntryJob] {
        var entryJobs = [JobEntryJob]()
        
        if let data = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_JOB_ENTRIES) as? NSData {
            if let unarchived: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithData(data) {
                if let array = unarchived as? [JobEntryJob] {
                    entryJobs = array
                }
            }
        }
        
        return entryJobs
    }*/
}

class JobEntryJob: NSObject {
    var jobId: Int!
    var jobImgUrl: String!
    var companyLogoUrl: String!
    var companyName: String!
    var jobName: String!
    
    override init() {}
    /*
    required init(coder aDecoder: NSCoder) {
        if let v = aDecoder.decodeObjectForKey("jobId") as? Int {
            jobId = v
        }
        if let v = aDecoder.decodeObjectForKey("jobImgUrl") as? String {
            jobImgUrl = v
        }
        if let v = aDecoder.decodeObjectForKey("companyLogoUrl") as? String {
            companyLogoUrl = v
        }
        if let v = aDecoder.decodeObjectForKey("companyName") as? String {
            companyName = v
        }
        if let v = aDecoder.decodeObjectForKey("jobName") as? String {
            jobName = v
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(jobId, forKey: "jobId")
        aCoder.encodeObject(jobImgUrl, forKey: "jobImgUrl")
        aCoder.encodeObject(companyLogoUrl, forKey: "companyLogoUrl")
        aCoder.encodeObject(companyName, forKey: "companyName")
        aCoder.encodeObject(jobName, forKey: "jobName")
    }*/
}


class JobEntry: NSObject {
    var jobId: Int!
    var basicInfo: JobEntryBasicInfo!
    var education: JobEntryEducation!
    var career: JobEntryCareer!
    var skills = [[String : String]]()
    var want: JobEntryWant!
    var pr: String!
    
    override init() {}
    /*
        basicInfo = JobEntryBasicInfo()
        education = JobEntryEducation()
        career = JobEntryCareer()
        want = JobEntryWant()

        if let v = CTUserManager.sharedInstance.getUserArray(CTDef.PREF_SKILLS) {
            if let skills = v as? [[String : String]] {
                self.skills = skills
            }
        }

        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_PR) {
            if let v = obj as? String {
                pr = v
            }
        }
    }
    
    func save() {
        basicInfo.save()
        education.save()
        career.save()
        CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_SKILLS, value: skills)
        CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_PR, value: pr)
    }
    
    required init(coder aDecoder: NSCoder) {
        if let v = aDecoder.decodeObjectForKey("jobId") as? Int {
            jobId = v
        }
        if let v = aDecoder.decodeObjectForKey("basicInfo") as? JobEntryBasicInfo {
            basicInfo = v
        }
        if let v = aDecoder.decodeObjectForKey("education") as? JobEntryEducation {
            education = v
        }
        if let v = aDecoder.decodeObjectForKey("career") as? JobEntryCareer {
            career = v
        }
        if let v = aDecoder.decodeObjectForKey("skills") as? [[String : String]] {
            skills = v
        }
        if let v = aDecoder.decodeObjectForKey("want") as? JobEntryWant {
            want = v
        }
        if let v = aDecoder.decodeObjectForKey("pr") as? String {
            pr = v
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(jobId, forKey: "jobId")
        aCoder.encodeObject(basicInfo, forKey: "basicInfo")
        aCoder.encodeObject(education, forKey: "education")
        aCoder.encodeObject(career, forKey: "career")
        aCoder.encodeObject(skills, forKey: "skills")
        aCoder.encodeObject(want, forKey: "want")
        aCoder.encodeObject(pr, forKey: "pr")
    }
*/
}

enum JobEntryGenderType: Int {
    case Man = 0, Woman
}

class JobEntryBasicInfo: NSObject {
    var lastName: String!
    var firstName: String!
    var lastNameKana: String!
    var firstNameKana: String!
    var tel: String!
    var birthday: NSDate!
    var area: String!
    var gender: JobEntryGenderType!
    
    override init() {}
    /*
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_LAST_NAME) {
            if let v = obj as? String {
                lastName = v
            }
        }
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_FIRST_NAME) {
            if let v = obj as? String {
                firstName = v
            }
        }
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_LAST_NAME_KANA) {
            if let v = obj as? String {
                lastNameKana = v
            }
        }
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_FIRST_NAME_KANA) {
            if let v = obj as? String {
                firstNameKana = v
            }
        }
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_TEL) {
            if let v = obj as? String {
                tel = v
            }
        }
        if let v = CTUserManager.sharedInstance.getUserDate(CTDef.PREF_BIRTHDAY) {
            birthday = v
        }
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_AREA) {
            if let v = obj as? String {
                area = v
            }
        }
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_GENDER) {
            if let v = obj as? Int {
                gender = JobEntryGenderType(rawValue: v)
            }
        }
    }
    
    func save() {
        if lastName != nil {
            CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_LAST_NAME, value: lastName)
        }
        if firstName != nil {
            CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_FIRST_NAME, value: firstName)
        }
        if lastNameKana != nil {
            CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_LAST_NAME_KANA, value: lastNameKana)
        }
        if firstNameKana != nil {
            CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_FIRST_NAME_KANA, value: firstNameKana)
        }
        if tel != nil {
            CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_TEL, value: tel)
        }
        if birthday != nil {
            CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_BIRTHDAY, value: birthday)
        }
        if area != nil {
            CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_AREA, value: area)
        }
        if gender != nil {
            CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_GENDER, value: gender.rawValue)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        if let v = aDecoder.decodeObjectForKey("lastName") as? String {
            lastName = v
        }
        if let v = aDecoder.decodeObjectForKey("firstName") as? String {
            firstName = v
        }
        if let v = aDecoder.decodeObjectForKey("lastNameKana") as? String {
            lastNameKana = v
        }
        if let v = aDecoder.decodeObjectForKey("firstNameKana") as? String {
            firstNameKana = v
        }
        if let v = aDecoder.decodeObjectForKey("tel") as? String {
            tel = v
        }
        if let v = aDecoder.decodeObjectForKey("birthday") as? NSDate {
            birthday = v
        }
        if let v = aDecoder.decodeObjectForKey("area") as? String {
            area = v
        }
        if let v = aDecoder.decodeObjectForKey("gender") as? Int {
            gender = JobEntryGenderType(rawValue: v)
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(lastName, forKey: "lastName")
        aCoder.encodeObject(firstName, forKey: "firstName")
        aCoder.encodeObject(lastNameKana, forKey: "lastNameKana")
        aCoder.encodeObject(firstNameKana, forKey: "firstNameKana")
        aCoder.encodeObject(tel, forKey: "tel")
        aCoder.encodeObject(birthday, forKey: "birthday")
        aCoder.encodeObject(area, forKey: "area")
        aCoder.encodeObject(gender.rawValue, forKey: "gender")
    }
*/
}

class JobEntryEducation: NSObject {
    var educationType: Int!
    var educationName: String!
    var graduationDate: NSDate!
    var expectGraduation = false
    var dropout = false
    var toeicScore: Int!
    var englishReading = false
    var englishMail = false
    var englishPresentaion = false
    var englishWriting = false
    var englishInterpretation = false
    var englishNegotiation = false
    
    override init() {}
    /*
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_EDUCATION_TYPE) {
            if let v = obj as? Int {
                educationType = v
            }
        }
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_EDUCATION_NAME) {
            if let v = obj as? String {
                educationName = v
            }
        }
        if let v = CTUserManager.sharedInstance.getUserDate(CTDef.PREF_GRADUATION_DATE) {
            graduationDate = v
        }
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_EXPECT_GRADUATION) {
            if let v = obj as? Bool {
                expectGraduation = v
            }
        }
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_DROPOUT) {
            if let v = obj as? Bool {
                dropout = v
            }
        }
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_TOEIC) {
            if let v = obj as? Int {
                toeicScore = v
            }
        }
        if let v = CTUserManager.sharedInstance.getUserArray(CTDef.PREF_ENGLISH_SKILLS) {
            if let skills = v as? [String] {
                englishReading = contains(skills, "1") ? true : false
                englishMail = contains(skills, "2") ? true : false
                englishPresentaion = contains(skills, "4") ? true : false
                englishWriting = contains(skills, "8") ? true : false
                englishInterpretation = contains(skills, "16") ? true : false
                englishNegotiation = contains(skills, "32") ? true : false
            }
        }
    }
    
    func save() {
        CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_EDUCATION_TYPE, value: educationType)
        CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_EDUCATION_NAME, value: educationName)
        CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_GRADUATION_DATE, value: graduationDate)
        CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_EXPECT_GRADUATION, value: expectGraduation)
        CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_DROPOUT, value: dropout)
        CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_TOEIC, value: toeicScore)
        
        var skills = [String]()
        if englishReading {
            skills.append("1")
        }
        if englishMail {
            skills.append("2")
        }
        if englishPresentaion {
            skills.append("4")
        }
        if englishWriting {
            skills.append("8")
        }
        if englishInterpretation {
            skills.append("16")
        }
        if englishNegotiation {
            skills.append("32")
        }
        CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_ENGLISH_SKILLS, value: skills)
    }
    
    required init(coder aDecoder: NSCoder) {
        if let v = aDecoder.decodeObjectForKey("educationType") as? Int {
            educationType = v
        }
        if let v = aDecoder.decodeObjectForKey("educationName") as? String {
            educationName = v
        }
        if let v = aDecoder.decodeObjectForKey("graduationDate") as? NSDate {
            graduationDate = v
        }
        if let v = aDecoder.decodeObjectForKey("expectGraduation") as? Bool {
            expectGraduation = v
        }
        if let v = aDecoder.decodeObjectForKey("dropout") as? Bool {
            dropout = v
        }
        if let v = aDecoder.decodeObjectForKey("toeicScore") as? Int {
            toeicScore = v
        }
        if let v = aDecoder.decodeObjectForKey("englishReading") as? Bool {
            englishReading = v
        }
        if let v = aDecoder.decodeObjectForKey("englishMail") as? Bool {
            englishMail = v
        }
        if let v = aDecoder.decodeObjectForKey("englishPresentaion") as? Bool {
            englishPresentaion = v
        }
        if let v = aDecoder.decodeObjectForKey("englishWriting") as? Bool {
            englishWriting = v
        }
        if let v = aDecoder.decodeObjectForKey("englishInterpretation") as? Bool {
            englishInterpretation = v
        }
        if let v = aDecoder.decodeObjectForKey("englishNegotiation") as? Bool {
            englishNegotiation = v
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(educationType, forKey: "educationType")
        aCoder.encodeObject(educationName, forKey: "educationName")
        aCoder.encodeObject(graduationDate, forKey: "graduationDate")
        aCoder.encodeObject(expectGraduation, forKey: "expectGraduation")
        aCoder.encodeObject(dropout, forKey: "dropout")
        aCoder.encodeObject(toeicScore, forKey: "toeicScore")
        aCoder.encodeObject(englishReading, forKey: "englishReading")
        aCoder.encodeObject(englishMail, forKey: "englishMail")
        aCoder.encodeObject(englishPresentaion, forKey: "englishPresentaion")
        aCoder.encodeObject(englishWriting, forKey: "englishWriting")
        aCoder.encodeObject(englishInterpretation, forKey: "englishInterpretation")
        aCoder.encodeObject(englishNegotiation, forKey: "englishNegotiation")
    }
*/
}

class JobEntryCareer: NSObject {
    var jobTypes = [String]()
    var businessTypes = [String]()
    var companies = [JobEntryCareerCompany]()
    
    override init() {}
    /*
        if let v = CTUserManager.sharedInstance.getUserArray(CTDef.PREF_JOB_TYPES) {
            if let jobTypes = v as? [String] {
                self.jobTypes = jobTypes
            }
        }
        if let v = CTUserManager.sharedInstance.getUserArray(CTDef.PREF_BUSINESS_TYPES) {
            if let businessTypes = v as? [String] {
                self.businessTypes = businessTypes
            }
        }
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_COMPANIES) {
            if let data = obj as? NSData {
                if let unarchived: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithData(data) {
                    if let array = unarchived as? NSArray {
                        for e in array {
                            if let careerCompany = e as? JobEntryCareerCompany {
                                self.companies.append(careerCompany)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func save() {
        if !jobTypes.isEmpty {
            CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_JOB_TYPES, value: jobTypes)
        }
        if !businessTypes.isEmpty {
            CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_BUSINESS_TYPES, value: businessTypes)
        }
        if !companies.isEmpty {
            let data = NSKeyedArchiver.archivedDataWithRootObject(companies)
            CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_COMPANIES, value: data)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        if let v = aDecoder.decodeObjectForKey("jobTypes") as? [String] {
            jobTypes = v
        }
        if let v = aDecoder.decodeObjectForKey("businessTypes") as? [String] {
            businessTypes = v
        }
        if let v = aDecoder.decodeObjectForKey("companies") as? [JobEntryCareerCompany] {
            companies = v
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(jobTypes, forKey: "jobTypes")
        aCoder.encodeObject(businessTypes, forKey: "businessTypes")
        aCoder.encodeObject(companies, forKey: "companies")
    }
*/
}

class JobEntryCareerCompany: NSObject {
    var companyName: String!
    var position: String!
    var employType: String!
    var startDate: NSDate!
    var endDate: NSDate!
    var isPresent = false
    var incomeType: String!
    var managementSize: String!
    var content: String!
    
    override init() {}
    /*
    required init(coder aDecoder: NSCoder) {
        if let v = aDecoder.decodeObjectForKey("companyName") as? String {
            companyName = v
        }
        if let v = aDecoder.decodeObjectForKey("position") as? String {
            position = v
        }
        if let v = aDecoder.decodeObjectForKey("employType") as? String {
            employType = v
        }
        if let v = aDecoder.decodeObjectForKey("startDate") as? NSDate {
            startDate = v
        }
        if let v = aDecoder.decodeObjectForKey("endDate") as? NSDate {
            endDate = v
        }
        if let v = aDecoder.decodeObjectForKey("isPresent") as? Bool {
            isPresent = v
        }
        if let v = aDecoder.decodeObjectForKey("incomeType") as? String {
            incomeType = v
        }
        if let v = aDecoder.decodeObjectForKey("managementSize") as? String {
            managementSize = v
        }
        if let v = aDecoder.decodeObjectForKey("content") as? String {
            content = v
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(companyName, forKey: "companyName")
        aCoder.encodeObject(position, forKey: "position")
        aCoder.encodeObject(employType, forKey: "employType")
        aCoder.encodeObject(startDate, forKey: "startDate")
        aCoder.encodeObject(endDate, forKey: "endDate")
        aCoder.encodeObject(isPresent, forKey: "isPresent")
        aCoder.encodeObject(incomeType, forKey: "incomeType")
        aCoder.encodeObject(managementSize, forKey: "managementSize")
        aCoder.encodeObject(content, forKey: "content")
    }
*/
}

class JobEntryWant: NSObject {
    var wantIncomeType: String!
    var wantAreas = [String]()
    var wantJobTypes = [String]()
    var wantBusinessTypes = [String]()
    
    override init() {}
    /*
        if let obj: AnyObject = CTUserManager.sharedInstance.getUserValue(CTDef.PREF_WANT_INCOME_TYPE) {
            if let v = obj as? String {
                wantIncomeType = v
            }
        }
        if let v = CTUserManager.sharedInstance.getUserArray(CTDef.PREF_WANT_AREA_CDS) {
            if let areaCds = v as? [String] {
                wantAreas = areaCds
            }
        }
        if let v = CTUserManager.sharedInstance.getUserArray(CTDef.PREF_WANT_JOB_TYPES) {
            if let jobTypes = v as? [String] {
                wantJobTypes = jobTypes
            }
        }
        if let v = CTUserManager.sharedInstance.getUserArray(CTDef.PREF_WANT_BUSINESS_TYPES) {
            if let businessTypes = v as? [String] {
                wantBusinessTypes = businessTypes
            }
        }
    }
    
    func save() {
        CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_WANT_INCOME_TYPE, value: wantIncomeType)
        CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_WANT_AREA_CDS, value: wantAreas)
        CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_WANT_JOB_TYPES, value: wantJobTypes)
        CTUserManager.sharedInstance.setUserDefaultValue(CTDef.PREF_WANT_BUSINESS_TYPES, value: wantBusinessTypes)
    }
    
    required init(coder aDecoder: NSCoder) {
        if let v = aDecoder.decodeObjectForKey("wantIncomeType") as? String {
            wantIncomeType = v
        }
        if let v = aDecoder.decodeObjectForKey("wantAreas") as? [String] {
            wantAreas = v
        }
        if let v = aDecoder.decodeObjectForKey("wantJobTypes") as? [String] {
            wantJobTypes = v
        }
        if let v = aDecoder.decodeObjectForKey("wantBusinessTypes") as? [String] {
            wantBusinessTypes = v
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(wantIncomeType, forKey: "wantIncomeType")
        aCoder.encodeObject(wantAreas, forKey: "wantAreas")
        aCoder.encodeObject(wantJobTypes, forKey: "wantJobTypes")
        aCoder.encodeObject(wantBusinessTypes, forKey: "wantBusinessTypes")
    }
*/
}

