Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF57C0218D
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2025 14:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSEV+em0N0SfQE1alVhrq6tX6ofwmLyBx4bRZxI20Mc=; b=JnSFra+VKrpkcD0M7TkztKRmbE
	gjYDsIm6EbxGv2KfwjzSCQ1JYWsEJj93kT4wFaRk8a399oXEe1bRukFWhpog8b9RCb+Ojft7UHXfL
	eTmDh08NR7s+BA04M29PY6NXITvugSfaoIHvT6ic3ioCrafsc7NrlhaRJbSZ8zYibT/q+ZXSXU9Gc
	nHnolePNzfmtx+rnxIqBApfYdlTx7bBuFJpfuB+IGbkCGSRKsShQDrYQxiFmewUXkYVaairUNhwRs
	0SaPneAvb2Htzq3PxkUy4BJDZ1rk3gcHzMAWreYwj30mpgfKG6QbF6+ggj88zspcKP9Ur68Nkokmd
	GsGbKyIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td9H5-000000079pC-2Cww;
	Wed, 29 Jan 2025 14:42:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td9G8-000000079ex-2qgV;
	Wed, 29 Jan 2025 14:41:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4363ae65100so77610695e9.0;
        Wed, 29 Jan 2025 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738161698; x=1738766498; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zSEV+em0N0SfQE1alVhrq6tX6ofwmLyBx4bRZxI20Mc=;
        b=nGVr9XVi8T9XFiQsTmVbwMlX5GWUD8V3EL5AYAalVIsHgF+ET8wjLmMjrtNwb8Lp77
         JaIY/RQS2ALmkIQuDVL3ulAyS1aFDqiTjNohHuFaOQClMrZlm0BggjaBOUihYtS5Yhzi
         lUavzLeXj1gYQ5wABkIedm8/AxTxbMpyhpJFAoQiVDIfvZfhii23aU1ZEU0is/ly1ZxF
         ls8911v+ZOVjwbgbvYmuZn/2kIh7S8ZmQULW/VcDrQXsOuIznPMfBSLU2OCR7qWDQXtN
         MXBFmxsuUgd5oalhQJJK/Pi0CV3k5GPv7sG252M47xyAEQKh/MLJUKLbeTKAUbI2OMA8
         sIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738161698; x=1738766498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSEV+em0N0SfQE1alVhrq6tX6ofwmLyBx4bRZxI20Mc=;
        b=E6Tkfw9joLrkCXy8z0lW3PrErjASxM1mawCSQUeFvMrFe13Xtvi8TcwR+qDUzMSZNi
         W1Ibqa8LwS0OWdVnlSYeWZNZnwQFaRgOScvV6xM258ClwOM4or969ckqoNDc15OzG93E
         6tpcvURW6NelUvyTEfoSlCyYbQBU1V6N83oFaXgC6rceLqGKTcR/DBlDukTtr1M5heUK
         wxw4NjkqpBOeWgqGAocCsfz3HZHqtaz1mmyTj0NNjW4V3MWzrNI/FW+k5f0BBkKCiyh0
         Va7cyMcMA25NvwT9IJl6DtGO2qT+hApgDeELVNMFLVdKSUkOImSy7n4ieqZFslLSvciE
         nzyA==
X-Forwarded-Encrypted: i=1; AJvYcCU5FtyiIeU+vpPuhzfr18gUMDRwRbPqkuq90kYIUWKsZwRfuIgDC0HFiHj9bCjHWXaGdzvm8lB1w+zTD5/v@lists.infradead.org, AJvYcCUJcZGlPHOGS3x9FJB0Cx7AlN1oTFOorfjSGZSijBQLtp0rk4fDN8K6/NNGJF+ckbuTy3W9Y1tNDhPubNr4oMkqXA==@lists.infradead.org, AJvYcCWV+hocCehLriIVy1+uSJDNYd/Nsa0BoglTsymiEe4zsrLl2wwbNzThHjWZNutljyJ4VWgLzMwNLc7hMDt9uZc=@lists.infradead.org, AJvYcCXKlNvXSQSuFmxXb7b4ADj7VB+PtCmghhKJQb1vfwHyEsMY0P9X2FUvcUEx3oLb+b9q3dUMO8xGWYJiZjxLaTU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9x9G0Fs/UBsgRVsuuXY6jk4AZ3LgJVCO+c06GVeYy6R7eeMl1
	xA1uuQEzAq8dhw1u58fgKyjb++G10KifeyXylWdhzzMNQL/TYDwD
