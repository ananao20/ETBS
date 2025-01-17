// SPDX-License-Identifier: MIT
pragma solidity >= 0.4.21;

import './Roles.sol';

/*The contract defines three role-based variables: 
admin, doctor, and patient. These roles are used to control 
access to certain functions within the contract.*/

contract Contract{

    using Roles for Roles.Role;

    Roles.Role private admin;
    Roles.Role private doctor;
    Roles.Role private patient;

/*The contract defines three struct types: 
 Doctor, Patient, and MedRec (medical record).
 Each struct has a single string member representing the
 IPFS hash of the respective entity's information or record.*/
    struct Doctor{
        string drHash;
    }

    struct Patient{
        string patHash;
    }

    struct MedRec{
        string RecordHash;
    }

    /*The contract uses several mappings to store data. 
    The Doctors mapping maps addresses to Doctor structs, 
    the Patients mapping maps addresses to Patient structs, 
    and the Records mapping maps addresses to MedRec structs.*/

    mapping(address => Doctor) Doctors;
    mapping(address => Patient) Patients;
    mapping(address => MedRec) Records;
    
    /*There are three dynamic arrays: 
    Dr_ids, Patient_ids, and RecordHashes.
     These arrays store the addresses of doctors, patients, 
     and the IPFS hashes of medical records, respectively*/

    address[] public Dr_ids;
    address[] public Patient_ids;
    string[] public RecordHashes;

    address accountId;
    address admin_id;
    address get_patient_id;
    address get_dr_id;

   /*The constructor function initializes the admin role*/
    constructor() {
        admin_id = msg.sender;
        admin.add(admin_id);
    }

    //The contract provides a getAdmin function that returns the address of the admin.
     function getAdmin() public view returns(address){
        return admin_id;
    }


    //Add Doctor

    function addDoctor(address _newdr) public{
        require(admin.has(msg.sender), 'Only For Admin'); 
        doctor.add(_newdr);
    }
    //The contract includes functions to add and delete doctors  
    //These functions require the sender to have the admin role.
    function delDoctor(address docID) public {
        require(admin.has(msg.sender), 'Only For Admin');
        doctor.remove(docID);
    }

   // There are two functions to check if an address belongs to a doctor or a patient: 
   //isDr and isPat. They return a string indicating whether the address belongs to a doctor or a patient, 
   //respectively.

    function isDr(address id) public view returns(string memory){
        require(doctor.has(id), "Only for Doctors");
        return "1";
    }

    // Check is Patient

    function isPat(address id) public view returns(string memory){
        require(patient.has(id), "Only for Doctors");
        return "1";
    }

    //  Add patient

    function addPatient(address _newpatient) external onlyAdmin() {
        patient.add(_newpatient);
    }

    // Get Patient Information => retrun pateint IPFS hash

    function getPatInfo(address iD)public view returns(string memory){
        return (Patients[iD].patHash);
    }

    // Add patient Information to BlockChain

    function addPatInfo(address pat_id, string memory _patInfoHash) public {
        Patient storage patInfo = Patients[pat_id];
        patInfo.patHash = _patInfoHash;
        Patient_ids.push(pat_id);

        patient.add(pat_id);
    }

    // Add Medical record to block chain

    function addMedRecord(string memory _recHash, address _pat_id) public{
        require(doctor.has(msg.sender) == true, 'Only Doctor Can Do That');

        MedRec storage record = Records[_pat_id];
        record.RecordHash = _recHash;
        RecordHashes.push(_recHash);
    }

    // View Medical record return IPFS hash of record
    
    function viewMedRec(address id)public view returns(string memory){
        return (Records[id].RecordHash);
    }

    /*
        Modifiers
    */

    //These modifiers restrict the execution of certain functions to specific roles.
    modifier onlyAdmin(){
        require(admin.has(msg.sender) == true, 'Only Admin Can Do That');
        _;
    }
    modifier onlyDoctor(){
        require(doctor.has(msg.sender) == true, 'Only Doctor Can Do That');
        _;
    }
    modifier onlyPatient(){
        require(patient.has(msg.sender) == true, 'Only Admin Can Do That');
        _;
    }

}