Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8A4C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 21:36:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9899160EE4
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 21:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9899160EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TISjdyeBe+hXVhH6domCAO9LE5Wq2+C1To6VqU01fEI=; b=ysqXY/Ri/KiuYt
	WwWueQtwGp+j/2UVMnhW22Ne56ZaMRC47536ZxnD4IjRyY7vQTRWMV9xPq/rMAuIqrYsGF6RquY4o
	7Jgz5fmHLw6c20WBHyEC5LSxFyIS11vBlCPEVp+DxdQFpDLcM8egGVevbN4Ya0RRNaKUJZAhLLi3U
	E6EgxfeUADl6TVsXGYY5lcbCSn3Iko7ow4TASbxwE9LdcFprMDwQDJoeL1lqiEFmNdWaIpYGNSkVQ
	G2vZ0gJF/ZCem5hOwEnK0wppbanZlDKHojy278A7saDHZ5BpFk2KgCdVT4WMrn5BmPfBlM2tKtCJe
	dgqWjQopU/FHIFOkcVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFkHU-000OuY-62; Mon, 16 Aug 2021 21:36:28 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFkHQ-000Oqp-JR
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 21:36:26 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id f63889c8-fed9-11eb-b37b-0050568c148b;
 Mon, 16 Aug 2021 21:36:05 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 96A23194B06;
 Mon, 16 Aug 2021 23:36:24 +0200 (CEST)
Date: Mon, 16 Aug 2021 23:36:13 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 5/5] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <YRraTWcY4yVuJANQ@ravnborg.org>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-6-msp@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816192523.1739365-6-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_143624_826095_3B74E89B 
X-CRM114-Status: GOOD (  19.45  )
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

A few general things in the following. This is what I look for first in
a bridge driver - and I had no time today to review the driver in full.
Please address these, then cc: me on next revision where I hopefully
have more time.

	Sam

> +static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
> +                               enum drm_bridge_attach_flags flags)
> +{
> +       struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +       int ret;
> +
> +       mtk_dp_poweron(mtk_dp);
> +
> +       if (mtk_dp->next_bridge) {
> +               ret = drm_bridge_attach(bridge->encoder, mtk_dp->next_bridge,
> +                                       &mtk_dp->bridge, flags);
> +               if (ret) {
> +                       drm_warn(mtk_dp->drm_dev,
> +                                "Failed to attach external bridge: %d\n", ret);
> +                       return ret;
> +               }
> +       }
> +
> +       if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +               drm_err(mtk_dp->drm_dev,
> +                       "Fix bridge driver to make connector optional!");
> +               return 0;
> +       }

This driver is only used by mediatek, and I thought all of mediatek is
converted so the display driver creates the connector.

It would be better to migrate mediatek over to always let the display
driver create the connector and drop the connector support in this
driver.


> + struct drm_bridge_funcs mtk_dp_bridge_funcs = {
> +	.attach = mtk_dp_bridge_attach,
> +	.mode_fixup = mtk_dp_bridge_mode_fixup,
> +	.disable = mtk_dp_bridge_disable,
> +	.post_disable = mtk_dp_bridge_post_disable,
> +	.mode_set = mtk_dp_bridge_mode_set,
> +	.pre_enable = mtk_dp_bridge_pre_enable,
> +	.enable = mtk_dp_bridge_enable,
> +	.get_edid = mtk_get_edid,
> +	.detect = mtk_dp_bdg_detect,
> +};


For new drivers please avoid the recently deprecated functions.

- Use the atomic versions of pre_enable, enable, disable and post_disable.

- Merge mode_set with atomic_enable - as there is no need for the mode_Set
  operation.

- Use atomic_check in favour of mode_fixup, albeit the rules for
  atomic_check is at best vauge at the moment.
 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
