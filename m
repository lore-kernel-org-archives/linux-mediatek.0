Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC8AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 03:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2O31lLVXdxrmNa1adqUcj0PB9t+hOx2JWyhzPZRBww=; b=oWrUPOEcy4b6by
	JrRlu7U+xjnq+LHTeiUOketO++Hk80dYuo/uawy8+Qx1rZTG8FkCV+M5zJpbCF6a6UzggpqdrhVaQ
	EepnDPPYKTuzl4leTGvJRz7FD+GrZJA6wVyITBovmxD73VOF4Pc+/WWHsPf0o22DMSthD8GXEykiq
	EzTlUOqFDL1v8MfW1vZsHcV3BMxFMVg30tvz3rXpWfcHvXqA7xzaahT+2y0lC+Z/newuhlhUUbK5e
	zdRJ5v3NlemZfavtnU6Rq4pS48sslsMzFWdqHJI5EX9ABf146FMSxumF7/KxcOcO7x4AusG262haa
	SiIRnIA0GiZfOozCFGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCCuX-006OUG-MQ; Tue, 25 Jan 2022 03:54:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCCuM-006OSX-EU; Tue, 25 Jan 2022 03:54:16 +0000
X-UUID: 5a12de3fdf4c4da985ea86e15a9d7577-20220124
X-UUID: 5a12de3fdf4c4da985ea86e15a9d7577-20220124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 970484143; Mon, 24 Jan 2022 20:54:09 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Jan 2022 19:44:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 25 Jan 2022 11:44:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 11:44:00 +0800
Message-ID: <72aa6c751db15e4aac813247c309fae622180056.camel@mediatek.com>
Subject: Re: [PATCH v14 08/12] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys0
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Tue, 25 Jan 2022 11:44:00 +0800
In-Reply-To: <20220107101425.6917-9-jason-jh.lin@mediatek.com>
References: <20220107101425.6917-1-jason-jh.lin@mediatek.com>
 <20220107101425.6917-9-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_195414_531367_72A87CB1 
X-CRM114-Status: GOOD (  20.70  )
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

Hi, Jason:

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

I think these information is not necessary because we could get these
information from mmsys_mt8195_routing_table[].

Regards,
CK

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
> 

[snip]

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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
