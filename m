Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6F9E7E632
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlOSIUjiZjRPhLBiIMMy83/ok2+UKDP+60wHKabouM0=; b=ZekFmnDDgi88CpevY9yL42t/iO
	FlXbSct4eqLXzSTLuxC9f5rq2slLzUYgRHIOmEiU7HrG+wr3E5AqYBA13Y/9yKwkOkLavUYj4leTG
	/E4JjmGzPAsfXWNvOxZpBowYyJnlAmFe7YBkuuqKvptruJxR6UeulXt9hypVQkCmrdhHtr6WhfgWv
	oSQ6HBbsWL0AEQeetmKvivHyh5fVO/bYwLzrpQZ9vwkDocCK2Ke018Pu5YcPmPRrEjsPeZkL4jl7s
	XqtwTzO5m6W8E2x4eLrQbiB/430e53RoavBEntupKgvdBTq48fKreMzWB4zYPY5Pbi+aBXIHFXTXc
	/4P4eCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7hp-00GQVY-2P;
	Tue, 26 Sep 2023 13:02:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7hm-00GQUl-0j;
	Tue, 26 Sep 2023 13:02:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B7B36B810A2;
	Tue, 26 Sep 2023 13:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13F2C433C8;
	Tue, 26 Sep 2023 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695733340;
	bh=1zCxJjJthRbNwkGYNCIe9bhUNO7p6H4Ty2SL0Yudtrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rKs2YG8UwgoN2/7wtROgx5rN/qrr1Yvj6qV0sQHbOCJaF6cxAb0V+eXCNZ/r19nZb
	 ugj9AjcgyqoZRd845JdxLDEzDN1uaUmYbmtVrgHUHnB0MG87JiY4say4gboSeopFmU
	 vW4P9vwJcxnd5wZM4axOMtaxe+8PQUYSSYOd9md8xdDsfb9D+RH0GBloDbfEC3ua5a
	 tI9uX9PvqH7CP1P71b6xi8mGAAbU4wplEDgG5VBBHo51KnoYs8Tc0xC0wePb30MwzB
	 KBwmC609F24rO+u6YcueDUWrhNtQKSy4uJDxKQgbS6vG/Dnx/PWk+VuFj9+/8nmT2O
	 aYXzNHQ6jTj0w==
Date: Tue, 26 Sep 2023 14:02:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>, - Keerthy <j-keerthy@ti.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: Add missing unevaluatedProperties on
 child node schemas
Message-ID: <20230926-rerun-hardcover-b2a64ccc6411@spud>
References: <20230925212729.1976117-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="of7mDBoDabXptSSZ"
Content-Disposition: inline
In-Reply-To: <20230925212729.1976117-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_060222_551521_5AFBCB39 
X-CRM114-Status: GOOD (  19.04  )
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


--of7mDBoDabXptSSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 04:27:24PM -0500, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
>=20
> Add unevaluatedProperties as needed, and then add any missing properties
> flagged by the addition.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/mfd/maxim,max5970.yaml   | 5 +++++
>  Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml | 2 ++
>  Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml  | 1 +
>  Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml  | 1 +
>  Documentation/devicetree/bindings/mfd/rockchip,rk809.yaml  | 3 ++-
>  Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml  | 1 +
>  Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml   | 1 +
>  Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml   | 1 +
>  Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml   | 1 +
>  9 files changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max5970.yaml b/D=
ocumentation/devicetree/bindings/mfd/maxim,max5970.yaml
> index da67742c5aa9..0da5cae3852e 100644
> --- a/Documentation/devicetree/bindings/mfd/maxim,max5970.yaml
> +++ b/Documentation/devicetree/bindings/mfd/maxim,max5970.yaml
> @@ -45,8 +45,13 @@ properties:
>      patternProperties:
>        "^led@[0-3]$":
>          $ref: /schemas/leds/common.yaml#
> +        unevaluatedProperties: false
>          type: object
> =20
> +        properties:
> +          reg:
> +            maximum: 3
> +
>      additionalProperties: false
> =20
>    vss1-supply:
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> index fc2a53148e1c..37423c2e0fdf 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> @@ -40,6 +40,7 @@ properties:
>    regulators:
>      type: object
>      $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
> +    unevaluatedProperties: false
>      description:
>        List of MT6357 BUCKs and LDOs regulators.
> =20
> @@ -59,6 +60,7 @@ properties:
>    keys:
>      type: object
>      $ref: /schemas/input/mediatek,pmic-keys.yaml
> +    unevaluatedProperties: false
>      description:
>        MT6357 power and home keys.
> =20
> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/=
Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> index 4992f71b6fc3..af6cd1969c22 100644
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> @@ -80,6 +80,7 @@ properties:
>        "^(DCDC_REG[1-4]|LDO_REG[1-3])$":
>          type: object
>          $ref: ../regulator/regulator.yaml#
> +        unevaluatedProperties: false
>      unevaluatedProperties: false
> =20
>  allOf:
> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/=
Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
> index f5908fa01a61..8a16d651c2a3 100644
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
> @@ -107,6 +107,7 @@ properties:
>        "^(DCDC_REG[1-4]|LDO_REG[1-8]|SWITCH_REG[1-2])$":
>          type: object
>          $ref: ../regulator/regulator.yaml#
> +        unevaluatedProperties: false
>      unevaluatedProperties: false
> =20
>  required:
> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk809.yaml b/=
Documentation/devicetree/bindings/mfd/rockchip,rk809.yaml
> index 7fb849ac74a7..e922e0176ee7 100644
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk809.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk809.yaml
> @@ -86,7 +86,8 @@ properties:
>      patternProperties:
>        "^(LDO_REG[1-9]|DCDC_REG[1-5]|SWITCH_REG[1-2])$":
>          type: object
> -        $ref: ../regulator/regulator.yaml#
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
>      unevaluatedProperties: false
> =20
>  allOf:
> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/=
Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
> index b57c4b005cf4..ee5bca6e75df 100644
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
> @@ -99,6 +99,7 @@ properties:
>        "^(DCDC_REG[1-4]|DCDC_BOOST|LDO_REG[1-9]|SWITCH_REG|HDMI_SWITCH|OT=
G_SWITCH)$":
>          type: object
>          $ref: ../regulator/regulator.yaml#
> +        unevaluatedProperties: false
>      unevaluatedProperties: false
> =20
>  required:
> diff --git a/Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml b/D=
ocumentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml
> index f6cac4b1079c..ae149eb8593d 100644
> --- a/Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml
> @@ -37,6 +37,7 @@ properties:
>        "^buck[0123]$":
>          type: object
>          $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> =20
>      required:
>        - buck0
> diff --git a/Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml b/D=
ocumentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml
> index dc5a29b5ef7d..5167d6eb904a 100644
> --- a/Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml
> @@ -41,6 +41,7 @@ properties:
>        buck3210:
>          type: object
>          $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> =20
>      required:
>        - buck3210
> diff --git a/Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml b/D=
ocumentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml
> index 012d25111054..eca430edf608 100644
> --- a/Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml
> @@ -47,6 +47,7 @@ properties:
>        "^buck(10|23)$":
>          type: object
>          $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> =20
>      required:
>        - buck10
> --=20
> 2.40.1
>=20

--of7mDBoDabXptSSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRLWVgAKCRB4tDGHoIJi
0lMeAP9wEFGo1fp9dvminX1cSTyNxwEJiVOtmrhGBEMx/7QBnQEA14ReaHI5ItdL
tQ3gvfsJubmpf8sr6r8UU5g8IpyO9QI=
=pqXj
-----END PGP SIGNATURE-----

--of7mDBoDabXptSSZ--

