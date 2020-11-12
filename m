Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D000C55ABD
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 19:07:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64EC620B80
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 19:07:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zNCBO9bm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h33D+mRR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64EC620B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3/dN3nTSnKtQM/Mb0PD/ryPeGQcAhgIqcrKpwrSCtpE=; b=zNCBO9bmmsWg3JpqsZVVoK+yt
	Y9Q43zO0Cy15PtVVSVKDwwg2LMGtEtjhmur0F0ynPh6SrOrRG5CK8D4oc9YGXqOP0RJjKVvMxRVdi
	vbBltbMqSv0wU0NHC8i8OuMrLHenrP9HUWRTZKMn30/QgfC9FEy+VDkZkmsFowh93FbcD8IMnE6/E
	gq1qQ9upzA1YIh7TvX2NPzcWehyDcUcstAtHQ1qu3OPVfNhnf3zCdDUIMHryFVy/RSM7Gu/CnW94/
	noM7BeXZHTCe0N8uh+Gg/u8LxJy6ilC8/q6n0TAKbxM47e/6zW/msjahIjXhOGwkdRrhJjbdV2mWb
	PYFy7YXqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdHw5-0006cg-P0; Thu, 12 Nov 2020 19:07:09 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdHvr-0006Vn-Mg; Thu, 12 Nov 2020 19:06:57 +0000
Received: by mail-wr1-x444.google.com with SMTP id p8so7188020wrx.5;
 Thu, 12 Nov 2020 11:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xEBQ+X3j8UVOYbY0ZzGSw1N+DpyyJg/wWh7q1siWRJ4=;
 b=h33D+mRRRvo6/1txIF4V3Jz/UuKLAJaOqy8ik/N8dTlunkqrn4JyGAQ8GkXQG7Xg7K
 VKYedpGIlTERFNHTDnq8DKx/hnoo/zVqhxAGgVlP5TlU7R0LmnWRAbLGzfIHBGL4fQ8C
 EDh5ZV4UMdnQeLnqJaxygnqvmbOlkCNB+U0iHJB3JgfkiVQz5FzZZgwhTYLdOhrTZCcn
 5sbGvhYzkUh7OV0odRqD2N1T0g93/QWFlRlkuSazpVwvFD9fQh2X+LrO+kYCZ41en1fJ
 //XCnICraHifQu4S96Icxg6l8XtlgTOndlf66hH/CqGZPpPybDGFHT4BExopTX/NPqcD
 8m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xEBQ+X3j8UVOYbY0ZzGSw1N+DpyyJg/wWh7q1siWRJ4=;
 b=qxSKR+wZYvZ7YUONJH+cRmRSDJzQMRuznfVGvAMNpV4aFu6LD8mzHBsEbo9Xtdynaj
 ZvGkvDm0ETX0D3FB6ARN5NUPcg7qZvNXfHrTsdyjU7MqS8OSgGkGUnUdsQwxuyra8D3t
 4KgwP05H5bgAENMB0iNtbtaAu7cYVslkho0mCBFLtroPiehhxnK1ggcX5FDdmg+7EI0q
 RF0wl8oeVZ6/bbX5aOkjEyPOkNvekst3IFPyttcbt3aPVXN0L9KBZ2qd+jvUtq3ubZ5W
 TiEkb76gtBvLY5AuPa6Hi9ryqab045GtCg06Z/YkgGglvrriSklL1NrBTG1y8Y01D4ya
 4mXQ==
X-Gm-Message-State: AOAM5321I4JJn0HyvAYgdoAXSm37tcP7CCcZwY2ZuwANnw73tunMOCUn
 +aoSKB+5Rm2E+aSHlIZHLKE=
X-Google-Smtp-Source: ABdhPJwh5v5jsUINEfAgHo+Yz1dU4BfWu2Vhg3yORml9Zdo4fRJyxoz3JbVnZCE8wfzxzwdlH9aG6Q==
X-Received: by 2002:adf:f085:: with SMTP id n5mr1086434wro.293.1605208012606; 
 Thu, 12 Nov 2020 11:06:52 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id n6sm7959107wrj.60.2020.11.12.11.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:06:51 -0800 (PST)
Date: Thu, 12 Nov 2020 20:06:49 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 01/32] pwm: sun4i: convert to
 devm_platform_ioremap_resource
Message-ID: <20201112190649.GA908613@ulmo>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
 <20201112161346.gp5nenuagx5wmwl2@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20201112161346.gp5nenuagx5wmwl2@pengutronix.de>
User-Agent: Mutt/1.14.7 (2020-08-29)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_140655_889371_EDD4F17B 
X-CRM114-Status: GOOD (  31.92  )
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
Cc: alexandre.belloni@bootlin.com, heiko@sntech.de,
 Yangtao Li <tiny.windzz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 festevam@gmail.com, f.fainelli@gmail.com, shc_work@mail.ru,
 khilman@baylibre.com, wens@csie.org, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, ludovic.desroches@microchip.com,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 slemieux.tyco@gmail.com, linux-pwm@vger.kernel.org, rjui@broadcom.com,
 s.hauer@pengutronix.de, mripard@kernel.org, vz@mleia.com,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 paul.walmsley@sifive.com, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 nicolas.ferre@microchip.com, palmer@dabbelt.com, kernel@pengutronix.de,
 shawnguo@kernel.org, claudiu.beznea@microchip.com, nsaenzjulienne@suse.de
