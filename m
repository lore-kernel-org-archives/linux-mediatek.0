Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAA3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 02:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqP05G9FIgyXTG30LEDtwFuebT5y9WEp26T7VFuk1AI=; b=a/fP4oErK/UyFZ
	Ll7eNkiWveUdTX2cUE5SvRStL11HK90MwHC9bYJMQsguS9Ka5cxcqj7EbKc45AKCn3bAOERtgC5O+
	aUlmH2tsaMJgVo1K5vPeseIbCZyBrqz5ye/ZJydwb6tlauJGEHwOnw6DoAKp0t3vi6ajTFtFjBgXV
	jBevZXs9IDucURuQzxj5KnPwK4tTLGh2BWS7FXtvkzSO5iX03XNBEQ/LAV6b2AAtZz8u7Z8FBt9ae
	0KxRzO4BEl2u302vedDh55UiJI0Yb9RIGH9EguPK5tWVt3pKxZZtdo4qofwCeDtl1HhPcY/Px0Ohu
	tRCeQ8chXSghUwUitfQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAk5h-00DgR5-03; Fri, 21 Jan 2022 02:55:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAk5S-00DgNJ-4Q; Fri, 21 Jan 2022 02:55:41 +0000
X-UUID: 7347f22e4059419c84fb0f43a5622225-20220120
X-UUID: 7347f22e4059419c84fb0f43a5622225-20220120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 426743081; Thu, 20 Jan 2022 19:55:29 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Jan 2022 18:45:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 21 Jan 2022 10:45:26 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 Jan 2022 10:45:25 +0800
Message-ID: <91feaca3440e50855d43e6474560c5656c21ffed.camel@mediatek.com>
Subject: Re: [PATCH v14 08/12] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Fri, 21 Jan 2022 10:45:25 +0800
In-Reply-To: <20220107101425.6917-9-jason-jh.lin@mediatek.com>
References: <20220107101425.6917-1-jason-jh.lin@mediatek.com>
 <20220107101425.6917-9-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_185538_229625_366F2968 
X-CRM114-Status: GOOD (  24.09  )
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
 Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 CK Hu <ck.hu@mediatek.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

mtk-mmsys and mtk-mutex needs your review....
Could you please spare a little time to review these patches?

Thank you very much!

Regards,
Jason-JH.Lin

