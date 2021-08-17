Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD78C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 07:36:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99CB860241
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 07:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99CB860241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sp1DgewHKR9w1VURwCY5t14FX8PJfsnoOAqOa6VZ0eQ=; b=mFzPCzF4KKTBKX
	sxavvRxdSqgYu33gYsi+TD55OKI2357X27L386qPuo4bmbqW3XUbF9z/UTHtwm5Me6AsKxlAormk9
	fQ1vw9uo3NsYg79/aF3R/qHR6l9U7x/BTMOaiG/JvqeRwHBE97R6Q6SyDWWk0GZVZTqF7oam4Q6VA
	L/JG7EsTEghcxKNNkPYxoa1iEt9k91qe2Go2lvtxvCG7aI8+eZraDc5XejwHtcmbGGi7fxN20M7t1
	cY841LCC1ZIV6PuMLeNQTYigJ2DPVlku/3/oILvLtO/5WHO2mxsZcClRiAG+KhG5SYJkdz3P8wVxZ
	lzBWEZ3XL38ENvVLEYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFtdU-001L3b-9D; Tue, 17 Aug 2021 07:35:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFtdE-001L1D-SL
 for linux-mediatek@lists.infradead.org; Tue, 17 Aug 2021 07:35:37 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q6so15651238wrv.6
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Aug 2021 00:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TXvj3Jqmqvj5AogWs4QqfqINOpj0gH3CoW+SyWWNh9M=;
 b=LLywOYYel/1eZkqX8CMyyZG7FGTKJvikarloGCN6dzF25Yzut5wSmAGvudNYJo/SFk
 Nbb33XK4DJG8HQouGg40ULIz/VG/UBzHqvU1ChcL9htQcfk3kuy9ouUKDxPH0XD/vYO3
 VgEIYxQCjb/Nn1uJHYstLnnpS5rePtbjXH/ccTXz1f6MsXcERyzXcL9Jl3P1czzSqOoD
 XKVTWzorM0mIxIg9eRr4EIxPMtN/ciCxP/SskVNzm/My0bXCg/oILWNu6wQbsT1Ywhj/
 eYupQANLXSR1qjXVSfA/6knAWGDGJrjgX4Jqf/YOH5xzc7VyfKDJbYfOHXhSrGrhsrew
 2n1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TXvj3Jqmqvj5AogWs4QqfqINOpj0gH3CoW+SyWWNh9M=;
 b=KrEF8JUul7Hv9ZC8wP9dDkhN18gOS8mM3e2g9Qa/yn+7rvBZ2l6Uhpnfmmc3r0LVYy
 HDOX/TVtHCl99yiSm/3h6E7Gfjkig1o5rDwukSnA5oGHGzVr+0Ssw4oci27qNdy/f1Yg
 Tr1OV8x6/PNM9F80SJwvLEoMrxk+SpBnMkRoGmevGxaZ2zQscJl/gvW79E1LlR+Ltybi
 I7GzRDjHHiBKdDw9xbZq5smMdlIxk/aeInRbqLIV7EmQLeyoGCiDky5YCem6iIZtCVO1
 7BmmQ9xdg5spQrOo0lzKuHZk2o8HQ7lPuXOxz6061UicG9s/+yvQ0jZ7inOUul8UfoWL
 zyMQ==
X-Gm-Message-State: AOAM5312b6LkC+iCEcQUhHumWvJUzGGsKCHKXAruqSD4QdMn00ACPZZH
 QfLfmo34coDkn2ZrsBJvYQ8BQg==
X-Google-Smtp-Source: ABdhPJwn6K1cETtZ0I/mA9qEnPbAB72QYtgySQju7g6XMDoCexjSx6mxPKzEu1fSylRmp24kr4X2bQ==
X-Received: by 2002:a5d:510b:: with SMTP id s11mr2373572wrt.63.1629185731019; 
 Tue, 17 Aug 2021 00:35:31 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w9sm1108777wmc.19.2021.08.17.00.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:35:30 -0700 (PDT)
Date: Tue, 17 Aug 2021 09:35:30 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 5/5] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20210817073530.uocllhlkyg767uok@blmsp>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-6-msp@baylibre.com>
 <1629178605.7579.3.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1629178605.7579.3.camel@mtksdaap41>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_003532_949415_DE312BE3 
X-CRM114-Status: GOOD (  25.08  )
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

Hi,

