Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E71DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 20:39:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 604FF6105A
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 20:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 604FF6105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vTciiheCNybV9WxYwQiAno0EmVCuew3rglSNmEXJ5ao=; b=pbXClZDnkJZA0c
	ZlvWb2I248R4f6j8odzY68HZU/7MdK4dP7pADgtn0n5ju0MzTIueJ/MiNYQZrtlhpqmMaRbZo2ThI
	dj7KPelMz7fIlWA6J5QUOGdpyDoyhXvBTZlZe0qVyA9djqYrHdbUTCbE2SOO9sPlJpfnFPXM36zEp
	WIJ3rr4roKqI8SFDHu2JpYogZX06mEClmsrznBpwRN4vZ51a4vnwgr+S1irjTyhnCsn9dWuZ3efSt
	ZbqTc2+t+xQDMrAYtWyj3iA3ijDpJj6ZtHqVPyfpMriRLN6ybJUoN3onrvChVxHI7CgaUo7QTgR/8
	VIhseVslZJrumAucC+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNLOz-001u4H-01; Mon, 06 Sep 2021 20:39:37 +0000
Received: from mx2.smtp.larsendata.com ([91.221.196.228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNLOm-001u1b-Rl
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 20:39:26 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 7dd8ca8d-0f52-11ec-9416-0050568cd888;
 Mon, 06 Sep 2021 20:39:11 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 7FFA5194CF3;
 Mon,  6 Sep 2021 22:39:14 +0200 (CEST)
Date: Mon, 6 Sep 2021 22:39:21 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 6/6] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <YTZ8eds/IgpW/RBL@ravnborg.org>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-7-msp@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210906193529.718845-7-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_133925_125317_9EA00C6B 
X-CRM114-Status: GOOD (  18.65  )
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

Hi Markus,

On Mon, Sep 06, 2021 at 09:35:29PM +0200, Markus Schneider-Pargmann wrote:
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> 
> It supports both functional units on the mt8195, the embedded
> DisplayPort as well as the external DisplayPort units. It offers
> hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> to 4 lanes.
> 
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes RFC -> v1:
>     - Removed unused register definitions.
>     - Replaced workqueue with threaded irq.
>     - Removed connector code.
>     - Move to atomic_* drm functions.
>     - General cleanups of the code.
>     - Remove unused select GENERIC_PHY.
> 
>  drivers/gpu/drm/mediatek/Kconfig      |    6 +
>  drivers/gpu/drm/mediatek/Makefile     |    2 +
>  drivers/gpu/drm/mediatek/mtk_dp.c     | 2881 +++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  580 +++++
>  4 files changed, 3469 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> 


> +
> +static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.attach = mtk_dp_bridge_attach,
> +	.detach = mtk_dp_bridge_detach,
> +	.pre_enable = mtk_dp_bridge_pre_enable,
Use the atomic variant here as pre_enable is deprecated.

> +	.atomic_enable = mtk_dp_bridge_atomic_enable,
> +	.atomic_disable = mtk_dp_bridge_atomic_disable,
> +	.post_disable = mtk_dp_bridge_post_disable,
Use the atomic variant here as .post_disable is deprecated.

> +	.get_edid = mtk_dp_get_edid,
> +	.detect = mtk_dp_bdg_detect,
> +};

Everything else I skimmed looked fine. But it was a quick skim so..

	Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
