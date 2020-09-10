Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D7CC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 12:28:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E996F208FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 12:28:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bgdwPoMr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E996F208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2nC5fi4qSZUMa2LSuxG8o5KvWf85hLtmpYjmPLiPTwM=; b=bgdwPoMr1mrlJOvN5Z+2lTE0t
	eHUCvS+ysOXPx2fbBEso0xtrMRtLDC0D0EGIlUTH6kRKDVPi48vknVRVfwIX2kU0wqMfzMWuzZxQn
	nuJu/7cYIQRJe9X9WRI9/hRZOTeodRtwuaPe0stneRd/y2y9BLP3y7klsuXlww8SaWk/DgyhibfIW
	z55GTe1+BWQi9MDrNqYtDKXJMMl82LLRgcCbBBFnOe2e1ZxeHtRHYHV+1mnXCjmZP6NewjIh3pugB
	rhWKB8NVDpQ+AJ8KcfmjTluH19Qcdugk5d4RWP7yMAOebyqLj3G2MRz9FlbqFNbxp9uwMmavJ6cvo
	GIvwfnBUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGLgv-0003Gv-LZ; Thu, 10 Sep 2020 12:28:41 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGLgr-0003Fy-Lf; Thu, 10 Sep 2020 12:28:38 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 16CDC1C0B9D; Thu, 10 Sep 2020 14:28:35 +0200 (CEST)
Date: Thu, 10 Sep 2020 14:28:34 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200910122834.GE7907@duo.ucw.cz>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <CAHp75VdLDvoQicP1nLnjOiit6qjaw9n7+LuJ-J3MtaoHUOa_2g@mail.gmail.com>
 <CAE+NS35FETQ9ASJeYP=Sa8dm7ohRBcdAwUioCAnHPY2TiD4pNA@mail.gmail.com>
 <20200910081814.GB28357@amd>
 <CAHp75Vds75jP47Fy78gxrg05J-CYQ7yD_EiDqizKkcW5rHL_RA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHp75Vds75jP47Fy78gxrg05J-CYQ7yD_EiDqizKkcW5rHL_RA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_082837_812846_6FD2D427 
X-CRM114-Status: GOOD (  16.08  )
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
 devicetree <devicetree@vger.kernel.org>, shufan_lee@richtek.com,
 cy_huang@richtek.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene.chen.richtek@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: multipart/mixed; boundary="===============6878325862682563506=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6878325862682563506==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YkJPYEFdoxh/AXLE"
Content-Disposition: inline


--YkJPYEFdoxh/AXLE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-09-10 14:34:54, Andy Shevchenko wrote:
> On Thu, Sep 10, 2020 at 11:18 AM Pavel Machek <pavel@ucw.cz> wrote:
>=20
> ...
>=20
> > > > > +enum {
> > > > > +       MT6360_LED_ISNK1 =3D 0,
> > > > > +       MT6360_LED_ISNK2,
> > > > > +       MT6360_LED_ISNK3,
> > > > > +       MT6360_LED_ISNK4,
> > > > > +       MT6360_LED_FLASH1,
> > > > > +       MT6360_LED_FLASH2,
> > > >
> > > > > +       MT6360_MAX_LEDS,
> > > >
> > > > No comma for terminator entry.
> > > >
> > >
> > > ACK
> >
> > Actually, that comma is fine. Its absence would be fine, too.
>=20
> It is slightly better not to have to prevent (theoretical) rebase or
> other similar issues when a new item can go behind the terminator. In
> such a case compiler can easily tell you if something is wrong.

Okay, I see your point.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--YkJPYEFdoxh/AXLE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX1ob8gAKCRAw5/Bqldv6
8lViAJ9myb0j5o09GhH3AOC/vEPu/eVHrQCfURBxqy5ugClklDvSpz1f/ewdO60=
=pYh1
-----END PGP SIGNATURE-----

--YkJPYEFdoxh/AXLE--


--===============6878325862682563506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6878325862682563506==--

