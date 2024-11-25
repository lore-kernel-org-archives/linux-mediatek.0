Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C8BD58D7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2024 18:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xA0cFYW7SAufxCw6ruESC1nOEI6CiIQOFDDqarPgBco=; b=MFOKOFX13y8noKP5aaGCHT0DKQ
	MqzIpha4y2TNGaP5H0YixS2SSCQANEExSjSEgX6Hq8bhf1Z9djA6MMTmrgJ1gIK/pd5ByANVncUEV
	FyGxw/0jbMIxBxi32N6NU2ul7KEy0SIIEb1cI80kNnTA5j3n4rDz/GjsP5WJMWypmEKCsZqMrFPa/
	MhR79KVF3//fdWPsfSq/qJWEKSRa/SopjIu+1tulLO3pqIhkjUhFeSUpD4BKZmK9RLLaumLIvJTJY
	AKBZKBtEhS/R9hNh8YS7ZGmaVwRwRBqtTzpQQ/b/atBZD1/yoN1nw493SjK49Kn59rEH83C/yHaHH
	k2KdGIuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFduw-00000008sL1-0jBu;
	Mon, 25 Nov 2024 18:34:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdtQ-00000008sB7-2wBk;
	Mon, 25 Nov 2024 18:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E3E0CA418E1;
	Mon, 25 Nov 2024 18:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E1CC4CECE;
	Mon, 25 Nov 2024 18:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732559583;
	bh=XPUrGuMMAcW/OVsRVSyqN34mwK7tASsk3ayOdMQ2BrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c83eWiLQtk308+lVQ8ed3HoNaIyk3Rj2k0+Bm7vAsGYXKT6YSmrnYpgDvmrbX4HWW
	 IcfiXV3b00sD2MLfRlHaNJ0MytgmskAF1zb3YhOH2or7DrN6KLXZtOZCgOY/fnLJPn
	 LBsRyCoSYhhlVoa+Ui88ZFL8PcO5dSV1C3BtS0Aljd08Bao034U8GVsx1m+W6Km8OB
	 DGGD6rWSP2t/cQyuhBvmMG1mzfPr1KbD3c82VgY+h+X5t5UsEHhuKIIeNKZirFRECZ
	 0oF4TNnoHFVnBR/ftEqycW9ipJKhJME4JhubAj46pWERSrI06oQXgxy7lFFfgcLFOJ
	 ilKRKVYMf20+A==
Date: Mon, 25 Nov 2024 18:32:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Wojciech Macek <wmacek@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie
 Chromebooks
Message-ID: <20241125-snowcap-sulphate-34944bd70cf3@spud>
References: <20241125082130.2390310-1-wmacek@chromium.org>
 <20241125082130.2390310-2-wmacek@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wh9skrtDV6fn0xn2"
Content-Disposition: inline
In-Reply-To: <20241125082130.2390310-2-wmacek@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_103304_862354_F865DD12 
X-CRM114-Status: GOOD (  16.40  )
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


--Wh9skrtDV6fn0xn2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 08:21:28AM +0000, Wojciech Macek wrote:
> Add an entry for the MT8186 based Starmie Chromebooks, also known as the
> ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
> a tablet style chromebook.
>=20
> Signed-off-by: Wojciech Macek <wmacek@chromium.org>
> ---
>=20
> Changelog v2-v1:
>  - Fixed items/const bidings description in mediatek.yaml
>=20
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 1d4bb50fcd8d9..6191a5320c148 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -263,6 +263,19 @@ properties:
>            - const: google,steelix-sku196608
>            - const: google,steelix
>            - const: mediatek,mt8186
> +      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM=
3001))
> +        items:
> +          - const: google,starmie-sku0
> +          - const: google,starmie-sku2
> +          - const: google,starmie-sku3

Compatible order here is back to making little sense. Why is the oldest
SKU, in both cases, appearing first?

> +          - const: google,starmie
> +          - const: mediatek,mt8186
> +      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM=
3001))
> +        items:
> +          - const: google,starmie-sku1
> +          - const: google,starmie-sku4
> +          - const: google,starmie
> +          - const: mediatek,mt8186
>        - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
>          items:
>            - enum:
> --=20
> 2.47.0.371.ga323438b13-goog
>=20

--Wh9skrtDV6fn0xn2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0TC2gAKCRB4tDGHoIJi
0oaxAQCZHgNmPQd9+Cn3CFOz2dqRT//vyTXJ1vq1kjtmdOBQcgEA9bGlmcOZIM/6
8Tkopk7Mo6mHOIAP7E6tk5DhzNYvZgY=
=JxmB
-----END PGP SIGNATURE-----

--Wh9skrtDV6fn0xn2--

