Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02988C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F741uagwlledtvX2KHubTth6Hbt06AQjyON/tp41gx8=; b=lK5ayzhkEl1HNcrB3oOOzjBRx1
	646SAnheTMrXoL26tbxW214zfykpkAkA4MjHgtaMR56lr+C+qRgHgpff5oswv0PWFGx5Vw1flDLau
	rJCimXsax6sRB8v69ypdw6/4+soPNLa8DicMfuCJsaFxN+FAQQgnkl+9McNtTjI0NsZhMxutsOqmb
	VaN1vfmZKB5nPbi9eppyjRzh9FymZid5B9wmJag6YlmOU6fhuLbyBp11X2k7q1RGN7X6dyfvRdgTO
	TqGKWXBIvQOLSa98A1/53AJMlzzd2mB6rzSO2JsceX1HoXYV66sXHgWsTo2slwHfb42GizAxp0JpI
	1GxApfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ZOA-001dRb-UG; Wed, 12 Jan 2022 08:53:50 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7ZO1-001dMc-JB
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 08:53:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n7ZLN-0005mh-UE; Wed, 12 Jan 2022 09:50:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n7ZL6-009rFV-QA; Wed, 12 Jan 2022 09:50:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n7ZL5-00061g-Dl; Wed, 12 Jan 2022 09:50:39 +0100
Date: Wed, 12 Jan 2022 09:50:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, kvm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-phy@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Robert Richter <rric@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Corey Minyard <minyard@acm.org>, linux-pm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Eric Auger <eric.auger@redhat.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Richard Weinberger <richard@nod.at>,
 Mun Yew Tham <mun.yew.tham@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>, Sebastian Reichel <sre@kernel.org>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <20220112085009.dbasceh3obfok5dc@pengutronix.de>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
 <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_005341_663614_D14E0C26 
X-CRM114-Status: GOOD (  35.14  )
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
Content-Type: multipart/mixed; boundary="===============8524030794428685129=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8524030794428685129==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xmww6gsp5dtrk3ed"
Content-Disposition: inline


--xmww6gsp5dtrk3ed
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2022 at 09:33:48AM +0100, Geert Uytterhoeven wrote:
> Hi Andrew,
>=20
> On Mon, Jan 10, 2022 at 10:20 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > On Mon, Jan 10, 2022 at 09:10:14PM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Mon, Jan 10, 2022 at 10:54:48PM +0300, Sergey Shtylyov wrote:
> > > > This patch is based on the former Andy Shevchenko's patch:
> > > >
> > > > https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchen=
ko@linux.intel.com/
> > > >
> > > > Currently platform_get_irq_optional() returns an error code even if=
 IRQ
> > > > resource simply has not been found. It prevents the callers from be=
ing
> > > > error code agnostic in their error handling:
> > > >
> > > >     ret =3D platform_get_irq_optional(...);
> > > >     if (ret < 0 && ret !=3D -ENXIO)
> > > >             return ret; // respect deferred probe
> > > >     if (ret > 0)
> > > >             ...we get an IRQ...
> > > >
> > > > All other *_optional() APIs seem to return 0 or NULL in case an opt=
ional
> > > > resource is not available. Let's follow this good example, so that =
the
> > > > callers would look like:
> > > >
> > > >     ret =3D platform_get_irq_optional(...);
> > > >     if (ret < 0)
> > > >             return ret;
> > > >     if (ret > 0)
> > > >             ...we get an IRQ...
> > >
> > > The difference to gpiod_get_optional (and most other *_optional) is t=
hat
> > > you can use the NULL value as if it were a valid GPIO.
> > >
> > > As this isn't given with for irqs, I don't think changing the return
> > > value has much sense.
> >
> > We actually want platform_get_irq_optional() to look different to all
> > the other _optional() methods because it is not equivalent. If it
> > looks the same, developers will assume it is the same, and get
> > themselves into trouble.
>=20
> Developers already assume it is the same, and thus forget they have
> to check against -ENXIO instead of zero.

Is this an ack for renaming platform_get_irq_optional() to
platform_get_irq_silent()?

And then a coccinelle or sparse or ... hook that catches people testing
the return value against 0 would be great.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xmww6gsp5dtrk3ed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHeljYACgkQwfwUeK3K
7AljMgf/RPunUgCLZTRo6HVoWGaeXoeKF+2cGlwuAsz4Z00TAkiSHfoaeZtHOlTi
q5shu1KHHU618Mhtt6XvXodObLXVJs41ty1v6SytKsW7BJQt5naWkyRnggT5tFWu
ggmVGMBXOmKX/wp2DCDa7dah1/SOrnFqP53whp6ZTB6oejvTyXmM97J3490sqGq5
MsUAM2Z9/yyDuSZevN858NdTs3OZGSfWvvhFoG4EurYBcNo4znZgjQ6JgBbg3L5J
/m2yKP4XrG0hiM86Q5XlzUdX3r5ERS4K78HS9ywkjsC/gmXD3i3XQGIjcG5VMN7F
HGppnegV30H+5MPW7Ws6xs2xopwryw==
=d8xy
-----END PGP SIGNATURE-----

--xmww6gsp5dtrk3ed--


--===============8524030794428685129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8524030794428685129==--

