Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DC6CDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 15:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImiYODPWQDY0FEuofdrxvXuiGFWgDixhEm922r7muWc=; b=YRvpUVtg8Jh2yAS7uozGFSoDip
	ZZIhhLUa6MgHXaoyuYyrV44TWTDdYqZkc0Tz3/VKmmMtdS2YLLdXO9SY/KEOpMzVL178oStXdpq5O
	0qakkfasCV23wuUah9QjVlGKOMUHo8T9oFn9eklRk1gd2rcbQA+8UQ3YhX64Q2BQNBdaYiVRE++cd
	+TA30LAToiNiSRLT5XrBeM+VEjqAbMah5QmLU3m+EtmwiWecwo0bs7BVgaIekvIj1+k0ejsiUGAvU
	ctpp9LV+k8N8KCNMopjMyLzhAqpbCiDZT6R7bcU3XQ4MiYUlrxxQfUZy0B6u3PE/VCNM02s+9ZNVA
	itafv5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrJpQ-003eWe-05;
	Fri, 13 Oct 2023 15:11:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrJpM-003eVj-0m;
	Fri, 13 Oct 2023 15:11:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E9B43CE3158;
	Fri, 13 Oct 2023 15:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B15CC433C8;
	Fri, 13 Oct 2023 15:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697209905;
	bh=wWx6bTT4peFPZVDN8jlp9bueUTF/tNc81wMs/mO9uj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/mL+Odl84kIo3oHvupfFbsf/tVcWYeTnMdAdhvutDphfIzwGZgAZX6nKHwUgdkl8
	 y0I2K113S2oSv3XP+IsqGupv/EcJv9Cvy52dpxXXBr2SadAyCCiSjJrUhpI33TpLZu
	 V+FP8aeAU3rPI0msypo955hyfUfQJhqqrh0etKmTBXop34CyGW1hAtowpMaMyu6qvp
	 N1REqtSE8WxrQAttdX636Xfo0wji19uJTF8HMrZJHPOfLxhSLPdK424sdrGM8tYRyh
	 OWXc7SMwPtx4nD49z7HZRfyNRYKpC9N08nJMUlcI5yF0oy9LPQAd/LdGnXz4WAPrjm
	 3pm7uPxI+BWcA==
Date: Fri, 13 Oct 2023 16:11:40 +0100
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
Message-ID: <20231013-washer-mortally-b27c196ac50f@spud>
References: <20231012230237.2676469-1-wenst@chromium.org>
 <20231012230237.2676469-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qZrNVeNY4C8BPHbt"
Content-Disposition: inline
In-Reply-To: <20231012230237.2676469-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_081148_628954_7E076E0C 
X-CRM114-Status: GOOD (  18.89  )
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


--qZrNVeNY4C8BPHbt
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

> The extra SKU IDs for the Tentacruel devices map to different sensor
> components attached to the Embedded Controller. These are not visible
> to the main processor.

Wha? Given your ordering, is a "google,tentacruel-sku262144" a super-set
of "google,tentacruel-sku262145"? If not, this compatible ordering
doesn't make sense. I can't tell from your description, and the
absence of a
items:
	  - const: google,tentacruel-sku262145
	  - const: google,tentacruel-sku262146
	  - const: google,tentacruel-sku262147
	  - const: google,tentacruel
	  - const: mediatek,mt8186
suggests that there is no google,tentacruel-sku262145
device?

Cheers,
Conor.

>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
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

--qZrNVeNY4C8BPHbt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSleLAAKCRB4tDGHoIJi
0pRSAQCm5Pjv7akIozKm62dk8SGuLSxCh0ovD5X2IwGkDAvM9gD+LDDRxce4O9bi
/KzKV6TfbpjgrtL+at7HUZafG9wFlQM=
=wdgM
-----END PGP SIGNATURE-----

--qZrNVeNY4C8BPHbt--

