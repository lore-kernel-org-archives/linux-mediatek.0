Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF21C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 08:48:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FAC4610FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 08:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FAC4610FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jAbk7IgPesEAcFfM0DVa78Ao7lzuGsJvQnKs9wUv2tI=; b=HsqJhu6tjXxbIa
	Vl4WLf5fdPcVR+XvbDyuHw5wHv5Apy5cn0gvLuBdALxP1dkZs93Lmuqd9mLO8/2gFi6fu7Lzgv65S
	Taxn5SbZBaH0aREFVInlXwCJRXYmo3Is3jvPBbcgiqD9/ZkbTrph1AY9C4hXENjMT4wbSAU5EKMhJ
	tYWhrBE5mZ/2dqBvbqvtKIIAynXsPR7EwwCGD0iAnPHyS4tkmEbJ1PTpw1WSDAqwg6WgROhb3yjlo
	/awoDpq70nSVahoAi6t+fzazum9NuvGQsn9f3rnUdPWRCVTz77S1jOtk9bSiuQ6s936IAcjcnumDJ
	fo+rKuX+0gnBVFrhVOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNWlj-002vpt-Sl; Tue, 07 Sep 2021 08:47:51 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNWlg-002vn7-Gp
 for linux-mediatek@lists.infradead.org; Tue, 07 Sep 2021 08:47:50 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mNWla-00021I-Tr; Tue, 07 Sep 2021 10:47:42 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mNWlZ-0006Tc-Ea; Tue, 07 Sep 2021 10:47:41 +0200
Message-ID: <116f1a0283f43f97fdcfc4949e8b3c9cccc08d34.camel@pengutronix.de>
Subject: Re: [PATCH v1 6/6] drm/mediatek: Add mt8195 DisplayPort driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Markus Schneider-Pargmann <msp@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 07 Sep 2021 10:47:41 +0200
In-Reply-To: <20210906193529.718845-7-msp@baylibre.com>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-7-msp@baylibre.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_014748_603006_F1C91844 
X-CRM114-Status: GOOD (  24.69  )
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

On Mon, 2021-09-06 at 21:35 +0200, Markus Schneider-Pargmann wrote:
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
[...]
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> new file mode 100644
> index 000000000000..1bd07c8d2f69
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -0,0 +1,2881 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Copyright (c) 2021 BayLibre
> + */
> +
[...]
> +#include <linux/component.h>
[...]
> +#include <linux/extcon.h>
> +#include <linux/extcon-provider.h>
[...]
> +#include <linux/kthread.h>
> +#include <linux/mfd/syscon.h>
[...]
> +#include <linux/of_gpio.h>
> +#include <linux/of_graph.h>
[...]
> +#include <linux/phy/phy.h>

The list of included headers could be pruned a bit, from a quick look it
seems like neither of these are actually used.

[...]
> +static void mtk_dp_ssc_enable(struct mtk_dp *mtk_dp, bool enable)
> +{
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE, DP_PWR_STATE_BANDGAP,
> +			   DP_PWR_STATE_MASK);
> +	mtk_dp_update_bits(mtk_dp, DP_PHY_DIG_PLL_CTL_1,
> +			   enable ? TPLL_SSC_EN : 0, TPLL_SSC_EN);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +			   DP_PWR_STATE_BANDGAP_TPLL_LANE, DP_PWR_STATE_MASK);
> +
> +	udelay(50);

Can usleep_range() be used here? Same for the other delays.

[...]
> +static void mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
> +{
[...]
> +
> +	if (DP_GET_SINK_COUNT(sink_count) &&
> +	    (link_status[2] & DP_DOWNSTREAM_PORT_STATUS_CHANGED)) {
> +		mtk_dp->train_info.check_cap_count = 0;
> +		kfree(mtk_dp->edid);
> +		mtk_dp->edid = NULL;

Should this be protect by a lock? This looks like it could race with the
access in mtk_dp_edid_parse_audio_capabilities() or mtk_dp_get_edid()

[...]
> +static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)
> +{
> +	int ret = 0;
> +
> +	ret = mtk_dp_train_hpd_handle(mtk_dp);
> +
> +	if (!mtk_dp->train_info.cable_plugged_in)
> +		return -ENODEV;
> +
> +	if (mtk_dp->train_state == MTK_DP_TRAIN_STATE_NORMAL)
> +		return ret;
> +
> +	switch (mtk_dp->train_state) {
[...]
> +	case MTK_DP_TRAIN_STATE_TRAINING:
> +		ret = mtk_dp_train_start(mtk_dp);
> +		if (!ret) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +			mtk_dp_audio_mute(mtk_dp, true);
> +			mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKTIMING;
> +			mtk_dp_fec_enable(mtk_dp, mtk_dp->has_fec);
> +		}  else if (ret != -EAGAIN)
> +			mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;

A small whitespace issue and missing braces.

Consider running this through checkpatch.pl --strict once for style
issues.

[...]
> +static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
> +{
> +	struct mtk_dp *mtk_dp = dev;
> +	uint32_t irq_status;
> +
> +	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
> +
> +	if (!irq_status)
> +		return IRQ_HANDLED;

This check seems superfluous given that only the
RGS_IRQ_STATUS_TRANSMITTER bit is checked right below:

> +	if (irq_status & RGS_IRQ_STATUS_TRANSMITTER)
> +		return mtk_dp_hpd_isr_handler(mtk_dp);
> +
> +	return IRQ_HANDLED;
> +}
[...]
> +static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
> +				    struct drm_connector *connector)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	bool pre_enabled = mtk_dp->pre_enabled;
> +
> +	if (mtk_dp->edid)
> +		kfree(mtk_dp->edid);

Unnecessary check, kfree() accepts NULL.

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
