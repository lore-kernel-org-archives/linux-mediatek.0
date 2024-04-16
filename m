Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC99C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WaS8A2NT8MVfg2Ew0wz5ZQF1+lPNWCVYnbm5x9oHrE=; b=mYgncUJSVBIKngFP9KfEJs9IYC
	dUZCU5tpWWIKZBd6M9eUcEDphRW3ulhtl8YeqOPX2mPly1DNTOXrpVRSSeD0rGFNDLXRd2djhq1rY
	pFqiMDOuShLIIx1cWvT1YTX/1UBXDz/tZAzNI5EBrccGfIFZ3LXKX+i/bMEymhONipslwxKxd/o6M
	nkmFWyCMIIr10YwulmGcdLwZmWsJuscKNWerxfTqCdyCtPE7Zt2YiwT9BAfqT89+EIG6qzo9LN+DX
	wKK1zGTXHO+XMbRE9jRr3c4NLYddf3yvxHeKOd6+OqYt4oX49kBPN9UspvX+Vtw/HNv5iMhoOZ5ND
	26AegNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwmdf-0000000DBw2-1CAY;
	Tue, 16 Apr 2024 17:30:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwmdb-0000000DBv0-0HS2;
	Tue, 16 Apr 2024 17:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 582FB61135;
	Tue, 16 Apr 2024 17:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6269DC113CE;
	Tue, 16 Apr 2024 17:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713288630;
	bh=XS4hUiQRaKWKxZ54JJm6tIu8KmrPOVRJYpat6/cOu/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=peVMTXH5eF7pekueJv97cqfGgMnF5D9QmHNZ/BvBc0ERATh0KcYTfOhZE72qeet5T
	 3qAJjziGx/cr9NSmS4wsvKCgBSsTSCVYeN+A3B+ce2DfyYSt2SyIQHEarZ8LFQT6tY
	 TMulnWeGAIGcHloWMxoBNPpfSnzpBkpCB/BexAIVcoozLjcOx0SCNmGldPQyxtRYVK
	 gCTRzmcywanWRZp2dL0D59SWouf0IwEUcxt2jFoMbBon/mIaFUl611pd41ZwwLLUtx
	 6wpKl0FbZ7e3KFun0wTB6jQ4l2hk2KOXLUXIU7diGh24DqY9N++wFBWtI8UEobEHtX
	 j/E/YI7vuYghQ==
Date: Tue, 16 Apr 2024 18:30:24 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: djakov@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, keescook@chromium.org, gustavoars@kernel.org,
	henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	wenst@chromium.org, amergnat@baylibre.com
Subject: Re: [PATCH v1 1/6] dt-bindings: soc: mediatek: Add DVFSRC bindings
 for MT8183 and MT8195
Message-ID: <20240416-onion-prone-44b45d5a003e@spud>
References: <20240416153805.431118-1-angelogioacchino.delregno@collabora.com>
 <20240416153805.431118-2-angelogioacchino.delregno@collabora.com>
 <20240416-grope-blissful-a914854b3732@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wP1ObGMFQC4n3zme"
Content-Disposition: inline
In-Reply-To: <20240416-grope-blissful-a914854b3732@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_103031_243174_65BE674A 
X-CRM114-Status: GOOD (  27.61  )
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


--wP1ObGMFQC4n3zme
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 06:28:58PM +0100, Conor Dooley wrote:
> On Tue, Apr 16, 2024 at 05:38:00PM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Add bindings for the MediaTek Dynamic Voltage and Frequency Scaling
> > Resource Collector (DVFSRC), a hardware module used to collect all the
> > requests from both software and the various remote processors embedded
> > into the SoC and decide about a minimum operating voltage and a minimum
> > DRAM frequency to fulfill those requests in an effort to provide the
> > best achievable performance per watt.
> >=20
> > This hardware IP is capable of transparently performing direct register
> > R/W on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
> >=20
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml  | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/medi=
atek,mt8183-dvfsrc.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt=
8183-dvfsrc.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,=
mt8183-dvfsrc.yaml
> > new file mode 100644
> > index 000000000000..12bcc3fdfd07
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dv=
fsrc.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8183-dvfsrc=
=2Eyaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek Dynamic Voltage and Frequency Scaling Resource Collect=
or (DVFSRC)
> > +
> > +description:
> > +  The Dynamic Voltage and Frequency Scaling Resource Collector (DVFSRC=
) is a
> > +  Hardware module used to collect all the requests from both software =
and the
> > +  various remote processors embedded into the SoC and decide about a m=
inimum
> > +  operating voltage and a minimum DRAM frequency to fulfill those requ=
ests in
> > +  an effort to provide the best achievable performance per watt.
> > +  This hardware IP is capable of transparently performing direct regis=
ter R/W
> > +  on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
> > +
> > +maintainers:
> > +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.co=
m>
> > +  - Henry Chen <henryc.chen@mediatek.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
>=20
> This items should not be needed with the enum, right?
>=20
> > +          - enum:
> > +              - mediatek,mt8183-dvfsrc
> > +              - mediatek,mt8195-dvfsrc
> > +      - items:
> > +          - const: mediatek,mt8192-dvfsrc
> > +          - const: mediatek,mt8195-dvfsrc
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: DVFSRC common register address and length.
> > +
> > +patternProperties:
> > +  "@[0-9a-f]+$":
> > +    type: object
>=20
> Why is there no enforcement of what a child could be here?

Seems like you know exactly what the children are: regulators and an
interconnect? What am I missing?

>=20
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        dvfsrc@10012000 {
>=20
> "dvfsrc" looks like something my (imaginary given allergies) cat would
> produce from sitting on my keyboard. Could you use full words for the
> node name and make it something that attempts to be generic please?
>=20
> > +            compatible =3D "mediatek,mt8195-dvfsrc";
> > +            reg =3D <0 0x10012000 0 0x1000>;
> > +        };
> > +    };
> > --=20
> > 2.44.0
> >=20



--wP1ObGMFQC4n3zme
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh61sAAKCRB4tDGHoIJi
0kmFAP93becCTty5zhdZz9iHDigSwk/4jcVZ97Bb+qr2Aa9DnAEA3ztf7bZFSh7q
Dy/w11JkKRpcOGwlnr3cqLVVUtw4zgs=
=XJy2
-----END PGP SIGNATURE-----

--wP1ObGMFQC4n3zme--