Content-Type: multipart/mixed; boundary="===============2050647774919739519=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2050647774919739519==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 05:13:46PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Thierry,
>=20
> On Sun, Dec 29, 2019 at 08:05:39AM +0000, Yangtao Li wrote:
> > Use devm_platform_ioremap_resource() to simplify code.
> >=20
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  drivers/pwm/pwm-sun4i.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> > index 581d23287333..f2afd312f77c 100644
> > --- a/drivers/pwm/pwm-sun4i.c
> > +++ b/drivers/pwm/pwm-sun4i.c
> > @@ -344,7 +344,6 @@ MODULE_DEVICE_TABLE(of, sun4i_pwm_dt_ids);
> >  static int sun4i_pwm_probe(struct platform_device *pdev)
> >  {
> >  	struct sun4i_pwm_chip *pwm;
> > -	struct resource *res;
> >  	int ret;
> > =20
> >  	pwm =3D devm_kzalloc(&pdev->dev, sizeof(*pwm), GFP_KERNEL);
> > @@ -355,8 +354,7 @@ static int sun4i_pwm_probe(struct platform_device *=
pdev)
> >  	if (!pwm->data)
> >  		return -ENODEV;
> > =20
> > -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	pwm->base =3D devm_ioremap_resource(&pdev->dev, res);
> > +	pwm->base =3D devm_platform_ioremap_resource(pdev, 0);
> >  	if (IS_ERR(pwm->base))
> >  		return PTR_ERR(pwm->base);
>=20
> Can you please comment why you don't apply this series?

I did in fact apply this yesterday, but I now see that I didn't reply to
the thread to report that.

> My point of view is:
>=20
> devm_platform_ioremap_resource is the designated wrapper to replace
> platform_get_resource() and devm_ioremap_resource(). So I don't see a
> good reason to continue open coding it.
>=20
> The patch series doesn't apply to 5.10-rc1 as is. (pwm-puv3 was removed
> and a simple conflict in the pwm-rockchip driver.) The overall diffstat
> (of the fixed series applied on top of 5.10-rc1) is
>=20
> 	31 files changed, 32 insertions(+), 96 deletions(-)
>=20
> and it converts all of drivers/pwm but a single instance of
> platform_get_resource() + devm_ioremap_resource() (for pwm-lpss where
> platform_get_resource and devm_ioremap_resource are in different
> functions (different files even)) which isn't trivial to fix.
>=20
> So in my eyes applying this series is the right thing to do.

For the record, I personally think this helper is a bit over the top. I
do agree that it's nice to create helpers for common code sequences, but
this is a *lot* of churn all across the kernel to save just two lines,
which I don't think is worth it in this case. Often these helpers allow
common mistakes to be avoided while at the same time reducing lines of
code, but devm_ioremap_resource() was already created to address the
pitfalls (like returning all sorts of weird and inconsistent error
codes). So this helper doesn't actually add any value other than saving
a few lines, which I don't think justifies the churn. I would've been
sold on this if the ratio had been slightly higher, like maybe saving a
dozen or so lines, but as it is, I just don't think it's worth the churn
that it's causing.

I also think that it's overly narrow is scope, so you can't actually
"blindly" use this helper and I've seen quite a few cases where this was
unknowingly used for cases where it shouldn't have been used and then
broke things (because some drivers must not do the request_mem_region()
for example). And then there are cases where the driver needs the
resource for some other purpose, so you can't use the helper either, or
at least it looses all of its advantages in those cases.

That said, the helper is there and has been widely accepted, so my
opinion has been overruled by the majority.

Thierry

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+th8UACgkQ3SOs138+
s6EJGw/9H77dbaNDlBX7JuQrZ1yTANFYsknIsNBqiHqxVyeNOvnNiOCwLyMpfyD4
ZhxeUvz370ZXDuCQoA8kSbANuC36XqIoYJXUX2WbN5WQ6eJF1sRxXmctvY11Fpkc
mnztEolVT5ygFHRfXvCEeoZ2ucAZMcnKKXOMSMDLcWw4NHl5qLMwZITmtJMBQd/w
F3nHNtv+e9Za7m162+G4XXLpaMxEpD+mx0/MKKU9OQyWmNolPSQQ0TEhIX31v9gK
CpR2u5izH0pYJzo7nZahyzWGVi5cLxid93pF8wobHhvcXOGtwXH0ThZB3q7BSles
EDr//4p1Fx/99llemBrp1LO+koGgl7x7mkFFWMmakmtEueBLzmcR6jKU4A9qKera
t5AkiFK2MpzpY62o/g9JPpVDRJUFUB7z2xv4Nv6QH7Xc9rXlb5eA36T3RfOUgybi
MDbiB/6+bjnmzsKvmzmVZTAdRKPQHJh1XVX6l5qZsHU8xW3ZrG4zsZ94/gIE82w9
Ib1moNdBt7MT2XH4AILfVx+7xJtyRetkhoDMRBfsqBQZvFDbr7zuszXPPKvPQIuo
jL7uT6OIs6Yc16b0qk1My2XNO/YGufWXUMTnZoixkngZHDd0nQ+Bx49K9AR847dI
XokkpjXh91solUKZCbEhV0guv43K1HCmU9z3KOCV4RoS93nObXM=
=kMKR
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--


--===============2050647774919739519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2050647774919739519==--

