Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8957DC61DF4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 14:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tftPcm3sG/os30T1FxTv0T9OklO84Dq7LOTMlCONs7A=; b=eCwPBX+m1Gd6REMIaBML2giePp
	fYxoGwU4cRBjmTXaqC+F7idictUA+0rwaFNGAqila/Ix4XMKjg/GeDqmdl145HiJ+SWMuz5cux2oV
	4qgrh6Xzx6ZZ3WHwgHFsJiDsqwwOJqX3ETQY6sqZAss6ZEuDo586RHR6zezoBNn+yoxm8bhhNfqMQ
	MPzbuRfd3VxDCxyWWcYpH+9Eh05EbUu6w1PKiR4h4IZezRgW/4lVp+qTu5p3zUrl/YFYdQ019sL1l
	jixTjIXQNFP2GAs3ye2tGPsxtURja/lTDmmwB888pzlFRx8hwW/K6szmJrZ/GKU60v+yZPSr5XAkj
	sh2fW0Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Wri-007NJZ-39;
	Fri, 24 Nov 2023 14:09:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Wrf-007NIj-2s;
	Fri, 24 Nov 2023 14:09:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8BB13CE0023;
	Fri, 24 Nov 2023 14:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DABC433C8;
	Fri, 24 Nov 2023 14:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700834892;
	bh=gCNNSLuNTNgJRezDOscqJbufDhCORYGxigIFY01Gdeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tup9k2Ft33wTnh6RS3H3hryJ0gV/v7LapkgD0de9xKgsL2ZH13Qqm/RwwIktk+2lN
	 uMrxmpcYKvJD++LQdgxN9oxjolbP7JkX/1cFyrD2rdEp8CHy/ymRViFW+l5wR0aNgL
	 8CLv/GMg900O9kAFH8kzB7mYDR7UQY0O0Wz36khdu6qvqahYQXlb6Mu1LTrapvLD0N
	 8YNtF6ssJFQJP+iHA5qysff59STyHraLrvM48XCTTr4O+Z9fJ9QHu5D7rpQhJ9itO+
	 OyIDuKP3MNDlabwDIaxiVCRtJZb8/AS7Ve6Yd7x7+OE4tCQkKS2Obn3CXoce2P/gCn
	 B242ivNLykdLw==
Date: Fri, 24 Nov 2023 14:08:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel /
 Tentacool Chromebooks
Message-ID: <20231124-old-each-230d55963934@spud>
References: <20231012230237.2676469-1-wenst@chromium.org>
 <20231012230237.2676469-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k22Pzja/5vzpnLDi"
Content-Disposition: inline
In-Reply-To: <20231012230237.2676469-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_060904_388700_B237771D 
X-CRM114-Status: GOOD (  19.63  )
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


--k22Pzja/5vzpnLDi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 07:02:28AM +0800, Chen-Yu Tsai wrote:
> Add entries for MT8186 based Tentacruel / Tentacool Chromebooks. The two
> are based on the same board design: the former is a convertible device
> with a touchscreen, stylus, and some extra buttons; the latter is a
> clamshell device and lacks these additional features.
>=20
> The two devices both have two variants. The difference is a second
> source touchpad controller that shares the same address as the original,
> but is incompatible.
>=20
> The extra SKU IDs for the Tentacruel devices map to different sensor
> components attached to the Embedded Controller. These are not visible
> to the main processor.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

I had a chat with Doug at Plumbers about the limitations of your
firmware. As a result, I am fine with acking this if you switch the
order of the sku compatibles to be in descending order.
The firmware can handle that, right?

Cheers,
Conor.

> ---
>  .../devicetree/bindings/arm/mediatek.yaml     | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 60337b439744..aa7e6734b336 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -206,6 +206,32 @@ properties:
>            - enum:
>                - mediatek,mt8183-pumpkin
>            - const: mediatek,mt8183
> +      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402=
F)
> +        items:
> +          - const: google,tentacruel-sku262144
> +          - const: google,tentacruel-sku262145
> +          - const: google,tentacruel-sku262146
> +          - const: google,tentacruel-sku262147
> +          - const: google,tentacruel
> +          - const: mediatek,mt8186
> +      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402=
F)
> +        items:
> +          - const: google,tentacruel-sku262148
> +          - const: google,tentacruel-sku262149
> +          - const: google,tentacruel-sku262150
> +          - const: google,tentacruel-sku262151
> +          - const: google,tentacruel
> +          - const: mediatek,mt8186
> +      - description: Google Tentacool (ASUS Chromebook CM14 CM1402C)
> +        items:
> +          - const: google,tentacruel-sku327681
> +          - const: google,tentacruel
> +          - const: mediatek,mt8186
> +      - description: Google Tentacool (ASUS Chromebook CM14 CM1402C)
> +        items:
> +          - const: google,tentacruel-sku327683
> +          - const: google,tentacruel
> +          - const: mediatek,mt8186
>        - items:
>            - enum:
>                - mediatek,mt8186-evb
> --=20
> 2.42.0.655.g421f12c284-goog
>=20

--k22Pzja/5vzpnLDi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWCuLQAKCRB4tDGHoIJi
0vvFAQDqLdZ9fSLKLXtTwd018oBmapd8qz3y/vFHemYVSnYu3wEA6OPpzezOmyyj
BIxI0dbI2gD0r5mVOmRPaFRmc56q+Q8=
=B7KU
-----END PGP SIGNATURE-----

--k22Pzja/5vzpnLDi--

