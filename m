Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73278C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 17:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WNNMXqv3ctDwG992RJjLS0jvtj9IJbG8t02kMH53LQ=; b=onIuRTcHcDT0nYNZpd7c2NQoP5
	AZr59V960OhRa7LVYO0HrjoegKY0X5c5/WCL4Wl2M14Fx04Qva9+PaQ6uaCJkT7SEy0HgaRw9ZFef
	fjnQ7zhAOqXuXn/HPSO/cK/tWwqSeXhGfkg+2GvsTPmCebgpaD85Ys3D3Qms6m8PEziDybWq3OsbD
	5AOMpj4Pwaz8MGiycFsSAzDCiHGhGeWPJqNvs1QMaWrZ856/vH17g8cQbx1sN/qiCqVhbOl7FeoT4
	LMyc29AUO+IzydU1sHIGAcrqHQL0Cw6GNbwQH3IkptYSYXfC3LkGisTMgLNBZQsnx/bPT9gRH9MCX
	RgyS3PMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSh8Y-004Vce-0h;
	Wed, 24 Jan 2024 17:34:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSh8T-004VZw-1h;
	Wed, 24 Jan 2024 17:34:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 178CB61DF0;
	Wed, 24 Jan 2024 17:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46AAC433C7;
	Wed, 24 Jan 2024 17:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706117638;
	bh=F8O1LAlWtzyG7pKBPEZ8OXoCR4xC+gD0cGfc5INvsp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B0Spo3rGnbgB9zPHV4UIgRZdD+ZLoVGQFY2Eu1smFyFZaHu5L5OPcrsFb2P+VUiDd
	 LsK8KfQNiPp+twAUPul1m/4JYuSFohbWVFdIT+cJMA/7hiCVydYWQ/rGrZ1nEDpYF+
	 saudLPuSyYrdYkiYA8mFF57PrCNvPDuXeb+5kR3VnN3fEI1QP5VMROZ4NjiKOOVx0R
	 jByrTxfv6+39YfMDW5rYa9A6x0pxJ5AcNsedxJ73HgScC18dgziw/KCrD26cJA2KMx
	 FfXQngOx7sr9KzHMJBpSWEuOR8C+2E8h76e9LowWxURe1wrgOg4Wi+QSOq4VX18hnc
	 jD+a89wJ92Xgw==
Date: Wed, 24 Jan 2024 17:33:52 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: rtc: convert MT7622 RTC to the json-schema
Message-ID: <20240124-footnote-country-9dc331c51819@spud>
References: <20240123125043.27192-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mzfSYH7PP20o44ht"
Content-Disposition: inline
In-Reply-To: <20240123125043.27192-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_093401_651317_01F10EF6 
X-CRM114-Status: GOOD (  20.20  )
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


--mzfSYH7PP20o44ht
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 01:50:43PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This helps validating DTS files. Introduced changes:
> 1. Reworded title
> 2. Dropper redundant properties descriptions
> 3. Added required #include-s and adjusted "reg" in example
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../bindings/rtc/mediatek,mt7622-rtc.yaml     | 52 +++++++++++++++++++
>  .../devicetree/bindings/rtc/rtc-mt7622.txt    | 21 --------
>  2 files changed, 52 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt7622=
-rtc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt7622.txt
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt7622-rtc.ya=
ml b/Documentation/devicetree/bindings/rtc/mediatek,mt7622-rtc.yaml
> new file mode 100644
> index 000000000000..e74dfc161cfc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/mediatek,mt7622-rtc.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/mediatek,mt7622-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT7622 on-SoC RTC
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt7622-rtc
> +      - const: mediatek,soc-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: rtc
> +
> +required:
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt7622-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    rtc@10212800 {
> +        compatible =3D "mediatek,mt7622-rtc", "mediatek,soc-rtc";
> +        reg =3D <0x10212800 0x200>;
> +        interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVEL_LOW>;
> +        clocks =3D <&topckgen CLK_TOP_RTC>;
> +        clock-names =3D "rtc";
> +    };
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt7622.txt b/Docum=
entation/devicetree/bindings/rtc/rtc-mt7622.txt
> deleted file mode 100644
> index 09fe8f51476f..000000000000
> --- a/Documentation/devicetree/bindings/rtc/rtc-mt7622.txt
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Device-Tree bindings for MediaTek SoC based RTC
> -
> -Required properties:
> -- compatible	    : Should be
> -			"mediatek,mt7622-rtc", "mediatek,soc-rtc" : for MT7622 SoC
> -- reg 		    : Specifies base physical address and size of the registers;
> -- interrupts	    : Should contain the interrupt for RTC alarm;
> -- clocks	    : Specifies list of clock specifiers, corresponding to
> -		      entries in clock-names property;
> -- clock-names	    : Should contain "rtc" entries
> -
> -Example:
> -
> -rtc: rtc@10212800 {
> -	compatible =3D "mediatek,mt7622-rtc",
> -		     "mediatek,soc-rtc";
> -	reg =3D <0 0x10212800 0 0x200>;
> -	interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVEL_LOW>;
> -	clocks =3D <&topckgen CLK_TOP_RTC>;
> -	clock-names =3D "rtc";
> -};
> --=20
> 2.35.3
>=20

--mzfSYH7PP20o44ht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbFKAAAKCRB4tDGHoIJi
0hieAQCSVtBR/QWefVi/R8aPudHESw7FQN1nfXuBKJuUNQjjlAD+NLxT1QNvQr9y
CoJayyLMfGR1nC0ul+pEvzRdrx6kUAA=
=LfgQ
-----END PGP SIGNATURE-----

--mzfSYH7PP20o44ht--

