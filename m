Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F61C38A2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 21:10:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F8C20731
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 21:10:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D5iqUzrR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98F8C20731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/8eIj4WoG1swtWqtTLrRwR5AuiEpYdwEvylD48KvmsE=; b=D5iqUzrRy7dg3sngP+pzj6UY0
	Y04JV0yQp+KoZ69yCh6SC/iIzLMQ8Hc4Em2I5O5HeGBOxCBLH1CczDo/eVfq/tWCx+pyly8ZlTouF
	bRB9KOfqyeHf53ircyNXqwbjYH/DSHPEZnd5uQgafKJhKqP5f+eeH/RPA0YTgCr8SvoC3CakvrrEi
	hluhlW7QVEi68AEfRNaAJ47MS9Keb7J8Ja254BhXZwJzUwmZ4KoDUxUiuwyJgjBBsT9clqXG73H9N
	s5mtBVJWhuwRI4xrpB+OqE0NS4nMAsEaFnSjiiGxLwUxeznqfg2UZFHgQTjYAMS/Ozls5bafwm3sW
	I5oV2ZaBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWnmb-0004x5-Vx; Thu, 07 May 2020 21:10:18 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWnmM-0002Pj-9H; Thu, 07 May 2020 21:10:04 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 38AD11C0257; Thu,  7 May 2020 23:09:55 +0200 (CEST)
Date: Thu, 7 May 2020 23:09:54 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v1] Add support for MediaTek regulator vibrator driver
Message-ID: <20200507210954.GB19557@duo.ucw.cz>
References: <20200429081759.26964-1-Xing.Zhang@mediatek.com>
 <20200507174519.GD1216@bug>
 <49089bf3-d64b-2a50-269c-623a6ea9c14c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <49089bf3-d64b-2a50-269c-623a6ea9c14c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_141002_492977_3E1A48C2 
X-CRM114-Status: GOOD (  13.14  )
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
Cc: linux-kernel@vger.kernel.org, Xing Zhang <Xing.Zhang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Dan Murphy <dmurphy@ti.com>,
 linux-leds@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0856332800019361240=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0856332800019361240==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-05-07 22:45:35, Jacek Anaszewski wrote:
> Hi Pavel,
>=20
> On 5/7/20 7:45 PM, Pavel Machek wrote:
> > Hi!
> >=20
> > > This patchset add regulator vibrator driver for MTK Soc. The driver
> > > controls vibrator through regulator's enable and disable.
> >=20
> > We'd prefer not to have vibrators in led subsystem.
> >=20
> > >=20
> > > Xing Zhang (3):
> > >    dt-bindings: add regulator vibrator documentation
> > >    arm64: mediatek: Add regulator vibrator support
> > >    Vibrator: Add regulator vibrator driver
> > >=20
> > >   .../bindings/leds/regulator-vibrator.txt      |  39 ++
> > >   arch/arm64/configs/defconfig                  |   1 +
> > >   drivers/leds/Kconfig                          |  10 +
> > >   drivers/leds/Makefile                         |   1 +
> > >   drivers/leds/regulator-vibrator.c             | 450 +++++++++++++++=
+++
> >=20
> > OTOH, connecting LED to regulator might make some sense. I can take the=
 driver with
> > vibrator functionality stripped, provided it is named the usual way...
>=20
> We already had an attempt of solving this in more generic way [0],
> but you opposed then [1]. Just for the record.

That's something different. led-regulator.c might be
acceptable. Special code to support vibrator quirks... not so much.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXrR5IgAKCRAw5/Bqldv6
8rhUAJwNZ8AJbpTJwM0okF7XO54EiI6dkQCfdJRagMkst3LRHughjgIVPDh4RiA=
=07yZ
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--


--===============0856332800019361240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0856332800019361240==--

