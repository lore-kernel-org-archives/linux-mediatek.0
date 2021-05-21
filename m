Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4D2C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 12:21:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFB0E6108B
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 12:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFB0E6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqYm1rAu73PFTDT+8YOlhKe2mRY8xFIkRryJL+MfCLI=; b=baSwJorLxI+PUbnN0jjeeQhowf
	pignG8E4BBJvsbliEYln+Jn245ZSRiZEMXAd1j0IGO+zUAAUNV0+T14Mk1/ZODB3YEGw+piNsZsMM
	Qp8ep02/7+YZSVrdLD5GvUn6veC1pbsatwcG/AJ9xfP2uiYeuNMfXLCCq8U70Kn+upqP+t9/QNOlq
	n/q+ziNa9ADoZ7Ogqu65Efy5DoxvsW8LTt15ZODsgfDNdxDk5mt+8Ee/aw9N10oQ7Lplp5M4WVu/u
	0P4TG7K/yi06nlpH5NXIqYb8/C/4WZzEcNkREEZVrOVHxBBVjljq2LhAWnGAfDa7ZyTd/X1vfmjh+
	4qeF402g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk49R-005HsV-92; Fri, 21 May 2021 12:21:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk49G-005Hq8-FK; Fri, 21 May 2021 12:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=R5EcV7CAM7nC4SWSLxtgyQRun5qu4q+1pXSpGe+4hLk=; b=YyeJWb1RUbT3usUamX0p6yp1iF
 Xtqx4eWeQVOHtsVpkxmYZ4kpe1M4HfBVgAOSf/9cpuk0OstcYvF6SibF96v8e8vwFdyRQlxKdUSEi
 PMnqqpcVs97C6+fx8D8HOl6FvBGOj7hoiutwKJSp+rZcMLZhKv0TWZgIaCg8uyg+a3oxiAW58yVk2
 uZJEJx9D8W5t5f/u5cYme8x3BHlVG3vuScuGLr/EKFuZq0E92K1J2qb3TqXFKdbh2qipUOPUArtG6
 6owCSq6Jj5DegXuUZR5MVJDMYXYkqPHFGkaU9wG2UH912/sE6ZKiM4Guoub+uHXkYHYDZRwYIKvPt
 z9qYFvWA==;
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk49E-00H5qw-0L; Fri, 21 May 2021 12:21:01 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lk48b-0006Ky-N0; Fri, 21 May 2021 14:20:21 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Sandy Huang <hjc@rock-chips.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 06/11] drm/<driver>: drm_gem_plane_helper_prepare_fb is
 now the default
Date: Fri, 21 May 2021 14:20:19 +0200
Message-ID: <3534824.Icojqenx9y@diego>
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_052100_073481_19793414 
X-CRM114-Status: GOOD (  11.78  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am Freitag, 21. Mai 2021, 11:09:54 CEST schrieb Daniel Vetter:
> No need to set it explicitly.
> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=FCbner" <heiko@sntech.de>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-sunxi@lists.linux.dev
> ---
>  drivers/gpu/drm/imx/dcss/dcss-plane.c       | 1 -
>  drivers/gpu/drm/imx/ipuv3-plane.c           | 1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c   | 1 -
>  drivers/gpu/drm/ingenic/ingenic-ipu.c       | 1 -
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 1 -
>  drivers/gpu/drm/meson/meson_overlay.c       | 1 -
>  drivers/gpu/drm/meson/meson_plane.c         | 1 -
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c           | 2 --
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 1 -

For Rockchip
Acked-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
