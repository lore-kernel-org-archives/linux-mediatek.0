Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02268C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKqnVvWrKbpumEWGwVb2BBA8ous3ZkOcrGG6VQ/xtxI=; b=c8gsKmUQO4/bgBpPDc+tvBuBXK
	VEa5Aynq1hSfNUfB8M9pI6SVvRfehDJnUBnwz16reWiKQIaXboYs3jDTvXHExEV1ZZKvQcXh98xMr
	HRNyqT5MM5YDdMBdtKwN3DT56WpWlboPJXYRvAdvKP8eK45ixuFBRXt9AJAm8qWSAYfVA/1cgffZ+
	06Q1zBKwDKDEt1UN5FYCElPDilzeprgkxrUiWbsY+IWCGhzDmOBbOi7mQ0ryhMYEBWND6dRnmN3Md
	6QpPzl7+3J9zJqSN4Lmtk5Koi47oo65ky5kGDBAmSCCMAfbNQXNJ7YJeNU5Xzi+AQYKcW7pn7r5f4
	64XfcNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYqYi-0097Hi-5y; Mon, 28 Mar 2022 14:41:28 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYqYU-0097D5-S8
 for linux-mediatek@lists.infradead.org; Mon, 28 Mar 2022 14:41:17 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u3so20760930wrg.3
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Mar 2022 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G6STbBOIWrl91z9Js/2xSJ69ciuixOh8p5+13N9nge4=;
 b=a5GnlrEop9sH2gZ92j/WZWs0/lNyHPeq+I2GCXEme2z5UgCQFFzPDI6Ig91l4DH3A4
 Oan/w1Fi6hLyIPREiRXoBDxX/6ikfnlrSE4YsrBrzEM2r4J5ptLu7cuabB6wMz70Tcn1
 KugpgwErr2d5lD7wXUTg4ubk4ilEFfDDscDx0dEQNFm5yTLfDa+5cB39WY7XiN8HKCLr
 x64nYBJDDE2ZgJS6qI6ooIURfhFH15B21fUuHpfofDJ60XRxTMuuekOa5oOWyG7EP7nt
 7MzLOMVTo3S/oXdJkD5JjHmws5sJvcKP2d6OfIavkY+LlrDrVORwRrmvND1PZCK4TcwA
 VQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G6STbBOIWrl91z9Js/2xSJ69ciuixOh8p5+13N9nge4=;
 b=34SB89dUyjYQsrpa8Uro9m2ptxyN/VASPE1SmdzxZwp1zGhmtsAAC3UsfZCexPHKTV
 ofFFOHR+10WcwV2DGMoBlEMqL6K0r1HtvByJdM+7BHlC9brKC7dLfBtKbxaDeYJbjlwC
 fQh37bPmjLULcaDBjaNQn1+XyHBXf6tIXeS/n/O/El10WfcIwx6d7k7064BiqM3CVhvZ
 m06/duRAFMFgmIIzaFRynAQGkaopZdjeWZd/FqU0kdu6Y7Nj5Wi3HkGo1+p2lYe7fvAX
 1QxFRfnLCvwlTfoeaRaU6xw6L7OYBKsCgGnR3Bg2AGt5K+Uk0kHUj3lJxfQ+B5MwysW6
 mLlw==
X-Gm-Message-State: AOAM531bPT9iYE4Kt6Y/kQXEStTNNNUPDnGDZUOTsK0l6Jn3OdvLZ10j
 CtMABY9OpPyvYhtb8bmaKgj9mw==
X-Google-Smtp-Source: ABdhPJx8cZc0l3wMABftdDemo3IkUaQ0vbWVZbivcfb5qrdC8JZo7eELfFo6ySf1YkVTWkWGgVo6AA==
X-Received: by 2002:adf:fecf:0:b0:1f0:62e0:bcd8 with SMTP id
 q15-20020adffecf000000b001f062e0bcd8mr24188340wrs.61.1648478473021; 
 Mon, 28 Mar 2022 07:41:13 -0700 (PDT)
