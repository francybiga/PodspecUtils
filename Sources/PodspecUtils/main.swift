import PodspecUtilsCore

let utils = PodspecUtils()

do {
    try utils.run()
} catch {
    print("❌ Error! \(error)")
}
