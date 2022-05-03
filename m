Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C880C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 03:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=famzdkBmGe2mFmXTXs92ri0EZIrJzdm1miq7Ao0gLjU=; b=zBb9V/Tr2qJqJA
	Iv27mRaTqfxqdKE/YLZGeaExaPocUYaHyWAswRu7Dc86lhehealQipn2g7Hui0JqOYAiIgblGmFYx
	Q7EGKR8Ed6MAvNdHOlUIYZrLghnYX7/lGgK4m+nzgL7Wz14dw0S6Hb6A6MMNsn/iSmQzIjfRlKUT4
	VGoYHdGU4wq/ggnMlBtEq/FmlQXnXmtSCBX24X1fa0Xr12Qt+Q2vNsjerkifpuADiVXYmcJIMl7eK
	E4N+Vp7liLw5tnadcewJyDmUq5Wo8uc5FR6wWLMnlPvi9kBTBSDcNLX2B1YS1Oj1w+1Endq2s+geT
	YiRdFr1tCtTYDXoPYm2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nliss-003Wgb-Q4; Tue, 03 May 2022 03:07:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlisp-003Wfq-O4; Tue, 03 May 2022 03:07:29 +0000
X-UUID: 59630b2513d7418b81017c605f83c73e-20220502
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:53d52a74-4031-432b-9616-9d0231157ebc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:ca7d42c7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 59630b2513d7418b81017c605f83c73e-20220502
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 471243020; Mon, 02 May 2022 20:07:24 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 May 2022 20:07:22 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 11:07:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 May 2022 11:07:20 +0800
Message-ID: <5bf6e78f31c31f0244d967da628e9c60c496e30b.camel@mediatek.com>
Subject: Re: [PATCH v18 04/21] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Nathan
 Chancellor" <nathan@kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 3 May 2022 11:07:20 +0800
In-Reply-To: <0fb7b063fc246c89430ddf310406ae954a3e3650.camel@mediatek.com>
References: <20220428105408.11189-1-nancy.lin@mediatek.com>
 <20220428105408.11189-5-nancy.lin@mediatek.com>
 <0fb7b063fc246c89430ddf310406ae954a3e3650.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_200727_884484_3F11C83D 
X-CRM114-Status: GOOD (  23.96  )
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

Hi CK,

Thanks for the review.

