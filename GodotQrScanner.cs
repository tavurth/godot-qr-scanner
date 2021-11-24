using Godot;
using System;

using ZXing;
using ZXing.QrCode;
using ZXing.QrCode.Internal;
using ZXing.Common;

public class GodotQrScanner : VBoxContainer
{
	private Texture GetTextureDebug() {
		TextureRect toReturn = (TextureRect)GetNode("DebugTexture");
		return toReturn.GetTexture();
	}

	private ViewportTexture GetTexture() {
		Viewport toReturn = (Viewport)GetNode("ViewportContainer/Viewport");
		return toReturn.GetTexture();
	}

	public void _on_CaptureButton_pressed()
	{
		byte[] byteArray = GetTexture()
			.GetData()
			.GetData();

		LuminanceSource source = new RGBLuminanceSource(
			byteArray,
			GetTexture().GetWidth(),
			GetTexture().GetHeight()
		);

		var binarizer = new HybridBinarizer(source);
		var binBitmap = new BinaryBitmap(binarizer);

		QRCodeReader qr = new QRCodeReader();

		Result str = qr.decode(binBitmap);

		GD.Print(str);
	}

}