Received: from radium ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038c9249ffdesm13591324wmq.9.2022.03.28.07.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 07:41:12 -0700 (PDT)
Date: Mon, 28 Mar 2022 16:41:07 +0200
From: Fabien Parent <fparent@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: mediatek: Add device-tree for MT8195
 Demo board
Message-ID: <20220328144107.ed4xwzuiezzixqrx@radium>
References: <20220327200312.3090515-1-fparent@baylibre.com>
 <20220327200312.3090515-3-fparent@baylibre.com>
 <94d231cf-ce4c-22f5-b9af-41ae68f1e659@collabora.com>
MIME-Version: 1.0
In-Reply-To: <94d231cf-ce4c-22f5-b9af-41ae68f1e659@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_074114_953555_98ACBE7A 
X-CRM114-Status: GOOD (  29.67  )
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
Content-Type: multipart/mixed; boundary="===============3185946571848962747=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3185946571848962747==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xajkuje6fmke6plh"
Content-Disposition: inline


--xajkuje6fmke6plh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2022 at 03:47:09PM +0200, AngeloGioacchino Del Regno wrote:
> Il 27/03/22 22:03, Fabien Parent ha scritto:
> > Add basic device-tree for the MT8195 Demo board. The
> > Demo board is made by MediaTek and has a MT8195 SoC,
> > associated with the MT6359 and MT6360 PMICs, and
> > the MT7921 connectivity chip.
> >=20
> > The IOs available on that board are:
> > * 1 USB Type-C connector with DP aux mode support
> > * 1 USB Type-A connector
> > * 1 full size HDMI RX and 1 full size HDMI TX connector
> > * 1 uSD slot
> > * 40 pins header
> > * SPI interface header
> > * 1 M.2 slot
> > * 1 audio jack
> > * 1 micro-USB port for serial debug
> > * 2 connectors for DSI displays
> > * 3 connectors for CSI cameras
> > * 1 connector for a eDP panel
> > * 1 MMC storage
> >=20
> > This commit adds basic support in order to be able to boot.
> >=20
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> > v2:
> >   * remove empty i2c nodes
> >   * remove empty spi node
> >   * remove unused pcie pinctrls
> >   * fixup node nodes to not contains underscore
> >   * rename mt6360 pmic node
> >   * move mmc1 node right after mmc0 node
> >   * use generic node name for gpio-keys
> >   * uniformize pinctrl node names
> >=20
> >   arch/arm64/boot/dts/mediatek/Makefile        |   1 +
> >   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 447 +++++++++++++++++++
> >   2 files changed, 448 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> >=20
>=20
> ..snip..
>=20
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/=
boot/dts/mediatek/mt8195-demo.dts
> > new file mode 100644
> > index 000000000000..d94b4e01159a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > @@ -0,0 +1,447 @@
>=20
> ..snip..
>=20
> > +
> > +	gpio-keys {
> > +		compatible =3D "gpio-keys";
> > +		input-name =3D "gpio-keys";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&gpio_keys_pins>;
> > +
> > +		key-0 {
>=20
> key-volup is more descriptive, can you please change that?

Which review should I follow, yours or the one from Krzysztof? Because both=
 reviews are contradictory

>=20
> > +			gpios =3D <&pio 106 GPIO_ACTIVE_LOW>;
> > +			label =3D "volume_up";
> > +			linux,code =3D <KEY_VOLUMEUP>;
> > +			wakeup-source;
> > +			debounce-interval =3D <15>;
> > +		};
> > +	};
> > +};
> > +
>=20
> ..snip..
>=20
> > +
> > +&pmic {
> > +	interrupt-parent =3D <&pio>;
> > +	interrupts =3D <222 IRQ_TYPE_LEVEL_HIGH>;
>=20
> I would instead use interrupts-extended here:
>=20
> 	interrupts-extended =3D <&pio 222 IRQ_TYPE_LEVEL_HIGH>;

Thanks, it will be fixed in v3.

>=20
> > +};
> > +
> > +&i2c6 {
> > +	clock-frequency =3D <400000>;
> > +	pinctrl-0 =3D <&i2c6_pins>;
> > +	pinctrl-names =3D "default";
> > +	status =3D "okay";
> > +
> > +	mt6360: pmic@34 {
> > +		compatible =3D "mediatek,mt6360";
> > +		reg =3D <0x34>;
> > +		interrupt-controller;
> > +		interrupt-parent =3D <&pio>;
> > +		interrupts =3D <101 IRQ_TYPE_EDGE_FALLING>;
>=20
> Same here

Thanks, it will be fixed in v3.

>=20
> > +		interrupt-names =3D "IRQB";
> > +
>=20
> ...snip...
>=20
> > +
> > +&pio {
> > +	mmc0_default_pins: mmc0-default-pins {
> > +		pins-cmd-dat {
> > +			pinmux =3D <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
> > +				 <PINMUX_GPIO125__FUNC_MSDC0_DAT1>,
> > +				 <PINMUX_GPIO124__FUNC_MSDC0_DAT2>,
> > +				 <PINMUX_GPIO123__FUNC_MSDC0_DAT3>,
> > +				 <PINMUX_GPIO119__FUNC_MSDC0_DAT4>,
> > +				 <PINMUX_GPIO118__FUNC_MSDC0_DAT5>,
> > +				 <PINMUX_GPIO117__FUNC_MSDC0_DAT6>,
> > +				 <PINMUX_GPIO116__FUNC_MSDC0_DAT7>,
> > +				 <PINMUX_GPIO121__FUNC_MSDC0_CMD>;
> > +			input-enable;
> > +			drive-strength =3D <MTK_DRIVE_6mA>;
> > +			bias-pull-up =3D <MTK_PUPD_SET_R1R0_01>;
> > +		};
> > +
> > +		pin-clk {
>=20
> This is supposed to be "pins-clk", not "pin-clk"... same for all the other
> instances of the "pin-".

There is only one pin in that node, so it should be singular, no?

>=20
> Before pushing patches upstream, please run dtbs_check, as these are all
> mistakes that will be pointed out by that.
>=20
> Regards,
> Angelo
>=20

--xajkuje6fmke6plh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQyJHfU3UNW7IG61XVJKc6g3CeAAFAmJByQIACgkQVJKc6g3C
eABNUg/7Befzz/j+X7NeVFnAtAEQJXYJp//BfXgdGIobco+gZfUKhfUWfETWso/X
W/XkRDtA5Fslnw0dUDo4mxP8uLWNZmqgxcx+4ScM4bEqFqxk4gv1BHSxpQxHIkaJ
OPraNE72+uQneXV3ZaXFI7R6DxZWZPxi1r6aQ7mdxb27/JAKUEnc7IqxSfdcWOVi
3qidD/W8f0dtZy68C1M/6+Pok0O0RO6Z1yO2/BHKLEgSFxWfM6xUId6fKhKu2IIl
EKy+Hc/O50lBp3HrU00ux7G7jYwud/c4jxXUH9m2J5k1acb/MTCilKAUoAIJSvwz
qpI71IarL2V6gEettEGEQ2GpKoTYLRQ7Hu6YCoN05EtKh8MH9l/qECwUIRJ2pgKp
Q8ptn8Qa4ScEcZyKeITwapWIlUmli81sVbo3OUXXYcJneFd8b3mlI+zFAxnBkiqb
wOatUg4tEdc1cTfv0UzZXQ8u2NPMvggLBQNWlPfMX+mn4RkQSfXPDkQu/MvF7ePd
NbWZ9jW7CE1YJ9R9VdpazWOKf3h9Pq2QahjrR3fINW9p2NyIpLz7STd5/I4yj/Dh
7zSqzaQlKew9+xRY7aOK6eOfXsxbHuSY994xLmN87gNY5qWhdNUuJLTGgfjZyW8/
eRcqNr9lhZZdqi8p8xE4lIFSonBzdUPRFGlBjorMc00EcQKCoX8=
=tvKe
-----END PGP SIGNATURE-----

--xajkuje6fmke6plh--


--===============3185946571848962747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3185946571848962747==--

