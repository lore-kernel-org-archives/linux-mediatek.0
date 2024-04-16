Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C991C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 17:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nf5Km9vuxLidQMLa1iGiDTtqm+5u8MdsGIjlIEQa9FU=; b=YVOhCyfqpxskmNFsyn82vGySl+
	fOPi1QZamktgHo4YCZ9CSHAJS6rQIh0zlKooli3bxs/0dxOHr/hRcplIDNz4YYpmRS/EMVc4/suSs
	vo3DfdDcSZeXg1FAz4StMcefSfTT2LC06EInz4gXnbOEVEaRylLR8O58Y4BR3ehKl1wkUKNyjV0DJ
	iw48zHQJtUOMLZt2mFw2p1kVwi7LIPcTwrPsfDMTl8tgXEiwZGXIUS62FGc+wfP3S2pNOIMIIFQIa
	bzfg3FzD8t0QTs26WZkPxr4q9QBSzt5CddF+6/ejIAmPJo7lYcJxoEboL4w2B2jwo9ZXirl8kApq0
	ABa/tJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwmcK-0000000DBQ7-0Yne;
	Tue, 16 Apr 2024 17:29:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwmcF-0000000DBOo-04Cw;
	Tue, 16 Apr 2024 17:29:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 022DC61260;
	Tue, 16 Apr 2024 17:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04842C113CE;
	Tue, 16 Apr 2024 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713288544;
	bh=pzLiPf2BmuAp4EQPnQxHsJQ/UQhL2QfZVqplzTySip0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N088a8C9FmN1VDWp65w6E1bCyNFVGRowbzimjCqepdy/ECyTGaVp+1KASSq2Txbmz
	 bAzLr+c/xvmHHlAIHlhx8UY4DCAxN/RJbnduYekj3LMv0sD5mOqSn2dwun4A3FLg/l
	 yo9r9tuaYG/JgCEBkKi0lT3a8Yzk9aj84ckvsJFP23ytkKLj44JgTbaTLzg+wfcDof
	 3GRbca/uy/VeOXkBCvUfrs4AXmScm1vs1zerx8bdj+FEskS/d22VJ4mL+y29CoTF/z
	 sM6OS8/Mee1L9NqdFcTCZiLNimgzBEP8SSEL7IvhPyzMYniKdWrCf1OHNSXhlYl4fO
	 wUoYVFFjPcG2w==
Date: Tue, 16 Apr 2024 18:28:58 +0100
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
Message-ID: <20240416-grope-blissful-a914854b3732@spud>
References: <20240416153805.431118-1-angelogioacchino.delregno@collabora.com>
 <20240416153805.431118-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="29wYAvcTm3T+HZi+"
Content-Disposition: inline
In-Reply-To: <20240416153805.431118-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_102907_450549_476D59DB 
X-CRM114-Status: GOOD (  23.79  )
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


--29wYAvcTm3T+HZi+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 05:38:00PM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the MediaTek Dynamic Voltage and Frequency Scaling
> Resource Collector (DVFSRC), a hardware module used to collect all the
> requests from both software and the various remote processors embedded
> into the SoC and decide about a minimum operating voltage and a minimum
> DRAM frequency to fulfill those requests in an effort to provide the
> best achievable performance per watt.
>=20
> This hardware IP is capable of transparently performing direct register
> R/W on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml  | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediat=
ek,mt8183-dvfsrc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt81=
83-dvfsrc.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt=
8183-dvfsrc.yaml
> new file mode 100644
> index 000000000000..12bcc3fdfd07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfs=
rc.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8183-dvfsrc.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Dynamic Voltage and Frequency Scaling Resource Collector=
 (DVFSRC)
> +
> +description:
> +  The Dynamic Voltage and Frequency Scaling Resource Collector (DVFSRC) =
is a
> +  Hardware module used to collect all the requests from both software an=
d the
> +  various remote processors embedded into the SoC and decide about a min=
imum
> +  operating voltage and a minimum DRAM frequency to fulfill those reques=
ts in
> +  an effort to provide the best achievable performance per watt.
> +  This hardware IP is capable of transparently performing direct registe=
r R/W
> +  on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +  - Henry Chen <henryc.chen@mediatek.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

This items should not be needed with the enum, right?

> +          - enum:
> +              - mediatek,mt8183-dvfsrc
> +              - mediatek,mt8195-dvfsrc
> +      - items:
> +          - const: mediatek,mt8192-dvfsrc
> +          - const: mediatek,mt8195-dvfsrc
> +
> +  reg:
> +    maxItems: 1
> +    description: DVFSRC common register address and length.
> +
> +patternProperties:
> +  "@[0-9a-f]+$":
> +    type: object

Why is there no enforcement of what a child could be here?

> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        dvfsrc@10012000 {

"dvfsrc" looks like something my (imaginary given allergies) cat would
produce from sitting on my keyboard. Could you use full words for the
node name and make it something that attempts to be generic please?

> +            compatible =3D "mediatek,mt8195-dvfsrc";
> +            reg =3D <0 0x10012000 0 0x1000>;
> +        };
> +    };
> --=20
> 2.44.0
>=20

--29wYAvcTm3T+HZi+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh61WgAKCRB4tDGHoIJi
0nNWAQCySaXXigINWOe/Zbh6nvFd8lAElm6OUs1rfgKt63696wD/R+RgIT2mRIEQ
WUVPpbyXy3TS22RWrWgU0ZHHesGKRgg=
=DGfI
-----END PGP SIGNATURE-----

--29wYAvcTm3T+HZi+--

