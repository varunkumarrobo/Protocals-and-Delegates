protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate :  AdvancedLifeSupport?
    
    
    func assessSituation()  {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency()  {
        delegate?.performCPR()
    }
    
}

struct Paramedic : AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("The Paramedic does chest compressions, 30 per second.")
    }
     
}


class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The Doctor does chest compressions, 30 per second.")
    }
    
    func useStethescope()  {
        print("Listening for heart sounds")
    }
}

class Surgeon: Doctor {
    
    override func performCPR() {
        super.performCPR()
        print("Sings Staying alive by the BeeGeess")
    }
    
    func useElectricDrill()  {
        print("Whirrrr....")
    }
}

let sai = EmergencyCallHandler()
let raj = Paramedic(handler: sai)
let me = Surgeon(handler: sai)
 

sai.assessSituation()
sai.medicalEmergency()





