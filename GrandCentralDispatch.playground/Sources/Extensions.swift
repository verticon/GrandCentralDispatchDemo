import UIKit

public extension UIColor {
    func toImage() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1);
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        context?.setFillColor(cgColor);
        context?.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!;
    }
}

public extension UIButton {
    public func setBackgroundColor(_ color: UIColor?, forState state: UIControlState) {
        if let color = color {
            setBackgroundImage(color.toImage(), for: state)
        }
        else {
            setBackgroundImage(nil, for: state)
        }
    }
}
