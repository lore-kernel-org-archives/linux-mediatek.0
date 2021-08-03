Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5BEC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 02:36:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D883060C3E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 02:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D883060C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7shmLqCMOCQNkgbA+Eh76Aj28nNVAweqfd5wbNXNiw=; b=NuSf0wJ5SYPdxW
	loCUNEdDTTKAulTOi/8NoM/MU0SkSfzPGRzJjAssXT7efkVMpc6J/wByE5WlLxArg6Hk3naWcyBS0
	TUphb6lpi8hqsGR95nP/FMMOxiTJRb9k/FrXJlk3v2swsx3VQyaIYMKbQmegwBMU5Wm7jSpzencQl
	RAp9mvpvysCu4MvyusXLuGSiWFaVIrgJQksZ32S462orJ6NwTHgGfXVv1CxoFZTbrt3bGsXrpdRJw
	sBjkaWXINJ2im8I/El15Xr2GNmEw7iUDnYK/4WeH10ZQ9IJKXDfzcUizhQBBVWhxRwjExKTzdfEao
	zy/6M9urAj7AjUt58K5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAkIK-000qfS-DB; Tue, 03 Aug 2021 02:36:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAkI6-000qe7-6i; Tue, 03 Aug 2021 02:36:28 +0000
X-UUID: 9ea6ef0cff924681b1353bbb52a6d86a-20210802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oV66aZRPEsJSd+h6OwKAHG4maKZE6GeAU+V1m1vbp2g=; 
 b=nErs/UO5iXtqK7BYQ56F+pe7M6kQZvxBNvM1ZXV+IM8M97gEQCJWOnxom/6pk1A3hOnUZ91jKiaRR+7x5f7Qt9flVmfkfwJDZJ6qIulViIa6Mw9DPb32zbsrTvJXw+F3QBohbughp+5bK1nLoqvXZgufxwsTnwxo4DZ39T7BcSk=;
X-UUID: 9ea6ef0cff924681b1353bbb52a6d86a-20210802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 637668434; Mon, 02 Aug 2021 19:36:24 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Aug 2021 19:30:31 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 10:30:30 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Aug 2021 10:30:30 +0800
Message-ID: <32065fff2e122e44f4896e29e9fdeaa2137ad90c.camel@mediatek.com>
Subject: Re: [PATCH v5 2/6] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Date: Tue, 3 Aug 2021 10:30:30 +0800
In-Reply-To: <51476e76-467c-6ade-69ba-09d861bee029@collabora.com>
References: <20210729170737.21424-1-jason-jh.lin@mediatek.com>
 <20210729170737.21424-3-jason-jh.lin@mediatek.com>
 <51476e76-467c-6ade-69ba-09d861bee029@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_193626_293228_5171355E 
X-CRM114-Status: GOOD (  33.64  )
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

Hi Enric,