On Fri, 2022-01-07 at 18:14 +0800, jason-jh.lin wrote:
> Add mt8195 vdosys0 clock driver name and routing table to
> the driver data of mtk-mmsys.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
> The vdosys1 impelmentation patch [1] will be dependened on this
> patch.
> [1] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
> - 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20211208024426.15595-6-nancy.lin@mediatek.com/
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h    | 220
> +++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       |  11 ++
>  include/linux/soc/mediatek/mtk-mmsys.h |   9 +
>  3 files changed, 240 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> b/drivers/soc/mediatek/mt8195-mmsys.h
> new file mode 100644
> index 000000000000..e04cabdfa2dc
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -0,0 +1,220 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
> +#define __SOC_MEDIATEK_MT8195_MMSYS_H
> +
> +#define MT8195_VDO0_OVL_MOUT_EN					
> 0xf14
> +/*
> + * MT8195_VDO0_OVL_MOUT[2:0]: DISP_OVL0
> + *   BIT(0) : DISP_RDMA0
> + *   BIT(1) : DISP_WDMA0
> + *   BIT(2): DISP_OVL1
> + */
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0			BIT(0)
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0			BIT(1)
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1			BIT(2)
> +/*
> + * MT8195_VDO0_OVL_MOUT[6:4]: DISP_OVL1
> + *   BIT(0) : DISP_RDMA1
> + *   BIT(1) : DISP_WDMA1
> + *   BIT(2): DISP_OVL0
> + */
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1			BIT(4)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1			BIT(5)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0			BIT(6)
> +
> +#define MT8195_VDO0_SEL_IN					0xf34
> +/*
> + * MT8195_VDO0_SEL_IN[1:0]: VPP_MERGE
> + *   0 : DSC_WRAP0_OUT
> + *   1 : DISP_DITHER1
> + *   2: VDO1_VIRTUAL0
> + */
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT		0
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1		BIT(0)
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0		BIT(1)
> +/*
> + * MT8195_VDO0_SEL_IN[4:4]: DSC_WRAP0_IN
> + *   0: DISP_DITHER0
> + *   1: VPP_MERGE
> + */
> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0		0
> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE		BIT(4)
> +/*
> + * MT8195_VDO0_SEL_IN[5:5]: DSC_WRAP1_IN
> + *   0: DISP_DITHER1
> + *   1: VPP_MERGE
> + */
> +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1		0
> +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE		BIT(5)
> +/*
> + * MT8195_VDO0_SEL_IN[8:8]: SINA_VIRTUAL0
> + *   0: VPP_MERGE
> + *   1: DSC_WRAP1_OUT
> + */
> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE		0
> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT		
> BIT(8)
> +/*
> + * MT8195_VDO0_SEL_IN[9:9]: SINB_VIRTUAL0
> + *   0: DSC_WRAP0_OUT
> + */
> +#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT		
> 0
> +/*
> + * MT8195_VDO0_SEL_IN[13:12]: DP_INTF0
> + *   0 : DSC_WRAP1_OUT
> + *   1 : VPP_MERGE
> + *   2: VDO1_VIRTUAL0
> + */
> +#define MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT		0
> +#define MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE			
> BIT(12)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0		BIT(13)
> +/*
> + * MT8195_VDO0_SEL_IN[16:16]: DSI0
> + *   0 : DSC_WRAP0_OUT
> + *   1 : DISP_DITHER0
> + */
> +#define MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT			
> 0
> +#define MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0			BIT(16)
> +/*
> + * MT8195_VDO0_SEL_IN[17:17]: DSI1
> + *   0 : DSC_WRAP1_OUT
> + *   1 : VPP_MERGE
> + */
> +#define MT8195_SEL_IN_DSI1_FROM_DSC_WRAP1_OUT			
> 0
> +#define MT8195_SEL_IN_DSI1_FROM_VPP_MERGE			BIT(17)
> +/*
> + * MT8195_VDO0_SEL_IN[20:20]: DISP_WDMA1
> + *   0 : DISP_OVL1
> + *   1 : VPP_MERGE
> + */
> +#define MT8195_SEL_IN_DISP_WDMA1_FROM_DISP_OVL1			
> 0
> +#define MT8195_SEL_IN_DISP_WDMA1_FROM_VPP_MERGE			
> BIT(20)
> +/*
> + * MT8195_VDO0_SEL_IN[21:21]: DSC_WRAP1_OUT
> + *   0 : DSC_WRAP1_IN
> + *   1 : DITHER1
> + */
> +#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN		
> (0)
> +#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1		
> BIT(21)
> +/*
> + * MT8195_VDO0_SEL_IN[22:22]: DISP_WDMA0
> + *   0 : DISP_OVL0
> + */
> +#define MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0			
> 0
> +
> +#define MT8195_VDO0_SEL_OUT					0xf38
> +/*
> + * MT8195_VDO0_SOUT[0:0]: DISP_DITHER0
> + *   0 : DSC_WRAP0_IN
> + *   1 : DSI0
> + */
> +#define MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN		0
> +#define MT8195_SOUT_DISP_DITHER0_TO_DSI0			BIT(0)
> +/*
> + * MT8195_VDO0_SOUT[1:1]: DISP_DITHER1
> + *   0 : DSC_WRAP1_IN
> + *   1 : VPP_MERGE
> + *   2 : DSC_WRAP1_OUT
> + */
> +#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN		0
> +#define MT8195_SOUT_DISP_DITHER1_TO_VPP_MERGE			
> BIT(1)
> +#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT		BIT(2)
> +/*
> + * MT8195_VDO0_SOUT[4:4]: VDO1_VIRTUAL0
> + *   0 : VPP_MERGE
> + *   1 : DP_INTF0
> + */
> +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE			
> 0
> +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_DP_INTF0			
> BIT(4)
> +/*
> + * MT8195_VDO0_SOUT[10:8]: VPP_MERGE
> + *   0 : DSI1
> + *   1 : DP_INTF0
> + *   2 : SINA_VIRTUAL0
> + *   3 : DISP_WDMA1
> + *   4 : DSC_WRAP0_IN
> + */
> +#define MT8195_SOUT_VPP_MERGE_TO_DSI1				
> 0
> +#define MT8195_SOUT_VPP_MERGE_TO_DP_INTF0			BIT(8)
> +#define MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0			
> BIT(9)
> +#define MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA1			(BIT(9)
> | BIT(8))
> +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN			
> BIT(10)
> +/*
> + * MT8195_VDO0_SOUT[11:11]: VPP_MERGE
> + *  0 : DSC_WRAP1_IN
> + */
> +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN			
> 0
> +/*
> + * MT8195_VDO0_SOUT[13:12]: DSC_WRAP0_OUT
> + *  0 : DSI0
> + *  1 : SINB_VIRTUAL0
> + *  2 : VPP_MERGE
> + */
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0			0
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0		BIT(12)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE			
> BIT(13)
> +/*
> + * MT8195_VDO0_SOUT[17:16]: DSC_WRAP1_OUT
> + *  0 : DSI1
> + *  1 : DP_INTF0
> + *  2 : SINA_VIRTUAL0
> + *  3 : VPP_MERGE
> + */
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DSI1			0
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DP_INTF0			
> BIT(16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		BIT(17)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			
> (BIT(17) | BIT(16))
> +
> +static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] =
> {
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		MT8195_VDO0_OVL_MOUT_EN,
> MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0,
> +		MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0
> +	}, {
> +		DDP_COMPONENT_OVL1, DDP_COMPONENT_RDMA1,
> +		MT8195_VDO0_OVL_MOUT_EN,
> MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1,
> +		MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> +		MT8195_VDO0_SEL_IN,
> MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT,
> +		MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
> +		MT8195_VDO0_SEL_IN,
> MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE,
> +		MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> +		MT8195_VDO0_SEL_IN,
> MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0,
> +		MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> +		MT8195_VDO0_SEL_IN,
> MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT,
> +		MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8195_VDO0_SEL_IN,
> MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0,
> +		MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> +		MT8195_VDO0_SEL_OUT,
> MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN,
> +		MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_DSI0,
> +		MT8195_SOUT_DISP_DITHER0_TO_DSI0
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0,
> +		MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> +		MT8195_VDO0_SEL_OUT,
> MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE,
> +		MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_DP_INTF0,
> +		MT8195_SOUT_VPP_MERGE_TO_DP_INTF0
> +	}
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index 5f79c7e039ad..5865d268c5b4 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -18,6 +18,7 @@
>  #include "mt8167-mmsys.h"
>  #include "mt8183-mmsys.h"
>  #include "mt8192-mmsys.h"
> +#include "mt8195-mmsys.h"
>  #include "mt8365-mmsys.h"
>  
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data =
> {
> @@ -66,6 +67,12 @@ static const struct mtk_mmsys_driver_data
> mt8192_mmsys_driver_data = {
>  	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data
> = {
> +	.clk_driver = "clk-mt8195-vdo0",
> +	.routes = mmsys_mt8195_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +};
> +
>  static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data =
> {
>  	.clk_driver = "clk-mt8365-mm",
>  	.routes = mt8365_mmsys_routing_table,
> @@ -391,6 +398,10 @@ static const struct of_device_id
> of_match_mtk_mmsys[] = {
>  		.compatible = "mediatek,mt8192-mmsys",
>  		.data = &mt8192_mmsys_driver_data,
>  	},
> +	{
> +		.compatible = "mediatek,mt8195-vdosys0",
> +		.data = &mt8195_vdosys0_driver_data,
> +	},
>  	{
>  		.compatible = "mediatek,mt8365-mmsys",
>  		.data = &mt8365_mmsys_driver_data,
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> b/include/linux/soc/mediatek/mtk-mmsys.h
> index 45e77d1cd6c1..c0ba22ad7229 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -23,13 +23,22 @@ enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_COLOR0,
>  	DDP_COMPONENT_COLOR1,
>  	DDP_COMPONENT_DITHER,
> +	DDP_COMPONENT_DP_INTF0,
>  	DDP_COMPONENT_DPI0,
>  	DDP_COMPONENT_DPI1,
> +	DDP_COMPONENT_DSC0,
> +	DDP_COMPONENT_DSC1,
>  	DDP_COMPONENT_DSI0,
>  	DDP_COMPONENT_DSI1,
>  	DDP_COMPONENT_DSI2,
>  	DDP_COMPONENT_DSI3,
>  	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_MERGE0,
> +	DDP_COMPONENT_MERGE1,
> +	DDP_COMPONENT_MERGE2,
> +	DDP_COMPONENT_MERGE3,
> +	DDP_COMPONENT_MERGE4,
> +	DDP_COMPONENT_MERGE5,
>  	DDP_COMPONENT_OD0,
>  	DDP_COMPONENT_OD1,
>  	DDP_COMPONENT_OVL0,
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
