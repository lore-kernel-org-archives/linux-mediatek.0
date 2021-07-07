Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABFFC07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 05:03:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A5DD619B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 05:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A5DD619B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kRRWFSNzbU4VImnro5hdZI7FKoXe6XGbB0xTGMGA2o=; b=Z5zM+2oLK/Mq53
	kl/CT2axbupCmjgkFtUhXGMcrvLmyhP0vn8RHEg4TK/Klc/5K6ixs3pdY/hWZy9cQZ6bbKoPPZrd4
	dnHvg5bQSR/c6mVg5Bbss4Hw1M4CrRWGK2+nm4hfjE+aG8ak+RufeBAVBqhwhBkSGf5mWP3DbTinf
	2aEon6tnNHJCnHHVCTtLlF47IYJLpXH32P4yr0IxGMfZi1P/p9S0qVE7c70u+Diit6mc8I1nSud9V
	NKzOgILpcGH7UYBekH6rt/D0o2BUT+g8WzbEKIQMyAoMFKGgdkl6cMNKRFNNJtYbXaHNOdfu0mgzA
	hI5tc4y+QngC79UPUvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ziA-00DU2U-8k; Wed, 07 Jul 2021 05:03:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0zi6-00DU1f-PZ; Wed, 07 Jul 2021 05:03:00 +0000
X-UUID: e8de5b6d8e9646f198195e1decbec5e1-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PlL17zWZa7NItS+LJmkQPJCiNyLOnLUofnkrVm3IwW0=; 
 b=SgiU5e4KRroGx/fbOT1EgptZLth/H7feMmaU3AwNawi98rpVwOZNi8yjsvNpOo7TOPbGepdcbT8AUYubUVWeiA8C8nbPQekFszfsEF7ez5KD6FEYjxjJvgDcvgHxQvD0bJVBvLg0LqyGkzccfIvNtl/2xtINPosnrcHuwEyMXM4=;
X-UUID: e8de5b6d8e9646f198195e1decbec5e1-20210706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2073492222; Tue, 06 Jul 2021 22:02:55 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 21:52:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 12:52:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 12:52:45 +0800
Message-ID: <1625633566.7824.8.camel@mtksdaap41>
Subject: Re: [PATCH v1 06/17] soc: mediatek: add mtk-mutex support for mt8195
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Wed, 7 Jul 2021 12:52:46 +0800
In-Reply-To: <20210707041249.29816-7-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-7-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_220258_896536_DD31887D 
X-CRM114-Status: GOOD (  18.66  )
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
> Add mtk-mutex support for mt8195.

Separate DRM part and SoC part into different patch.

Regards,
CK

> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |   2 +
>  drivers/soc/mediatek/mtk-mutex.c       | 105 +++++++++++++++++++++++--
>  2 files changed, 102 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 9074ce32912c..5b7ead493487 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -470,6 +470,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8183-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8195-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt2701-disp-pwm",
>  	  .data = (void *)MTK_DISP_BLS },
>  	{ .compatible = "mediatek,mt8173-disp-pwm",
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 2e4bcc300576..080bdabfb024 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -17,6 +17,9 @@
>  #define MT8183_MUTEX0_MOD0			0x30
>  #define MT8183_MUTEX0_SOF0			0x2c
>  
> +#define MT8195_DISP_MUTEX0_MOD0			0x30
> +#define MT8195_DISP_MUTEX0_SOF			0x2c
> +
>  #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
>  #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
>  #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
> @@ -67,6 +70,36 @@
>  #define MT8173_MUTEX_MOD_DISP_PWM1		24
>  #define MT8173_MUTEX_MOD_DISP_OD		25
>  
> +#define MT8195_MUTEX_MOD_DISP_OVL0		0
> +#define MT8195_MUTEX_MOD_DISP_WDMA0		1
> +#define MT8195_MUTEX_MOD_DISP_RDMA0		2
> +#define MT8195_MUTEX_MOD_DISP_COLOR0		3
> +#define MT8195_MUTEX_MOD_DISP_CCORR0		4
> +#define MT8195_MUTEX_MOD_DISP_AAL0		5
> +#define MT8195_MUTEX_MOD_DISP_GAMMA0		6
> +#define MT8195_MUTEX_MOD_DISP_DITHER0		7
> +#define MT8195_MUTEX_MOD_DISP_DSI0		8
> +#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0	9
> +#define MT8195_MUTEX_MOD_DISP_OVL1		10
> +#define MT8195_MUTEX_MOD_DISP_WDMA1		11
> +#define MT8195_MUTEX_MOD_DISP_RDMA1		12
> +#define MT8195_MUTEX_MOD_DISP_COLOR1		13
> +#define MT8195_MUTEX_MOD_DISP_CCORR1		14
> +#define MT8195_MUTEX_MOD_DISP_AAL1		15
> +#define MT8195_MUTEX_MOD_DISP_GAMMA1		16
> +#define MT8195_MUTEX_MOD_DISP_DITHER1		17
> +#define MT8195_MUTEX_MOD_DISP_DSI1		18
> +#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE1	19
> +#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		20
> +#define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
> +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY0	22
> +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY1	23
> +#define MT8195_MUTEX_MOD_DISP_VDO1_DL_RELAY2	24
> +#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY3	25
> +#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY4	26
> +#define MT8195_MUTEX_MOD_DISP_PWM0		27
> +#define MT8195_MUTEX_MOD_DISP_PWM1		28
> +
>  #define MT2712_MUTEX_MOD_DISP_PWM2		10
>  #define MT2712_MUTEX_MOD_DISP_OVL0		11
>  #define MT2712_MUTEX_MOD_DISP_OVL1		12
> @@ -101,11 +134,36 @@
>  #define MT2712_MUTEX_SOF_DSI3			6
>  #define MT8167_MUTEX_SOF_DPI0			2
>  #define MT8167_MUTEX_SOF_DPI1			3
> +
>  #define MT8183_MUTEX_SOF_DSI0			1
>  #define MT8183_MUTEX_SOF_DPI0			2
>  
> -#define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
> -#define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
> +#define MT8183_MUTEX_EOF_CONVERT(sof)	((sof) << 6)
> +#define MT8183_MUTEX_EOF_DSI0 \
> +	MT8183_MUTEX_EOF_CONVERT(MT8183_MUTEX_SOF_DSI0)
> +#define MT8183_MUTEX_EOF_DPI0 \
> +	MT8183_MUTEX_EOF_CONVERT(MT8183_MUTEX_SOF_DPI0)
> +
> +#define MT8195_MUTEX_SOF_DSI0			1
> +#define MT8195_MUTEX_SOF_DSI1			2
> +#define MT8195_MUTEX_SOF_DP_INTF0		3
> +#define MT8195_MUTEX_SOF_DP_INTF1		4
> +#define MT8195_MUTEX_SOF_DPI0			6 /* for HDMI_TX */
> +#define MT8195_MUTEX_SOF_DPI1			5 /* for digital video out */
> +
> +#define MT8195_MUTEX_EOF_CONVERT(sof)	((sof) << 7)
> +#define MT8195_MUTEX_EOF_DSI0 \
> +	MT8195_MUTEX_EOF_CONVERT(MT8195_MUTEX_SOF_DSI0)
> +#define MT8195_MUTEX_EOF_DSI1 \
> +	MT8195_MUTEX_EOF_CONVERT(MT8195_MUTEX_SOF_DSI1)
> +#define MT8195_MUTEX_EOF_DP_INTF0 \
> +	MT8195_MUTEX_EOF_CONVERT(MT8195_MUTEX_SOF_DP_INTF0)
> +#define MT8195_MUTEX_EOF_DP_INTF1 \
> +	MT8195_MUTEX_EOF_CONVERT(MT8195_MUTEX_SOF_DP_INTF1)
> +#define MT8195_MUTEX_EOF_DPI0 \
> +	MT8195_MUTEX_EOF_CONVERT(MT8195_MUTEX_SOF_DPI0)
> +#define MT8195_MUTEX_EOF_DPI1 \
> +	MT8195_MUTEX_EOF_CONVERT(MT8195_MUTEX_SOF_DPI1)
>  
>  struct mtk_mutex {
>  	int id;
> @@ -120,6 +178,9 @@ enum mtk_mutex_sof_id {
>  	MUTEX_SOF_DPI1,
>  	MUTEX_SOF_DSI2,
>  	MUTEX_SOF_DSI3,
> +	MUTEX_SOF_DP_INTF0,
> +	MUTEX_SOF_DP_INTF1,
> +	DDP_MUTEX_SOF_MAX,
>  };
>  
>  struct mtk_mutex_data {
> @@ -214,7 +275,20 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
>  };
>  
> -static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_OVL0] = MT8195_MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_WDMA0] = MT8195_MUTEX_MOD_DISP_WDMA0,
> +	[DDP_COMPONENT_RDMA0] = MT8195_MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_COLOR0] = MT8195_MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_CCORR] = MT8195_MUTEX_MOD_DISP_CCORR0,
> +	[DDP_COMPONENT_AAL0] = MT8195_MUTEX_MOD_DISP_AAL0,
> +	[DDP_COMPONENT_GAMMA] = MT8195_MUTEX_MOD_DISP_GAMMA0,
> +	[DDP_COMPONENT_DITHER] = MT8195_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
> +	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
> +};
> +
> +static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
>  	[MUTEX_SOF_DSI1] = MUTEX_SOF_DSI1,
> @@ -224,7 +298,7 @@ static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  	[MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
>  };
>  
> -static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +static const unsigned int mt8167_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
>  	[MUTEX_SOF_DPI0] = MT8167_MUTEX_SOF_DPI0,
> @@ -232,12 +306,24 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  };
>  
>  /* Add EOF setting so overlay hardware can receive frame done irq */
> -static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +static const unsigned int mt8183_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
>  	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
>  };
>  
> +static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
> +	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> +	[MUTEX_SOF_DSI0] = MT8195_MUTEX_SOF_DSI0 | MT8195_MUTEX_EOF_DSI0,
> +	[MUTEX_SOF_DSI1] = MT8195_MUTEX_SOF_DSI1 | MT8195_MUTEX_EOF_DSI1,
> +	[MUTEX_SOF_DPI0] = MT8195_MUTEX_SOF_DPI0 | MT8195_MUTEX_EOF_DPI0,
> +	[MUTEX_SOF_DPI1] = MT8195_MUTEX_SOF_DPI1 | MT8195_MUTEX_EOF_DPI1,
> +	[MUTEX_SOF_DP_INTF0] =
> +		MT8195_MUTEX_SOF_DP_INTF0 | MT8195_MUTEX_EOF_DP_INTF0,
> +	[MUTEX_SOF_DP_INTF1] =
> +		MT8195_MUTEX_SOF_DP_INTF1 | MT8195_MUTEX_EOF_DP_INTF1,
> +};
> +
>  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
>  	.mutex_mod = mt2701_mutex_mod,
>  	.mutex_sof = mt2712_mutex_sof,
> @@ -275,6 +361,13 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
>  	.no_clk = true,
>  };
>  
> +static const struct mtk_mutex_data mt8195_mutex_driver_data = {
> +	.mutex_mod = mt8195_mutex_mod,
> +	.mutex_sof = mt8195_mutex_sof,
> +	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
> +};
> +
>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  {
>  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -507,6 +600,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>  	  .data = &mt8173_mutex_driver_data},
>  	{ .compatible = "mediatek,mt8183-disp-mutex",
>  	  .data = &mt8183_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8195-disp-mutex",
> +	  .data = &mt8195_mutex_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
