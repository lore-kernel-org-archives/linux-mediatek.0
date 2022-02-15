Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F28EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRgXE1rEYBSaCxNlH8kElkYrSs53cXeP9+uWJ32mR9A=; b=0b2fPuL8OxFCaR
	umYTbpVjwGuIyRiK7elhH+vLx/2fPL6Va508Qf4p8ZXIFOxab4PPS6QWqtVfXaJHoOmBCU5zOmqXb
	IbaA7l6blMzD/cAFH5XmdQ3k20B72BTajQKjJyefYVb/1LgsNOkqbzvdYs1D52gRpazQjW9Typ6Bl
	Va8YNbHD3wgT1S5osusWk1l0FROBPkllPTcTSliHRspfm/CEcVODUTvyLEM7ESTJaw/x1Jcg5VAJl
	Xs+4DrfCi/Bp5MV4ImIbLJT7VN9v8XH32jhPOkzX2+dYsPSm6N6Q1WyHTEePL2xPNQvQowKv2IsYI
	uk24CfGl/OoKb2xxoPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJyIS-002v87-JC; Tue, 15 Feb 2022 13:55:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJyID-002v4P-VK; Tue, 15 Feb 2022 13:55:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 57EDF1F44A2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644933296;
 bh=rhLKPavogy4229Ih++6dC1Fw+vvxjg8moyVEEB6fzwI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D2v2T3izIRsTe3TSERHpecE98t1Axt7AuUXaZGywAcYlR6yvxkP2KcmKP3ns5RqE7
 2UPxsE2hyNyulyUVHRjRUQr7N5naVk2doVlYjA8thMvpTaJIm3+dD5yVSsHo0HM7Bq
 oSqdxkCboiZx2TM97W2Ajh+VmI/hoUCmTwtxQdGRBR/vdVETtpQG5duo+ecANQp8uB
 Kw9VvHkb/REgQSgc9lmqV+E0x8By7ob9dEMnWvfvKFQshNUfv62beOPyN/A+VQeSEj
 m1R8aT1bmVyeSuQH+G3mwY9m8qMJIyZhI7ftLIjYGMcBjAfDQlU50tuz1SOXYQTqha
 rg8dGT46OqofA==
Message-ID: <da4b7285-1f2d-01a0-9a1d-1381b4772512@collabora.com>
Date: Tue, 15 Feb 2022 14:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [1/2] soc: mediatek: mmsys: add sw0_rst_offset in mmsys driver
 data
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, matthias.bgg@gmail.com
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220215131952.27861-1-rex-bc.chen@mediatek.com>
 <20220215131952.27861-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220215131952.27861-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_055458_204865_5D7C5704 
X-CRM114-Status: GOOD (  18.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/02/22 14:19, Rex-BC Chen ha scritto:
> There are different software reset registers for difference MTK SoCs.
> Therefore, we add a new variable "sw0_rst_offset" to control it.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8183-mmsys.h | 2 ++
>   drivers/soc/mediatek/mtk-mmsys.c    | 6 ++++--
>   drivers/soc/mediatek/mtk-mmsys.h    | 3 +--
>   3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mt8183-mmsys.h b/drivers/soc/mediatek/mt8183-mmsys.h
> index 9dee485807c9..0c021f4b76d2 100644
> --- a/drivers/soc/mediatek/mt8183-mmsys.h
> +++ b/drivers/soc/mediatek/mt8183-mmsys.h
> @@ -25,6 +25,8 @@
>   #define MT8183_RDMA0_SOUT_COLOR0		0x1
>   #define MT8183_RDMA1_SOUT_DSI0			0x1
>   
> +#define MT8183_MMSYS_SW0_RST_B			0x140
> +
>   static const struct mtk_mmsys_routes mmsys_mt8183_routing_table[] = {
>   	{
>   		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 0da25069ffb3..cab62c3eac05 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -49,12 +49,14 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8173-mm",
>   	.routes = mmsys_default_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> +	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
>   };
>   
>   static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8183-mm",
>   	.routes = mmsys_mt8183_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> +	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
>   };
>   
>   static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
> @@ -128,14 +130,14 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
>   
>   	spin_lock_irqsave(&mmsys->lock, flags);
>   
> -	reg = readl_relaxed(mmsys->regs + MMSYS_SW0_RST_B);
> +	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
>   
>   	if (assert)
>   		reg &= ~BIT(id);
>   	else
>   		reg |= BIT(id);
>   
> -	writel_relaxed(reg, mmsys->regs + MMSYS_SW0_RST_B);
> +	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
>   
>   	spin_unlock_irqrestore(&mmsys->lock, flags);
>   
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
> index 8b0ed05117ea..83320019b4cf 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -78,8 +78,6 @@
>   #define DSI_SEL_IN_RDMA				0x1
>   #define DSI_SEL_IN_MASK				0x1
>   
> -#define MMSYS_SW0_RST_B				0x140
> -
>   struct mtk_mmsys_routes {
>   	u32 from_comp;
>   	u32 to_comp;
> @@ -92,6 +90,7 @@ struct mtk_mmsys_driver_data {
>   	const char *clk_driver;
>   	const struct mtk_mmsys_routes *routes;
>   	const unsigned int num_routes;
> +	const unsigned int sw0_rst_offset;

I don't think that this offset will ever be larger than 0xffff.
Can we use u16 here instead?

>   };
>   
>   /*




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
