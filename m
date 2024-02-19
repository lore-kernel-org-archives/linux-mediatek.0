Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300D1C48BC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqpOwN+kn9cr1LlyebcGphr1AkQwEnE+hqV2CZnCaZA=; b=YpBtG8gQnDi54zOEvOEl09y2Rq
	6HCWxk4MBgqhMUAJzdsU+wBhfdh9pv2Aq9ZivXu0horc2sASISphntMCvxd6woKXm43uOwzHytJgD
	J5zgEsRoVi2Mrm4QeHBJ1N3kPCDOwFlYy0EXFQv2OVByf59BuIjO7lPxvFs6fknDub/z6AXOlPXYF
	0bMTKwjsB8/eijAzYBVi4WhN54TvuU5Bj5m0utmKnSx09/U8qPQh2zTOwQOVb7Y1cQWv5AfdxXgEb
	GpO+wnSkkpsc3b9WDei9kVGTaPKgFkNIjL3kuD7suCZY26Z3eFt+0GReLKEjFVnISTytsI86YoKf+
	tH0gLwmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc4B6-0000000AkDQ-2UxU;
	Mon, 19 Feb 2024 13:59:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc4B3-0000000AkCf-0yRg;
	Mon, 19 Feb 2024 13:59:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F84B60C26;
	Mon, 19 Feb 2024 13:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2B6C433F1;
	Mon, 19 Feb 2024 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708351164;
	bh=z+LUHVxMNuaZaB3RCn8D1OAdSMF663IBq3JaYmth/Bs=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=m8AyvZQ5Ohu1atbf96hEHaz9Pokq2daWbrJfLUgMLQRFIQOa8lbFCHhtlvYjRGY9z
	 06b32rtvxL7d6gRwUBpsxeOEmqEAJ5d/KTCEySs+UllYH7K+aFq3CYUdpfjDTXWjb3
	 tJzaua0YMTlQdyeTxdG//DX6ASbplDq34q+E0r2xXNiDFjkDkONTbDHFhTMqdN89Kn
	 BFkpTMPq8gMzGRPMozKDC5B2oDqY3A0FgrYe5BUCSrUVbQGhIkFftwOd28g8YhpdF6
	 iVoutFNaee+xsY+50Glo4NZWSMT1nffJXJMtFPeePcb9YDxwuTdvETsj7zdUPG6nef
	 ow43dtJLGgh9g==
Content-Type: multipart/signed;
 boundary=99d1e3bae09ed9ca9f76a08dd12da8ba24b3a631d884834e984f62944198;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 19 Feb 2024 14:59:16 +0100
Message-Id: <CZ93XYV3MB10.YRCFWLLHIICY@kernel.org>
Cc: <devicetree@vger.kernel.org>, "Sean Wang" <sean.wang@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200
X-Mailer: aerc 0.16.0
References: <20240219084456.1075445-1-mwalle@kernel.org>
 <20240219084456.1075445-2-mwalle@kernel.org>
 <2ad6bda8-a457-421b-b35d-dc005fb00ae9@collabora.com>
 <CZ92W3VSYV1A.1693O76GY1XDP@kernel.org>
 <b50d49fd-2976-46fc-9f35-354fb39720ad@collabora.com>
In-Reply-To: <b50d49fd-2976-46fc-9f35-354fb39720ad@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_055925_381448_5EA7F5C5 
X-CRM114-Status: GOOD (  26.85  )
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

--99d1e3bae09ed9ca9f76a08dd12da8ba24b3a631d884834e984f62944198
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 19, 2024 at 2:35 PM CET, AngeloGioacchino Del Regno wrote:
> >> vbus is always supplied by something, as otherwise USB won't work - wh=
ether this
> >> is an always-on regulator or a passthrough from external supply this d=
oesn't really
> >> matter - you should model a regulator-fixed that provides the 5V VBUS =
line.
> >=20
> > I don't think this is correct, though. Think of an on-board USB
> > hub. There only D+/D- are connected (and maybe the USB3.2 SerDes
> > lanes). Or have a look at the M.2 pinout. There is no Vbus.
> >=20
>
> Yes but the MediaTek MTU3 and/or controllers do have it ;-)

.. and ..

> >> For example:
> >> 	vbus_fixed: regulator-vbus {
> >> 		compatible =3D "regulator-fixed";
> >> 		regulator-name =3D "usb-vbus";
> >> 		regulator-always-on;
> >> 		regulator-boot-on;
> >> 		regulator-min-microvolt =3D <5000000>;
> >> 		regulator-max-microvolt =3D <5000000>;
> >> 	};
> >=20
> > As mentioned above, I don't think this will make sense in my case.
> >  >> P.S.: If the rail has a different name, please use that different n=
ame. Obviously
> >> that requires you to have schematics at hand, and I don't know if you =
do: if you
> >> don't, then that regulator-vbus name is just fine.
> >=20
> > I do have the schematics.
>
> In that case, you should model the power tree with the fixed power lines,
> check mt8195-cherry (and/or cherry-tomato) and radxa-nio-12l; even though
> those are technically "doing nothing", this is device tree, so it should
> provide a description of the hardware ... and the board does have fixed
> power lines.
> It has at least one: DC-IN (typec, barrel jack or whatever, the board nee=
ds
> power, doesn't it?!).

Mh, maybe I don't get it. But within the hardware there is simply no
Vbus. Thus I'd argue it doesn't make sense to have a vbus-supply
property. Besides, the mediatek,mtu3.yaml binding lists it as
deprecated anyway and it should rather be on the connector. There,
it makes perfectly sense (at least if it's a USB connector).

Thus in my case, the xhci for the front port has a vbus-supply
property (but it should rather have a connector node, as I've just
learned). But the internal port which connects to the USB hub
shouldn't have one.


  +-----+           +-----+                  +------+
  |     |<--Dp/Dn-->|     |<------Dp/Dn----->| USB  |
  | SoC |           |     |                  | Conn |
  |     |           |     |   +-----+        |      |
  +-----+           | USB |   | PWR |--Vbus->|      |
                    | Hub |   | SW  |        +------+
                    |     |   +-----+
                    |     |     ^
                    |     |     | PRTPWR
                    |     |-----'
                    +-----+

"PWR SW" is a power switch, the input (+5V) isn't shown here. The
power will be enabled by the USB Hub.

-michael

--99d1e3bae09ed9ca9f76a08dd12da8ba24b3a631d884834e984f62944198
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZdNetBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvudvgEAyZCGdO77Pxmrm6K+phBbI5ki8C3j8JDu
SRao0N5psZUBAJZpI2DCkGN2QIvMqVrxwVuZpy7mA4Hbal7hl7rlF3gH
=UXiX
-----END PGP SIGNATURE-----

--99d1e3bae09ed9ca9f76a08dd12da8ba24b3a631d884834e984f62944198--

