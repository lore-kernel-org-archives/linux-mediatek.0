Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6E1C27C44
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 15:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+TAu5Ym6oOAch0nEAhWHVBdOckb8tdinlodXBDGNds=; b=HAdyJKsR1rrK5BU9IBM2ZaalmB
	wkNcGqhn7Iw9O1CVdF47t8xGpGC0jka78jiaSTEEXOoonEgNvl6SDfxNJ0bmXrOcrsRIJrXXe1kRV
	G6Uc8kgd463t8pdrsNr+rxQDhI4w7oayqdhnvccvvcGuhk6Nm30l6QtwzrmpQGoaDxniQfRzXbEKl
	YmvQ20vRkWR4hvMnxTWZRHndKo975D09CRHYZTv8wDiyDSKAi/GZd7n2+9ChMOmPkBceA4m8ePIfo
	TKT5DKidYrgFXn+QSHmnY3b/UPWGpmzOHL+AUlMlTc4qkOwVYdLinmga4Gm8d7VEN63cpC6mWkHAt
	PQgzdCGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChvu-00000007kl7-1jWZ;
	Thu, 30 May 2024 15:43:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChvq-00000007kkU-1Ybr;
	Thu, 30 May 2024 15:43:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2C65FCE1A26;
	Thu, 30 May 2024 15:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9046EC2BBFC;
	Thu, 30 May 2024 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717083787;
	bh=sxN5z1qmpio62Pf/Ml/zd6Qag4AfNKvE5xoF1EDGv8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EyEIwPzFPgWdzqskayElMj22rlPIlDN2LaVM/azx2RaO/xA4IFv8HTizqT23FMoNg
	 6Dr+cMjQXbetPZdH9FZmRF3E7tUSe/CmcciHka2lO0g3rsyF9PfAuM92s++w5rgy0h
	 TFDnJJHBx1jW9NK2KrYWzA1OZGmpeQpsNnEQUhE056LUu3YRaVTdXtYcxHKIJZ2bMw
	 I6Z9okTggGuAglPbNRLc3Pg/rfAMX+4bn2S5/tvtSCLKR+y9NPufOpJUCSE+9xNDqp
	 onnljimCs8C/5y1HqTHsR2GZZsWkWdCi5adQOPL6mu8sSRASA6yKpP3vXjmP1ICURQ
	 FlGIaudMbe/bw==
Date: Thu, 30 May 2024 16:43:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Message-ID: <20240530-revisit-profanity-889f1bcae21a@spud>
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C42pYJ1S35FYsJe7"
Content-Disposition: inline
In-Reply-To: <20240530083513.4135052-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_084310_788839_918A00B5 
X-CRM114-Status: GOOD (  19.82  )
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


--C42pYJ1S35FYsJe7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 04:35:00PM +0800, Chen-Yu Tsai wrote:
> The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
> in the datasheet, that contains clock gates, some power sequence signal
> delays, and other unknown registers that get toggled when the GPU is
> powered on.
>=20
> The clock gates are exposed as clocks provided by a clock controller,
> while the power sequencing bits are exposed as one singular power domain.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../clock/mediatek,mt8173-mfgtop.yaml         | 71 +++++++++++++++++++
>  include/dt-bindings/clock/mt8173-clk.h        |  7 ++
>  2 files changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt81=
73-mfgtop.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgt=
op.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.ya=
ml
> new file mode 100644
> index 000000000000..03c3c1f8cf75
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/clock/mediatek,mt8173-mfgtop.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8173 MFG TOP controller
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MFG TOP glue layer controls various signals going to the MFG (GPU)
> +  block on the MT8173.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8173-mfgtop
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 4

minItems is not needed when minItems =3D=3D maxItems.

> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: sys
> +      - const: mem
> +      - const: core
> +      - const: clk26m
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - '#clock-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/clock/mt8173-clk.h>
> +        #include <dt-bindings/power/mt8173-power.h>
> +
> +        mfgtop: clock-controller@13fff000 {

The label here is used, so drop it.

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--C42pYJ1S35FYsJe7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZliehQAKCRB4tDGHoIJi
0rnoAQDaN332uA+sfGCydZsLPg1xRomJNTaEgeLJGYjMhgfcgAEAqIXjskcLzKk2
FwiVXlgrZQV08uIeB/KqLI7h50RF3Qo=
=MB31
-----END PGP SIGNATURE-----

--C42pYJ1S35FYsJe7--

