Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B53BC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 12:30:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2747D20882
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 12:30:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N79eigMo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2747D20882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cQXXlXKJ8I2kfGiuFLLYWrPrFOBDdnkgbhD+eUQOz2w=; b=N79eigMoQdKsPEKl7vZqhuJNZ
	QPcKlpmIwU2iZco79EXaBLEX7aDp1uIY/grZgmHN/AAymwDCZ69EtqOjv349SSR0xK+40WRvy6oCl
	pH2J37BLE7mjCpqRUVdBsPJ9qJuvUJOvAlYUQDoj0qHyN43RQNPUaaMTwpfIM5+SCppgavxQFCx/q
	DNYZ3keGGxbUeAMdoDvyzdIdoS1LMPk80mw2d31JBDLTusjNmLJDOcFQKX6JGWQgvReh/7mRSn81B
	7OnxEHVI80ltQmbAAnMtm1/vjc9cVGgYBV/ff6INRd/FscBYMaxMicrON6PfroL/I8DJF4PPK8bsi
	FG14oUZZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGLiI-0003fW-7K; Thu, 10 Sep 2020 12:30:06 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGLiD-0003dh-7U; Thu, 10 Sep 2020 12:30:02 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 3FBB81C0B9C; Thu, 10 Sep 2020 14:29:59 +0200 (CEST)
Date: Thu, 10 Sep 2020 14:29:58 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200910122958.GF7907@duo.ucw.cz>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200908222544.GF1005@bug>
 <CAE+NS34h9qbdHkYDYDnHGgk+9mFNTRpKEMKNEFZ+Secf6JyoZg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE+NS34h9qbdHkYDYDnHGgk+9mFNTRpKEMKNEFZ+Secf6JyoZg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_083001_402297_363E0549 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 jacek.anaszewski@gmail.com, Matthias Brugger <matthias.bgg@gmail.com>,
 shufan_lee@richtek.com, Wilma.Wu@mediatek.com, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Type: multipart/mixed; boundary="===============6223537143764536454=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6223537143764536454==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b8GWCKCLzrXbuNet"
Content-Disposition: inline


--b8GWCKCLzrXbuNet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > +{
> > > +     struct mt6360_led *led =3D container_of(lcdev, struct mt6360_le=
d, flash.led_cdev);
> > > +     struct mt6360_priv *priv =3D led->priv;
> > > +     u32 enable_mask =3D MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(le=
d->led_no);
> > > +     u32 val =3D (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
> > > +     u32 prev =3D priv->fled_torch_used, curr;
> > > +     int ret;
> > > +
> > > +     dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
> > > +     if (priv->fled_strobe_used) {
> > > +             dev_warn(lcdev->dev, "Please disable strobe first [%d]\=
n", priv->fled_strobe_used);
> > > +             return -EINVAL;
> > > +     }
> >
> > So... how does its userland interface look like?
> >
>=20
> 1. set FLED1 brightness
> # echo 1 > /sys/class/leds/white:flash1/flash_brightness
> 2. enable FLED1 strobe
> # echo 1 > /sys/class/leds/white:flash1/flash_strobe
> 3 . turn off FLED1 strobe (just used to gaurantee the strobe mode
> flash leds must be turned off)
> # echo 0 > /sys/class/leds/white:flash1/flash_strobe

I believe I'd preffer only exposing torch functionality in
/sys/class/leds. .. strobe can be supported using v4l2 APIs.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--b8GWCKCLzrXbuNet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX1ocRgAKCRAw5/Bqldv6
8rt4AJ9KG5MVkOwIvtgD8oMHciHuYgq6xACgr/xJtQFK7Gi7zFnj7BU/D11YyD4=
=WnaO
-----END PGP SIGNATURE-----

--b8GWCKCLzrXbuNet--


--===============6223537143764536454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6223537143764536454==--