On Tue, Aug 17, 2021 at 01:36:45PM +0800, CK Hu wrote:
> Hi, Markus:
> 
> On Mon, 2021-08-16 at 21:25 +0200, Markus Schneider-Pargmann wrote:
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
> 
> [snip]
> 
> > +
> > +static const struct of_device_id mtk_dp_of_match[] = {
> > +	{
> > +		.compatible = "mediatek,mt8195-dp_tx",
> 
> Where is the binding document of "mediatek,mt8195-dp_tx"?
> 
> > +		.data = &mt8195_dp_driver_data,
> > +	},
> > +	{
> > +		.compatible = "mediatek,mt8195-edp_tx",
> 
> Where is the binding document of "mediatek,mt8195-edp_tx"?

I didn't include the bindings in this RFC, but will include them in the
next version.

> 
> > +		.data = &mt8195_edp_driver_data,
> > +	},
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
> > +
> > +struct platform_driver mtk_dp_driver = {
> > +	.probe = mtk_dp_probe,
> > +	.remove = mtk_dp_remove,
> > +	.driver = {
> > +		.name = "mediatek-drm-dp",
> > +		.of_match_table = mtk_dp_of_match,
> > +		.pm = &mtk_dp_pm_ops,
> > +	},
> > +};
> > +
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> > new file mode 100644
> > index 000000000000..83afc79d98ff
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> > @@ -0,0 +1,3095 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2019 MediaTek Inc.
> > + * Copyright (c) 2021 BayLibre
> > + */
> > +#ifndef _MTK_DP_REG_H_
> > +#define _MTK_DP_REG_H_
> > +
> > +#define MTK_DP_SIP_CONTROL_AARCH32 0x82000523
> > +# define MTK_DP_SIP_ATF_VIDEO_UNMUTE 0x20
> > +# define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE 0x21
> > +# define MTK_DP_SIP_ATF_REG_WRITE 0x22
> > +# define MTK_DP_SIP_ATF_REG_READ 0x23
> > +# define MTK_DP_SIP_ATF_CMD_COUNT 0x24
> > +
> > +#define TOP_OFFSET		0x2000
> > +#define ENC0_OFFSET		0x3000
> > +#define ENC1_OFFSET		0x3200
> > +#define TRANS_OFFSET		0x3400
> > +#define AUX_OFFSET		0x3600
> > +#define SEC_OFFSET		0x4000
> > +
> > +#define MTK_DP_HPD_DISCONNECT	BIT(1)
> > +#define MTK_DP_HPD_CONNECT	BIT(2)
> > +#define MTK_DP_HPD_INTERRUPT	BIT(3)
> > +
> > +#define MTK_DP_ENC0_P0_3000              (ENC0_OFFSET + 0x000)
> > +# define LANE_NUM_DP_ENC0_P0_MASK                                      0x3
> > +# define LANE_NUM_DP_ENC0_P0_SHIFT                                     0
> > +# define VIDEO_MUTE_SW_DP_ENC0_P0_MASK                                 0x4
> > +# define VIDEO_MUTE_SW_DP_ENC0_P0_SHIFT                                2
> > +# define VIDEO_MUTE_SEL_DP_ENC0_P0_MASK                                0x8
> > +# define VIDEO_MUTE_SEL_DP_ENC0_P0_SHIFT                               3
> > +# define ENHANCED_FRAME_EN_DP_ENC0_P0_MASK                             0x10
> > +# define ENHANCED_FRAME_EN_DP_ENC0_P0_SHIFT                            4
> > +# define HDCP_FRAME_EN_DP_ENC0_P0_MASK                                 0x20
> > +# define HDCP_FRAME_EN_DP_ENC0_P0_SHIFT                                5
> > +# define IDP_EN_DP_ENC0_P0_MASK                                        0x40
> 
> Remove useless definition.

Ok, will do. Thanks for the feedback.

Best,
Markus

> 
> Regards,
> CK.
> 
> > +# define IDP_EN_DP_ENC0_P0_SHIFT                                       6
> > +# define BS_SYMBOL_CNT_RESET_DP_ENC0_P0_MASK                           0x80
> > +# define BS_SYMBOL_CNT_RESET_DP_ENC0_P0_SHIFT                          7
> > +# define MIXER_DUMMY_DATA_DP_ENC0_P0_MASK                              0xff00
> > +# define MIXER_DUMMY_DATA_DP_ENC0_P0_SHIFT                             8
> > +
> 
> > +
> > +#endif /*_MTK_DP_REG_H_*/
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
