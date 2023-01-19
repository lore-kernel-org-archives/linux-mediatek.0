Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E84C46467
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+irgeTPLyNUYfNouEshTZpbr4v7VPMBL471TEr0+Q/A=; b=MwsPb0Tm9CITCwn7iG0VxIJ9dD
	iyvA1xhbmT7D0O/qmIFYipKOhYE9ePCCDSCDoZE8Xr0FDMF1yd3yGgHlQSSfy6CO86RXN5/YENosR
	OX6U3BqBjldEiICjp0nQX4hdRMsq/IxlL9eYCCn1RgXQIe3Wk2UvVaYVplQtyZ4iwZVy/6uL4cGYt
	n7Kwms2VVaBnsaN+91I0a5o8iwoNeY7pRiZYj0NLQpd9Pd2pRS6MAX8cUUWHxHmuhT0y4YOYc/jgQ
	PnECMPLwpVSPdzL86MECXAYzfuCozirtySjJMeT6xWVXc2SzPH2buTqG+QZkarpPZJIFzNI37DRTM
	T2kODN4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXxP-0062xC-9m; Thu, 19 Jan 2023 16:40:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXwn-0062fE-U5; Thu, 19 Jan 2023 16:39:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3C210B82620;
	Thu, 19 Jan 2023 16:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72650C433EF;
	Thu, 19 Jan 2023 16:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674146366;
	bh=3bJjdB+nWWOEDo4Kr2GKl2c8L2HL7kShd//vBhxQxIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAmesnlcLr4gXydaCxspVBHJl//Pg48EEE9Ac1TuOp9VDD22lqzx2tTzjv8ElSimU
	 pWOk7Tpp0yXR8fj7azquosDK8AHJhlQDRpdzhmLD0lfvBPvDM1bklUh/uEA76afBPg
	 gC/3E9MSVR5mRb3tWpVgRll+UrxNn6HRXTmG/DSYEtdLdxj9MgElxOuaJhm8BojqV5
	 6lc+OAZIpb4B/ZJpqUfKQFuMWQH55IZjFqgfbDtvV96U9AGQn9gGT06dMbsEZqp2wh
	 A5lS99N0Zg4L8gWvXMMr9qlhpA5dZN8pmF3UDJDBX/MFCXdZP8j6mnVo+Jz9JRA5sM
	 BN2z4OU8HN0KA==
Date: Thu, 19 Jan 2023 16:39:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
Message-ID: <Y8lyORTrfmwIzEEO@sirena.org.uk>
References: <20230118-mt8365-spi-support-v1-0-842a21e50494@baylibre.com>
 <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fQ/9xqKBaGbAnkd8"
Content-Disposition: inline
In-Reply-To: <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
X-Cookie: Serving suggestion.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_083930_203403_D6D54C5C 
X-CRM114-Status: GOOD (  14.44  )
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


--fQ/9xqKBaGbAnkd8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 19, 2023 at 05:28:50PM +0100, Alexandre Mergnat wrote:
> Add the "mediatek,genio" compatible string to support Mediatek
> SPI controller on the genio boards.

>  	{ .compatible = "cisco,spi-petra", .data = &spidev_of_check },
>  	{ .compatible = "micron,spi-authenta", .data = &spidev_of_check },
> +	{ .compatible = "mediatek,genio", .data = &spidev_of_check },

We need a matching update to the binding document.

This does also seem like a terribly generic name - Google
suggests that this is actually a series of numbered products (eg,
Genio 700), perhaps we should be using the specific numbers here?
I guess users would care which they're talking to.  It really
parses as being "generic I/O" which would be an end run around
describing the actual product though it's not actually that.

--fQ/9xqKBaGbAnkd8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPJcjgACgkQJNaLcl1U
h9CRKgf/aE9L/bycOwLdBtT6N4nGdMCTKRv3Lik1C75xILzdQEoMeSY6hbiIprsK
akyYOAkVATInpreBpDdxVLBv2WRoF1gjCOyS658l/ZDWgPSYZ2oIe8cR2Ve4TYYX
OiK6PPIcF/PiQ4/MMrHDd4V3GOQ9JUBukMUM88cbBsqMbHXiITvP83Omb04MPXV2
xyAtq50UCaRGJnlwS1/ahDJ4wSL42RUKgu+6WJNeMckv3L3tM4hhs4qKcZVOfWPV
yDflRvfSWw0mgd6x9C4CoRslSC9FRLEpniU8fRtwbkvP2CnBzJnx7o+mQ3KtFnor
opcBdJ4aSzsX9xPuTU+M97GKibnXeg==
=IObu
-----END PGP SIGNATURE-----

--fQ/9xqKBaGbAnkd8--

