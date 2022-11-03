Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF83C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 18:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ap4ZI+8H3GZt3xeD0fMm1Y25SvodVdi8KaIQk+bGNws=; b=IVq1GgPy59a4R+sZPS6NVC+DhZ
	B4PlmH6HpELYYHsyeFC+8IeOScLG4nr3dHNG2X7/7WsHsZUWN0cDmALUTBkGpKdETHqGOoUHlS/dh
	BJ/PfZ9oQaTPWV8Y73BLOBVNp1y/IiveXHd4zwkYTJ5S4wYmgu3cCn/lnnADbx2gc7tl3UPg3NPDP
	HsGaPzLC9RkmjVWtDoclAsPMoGV30bxKHgFJsT+E2HnrXy8BIoXiCWiob/nX20rYOHJ+K7aZOt9aV
	92R/hBXv/Vc5reSUzseULjZjvvmS67RJ30yIyXutAdJ+4Vv7PjI/Ukq2LmgtGsvMoC2z21VEFAjPF
	qS7gYnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqeyT-001Ham-Lv; Thu, 03 Nov 2022 18:29:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqeyP-001HXF-08
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 18:29:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 535D3B8299A;
	Thu,  3 Nov 2022 18:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C03C43470;
	Thu,  3 Nov 2022 18:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667500190;
	bh=8NP93N6yjeh5BdXa1HZVMaOo/12CqJQIQJ1ATx2oaqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icjWYXZ1vsXVjHuH1AbsSNQtnpwFyQcAWIttcLJ2qf1mUH3F04/GH47DSo9Zofa51
	 DkL2Mi8Ux9he/2xVpxoUY2o6eR77YaYyfEDEzWQdeMg48dXckSDIuXYxyXCL+ba1L6
	 uwFRoqH/Gw+ZnetL1OcndpH7XkmnMJiVrh5FmjzQgJJU/3BPI9eS9u6c59SWa/NHFl
	 SY3xePxwkwKGtG5VjBn/8BierLrA5Ji2iLhNgw8M5/jqeDezBlsGQ3N22kYkOiOuT1
	 qqroipr2eX2ioGI3CJZSDDPJU4yXCcm3Do2dn0Qp2caBorpMoam3erXURPPrj30W1R
	 h19weCJDmorKA==
Date: Thu, 3 Nov 2022 19:29:46 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, netdev@vger.kernel.org,
	nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com, ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com, devicetree@vger.kernel.org,
	robh+dt@kernel.org, daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v3 net-next 2/8] dt-bindings: net: mediatek: add WED RX
 binding for MT7986 eth driver
Message-ID: <Y2QImkLcWIcwiTjW@lore-desk>
References: <cover.1667466887.git.lorenzo@kernel.org>
 <2d92c3e282c6a788e54370604f966fc7a5b479bf.1667466887.git.lorenzo@kernel.org>
 <6d1bd86e-29f0-a3b2-700b-978d64990d56@linaro.org>
 <Y2P/jq34IjyM2iXu@lore-desk>
 <aa7e325f-2986-005a-3d0a-579ac46491f6@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yb/LjqbCAVIpV8Hn"
Content-Disposition: inline
In-Reply-To: <aa7e325f-2986-005a-3d0a-579ac46491f6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_112953_373312_1E291673 
X-CRM114-Status: GOOD (  28.79  )
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


--yb/LjqbCAVIpV8Hn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 03/11/2022 13:51, Lorenzo Bianconi wrote:
> >>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,=
mt7986-wo-boot.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediat=
ek,mt7986-wo-boot.yaml
> >>> new file mode 100644
> >>> index 000000000000..6c3c514c48ef
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-=
wo-boot.yaml

Regarding "mediatek,mt7986-wed" compatible string it has been added to
mt7986a.dtsi in the commit below:

commit 00b9903996b3e1e287c748928606d738944e45de
Author: Lorenzo Bianconi <lorenzo@kernel.org>
Date:   Tue Sep 20 12:11:13 2022 +0200

arm64: dts: mediatek: mt7986: add support for Wireless Ethernet Dispatch

> >>
> >> arm is only for top-level stuff. Choose appropriate subsystem, soc as
> >> last resort.
> >=20
> > these chips are used only for networking so is net folder fine?
>=20
> So this is some MMIO and no actual device? Then rather soc.

ack, I will move them there

>=20
> >=20
> >>
> >>> @@ -0,0 +1,47 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-b=
oot.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title:
> >>> +  MediaTek Wireless Ethernet Dispatch WO boot controller interface f=
or MT7986
> >>> +
> >>> +maintainers:
> >>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> >>> +  - Felix Fietkau <nbd@nbd.name>
> >>> +
> >>> +description:
> >>> +  The mediatek wo-boot provides a configuration interface for WED WO
> >>> +  boot controller on MT7986 soc.
> >>
> >> And what is "WED WO boot controller?
> >=20
> > WED WO is a chip used for networking packet processing offloaded to the=
 Soc
