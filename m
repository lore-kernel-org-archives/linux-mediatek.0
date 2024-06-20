Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396C9C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 16:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqBhLTOLW8MUbiqZNQWOeWTIc465x/TqSH+bJSl78C8=; b=xlFDNF1oMIVbP5yizONXKa92No
	xS/Xu7LeV9NDy6VLa3mwwXN2+k2qpk9tcSCE0ZeFHkOnTFPXJpquLyIW1Q8GIufjLAqT/GORpqrEc
	dGxQmaQHjXhAAziylopTdFVFIrv7uh+lslcnHnF+EfWAYfdDvwE1wWcRxaH5fUUjKgeE3r+V9YqzD
	AzMBWubtG8avcJGjPPDJgktEXh/IAm0yvfJZe8Z62hPlOg+y/57YYC/Vfx3CmAmVmBD9DjIrBOxfk
	xlPGzLrrP0O3I2X2ayqzdydkiI5W8KlwT29YIqXmLa+FACAMAsIokO2Q+Oq0yZiAyxW1DW2z1xJnY
	t3ZrPG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKPg-00000005mg9-2iRa;
	Thu, 20 Jun 2024 16:13:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKPd-00000005me4-1qb0;
	Thu, 20 Jun 2024 16:13:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7726DCE1CA4;
	Thu, 20 Jun 2024 16:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21210C2BD10;
	Thu, 20 Jun 2024 16:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718900002;
	bh=Y2XnVc5qprGNwRa8U74XufU+zrX/nQbjQ00bUMaI/Ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DECYDU5g7HGl0Xeb0KT+2RpfdCI2jlWeh+BcSYQdHfRlfdxqYRmvMCNXCuX9XH0vr
	 tONblMXzE9iJ+HEHPE4wCYKd7rMTxjOByAxmoFW3LVje+8Xt1axxVXR7ixLCwIhbEO
	 +Et+svjtyWp9tQ1Sg17cZ8wMgQw7j+LWfRhSrsimAHS8sFjdjLZMQj3JOa5Uawy/Qq
	 bd3ZZE9uUqwrt+8qNZNZfncTNxxUa5oj9GQraLcx2qiMEmbo3RINcOZNRWQRxerRVJ
	 /CJg/rN3cYrZSzTtD85SmbyO12BrdgTWn5Ft2dF9WWJYcSeWeuVF2ZgungBhP68nes
	 D4KNfglXAuf4g==
Date: Thu, 20 Jun 2024 17:13:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: mediatek: Add MT8186 Voltorb
 Chromebooks
Message-ID: <20240620-outcome-circulate-40a2971f53b9@spud>
References: <20240620094746.2404753-1-wenst@chromium.org>
 <20240620094746.2404753-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1QLSocapFcYqXwwD"
Content-Disposition: inline
In-Reply-To: <20240620094746.2404753-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_091325_701420_FDDB088E 
X-CRM114-Status: GOOD (  15.31  )
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


--1QLSocapFcYqXwwD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 05:47:37PM +0800, Chen-Yu Tsai wrote:
> Add an entry for the MT8186 based Voltorb Chromebooks, also known as the
> Acer Chromebook 311 (C723/C723T). The device is a clamshell style laptop
> with an optional touchscreen.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index b1b09db0bd65..e7746afeb0b3 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -301,6 +301,13 @@ properties:
>            - const: google,tentacruel-sku327683
>            - const: google,tentacruel
>            - const: mediatek,mt8186
> +      - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
> +        items:
> +          - enum:
> +              - google,voltorb-sku589824
> +              - google,voltorb-sku589825

This looks rather sane for a chromebook!
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +          - const: google,voltorb
> +          - const: mediatek,mt8186
>        - items:
>            - enum:
>                - mediatek,mt8186-evb
> --=20
> 2.45.2.741.gdbec12cfda-goog
>=20

--1QLSocapFcYqXwwD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRVHQAKCRB4tDGHoIJi
0nSmAP0fzR6YRVaWBfPAYCkbmRn75YJnVlZy3QoKZreurhO/JQEAtAzyzrZC6E2N
6sGU4LQJxLJ7f9cZmwI1swMhTaqjsQU=
=KWZj
-----END PGP SIGNATURE-----

--1QLSocapFcYqXwwD--

