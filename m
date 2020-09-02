Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65169C433E7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 14:25:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F3B120773
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 14:25:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G4ZCeJZ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F3B120773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vw4MQ4XtGuuiNCpOxSZfC5oGZ0zvdIw50PW0B6SCndc=; b=G4ZCeJZ8kiAuUnnOQoFE4487Z
	2mHndDrFNfQtwX6jEfaQubAsKXMIfWKfLOHAAmauh5As8j9FsM7MbTZLp1bp/XGkmVVA1klyFhGt3
	1S7UX6Lv8nZ2Ectk/Cf4OZ1g9m4S0ewyf5/TEuWwY8UEhTPMHr+bgVFsfPIMX8MKqIQAyCkXLNwI8
	Aw4r32pZ8OgGMo3TglMHKhkG+wW/A49DvM9X1QjPYONIH3hymSlm7zTi0GQF5xgWniVmJbcxrFiyI
	xq5aZsvhuZsIvFPN/lIGGBxYIBz9elmEABLxZQxSkyxpbOfv81Sg9dlWvKbrAiuBYKrtTVls97P4O
	nN6Q4k/FA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDThj-0007Cv-EQ; Wed, 02 Sep 2020 14:25:39 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDThf-0007CH-7S; Wed, 02 Sep 2020 14:25:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9D82101E;
 Wed,  2 Sep 2020 07:25:30 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E31933F71F;
 Wed,  2 Sep 2020 07:25:28 -0700 (PDT)
Subject: Re: [PATCH] media: mtk-vcodec: set dma max segment size
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org
References: <20200821041414.1560707-1-hsinyi@chromium.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <f8c5b7e0-66a2-7ec6-041f-82679a863758@arm.com>
Date: Wed, 2 Sep 2020 15:25:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200821041414.1560707-1-hsinyi@chromium.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_102535_355616_C27B69DB 
X-CRM114-Status: GOOD (  20.79  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Anand K Mistry <amistry@chromium.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-21 05:14, Hsin-Yi Wang wrote:
> Set dma max segment size for encoder and decoder driver.
> 
> Fix following warning with CONFIG_DMA_API_DEBUG_SG=y
> 
> [   75.147825] ------------[ cut here ]------------
> [   75.147844] mtk-vcodec-enc 19002000.vcodec: DMA-API: mapping sg segment longer than device claims to support [len=983040] [max=65536]
> [   75.147876] WARNING: CPU: 2 PID: 4069 at kernel/dma/debug.c:1302 debug_dma_map_sg+0x1a8/0x2c4
> ...
> [   75.148139] Call trace:
> [   75.148149]  debug_dma_map_sg+0x1a8/0x2c4
> [   75.148165]  vb2_dc_get_userptr+0x228/0x364 [videobuf2_dma_contig]
> [   75.148178]  __buf_prepare+0x3ac/0x8c0 [videobuf2_common]
> [   75.148188]  vb2_core_qbuf+0xa4/0x58c [videobuf2_common]
> [   75.148199]  vb2_qbuf+0x88/0xe4 [videobuf2_v4l2]
> [   75.148211]  v4l2_m2m_qbuf+0x80/0xf8 [v4l2_mem2mem]
> [   75.148221]  vidioc_venc_qbuf+0x3c/0x70 [mtk_vcodec_enc]
> [   75.148234]  v4l_qbuf+0x48/0x58
> [   75.148242]  __video_do_ioctl+0x200/0x37c
> [   75.148250]  video_usercopy+0x360/0x834
> [   75.148259]  video_ioctl2+0x38/0x48
> [   75.148267]  v4l2_ioctl+0x6c/0x80
> [   75.148276]  do_video_ioctl+0xefc/0x4b70
> [   75.148284]  v4l2_compat_ioctl32+0x5c/0xcc
> [   75.148294]  __arm64_compat_sys_ioctl+0xf4/0x240
> [   75.148304]  el0_svc_common+0xac/0x198
> [   75.148312]  el0_svc_compat_handler+0x2c/0x40
> [   75.148321]  el0_svc_compat+0x8/0x18
> [   75.148328] irq event stamp: 0
> [   75.148337] hardirqs last  enabled at (0): [<0000000000000000>]           (null)
> [   75.148347] hardirqs last disabled at (0): [<ffffff90080e65c0>] copy_process+0x380/0x115c
> [   75.148356] softirqs last  enabled at (0): [<ffffff90080e65d8>] copy_process+0x398/0x115c
> [   75.148364] softirqs last disabled at (0): [<0000000000000000>]           (null)
> [   75.148372] ---[ end trace 588bf529451e3531 ]---
> 
> Reported-by: Anand K Mistry <amistry@chromium.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 8 ++++++++
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 8 ++++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 97a1b6664c20..3bbd0bac56d6 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -242,6 +242,14 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   		mtk_v4l2_err("[VPU] vpu device in not ready");
>   		return -EPROBE_DEFER;
>   	}
> +	if (!pdev->dev.dma_parms) {
> +		pdev->dev.dma_parms = devm_kzalloc(&pdev->dev,
> +						sizeof(*pdev->dev.dma_parms),
> +						GFP_KERNEL);
> +		if (!pdev->dev.dma_parms)
> +			return -ENOMEM;
> +	}

Since 9495b7e92f71, dma_parms is included in the platform_device itself 
and always set, so you can drop these allocation paths.

> +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));

The segment size is simply a size, not a bitmask, so UINT_MAX would be 
more semantically appropriate.

Robin.

>   	vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_dec_reset_handler,
>   			dev, VPU_RST_DEC);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 4d31f1ed113f..ff4a87485d69 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -249,6 +249,14 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   		mtk_v4l2_err("[VPU] vpu device in not ready");
>   		return -EPROBE_DEFER;
>   	}
> +	if (!pdev->dev.dma_parms) {
> +		pdev->dev.dma_parms = devm_kzalloc(&pdev->dev,
> +						sizeof(*pdev->dev.dma_parms),
> +						GFP_KERNEL);
> +		if (!pdev->dev.dma_parms)
> +			return -ENOMEM;
> +	}
> +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>   
>   	vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_enc_reset_handler,
>   				dev, VPU_RST_ENC);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
