Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE514C71156
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 15:35:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7B5C20B1F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 15:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7B5C20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xX8kxFpChPGHxR77slRYzcOlkx1ouNiFV7HWgtcRQ7Y=; b=OAm26OZ9qGfaHUHh9IXME++/f
	VmSoY1NEMvOYjAJTKkSQPmIoehvD0e2Wtkk9mvMWYusc+zlZQElQ/952/1fQzjQjO54NOzPExlcD4
	vu3PHNxWMJT24XzDl5TDkZVbmb8R9/1J4OQJBHTUeRaG2OPqp03SxvIm5EpIpLgP4VTHfdcifyETb
	JCfyLbuyi1lcxUoCps/Zj14dBbmQ5VWz5CcZJdqRwK+z6DcZn89sULWu1VL5zRNdaAolunCJvjDdN
	Qz4F3fPnAMJ7QgNJuXj4qEGeFv1+aeZPt6jE5+gzLjpfIDgrUU6gC/rYZQgKhxVoboQTEbIdrHb9Q
	1tds0SQ0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkUAY-0002av-8v; Wed, 02 Dec 2020 15:35:50 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkUAU-0002ZU-EG; Wed, 02 Dec 2020 15:35:47 +0000
Received: from localhost (p54b3307e.dip0.t-ipconnect.de [84.179.48.126])
 by pokefinder.org (Postfix) with ESMTPSA id E36432C048D;
 Wed,  2 Dec 2020 16:35:43 +0100 (CET)
Date: Wed, 2 Dec 2020 16:35:43 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: qii.wang@mediatek.com
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
Message-ID: <20201202153543.GG874@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_103546_621609_C286BEFC 
X-CRM114-Status: GOOD (  10.43  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1921665931183849499=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1921665931183849499==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z0eOaCaDLjvTGF2l"
Content-Disposition: inline


--z0eOaCaDLjvTGF2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> Some i2c device driver indirectly uses I2C driver when it is now
> being suspended. The i2c devices driver is suspended during the
> NOIRQ phase and this cannot be changed due to other dependencies.
> Therefore, we also need to move the suspend handling for the I2C
> controller driver to the NOIRQ phase as well.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Is this a bugfix and should go into 5.10? Or can it wait for 5.11?

Thanks,

   Wolfram


--z0eOaCaDLjvTGF2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/HtEsACgkQFA3kzBSg
KbYskhAAtZFZ7ZH5z0Kt+bbVGxsk8eRbGrFiFXfHq1nNVMmoNdIV/B1lbO5M0OyX
Qd4iL1aJ9fgM9I5A8BWKMKTjcYPBCipSoItIoqe9LXsurw7Tzm7zuGHHKrbuzmOb
7qONskLtS4Hxl6Eiv47FsWnkSZkJkrfqFmQ/M/xrF1JwAxZu70k7EEbDYQw4JEgT
8t2Vgf3lXLVMrJnjAIhFM91bD8cSbgp5EuKsZUnI7qlj2kL30Gu5dk62oRtsXd4Q
xhlvJzpoGrpuGtV4odMJJ5nLuK345sMLW1qYroEX/HiOmbzC8dwZsHAQK5Vwqs+n
78ZYPpVlc4vAjT1dG9ImYsJ0DB2TAr/jTQWSvsoygz1ot24Lgl1uHE2hf3ja7rRz
Jm9tLBcItIftWZPrazk2V7Pz12GxOhLnX3AnPLlcdyhukZIKbPHez8eROI0DF/D2
udORtMdlb/xPHxXEEGVIhablxpsSMfhiFMqDLTUajCijSDpnKQeeiHy8YPSm2N2c
4xWmt2cDGWuQmiXLdULZV/MN/SGb3nyz/frz0/FOXZzHp+ishjOhtoXRukTRJ5Cb
03aLh5+yjdINxX8NhDXoGvaiR0PFVXbwc5FsSPhry/5emOonR8m7+59scOYF1aJG
UjJDUQL+pvxZliBkC+GJ1FsZ/zh7nXKWDesG+Q5EvfFbizaidbY=
=8g9O
-----END PGP SIGNATURE-----

--z0eOaCaDLjvTGF2l--


--===============1921665931183849499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1921665931183849499==--

