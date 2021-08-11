Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C47BC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 16:07:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF46660C40
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 16:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF46660C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82ABRkljZ6MZy+yn8BnesOUlEwqZN3Aro+Ugob/mRNQ=; b=z8xUM2lqd35oWU
	qxcrO0cvdvQKvSxyuqIyoiBF/CTaLtBqvm22sSZl4cmGH1dwdsfIJrHq+5c7xLUEOwobt5Y1l2rtT
	mE7/wv7HACZ0BBJ4CJzpdzqJOytk8TC6DqN0uruiPxDZHOgb8gqnKQu6jI2M+r01g+yiH7qXf/zTo
	UcNiC3bk2dk8hxCgTafM2RhMzdOIFBBeWOK5oROb8G8HR3Da6/7NmD3oXTMw6x4fLZJ2+uERNNQxf
	HU5AFd1cAC7AJTsMTDKfmFVqukXXiitHrd5w7ItJI8gYeRz3Kx3pqEMqrdULqqLwQ8NuiKvFRT+ku
	g9d2kPBRAtNROcfwIZJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDqlK-007eT6-KO; Wed, 11 Aug 2021 16:07:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDql2-007ePw-GO; Wed, 11 Aug 2021 16:07:14 +0000
X-UUID: a2b9be87ac4c45f8bde0bfce27108ca9-20210811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bV8LuWRHPnlpV0QjNl7VPScicPP5sngvKoC2txLWlNc=; 
 b=udyTl8sN0EeYv/Gr4qwFHkm7Dq9FGsJ4bZBXG/z9ZzmTz2u2v+cH7dEZFB+6jyo5xl7PvqBKm0i1BRP1YGavVPqhMJ4ipDqWBTG9dplK1Hoxwa4jWtKr8pgkbTYiofAI2RtLRccVFtIEeP7Xij4f+AGvWcopACdF2QboDClkVEc=;
X-UUID: a2b9be87ac4c45f8bde0bfce27108ca9-20210811
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 316402392; Wed, 11 Aug 2021 09:06:52 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Aug 2021 09:06:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 00:06:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Aug 2021 00:06:49 +0800
Message-ID: <35e543ebb1dd389a0530ec48ebca8298816a2378.camel@mediatek.com>
Subject: Re: [PATCH v6 2/7] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Fabien
 Parent" <fparent@baylibre.com>, <hsinyi@chromium.org>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Date: Thu, 12 Aug 2021 00:06:49 +0800
In-Reply-To: <28cc4599-6eda-4784-3d8f-4570c9ab60e8@gmail.com>
References: <20210805205226.24880-1-jason-jh.lin@mediatek.com>
 <20210805205226.24880-3-jason-jh.lin@mediatek.com>
 <28cc4599-6eda-4784-3d8f-4570c9ab60e8@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_090710_000044_ED843C38 
X-CRM114-Status: GOOD (  28.74  )
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

Hi Matthias,

On Fri, 2021-08-06 at 13:28 +0200, Matthias Brugger wrote:
> Hi Jason,
> 
> On 05/08/2021 22:52, jason-jh.lin wrote:
> > Add mt8195 vdosys0 clock driver name and routing table to
> > the driver data of mtk-mmsys.
> > 
> 
> I'd like to see the implementation of vdosys1 as well, to better
> understand why
> we need two compatibles.

Do you mean I have to merge this patch and [1] into the same patch? or
just add [1] at the same series? or just include [1] at commit message?
[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/20210722094551.15255-10-nancy.lin@mediatek.com/

> 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> > This patch is base on [1]
> > 
> > [1] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210805171346.24249-2-jason-jh.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!21Mclcdx-qMIpoqPQOZd_-TuzoUfzzJ8UBC_RDzmvz5ISZQjfJIAhhJDKYBClDfOZb71$
> >  
> 
> Please add the binding description to this series.

OK, I'll add the binding patch into this series. 

> 
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
> > +	{
> > +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> > +		MT8195_VDO0_OVL_MOUT_EN,
> > MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0
> 
> Please update the struct to the new version that includes a mask
> field.
> 

OK, I'll add [2] before my patch and also test it on mt8195 SoC
platform.
[2] 
https://patchwork.kernel.org/project/linux-mediatek/patch/20210729070549.5514-1-linux@fw-web.de/


> Regards,
> Matthias
-- 
Regards,
Jason-JH Lin <jason-jh.lin@mediatek.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
