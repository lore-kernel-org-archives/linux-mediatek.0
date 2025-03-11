Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FBEC282EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 20:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7aKV7RSq3W7jE5vdjSlQL4UIz++800/MCBcVjHjOl4=; b=F/AefMGdkmEea9DQOBOcDjlaRP
	Hp7gFChhLUNLV2uVxskLDs8a8KxeXV6WYahTlV6sqVW8S48Ug6NPUUeCf7iZsLvLhmDtXIWuTrLaA
	g/B0xiSYBBSInuaWGWYBnjbQhy6+RrTXUqvnNEpVJVsXf+BO/kfHjAXIOzH7QIigFQUnldcEvJemU
	WVzpqrN+t8jl5b1ybIeSv/E25I9BtF/Fr2Dg55kGFb6sEt+PuYMKilPQuypHYLIWQPjeIoJE2bX6h
	HsxJ0LXo3TIiCNLka92i4hdU7YN73R8qgElQ+Pf8QDsSsu6PM5KXYOdbQpc5aZS0lZ7ErBdj3MP6A
	I6ypv9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6Is-00000006vnl-3f7z;
	Tue, 11 Mar 2025 20:34:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5tF-00000006t06-2wq4;
	Tue, 11 Mar 2025 20:07:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85737A464C8;
	Tue, 11 Mar 2025 20:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF50C4CEE9;
	Tue, 11 Mar 2025 20:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741723668;
	bh=kypsoT+y8Xwt8jAYhLNEnwar1djrWfc1JLO5IbchjC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tjeq6X0429QkGYOfvtTSP68hCTEAk7tXifXZWYmaYPtIW1yT3Z41d3tlZ6tAEBjV6
	 Nu5ijlgHQ8JR3KznPZcuksAkqMTzcrY0zIikKCMTg9syTFJy/7+Sd5RSy63wTFYru0
	 4b87SAF4Ki23rjhuGrZV/ndPPHutoLSxxVBdiShjCDPfg01YMYUslYfTknrK/mqRyu
	 kr2vBuysMCVssvx/2bGh2sClVnz81+Y36YPSlAuKj8angw/Kx9mARrh7Gxbbr5IJIg
	 MoU+KZjksqaamOCy4qFUJF8+2Aia6G7AuovSHoL3JC1GLRErJqW0/4dtK7h4BXEOKB
	 gysic/nHt3nUQ==
Date: Tue, 11 Mar 2025 21:07:45 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Add gpio-ranges property for EN7581 gpio controller
Message-ID: <Z9CYEZloamPhVdBS@lore-desk>
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="icN7TOB+24o1XSzr"
Content-Disposition: inline
In-Reply-To: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_130749_827756_AF464D44 
X-CRM114-Status: GOOD (  11.59  )
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


--icN7TOB+24o1XSzr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Introduce missing gpio-ranges property for Airoha EN7581 evaluation
> board
>=20

Hi Linus and Angelo,

is it fine if this series goes via linux-mediatek tree?
en7581_pinctrl node is only defined there for the moment.

Regards,
Lorenzo

> ---
> Lorenzo Bianconi (2):
>       dt-bindings: pinctrl: airoha: Add missing gpio-ranges property
>       arm64: dts: airoha: en7581: Add gpio-ranges property for gpio contr=
oller
>=20
>  Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml | 3=
 +++
>  arch/arm64/boot/dts/airoha/en7581-evb.dts                            | 4=
 ++++
>  2 files changed, 7 insertions(+)
> ---
> base-commit: a8a297e8bb3dd304cac77f7c435a4983d885a657
> change-id: 20250307-en7581-gpio-range-fceb30c7e2c9
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--icN7TOB+24o1XSzr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ9CYEQAKCRA6cBh0uS2t
rMEWAP46Y725zv4QZ2O/ml8GZ0JZ2mc8jhx0fJFGt3Hkmmo2AAD/aNhB7oE+OqvP
7D82+qP5g/4Qg6+HtlRX/B6Gk78LYQg=
=nXDU
-----END PGP SIGNATURE-----

--icN7TOB+24o1XSzr--

