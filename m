Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51184C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 05:37:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C13FE60F5E
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 05:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C13FE60F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sm0b0jykctJm/HT9BMpMuDWIwgAd1qXpCk1TcWbFW9E=; b=chj8+DnWj9ZJm1
	wlJW8KTvHdd1gNBcIyTyFJuHazqqrIF9YX8NJcsrok7s7gF3vQgxtcQF6U7PiQUZV2dK3qM1wtGWa
	T7uxe9afj5wVcIbA/Q6G6Zfz7Fy52pQ9A/fVSe/LW8yqc0s2PKj0+jK3Gi0B0wKQIe+MIKN63Y0Ke
	xNAwe0h65CdrT+GVkQce/rPZNjuZbFQkAUGRlN3nwZSK28ZXt32Om/9ze81kTxsx38gDoU8uKr/gC
	Zebfk4BwBASH4alMc9FLRllU3Iv04u69YOhuJse/byvprtVcF/YEMjwpBfVL6Wea6O4PyVXFwwAdw
	dPoFc71GRO9Aa4dfK4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFrmW-001CR2-9I; Tue, 17 Aug 2021 05:37:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFrmQ-001CPy-PL; Tue, 17 Aug 2021 05:36:58 +0000
X-UUID: 2421fb8de49e489d9168e6057a170e34-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=b328J144zpOevt/q/w5Rgs8faNaGXzgEa4YLoCNwF6w=; 
 b=S+xSEupC5vSrgKHhRJrL1U0CDOVhSM0yeVcKUpBVyXq0GY2qSr81HVM6DU3q3XUl/6RvSuAjfM4eSv4y5mJ/VisfFvL0nuMzCSkzhNI/nXENI4b3dtUso+Er2TWhnAzuVfY8DtQ0dmUHAUcjJUYKfRG1zr6ukVOmUPo8jTUhZvQ=;
X-UUID: 2421fb8de49e489d9168e6057a170e34-20210816
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 341603215; Mon, 16 Aug 2021 22:36:48 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 22:36:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 13:36:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 13:36:45 +0800
Message-ID: <1629178605.7579.3.camel@mtksdaap41>
Subject: Re: [RFC PATCH 5/5] drm/mediatek: Add mt8195 DisplayPort driver
From: CK Hu <ck.hu@mediatek.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 17 Aug 2021 13:36:45 +0800
In-Reply-To: <20210816192523.1739365-6-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-6-msp@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_223654_872632_17CE7370 
X-CRM114-Status: GOOD (  19.51  )
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

Hi, Markus:

On Mon, 2021-08-16 at 21:25 +0200, Markus Schneider-Pargmann wrote:
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

[snip]

> +
> +static const struct of_device_id mtk_dp_of_match[] = {
> +	{
> +		.compatible = "mediatek,mt8195-dp_tx",

Where is the binding document of "mediatek,mt8195-dp_tx"?

> +		.data = &mt8195_dp_driver_data,
> +	},
> +	{
> +		.compatible = "mediatek,mt8195-edp_tx",

Where is the binding document of "mediatek,mt8195-edp_tx"?

> +		.data = &mt8195_edp_driver_data,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
> +
> +struct platform_driver mtk_dp_driver = {
> +	.probe = mtk_dp_probe,
> +	.remove = mtk_dp_remove,
> +	.driver = {
> +		.name = "mediatek-drm-dp",
> +		.of_match_table = mtk_dp_of_match,
> +		.pm = &mtk_dp_pm_ops,
> +	},
> +};
> +
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> new file mode 100644
> index 000000000000..83afc79d98ff
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -0,0 +1,3095 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Copyright (c) 2021 BayLibre
> + */
> +#ifndef _MTK_DP_REG_H_
> +#define _MTK_DP_REG_H_
> +
> +#define MTK_DP_SIP_CONTROL_AARCH32 0x82000523
> +# define MTK_DP_SIP_ATF_VIDEO_UNMUTE 0x20
> +# define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE 0x21
> +# define MTK_DP_SIP_ATF_REG_WRITE 0x22
> +# define MTK_DP_SIP_ATF_REG_READ 0x23
> +# define MTK_DP_SIP_ATF_CMD_COUNT 0x24
> +
> +#define TOP_OFFSET		0x2000
> +#define ENC0_OFFSET		0x3000
> +#define ENC1_OFFSET		0x3200
> +#define TRANS_OFFSET		0x3400
> +#define AUX_OFFSET		0x3600
> +#define SEC_OFFSET		0x4000
> +
> +#define MTK_DP_HPD_DISCONNECT	BIT(1)
> +#define MTK_DP_HPD_CONNECT	BIT(2)
> +#define MTK_DP_HPD_INTERRUPT	BIT(3)
> +
> +#define MTK_DP_ENC0_P0_3000              (ENC0_OFFSET + 0x000)
> +# define LANE_NUM_DP_ENC0_P0_MASK                                      0x3
> +# define LANE_NUM_DP_ENC0_P0_SHIFT                                     0
> +# define VIDEO_MUTE_SW_DP_ENC0_P0_MASK                                 0x4
> +# define VIDEO_MUTE_SW_DP_ENC0_P0_SHIFT                                2
> +# define VIDEO_MUTE_SEL_DP_ENC0_P0_MASK                                0x8
> +# define VIDEO_MUTE_SEL_DP_ENC0_P0_SHIFT                               3
> +# define ENHANCED_FRAME_EN_DP_ENC0_P0_MASK                             0x10
> +# define ENHANCED_FRAME_EN_DP_ENC0_P0_SHIFT                            4
> +# define HDCP_FRAME_EN_DP_ENC0_P0_MASK                                 0x20
> +# define HDCP_FRAME_EN_DP_ENC0_P0_SHIFT                                5
> +# define IDP_EN_DP_ENC0_P0_MASK                                        0x40

Remove useless definition.

Regards,
CK.

> +# define IDP_EN_DP_ENC0_P0_SHIFT                                       6
> +# define BS_SYMBOL_CNT_RESET_DP_ENC0_P0_MASK                           0x80
> +# define BS_SYMBOL_CNT_RESET_DP_ENC0_P0_SHIFT                          7
> +# define MIXER_DUMMY_DATA_DP_ENC0_P0_MASK                              0xff00
> +# define MIXER_DUMMY_DATA_DP_ENC0_P0_SHIFT                             8
> +

> +
> +#endif /*_MTK_DP_REG_H_*/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
