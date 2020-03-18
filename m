Return-Path: <SRS0=5sS2=5D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4F8C5ACD6
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 13:11:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2CE720724
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 13:11:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CO48e/Zp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2CE720724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xnjm+7DEszcyJZuuKWS7jz1KIcjpFuuKH5HWpMpYCqs=; b=CO48e/Zp7V2ezmaeMHklCeR07
	+TfMH9bBExAalE5H74gqZ74pqb9C51aW3erttQqeOSILgQVRvQ944OhTsZe2dXktgB2WUwTKtXbdL
	RhbEHIzK6Gx71g6R5Iqjwgp2WVp3IYi0OjR4cHWfguLpZRhGKnriNou7VzZOw776/St9Ox7ynxQXo
	eH4SWpo943U3hPmI8/+Q9Tpu+19HHaJZaZ7nVdI2IRHq89EfwZpWphKM3s5fT5G9o8HeEgMDLI/qi
	SFagzmVoKve3yDIgb6T+wwvxanv/3QMdL+B7zWxOv83R9GP2EbxwoKjUJe5UPjUPhZfq/cqcKkN63
	/cF0XVd5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEYU0-0007iB-Ge; Wed, 18 Mar 2020 13:11:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEYTs-0007a1-8U; Wed, 18 Mar 2020 13:11:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 1E0CF294B84
Date: Wed, 18 Mar 2020 09:11:14 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v5 5/5] drm/panfrost: Register devfreq cooling and
 attempt to add Energy Model
Message-ID: <20200318131114.GA1812@kevin>
References: <20200318114548.19916-1-lukasz.luba@arm.com>
 <20200318114548.19916-6-lukasz.luba@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200318114548.19916-6-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_061132_436113_5C9A2267 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com, festevam@gmail.com,
 Morten.Rasmussen@arm.com, robh@kernel.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, daniel.lezcano@linaro.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, orjan.eide@arm.com, daniel@ffwll.ch,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 mka@chromium.org, rdunlap@infradead.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, kernel@pengutronix.de,
 sudeep.holla@arm.com, patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Type: multipart/mixed; boundary="===============9178930042018709636=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============9178930042018709636==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Wed, Mar 18, 2020 at 11:45:48AM +0000, Lukasz Luba wrote:
> Register devfreq cooling device and attempt to register Energy Model. This
> will add the devfreq device to the Energy Model framework. It will create
> a dedicated and unified data structures used i.e. in thermal framework.
> The last NULL parameter indicates that the power model is simplified and
> created based on DT 'dynamic-power-coefficient', voltage and frequency.
>=20
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/dr=
m/panfrost/panfrost_devfreq.c
> index 413987038fbf..8759a73db153 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -105,7 +105,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfd=
ev)
>  	}
>  	pfdev->devfreq.devfreq =3D devfreq;
> =20
> -	cooling =3D of_devfreq_cooling_register(dev->of_node, devfreq);
> +	cooling =3D devfreq_cooling_em_register(devfreq, NULL);
>  	if (IS_ERR(cooling))
>  		DRM_DEV_INFO(dev, "Failed to register cooling device\n");
>  	else
> --=20
> 2.17.1
>=20

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl5yHe0ACgkQ/v5QWgr1
WA3gpxAAhQnRoPbq6S2+0Lb7C5bP7Ta67p3aDFRc/xxNEKsqRl5YcErm72knMqpa
ojkyaIkecKFeI6D1QS9UpFtSDzHdq+HsBJSnSBsR8ND6GOlUv3ZQhl7dQAf37exS
Kq64qQnpJfy/kcF5zStxtD145VJDXoX1By4AdnSg+kOuYi2HAKQ2SbQvYDd5ffk0
9fe6YagwE/iaz2o5z0c2EO6nBjstSo91/AKx99MwW7IfgJmgMZCGE0Q4UTduryr2
tFSBzWTStKCWxI2lDsrRQcF7KN4mZ2dZWgNFo4UU5tp36/kGHqKQ+Vzyaay8WWGU
IHgjKW+vo9TH8QyayRCCljtl/iYUbhrEa9n6APCnmW6sNsxPuO6KbZ3vzMz6WkLJ
/W1M+XIchveNFRZB7ku8DG4nLgISikgjMnPCO/F/y0NOQ8YaU7GeyeGj7yRom6LY
e4Oz34cToBULP5m6B1b/KGu013TwkRqwAoc2qHAlB5TXBXm/zOdyLqPo1/pgul30
H4+YKSUEl95b5w8URYnoKvf3sS0wocG4GvdC2pY8IOYRUNSmfsxiPW33Y7wcavgj
WF9YUFO5mRV1b+2QppuWp2UIwSjC7Uuh2lCTFhK4hod+RptE5h1MoKmQa2jSegr8
3uvfCXtDGQskJ+MDv9aUtGYTX14nPfwXUO3RPidKGgMF8r6W3to=
=pczP
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--


--===============9178930042018709636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============9178930042018709636==--

