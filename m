Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E70EB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzCjbJRzg4bVLfVdDFFqq8G6XVszfvCrcwET3JiiTxg=; b=bWW3hkjM6fVFO0MsdiGktssCEz
	LSJBqB2nmyxYoJxzNDquyntTajZX+rRMq+j5mOnXL6F7JQfmx3KvI/QHxot1H2tUOPEC2CA3V3MCh
	eTH74bq3EiMnQ6URZT/tA9fbeNnjFLHoLd7/Gv7HD1nvWjqIfPiqB6NPlApP9/YKSxbHeV3maFN5f
	DJ1MwOd53n+bn7CJ20eRoC/cu9+6bWqJM81Y4+U9cVtOM7P3aTg7A79GBxdA3595xD/CEHGY3hLUC
	81gQaO8KyTN9JaXeLGodwBBIgckDUemt8VsuS7PcrA6ZFdg/IqxifIBOjcrKV8WpFPTR6yobJ67VI
	W1sM3Z0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgvb-00DVnS-0E;
	Tue, 04 Jul 2023 14:22:51 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgvX-00DVm0-02
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jul 2023 14:22:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qGgvF-0007G5-SE; Tue, 04 Jul 2023 16:22:29 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qGgvE-00C3ZN-Ts; Tue, 04 Jul 2023 16:22:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qGgvE-002CG3-1t; Tue, 04 Jul 2023 16:22:28 +0200
Date: Tue, 4 Jul 2023 16:22:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Yangtao Li <frank.li@vivo.com>, rafael@kernel.org,
	daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
	mmayer@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com, tglx@linutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	bchihi@baylibre.com, wenst@chromium.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/5] thermal/drivers/armada: convert to use
 devm_request_threaded_irq_emsg()
Message-ID: <20230704142227.65k3kdrnyqqolf6t@pengutronix.de>
References: <20230703090455.62101-1-frank.li@vivo.com>
 <20230703090455.62101-3-frank.li@vivo.com>
 <20230704104608.29527ec3@xps-13>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lrq6xzeoxwlvs4uu"
Content-Disposition: inline
In-Reply-To: <20230704104608.29527ec3@xps-13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_072247_048459_75C8D5D7 
X-CRM114-Status: GOOD (  40.04  )
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


--lrq6xzeoxwlvs4uu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Miquel,

On Tue, Jul 04, 2023 at 10:46:08AM +0200, Miquel Raynal wrote:
> Hi Yangtao,
>=20
> frank.li@vivo.com wrote on Mon,  3 Jul 2023 17:04:51 +0800:
>=20
> > There are more than 700 calls to the devm_request_threaded_irq method.
> > Most drivers only request one interrupt resource, and these error
> > messages are basically the same. If error messages are printed
> > everywhere, more than 1000 lines of code can be saved by removing the
> > msg in the driver.
> >=20
> > And tglx point out that:
> >=20
> >   If we actually look at the call sites of
> >   devm_request_threaded_irq() then the vast majority of them print more=
 or
> >   less lousy error messages. A quick grep/sed/awk/sort/uniq revealed
> >=20
> >      519 messages total (there are probably more)
> >=20
> >      352 unique messages
> >=20
> >      323 unique messages after lower casing
> >=20
> >          Those 323 are mostly just variants of the same patterns with
> >          slight modifications in formatting and information provided.
> >=20
> >      186 of these messages do not deliver any useful information,
> >          e.g. "no irq", "
> >=20
> >      The most useful one of all is: "could request wakeup irq: %d"
> >=20
> >   So there is certainly an argument to be made that this particular
> >   function should print a well formatted and informative error message.
> >=20
> >   It's not a general allocator like kmalloc(). It's specialized and in =
the
> >   vast majority of cases failing to request the interrupt causes the
> >   device probe to fail. So having proper and consistent information why
> >   the device cannot be used _is_ useful.
> >=20
> > Let's use devm_request_threaded_irq_emsg(), which ensure that all error
> > handling branches print error information. In this way, when this funct=
ion
> > fails, the upper-layer functions can directly return an error code with=
out
> > missing debugging information. Otherwise, the error message will be
> > printed redundantly or missing.
> >=20
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> >  drivers/thermal/armada_thermal.c | 13 +++++--------
> >  1 file changed, 5 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_=
thermal.c
> > index 9f6dc4fc9112..a5e140643f00 100644
> > --- a/drivers/thermal/armada_thermal.c
> > +++ b/drivers/thermal/armada_thermal.c
> > @@ -913,15 +913,12 @@ static int armada_thermal_probe(struct platform_d=
evice *pdev)
> > =20
> >  	/* The overheat interrupt feature is not mandatory */
> >  	if (irq > 0) {
> > -		ret =3D devm_request_threaded_irq(&pdev->dev, irq,
> > -						armada_overheat_isr,
> > -						armada_overheat_isr_thread,
> > -						0, NULL, priv);
> > -		if (ret) {
> > -			dev_err(&pdev->dev, "Cannot request threaded IRQ %d\n",
> > -				irq);
> > +		ret =3D devm_request_threaded_irq_emsg(&pdev->dev, irq,
> > +						     armada_overheat_isr,
> > +						     armada_overheat_isr_thread,
> > +						     0, NULL, priv, NULL);
> > +		if (ret)
>=20
> I don't see a patch renaming this helper with s/emsg//, do you plan to
> keep it like that? I bet nobody outside of this series will notice the
> new helper and will continue to add error messages because it kind
> of feels "right" to do so.
>=20
> I would rather prefer returning to the original function name which
> everybody knows/uses.

See https://lore.kernel.org/lkml/87h6qpyzkd.ffs@tglx for why there is a
new function name.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lrq6xzeoxwlvs4uu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSkKyIACgkQj4D7WH0S
/k72twf+KGXXuIhXaaGIjMSadyvpt6IVNAp9odJSncKrJJKTHkdnob2NMnm9PBrx
uo5d38ab3x3A5iTkUyD90rJsGlP6IPP52LnxUYVaWHTDMpc9rjuBQDjmpyhzToGZ
SB2wFpN6qwyb7+AgG4LxXaR3e+serv1HnOX2ziyFf6e3MU3tIJh4KiTR/Ye7cCUG
KvnLtEmudD43+n21FChUKQf7+aR6G64rOCvirHpgmoEQul/XTT5ADU8lksDiYx25
admLK5ESXwObImzHbZsjl5e/OadNYt5z73WvFQFijceJl+uYyqMBcH2R7lGHAG5M
pS95JZRrD8tsfo21JG1OhiH2xsO7kA==
=uBz7
-----END PGP SIGNATURE-----

--lrq6xzeoxwlvs4uu--

