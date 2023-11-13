Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AD2C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 19:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMvUkDLaV3c8vD4HQQEfWc43MeSvAg1XHExjUynkhR0=; b=cSV6sPcFZ6VZt6ThM4j4/PZ27/
	BDoMGA8ktQ9p/fjyKM11twfPNUlpQ/nL4DHDEorFCVep6CZW1kIXykSDFfbKqoQjfXor3u5AoHLCV
	q4XB/JMjcDT0hWKFg+HoDwOXeXWRHJAnp3fr+doAZUjNNPiP+0eYWF0cIg/lhC9ZR3Xj7Pg1X0uPJ
	uOwUFwLvi03EWkinA77AhbPWXLPYfUG7tIE7WBT0WxtMwmpB0tdUEbZFuusT2aONzkIeo686aoycM
	0n8/DzeQ7Bc79YkgUijsve5Lfpchtb6RRRqfoWp+usEvRk4xFlCPZaA6djA1PiBJTIjf7fElQpCNY
	SxxvOZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2d03-00Eb6W-0S;
	Mon, 13 Nov 2023 19:53:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2d00-00Eb5l-0w;
	Mon, 13 Nov 2023 19:53:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AF1CBCE1802;
	Mon, 13 Nov 2023 19:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C2AC433C8;
	Mon, 13 Nov 2023 19:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699905210;
	bh=emrTx/dM/O1+auWw5mA0LhsDE35tCu8mEN5lB2h0qcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWcoHXchhVS/XJD8JwE8HDZGXI97JEStuv5rRHgPgI46bK3IoWhKDgnf2Fm2yZuBr
	 dQ9Uakb9CFFsHtD9Scq9/zMEhRWGeX8WSMLPxfJb3jSMy8oHb9G/xyjjmZDh59UsqC
	 yiAxHKqduNwiKNx14yP6LGnvOXP/UcUJVTLPA/ltWoHU//mb43m5O3jnrnHSqrb4Iy
	 6PkY6FQJ91kEzI8hi4ItyDZU4B2N1z5NzjX5m74VQLp6BdTcUoEdcvDv9OtExQamCt
	 AvQG0LHFTydEaCR6GBJVbjplNBfdwvn0ST0R2Pzp4dt3Y7/QRV8QV+EHuwSLJzNqSP
	 EJyanll7JbEOw==
Date: Mon, 13 Nov 2023 19:53:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: mediatek,mtk-wdt: add
 MT7988 watchdog and toprgu
Message-ID: <20231113-pug-treading-630646dc7ff6@squawk>
References: <e26a98fd0b7b7b431922405732275bac01eaf220.1699890006.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v+4d4Ab1VeqFRJZg"
Content-Disposition: inline
In-Reply-To: <e26a98fd0b7b7b431922405732275bac01eaf220.1699890006.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_115332_527827_170AF29E 
X-CRM114-Status: GOOD (  14.98  )
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


--v+4d4Ab1VeqFRJZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 03:43:24PM +0000, Daniel Golle wrote:
> Add compatible mediatek,mt7988-wdt.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Thanks,
Conor.

> ---
> v2: Drop adding include/dt-binding/mt7988-resets.h as that header is not
>     actually a binding header.
>=20
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.=
yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index cc502838bc398..8d2520241e37f 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -25,6 +25,7 @@ properties:
>            - mediatek,mt6735-wdt
>            - mediatek,mt6795-wdt
>            - mediatek,mt7986-wdt
> +          - mediatek,mt7988-wdt
>            - mediatek,mt8183-wdt
>            - mediatek,mt8186-wdt
>            - mediatek,mt8188-wdt
> --=20
> 2.42.1

--v+4d4Ab1VeqFRJZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVJ+swAKCRB4tDGHoIJi
0ipjAQC7wiCmdGPVV4FvUrbXgyRDZl0xBkSLB9OgdHHHNbRTkQD/XmNHtljnCSiv
Mbh6563hwEBuk9L2hgIJcHQY6wvKiw0=
=oAgM
-----END PGP SIGNATURE-----

--v+4d4Ab1VeqFRJZg--

