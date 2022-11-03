Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2536EC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 17:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQImf9Hv4afZMj4Qw1J//pdoitM4VAh9TDFkKqnfKCM=; b=vD8A1YTZFxSsoMRNyrad7BLn8D
	fBkfLdZddVfwItg1enE0qbQR6TwGl4rjUwnPND3QVw7ZM5td4RZuf/o3hX9OK2nBHsc0ZWT6TMv1s
	PzOOUfIR3iWUf9CMY0jZgiV9i/IHVb8gRGnoG3Od/NkEk0Nl5TB0siY3Z/p3UBqL1otTT9lqE8lj0
	bE4NA6bxgnwhzr7iaPFNF7+EV9FtJ0Al7QzsQnRAY7LQmca/yKqQe9padSNY72jbSWdsWffM7el6x
	YD0ZEjIlz7CNBlK8mwh8tZbMMmSfEDItVR0hjYJzQppkcufNHFCw3A7XTbydT8ZB09MBGSurOQK04
	SIcI3Hzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqePQ-0018lR-CY; Thu, 03 Nov 2022 17:53:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqePF-0018iS-MV
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 17:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667498010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GQImf9Hv4afZMj4Qw1J//pdoitM4VAh9TDFkKqnfKCM=;
	b=dRz75LqrKnt6tfr0wGZUDnjPmnkxvytGd2DCU2zK5Wk81lFoCyz0Sx2l3RwPWuikJafJe6
	dhHIY4dQio9CQ2MC1wyHQfYCcbzfeEQHsmfqf4uGnkHn7RLn6kDhML2UxDESBOPrxm1op9
	8zjNZMHOKoeWWqB+hCF59h4eUfU89Is=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-kHqzY6QUOZmdEeMS21Y6vQ-1; Thu, 03 Nov 2022 13:51:15 -0400
X-MC-Unique: kHqzY6QUOZmdEeMS21Y6vQ-1
Received: by mail-wm1-f70.google.com with SMTP id z18-20020a05600c221200b003cf7fcc286aso788624wml.1
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Nov 2022 10:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQImf9Hv4afZMj4Qw1J//pdoitM4VAh9TDFkKqnfKCM=;
        b=ua6RG8eGUucsHBiSb9c303LH3k8TO8BcsdDNZ4UwRLIE/o3VtSSfk4jXgh83jQU3aU
         zdiaUIOi9I8hNm42naC4gfkPXoizSH+otZDt8ec40TkcY5meLKwoB2VK+ilA3wTxeeQ7
         6cjttk4OSCqwB98AAfwVlmsUW66l17g3smCiw8apY8rrtf/qlNwvhvHUTxJVUouy9EBI
         JNmHK0qoXwo0S+WTd3Y0PLsEr2DI9I0dGoBPGIjh7m/qvowovpyNsJqKK6Dpq35nhmdc
         ZntSGVA8LgRo41OgX1maBrMn8YZI0f94WYDP6XC+S/0MSOEVeH7tzHlDvtbNddjimv5s
         xvSg==
X-Gm-Message-State: ACrzQf2Jp/tP6jdoYrU6YhEd0nFOc6MLtU+FFi4J9BKoUsq/cxYXbCos
	EcjxVQO/eDD3at+gepGZORmMRs8ktUwVKcIfbJFftXPpPyuIRkHT6W+wzn93AQnjCPRAvIzti7b
	KLrTEfItpWyqN4oGnI/yZHg+wCJ4GJ78o
X-Received: by 2002:a5d:4887:0:b0:226:ed34:7bbd with SMTP id g7-20020a5d4887000000b00226ed347bbdmr19030771wrq.561.1667497874268;
        Thu, 03 Nov 2022 10:51:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4BsszzoEjWalLkPkjB8Sz//22kVfpI+WgL/5sgLwheMUq1Uv7dUC02uIG/sfgg6LoymmGNFQ==
X-Received: by 2002:a5d:4887:0:b0:226:ed34:7bbd with SMTP id g7-20020a5d4887000000b00226ed347bbdmr19030750wrq.561.1667497873990;
        Thu, 03 Nov 2022 10:51:13 -0700 (PDT)
