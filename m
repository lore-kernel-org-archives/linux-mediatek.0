Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0BBC004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 18:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQ1fSGGlGH77kXooVwbjybwU1LhFwJogktLoTx8jPAQ=; b=UyDjJ5uJdX6Y4RNUISANBAaWak
	geGJjMBZkDXOeYlsRzbfwyuAr8uFUBtkIgSCp1eQ1ztYuqt305woX5So/yFBqSMVw5jOKnDcdzmZk
	3fwKrKI3uAt69va6MfgLGQfjTl8t8MhFnq9ylL3oN+hNQ6KoZXV0ZWf7D/xVRTe41ko4dEWj/PY6g
	qawFqzllV/OwhbuPea1ppqXMe1Bi12ILZrmZLLUkHmfYX7V0v9N4N38Z/sssrb2WVdU3Hplfefxfi
	Msh+gcCQSfF1JvUb7S/Vx53ec3u2+DYcEbYVx93N7w3B5EeYrufkjKrf2i+o6Hb3rnGiRvJ2dpIGm
	Hc01oyAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZFG-006RFg-Jk; Thu, 19 Jan 2023 18:02:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZF2-006R8G-FD; Thu, 19 Jan 2023 18:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EQ1fSGGlGH77kXooVwbjybwU1LhFwJogktLoTx8jPAQ=; b=pI+2t7jwoPpZRnajM4O1P19ieN
	X0Jfq9jXSmfWk9ylymZ4CCVfB+giDvyUJYNqPnNtJgC0bx80o47LboLRQ9gPfEyoQkPItIH+WnJUq
	cVmZA7Zfb28ztOAmNLtbbe7q/kFz71QddRcxSTdADbWf6uwoJaumjtFtSNhPGa8/qSpLUSyQ5qPg6
	1UVJwF0GVWku3HlbG52Hh0oXV5AOnIcb8zQzjpGAv9nYDKy5zyBvgqOMuYt279RzIjlEzNTPY8wk6
	Kdrn/AReujlpo7KlbERUj8zG6z6+HPBmv/B3mRE40zgHZDEH9Ybe0ejFwLUWDUy7uAClN9oEexWwI
	apscp/ig==;
Received: from ams.source.kernel.org ([145.40.68.75])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIYph-000Nco-1z;
	Thu, 19 Jan 2023 17:36:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 57844B826A7;
	Thu, 19 Jan 2023 17:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C02DC433D2;
	Thu, 19 Jan 2023 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674149789;
	bh=EQ1fSGGlGH77kXooVwbjybwU1LhFwJogktLoTx8jPAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mz7rCjR/A33xwAO7ZrvKUN7jh8KtBbd7CBPKGiVSdyLBLmM+cwcl38xhjCKqv8ey6
	 i9TkTBrT538e04b5/quBdE7b4XeTRQUEVPJ7EG09A5Y0FBRp7UYIlqin9YP7zj6CxP
	 RM+FC0eKo8W6L8jB0pFZr2ZjOeWRxNy7M5srSVRBIyMIwSLpppt4+ZfM784Vk21gUs
	 RsPxKj0NgF3FjMhNdhoW2YbOe4HsqpH3IorX9l22WD5lUDEqYvMPgGPx3Kn/987zuH
	 1Zm4hvm/A9fKsJC5eo5yY64TPTfJ8oI7B68xbMpWixcnm5ObJENOhSBJDFI5DHjJvn
	 RcMZ43COLKsjA==
Date: Thu, 19 Jan 2023 17:36:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 2/2] spi: spidev: add new mediatek support
Message-ID: <Y8l/mQjjgKJiE1/F@sirena.org.uk>
References: <20230118-mt8365-spi-support-v2-0-be3ac97a28c6@baylibre.com>
 <20230118-mt8365-spi-support-v2-2-be3ac97a28c6@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jz0aOHbv75kB/Hqi"
Content-Disposition: inline
In-Reply-To: <20230118-mt8365-spi-support-v2-2-be3ac97a28c6@baylibre.com>
X-Cookie: Serving suggestion.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_173613_848699_1AC3C685 
X-CRM114-Status: GOOD (  11.62  )
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


--Jz0aOHbv75kB/Hqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 19, 2023 at 06:28:20PM +0100, Alexandre Mergnat wrote:
> Add the "mediatek,genio" compatible string to support Mediatek
> SPI controller on the genio boards.

All my previous review comments stand, please don't ignore review
feedback.

--Jz0aOHbv75kB/Hqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPJf5gACgkQJNaLcl1U
h9C0BAf+Jl+1E0pCscUWyq547PeayYiVt04DMkk+4q1qCXREpiJP/zLOicoEZCWz
2xIkBo1hIB1RAJXIZWkrMO/kN5SbqsLQ+ySgMVaWK/Lp3aL0M8YyPF34pmEhLojN
ly/WNvpWVwmdO6n6NGGsK1tgp7IE4pyEj9M08YmBcRbWzMddKO71u1YMgY+mmOcN
NDEc2E1vmp4aWd22lsMmgtFlJgpRPAw0+/T6nA+XLdP4u3EvGo+Au3LOa3ij1xOA
tWw3+wlro3nIC9+h0Iwy5rWLBzuaxMccUhM2ZEYAbj1a8Nq8yq8Of+7vlxOhiee/
NdWsOYPhtLy6IuWthaMnaMi7vzliew==
=uuJE
-----END PGP SIGNATURE-----

--Jz0aOHbv75kB/Hqi--