> > (e.g. packet reordering). WED WO boot is the memory used to store start=
 address
> > of wo firmware. Anyway I will let Sujuan comment on this.
>=20
> A bit more should be in description.

I will let Sujuan adding more details (since I do not have them :))

>=20
> >=20
> >>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - mediatek,mt7986-wo-boot
> >>> +      - const: syscon
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    soc {
> >>> +      #address-cells =3D <2>;
> >>> +      #size-cells =3D <2>;
> >>> +
> >>> +      wo_boot: syscon@15194000 {
> >>> +        compatible =3D "mediatek,mt7986-wo-boot", "syscon";
> >>> +        reg =3D <0 0x15194000 0 0x1000>;
> >>> +      };
> >>> +    };
> >>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,=
mt7986-wo-ccif.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediat=
ek,mt7986-wo-ccif.yaml
> >>> new file mode 100644
> >>> index 000000000000..6357a206587a
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-=
wo-ccif.yaml
> >>> @@ -0,0 +1,50 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-c=
cif.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: MediaTek Wireless Ethernet Dispatch WO controller interface f=
or MT7986
> >>> +
> >>> +maintainers:
> >>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> >>> +  - Felix Fietkau <nbd@nbd.name>
> >>> +
> >>> +description:
> >>> +  The mediatek wo-ccif provides a configuration interface for WED WO
> >>> +  controller on MT7986 soc.
> >>
> >> All previous comments apply.
> >>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - mediatek,mt7986-wo-ccif
> >>> +      - const: syscon
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - interrupts
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> +    #include <dt-bindings/interrupt-controller/irq.h>
> >>> +    soc {
> >>> +      #address-cells =3D <2>;
> >>> +      #size-cells =3D <2>;
> >>> +
> >>> +      wo_ccif0: syscon@151a5000 {
> >>> +        compatible =3D "mediatek,mt7986-wo-ccif", "syscon";
> >>> +        reg =3D <0 0x151a5000 0 0x1000>;
> >>> +        interrupts =3D <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> >>> +      };
> >>> +    };
> >>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,=
mt7986-wo-dlm.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediate=
k,mt7986-wo-dlm.yaml
> >>> new file mode 100644
> >>> index 000000000000..a499956d9e07
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-=
wo-dlm.yaml
> >>> @@ -0,0 +1,50 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-d=
lm.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: MediaTek Wireless Ethernet Dispatch WO hw rx ring interface f=
or MT7986
> >>> +
> >>> +maintainers:
> >>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> >>> +  - Felix Fietkau <nbd@nbd.name>
> >>> +
> >>> +description:
> >>> +  The mediatek wo-dlm provides a configuration interface for WED WO
> >>> +  rx ring on MT7986 soc.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: mediatek,mt7986-wo-dlm
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  resets:
> >>> +    maxItems: 1
> >>> +
> >>> +  reset-names:
> >>> +    maxItems: 1
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - resets
> >>> +  - reset-names
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    soc {
> >>> +      #address-cells =3D <2>;
> >>> +      #size-cells =3D <2>;
> >>> +
> >>> +      wo_dlm0: wo-dlm@151e8000 {
> >>
> >> Node names should be generic.
> >> https://devicetree-specification.readthedocs.io/en/latest/chapter2-dev=
icetree-basics.html#generic-names-recommendation
> >=20
> > DLM is a chip used to store the data rx ring of wo firmware. I do not h=
ave a
> > better node name (naming is always hard). Can you please suggest a bett=
er name?
>=20
> The problem is that you added three new devices which seem to be for the
> same device - WED. It looks like some hacky way of avoid proper hardware
> description - let's model everything as MMIO and syscons...

is it fine to use syscon as node name even if we do not declare it in compa=
tible
string for dlm?

Regards,
Lorenzo

>=20
> For such model - register addresses exposed as separate devices - I do
> not have appropriate name, but the real problem is not in the name. It's
> in the hardware description.
>=20
>=20
> Best regards,
> Krzysztof
>=20

--yb/LjqbCAVIpV8Hn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY2QImgAKCRA6cBh0uS2t
rPdEAQCOdMw1tyeiIQYXHc4we36BEm56cUSJi7SnCgku5X5ctwD9EejZmSVVQLMA
Nwuh3+a02q6DTVYTdBHmFUtRVR798gA=
=ALvQ
-----END PGP SIGNATURE-----

--yb/LjqbCAVIpV8Hn--

