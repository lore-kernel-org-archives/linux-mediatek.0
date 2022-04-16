Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A054CC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Apr 2022 01:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XG9ciOHibEyY7Fag1g88rqh1hMG5QV643kypy2r1j/8=; b=hEHnwsjLp0FjGE
	Wf9Evyd9iN2o/u02CEZCY3lpLJ8u8ddnh/n9q1eh5SO0WmMiykxYvjezRMTxI0Fv6x6jGiam7Olcs
	nIOxI+l9i6Vct3O6UghEPQ46wUrNVdu+C59gQV2vwCehYZA9KfeH3mtDzfaE1ZaM3MR9hau8qKfjb
	njGUHnheaLmrfNfFnIbFhgpvAWw9Y14fhBYiQlX4zOUqiO6+sQYATZfL5lFiks2NsDjAHRfad829N
	PBiLnHfgWutrKm4L+WDNl+w7OQdzqxnDr7lLNJOBM1gmWFw0b5jrhkYvh+Wt2hBoqA7W+T7YaBeni
	Cnzp5NLQWUJDKMBjTaOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfWvQ-00Bqi4-Qo; Sat, 16 Apr 2022 01:08:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfWvN-00Bqgx-I0; Sat, 16 Apr 2022 01:08:31 +0000
X-UUID: 2c903d17e0e64f289241f745ae1841b0-20220415
X-UUID: 2c903d17e0e64f289241f745ae1841b0-20220415
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1919762599; Fri, 15 Apr 2022 18:08:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Apr 2022 18:08:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 16 Apr 2022 09:08:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 16 Apr 2022 09:08:19 +0800
Message-ID: <58db725a3609bfed1a90954fcd84fbbaaafc2e89.camel@mediatek.com>
Subject: Re: [PATCH v16 04/22] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <srv_heupstream@mediatek.com>, David Airlie
 <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <llvm@lists.linux.dev>, Nick Desaulniers
 <ndesaulniers@google.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Nathan Chancellor <nathan@kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Sat, 16 Apr 2022 09:08:19 +0800
In-Reply-To: <b391cb9ab341ed83f8d640867c8dbba856a7c454.camel@mediatek.com>
References: <20220318142009.2796-1-nancy.lin@mediatek.com>
 <20220318142009.2796-5-nancy.lin@mediatek.com>
 <b391cb9ab341ed83f8d640867c8dbba856a7c454.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_180829_659382_52460310 
X-CRM114-Status: GOOD (  21.19  )
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

On Tue, 2022-03-22 at 11:31 +0800, CK Hu wrote:
> Hi, Nancy:
> 
> On Fri, 2022-03-18 at 22:19 +0800, Nancy.Lin wrote:
> > Add mt8195 vdosys1 clock driver name and routing table to
> > the driver data of mtk-mmsys.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mt8195-mmsys.h    | 136
> > +++++++++++++++++++++++++
> >  drivers/soc/mediatek/mtk-mmsys.c       |  10 ++
> >  include/linux/soc/mediatek/mtk-mmsys.h |   2 +
> >  3 files changed, 148 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > index 24a3afe23bc8..369fb0aab56d 100644
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
> > @@ -124,6 +188,78 @@ static const struct mtk_mmsys_routes
> > mmsys_mt8195_routing_table[] = {
> >  		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
> >  		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
> >  		MT8195_SOUT_VPP_MERGE_TO_DP_INTF0
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, GENMASK(0, 0),
> > +		MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, GENMASK(0, 0),
> > +		MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, GENMASK(0, 0),
> > +		MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_SOUT_TO_MIXER_IN1_SEL
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_SOUT_TO_MIXER_IN2_SEL
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_SOUT_TO_MIXER_IN3_SEL
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_SOUT_TO_MIXER_IN4_SEL
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MIXER_OUT_SOUT_SEL, GENMASK(0, 0),
> > +		MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MIXER_IN1_SEL_IN, GENMASK(0, 0),
> > +		MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MIXER_IN2_SEL_IN, GENMASK(0, 0),
> > +		MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MIXER_IN3_SEL_IN, GENMASK(0, 0),
> > +		MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MIXER_IN4_SEL_IN, GENMASK(0, 0),
> > +		MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MIXER_SOUT_SEL_IN, GENMASK(2, 0),
> > +		MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
> > +	}, {
> > +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MERGE4_ASYNC_SEL_IN, GENMASK(2, 0),
> > +		MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
> 
> I would like to expose each mod instead of ovl adaptor. ovl adaptor
> is
> an application that combine these mod to achieve ovl function, maybe
> another application would combine part of these mod to achieve
> another
> function. Let application to decide the combination.
> 
> Regards,
> CK
> 
OK. I will separate ovl adaptor compoent in the next revision.

Regards,
Nancy

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
> > index dc5c51f0ccc8..0b77624cf6ca 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -79,6 +79,12 @@ static const struct mtk_mmsys_driver_data
> > mt8195_vdosys0_driver_data = {
> >  	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> >  };
> >  
> > +static const struct mtk_mmsys_driver_data
> > mt8195_vdosys1_driver_data
> > = {
> > +	.clk_driver = "clk-mt8195-vdo1",
> > +	.routes = mmsys_mt8195_routing_table,
> > +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> > +};
> > +
> >  static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data
> > =
> > {
> >  	.clk_driver = "clk-mt8365-mm",
> >  	.routes = mt8365_mmsys_routing_table,
> > @@ -271,6 +277,10 @@ static const struct of_device_id
> > of_match_mtk_mmsys[] = {
> >  		.compatible = "mediatek,mt8195-vdosys0",
> >  		.data = &mt8195_vdosys0_driver_data,
> >  	},
> > +	{
> > +		.compatible = "mediatek,mt8195-vdosys1",
> > +		.data = &mt8195_vdosys1_driver_data,
> > +	},
> >  	{
> >  		.compatible = "mediatek,mt8365-mmsys",
> >  		.data = &mt8365_mmsys_driver_data,
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index 64c77c4a6c56..eaf7f7345519 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -18,6 +18,7 @@ enum mtk_ddp_comp_id {
> >  	DDP_COMPONENT_COLOR1,
> >  	DDP_COMPONENT_DITHER,
> >  	DDP_COMPONENT_DP_INTF0,
> > +	DDP_COMPONENT_DP_INTF1,
> >  	DDP_COMPONENT_DPI0,
> >  	DDP_COMPONENT_DPI1,
> >  	DDP_COMPONENT_DSC0,
> > @@ -39,6 +40,7 @@ enum mtk_ddp_comp_id {
> >  	DDP_COMPONENT_OVL_2L0,
> >  	DDP_COMPONENT_OVL_2L1,
> >  	DDP_COMPONENT_OVL_2L2,
> > +	DDP_COMPONENT_OVL_ADAPTOR,
> >  	DDP_COMPONENT_OVL1,
> >  	DDP_COMPONENT_POSTMASK0,
> >  	DDP_COMPONENT_PWM0,
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
