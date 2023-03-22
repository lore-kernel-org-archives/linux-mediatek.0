Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F935C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 16:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ab6e97Ulf1J+x3NhnZ8QcZ33mw0kvDlOg6s8wbi24XE=; b=ZK8gSiIdlvsvGGR7UUinUpm0N8
	RE62ZsHFDOOFkCNPfQwwZuf0yXdEhh32LsVS5kG49jjDK/7TnoUiIxoX9Wl04gqp91QxlqZcQqrv1
	dln1vCxp4hB0uR7taxTPGh1fXKTSZCPuZr2QfFEDANV6+q9gN//tsSvcSwVze406Il+CxrTyry71A
	o2aoF3Du7xdnCAp1Y1k7u29G23Bk/14RjsBoFkFoSjqkJgAYYEiPqAURAIxZwQp7yIvE/UOJBqj1C
	lB4lzZBys2YYpg7XEpNjpGrtF7JTB78i5IMBDyu4qgnaP44MA52tMUhqo9Y3un4KScXiakBJE44C5
	UPxGdAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf0xZ-00GagY-2o;
	Wed, 22 Mar 2023 16:05:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf0xW-00GaeJ-1x
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Mar 2023 16:05:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 94390621A0;
	Wed, 22 Mar 2023 16:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EA9C433D2;
	Wed, 22 Mar 2023 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679501104;
	bh=Qj2xh5JqnVyDV6aElwv4kwMsKIAtX6KkjA0r/BLou1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABPVjSVzx5paq6n2US+E+WT0eTyreN3BRIQKA74rxgKQv7qGxsZ+mZkjJgadR0oZM
	 bXmJF1cQjBa/Y5E5hthHhjjLXNONeHJEG/S+2DH4xXV5KLK46lxgdUoNEBC/UGDzeM
	 v7Z/87YfAnza1ut+bARCre1nRBWzfPWxPkcQjr+fkzJPofruAkdb+x+JGd7TdAkoeh
	 xCuujCiIp+AAhkCfIAkgY/0rkH8mf5mnZt3rFDbJhnsCl1p2K8+e5AFmcAm3omonHp
	 3qN0NU0ezl0mHzDWGQg5vP5KArXfq05UGRNoUX97zBAZbVxF407hWR8c2aHj+BbICC
	 dxkHl/GB06jWQ==
Date: Wed, 22 Mar 2023 17:05:00 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	lorenzo.bianconi@redhat.com, daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 06/10] dt-bindings: soc: mediatek: move ilm in a
 dedicated dts node
Message-ID: <ZBsnLLh5zu9DEQBb@lore-desk>
References: <cover.1679330630.git.lorenzo@kernel.org>
 <c9b65ef3aeb28a50cec45d1f98aec72d8016c828.1679330630.git.lorenzo@kernel.org>
 <20230321193254.GA1306908-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rT+VWrZJQYpVpr0U"
Content-Disposition: inline
In-Reply-To: <20230321193254.GA1306908-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_090506_742490_A2D93737 
X-CRM114-Status: GOOD (  28.88  )
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


--rT+VWrZJQYpVpr0U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, Mar 20, 2023 at 05:58:00PM +0100, Lorenzo Bianconi wrote:
> > Since the cpuboot memory region is not part of the RAM SoC, move ilm in
> > a deidicated syscon node.
> > This patch helps to keep backward-compatibility with older version of
> > uboot codebase where we have a limit of 8 reserved-memory dts child
> > nodes.
>=20
> Maybe, but breaks the ABI. It also looks like a step backwards. Fix your=
=20
> u-boot.

Can you please give some more details about ABI breakage? mtk_wed driver is
supposed to be backward compatible with respect to the older dts description
(please take a look to patch 5/10 and 8/10).

