Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDF3C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 14:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIoz0ma5oOba58dENREs7YFFT7YIAH61fcmdL4pugMk=; b=mMjiyIJE7xiIRMmrfai9rr8Onf
	qEkBI6H1JSRRULQHcuzusaNAyWziCDjZP4yGGnJc1ivt4QJV+6qKl52IrhiLiXbHExs+c1OBpUoSR
	iOsf4Y2OF+Z6WN8ScVhaIdNUIDVppNAi3TtS7hrsrXmXXsHE6D/91uRuL0DrlIvCaicH/P2q5o8Jo
	6vH0Omy03d8V3c/eVzeLtljecVPFBJuZM5vucfivJz+oYBbypUqKLcY7t48SwbxCcDmYDYdl7jzwq
	jf9uMdamCBfGtq0fTpcQVYKG1DELgLUySnCHZmQZ8z3w7J/rl/LJSM16itnBtqktSEzLNj8jxTOPB
	1dh5Eg6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPTR-005uN6-UI; Tue, 08 Nov 2022 14:21:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPTN-005uMO-Ga
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 14:21:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3A231B81B07;
	Tue,  8 Nov 2022 14:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584DDC43470;
	Tue,  8 Nov 2022 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667917261;
	bh=r4pj16Xe+j1vsGPDDTZj4as4wxzmjucEQDkSDLOjR7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZS/SoeaXCJGPXZclitMB0gpwwnSA+0le9DvUuOdeJKtp9e21uS8TJnEOEAGn0eCoF
	 u+7hs2FLutZvhrOS2PfDUj0HmOhyNSKGmnEOCvIm57iVnief3xCS5BvgTfLADi+tW4
	 jFSO2bbRWpfIAG4G4czzaUnqNOZtjJ+bkUxSXHxPnbj5ZhjlBFcIFXWyqdKsi3pK+4
	 fKW2mgE+NL+OLU8Lt57olO1EfcADR2HT6OblvTo1qPcAXvUG7k5oVw8ST3eaR70CkR
	 cEfAhZlHiShweAbOIlt/0HnVa1P5BMrbw+qeADaTViqmlhPRstSdQP6NyCVI++4amR
	 ej48XLDlWOqDw==
Date: Tue, 8 Nov 2022 15:20:57 +0100
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
Message-ID: <Y2plydHIPxmt6Azn@localhost.localdomain>
References: <cover.1667466887.git.lorenzo@kernel.org>
 <2d92c3e282c6a788e54370604f966fc7a5b479bf.1667466887.git.lorenzo@kernel.org>
 <6d1bd86e-29f0-a3b2-700b-978d64990d56@linaro.org>
 <Y2P/jq34IjyM2iXu@lore-desk>
 <aa7e325f-2986-005a-3d0a-579ac46491f6@linaro.org>
 <Y2QImkLcWIcwiTjW@lore-desk>
 <62fcc16e-51cb-fee4-ca8d-3ff546552595@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2jL64tpZMJR18EUf"
Content-Disposition: inline
In-Reply-To: <62fcc16e-51cb-fee4-ca8d-3ff546552595@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_062105_898721_FC39CB21 
X-CRM114-Status: GOOD (  31.53  )
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