Received: from localhost (net-188-216-77-84.cust.vodafonedsl.it. [188.216.77.84])
        by smtp.gmail.com with ESMTPSA id n25-20020a7bc5d9000000b003c6c5a5a651sm523805wmk.28.2022.11.03.10.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 10:51:12 -0700 (PDT)
Date: Thu, 3 Nov 2022 18:51:10 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
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
Message-ID: <Y2P/jq34IjyM2iXu@lore-desk>
References: <cover.1667466887.git.lorenzo@kernel.org>
 <2d92c3e282c6a788e54370604f966fc7a5b479bf.1667466887.git.lorenzo@kernel.org>
 <6d1bd86e-29f0-a3b2-700b-978d64990d56@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CvIRv7FT2oWJS31l"
Content-Disposition: inline
In-Reply-To: <6d1bd86e-29f0-a3b2-700b-978d64990d56@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_105334_005756_6865BE18 
X-CRM114-Status: GOOD (  27.41  )
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


--CvIRv7FT2oWJS31l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 03/11/2022 05:28, Lorenzo Bianconi wrote:
> > Document the binding for the RX Wireless Ethernet Dispatch core on the
> > MT7986 ethernet driver used to offload traffic received by WLAN NIC and
> > forwarded to LAN/WAN one.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 62 ++++++++++++++++++-
> >  .../arm/mediatek/mediatek,mt7986-wo-boot.yaml | 47 ++++++++++++++
> >  .../arm/mediatek/mediatek,mt7986-wo-ccif.yaml | 50 +++++++++++++++
> >  .../arm/mediatek/mediatek,mt7986-wo-dlm.yaml  | 50 +++++++++++++++
> >  4 files changed, 206 insertions(+), 3 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/medi=
atek,mt7986-wo-boot.yaml
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/medi=
atek,mt7986-wo-ccif.yaml
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/medi=
atek,mt7986-wo-dlm.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt=
7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7=
622-wed.yaml
> > index 84fb0a146b6e..9e34c5d15cec 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-we=
d.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-we=
d.yaml
> > @@ -1,8 +1,8 @@
> >  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >  %YAML 1.2
> >  ---
> > -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.y=
aml#"
> > -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.ya=
ml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>=20
> Split the cleanups from essential/functional changes.

ack, I will fix it in v4

>=20
> > =20
> >  title: MediaTek Wireless Ethernet Dispatch Controller for MT7622
> > =20
> > @@ -29,6 +29,50 @@ properties:
> >    interrupts:
> >      maxItems: 1
> > =20
> > +  memory-region:
> > +    items:
> > +      - description:
> > +          Phandle for the node used to run firmware EMI region
>=20
> Merge above two lines. Drop "phandle for the node used to run"

ack, I will fix it in v4

>=20
> > +      - description:
> > +          Phandle for the node used to run firmware ILM region
> > +      - description:
> > +          Phandle for the node used to run firmware CPU DATA region
> > +
> > +  memory-region-names:
> > +    items:
> > +      - const: wo-emi
> > +      - const: wo-ilm
> > +      - const: wo-data
> > +
> > +  mediatek,wo-ccif:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the mediatek wed-wo controller.
>=20
> Drop "Phandle to". Same in other cases.

ack, I will fix it in v4

>=20
> > +
> > +  mediatek,wo-boot:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the mediatek wed-wo boot interface.
> > +
> > +  mediatek,wo-dlm:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the mediatek wed-wo rx hw ring.
>=20
> rx->RX?
> hw->HW?

ack, I will fix it in v4

