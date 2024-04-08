Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8B5CD1292
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdwFjWiaqFDKuGY9ZrOhJHggKA5EsC20woAwpZNCIcs=; b=T/72vcPkZrcxztD0CFuFKSv/Y6
	P0tZrYHu+gPAIjX9gtzfnTkjQniK7lW4bFVxhGOE2JQQ3fxB8qaKqPUS1lVahlLckET2N2SJU7miv
	uc4Jw93E+Fu5feTzGLymFIlZD/goP4ZDwTb3A8pX55wjk/Eo0yWh+873SBFGjRBM4GAN+iC4IIYyA
	acI+tkriaojICwTSrGe3+r+ve+AMk3WQb8s8NysN1LTgNEVabhNoejFpCKtfnO1STjnTH/blCjHs7
	bzru/6EZ0nGJcGZhRyRvJ1t9F2Fbkwhnb1h7FmcYK4tG+Ken3VNxYefpcR9XRzSxPAYRwL+z9P2CU
	dLcdPgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsLp-0000000GGuP-2afQ;
	Mon, 08 Apr 2024 17:00:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsLl-0000000GGtH-3swQ;
	Mon, 08 Apr 2024 17:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0C3D5CE18BE;
	Mon,  8 Apr 2024 17:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AF4C433F1;
	Mon,  8 Apr 2024 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712595602;
	bh=F/uYNaxS40sMgeapgyTFuu5ZgXbsKvLU68sRwUvp5DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1/J2RktfG5kHxBNWr8/izq5bs5OMINTvwhNG8SR5nDCs6pbMIJKo3fIvqCC3ggMw
	 5BvVkO/6IyybsrO/st3QjoJLiQQiTd7dp0vxTYcdtFIhOsmOLv2gsYYYaz9U/7XHCO
	 IxCi9KUrGuORgjA5uGJfy4iz+PqQ36eQNIL+stkeQwWm+WFTehkjroHdlBiWAoteEz
	 8Ewu5cBMSV6Z8ba8ijgth1JyByG439fozXVB5usK2SNJ/5z2kgCxa9Q+m12jlRQDtB
	 oSelpKIi9UW9IS7IFMMJBzUF5XofUMWl2T899zlDBOtM0l/yG7dnMKhTSBJjD/7UWi
	 ZXfhxoqjOZXbg==
Date: Mon, 8 Apr 2024 17:59:57 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 3/3] dt-bindings: pinctrl: mediatek: mt7622: add "base"
 reg
Message-ID: <20240408-hydrated-swimmable-26cec8823926@spud>
References: <20240408090506.21596-1-zajec5@gmail.com>
 <20240408090506.21596-3-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="woQ3kIQkUiTpoflU"
Content-Disposition: inline
In-Reply-To: <20240408090506.21596-3-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_100006_174106_D860B6B8 
X-CRM114-Status: GOOD (  16.59  )
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


--woQ3kIQkUiTpoflU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2024 at 11:05:06AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Both: MT7622 and MT7629 use two reg spaces: "base" and "eint". It wasn't
> covered by the binding and also example didn't match incomplete binding.
> Fix it.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml         | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinc=
trl.yaml
> index a9ab623b2697..eaa65512161a 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.y=
aml
> @@ -19,10 +19,12 @@ properties:
>        - mediatek,mt7629-pinctrl
> =20
>    reg:
> -    maxItems: 1
> +    minItems: 2
> +    maxItems: 2

This should become an items list with descriptions IMO.

>    reg-names:
>      items:
> +      - const: base
>        - const: eint

Why isnt the new region appended to the list?

--woQ3kIQkUiTpoflU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhQijQAKCRB4tDGHoIJi
0qVCAQDStiQ0FQ3sVsUTP7LLvXFpzx5JiKs1w+Zlv2KOUeKJ7QEA8gTc2psWCnPr
SUjNx1TwH3zr3xRMwWjtIkIsF2gMGgs=
=xevL
-----END PGP SIGNATURE-----

--woQ3kIQkUiTpoflU--

