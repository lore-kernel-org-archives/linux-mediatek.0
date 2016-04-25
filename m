From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: ARM: Mediatek: add interrupt as
 required properties to the mt6397/mt6323 doc
Date: Mon, 25 Apr 2016 11:57:50 +0100
Message-ID: <20160425105750.GB2713@dell>
References: <1460709030-23820-1-git-send-email-henryc.chen@mediatek.com>
 <1460709030-23820-2-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460709030-23820-2-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <blogic@openwrt.org>, Sascha Hauer <s.hauer@pengutronix.de>, Flora Fu <flora.fu@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 15 Apr 2016, Henry Chen wrote:

> MT6397/MT6323 have one interrupt line connected to the main SoC.
> Interrupt should be required feature of pmic, each sub module also
> need it to complete their function or error detect, add it as
> required properties on dts file.
>=20
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Docum=
entation/devicetree/bindings/mfd/mt6397.txt
> index 949c85f..a96529e 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -15,7 +15,13 @@ Documentation/devicetree/bindings/soc/pwrap.txt
>  This document describes the binding for MFD device and its sub modul=
e.
> =20
>  Required properties:
> -compatible: "mediatek,mt6397" or "mediatek,mt6323"
> +- compatible: "mediatek,mt6397" or "mediatek,mt6323"
> +- interrupts: mt6323/mt6397 have one interrupt line connecteded to t=
he main SoC
> +- interrupt-parent: The parent interrupt controller
> +- interrupt-controller : marks the device node as an interrupt contr=
oller

Nit: All sentences should start with an upper case char.

The device node is not an interrupt controller -- it's a device node.

The device the device node represents is the interrupt controller.

Look at how others describe this property, it's pretty well used.

> +- #interrupt-cells: the number of cells to describe an IRQ, this sho=
uld be 2.

Nit: Captial letter.

> +  The first cell is the IRQ number.
> +  The second cell is the flags, encoded as the trigger masks from
> =20
>  Optional subnodes:
> =20
> @@ -43,6 +49,10 @@ Example:
> =20
>  		pmic {
>  			compatible =3D "mediatek,mt6397";
> +			interrupt-parent =3D <&pio>;
> +			interrupts =3D <11 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> =20
>  			codec: mt6397codec {
>  				compatible =3D "mediatek,mt6397-codec";

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
