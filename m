Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3F3C38142
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 15:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDLPfcgb27zqEQ5bTGG0tGIbIT0CsvUk7CGZvgPlU+A=; b=jeoKe4sqzabR8jPd+U5KUZJ/tL
	3wRCQp2NCLOOb+lETzDxazb/QkRaeK+Om+09V8BchUfXBPFrQuwQwIuRz+rygH71cr83TrBCIaZQf
	o4cBfLTyFKLo5PEft/fgPatayC64EKUfEPu5RmxM1Up2s2IZaHhU/+IcWo/tKzkY8aaiqTq9vEljA
	HAMiSMXubfPLLINWon7s0EQ+zqIG0cXlQfuEJ8jX6PxxcUeFZdXYIyRjeNFH2wB1YOqn7eyqxMaAw
	9hYPsFvdtNyEr57h4HKt2dofhEwmCM0pxKRt1O2fLN8cY70kcZfmVQ7frMV8LNVHGd9uKYjRhJnym
	qVR4LeDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyKI-00036i-7x; Mon, 23 Jan 2023 15:01:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyKF-00035u-Bm
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 15:01:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BF12BB80DDA;
	Mon, 23 Jan 2023 15:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FE9C433D2;
	Mon, 23 Jan 2023 15:01:30 +0000 (UTC)
Message-ID: <068ee5ec-6863-2c1d-39a9-b18156d4e57d@xs4all.nl>
Date: Mon, 23 Jan 2023 16:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 02/12] media: platform: mtk-mdp3: add chip
 configuration header file
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230113064104.22402-1-moudy.ho@mediatek.com>
 <20230113064104.22402-3-moudy.ho@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230113064104.22402-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_070135_718721_1AA286D5 
X-CRM114-Status: GOOD (  21.97  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13/01/2023 07:40, Moudy Ho wrote:
> In order to be compatible with more MDP3 chip settings in the future,
> move the chip-related configuration to a separate header file.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../mediatek/mdp3/mt8183/mdp3-plat-mt8183.h   | 35 +++++++++++++++++++
>  .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 27 ++------------
>  2 files changed, 37 insertions(+), 25 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h b/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
> new file mode 100644
> index 000000000000..3084f62e7df5
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MDP3_PLAT_MT8183_H__
> +#define __MDP3_PLAT_MT8183_H__
> +
> +static const struct mdp_platform_config mt8183_plat_cfg = {
> +	.rdma_support_10bit		= true,
> +	.rdma_rsz1_sram_sharing		= true,
> +	.rdma_upsample_repeat_only	= true,
> +	.rsz_disable_dcm_small_sample	= false,
> +	.wrot_filter_constraint		= false,
> +};
> +
> +static const struct of_device_id mt8183_mdp_probe_infra[MDP_INFRA_MAX] = {
> +	[MDP_INFRA_MMSYS] = { .compatible = "mediatek,mt8183-mmsys" },
> +	[MDP_INFRA_MUTEX] = { .compatible = "mediatek,mt8183-disp-mutex" },
> +	[MDP_INFRA_SCP] = { .compatible = "mediatek,mt8183-scp" }
> +};
> +
> +static const u32 mt8183_mutex_idx[MDP_MAX_COMP_COUNT] = {
> +	[MDP_COMP_RDMA0] = MUTEX_MOD_IDX_MDP_RDMA0,
> +	[MDP_COMP_RSZ0] = MUTEX_MOD_IDX_MDP_RSZ0,
> +	[MDP_COMP_RSZ1] = MUTEX_MOD_IDX_MDP_RSZ1,
> +	[MDP_COMP_TDSHP0] = MUTEX_MOD_IDX_MDP_TDSHP0,
> +	[MDP_COMP_WROT0] = MUTEX_MOD_IDX_MDP_WROT0,
> +	[MDP_COMP_WDMA] = MUTEX_MOD_IDX_MDP_WDMA,
> +	[MDP_COMP_AAL0] = MUTEX_MOD_IDX_MDP_AAL0,
> +	[MDP_COMP_CCORR0] = MUTEX_MOD_IDX_MDP_CCORR0,
> +};

I am really not keen on storing variable declarations in a header. This belongs
in a source.

What you typically do is put this in a source together with the declaration
of the mt8183_mdp_driver_data struct for the chip config, and just export that
top-level struct as an extern.

An example of how to do this is drivers/media/platform/verisilicon/imx8m_vpu_hw.c.

Regards,

	Hans

> +
> +#endif  /* __MDP3_PLAT_MT8183_H__ */
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 2d1f6ae9f080..658037d06250 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -12,33 +12,10 @@
>  #include <linux/remoteproc.h>
>  #include <linux/remoteproc/mtk_scp.h>
>  #include <media/videobuf2-dma-contig.h>
> +
>  #include "mtk-mdp3-core.h"
>  #include "mtk-mdp3-m2m.h"
> -
> -static const struct mdp_platform_config mt8183_plat_cfg = {
> -	.rdma_support_10bit		= true,
> -	.rdma_rsz1_sram_sharing		= true,
> -	.rdma_upsample_repeat_only	= true,
> -	.rsz_disable_dcm_small_sample	= false,
> -	.wrot_filter_constraint		= false,
> -};
> -
> -static const struct of_device_id mt8183_mdp_probe_infra[MDP_INFRA_MAX] = {
> -	[MDP_INFRA_MMSYS] = { .compatible = "mediatek,mt8183-mmsys" },
> -	[MDP_INFRA_MUTEX] = { .compatible = "mediatek,mt8183-disp-mutex" },
> -	[MDP_INFRA_SCP] = { .compatible = "mediatek,mt8183-scp" }
> -};
> -
> -static const u32 mt8183_mutex_idx[MDP_MAX_COMP_COUNT] = {
> -	[MDP_COMP_RDMA0] = MUTEX_MOD_IDX_MDP_RDMA0,
> -	[MDP_COMP_RSZ0] = MUTEX_MOD_IDX_MDP_RSZ0,
> -	[MDP_COMP_RSZ1] = MUTEX_MOD_IDX_MDP_RSZ1,
> -	[MDP_COMP_TDSHP0] = MUTEX_MOD_IDX_MDP_TDSHP0,
> -	[MDP_COMP_WROT0] = MUTEX_MOD_IDX_MDP_WROT0,
> -	[MDP_COMP_WDMA] = MUTEX_MOD_IDX_MDP_WDMA,
> -	[MDP_COMP_AAL0] = MUTEX_MOD_IDX_MDP_AAL0,
> -	[MDP_COMP_CCORR0] = MUTEX_MOD_IDX_MDP_CCORR0,
> -};
> +#include "mt8183/mdp3-plat-mt8183.h"
>  
>  static const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
>  	.mdp_probe_infra = mt8183_mdp_probe_infra,