>=20
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 14 +++---
> >  .../soc/mediatek/mediatek,mt7986-wo-ilm.yaml  | 45 +++++++++++++++++++
> >  2 files changed, 53 insertions(+), 6 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/medi=
atek,mt7986-wo-ilm.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt=
7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7=
622-wed.yaml
> > index 7f6638d43854..5d2397ec5891 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-we=
d.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-we=
d.yaml
> > @@ -32,14 +32,12 @@ properties:
> >    memory-region:
> >      items:
> >        - description: firmware EMI region
> > -      - description: firmware ILM region
> >        - description: firmware DLM region
> >        - description: firmware CPU DATA region
> > =20
> >    memory-region-names:
> >      items:
> >        - const: wo-emi
> > -      - const: wo-ilm
> >        - const: wo-dlm
> >        - const: wo-data
> > =20
> > @@ -51,6 +49,10 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >      description: mediatek wed-wo cpuboot controller interface.
> > =20
> > +  mediatek,wo-ilm:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: mediatek wed-wo ilm interface.
> > +
> >  allOf:
> >    - if:
> >        properties:
> > @@ -63,6 +65,7 @@ allOf:
> >          memory-region: false
> >          mediatek,wo-ccif: false
> >          mediatek,wo-cpuboot: false
> > +        mediatek,wo-ilm: false
> > =20
> >  required:
> >    - compatible
> > @@ -97,11 +100,10 @@ examples:
> >          reg =3D <0 0x15010000 0 0x1000>;
> >          interrupts =3D <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> > =20
> > -        memory-region =3D <&wo_emi>, <&wo_ilm>, <&wo_dlm>,
> > -                        <&wo_data>;
> > -        memory-region-names =3D "wo-emi", "wo-ilm", "wo-dlm",
> > -                              "wo-data";
> > +        memory-region =3D <&wo_emi>, <&wo_dlm>, &wo_data>;
> > +        memory-region-names =3D "wo-emi", "wo-dlm", "wo-data";
> >          mediatek,wo-ccif =3D <&wo_ccif0>;
> >          mediatek,wo-cpuboot =3D <&wo_cpuboot>;
> > +        mediatek,wo-ilm =3D <&wo_ilm>;
> >        };
> >      };
> > diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt=
7986-wo-ilm.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,=
mt7986-wo-ilm.yaml
> > new file mode 100644
> > index 000000000000..2a3775cd941e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo=
-ilm.yaml
> > @@ -0,0 +1,45 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt7986-wo-ilm=
=2Eyaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek Wireless Ethernet Dispatch (WED) WO ILM firmware inter=
face for MT7986
>=20
> Either this region is some memory or it's a device. Sounds like the=20
> former and this is not a 'syscon'.

ILM and DLM are mmio regions used to store Wireless Ethernet Dispatch firmw=
are
sections.
AFAIU reserved-memory nodes are supposed to be used just for RAM areas, cor=
rect?
What do you think would be the best dts node type for ILM and DLM?

Another possibility I was discussing with Felix is to move ILM and DLM defi=
nitions
in WED node reg section, something like:

wed0: wed@15010000 {
	compatible =3D "mediatek,mt7986-wed";
	reg =3D <0 0x15010000 0 0x1000>,
	      <0 0x151e0000 0 0x8000>,
	      <0 0x151e8000 0 0x2000>;
	...
};

Doing so we need to get rid of syscon in WED compatible string, right? Is i=
t acceptable?

Regards,
Lorenzo

>=20
> > +
> > +maintainers:
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +  - Felix Fietkau <nbd@nbd.name>
> > +
> > +description:
> > +  The MediaTek wo-ilm (Information Lifecycle Management) provides a co=
nfiguration
> > +  interface for WiFi critical data used by WED WO firmware. WED WO con=
troller is
> > +  used to perform offload rx packet processing (e.g. 802.11 aggregatio=
n packet
> > +  reordering or rx header translation) on MT7986 soc.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt7986-wo-ilm
> > +      - const: syscon
> > +
> > +  reg:
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
> > +      syscon@151e0000 {
> > +        compatible =3D "mediatek,mt7986-wo-ilm", "syscon";
> > +        reg =3D <0 0x151e0000 0 0x8000>;
> > +      };
> > +    };
> > --=20
> > 2.39.2
> >=20

--rT+VWrZJQYpVpr0U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZBsnKwAKCRA6cBh0uS2t
rL2bAQDw38uwFBGsacL7CLZ6txUhQjdRBzqeth8Bbk/HFq3Y4QEAvMnxDz5dQmrW
ZbM2R5IANXMuZrwk3D9DgB0CSDaidwI=
=qUAw
-----END PGP SIGNATURE-----

--rT+VWrZJQYpVpr0U--