X-Gm-Gg: ASbGncs07EiPgHgDYQrcoElX9wOYeYgQmb9TkLCTg/cPgYU0BqzYBrSl/xHqH7Xj5fl
	tLCfQroscs+YS6f6mmFiJNhCncFneSVdnU20gpiCtrcHrBSZk+lIqR7WdiNuEISPv8qgcbNVOF5
	scvcUfccPAWyYBnpHBf3OzvpKTqLxt2UPTnC26A+tq10H70rbk5w9tnZ4MYAheLZjObvRE9DKRU
	w+oR4zrhHcvQC7SNTWtQtmsYzI9kR1/LytyrCWPlGNghu+DnM9vV1m7/mW+99pN61lLbjsRVxr3
	oph2Ysz+X3e3u244PPaih/3pRp7VGIVpr6VmvIWMqCCBSrkDHglpXitMsUaUbLyN6/0PwmHXsPv
	ODg==
X-Google-Smtp-Source: AGHT+IGdWBqWeiv+jbIoBfzm7k0/2DrarU7EXB90OvgtRbMeVkAoe8ODcFAhL4eNP6mW3P0r12bwJA==
X-Received: by 2002:a05:600c:4e07:b0:436:e86e:e4ab with SMTP id 5b1f17b1804b1-438dc4353e7mr35398335e9.30.1738161698102;
        Wed, 29 Jan 2025 06:41:38 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2b1d9sm24718285e9.21.2025.01.29.06.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:41:36 -0800 (PST)
Date: Wed, 29 Jan 2025 15:41:32 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
	Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
	Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 14/14] Documentation: Update the todo
Message-ID: <2y3lwycrggmktamu3j3gj65uco7quvtu7tlc3724e4mpokhjz2@icedc3kervme>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-14-0d1609a29587@redhat.com>
 <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
 <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cigenp6alv7pkbet"
Content-Disposition: inline
In-Reply-To: <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_064140_716725_317C5D3B 
X-CRM114-Status: GOOD (  18.96  )
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


--cigenp6alv7pkbet
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] Documentation: Update the todo
MIME-Version: 1.0

On Wed, Jan 29, 2025 at 03:31:50PM +0100, Maxime Ripard wrote:
> Hi Thomas,
>=20
> On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:
> > Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:
> > > Remove the TODO now that this series addresses
> > > the changes needed.
> >=20
> > While your series is fine, this TODO item is unrelated. It's about vari=
ous
> > ancient fbdev drivers that do not reserve their memory regions correctl=
y. So
> > please drop patch 14 form the series.
>=20
> Is it? Could we rephrase the entry then? I'm the one that suggested
> Anusha to work on this, and it's still not clear to me what it means
> exactly if it's not what she worked on :)

The text in the TODO sounds pretty clear to me. It says that not all
drivers request the memory that they are going to use, and suggests to
add those missing calls. But all of the drivers in this series already
do that and the only change here is to convert them to use some of the
newer helpers.

Thierry

--cigenp6alv7pkbet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeaPhkACgkQ3SOs138+
s6H45hAAkHi6OubObNKNwO2CYc2mT8gjjY3iZP3UvxqouoU05ylZ0uUIxHOz8K8T
vXb+tkMFtsqIZZTJZGti+67m/YYOCtZsvXO79IMZy7WUab/bKWX7x2vy3WjN5lyG
yqlo8kp85y69za3sJHjRrUvr4acQSDyDejrwBdWN2xMCnDgzG5lzXkXhibhyOaMd
p0wyLE4EkS0pdxCg2FGGjiFOAnWmHd3+DPW3wRSMVsiXpVgWxEAQ6aGmNMtl0Y7F
KM7UDu0umziZxMyR2/4SFn7Q772BDa1dwInJhSBF3ugkGdQ3mSPpBeDPjf+cI2Mj
69Z5AA1KQOhvGcKM9WOW/kXV9/CeXD1dv6Z5c4ho4gnOWA9Sjj0PUVRIJy7oDtm5
4SdccVE1EPL/+IzByDQFxbG6/UFTJroG0+N9mpx9p2tZ0fJDGiQepxQ6XqLKlbZg
olV21Xytohgotp2SlQ8tk2PIln70QKzEanmMVBl2WEkxAByKbu/XK+4A9+3/Hy9l
+RdZ/r1pHfzlW7nzFGKpNeNaH3uMkupcb4PsceavHYDmabcKJtyK4J2/xp218nwA
EopzxkwqOiYMAHl1/tBeNlt4bEIhph/3ldgBr6fgUWSbddKQxr6YjU/Lyvp5KOFH
qkb1aCLDg6nKqceZe1QQeEDsVyZJA2a3ACyQ5rpyrniazDRDlU8=
=VcN2
-----END PGP SIGNATURE-----

--cigenp6alv7pkbet--