>=20
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt7622-wed
> > +    then:
> > +      properties:
> > +        memory-region-names: false
> > +        memory-region: false
> > +        mediatek,wo-boot: false
> > +        mediatek,wo-ccif: false
> > +        mediatek,wo-dlm: false
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -44,8 +88,20 @@ examples:
> >        #address-cells =3D <2>;
> >        #size-cells =3D <2>;
> >        wed0: wed@1020a000 {
> > -        compatible =3D "mediatek,mt7622-wed","syscon";
> > +        compatible =3D "mediatek,mt7622-wed", "syscon";
> >          reg =3D <0 0x1020a000 0 0x1000>;
> >          interrupts =3D <GIC_SPI 214 IRQ_TYPE_LEVEL_LOW>;
> >        };
> > +
> > +      wed1: wed@15010000 {
>=20
> That's a separate example. - |
> Drop wed1 label.

ack, I will fix it in v4

>=20
> > +        compatible =3D "mediatek,mt7986-wed", "syscon";
>=20
> And where is the compatible added?
>=20
> > +        reg =3D <0 0x15010000 0 0x1000>;
> > +        interrupts =3D <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        memory-region =3D <&wo_emi>, <&wo_data>, <&wo_ilm>;
> > +        memory-region-names =3D "wo-emi", "wo-ilm", "wo-data";
> > +        mediatek,wo-ccif =3D <&wo_ccif0>;
> > +        mediatek,wo-boot =3D <&wo_boot>;
> > +        mediatek,wo-dlm =3D <&wo_dlm0>;
> > +      };
> >      };
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt=
7986-wo-boot.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek=
,mt7986-wo-boot.yaml
> > new file mode 100644
> > index 000000000000..6c3c514c48ef
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo=
-boot.yaml
>=20
> arm is only for top-level stuff. Choose appropriate subsystem, soc as
> last resort.

these chips are used only for networking so is net folder fine?

>=20
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-boo=
t.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title:
> > +  MediaTek Wireless Ethernet Dispatch WO boot controller interface for=
 MT7986
> > +
> > +maintainers:
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +  - Felix Fietkau <nbd@nbd.name>
> > +
> > +description:
> > +  The mediatek wo-boot provides a configuration interface for WED WO
> > +  boot controller on MT7986 soc.
>=20
> And what is "WED WO boot controller?

WED WO is a chip used for networking packet processing offloaded to the Soc
(e.g. packet reordering). WED WO boot is the memory used to store start add=
ress
of wo firmware. Anyway I will let Sujuan comment on this.

>=20
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt7986-wo-boot
> > +      - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      wo_boot: syscon@15194000 {
> > +        compatible =3D "mediatek,mt7986-wo-boot", "syscon";
> > +        reg =3D <0 0x15194000 0 0x1000>;
> > +      };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt=
7986-wo-ccif.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek=
,mt7986-wo-ccif.yaml
> > new file mode 100644
> > index 000000000000..6357a206587a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo=
-ccif.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-cci=
f.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek Wireless Ethernet Dispatch WO controller interface for=
 MT7986
> > +
> > +maintainers:
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +  - Felix Fietkau <nbd@nbd.name>
> > +
> > +description:
> > +  The mediatek wo-ccif provides a configuration interface for WED WO
> > +  controller on MT7986 soc.
>=20
> All previous comments apply.
>=20
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt7986-wo-ccif
> > +      - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    soc {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      wo_ccif0: syscon@151a5000 {
> > +        compatible =3D "mediatek,mt7986-wo-ccif", "syscon";
> > +        reg =3D <0 0x151a5000 0 0x1000>;
> > +        interrupts =3D <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> > +      };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt=
7986-wo-dlm.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,=
mt7986-wo-dlm.yaml
> > new file mode 100644
> > index 000000000000..a499956d9e07
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo=
-dlm.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-dlm=
=2Eyaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek Wireless Ethernet Dispatch WO hw rx ring interface for=
 MT7986
> > +
> > +maintainers:
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +  - Felix Fietkau <nbd@nbd.name>
> > +
> > +description:
> > +  The mediatek wo-dlm provides a configuration interface for WED WO
> > +  rx ring on MT7986 soc.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt7986-wo-dlm
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - resets
> > +  - reset-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      wo_dlm0: wo-dlm@151e8000 {
>=20
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation

DLM is a chip used to store the data rx ring of wo firmware. I do not have a
better node name (naming is always hard). Can you please suggest a better n=
ame?

Regards,
Lorenzo

>=20
>=20
> Best regards,
> Krzysztof
>=20

--CvIRv7FT2oWJS31l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY2P/jgAKCRA6cBh0uS2t
rLpxAQCDCSba4V5YXMALehIXkI39A3vfHz3ilEmxvWH7zgmeUwEA4llv7tevkBsa
j5/EJ5CSj10Lyp+Kic3Gvk36FpvUBAM=
=bjKx
-----END PGP SIGNATURE-----

--CvIRv7FT2oWJS31l--


