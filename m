Return-Path: <SRS0=kQJD=N7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF90AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 09:16:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A40CA610E9
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 09:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A40CA610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8M+Pf4Ee50W24fWX819ob4sybIeqjGpI6JGR7dJzwc=; b=Pe0enk062Kzhha
	8dBS542kIFreJ5rgMk0uxduHH65kwXdBqbYFAixsJpLkadLBVY3hgz1RwgYtUYAN1s2GBFlghAszK
	JP8JVC4nhU8W/F1CII16EOYgk00HA+GC8F7evDVrpL3qlFPUeZsUuMxLj4lcLaYwOYVz0LDs5g1UW
	ADOKtfvN7TvFsEsDimfwsSk5BVPN9DJnuygv7vNzMKCcqHh/lte+KfqGo0NL+SnfH9s0t7C7l4Ft5
	D7lz2+FNOOQouomo5CIDq56xCN7n11Tqay4YAZHTuIfMOD1x04mmu24hcgMwVEl3rMawj/F2G3PAn
	XyjrQUo+7u5ZEkXS9qIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOGAU-008kvN-VW; Thu, 09 Sep 2021 09:16:26 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOGAP-008ksH-Py
 for linux-mediatek@lists.infradead.org; Thu, 09 Sep 2021 09:16:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id v10so1522938wrd.4
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Sep 2021 02:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=76Aq48DInSz3hLbeQBFG/znoEWJkoD94GNnnZAOAYKQ=;
 b=ww/dAfoWzC3IOn8uDg+3ZxxfTdOyupMrlZpCxSR0GLZIJE9jShlU6n95PFiLL129tJ
 HdmRFEaFTQGsT2bdwWcePBsKYuQs9oIYtnSXh7wkA/xL/tveskXVQECV07xIqBY1kIgQ
 NA3Yba2k+h9ISzRFvsJDg5mIUdfuNsxBm790gSFvigBgBFEqa6Oo7so7aBOQVLWvk63l
 dnY4jBZHKID8PQomuJ5uNefz0YBpyEhfR9P+b9GctmL8Vt5YAwFOLzkQ4HqIGTyIeXhv
 ItbzzUkHs+IY7DID7Lx2DyyAeHFAEOaZlE+C4schySGRI3OVxjq22JWDPwoHQeNBPCzI
 DCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=76Aq48DInSz3hLbeQBFG/znoEWJkoD94GNnnZAOAYKQ=;
 b=FdtMuxuziTaOAL4Y6VVu1SrxCuByUS2SfxLHKpWeNmCIJ719XpO/t0Eqrx+GyyXZhk
 NjAGyo2Zj95BRVXFaJvqbH77EkhIQhxVbo3CdU9ZnnNF/XF6fyYdf4TkMzGzs1xS2WFn
 V2pJPB/3JFm/8rdZWZxHAQkpuozaett1hUy/izJy13c+gyB08gCgmyEUzHLZP6jbyNo7
 KuUfc7HFfvx3VeU7wXTHiND5yA5kqRolG1riSe+3hC3R9yXNVXTOeZIc6dJUZLn04dwh
 JT7bhTP7LtpxLdPwVELw5pNVPusSke6264crPRv7csJ9ToWyKvNrVHXV/ByVYMHkuk3r
 cQXw==
X-Gm-Message-State: AOAM530OTqeL7W0YX83Nx3s6QmVRODxTRnDJIEGenmXJamF8Xzz0u5vQ
 F1F3Ls/3OfSe0JPjWAb7XKzUMQ==
X-Google-Smtp-Source: ABdhPJyfuL7O7Hn46zJJoQrhXaeRKXVtbc1XEBYy8jSPKxQhHKvi2gHG2Eb7LWa4ZQAAzoMOIFX20w==
X-Received: by 2002:adf:de09:: with SMTP id b9mr2308332wrm.114.1631178979247; 
 Thu, 09 Sep 2021 02:16:19 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id t7sm1275425wrq.90.2021.09.09.02.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 02:16:18 -0700 (PDT)
Date: Thu, 9 Sep 2021 11:16:17 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 6/6] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20210909091617.bmes2vrxpinixgc4@blmsp>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-7-msp@baylibre.com>
 <116f1a0283f43f97fdcfc4949e8b3c9cccc08d34.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <116f1a0283f43f97fdcfc4949e8b3c9cccc08d34.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_021622_000423_2A8FFF1C 
X-CRM114-Status: GOOD (  36.08  )
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

Hi Philipp,

