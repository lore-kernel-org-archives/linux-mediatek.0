Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093E9C4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 18:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBFL/3PYVNz5qdVBVK4ezaluQB9BafitOXE3lH3QRaI=; b=EcRUztoSbb+kcPQU46GSlOfr12
	W2Kqo55iLEsLL3P3VqsTb7bbAGoQqUw+D/vhxZeIQpNNM75+kLMeuIQ490+foGtXLeVHzpCqJ0jzM
	dOzA3CwNp3pCMhMIR8dWS0laTHh2YhNQrO6IocDz2/1WLmro6NAxxipPBTeTZX0n+ZQV9FTVVumE3
	jH2AkLkUL2SoP8pD1LTmXA1kWZxBnY3dJ7Q4dzVH40wuXXELlpmVZiJKf3khhmPS+OJbNWIm1uNq2
	546qyXNAyFJzqQuf0XEP82fk0FEiUTqeSVio7tlQyI1hPdoI/ebTuPkuIxGi6l87zWTFbrQef52aG
	eKf24LrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZxMk-0000000AI6g-2IUA;
	Tue, 13 Feb 2024 18:18:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZxMh-0000000AI5u-2ZM0;
	Tue, 13 Feb 2024 18:18:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D6E56CE1A5C;
	Tue, 13 Feb 2024 18:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B2BC433C7;
	Tue, 13 Feb 2024 18:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707848321;
	bh=SXLQ1pLcws2l0Xu0viSOaOO/O0DM9PSjTl8YaFye7O4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ad5JWAs5XvKh8//hxsQfl8sVNqHO31XPsh+ZF8+QSExCv6zGXvJzPT5IGPP9aRFeN
	 0wjW8TZGBHZCHFSEVjr6P8iE+daTR0e8NnAluUKjvAT4adPufiTasPE+Uqdv0lbw8U
	 d6gwYaWj1W00LAzE8ntx72wAfwn62hcHengKnCpS49gz2Jgy/IndIVhyMO7XFGq9E/
	 xH6t91BnSH9I/tMgtoNLiYl8bA45jzuKULGxgMrEU/u/xgJ2WIkh9kB3oeLT22VJn6
	 nvL6jqxyg6zvs4HTDRKb359KCTZEDNx4bYMNjFKRFU2MVTB0LH3kjxak2fyFPFRzae
	 12mz6EtEUxCiw==
Date: Tue, 13 Feb 2024 18:18:36 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible
 for MT7988
Message-ID: <20240213-resource-evaluator-0754cfd5882d@spud>
References: <20240213164633.25447-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IwSpqDfDVNcc7RLA"
Content-Disposition: inline
In-Reply-To: <20240213164633.25447-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_101843_852275_D3EAE5C5 
X-CRM114-Status: GOOD (  14.96  )
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


--IwSpqDfDVNcc7RLA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 05:46:32PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> MT7988 has on-SoC controller that can control up to 8 PWMs.

I see a binding and a dts patch, but no driver patch, how come?

Also, what makes this incompatibly different with the other devices in
the binding, like the 8183?

Cheers,
Conor.

>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.ya=
ml b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
> index 0fbe8a6469eb..a5c308801619 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
> @@ -24,6 +24,7 @@ properties:
>            - mediatek,mt7629-pwm
>            - mediatek,mt7981-pwm
>            - mediatek,mt7986-pwm
> +          - mediatek,mt7988-pwm
>            - mediatek,mt8183-pwm
>            - mediatek,mt8365-pwm
>            - mediatek,mt8516-pwm
> --=20
> 2.35.3
>=20

--IwSpqDfDVNcc7RLA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcuyewAKCRB4tDGHoIJi
0uxEAQDGsfDNcKZx9Z0a6eodrNyCrahRr5IkdabX4h7AqUDWPAEA17xUt82LhKde
tA7TZ/ft3fpvv0XodKAVGbutj7bELQA=
=znwI
-----END PGP SIGNATURE-----

--IwSpqDfDVNcc7RLA--

