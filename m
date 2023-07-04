Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC5CEB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 14:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+27uExjIYZ46xG6kcAQiFS8PaOso75WmkDNpevB6XQ=; b=j8jvvl1PVMgGYp+LUs/JTCS0Zi
	8O8QarxsXhEYsHrje2IkBTbwLNjNMd+hNeJKN20lLd4hfjQhyv+PxKRYyYtINbhkQuFBkI1pRI9Y5
	TtJhO6YFYowpy8OW3rGtAdpUb9r+Pj6Q8z6o3e1bjgGXz1FMF3FxKLXHl+UKLzHkNqFF1Of/9eBSb
	Xhq1LQuwz6G8VOalGCfE9jVAZ7MahbsHDUIQAGbdpSgSAHrXaqWOQv3LCn1LKTLQN+8tr7fOzAK/l
	DZtZ4J8F3Bc4mSwiu03uZ0BjlhH/Wjm+Qdk9sx2V/iDHpF1xKZyqSpaoya2CasS58jNKka7J5OIwl
	IrESu+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgtQ-00DVSA-2Q;
	Tue, 04 Jul 2023 14:20:36 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgtN-00DVQL-0G
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jul 2023 14:20:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qGgsr-0006oz-5Y; Tue, 04 Jul 2023 16:20:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qGgsn-00C3Z7-Bb; Tue, 04 Jul 2023 16:19:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qGgsl-002CFP-UT; Tue, 04 Jul 2023 16:19:55 +0200
Date: Tue, 4 Jul 2023 16:19:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yangtao Li <frank.li@vivo.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, miquel.raynal@bootlin.com,
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
Message-ID: <20230704141954.fcmol2yswkpbnpaw@pengutronix.de>
References: <20230703090455.62101-1-frank.li@vivo.com>
 <20230703090455.62101-2-frank.li@vivo.com>
 <f4873823-fd7e-c6dd-fbc0-eac4a9be52b1@kernel.org>
 <20230703174347.4m6hcmify4jwsozv@pengutronix.de>
 <11052797-b006-11bb-e4eb-987ddd568b24@kernel.org>
 <20805fef-d6aa-91d8-999e-04b1d6b7a37a@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zmgku2gem6yeyypz"
Content-Disposition: inline
In-Reply-To: <20805fef-d6aa-91d8-999e-04b1d6b7a37a@vivo.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_072033_118177_D6EEC9D1 
X-CRM114-Status: GOOD (  27.59  )
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


--zmgku2gem6yeyypz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jul 04, 2023 at 05:06:12PM +0800, Yangtao Li wrote:
> On 2023/7/4 16:48, Krzysztof Kozlowski wrote:
>=20
> > [=E4=BD=A0=E9=80=9A=E5=B8=B8=E4=B8=8D=E4=BC=9A=E6=94=B6=E5=88=B0=E6=9D=
=A5=E8=87=AA krzk@kernel.org =E7=9A=84=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=
=E3=80=82=E8=AF=B7=E8=AE=BF=E9=97=AE https://aka.ms/LearnAboutSenderIdentif=
ication=EF=BC=8C=E4=BB=A5=E4=BA=86=E8=A7=A3=E8=BF=99=E4=B8=80=E7=82=B9=E4=
=B8=BA=E4=BB=80=E4=B9=88=E5=BE=88=E9=87=8D=E8=A6=81]
> >=20
> > On 03/07/2023 19:43, Uwe Kleine-K=C3=B6nig wrote:
> > > Hello Krzysztof,
> > >=20
> > > On Mon, Jul 03, 2023 at 02:31:59PM +0200, Krzysztof Kozlowski wrote:
> > > > On 03/07/2023 11:04, Yangtao Li wrote:
> > > > > There are more than 700 calls to the devm_request_threaded_irq me=
thod.
> > > > > Most drivers only request one interrupt resource, and these error
> > > > > messages are basically the same. If error messages are printed
> > > > > everywhere, more than 1000 lines of code can be saved by removing=
 the
> > > > > msg in the driver.
> > > >=20
> > > > ...
> > > >=20
> > > > > +int devm_request_threaded_irq_emsg(struct device *dev, unsigned =
int irq,
> > > > > +                              irq_handler_t handler, irq_handler=
_t thread_fn,
> > > > > +                              unsigned long irqflags, const char=
 *devname,
> > > > > +                              void *dev_id, const char *emsg)
> > > > > +{
> > > > > +   int rc;
> > > > > +
> > > > > +   rc =3D devm_request_threaded_irq(dev, irq, handler, NULL, irq=
flags,
> > > > > +                                  devname, dev_id);
> > > > > +   if (rc && rc !=3D -EPROBE_DEFER) {
> > > > > +           dev_err(dev, "Failed to request %sinterrupt %u %s %s:=
 %pe\n",
> > > > > +                   thread_fn ? "threaded " : "", irq, devname ? =
: dev_name(dev),
> > > > > +                   emsg ? : "", ERR_PTR(rc));
> > > > It is open-coding dev_err_probe(). Just use dev_err_probe instead.
> > > dev_err_probe is supposed to be only called in probe functions, while
> > > devm_request_threaded_irq might be called in other contexts (e.g. whe=
n a
> > > device is opened). That's why I asked to not use dev_err_probe() in v2
> > True, but then all the callers of this function will forget to set
> > deferred probe reason.

That's another reason for letting the driver issue the error message and
not the request_irq function.
=20
> So let's use dev_err_probe?
>=20
> BTW, any suggestions for names here, keep using
> devm_request_threaded_irq_emsg or change to a new name?

I would have called it devm_request_threaded_irq_verbose() which I
consider easier to understand. But maybe that is just my (green)
bikeshed.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zmgku2gem6yeyypz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSkKooACgkQj4D7WH0S
/k6OiQgAu9UMxHN+gRspThd8U+yqAL2MKBd5IDG2AdVsrG13N1E3kkMgwLha0qHW
GnsOYfevtzwiuKpDU+D6SMjCt3KhhOQ4zpyCqey5KovQ5dzB9zbsBVu2FBYa8rA5
Ul4qJzcCm1OpxUBdJFnKAoacE+CEc81i4RxzW6oxWXiYMLESh+eZer6yo/xqAAjm
71WmNb389G0qe4z2nQuvIS+Lq3Ig7NsHR/V7YbcE65UmowR6GE4wAYmuB84TqPDQ
yrGBxllYYlAWZq2R0+aEcyDME2rOIg7+C7tdJiphywe1yKzDEIWtrSrBf+0P1DGr
FYQxqrvdLsgimC/9ZHFYftmEETHPKQ==
=bQ/6
-----END PGP SIGNATURE-----

--zmgku2gem6yeyypz--