On Tue, Sep 07, 2021 at 10:47:41AM +0200, Philipp Zabel wrote:
> Hi Markus,
> 
> On Mon, 2021-09-06 at 21:35 +0200, Markus Schneider-Pargmann wrote:
> > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> > 
> > It supports both functional units on the mt8195, the embedded
> > DisplayPort as well as the external DisplayPort units. It offers
> > hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> > to 4 lanes.
> > 
> > This driver is based on an initial version by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> [...]
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> > new file mode 100644
> > index 000000000000..1bd07c8d2f69
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> > @@ -0,0 +1,2881 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2019 MediaTek Inc.
> > + * Copyright (c) 2021 BayLibre
> > + */
> > +
> [...]
> > +#include <linux/component.h>
> [...]
> > +#include <linux/extcon.h>
> > +#include <linux/extcon-provider.h>
> [...]
> > +#include <linux/kthread.h>
> > +#include <linux/mfd/syscon.h>
> [...]
> > +#include <linux/of_gpio.h>
> > +#include <linux/of_graph.h>
> [...]
> > +#include <linux/phy/phy.h>
> 
> The list of included headers could be pruned a bit, from a quick look it
> seems like neither of these are actually used.

Thank you. I fixed the includes for the next version.

> 
> [...]
> > +static void mtk_dp_ssc_enable(struct mtk_dp *mtk_dp, bool enable)
> > +{
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE, DP_PWR_STATE_BANDGAP,
> > +			   DP_PWR_STATE_MASK);
> > +	mtk_dp_update_bits(mtk_dp, DP_PHY_DIG_PLL_CTL_1,
> > +			   enable ? TPLL_SSC_EN : 0, TPLL_SSC_EN);
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > +			   DP_PWR_STATE_BANDGAP_TPLL_LANE, DP_PWR_STATE_MASK);
> > +
> > +	udelay(50);
> 
> Can usleep_range() be used here? Same for the other delays.

Yes, thanks, I replaced it here and everywhere else.

> 
> [...]
> > +static void mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
> > +{
> [...]
> > +
> > +	if (DP_GET_SINK_COUNT(sink_count) &&
> > +	    (link_status[2] & DP_DOWNSTREAM_PORT_STATUS_CHANGED)) {
> > +		mtk_dp->train_info.check_cap_count = 0;
> > +		kfree(mtk_dp->edid);
> > +		mtk_dp->edid = NULL;
> 
> Should this be protect by a lock? This looks like it could race with the
> access in mtk_dp_edid_parse_audio_capabilities() or mtk_dp_get_edid()

Completely right, I guarded all edid accesses with a mutex now. Thanks.

> 
> [...]
> > +static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)
> > +{
> > +	int ret = 0;
> > +
> > +	ret = mtk_dp_train_hpd_handle(mtk_dp);
> > +
> > +	if (!mtk_dp->train_info.cable_plugged_in)
> > +		return -ENODEV;
> > +
> > +	if (mtk_dp->train_state == MTK_DP_TRAIN_STATE_NORMAL)
> > +		return ret;
> > +
> > +	switch (mtk_dp->train_state) {
> [...]
> > +	case MTK_DP_TRAIN_STATE_TRAINING:
> > +		ret = mtk_dp_train_start(mtk_dp);
> > +		if (!ret) {
> > +			mtk_dp_video_mute(mtk_dp, true);
> > +			mtk_dp_audio_mute(mtk_dp, true);
> > +			mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKTIMING;
> > +			mtk_dp_fec_enable(mtk_dp, mtk_dp->has_fec);
> > +		}  else if (ret != -EAGAIN)
> > +			mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;
> 
> A small whitespace issue and missing braces.

Thanks for spotting, fixed.

> 
> Consider running this through checkpatch.pl --strict once for style
> issues.

Thanks for the tip, I didn't know about --strict. I now added it to my
editor tooling. Interesting thing: It picked up the missing braces as
well as all the udelays, but not the extra space before else.

> 
> [...]
> > +static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
> > +{
> > +	struct mtk_dp *mtk_dp = dev;
> > +	uint32_t irq_status;
> > +
> > +	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
> > +
> > +	if (!irq_status)
> > +		return IRQ_HANDLED;
> 
> This check seems superfluous given that only the
> RGS_IRQ_STATUS_TRANSMITTER bit is checked right below:

Thanks, I removed it.

> 
> > +	if (irq_status & RGS_IRQ_STATUS_TRANSMITTER)
> > +		return mtk_dp_hpd_isr_handler(mtk_dp);
> > +
> > +	return IRQ_HANDLED;
> > +}
> [...]
> > +static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
> > +				    struct drm_connector *connector)
> > +{
> > +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> > +	bool pre_enabled = mtk_dp->pre_enabled;
> > +
> > +	if (mtk_dp->edid)
> > +		kfree(mtk_dp->edid);
> 
> Unnecessary check, kfree() accepts NULL.

Fixed.

Thank you Philipp for the review.

Best,
Markus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
