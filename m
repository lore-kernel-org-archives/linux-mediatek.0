Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56F7C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:47:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FCCB21973
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lAe7P5np"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FCCB21973
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UZOLZdYqA2uYUIPj3eZgxVFCL0bIsEUEPpMO8jQXdOw=; b=lAe7P5np5PSs4W1ig94LYDFsA
	99BV6b9MFuBCgH91dROuxF+sW4cKwQHjPcA9znL0YXrcY+HFXJuAOPFwizAKDlbriMHZr+4re4Cac
	KqjP6HKOfVqz67w/2/2Vv4TunLaLiBWP41ySFa7wRrcbHqXczfwJAyzPR3V24R6vjJzrTwtxa1XOH
	xv/vAa+YVRE/NLyA2UTwrr597EdF8gAqnabhGthCA1xhhd8w0tSFMXPe1+qfUN9iyQLdDdQqlUJrm
	amrqC/Q2PCh0y7jLBZQc5IUUhocQylqQmMWKGALz8FJqb5u2zD696Xbxa4ZViWHgEtBV0FXax79m3
	pI5CF/jSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFvkh-0008JM-OF; Wed, 09 Sep 2020 08:46:51 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFvke-0008IM-CH; Wed, 09 Sep 2020 08:46:49 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id F21A51C0B87; Wed,  9 Sep 2020 10:46:43 +0200 (CEST)
Date: Wed, 9 Sep 2020 10:46:43 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 1/2] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200909084643.GB10891@amd>
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
 <1598441840-15226-2-git-send-email-gene.chen.richtek@gmail.com>
 <1b6e8bf7-fc11-542b-f570-cebb0b6c3442@ti.com>
MIME-Version: 1.0
In-Reply-To: <1b6e8bf7-fc11-542b-f570-cebb0b6c3442@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_044648_524441_BA471280 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: linux-arm-kernel@lists.infradead.org, gene_chen@richtek.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, jacek.anaszewski@gmail.com,
 matthias.bgg@gmail.com, Gene Chen <gene.chen.richtek@gmail.com>,
 Wilma.Wu@mediatek.com, linux-leds@vger.kernel.org, shufan_lee@richtek.com
Content-Type: multipart/mixed; boundary="===============5842824110116340217=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5842824110116340217==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!
>=20
> >@@ -271,6 +271,17 @@ config LEDS_MT6323
> >  	  This option enables support for on-chip LED drivers found on
> >  	  Mediatek MT6323 PMIC.


=2E..522 lines...

> >+static int mt6360_init_isnk_properties(struct mt6360_led *led, struct l=
ed_init_data *init_data)
> >+{
> >+	struct led_classdev *isnk =3D &led->isnk;
> >+
> >+	isnk->max_brightness =3D mt6360_get_isnk_max_level(led->led_no);

> This function is called once seems a bit much to have a service function =
for
> a simple switch case.

Please remove code you are not commenting on. That a) reduces
bandwidth requirements but more importantly b) makes it easier to find
your comments.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9YlnMACgkQMOfwapXb+vLvDgCgi0jys/9Gg6FdVPAtrooeRyXJ
TPMAoIHj0ruueSBPPi4OfU/aJK0VNp3O
=kq07
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--


--===============5842824110116340217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5842824110116340217==--

