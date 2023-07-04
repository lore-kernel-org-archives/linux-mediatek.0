Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FC3EB64DA
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 14:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhC+KWn+e1iSNCp2dmqL3RwKmWOqhZYUPme+wcWSUyk=; b=pWKuZ4FK1sydwbxgXYmsgDGryr
	RF6m6FP+WMn2KJZA1u5w1e1TaowELaGpQUWE14P6/Gq0Bx0uqD4pHDCDHadiQZlkkhMBOU2zggjm7
	DwtK1KPDtvo0ZeLc24S8iKCGa4avy6Fuilzs2RB+9m8p3zdFYOH1NuZ+dkhzJQMSmjM/fQYrdjTVJ
	hUZJt1+mnQ9PAW+kpVzgYqwyckUK5BRNfLZdvFXEqVBHX5TYJbda9yWEO6BJfU5Ufx4svRz6wuKMg
	MxpNNB8T6LMinhIsnMKgTYiaJGiGCxmy7D0HRAH2ktXu46tqtEGBciWJftToJwc1ckUg97vA4OtP2
	BM+7i7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGh2L-00DWMb-30;
	Tue, 04 Jul 2023 14:29:49 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGh2H-00DWLP-2w;
	Tue, 04 Jul 2023 14:29:48 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688480981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhC+KWn+e1iSNCp2dmqL3RwKmWOqhZYUPme+wcWSUyk=;
	b=YYowUOH/d+UO3jZfLAm3vj5YK/nP7y0Oj6nvyFmHYqJ+cz3BLsG1XEY6xCo2xRG75E45tI
	d4Rr1ys9ooc9p5lUM6q3QAgs2XL4xhLlXHhpQgHojO8oBYQ3pFfU/SbvTUZE2oxDnlwpcR
	sYjDJxQmjBnXmAgaj9Zz56v84kRGToC/LxeDL/eFrskYD+29W/6Hd8RGPB82i0T6QyHNjP
	0gCoLhjW3tN3HJd63Gq8zy9wrjUrEL9otMSFRQzL+6p0eAL7sOgy7uAqL05JZp0vrMpNoM
	9VMrTL7xeOPsXuPbDNQyVhJVV1kXh2u8xqpbd0GNFWAikbc7Vywo2alyT+2sww==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6C1060008;
	Tue,  4 Jul 2023 14:29:38 +0000 (UTC)
Date: Tue, 4 Jul 2023 16:29:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Yangtao Li <frank.li@vivo.com>, rafael@kernel.org,
 daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
 mmayer@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 florian.fainelli@broadcom.com, tglx@linutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, bchihi@baylibre.com,
 wenst@chromium.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/5] thermal/drivers/armada: convert to use
 devm_request_threaded_irq_emsg()
Message-ID: <20230704162937.2600d5b0@xps-13>
In-Reply-To: <20230704142227.65k3kdrnyqqolf6t@pengutronix.de>
References: <20230703090455.62101-1-frank.li@vivo.com>
	<20230703090455.62101-3-frank.li@vivo.com>
	<20230704104608.29527ec3@xps-13>
	<20230704142227.65k3kdrnyqqolf6t@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_072946_383418_2156E307 
X-CRM114-Status: GOOD (  41.38  )
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

Hi Uwe,

u.kleine-koenig@pengutronix.de wrote on Tue, 4 Jul 2023 16:22:27 +0200:

> Hello Miquel,
>=20
> On Tue, Jul 04, 2023 at 10:46:08AM +0200, Miquel Raynal wrote:
> > Hi Yangtao,
> >=20
> > frank.li@vivo.com wrote on Mon,  3 Jul 2023 17:04:51 +0800:
> >  =20
> > > There are more than 700 calls to the devm_request_threaded_irq method.
> > > Most drivers only request one interrupt resource, and these error
> > > messages are basically the same. If error messages are printed
> > > everywhere, more than 1000 lines of code can be saved by removing the
> > > msg in the driver.
> > >=20
> > > And tglx point out that:
> > >=20
> > >   If we actually look at the call sites of
> > >   devm_request_threaded_irq() then the vast majority of them print mo=
re or
> > >   less lousy error messages. A quick grep/sed/awk/sort/uniq revealed
> > >=20
> > >      519 messages total (there are probably more)
> > >=20
> > >      352 unique messages
> > >=20
> > >      323 unique messages after lower casing
> > >=20
> > >          Those 323 are mostly just variants of the same patterns with
> > >          slight modifications in formatting and information provided.
> > >=20
> > >      186 of these messages do not deliver any useful information,
> > >          e.g. "no irq", "
> > >=20
> > >      The most useful one of all is: "could request wakeup irq: %d"
> > >=20
> > >   So there is certainly an argument to be made that this particular
> > >   function should print a well formatted and informative error messag=
e.
> > >=20
> > >   It's not a general allocator like kmalloc(). It's specialized and i=
n the
> > >   vast majority of cases failing to request the interrupt causes the
> > >   device probe to fail. So having proper and consistent information w=
hy
> > >   the device cannot be used _is_ useful.
> > >=20
> > > Let's use devm_request_threaded_irq_emsg(), which ensure that all err=
or
> > > handling branches print error information. In this way, when this fun=
ction
> > > fails, the upper-layer functions can directly return an error code wi=
thout
> > > missing debugging information. Otherwise, the error message will be
> > > printed redundantly or missing.
> > >=20
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > ---
> > >  drivers/thermal/armada_thermal.c | 13 +++++--------
> > >  1 file changed, 5 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armad=
a_thermal.c
> > > index 9f6dc4fc9112..a5e140643f00 100644
> > > --- a/drivers/thermal/armada_thermal.c
> > > +++ b/drivers/thermal/armada_thermal.c
> > > @@ -913,15 +913,12 @@ static int armada_thermal_probe(struct platform=
_device *pdev)
> > > =20
> > >  	/* The overheat interrupt feature is not mandatory */
> > >  	if (irq > 0) {
> > > -		ret =3D devm_request_threaded_irq(&pdev->dev, irq,
> > > -						armada_overheat_isr,
> > > -						armada_overheat_isr_thread,
> > > -						0, NULL, priv);
> > > -		if (ret) {
> > > -			dev_err(&pdev->dev, "Cannot request threaded IRQ %d\n",
> > > -				irq);
> > > +		ret =3D devm_request_threaded_irq_emsg(&pdev->dev, irq,
> > > +						     armada_overheat_isr,
> > > +						     armada_overheat_isr_thread,
> > > +						     0, NULL, priv, NULL);
> > > +		if (ret) =20
> >=20
> > I don't see a patch renaming this helper with s/emsg//, do you plan to
> > keep it like that? I bet nobody outside of this series will notice the
> > new helper and will continue to add error messages because it kind
> > of feels "right" to do so.
> >=20
> > I would rather prefer returning to the original function name which
> > everybody knows/uses. =20
>=20
> See https://lore.kernel.org/lkml/87h6qpyzkd.ffs@tglx for why there is a
> new function name.

Yes of course, I fully understand Thomas' concerns, but I am
questioning the usefulness of creating such helper if it's not the
default. People will continue to use [devm_]request_threaded_irq()
without noticing the new helper. If we want to make this change useful,
I believe we should:
- target all users
- at the end of the series: atomically include the error message in
  request_threaded_irq() and rename all callers of the _verbose variant
  which will eventually vanish.

Otherwise this is a lot of noise for very little progress, IMHO :)

Thanks,
Miqu=C3=A8l

