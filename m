Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131EAC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 12:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWqsYVmwnZhG1bRAszSJVqNgo/kGjbuQ87VoBsSZDbg=; b=x5Ys4SuSFcSLtEMIGlSBqCJc5q
	dkfHO9qLzWNGZQ4F1PwQH+P3pcHjU0qg30/GVS0v61fdqx/GjIfrAHn09JCKtJqjf5wy8rcAgosg9
	I+I7WSf/lGl47JcLibXCyQGUQlapgf9o09/Z6t2cCJ/ZN6E0RlZCgKwod7rmpKvNZX1IQCyPD/st5
	AdQRqrdL2OINzsLBe1FhDBCbUZRV2y8lBIZh2Bd3wxt4BajpAlGC8J7H3MVT7LBKWMQHD8DDrlRCE
	L8Z3U+JBtbLVYAO4+p5n+exkqH8dQV1xqoy7M+/cJIhUh1ORmEWtP6/v9qvfvSF9I36e67DXyulps
	28ocihnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzIGR-002Qbf-3X; Mon, 20 Dec 2021 12:59:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzIGC-002QUz-Fv; Mon, 20 Dec 2021 12:59:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9CD55CE102B;
 Mon, 20 Dec 2021 12:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94BDC36AE9;
 Mon, 20 Dec 2021 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640005161;
 bh=cvkjnL8Vt4Ov4zMUd3/Cmz+GyzMZAAaM2YMINoQw4N0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JYQ2U66cYNkrvZfycRjpxFalLKRv4iDByDGyHrqkvlcJ3NHulktQ8DowT80sabbyJ
 EjEX1xnNo0nvWwotPKuHw8R98nS2L3Nb1Fb3J8V79ifUPCUOTJynpFGOlabpM4yEmJ
 6f9EQQtmXc1Icqmn8Qd2OAXoULNsBQKqlWihdMVkoC6dWOBBhd2rPfT7zntnzdYgCf
 tFitLJYAV96cVBFvONS0kGK6sXBNMnFBy5VWyV9JS4v9yBaxBHDmfwRhF1ansG/ygM
 UDoOCDblKMvywdd0NQD0pQfQQUvFhPOMnLFYrXI1Dbn2939yKG5xD2F9n0C/a1SvwV
 eF5kVXGTKurxg==
Date: Mon, 20 Dec 2021 12:59:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: robh+dt@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com,
 bgolaszewski@baylibre.com, sean.wang@mediatek.com,
 bayi.cheng@mediatek.com, gch981213@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7 2/4] dt-bindings: spi: spi-mtk-nor: add new clock name
 'axi' for spi nor
Message-ID: <YcB+Ih5KkdaXGvsS@sirena.org.uk>
References: <20211220121825.6446-1-tinghan.shen@mediatek.com>
 <20211220121825.6446-3-tinghan.shen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20211220121825.6446-3-tinghan.shen@mediatek.com>
X-Cookie: Christ was born in 4 B.C.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_045924_734179_23759C06 
X-CRM114-Status: GOOD (  10.25  )
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
Content-Type: multipart/mixed; boundary="===============7610603080172560965=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7610603080172560965==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NST5rrJ6CjnkHa/k"
Content-Disposition: inline


--NST5rrJ6CjnkHa/k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 20, 2021 at 08:18:23PM +0800, Tinghan Shen wrote:
> Some mtk spi nor has dedicated dma(s) inside. Add a new clock name, axi,
> for spi nor dma bus clock.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--NST5rrJ6CjnkHa/k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHAfiIACgkQJNaLcl1U
h9CFkQf+PYaFOrmJrFz0nn/s4JFUuZA/0JmpfjK6Cv9M4kE+d077UHibmgwtxJnm
MsH5VHjOgH7VdSFmaOi8vbSVyjjgEIQv23PP4JeNIJdZ9PO04XsveM9RosrAndfo
T4H5HQTulqCYybkNBff2P1koJMZLitk9DilbGRv0KSQx6kf2fu04Hkp6Gb38ryee
I2CydD5ul/+DCAG6VV1d9Q+dmYM3VH1qQnktN34pLpyVsDQX5MGaPDtS2xEzm+Bn
W6nVpc6qqH2aNt3bQcil1SYjOnPx4urfxJ0+Nq0xhmbl+YsVFN8fdwq+LNbdBxYp
89C6bb664Q3Tyj8qZMl0y9Iqn2tRiQ==
=k7OU
-----END PGP SIGNATURE-----

--NST5rrJ6CjnkHa/k--


--===============7610603080172560965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7610603080172560965==--

