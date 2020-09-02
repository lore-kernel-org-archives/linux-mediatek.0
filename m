Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704B2C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 12:30:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A5B620758
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 12:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tyt+LoqA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WQH2h9V/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A5B620758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qok5YVGprNBwN0Px8IMdVkcG6gj24ieCUhiCHxh5eUs=; b=tyt+LoqA+G87Ois29H4vT00S3
	wmmUoMm/xT+g+LsJADR0mhtptgLEinYJ0z/XMxcwvd4zYr4pUcCGu5AYvUaZ/qIjme7J/OcrWTSV6
	qjGHNhl87Tpy6JgZxa574gEJEQ4MTwjcGBNl2Beybe8upfoodtZVAPZhOYjAVwmgM4fMTKZd+KI/8
	7o3pmqURm3nen10DWBzGwgNNGrV3rOyBfcwBvK6pHS/TS9kiVInK252xy2zpTe0upOrn/xEHf/on8
	d7lYrC+SFjzCnxBRZqjWhduWNI0d/mVveixJQEnWLsGPr0BMYdWcHjs8iPjSE4MXnkNgfe3H4/SrZ
	s6ANa9Qfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDRuK-0002L0-Dt; Wed, 02 Sep 2020 12:30:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDRuG-0002JR-Fl; Wed, 02 Sep 2020 12:30:29 +0000
X-UUID: 12578712a3e64b23af55eb6453a90a10-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZtjJKtZNAVuZVOOlw4wrd3u0b/ydDS0OmQrA7mmZt64=; 
 b=WQH2h9V/SoJ0o8LoWpTXrzLicqG7ZRxrmRTMlxpN1Gniwc+5xbhPJJXm6EORjCSMT2+CaVTJC7ouefkuT0lvGOjPixhCsxEX7+IXm4YyQbN7cexa/0MxrwohtcCDhsdGmTChYuKWo0sFPAYh5gnEH4XDC6wEQf/jgJEuLJBkcxs=;
X-UUID: 12578712a3e64b23af55eb6453a90a10-20200902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 464369658; Wed, 02 Sep 2020 04:30:22 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 05:30:20 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 2 Sep 2020 20:30:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Sep 2020 20:30:16 +0800
Message-ID: <1599049719.25072.4.camel@mhfsdcap03>
Subject: Re: [PATCH] media: mtk-vcodec: set dma max segment size
From: Irui Wang <irui.wang@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 2 Sep 2020 20:28:39 +0800
In-Reply-To: <20200821041414.1560707-1-hsinyi@chromium.org>
References: <20200821041414.1560707-1-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 88726D815BBC0380A972E320C447704F65376A421771C015CAE967C03689FAF22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_083028_655974_018F526D 
X-CRM114-Status: GOOD (  17.93  )
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
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Anand K Mistry <amistry@chromium.org>, Yunfei Dong <Yunfei.Dong@mediatek.com>,
 linux-kernel@vger.kernel.org, Maoguang Meng <maoguang.meng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Hsin-Yi,

because this Warning is occured with config CONFIG_DMA_API_DEBUG_SG=y,
how about add these modifications with this configuration as well?

On Fri, 2020-08-21 at 12:14 +0800, Hsin-Yi Wang wrote:
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
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 8 ++++++++
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 97a1b6664c20..3bbd0bac56d6 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -242,6 +242,14 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  		mtk_v4l2_err("[VPU] vpu device in not ready");
>  		return -EPROBE_DEFER;
>  	}
> +	if (!pdev->dev.dma_parms) {
> +		pdev->dev.dma_parms = devm_kzalloc(&pdev->dev,
> +						sizeof(*pdev->dev.dma_parms),
> +						GFP_KERNEL);
> +		if (!pdev->dev.dma_parms)
> +			return -ENOMEM;
> +	}
> +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>  
>  	vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_dec_reset_handler,
>  			dev, VPU_RST_DEC);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 4d31f1ed113f..ff4a87485d69 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -249,6 +249,14 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  		mtk_v4l2_err("[VPU] vpu device in not ready");
>  		return -EPROBE_DEFER;
>  	}
> +	if (!pdev->dev.dma_parms) {
> +		pdev->dev.dma_parms = devm_kzalloc(&pdev->dev,
> +						sizeof(*pdev->dev.dma_parms),
> +						GFP_KERNEL);
> +		if (!pdev->dev.dma_parms)
> +			return -ENOMEM;
> +	}
> +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>  
>  	vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_enc_reset_handler,
>  				dev, VPU_RST_ENC);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
