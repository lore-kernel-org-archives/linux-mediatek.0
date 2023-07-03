Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57BDC3063F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjlpviD9bE5uL0+ejGIRx0kHYOIDqbmlE1YUs545ZPk=; b=bU8btdCu5hk0yx+9Qo4HgMuVwr
	H779Kk/F+nuGSToM2grBYAjENIeVCNKN3U3yMOfwXuKTTY9WURkIU64z5LLtknBJ41ln+RZ2VZJUp
	J6vsd3fe+/eILdbKNvuS+MItw9qvCNQBD3pClksaDRHUKUhrSrBgEPHuCPoAIo/HrX4/UOyNQgVPZ
	I7TgCaKdoqy58gTbobw7AiwnzN7WoS58QhoOH793dTPlusLLb8OXlvbI2OZtyjMxJ/WkT+qiXxNfX
	wfRuHOd2UrAQu4KOOhSn09De99RHIjybinYix4TlMa81koAGxaIl2Ad0NYyZnfZutItpaItUTlwPL
	H1l8DY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGNb2-00B80M-18;
	Mon, 03 Jul 2023 17:44:20 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGNay-00B7zL-2L
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jul 2023 17:44:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qGNab-0001io-SY; Mon, 03 Jul 2023 19:43:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qGNaX-00Br6B-FH; Mon, 03 Jul 2023 19:43:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qGNaW-001x3o-OE; Mon, 03 Jul 2023 19:43:48 +0200
Date: Mon, 3 Jul 2023 19:43:47 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yangtao Li <frank.li@vivo.com>, miquel.raynal@bootlin.com,
	rafael@kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org,
	rui.zhang@intel.com, mmayer@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com, tglx@linutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	bchihi@baylibre.com, wenst@chromium.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] genirq/devres: Add
 devm_request_threaded_irq_emsg()
Message-ID: <20230703174347.4m6hcmify4jwsozv@pengutronix.de>
References: <20230703090455.62101-1-frank.li@vivo.com>
 <20230703090455.62101-2-frank.li@vivo.com>
 <f4873823-fd7e-c6dd-fbc0-eac4a9be52b1@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zufm3m2q3aozq5vp"
Content-Disposition: inline
In-Reply-To: <f4873823-fd7e-c6dd-fbc0-eac4a9be52b1@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_104416_785966_587EA74C 
X-CRM114-Status: GOOD (  18.72  )
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


--zufm3m2q3aozq5vp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Krzysztof,

On Mon, Jul 03, 2023 at 02:31:59PM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2023 11:04, Yangtao Li wrote:
> > There are more than 700 calls to the devm_request_threaded_irq method.
> > Most drivers only request one interrupt resource, and these error
> > messages are basically the same. If error messages are printed
> > everywhere, more than 1000 lines of code can be saved by removing the
> > msg in the driver.
>=20
>=20
> ...
>=20
> > +int devm_request_threaded_irq_emsg(struct device *dev, unsigned int ir=
q,
> > +				   irq_handler_t handler, irq_handler_t thread_fn,
> > +				   unsigned long irqflags, const char *devname,
> > +				   void *dev_id, const char *emsg)
> > +{
> > +	int rc;
> > +
> > +	rc =3D devm_request_threaded_irq(dev, irq, handler, NULL, irqflags,
> > +				       devname, dev_id);
> > +	if (rc && rc !=3D -EPROBE_DEFER) {
> > +		dev_err(dev, "Failed to request %sinterrupt %u %s %s: %pe\n",
> > +			thread_fn ? "threaded " : "", irq, devname ? : dev_name(dev),
> > +			emsg ? : "", ERR_PTR(rc));
>=20
> It is open-coding dev_err_probe(). Just use dev_err_probe instead.

dev_err_probe is supposed to be only called in probe functions, while
devm_request_threaded_irq might be called in other contexts (e.g. when a
device is opened). That's why I asked to not use dev_err_probe() in v2
(IIRC).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zufm3m2q3aozq5vp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSjCNIACgkQj4D7WH0S
/k6nJwf/fxOBBI8xueY091xxUtJ+Jjt9Qh7iRlnXM72aTkCwI2aSwccmmypcUCtY
ETYrAdgD8dtYSPkVAdCtcjwnKrotdk2bwyMpN6v9n0SEcRB0glrRIHwsaOYSgIhz
zISXiqdWOJmBXuaqwzxx4cq7Hc4Ca7dDdHvAUaR4lW6n7Ii2c0BB+cUcBOzhq24O
wCivFjPfQcr+5tdVDSMT+5kD1kQfyx6V+AY71ZQzaBV//Q8fDooOyTIOXeJVeRMU
fKffsEtUtKhMmXqNvd89oPKCc1YqYh87ysoSdE9GJNwSCDQ3z1A1dFbhB/gDW7Kx
feNdkyKlUn0+OSUjbmEq288CCPzaDQ==
=Icjv
-----END PGP SIGNATURE-----

--zufm3m2q3aozq5vp--