--2jL64tpZMJR18EUf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 03/11/2022 19:29, Lorenzo Bianconi wrote:
> >> On 03/11/2022 13:51, Lorenzo Bianconi wrote:
> >>>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediate=
k,mt7986-wo-boot.yaml b/Documentation/devicetree/bindings/arm/mediatek/medi=
atek,mt7986-wo-boot.yaml
> >>>>> new file mode 100644
> >>>>> index 000000000000..6c3c514c48ef
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt798=
6-wo-boot.yaml
> >=20
> > Regarding "mediatek,mt7986-wed" compatible string it has been added to
> > mt7986a.dtsi in the commit below:
> >=20
> > commit 00b9903996b3e1e287c748928606d738944e45de
> > Author: Lorenzo Bianconi <lorenzo@kernel.org>
> > Date:   Tue Sep 20 12:11:13 2022 +0200
> >=20
> > arm64: dts: mediatek: mt7986: add support for Wireless Ethernet Dispatch
> >=20
> >>>>
> >>>> arm is only for top-level stuff. Choose appropriate subsystem, soc as
> >>>> last resort.
> >>>
> >>> these chips are used only for networking so is net folder fine?
> >>
> >> So this is some MMIO and no actual device? Then rather soc.
> >=20
> > ack, I will move them there
> >=20
> >>
> >>>
> >>>>
> >>>>> @@ -0,0 +1,47 @@
> >>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo=
-boot.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title:
> >>>>> +  MediaTek Wireless Ethernet Dispatch WO boot controller interface=
 for MT7986
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> >>>>> +  - Felix Fietkau <nbd@nbd.name>
> >>>>> +
> >>>>> +description:
> >>>>> +  The mediatek wo-boot provides a configuration interface for WED =
WO
> >>>>> +  boot controller on MT7986 soc.
> >>>>
> >>>> And what is "WED WO boot controller?
> >>>
> >>> WED WO is a chip used for networking packet processing offloaded to t=
he Soc
> >>> (e.g. packet reordering). WED WO boot is the memory used to store sta=
rt address
> >>> of wo firmware. Anyway I will let Sujuan comment on this.
> >>
> >> A bit more should be in description.
> >=20
> > I will let Sujuan adding more details (since I do not have them :))
> >=20
> >>
> >>>
> >>>>
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    items:
> >>>>> +      - enum:
> >>>>> +          - mediatek,mt7986-wo-boot
> >>>>> +      - const: syscon
> >>>>> +
> >>>>> +  reg:
> >>>>> +    maxItems: 1
> >>>>> +
> >>>>> +  interrupts:
> >>>>> +    maxItems: 1
> >>>>> +
> >>>>> +required:
> >>>>> +  - compatible
> >>>>> +  - reg
> >>>>> +
> >>>>> +additionalProperties: false
> >>>>> +
> >>>>> +examples:
> >>>>> +  - |
> >>>>> +    soc {
> >>>>> +      #address-cells =3D <2>;
> >>>>> +      #size-cells =3D <2>;
> >>>>> +
> >>>>> +      wo_boot: syscon@15194000 {
> >>>>> +        compatible =3D "mediatek,mt7986-wo-boot", "syscon";
> >>>>> +        reg =3D <0 0x15194000 0 0x1000>;
> >>>>> +      };
> >>>>> +    };
> >>>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediate=
k,mt7986-wo-ccif.yaml b/Documentation/devicetree/bindings/arm/mediatek/medi=
atek,mt7986-wo-ccif.yaml
> >>>>> new file mode 100644
> >>>>> index 000000000000..6357a206587a
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt798=
6-wo-ccif.yaml
> >>>>> @@ -0,0 +1,50 @@
> >>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo=
-ccif.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title: MediaTek Wireless Ethernet Dispatch WO controller interface=
 for MT7986
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> >>>>> +  - Felix Fietkau <nbd@nbd.name>
> >>>>> +
> >>>>> +description:
> >>>>> +  The mediatek wo-ccif provides a configuration interface for WED =
WO
> >>>>> +  controller on MT7986 soc.
> >>>>
> >>>> All previous comments apply.
> >>>>
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    items:
> >>>>> +      - enum:
> >>>>> +          - mediatek,mt7986-wo-ccif
> >>>>> +      - const: syscon
> >>>>> +
> >>>>> +  reg:
> >>>>> +    maxItems: 1
> >>>>> +
> >>>>> +  interrupts:
> >>>>> +    maxItems: 1
> >>>>> +
> >>>>> +required:
> >>>>> +  - compatible
> >>>>> +  - reg
> >>>>> +  - interrupts
> >>>>> +
> >>>>> +additionalProperties: false
> >>>>> +
> >>>>> +examples:
> >>>>> +  - |
> >>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
> >>>>> +    soc {
> >>>>> +      #address-cells =3D <2>;
> >>>>> +      #size-cells =3D <2>;
> >>>>> +
> >>>>> +      wo_ccif0: syscon@151a5000 {
> >>>>> +        compatible =3D "mediatek,mt7986-wo-ccif", "syscon";
> >>>>> +        reg =3D <0 0x151a5000 0 0x1000>;
> >>>>> +        interrupts =3D <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> >>>>> +      };
> >>>>> +    };
> >>>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediate=
k,mt7986-wo-dlm.yaml b/Documentation/devicetree/bindings/arm/mediatek/media=
tek,mt7986-wo-dlm.yaml
> >>>>> new file mode 100644
> >>>>> index 000000000000..a499956d9e07
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt798=
6-wo-dlm.yaml
> >>>>> @@ -0,0 +1,50 @@
> >>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo=
-dlm.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title: MediaTek Wireless Ethernet Dispatch WO hw rx ring interface=
 for MT7986
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> >>>>> +  - Felix Fietkau <nbd@nbd.name>
> >>>>> +
> >>>>> +description:
> >>>>> +  The mediatek wo-dlm provides a configuration interface for WED WO
> >>>>> +  rx ring on MT7986 soc.
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    const: mediatek,mt7986-wo-dlm
> >>>>> +
> >>>>> +  reg:
> >>>>> +    maxItems: 1
> >>>>> +
> >>>>> +  resets:
> >>>>> +    maxItems: 1
> >>>>> +
> >>>>> +  reset-names:
> >>>>> +    maxItems: 1
> >>>>> +
> >>>>> +required:
> >>>>> +  - compatible
> >>>>> +  - reg
> >>>>> +  - resets
> >>>>> +  - reset-names
> >>>>> +
> >>>>> +additionalProperties: false
> >>>>> +
> >>>>> +examples:
> >>>>> +  - |
> >>>>> +    soc {
> >>>>> +      #address-cells =3D <2>;
> >>>>> +      #size-cells =3D <2>;
> >>>>> +
> >>>>> +      wo_dlm0: wo-dlm@151e8000 {
> >>>>
> >>>> Node names should be generic.
> >>>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-d=
evicetree-basics.html#generic-names-recommendation
> >>>
> >>> DLM is a chip used to store the data rx ring of wo firmware. I do not=
 have a
> >>> better node name (naming is always hard). Can you please suggest a be=
tter name?
> >>
> >> The problem is that you added three new devices which seem to be for t=
he
> >> same device - WED. It looks like some hacky way of avoid proper hardwa=
re
> >> description - let's model everything as MMIO and syscons...
> >=20
> > is it fine to use syscon as node name even if we do not declare it in c=
ompatible
> > string for dlm?
> >=20
>=20
> No, rather not. It's a shortcut and if used without actual syscon it
> would be confusing. You could still call it system-controller, though.

ack, I used a different approach in v4 since I figured out I can move dlm n=
ode
in memory-region.

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof
>=20

--2jL64tpZMJR18EUf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY2plxQAKCRA6cBh0uS2t
rIaDAP9Sv7UuitKb/P4U6mZjP1uvhj5fjl9BrYE2biLAYPrGOAD/bbK7jiGxnapE
mtRIpbnvi/H6z0ViywG/Wh8NuQ4Hwwc=
=gakw
-----END PGP SIGNATURE-----

--2jL64tpZMJR18EUf--

