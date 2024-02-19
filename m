Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5EFC48BF8
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 13:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/02XXdPy+y0fOEfVNKIurhCjpUMpw4s8xpSYwH1/Sq0=; b=4iPRI3YzVe4rfxEm351KvSI9aS
	D5PaW2fGTEWSK4X1eEdtUf2uqufzfJ4YF0puX8o5XM0hpcxHALAqKLxpIIZn854QDxA8mS/pzWF40
	vI4oKp771E5GT9Jjsvts0zdP2KmDqaBZ2nnUzz3ZwQkp0qmySO/tJpP/QyFcsnEBT9/PLugm5Jgvx
	atUbEGEP6KT4QdNzsVZAls78m6iAviC8V+n+qjE7hqrsckiNbMx4f+npA+WhgzuLZ2z4WT5l3Wx2Q
	3gV1EaItaKQFlNIgd3GkGQXCekeQXiY9A62kExZwo7KTvvOH1Gp5BjZgNnHBUOddgMlsz8VmKMGym
	yG1nqXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3PH-0000000AZOX-0XPc;
	Mon, 19 Feb 2024 13:10:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3PD-0000000AZNg-3KgC;
	Mon, 19 Feb 2024 13:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1882960CA0;
	Mon, 19 Feb 2024 13:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EDBC433F1;
	Mon, 19 Feb 2024 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708348198;
	bh=k5TNufpc0mt238MgA9peaFyPF3x2XkPTs3yJlexbqc8=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=DiAzv/1CMc3jGZTMOGaIY2Ot0txSrWDroCMW9Sc5PQBqGlPv3vkQ0roK2ejHzATwh
	 BOthJYdWbDotuVA3O3hWdZlGEU2EJ+YY03oqokg8Tpli4MB60tX0UdbZDkSASdq835
	 eMuP2LufX2Zjswb/xJlj/w6IVnIzeWvuJPfsughf+SVGefT2P7vpN8bLTJt0ATf0z0
	 eVMFjBAN6rEufmtaY4rGX7eJ5/Xx6XOeDQnba9wy4d2fnIehog2uHrnZbkJq0Yjfdk
	 0VuqdLVpFj+vvM5pAor02LzyIe9yO1xNE6EURFn8qZRxIYmkeWUdHPyJGe8DQx/dtG
	 ZeAV6Mld1w6GA==
Content-Type: multipart/signed;
 boundary=4e6de2f2044b4821084fdffed5f39c09a727c7d987a0357bd10091ca705f;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 19 Feb 2024 14:09:49 +0100
Message-Id: <CZ92W3VSYV1A.1693O76GY1XDP@kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200
Cc: <devicetree@vger.kernel.org>, "Sean Wang" <sean.wang@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
X-Mailer: aerc 0.16.0
References: <20240219084456.1075445-1-mwalle@kernel.org>
 <20240219084456.1075445-2-mwalle@kernel.org>
 <2ad6bda8-a457-421b-b35d-dc005fb00ae9@collabora.com>
In-Reply-To: <2ad6bda8-a457-421b-b35d-dc005fb00ae9@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_051000_140206_BBE864D9 
X-CRM114-Status: GOOD (  35.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--4e6de2f2044b4821084fdffed5f39c09a727c7d987a0357bd10091ca705f
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

thanks for the extensive review!

On Mon Feb 19, 2024 at 11:00 AM CET, AngeloGioacchino Del Regno wrote:

> > +&eth {
> > +	phy-mode =3D"rgmii-id";
> > +	phy-handle =3D <&ethernet_phy0>;
> > +	snps,reset-gpio =3D <&pio 93 GPIO_ACTIVE_HIGH>;
> > +	snps,reset-delays-us =3D <0 10000 80000>;
>
> snps,reset-delays-us and snps,reset-gpio are deprecated.
>
> > +	pinctrl-names =3D "default", "sleep";
> > +	pinctrl-0 =3D <&eth_default_pins>;
> > +	pinctrl-1 =3D <&eth_sleep_pins>;
> > +	status =3D "okay";
> > +
> > +	mdio {
> > +		ethernet_phy0: ethernet-phy@1 {
>
> compatible =3D "is there any applicable compatible?"
> P.S.: if you've got the usual rtl8211f, should be "ethernet-phy-id001c.c9=
16"

I'd rather not have a compatible here. First, it's auto discoverable
and IIRC it's frowned upon adding any compatible if you ask the PHY
maintainers. And second, if we change the PHY (maybe due to a second
chip shortage or whatever), there is a chance you don't have to
update this in the DT.

> reg =3D <0x1>;
> interrupts-extended =3D <&pio 94 IRQ_TYPE_LEVEL_LOW>;
> reset-assert-us =3D <10000>;
> reset-deassert-us =3D <80000>;
> reset-gpios =3D <&pio 93 GPIO_ACTIVE_HIGH>;
>
>
> > +			reg =3D <0x1>;
> > +			interrupts-extended =3D <&pio 94 IRQ_TYPE_LEVEL_LOW>;
> > +		};
> > +	};
> > +};
> > +
> > +&gpu {
> > +	status =3D "okay";
> > +	mali-supply =3D <&mt6315_7_vbuck1>;
> > +};
> > +
> > +&i2c2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&i2c2_pins>;
> > +	clock-frequency =3D <400000>;
> > +	status =3D "okay";
>
> Are i2c2,3,4 exposed as pins somewhere? If they are, can you please put a
> comment saying so?

This is only a basic device tree. On one i2c controller, there is
the LVDS bridge for example. My plan is to get the support for this
bridge upstream first and then adding the appropriate device nodes
here.

That being said, some are exposed to connectors. I'll add a comment
then.

> > +&mmc1 {
> > +	pinctrl-names =3D "default", "state_uhs";
> > +	pinctrl-0 =3D <&mmc1_default_pins>;
> > +	pinctrl-1 =3D <&mmc1_uhs_pins>;
> > +	cd-gpios =3D <&pio 129 GPIO_ACTIVE_LOW>;
> > +	bus-width =3D <4>;
> > +	max-frequency =3D <200000000>;
> > +	cap-sd-highspeed;
> > +	sd-uhs-sdr50;
> > +	sd-uhs-sdr104;
> > +	vmmc-supply =3D <&mt6360_ldo5>;
> > +	vqmmc-supply =3D <&mt6360_ldo3>;
>
> Does mmc1 support eMMC and SDIO?

No eMMC, but I'd guess it will support SDIO as in you can just plug
an SDIO card in the SD slot, right? Oh, it's a micro SD socket. So
uhm, I'm not sure if we should restrict it, though. Someone might
come up with a microsd to sd card adapter. I have one right in front
of me ;)

> If not, no-mmc; no-sdio;

So no-mmc;

> > +			drive-strength =3D <MTK_DRIVE_8mA>;
>
> s/MTK_DRIVE//g
> s/mA//g
>
> drive-strength =3D <8>;
>
> Please, here and everywhere else, for all values - let's stop using those
> MTK_DRIVE_(x)mA definitions, they're just defined as (x), where anyway
> the drive-strength property is in milliamps by default.
>
> We don't need these definitions.

Sure, the mt8195-demo was the blueprint for this. So maybe you should
get rid of it there to prevent any copying ;) (btw the same goes for
the regulator-compatible property).