On Fri, 2022-04-29 at 15:39 +0800, CK Hu wrote:
> Hi, Nancy:
> 
> On Thu, 2022-04-28 at 18:53 +0800, Nancy.Lin wrote:
> > Add mt8195 vdosys1 routing table to the driver data of mtk-mmsys.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mt8195-mmsys.h    | 136
> > +++++++++++++++++++++++++
> >  drivers/soc/mediatek/mtk-mmsys.c       |   2 +
> >  include/linux/soc/mediatek/mtk-mmsys.h |   9 ++
> >  3 files changed, 147 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > index abfe94a30248..51031d75e81e 100644
> > --- a/drivers/soc/mediatek/mt8195-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > @@ -75,6 +75,70 @@
> >  #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 <<
> > 16)
> >  #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			
> > (3 << 16)
> >  
> > +#define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
> > +#define MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0			
> > 1
> > +
> > +#define MT8195_VDO1_VPP_MERGE0_P1_SEL_IN			0xf08
> > +#define MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1			
> > 1
> > +
> > +#define MT8195_VDO1_DISP_DPI1_SEL_IN				
> > 0xf10
> > +#define MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT		
> > 	
> > 0
> > +
> > +#define MT8195_VDO1_DISP_DP_INTF0_SEL_IN			0xf14
> > +#define MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT		
> > 0
> > +
> > +#define MT8195_VDO1_MERGE4_SOUT_SEL				
> > 0xf18
> > +#define MT8195_MERGE4_SOUT_TO_DPI1_SEL				
> > 	2
> > +#define MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL				
> > 3
> > +
> > +#define MT8195_VDO1_MIXER_IN1_SEL_IN				
> > 0xf24
> > +#define MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT		
> > 	1
> > +
> > +#define MT8195_VDO1_MIXER_IN2_SEL_IN				
> > 0xf28
> > +#define MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT		
> > 	1
> > +
> > +#define MT8195_VDO1_MIXER_IN3_SEL_IN				
> > 0xf2c
> > +#define MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT		
> > 	1
> > +
> > +#define MT8195_VDO1_MIXER_IN4_SEL_IN				
> > 0xf30
> > +#define MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT		
> > 	1
> > +
> > +#define MT8195_VDO1_MIXER_OUT_SOUT_SEL				
> > 0xf34
> > +#define MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL			
> > 	1
> > +
> > +#define MT8195_VDO1_VPP_MERGE1_P0_SEL_IN			0xf3c
> > +#define MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2			
> > 1
> > +
> > +#define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL			0xf40
> > +#define MT8195_SOUT_TO_MIXER_IN1_SEL				
> > 	
> > 1
> > +
> > +#define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL			0xf44
> > +#define MT8195_SOUT_TO_MIXER_IN2_SEL				
> > 	
> > 1
> > +
> > +#define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL			0xf48
> > +#define MT8195_SOUT_TO_MIXER_IN3_SEL				
> > 	
> > 1
> > +
> > +#define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL			0xf4c
> > +#define MT8195_SOUT_TO_MIXER_IN4_SEL				
> > 	
> > 1
> > +
> > +#define MT8195_VDO1_MERGE4_ASYNC_SEL_IN				
> > 0xf50
> > +#define MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT		
> > 	1
> > +
> > +#define MT8195_VDO1_MIXER_IN1_SOUT_SEL				
> > 0xf58
> > +#define MT8195_MIXER_IN1_SOUT_TO_DISP_MIXER			
> > 	
> > 0
> > +
> > +#define MT8195_VDO1_MIXER_IN2_SOUT_SEL				
> > 0xf5c
> > +#define MT8195_MIXER_IN2_SOUT_TO_DISP_MIXER			
> > 	
> > 0
> > +
> > +#define MT8195_VDO1_MIXER_IN3_SOUT_SEL				
> > 0xf60
> > +#define MT8195_MIXER_IN3_SOUT_TO_DISP_MIXER			
> > 	
> > 0
> > +
> > +#define MT8195_VDO1_MIXER_IN4_SOUT_SEL				
> > 0xf64
> > +#define MT8195_MIXER_IN4_SOUT_TO_DISP_MIXER			
> > 	
> > 0
> > +
> > +#define MT8195_VDO1_MIXER_SOUT_SEL_IN				
> > 0xf68
> > +#define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			
> > 0
> > +
> >  static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[]
> > =
> > {
> >  	{
> >  		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> > @@ -364,6 +428,78 @@ static const struct mtk_mmsys_routes
> > mmsys_mt8195_routing_table[] = {
> >  		DDP_COMPONENT_DSC1, DDP_COMPONENT_MERGE0,
> >  		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
> >  		MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE
> > +	}, {
> > +		DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1,
> > +		MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, GENMASK(0, 0),
> > +		MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
> > +	}, {
> > +		DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1,
> > +		MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, GENMASK(0, 0),
> > +		MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
> > +	}, {
> > +		DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2,
> > +		MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, GENMASK(0, 0),
> > +		MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
> > +	}, {
> > +		DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_SOUT_TO_MIXER_IN1_SEL
> > +	}, {
> > +		DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_SOUT_TO_MIXER_IN2_SEL
> > +	}, {
> > +		DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_SOUT_TO_MIXER_IN3_SEL
> > +	}, {
> > +		DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_SOUT_TO_MIXER_IN4_SEL
> > +	}, {
> > +		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MIXER_OUT_SOUT_SEL, GENMASK(0, 0),
> > +		MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL
> > +	}, {
> > +		DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MIXER_IN1_SEL_IN, GENMASK(0, 0),
> > +		MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MIXER_IN2_SEL_IN, GENMASK(0, 0),
> > +		MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MIXER_IN3_SEL_IN, GENMASK(0, 0),
> > +		MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MIXER_IN4_SEL_IN, GENMASK(0, 0),
> > +		MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
> > +	}, {
> > +		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MIXER_SOUT_SEL_IN, GENMASK(2, 0),
> > +		MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
> > +	}, {
> > +		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MERGE4_ASYNC_SEL_IN, GENMASK(2, 0),
> > +		MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> > +		MT8195_VDO1_DISP_DPI1_SEL_IN, GENMASK(1, 0),
> > +		MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> > +		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_MERGE4_SOUT_TO_DPI1_SEL
> > +	}, {
> > +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> > +		MT8195_VDO1_DISP_DP_INTF0_SEL_IN, GENMASK(1, 0),
> > +		MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> > +		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL
> >  	}
> >  };
> >  
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 548efed8dc1c..03c75a82c8d3 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -146,6 +146,8 @@ static const struct mtk_mmsys_driver_data
> > mt8195_vdosys0_driver_data = {
> >  static const struct mtk_mmsys_driver_data
> > mt8195_vdosys1_driver_data
> > = {
> >  	.io_start = 0x1c100000,
> >  	.clk_driver = "clk-mt8195-vdo1",
> > +	.routes = mmsys_mt8195_routing_table,
> 
> I think vdo0 and vdo1 are independent, so the routing table would
> also
> be independent. Merge these two table into one would waste time to
> search routing of other mmsys.
> 
OK, I will separate vdo0 and vdo1 routing tables.

> > +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> >  };
> >  
> >  static const struct mtk_mmsys_match_data mt8195_mmsys_match_data =
> > {
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index fb719fd1281c..b4388ba43341 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -28,7 +28,16 @@ enum mtk_ddp_comp_id {
> >  	DDP_COMPONENT_DSI1,
> >  	DDP_COMPONENT_DSI2,
> >  	DDP_COMPONENT_DSI3,
> > +	DDP_COMPONENT_ETHDR_MIXER,
> >  	DDP_COMPONENT_GAMMA,
> > +	DDP_COMPONENT_MDP_RDMA0,
> > +	DDP_COMPONENT_MDP_RDMA1,
> > +	DDP_COMPONENT_MDP_RDMA2,
> > +	DDP_COMPONENT_MDP_RDMA3,
> > +	DDP_COMPONENT_MDP_RDMA4,
> > +	DDP_COMPONENT_MDP_RDMA5,
> > +	DDP_COMPONENT_MDP_RDMA6,
> > +	DDP_COMPONENT_MDP_RDMA7,
> 
> These new component is not strongly related to mt8195 (maybe other
> SoC
> has these component), so I would like adding these new component to
> another patch.
> 
> Regards,
> CK
> 
OK

Regards,
Nancy

> >  	DDP_COMPONENT_MERGE0,
> >  	DDP_COMPONENT_MERGE1,
> >  	DDP_COMPONENT_MERGE2,
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!0Wkga9YarTOv3MlBvmu5OO8sxlpUAvQPPXXpjGSYuAyG50xmj9fqkSwgjSkQXI1v$
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
