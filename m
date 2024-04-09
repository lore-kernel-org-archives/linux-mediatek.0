Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B714FCD128A
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qkWYc5wTAW4EohJljXN08qwIsPZTFO0RkTuHrCrTOw=; b=5F5zJT1HfV34eLNJgIfBvSq7FQ
	qwM1E8F4tQWSYbkTJhqQZRyPQqutGGfHrz9LyAg9+uzUpU/bBLf+XHgL97UZ0epXoJXxqV8KgPeoE
	K4aqA5tAktJHYUZtJGaZMpv8PIHCTdaqyVxzcpdvJfE3wR28AloYYMOfKffrODzu7Wg6UYhN97ghA
	kUo9ChgFGv/CWszkFcPdyK54Vci/Ct4GmUHTG3c7jG17KSnBYJAwya6gHmKvhFtZcWz9kvNZh/xwz
	tL78Djp7a/iFt5kzm6NdNqam+5+WFkWnZ817Td2XCpWhTGzQPqg4kOhDoPwGHZLEsEVFujFMMn4KU
	HyvWZnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruEzf-0000000357E-0IKk;
	Tue, 09 Apr 2024 17:10:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruEzb-00000003550-3XBW
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 17:10:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEzS-0008Pk-KN; Tue, 09 Apr 2024 19:10:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEzR-00BLKD-3C; Tue, 09 Apr 2024 19:10:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEzQ-00H51y-3C;
	Tue, 09 Apr 2024 19:10:33 +0200
Date: Tue, 9 Apr 2024 19:10:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/4] gpu: Convert to platform remove callback returning
 void
Message-ID: <tlmlxgcsz27q2hm2z5hht7deiksp7lrpin3ju2sutc2higfhmo@bw3avnea6sac>
References: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wh4wffqp5vy4ayph"
Content-Disposition: inline
In-Reply-To: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_101044_096746_54FE4915 
X-CRM114-Status: GOOD (  12.00  )
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


--wh4wffqp5vy4ayph
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2024 at 07:02:47PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> with some patches sent earlier[1], this series converts all platform
> drivers below drivers/gpu to not use struct platform_device::remove()
> any more.

I forgot to include footnote with the list of earlier patches. For
completeness:

[1]:
	https://lore.kernel.org/dri-devel/20240409165043.105137-2-u.kleine-koenig@=
pengutronix.de
	https://lore.kernel.org/dri-devel/20240304091005.717012-2-u.kleine-koenig@=
pengutronix.de
	https://lore.kernel.org/dri-devel/20240304090555.716327-2-u.kleine-koenig@=
pengutronix.de

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wh4wffqp5vy4ayph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYVdocACgkQj4D7WH0S
/k4NBQf/fGCO4C5nBz03r5cSavubMucd4IklIaLfyl262aXVhEoDky/JmF6J/iBK
DH//l0VXopedb0iA1DoShtgQd0/4murtDOrKL8i6pZ8pIzkT4VeVxaftlnnLUtrS
pi6ryVXU5kfczK9gx1c+VTbgl/sTzKmOTP7VUd7V5MctnmEE1l35kwlMwWwbLBHq
VK7IkbRT+nIRuqDfmjpIJCMWAigeJAXIclmMT5z5W7TGfqGlbhGsoVL29gdL4PsK
phXuywB6RFq0kpDbCBYBSau6ylBov/kaX5hlcGliWuxNxOjAXaXX1rbk6vghqatH
HrmfYNmYaOg/oL5DdyZD4fqTUawBrA==
=Mzy3
-----END PGP SIGNATURE-----

--wh4wffqp5vy4ayph--

