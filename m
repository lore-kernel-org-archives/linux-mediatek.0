Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A009BEB64D9
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 02:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKyzqxdxON6GbdIRujb4Jw2iZivIGRKOrTQODIMi3ho=; b=KBFpT6hiUxxigjs5HU6uvU4aL4
	uu8yughJqQDa3cP0jSioyCfWZTPHwy8b9U6bIQtaRs84FPmtQ7Z3z2m9w+TOmtTKpO1VeO1UDwAU/
	rnGwvMgSCPFVQ9RLg1wVctRSpk27FwvvB5RRM09Qd5HZsfNM2wPdUBNemGupVUQ1KVQKS9WLCsCZo
	3o29wePL8SjPf2XjFnpyPfuyC6Sbc2iEtSo2FAUe9DUQZxIXk1mO4r/f6bRuh2Z3upo3aaWuPBLWP
	OEZZOBFSEEqKChkK2fWIsNdoJfIAhzcP3qO1zLa3kzFz8HIgzT9RFOszRzTD6bx6pZ1nXg+FwugsN
	9OlRx8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGs3j-00EbV2-2F;
	Wed, 05 Jul 2023 02:15:59 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGs3e-00EbTu-38;
	Wed, 05 Jul 2023 02:15:58 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Qwjrl3xPlz6J7Ml;
	Wed,  5 Jul 2023 10:13:59 +0800 (CST)
Received: from localhost (10.34.206.101) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 03:15:41 +0100
Date: Wed, 5 Jul 2023 10:15:37 +0800
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Yangtao Li <frank.li@vivo.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	<miquel.raynal@bootlin.com>, <rafael@kernel.org>,
	<daniel.lezcano@linaro.org>, <amitk@kernel.org>, <rui.zhang@intel.com>,
	<mmayer@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
	<florian.fainelli@broadcom.com>, <tglx@linutronix.de>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<bchihi@baylibre.com>, <wenst@chromium.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 1/5] genirq/devres: Add
 devm_request_threaded_irq_emsg()
Message-ID: <20230705101537.000059d2@Huawei.com>
In-Reply-To: <20230704141954.fcmol2yswkpbnpaw@pengutronix.de>
References: <20230703090455.62101-1-frank.li@vivo.com>
	<20230703090455.62101-2-frank.li@vivo.com>
	<f4873823-fd7e-c6dd-fbc0-eac4a9be52b1@kernel.org>
	<20230703174347.4m6hcmify4jwsozv@pengutronix.de>
	<11052797-b006-11bb-e4eb-987ddd568b24@kernel.org>
	<20805fef-d6aa-91d8-999e-04b1d6b7a37a@vivo.com>
	<20230704141954.fcmol2yswkpbnpaw@pengutronix.de>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.34.206.101]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_191555_320922_108BB494 
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

On Tue, 4 Jul 2023 16:19:54 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> Hello,
>=20
> On Tue, Jul 04, 2023 at 05:06:12PM +0800, Yangtao Li wrote:
> > On 2023/7/4 16:48, Krzysztof Kozlowski wrote:
> >  =20
> > > [=E4=BD=A0=E9=80=9A=E5=B8=B8=E4=B8=8D=E4=BC=9A=E6=94=B6=E5=88=B0=E6=
=9D=A5=E8=87=AA krzk@kernel.org =E7=9A=84=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=
=B6=E3=80=82=E8=AF=B7=E8=AE=BF=E9=97=AE https://aka.ms/LearnAboutSenderIden=
tification=EF=BC=8C=E4=BB=A5=E4=BA=86=E8=A7=A3=E8=BF=99=E4=B8=80=E7=82=B9=
=E4=B8=BA=E4=BB=80=E4=B9=88=E5=BE=88=E9=87=8D=E8=A6=81]
> > >=20
> > > On 03/07/2023 19:43, Uwe Kleine-K=C3=B6nig wrote: =20
> > > > Hello Krzysztof,
> > > >=20
> > > > On Mon, Jul 03, 2023 at 02:31:59PM +0200, Krzysztof Kozlowski wrote=
: =20
> > > > > On 03/07/2023 11:04, Yangtao Li wrote: =20
> > > > > > There are more than 700 calls to the devm_request_threaded_irq =
method.
> > > > > > Most drivers only request one interrupt resource, and these err=
or
> > > > > > messages are basically the same. If error messages are printed
> > > > > > everywhere, more than 1000 lines of code can be saved by removi=
ng the
> > > > > > msg in the driver. =20
> > > > >=20
> > > > > ...
> > > > >  =20
> > > > > > +int devm_request_threaded_irq_emsg(struct device *dev, unsigne=
d int irq,
> > > > > > +                              irq_handler_t handler, irq_handl=
er_t thread_fn,
> > > > > > +                              unsigned long irqflags, const ch=
ar *devname,
> > > > > > +                              void *dev_id, const char *emsg)
> > > > > > +{
> > > > > > +   int rc;
> > > > > > +
> > > > > > +   rc =3D devm_request_threaded_irq(dev, irq, handler, NULL, i=
rqflags,
> > > > > > +                                  devname, dev_id);
> > > > > > +   if (rc && rc !=3D -EPROBE_DEFER) {
> > > > > > +           dev_err(dev, "Failed to request %sinterrupt %u %s %=
s: %pe\n",
> > > > > > +                   thread_fn ? "threaded " : "", irq, devname =
? : dev_name(dev),
> > > > > > +                   emsg ? : "", ERR_PTR(rc)); =20
> > > > > It is open-coding dev_err_probe(). Just use dev_err_probe instead=
. =20
> > > > dev_err_probe is supposed to be only called in probe functions, whi=
le
> > > > devm_request_threaded_irq might be called in other contexts (e.g. w=
hen a
> > > > device is opened). That's why I asked to not use dev_err_probe() in=
 v2 =20
> > > True, but then all the callers of this function will forget to set
> > > deferred probe reason. =20
>=20
> That's another reason for letting the driver issue the error message and
> not the request_irq function.
> =20
> > So let's use dev_err_probe?
> >=20
> > BTW, any suggestions for names here, keep using
> > devm_request_threaded_irq_emsg or change to a new name? =20
>=20
> I would have called it devm_request_threaded_irq_verbose() which I
> consider easier to understand. But maybe  is just my (green)
> bikeshed.

If going to use dev_err_probe() internally maybe can just use
devm_request_threaded_irq_probe() thus reflecting that and making
it different to the devm_request_threaded_irq()?

I'm not sure we need to call out the fact it prints an error message in
the naming.  Maybe the fact it should probably only be used in probe()
is the more relevant information?

Bikesheds should all be red!

Jonathan

>=20
> Best regards
> Uwe
>=20


