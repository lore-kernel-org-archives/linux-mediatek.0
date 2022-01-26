Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C553C28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 04:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcYRxYQomW5CUCfAj6FidhWRN0LPgaKXNuCjSBdvdGI=; b=nA4+bupJCeW+xl
	GVQvqe6mlcbdB6xQWVVdmOuUzMYZWsV4sZfXO/qnFk5dpwvM6mqaPiiQXyLMIXSDy9uDqreMZUkeS
	R7edzpXIAevW7gADGROslU0V3ABLQcZ48Wq5ZB7VVxyNgUy4ZEFLOLJktjiyHD4a2U0pUVMvOITaI
	7U46KbS1P5hesmT9jYLSBbPtTnszqsJ9uX6vJmWGT0DvaZt+Djki2fNqMS5p+3oWI/Kt+wV1vuuIM
	WGOoAFARG/FklmTGQpSqjoPESt5OZIrdPeJljawWTaLSPtWlmLNkn3SlIwanX28V7k/286U23ixeP
	a8WEDDmrxCn6p/SdsvFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCZlQ-00A6xJ-2L; Wed, 26 Jan 2022 04:18:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCZlC-00A6ug-5i; Wed, 26 Jan 2022 04:18:21 +0000
X-UUID: 9735d00f043642dfb177131ceaa5af76-20220125
X-UUID: 9735d00f043642dfb177131ceaa5af76-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1423282266; Tue, 25 Jan 2022 21:18:13 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 20:18:11 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 12:18:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Jan 2022 12:18:09 +0800
Message-ID: <54aa0b9c88cf421eb382def79f3e06ef93d33c02.camel@mediatek.com>
Subject: Re: [PATCH v14 08/12] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 26 Jan 2022 12:18:09 +0800
In-Reply-To: <72aa6c751db15e4aac813247c309fae622180056.camel@mediatek.com>
References: <20220107101425.6917-1-jason-jh.lin@mediatek.com>
 <20220107101425.6917-9-jason-jh.lin@mediatek.com>
 <72aa6c751db15e4aac813247c309fae622180056.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_201818_258753_90371633 
X-CRM114-Status: GOOD (  27.99  )
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
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK,

Thanks for the reviews.

On Tue, 2022-01-25 at 11:44 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Fri, 2022-01-07 at 18:14 +0800, jason-jh.lin wrote:
> > Add mt8195 vdosys0 clock driver name and routing table to
> > the driver data of mtk-mmsys.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> > The vdosys1 impelmentation patch [1] will be dependened on this
> > patch.
> > [1] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
> > - 
> > 
https://patchwork.kernel.org/project/linux-mediatek/patch/20211208024426.15595-6-nancy.lin@mediatek.com/
> > ---
> >  drivers/soc/mediatek/mt8195-mmsys.h    | 220
> > +++++++++++++++++++++++++
> >  drivers/soc/mediatek/mtk-mmsys.c       |  11 ++
> >  include/linux/soc/mediatek/mtk-mmsys.h |   9 +
> >  3 files changed, 240 insertions(+)
> >  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > new file mode 100644
> > index 000000000000..e04cabdfa2dc
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > @@ -0,0 +1,220 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
> > +#define __SOC_MEDIATEK_MT8195_MMSYS_H
> > +
> > +#define MT8195_VDO0_OVL_MOUT_EN					
> > 0xf14
> > +/*
> > + * MT8195_VDO0_OVL_MOUT[2:0]: DISP_OVL0
> > + *   BIT(0) : DISP_RDMA0
> > + *   BIT(1) : DISP_WDMA0
> > + *   BIT(2): DISP_OVL1
> 
> I think these information is not necessary because we could get these
> information from mmsys_mt8195_routing_table[].
> 
> Regards,
> CK
> 
These comments was suggest by Fei at:

https://patchwork.kernel.org/project/linux-mediatek/patch/20210921155218.10387-10-jason-jh.lin@mediatek.com/#24546317

I've discussed with him that removing these information is fine.
So' I'll remove it at the next version.

> > + */
> > +#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0			
> > BIT(0)
> > +#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0			
> > BIT(1)
> > +#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1			BIT(2)
> > +/*
> > + * MT8195_VDO0_OVL_MOUT[6:4]: DISP_OVL1
> > + *   BIT(0) : DISP_RDMA1
> > + *   BIT(1) : DISP_WDMA1
> > + *   BIT(2): DISP_OVL0
> > + */
> > 
> 
> [snip]
> 
> > +
> > +static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[]
> > =
> > {
> > +	{
> > +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> > +		MT8195_VDO0_OVL_MOUT_EN,
> > MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0,
> > +		MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0
> > +	}, {
> > +		DDP_COMPONENT_OVL1, DDP_COMPONENT_RDMA1,
> > +		MT8195_VDO0_OVL_MOUT_EN,
> > MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1,
> > +		MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1
> > +	}, {
> > +		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> > +		MT8195_VDO0_SEL_IN,
> > MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT,

> Why this mask MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT is 0?

> > +		MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
> > +		MT8195_VDO0_SEL_IN,

> Why this mask MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE is 0?

> > +		MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE
> > +	}, {
> > +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> > +		MT8195_VDO0_SEL_IN,
> > MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0,
> > +		MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
> > +	}, {
> > +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> > +		MT8195_VDO0_SEL_IN,
> > MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT,

> Why this mask MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0 is 0?

> Regards,
> CK

I'll fix the 0 mask problem with the define of GENMASK(h, l) for each
mux settings.

Regards,
Jason-JH.Lin

> > +		MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
> > +	}, {
> > +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> > +		MT8195_VDO0_SEL_IN,
> > MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0,
> > +		MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0
> > +	}, {
> > +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> > +		MT8195_VDO0_SEL_OUT,
> > MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN,
> > +		MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN
> > +	}, {
> > +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> > +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_DSI0,
> > +		MT8195_SOUT_DISP_DITHER0_TO_DSI0
> > +	}, {
> > +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> > +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0,
> > +		MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0
> > +	}, {
> > +		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> > +		MT8195_VDO0_SEL_OUT,
> > MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE,
> > +		MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
> > +	}, {
> > +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
> > +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_DP_INTF0,
> > +		MT8195_SOUT_VPP_MERGE_TO_DP_INTF0
> > +	}
> > +};
> > +
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
