Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7A6C49EA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 08:33:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 301A8613FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 08:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 301A8613FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9x2AhDKKpzc6Q0YFxH58KRlVJ5y8soeIobnXmG75IaU=; b=qOVfaM60ywzx7L
	nTNRkPljvGaKZ3JLFcx6Sl5Tw9K8sA03RVArqE8DGnDZN4qsj4S5RidENDq/hWt8sNzk0Ae7JE6XM
	hd3QiUKM0AvU0sTuU05++9L98m0ZdHWV/yIYx4xwUzAhx4oDLxEekt+eJqoI/CVuZbGhhitSNm+7o
	P4a0nxUDeadaMGD62ApKDq68ndSwecBtUD7ls2308wfDqad7m1eCyv/aag7cye7MU8tQhf4uJtq3G
	oGyyvjXSwJNhrM/7MugdhUz6i99L/FduKor5P0aF/GJVUexpmKL+1g5oNTZ1uUaryNCGhyQWV/8l8
	VB8EF5nyZHrH7mBIUunQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwKnG-00DRxz-Rg; Thu, 24 Jun 2021 08:33:02 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwKn4-00DRud-Ta
 for linux-mediatek@lists.infradead.org; Thu, 24 Jun 2021 08:32:52 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lwKmk-0006cm-HJ; Thu, 24 Jun 2021 10:32:30 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lwKmX-0006oO-Cb; Thu, 24 Jun 2021 10:32:17 +0200
Message-ID: <43f805608f1172b73c62717f6cdc72c7a15d145c.camel@pengutronix.de>
Subject: Re: [PATCH 08/15] drm/<driver>: drm_gem_plane_helper_prepare_fb is
 now the default
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Heiko
 Stuebner <heiko@sntech.de>, Paul Cercueil <paul@crapouillou.net>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>,  Philippe Cornu
 <philippe.cornu@foss.st.com>, Lucas Stach <l.stach@pengutronix.de>, Daniel
 Vetter <daniel.vetter@intel.com>, Laurentiu Palcu
 <laurentiu.palcu@oss.nxp.com>,  Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>, Stefan
 Agner <stefan@agner.ch>, Sandy Huang <hjc@rock-chips.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jyri Sarha <jyri.sarha@iki.fi>,  Tomi Valkeinen
 <tomba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org,  linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,  linux-sunxi@lists.linux.dev
Date: Thu, 24 Jun 2021 10:32:17 +0200
In-Reply-To: <20210622165511.3169559-9-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-9-daniel.vetter@ffwll.ch>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_013250_963344_0E146192 
X-CRM114-Status: GOOD (  13.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2021-06-22 at 18:55 +0200, Daniel Vetter wrote:
> No need to set it explicitly.
> 
[...]
>  drivers/gpu/drm/imx/ipuv3-plane.c           | 1 -
>  14 files changed, 15 deletions(-)
> 
[...]
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
> index 8710f55d2579..ef114b6aa691 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -772,7 +772,6 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
>  }
>  
>  static const struct drm_plane_helper_funcs ipu_plane_helper_funcs = {
> -	.prepare_fb = drm_gem_plane_helper_prepare_fb,
>  	.atomic_check = ipu_plane_atomic_check,
>  	.atomic_disable = ipu_plane_atomic_disable,
>  	.atomic_update = ipu_plane_atomic_update,

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
