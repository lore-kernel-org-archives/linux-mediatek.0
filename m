Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FD9C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:18:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF51C20732
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:18:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FOZDpcpP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF51C20732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KoGTMB6HQB3Y+Y5LFMC2HFAcc3okISITQLL2DMFZniY=; b=FOZDpcpPpl490hkdKcQs3HJZX
	TR53QpYCxRWbSqnvnAANjMO4RTNb4yMQrtkE6JfzjSGRO4CpCZ7ygeb/P9RNKzGp0PO6aBmfk8I98
	QYWIe5zJIQhZvDZjszX7OIZWOmNrSh+ubhKuKsy9nxgD70ekCeu72/BA8zRGHCJsIHrMuE7GoxsTd
	QA3oKaLd6BRqi/8WvflSFOwhxPqKBQuS10ccSE4z4kpoqK7i+HJCxRnq4llx/iH4K6L9GBQaP2eG5
	ldQcNC1Ic99nB09xTR0erZnDAszjAAudyIMIDlKbC4wyzyPvivivkxYYFcm0rw5nStc5Cg0mWeKOj
	vLvd1riRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHmf-0001wn-BK; Thu, 10 Sep 2020 08:18:21 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHmb-0001vg-03; Thu, 10 Sep 2020 08:18:17 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id DEEBE1C0B7D; Thu, 10 Sep 2020 10:18:14 +0200 (CEST)
Date: Thu, 10 Sep 2020 10:18:14 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200910081814.GB28357@amd>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <CAHp75VdLDvoQicP1nLnjOiit6qjaw9n7+LuJ-J3MtaoHUOa_2g@mail.gmail.com>
 <CAE+NS35FETQ9ASJeYP=Sa8dm7ohRBcdAwUioCAnHPY2TiD4pNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE+NS35FETQ9ASJeYP=Sa8dm7ohRBcdAwUioCAnHPY2TiD4pNA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041817_146986_4230ABE1 
X-CRM114-Status: GOOD (  17.48  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 benjamin.chao@mediatek.com, Gene Chen <gene_chen@richtek.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, shufan_lee@richtek.com,
 Wilma.Wu@mediatek.com, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: multipart/mixed; boundary="===============0397117206041917319=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0397117206041917319==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > +enum {
> > > +       MT6360_LED_ISNK1 =3D 0,
> > > +       MT6360_LED_ISNK2,
> > > +       MT6360_LED_ISNK3,
> > > +       MT6360_LED_ISNK4,
> > > +       MT6360_LED_FLASH1,
> > > +       MT6360_LED_FLASH2,
> >
> > > +       MT6360_MAX_LEDS,
> >
> > No comma for terminator entry.
> >
>=20
> ACK

Actually, that comma is fine. Its absence would be fine, too.

> > > +};
> >
> > ...
> >
> > > +#define MT6360_ISNK_MASK               0x1F
> >
> > GENMASK()

Again, that is fine.

> > > +#define FLED_TORCH_FLAG_MASK           0x0c
> >
> > > +#define FLED_STROBE_FLAG_MASK          0x03
> >
> > GENMASK()
> >
>=20
> ACK

Again, that is fine.

> > > +       return 0;
> > > +}
> > > +
> > > +static const struct of_device_id __maybe_unused mt6360_led_of_id[] =
=3D {
> > > +       { .compatible =3D "mediatek,mt6360-led", },
> >
> > > +       {},
> >
> > No need comma.
>=20
> ACK

It is also no hurting comma.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9Z4UUACgkQMOfwapXb+vI8xwCffPv2VNdsHIiN1JW/R8U9rVgS
wgIAn1rrY28DLYQIe3/AWsXVIEaFjfEB
=itTo
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--


--===============0397117206041917319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0397117206041917319==--

