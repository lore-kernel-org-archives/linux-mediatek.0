Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45130C07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 04:46:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D20E2613E5
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 04:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D20E2613E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/2sg4OyXLd6IMZT38xCeTma//2E+WfSHJdSZKd2K18=; b=LnLGxga9sfVfh8
	AI1nmXXwqeV3PCc+nlAbjllw2eyvgZyTnEtfb0pIdN5FUFjDdDRtVqoaLP0GxQXHHgOVSJGE547Oe
	KfkXkeiQfC5Og0Z4o5ASoAzhijaY0qo1RFZMJCV8nfsFX5FYhMefH5uVobxjyf34I2nrzfBiy873y
	ddbGwkEIR1RwQQcVVPLNBRqOv1kcCAwuyzAYxpp2CVuelXgwE2feEh8DPb2j8vPyjYOoSOsEQhkEt
	wJPUMf9IFqsx8NRF0je9ySP02gD+fyY1VRpYe8PirkLEO9FtxAkS3IU+R6rQj6N+ARTGQ+dhyAP4o
	RPO6VZuMZG8ichUOyRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Fjj-0037MN-Mp; Fri, 16 Jul 2021 04:46:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Fjc-0037Ls-VH; Fri, 16 Jul 2021 04:46:06 +0000
X-UUID: 0317575186e142df93e4c5662788a9ff-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wLKmh8zk/nyYJad3KUfmczETifE4w6Fc2ueS7USeviI=; 
 b=HmHnz2lGzKok8h956O8STDi331aFlKive81IKcqh36IDJco57eVOUfjrZlXWBq6GUoZ9CDVk5NGssrqhnhYaoBDv9NAUGsgyP7CyO8WY3tf4Mf/ZS/QkO8ktDKeJi9470/gYr7yc8PZKqBfXNQIy/pV1ftvULzyqQJyLfftwzFA=;
X-UUID: 0317575186e142df93e4c5662788a9ff-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 455003921; Thu, 15 Jul 2021 21:45:58 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 21:35:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 12:35:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 12:35:54 +0800
Message-ID: <1626410153.26010.1.camel@mtksdaap41>
Subject: Re: [PATCH v3 10/12] drm/mediatek: add mediatek-drm of vdosys0
 support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Fri, 16 Jul 2021 12:35:53 +0800
In-Reply-To: <20210715173750.10852-11-jason-jh.lin@mediatek.com>
References: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
 <20210715173750.10852-11-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_214602_462151_2FCAA3E4 
X-CRM114-Status: GOOD (  15.71  )
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

On Fri, 2021-07-16 at 01:37 +0800, jason-jh.lin wrote:
> Add driver data of mt8195 vdosys0 to mediatek-drm and the sub driver.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  6 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 24 ++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 728aaadfea8c..00e9827acefe 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -355,6 +355,10 @@ static const struct mtk_disp_rdma_data mt8183_rdma_driver_data = {
>  	.fifo_size = 5 * SZ_1K,
>  };
>  
> +static const struct mtk_disp_rdma_data mt8195_rdma_driver_data = {
> +	.fifo_size = 1920,
> +};
> +
>  static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
>  	{ .compatible = "mediatek,mt2701-disp-rdma",
>  	  .data = &mt2701_rdma_driver_data},
> @@ -362,6 +366,8 @@ static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
>  	  .data = &mt8173_rdma_driver_data},
>  	{ .compatible = "mediatek,mt8183-disp-rdma",
>  	  .data = &mt8183_rdma_driver_data},
> +	{ .compatible = "mediatek,mt8195-disp-rdma",
> +	  .data = &mt8195_rdma_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index b46bdb8985da..d6f6d1bdad85 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -147,6 +147,19 @@ static const enum mtk_ddp_comp_id mt8183_mtk_ddp_ext[] = {
>  	DDP_COMPONENT_DPI0,
>  };
>  
> +static const enum mtk_ddp_comp_id mt8195_mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_CCORR,
> +	DDP_COMPONENT_AAL0,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_DITHER,
> +	DDP_COMPONENT_DSC0,
> +	DDP_COMPONENT_MERGE0,
> +	DDP_COMPONENT_DP_INTF0,

Where is the dp_intf sub driver in this series?

Regards,
CK

> +};
> +
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>  	.main_path = mt2701_mtk_ddp_main,
>  	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> @@ -186,6 +199,11 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>  	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
> +	.main_path = mt8195_mtk_ddp_main,
> +	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
> +};
> +
>  static int mtk_drm_kms_init(struct drm_device *drm)
>  {
>  	struct mtk_drm_private *private = drm->dev_private;
> @@ -410,6 +428,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_RDMA },
>  	{ .compatible = "mediatek,mt8183-disp-rdma",
>  	  .data = (void *)MTK_DISP_RDMA },
> +	{ .compatible = "mediatek,mt8195-disp-rdma",
> +	  .data = (void *)MTK_DISP_RDMA },
>  	{ .compatible = "mediatek,mt8173-disp-wdma",
>  	  .data = (void *)MTK_DISP_WDMA },
>  	{ .compatible = "mediatek,mt8183-disp-ccorr",
> @@ -448,6 +468,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8183-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8195-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt2701-disp-pwm",
>  	  .data = (void *)MTK_DISP_BLS },
>  	{ .compatible = "mediatek,mt8173-disp-pwm",
> @@ -468,6 +490,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
>  	  .data = &mt8173_mmsys_driver_data},
>  	{ .compatible = "mediatek,mt8183-mmsys",
>  	  .data = &mt8183_mmsys_driver_data},
> +	{.compatible = "mediatek,mt8195-vdosys0",
> +	  .data = &mt8195_vdosys0_driver_data},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
