Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1CCC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 20:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoazYuFPfobm0jkOCHjxLLOK33nDlejwxbuKXZTj6uU=; b=JvG5kHR4Ayn38U9k9v3PJV4j3E
	K2zEzbV4RO4pmBotpjBPcFL9X+2pb0lpJ3PgYFv+ktZEGAjcLB6D2Fa2w0UD38S8BnQNTxMLePkE2
	D1+erEUo6Pz5gGWQN+oOW2CqIcBA6zqJfJpt5vld28BrSDM7hgOGjli+B5IBBvUX2jxyALPzlgE0F
	6goIqlKmMe1F6C0fzBjqfTOsxG9lgYemqKY40VQ+PTZrm8AO7Ft6XSTDE8vwt3POM6blJw7iHVKjq
	3BI0OCUGYIfPl1c1juyHJ87UEIEgYw4bD2xjrDzzQPImRMN1JzuEDwHoaERcRElR1DnJSPWZrtnU5
	UP1zBWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1CuB-00B4lV-3f; Tue, 14 Jun 2022 20:12:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Ctx-00B4gq-SS; Tue, 14 Jun 2022 20:12:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 998ED614E7;
	Tue, 14 Jun 2022 20:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3FCC3411F;
	Tue, 14 Jun 2022 20:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655237556;
	bh=K5sMYcQa8KcOJXSCKfv+sFO+l852HartgdnTcv4p7so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3BmAGBn6NGciCmPlQayj2yDq9jL2NaTEe/GRV2ekXUGGZAM/MJsq7FdEVj+21EgB
	 k2abiF7N9LvGSWcmr3Ymx/F1yo5VTktL44TSyZVG/QCjvdi1vecgXCRaCYrOsOSSrc
	 RXwyoSHObgEPZTTSFHabkqMuFsHfYvj3DET5kw9QKSmuzOlRKsMOgeUJWsdo5InnUV
	 N6rERiBymHuvCZp3UA3q6ZiFkyjqEf+p0Aevb85pNWXgUeqGGJwNNynQ9eQL52yuKl
	 nADPCjAz9GdoAyEkMXS6x6FLslDQ4WiqVEOAlc9PeeasgwqVocSmBTYnap0uk2Fchk
	 D6jfQaRBg695w==
Date: Tue, 14 Jun 2022 22:12:32 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dan.carpenter@oracle.com, Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] i2c: mediatek: Fix an error handling path in
 mtk_i2c_probe()
Message-ID: <YqjrsJLXEyAJU40B@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	dan.carpenter@oracle.com, Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
References: <8001bcdbee9f8afc85118c99b8166eb6473dcba5.1653222111.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
In-Reply-To: <8001bcdbee9f8afc85118c99b8166eb6473dcba5.1653222111.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_131237_993225_14EBB669 
X-CRM114-Status: GOOD (  11.37  )
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
Content-Type: multipart/mixed; boundary="===============2078181898563310460=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2078181898563310460==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LPJ/UywH79b/GoGa"
Content-Disposition: inline


--LPJ/UywH79b/GoGa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 22, 2022 at 02:22:07PM +0200, Christophe JAILLET wrote:
> The clsk are prepared, enabled, then disabled. So if an error occurs after
> the disable step, they are still prepared.
>=20
> Add an error handling path to unprepare the clks in such a case, as alrea=
dy
> done in the .remove function.
>=20
> Fixes: 8b4fc246c3ff ("i2c: mediatek: Optimize master_xfer() and avoid cir=
cular locking")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to for-current, thanks!


--LPJ/UywH79b/GoGa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKo67AACgkQFA3kzBSg
KbYsUQ//RC/VArnR3VlNNgSKRNoCEEel97zMSxrWxq65CjNsnO8W3zD/9DyqzyQS
cJyDJkxEdKcDK8EQSF+iW0qLRPg4HLCs6WBoOsdgcSCmxv5YiTOmluHkO+kGP7ne
tYYUuvhihoHqLAOtYXYYWi9kNH0cFOvIur0h2J/EHno/2LA+6fJEGMSI942PNbV8
o6vTD9i7xhMIa8wpGE/Bwg0vMB7aBzuR2MfHoMmRTVJd/EsSNOLY+Eb6si+1mQLt
3g8JsGEKiU7yRPcQBUl6aWQjT6OrHRHI0z6JCcFsDibkVn0W8FyKw6HG+xQo9ZZy
lgfNdquCbZcs2fVnCTgXTtj4S/NRxYrDqN1KC3H76EmwouJ5ha7C0R+Yh+6Se8/f
V463JjPsZWzQhIHTYcZ87bfte3w5/4iTgGhGMkddmKTRFv4WYkJZxDbX84f15ktB
HTngGpZqNx/25++2fiZ+32V3NlPL9tRf/h2CXw9rFATe+72SbXKvNGVLgKvC0EfM
nSdZJg9lXsD49Ds2/UtYnBXtCQ0yYiGsSbvAzP/CC6tHn/vwGcVVqJixGAE7bUUu
M/S60KHdu3GP6m400nWh4r+C2TWzL9QFZML2X+gYuWxWD9Xubx72EqdzXoGKwDZU
NZjihxOZB2V5KDIJ7unDrC/octpmuAMLGE+ZMxFgJL9hadYZGrA=
=SD9T
-----END PGP SIGNATURE-----

--LPJ/UywH79b/GoGa--


--===============2078181898563310460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2078181898563310460==--