Speaking of pinctrl, I find the R0R1 bias-pull-down values really
hard to grasp. The DT binding documentation didn't really help here.
What is R0 and R1, I presume some resistors which can be enabled.
Also are they in parallel or in series. I'd have assumed, the DT
binding should have hid this by giving the user a choice for the
resistance instead. Also I had a quick search in the RM and
couldn't find anything, I probably looked at the wrong place ;)

> > +	uart1_pins: uart1-pins {
> > +		pins_rx {
> > +			pinmux =3D <PINMUX_GPIO103__FUNC_URXD1>;
> > +			input-enable;
> > +			bias-pull-up;
> > +		};
> > +
> > +		pins_tx {
> > +			pinmux =3D <PINMUX_GPIO102__FUNC_UTXD1>;
> > +		};
> > +
> > +		pins_rts {
> > +			pinmux =3D <PINMUX_GPIO100__FUNC_URTS1>;
> > +			output-enable;
>
> Are you really sure that you need output-enable here?!
> RTS is not an output buffer....
>
> I don't think you do. Please double check.

Ahh, good catch, it's a leftover from mt8183-kukui.dts. There is
probably wrong, too.

> > +		};
> > +
> > +		pins_cts {
> > +			pinmux =3D <PINMUX_GPIO101__FUNC_UCTS1>;
> > +			input-enable;
> > +		};
> > +	};
> > +


> > +/* USB3 front port */
> > +&xhci0 {
>
> It's not gonna work like this. I recently fixed the USB nodes in MT8195 b=
y adding
> MTU3 where necessary...

Uhm, seems like I've missed that.

> Check mt8195.dtsi - only one XHCI controller isn't placed behind MTU3, an=
d that is
> XHCI1 (11290000), while the others are MTU3.
>
> As far as I can see from this DT, it should now instead look like..
>
> &ssusb0 {
> 	dr_mode =3D "host";
> 	vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> 	status =3D "okay";
> };
>
> &ssusb2 {
> 	dr_mode =3D "host";
> 	vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> 	status =3D "okay";
> };
>
> &ssusb3 {
> 	dr_mode =3D "host";
> 	vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> 	status =3D "okay";
> };
>
> &xhci0 {
> 	vbus-supply =3D <&otg_vbus_regulator>;
> 	status =3D "okay";
> };
>
> &xhci1 {
> 	vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
>
> vbus is always supplied by something, as otherwise USB won't work - wheth=
er this
> is an always-on regulator or a passthrough from external supply this does=
n't really
> matter - you should model a regulator-fixed that provides the 5V VBUS lin=
e.

I don't think this is correct, though. Think of an on-board USB
hub. There only D+/D- are connected (and maybe the USB3.2 SerDes
lanes). Or have a look at the M.2 pinout. There is no Vbus.

Also it seems I need the "mediatek,u3p-dis-msk =3D <0x01>;". At least
the last time I've tested it. I'll test it again, with and without.
The SerDes Line of the corresponding USB3.2 port is used for PCIe in
this case.

> For example:
> 	vbus_fixed: regulator-vbus {
> 		compatible =3D "regulator-fixed";
> 		regulator-name =3D "usb-vbus";
> 		regulator-always-on;
> 		regulator-boot-on;
> 		regulator-min-microvolt =3D <5000000>;
> 		regulator-max-microvolt =3D <5000000>;
> 	};

As mentioned above, I don't think this will make sense in my case.

> P.S.: If the rail has a different name, please use that different name. O=
bviously
> that requires you to have schematics at hand, and I don't know if you do:=
 if you
> don't, then that regulator-vbus name is just fine.

I do have the schematics.

Thanks,
-michael

--4e6de2f2044b4821084fdffed5f39c09a727c7d987a0357bd10091ca705f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZdNTHRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvt+eAD/XERn5niUygUAWzyTGskjJ/nv8RLKqPhO
w3ZlstgPMogA/R6qsbb6/Ah3FySxTjZIR4vqQ/k7mZ4pukKPsEuOQkEI
=G6rt
-----END PGP SIGNATURE-----

--4e6de2f2044b4821084fdffed5f39c09a727c7d987a0357bd10091ca705f--

