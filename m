Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA911C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:44:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E77561C7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E77561C7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLw/PpBHid/frdN/T2eUuC4hDLG1k8DBedE7vzHDr8A=; b=Y06L7TZbDKeG4i
	Paw1alhNgYFFhvkYJzci+GhPiKsmVqGEB2xjAob/eG+rtlNCQc4OfVQLzmkQSMYHqif0oB1Y8Jv1N
	ePV7aadvoK9XAPxk8N89c96e777+SQ0zmUxbiUZodB1TeA5Bd/u8mOJD7mvg1ArhbnDNG5naTD+q0
	nCMibZaA9tuKQjezRfgIS0SaYebSFn5xDveC6vZeieT/+AX37jDl61kOeX+i92kb9d/j6BDfKMSw8
	L5KWuvJCXSSndhUx5OSrB/TLksc1fT/neDAlhmdTnK525eTUFQ1w31238mYUTpiwdYo+AJcRVN/GQ
	ziJaUblQS4uIixPkrP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0zQM-00DSMa-7b; Wed, 07 Jul 2021 04:44:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0zQI-00DSM8-Lr; Wed, 07 Jul 2021 04:44:36 +0000
X-UUID: c33d9d3259854fefa0bd3caf43b2439a-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ngJFHGIiFfE4SlLZaVdX9cxHVK9hLg//gRWBhLGodhg=; 
 b=Momt0AuUnF/4Zq5EbiCb4JjeFliujwPXOs0iyYuxDP0jtW/zJi2K+FODCYBfaEqVF9ILo5dzGnP+VnqmmXN45yx/gk0iDfvYoU/dMq5ahT7WikkHwt8OBdBl+fNki99O5jNr+NF5i/0tGExjHs1POkTfXlxrV+UYa29Xe4i8yh0=;
X-UUID: c33d9d3259854fefa0bd3caf43b2439a-20210706
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1643226148; Tue, 06 Jul 2021 21:44:31 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 21:44:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 12:44:21 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 12:44:21 +0800
Message-ID: <1625633061.7824.5.camel@mtksdaap41>
Subject: Re: [PATCH v1 04/17] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys0
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Wed, 7 Jul 2021 12:44:21 +0800
In-Reply-To: <20210707041249.29816-5-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-5-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_214434_885191_B4A60121 
X-CRM114-Status: GOOD (  23.87  )
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

Hi, Jason:

On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> 1. Add mtk-mmsys support for mt8195 vodsys0.
> 2. Change the clock driver of vdosys0 is probed
>    from the probe of mtk-mmsys.

Move clock driver part out of this patch. And ask chun-jie to squash
clock driver modification to his patch [1].

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20210616224743.5109-16-chun-jie.chen@mediatek.com/

Regards,
CK

> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mt8195-vdo0.c |  24 ++--
>  drivers/soc/mediatek/mt8195-mmsys.h    | 173 +++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       |  11 ++
>  3 files changed, 198 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 
> diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
> index 8e23f267a1e6..940be5377f70 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vdo0.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
> @@ -94,20 +94,24 @@ static const struct mtk_clk_desc vdo0_desc = {
>  	.num_clks = ARRAY_SIZE(vdo0_clks),
>  };
>  
> -static const struct of_device_id of_match_clk_mt8195_vdo0[] = {
> -	{
> -		.compatible = "mediatek,mt8195-vdosys0",
> -		.data = &vdo0_desc,
> -	}, {
> -		/* sentinel */
> -	}
> -};
> +static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->parent->of_node;
> +	struct clk_onecell_data *clk_data;
> +
> +	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(vdo0_clks));
> +
> +	mtk_clk_register_gates(node, vdo0_clks, ARRAY_SIZE(vdo0_clks),
> +			clk_data);
> +
> +	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +}
>  
>  static struct platform_driver clk_mt8195_vdo0_drv = {
> -	.probe = mtk_clk_simple_probe,
> +	.probe = clk_mt8195_vdo0_probe,
>  	.driver = {
>  		.name = "clk-mt8195-vdo0",
> -		.of_match_table = of_match_clk_mt8195_vdo0,
>  	},
>  };
>  
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> new file mode 100644
> index 000000000000..47f3d0ea3c6c
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -0,0 +1,173 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
> +#define __SOC_MEDIATEK_MT8195_MMSYS_H
> +
> +#define MT8195_VDO0_OVL_MOUT_EN					0xf14
> +#define MOUT_DISP_OVL0_TO_DISP_RDMA0				BIT(0)
> +#define MOUT_DISP_OVL0_TO_DISP_WDMA0				BIT(1)
> +#define MOUT_DISP_OVL0_TO_DISP_OVL1				BIT(2)
> +#define MOUT_DISP_OVL1_TO_DISP_RDMA1				BIT(4)
> +#define MOUT_DISP_OVL1_TO_DISP_WDMA1				BIT(5)
> +#define MOUT_DISP_OVL1_TO_DISP_OVL0				BIT(6)
> +
> +#define MT8195_VDO0_SEL_IN					0xf34
> +#define SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT			(0 << 0)
> +#define SEL_IN_VPP_MERGE_FROM_DISP_DITHER1			(1 << 0)
> +#define SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0			(2 << 0)
> +#define SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0			(0 << 4)
> +#define SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE			(1 << 4)
> +#define SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1			(0 << 5)
> +#define SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE			(1 << 5)
> +#define SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE			(0 << 8)
> +#define SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT			(1 << 8)
> +#define SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT			(0 << 9)
> +#define SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT			(0 << 12)
> +#define SEL_IN_DP_INTF0_FROM_VPP_MERGE				(1 << 12)
> +#define SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0			(2 << 12)
> +#define SEL_IN_DSI0_FROM_DSC_WRAP0_OUT				(0 << 16)
> +#define SEL_IN_DSI0_FROM_DISP_DITHER0				(1 << 16)
> +#define SEL_IN_DSI1_FROM_DSC_WRAP1_OUT				(0 << 17)
> +#define SEL_IN_DSI1_FROM_VPP_MERGE				(1 << 17)
> +#define SEL_IN_DISP_WDMA1_FROM_DISP_OVL1			(0 << 20)
> +#define SEL_IN_DISP_WDMA1_FROM_VPP_MERGE			(1 << 20)
> +#define SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN			(0 << 21)
> +#define SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1			(1 << 21)
> +#define SEL_IN_DISP_WDMA0_FROM_DISP_OVL0			(0 << 22)
> +#define SEL_IN_DISP_WDMA0_FROM_VPP_MERGE			(1 << 22)
> +
> +#define MT8195_VDO0_SEL_OUT					0xf38
> +#define SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN			(0 << 0)
> +#define SOUT_DISP_DITHER0_TO_DSI0				(1 << 0)
> +#define SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN			(0 << 1)
> +#define SOUT_DISP_DITHER1_TO_VPP_MERGE				(1 << 1)
> +#define SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT			(2 << 1)
> +#define SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE				(0 << 4)
> +#define SOUT_VDO1_VIRTUAL0_TO_DP_INTF0				(1 << 4)
> +#define SOUT_VPP_MERGE_TO_DSI1					(0 << 8)
> +#define SOUT_VPP_MERGE_TO_DP_INTF0				(1 << 8)
> +#define SOUT_VPP_MERGE_TO_SINA_VIRTUAL0				(2 << 8)
> +#define SOUT_VPP_MERGE_TO_DISP_WDMA1				(3 << 8)
> +#define SOUT_VPP_MERGE_TO_DSC_WRAP0_IN				(4 << 8)
> +#define SOUT_VPP_MERGE_TO_DSC_WRAP1_IN				(0 << 11)
> +#define SOUT_VPP_MERGE_TO_DISP_WDMA0				(1 << 11)
> +#define SOUT_DSC_WRAP0_OUT_TO_DSI0				(0 << 12)
> +#define SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0			(1 << 12)
> +#define SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE				(2 << 12)
> +#define SOUT_DSC_WRAP1_OUT_TO_DSI1				(0 << 16)
> +#define SOUT_DSC_WRAP1_OUT_TO_DP_INTF0				(1 << 16)
> +#define SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0			(2 << 16)
> +#define SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE				(3 << 16)
> +
> +#define MT8195_VDO1_VPP3_ASYNC_SOUT				0xf54
> +#define SOUT_TO_VPP_MERGE0_P0_SEL				(0 << 0)
> +#define SOUT_TO_VPP_MERGE0_P1_SEL				(1 << 0)
> +
> +#define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL			0xf40
> +#define SOUT_TO_HDR_VDO_FE0					(0 << 0)
> +
> +#define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL			0xf44
> +#define SOUT_TO_HDR_VDO_FE1					(0 << 0)
> +
> +#define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL			0xf48
> +#define SOUT_TO_HDR_GFX_FE0					(0 << 0)
> +
> +#define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL			0xf4c
> +#define SOUT_TO_HDR_GFX_FE1					(0 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN1_SOUT_SEL				0xf58
> +#define MIXER_IN1_SOUT_TO_DISP_MIXER				(0 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN2_SOUT_SEL				0xf5c
> +#define MIXER_IN2_SOUT_TO_DISP_MIXER				(0 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN3_SOUT_SEL				0xf60
> +#define MIXER_IN3_SOUT_TO_DISP_MIXER				(0 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN4_SOUT_SEL				0xf64
> +#define MIXER_IN4_SOUT_TO_DISP_MIXER				(0 << 0)
> +
> +#define MT8195_VDO1_MIXER_OUT_SOUT_SEL				0xf34
> +#define MIXER_SOUT_TO_HDR_VDO_BE0				(0 << 0)
> +
> +#define MT8195_VDO1_MERGE4_SOUT_SEL				0xf18
> +#define MERGE4_SOUT_TO_VDOSYS0					(0 << 0)
> +#define MERGE4_SOUT_TO_DPI0_SEL					(1 << 0)
> +#define MERGE4_SOUT_TO_DPI1_SEL					(2 << 0)
> +#define MERGE4_SOUT_TO_DP_INTF0_SEL				(3 << 0)
> +
> +#define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
> +#define VPP_MERGE0_P0_SEL_IN_FROM_SVPP2				(0 << 0)
> +#define VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0			(1 << 0)
> +
> +#define MT8195_VDO1_VPP_MERGE0_P1_SEL_IN			0xf08
> +#define VPP_MERGE0_P1_SEL_IN_FROM_SVPP3				(0 << 0)
> +#define VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1			(1 << 0)
> +
> +#define MT8195_VDO1_VPP_MERGE1_P0_SEL_IN			0xf3c
> +#define VPP_MERGE1_P0_SEL_IN_FROM_VPP3_ASYNC_SOUT		(0 << 0)
> +#define VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2			(1 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN1_SEL_IN				0xf24
> +#define MIXER_IN1_SEL_IN_FROM_HDR_VDO_FE0			(0 << 0)
> +#define MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT			(1 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN2_SEL_IN				0xf28
> +#define MIXER_IN2_SEL_IN_FROM_HDR_VDO_FE1			(0 << 0)
> +#define MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT			(1 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN3_SEL_IN				0xf2c
> +#define MIXER_IN3_SEL_IN_FROM_HDR_GFX_FE0			(0 << 0)
> +#define MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT			(1 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN4_SEL_IN				0xf30
> +#define MIXER_IN4_SEL_IN_FROM_HDR_GFX_FE1			(0 << 0)
> +#define MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT			(1 << 0)
> +
> +#define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
> +#define MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			(0 << 0)
> +#define MIXER_SOUT_SEL_IN_FROM_MIXER_IN1_SOUT			(1 << 0)
> +#define MIXER_SOUT_SEL_IN_FROM_MIXER_IN2_SOUT			(2 << 0)
> +#define MIXER_SOUT_SEL_IN_FROM_MIXER_IN3_SOUTR			(3 << 0)
> +#define MIXER_SOUT_SEL_IN_FROM_MIXER_IN4_SOUTR			(4 << 0)
> +
> +#define MT8195_VDO1_MERGE4_ASYNC_SEL_IN				0xf50
> +#define MERGE4_ASYNC_SEL_IN_FROM_HDR_VDO_BE0			(0 << 0)
> +#define MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT			(1 << 0)
> +#define MERGE4_ASYNC_SEL_IN_FROM_MERGE0_ASYNC_SOUT		(2 << 0)
> +#define MERGE4_ASYNC_SEL_IN_FROM_MERGE1_ASYNC_SOUT		(3 << 0)
> +#define MERGE4_ASYNC_SEL_IN_FROM_MERGE2_ASYNC_SOUT		(4 << 0)
> +#define MERGE4_ASYNC_SEL_IN_FROM_MERGE3_ASYNC_SOUT		(5 << 0)
> +
> +#define MT8195_VDO1_DISP_DPI0_SEL_IN				0xf0c
> +#define DISP_DPI0_SEL_IN_FROM_VPP_MERGE4_MOUT			(0 << 0)
> +#define DISP_DPI0_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT		(1 << 0)
> +#define DISP_DPI0_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT		(2 << 0)
> +
> +#define MT8195_VDO1_DISP_DPI1_SEL_IN				0xf10
> +#define DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT			(0 << 0)
> +#define DISP_DPI1_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT		(1 << 0)
> +#define DISP_DPI1_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT		(2 << 0)
> +
> +#define MT8195_VDO1_DISP_DP_INTF0_SEL_IN			0xf14
> +#define DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT		(0 << 0)
> +#define DISP_DP_INTF0_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT	(1 << 0)
> +#define DISP_DP_INTF0_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT	(2 << 0)
> +
> +static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		MT8195_VDO0_OVL_MOUT_EN, MOUT_DISP_OVL0_TO_DISP_RDMA0
> +	}, {
> +		DDP_COMPONENT_OVL1, DDP_COMPONENT_RDMA1,
> +		MT8195_VDO0_OVL_MOUT_EN, MOUT_DISP_OVL1_TO_DISP_RDMA1
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8195_VDO0_SEL_IN, SEL_IN_DSI0_FROM_DISP_DITHER0
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8195_VDO0_SEL_OUT, DDP_COMPONENT_DSI0
> +	}
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 080660ef11bf..1fb241750897 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -13,6 +13,7 @@
>  #include "mtk-mmsys.h"
>  #include "mt8167-mmsys.h"
>  #include "mt8183-mmsys.h"
> +#include "mt8195-mmsys.h"
>  
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>  	.clk_driver = "clk-mt2701-mm",
> @@ -52,6 +53,12 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
> +	.clk_driver = "clk-mt8195-vdo0",
> +	.routes = mmsys_mt8195_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +};
> +
>  struct mtk_mmsys {
>  	void __iomem *regs;
>  	const struct mtk_mmsys_driver_data *data;
> @@ -157,6 +164,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>  		.compatible = "mediatek,mt8183-mmsys",
>  		.data = &mt8183_mmsys_driver_data,
>  	},
> +	{
> +		.compatible = "mediatek,mt8195-vdosys0",
> +		.data = &mt8195_vdosys0_driver_data,
> +	},
>  	{ }
>  };
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