On Fri, 2021-07-30 at 13:41 +0200, Enric Balletbo i Serra wrote:
> Hi Jason,
> 
> Thank you for your patch.
> 
> On 29/7/21 19:07, jason-jh.lin wrote:
> > Add mt8195 vdosys0 clock driver name and routing table to
> > the driver data of mtk-mmsys.
> > 
> 
> This patch is the one that is really introducing mt8195 mmsys
> support. It is a
> bit confusing sent the binding on another patchset. Please include
> [1] in this
> patchset so it's clear.
> 
> [1]
> 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210722092624.14401-2-jason-jh.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!3MaHl_gSJTB1nJ3RMsmAf7oLpKF8I3nDGIgkcVBlZ_LjV8Z0g88U5giQCAXRidxVujDS$
>  
Ok, I'll add this.
> 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> > This patch is base on [1]
> > 
> > [1]add mt8195 SoC DRM binding
> > - 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=519597__;!!CTRNKA9wMg0ARbw!3MaHl_gSJTB1nJ3RMsmAf7oLpKF8I3nDGIgkcVBlZ_LjV8Z0g88U5giQCAXRiX1vDsmL$
> >  
> > ---
> >  drivers/soc/mediatek/mt8195-mmsys.h    | 96
> > ++++++++++++++++++++++++++
> >  drivers/soc/mediatek/mtk-mmsys.c       | 11 +++
> >  include/linux/soc/mediatek/mtk-mmsys.h |  9 +++
> >  3 files changed, 116 insertions(+)
> >  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > new file mode 100644
> > index 000000000000..9339a786ec5d
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > @@ -0,0 +1,96 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
> > +#define __SOC_MEDIATEK_MT8195_MMSYS_H
> > +
> > +#define MT8195_VDO0_OVL_MOUT_EN					
> > 0xf14
> > +#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0			
> > BIT(0)
> > +#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0			
> > BIT(1)
> > +#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1			BIT(2)
> > +#define MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1			
> > BIT(4)
> > +#define MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1			
> > BIT(5)
> > +#define MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0			BIT(6)
> > +
> > +#define MT8195_VDO0_SEL_IN					0xf34
> > +#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT		(0 <<
> > 0)
> > +#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1		(1 <<
> > 0)
> > +#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0		(2 <<
> > 0)
> > +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0		
> > (0 << 4)
> > +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE		(1 <<
> > 4)
> > +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1		
> > (0 << 5)
> > +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE		(1 <<
> > 5)
> > +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE		(0 <<
> > 8)
> > +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT		
> > (1 << 8)
> > +#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT		
> > (0 << 9)
> > +#define MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT		(0 <<
> > 12)
> > +#define MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE			
> > (1 << 12)
> > +#define MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0		(2 <<
> > 12)
> > +#define MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT			
> > (0 << 16)
> > +#define MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0			
> > (1 << 16)
> > +#define MT8195_SEL_IN_DSI1_FROM_DSC_WRAP1_OUT			
> > (0 << 17)
> > +#define MT8195_SEL_IN_DSI1_FROM_VPP_MERGE			(1 <<
> > 17)
> > +#define MT8195_SEL_IN_DISP_WDMA1_FROM_DISP_OVL1			
> > (0 << 20)
> > +#define MT8195_SEL_IN_DISP_WDMA1_FROM_VPP_MERGE			
> > (1 << 20)
> > +#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN		
> > (0 << 21)
> > +#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1		
> > (1 << 21)
> > +#define MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0			
> > (0 << 22)
> > +#define MT8195_SEL_IN_DISP_WDMA0_FROM_VPP_MERGE			
> > (1 << 22)
> > +
> > +#define MT8195_VDO0_SEL_OUT					
> > 0xf38
> > +#define MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN		(0 <<
> > 0)
> > +#define MT8195_SOUT_DISP_DITHER0_TO_DSI0			(1 <<
> > 0)
> > +#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN		(0 <<
> > 1)
> > +#define MT8195_SOUT_DISP_DITHER1_TO_VPP_MERGE			
> > (1 << 1)
> > +#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT		(2 <<
> > 1)
> > +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE			
> > (0 << 4)
> > +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_DP_INTF0			
> > (1 << 4)
> > +#define MT8195_SOUT_VPP_MERGE_TO_DSI1				
> > (0 << 8)
> > +#define MT8195_SOUT_VPP_MERGE_TO_DP_INTF0			(1 <<
> > 8)
> > +#define MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0			
> > (2 << 8)
> > +#define MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA1			
> > (3 << 8)
> > +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN			
> > (4 << 8)
> > +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN			
> > (0 << 11)
> > +#define MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA0			
> > (1 << 11)
> > +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0			(0 <<
> > 12)
> > +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0		(1 <<
> > 12)
> > +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE			
> > (2 << 12)
> > +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DSI1			(0 <<
> > 16)
> > +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DP_INTF0			
> > (1 << 16)
> > +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 <<
> > 16)
> > +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			
> > (3 << 16)
> > +
> > +static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[]
> > = {
> 
> If I understood correctly, in previous discussion you said that there
> will be
> two routing tables, one that is supposed to be for vdosys0 and
> another one
> vdosys1. The name here is too generic in my opinion, let's use a more
> specific
> name thinking in the future.
> 

we use one routing table for both vdosys0 and vdosys1 because they have
different component list. we can recognize those register configuration
are for vdosys0 and vdosys1 in the same routting table.

Regards,
Jason-JH.Lin
> 
> > +	{
> > +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> > +		MT8195_VDO0_OVL_MOUT_EN,
> > MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0
> > +	}, {
> > +		DDP_COMPONENT_OVL1, DDP_COMPONENT_RDMA1,
> > +		MT8195_VDO0_OVL_MOUT_EN,
> > MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1
> > +	}, {
> > +		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> > +		MT8195_VDO0_SEL_IN,
> > MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
> > +	}, {
> > +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> > +		MT8195_VDO0_SEL_IN,
> > MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
> > +	}, {
> > +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> > +		MT8195_VDO0_SEL_IN,
> > MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
> > +	}, {
> > +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> > +		MT8195_VDO0_SEL_IN,
> > MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0
> > +	}, {
> > +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> > +		MT8195_VDO0_SEL_OUT,
> > MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN
> > +	}, {
> > +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> > +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_DSI0
> > +	}, {
> > +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> > +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0
> > +	}, {
> > +		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> > +		MT8195_VDO0_SEL_OUT,
> > MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
> > +	}
> > +};
> > +
> > +#endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 080660ef11bf..1fb241750897 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -13,6 +13,7 @@
> >  #include "mtk-mmsys.h"
> >  #include "mt8167-mmsys.h"
> >  #include "mt8183-mmsys.h"
> > +#include "mt8195-mmsys.h"
> >  
> >  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data
> > = {
> >  	.clk_driver = "clk-mt2701-mm",
> > @@ -52,6 +53,12 @@ static const struct mtk_mmsys_driver_data
> > mt8183_mmsys_driver_data = {
> >  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> >  };
> >  
> > +static const struct mtk_mmsys_driver_data
> > mt8195_vdosys0_driver_data = {
> > +	.clk_driver = "clk-mt8195-vdo0",
> > +	.routes = mmsys_mt8195_routing_table,
> > +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> > +};
> > +
> >  struct mtk_mmsys {
> >  	void __iomem *regs;
> >  	const struct mtk_mmsys_driver_data *data;
> > @@ -157,6 +164,10 @@ static const struct of_device_id
> > of_match_mtk_mmsys[] = {
> >  		.compatible = "mediatek,mt8183-mmsys",
> >  		.data = &mt8183_mmsys_driver_data,
> >  	},
> > +	{
> > +		.compatible = "mediatek,mt8195-vdosys0",
> > +		.data = &mt8195_vdosys0_driver_data,
> > +	},
> >  	{ }
> >  };
> >  
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index 2228bf6133da..01bedfb08094 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -39,6 +39,15 @@ enum mtk_ddp_comp_id {
> >  	DDP_COMPONENT_UFOE,
> >  	DDP_COMPONENT_WDMA0,
> >  	DDP_COMPONENT_WDMA1,
> > +	DDP_COMPONENT_MERGE0,
> > +	DDP_COMPONENT_MERGE1,
> > +	DDP_COMPONENT_MERGE2,
> > +	DDP_COMPONENT_MERGE3,
> > +	DDP_COMPONENT_MERGE4,
> > +	DDP_COMPONENT_MERGE5,
> > +	DDP_COMPONENT_DSC0,
> > +	DDP_COMPONENT_DSC1,
> > +	DDP_COMPONENT_DP_INTF0,
> >  	DDP_COMPONENT_ID_MAX,
> >  };
> >  
> > 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
