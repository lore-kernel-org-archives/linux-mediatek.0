Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726C5C25B76
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 11:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ru5P8lRF/gNAmlLJ0Tfh9QHUrh22PROtEzMg29undro=; b=2sn7zjJECfp/wa6mV6HL7gCPcn
	VbWRTq6agc95JfUK5EZ3f75hxAxuLMa8ZkEcbGfYn2AXqY9l3aSEkR+RdEuNXJtvOev3bsfeffuTn
	I8PQ+nf4CM2pV+FOjUKf58S5MJgTd5Ge0x1lF3l9rCNpePrw/O/p5ik4IsJkr3/H1/cRrNupVqJKl
	tqSZDZeaxtiFjcnkFJF/UeBD+RJj0o12b856+9gzz0KyAK4+QM52Vq87ONBVGHzQQIG/SffIvFnog
	Q0kKTg1kSM8uQ58RlbS2HQaXTvGAu4s44Gkbceof0v/GCSgf+b5uPq7/m2r/O4u9rIsPhWEwCt0ak
	rLzj0syQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE69w-0000000GZrY-2hy2;
	Mon, 03 Jun 2024 11:47:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE69t-0000000GZps-2PBu;
	Mon, 03 Jun 2024 11:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E83EC60D2B;
	Mon,  3 Jun 2024 11:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419B4C4AF09;
	Mon,  3 Jun 2024 11:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717415244;
	bh=3Im1QpDdWkDh0sb6TFhqrVvzJ24+046kZtmwGLRL/Jk=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=tSlPDIH/gvTaPGlTgTDQUmrEB6CAdfgyZ/5kDLkDs7vbBlI/Pymu4Om48sGbmFPCA
	 6+CD1r/ZA4L81E/q6P6S+Gjq8DOZ2aHj9JaX1aXHiE2SuUADHKMCiYxTL+ScKsC/8Q
	 Yt9q3mq7nVNVyYlWYCjxk4m9jWeVym667qQr0rKxw3FvC+EhhsA9N0M10phRAR6tP1
	 uHp/pSygLH1l6mqFqTsbE69SC9gN9OS1b+L4uNN3DBE7oTYvPh7m8zS/IBkR4sgOc4
	 KF+4Rn+j5gueKjR1/4oCmeX0acmRsUUFVxPBFmogw46N+kd6KbppQf1fAnzf3dQ3cq
	 5QZbui0BORiVQ==
Content-Type: multipart/signed;
 boundary=65f0fc295269b97015ccf49f95fa8248b459b679f76c7412027362baf4cb;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 03 Jun 2024 13:47:20 +0200
Message-Id: <D1QCW5G2I7E0.2MM683BWHR5N1@kernel.org>
Cc: "Daniel Semkowicz" <dse@thaumatec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sam Ravnborg"
 <sam@ravnborg.org>, "Vinay Simha BN" <simhavcs@gmail.com>, "Tony Lindgren"
 <tony@atomide.com>
Subject: Re: [PATCH 00/20] drm/bridge: tc358775: proper bridge bringup and
 code cleanup
X-Mailer: aerc 0.16.0
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_044725_785261_337BC4F0 
X-CRM114-Status: GOOD (  18.09  )
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

--65f0fc295269b97015ccf49f95fa8248b459b679f76c7412027362baf4cb
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon May 6, 2024 at 3:34 PM CEST, Michael Walle wrote:
> This patchset fixes the bridge initialization according to the
> datasheet. Not sure how that even worked before. Maybe because the
> initialization was done prior to linux (?).
>
> The bridge has some peculiarities:
>  (1) The reset has to be deasserted in LP-11 mode
>  (2) For I2C access the bridge needs the DSI clock
>  (3) The bridge has to be configured while the video stream is
>      disabled.
>  (4) The bridge has limitations on the display timings. In particular,
>      the horizontal pulse width has to be at least 8 pixels wide and
>      both the horizontal pulse width as well as the back porch has to
>      be even. According to the datasheet the horizontal front porch as
>      well but in line sync mode, this is ignored. Also line sync is the
>      only supported mode for this bridge, therefore, the front porch
>      is always ignored.
>
> The most controversial patch is probably "drm/bridge: add
> dsi_lp11_notify mechanism" which is needed for (1) above. Some time ago
> there was a series [1] to add a manual power-up, which was abandoned and
> which didn't suite the needs for this bridge anyway.
>
> Also, this will gradually change the tc_ prefix to tc358775_ while the
> functions are refactored.
>
> The bridge was successfully tested on a Mediatek MT8195 SoC with the
> following panels:
>  - Innolux G101ICE
>  - AUO G121EAN01.0
>  - Innolux G156HCE (dual-link LVDS)
>
> [1] https://lore.kernel.org/r/20231016165355.1327217-1-dmitry.baryshkov@l=
inaro.org/

Any comments on this series, besides the discussion on how to do the
reset during LP11?

Most of the other patches should be more or less self contained.

-michael

--65f0fc295269b97015ccf49f95fa8248b459b679f76c7412027362baf4cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZl2tSBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gPqAGAvrp3hTLYUbjIYBOpNYq9pcLyYAkX0L1M
pnxRMxFhmPLqiUGqptlFhUG/89N83cXRAYDf5X6gn9jZ6lVGmpOmSM8iYxeTgaBT
q/FJmhXj6+H0qREQl40LYeF7XWWiPR5wO9c=
=K1xu
-----END PGP SIGNATURE-----

--65f0fc295269b97015ccf49f95fa8248b459b679f76c7412027362baf4cb--

