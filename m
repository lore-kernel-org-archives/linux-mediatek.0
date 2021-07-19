Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDD7C12002
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 10:12:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3861608FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 10:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3861608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYRrVGiPq4eBMrvolJqw/uQWUS4COAGwKVlFhKoE7bY=; b=y2dpUtie/EEStdvdnS0A3qFwzW
	FuEpkjEbFm2Yiv0lCJoqJ8oyQIhaEqpnF4pLVh84vFWHMNAGLgVsikyJXJ/UxJ3UlZTU/EHX5HEXw
	zq2WeAUc34fURfx+L9k/qeNWUaaSUyRlm4K63YVwUkMBmCl5HplXOfdDSGu3D/xjZyaQnP2XqdYmy
	eMoSSHzIiyTJl0O5QbEmq3HVFL4nAD5Ws+V4AT3uKZL2gxpV8Z3e3J2ki6/Qhqo/RkH00tQPdolmg
	DVwljGFFkMWeuy8k7P/SNiUJ9uq9C+RxYkvZ/JducOQjNnnNCfGH7B+9MdMtQpiNyQXIn54OKrpmT
	R3fGmEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5QFe-009Dw9-Dr; Mon, 19 Jul 2021 10:11:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5QF0-009DiJ-Bt; Mon, 19 Jul 2021 10:11:16 +0000
Received: from [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc] (unknown
 [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 609391F4248F;
 Mon, 19 Jul 2021 11:11:12 +0100 (BST)
Subject: Re: [PATCH v2, 10/14] media: mtk-vcodec: Add core thread
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Collabora Kernel ML <kernel@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
 <20210717081233.7809-11-yunfei.dong@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <6bcb5964-0afa-f3c3-a80e-c34ef26eea4b@collabora.com>
Date: Mon, 19 Jul 2021 12:11:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717081233.7809-11-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_031114_731149_6D8D32AC 
X-CRM114-Status: GOOD (  28.74  )
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



On 17.07.21 10:12, Yunfei Dong wrote:
> Core thread:
> 1. Gets lat_buf from core msg queue.
> 2. Proceeds core decode.
> 3. Puts the lat_buf back to lat msg queue.
> 
> Both H264 and VP9 rely on the core thread.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v2: no changes
> ---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 ++++
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 ++
>   .../platform/mtk-vcodec/vdec_msg_queue.c      | 32 +++++++++++++++++++
>   .../platform/mtk-vcodec/vdec_msg_queue.h      |  6 ++++
>   4 files changed, 47 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 078daeeff576..e05224aca888 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -437,6 +437,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   		goto err_res;
>   	}
>   
> +	if (VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
> +		vdec_msg_queue_init_ctx(&dev->core_ctx, MTK_VDEC_CORE);
> +		dev->kthread_core = kthread_run(vdec_msg_queue_core_thead, dev,
> +			"mtk-%s", "core");

why would we want to run this thread when probing?
also, don't we need to check errors?

> +	}
> +
>   	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
>   		mutex_init(&dev->dec_mutex[i]);
>   	mutex_init(&dev->dev_mutex);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 9207ce079960..3beba0e2ea91 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -32,6 +32,7 @@
>   #define MTK_VCODEC_MAX_PLANES	3
>   #define MTK_V4L2_BENCHMARK	0
>   #define WAIT_INTR_TIMEOUT_MS	1000
> +#define VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
>   
>   /*
>    * enum mtk_hw_reg_idx - MTK hw register base index
> @@ -480,6 +481,7 @@ struct mtk_vcodec_enc_pdata {
>    * @component_node: component node
>    * @comp_idx: component index
>    *
> + * @kthread_core: thread used for core hardware decode
>    * @core_ctx: core queue context
>    */
>   struct mtk_vcodec_dev {
> @@ -524,6 +526,7 @@ struct mtk_vcodec_dev {
>   	struct device_node *component_node[MTK_VDEC_HW_MAX];
>   	int comp_idx;
>   
> +	struct task_struct *kthread_core;
>   	struct vdec_msg_queue_ctx core_ctx;
>   };
>   
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> index 016a70416e55..60bc3796bb58 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> @@ -252,3 +252,35 @@ void vdec_msg_queue_deinit(
>   			kfree(lat_buf->private_data);
>   	}
>   }
> +
> +int vdec_msg_queue_core_thead(void *data)
> +{
> +	struct mtk_vcodec_dev *dev = data;
> +	struct vdec_lat_buf *lat_buf;
> +	struct mtk_vcodec_ctx *ctx;
> +
> +	set_freezable();
> +	for (;;) {
> +		try_to_freeze();
> +		if (kthread_should_stop())
> +			break;
> +
> +		lat_buf = vdec_msg_queue_dqbuf(&dev->core_ctx);
> +		if (!lat_buf)
> +			continue;
> +
> +		ctx = lat_buf->ctx;
> +		mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
> +
> +		if (!lat_buf->core_decode)
> +			mtk_v4l2_err("Core decode callback func is NULL");
> +		else
> +			lat_buf->core_decode(lat_buf);
> +
> +		mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
> +		vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
> +	}
> +
> +	mtk_v4l2_debug(3, "Video Capture Thread End");
> +	return 0;
> +}
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> index 297aa1598788..27ce528cbe89 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> @@ -134,4 +134,10 @@ void vdec_msg_queue_deinit(
>   	struct vdec_msg_queue *msg_queue,
>   	struct mtk_vcodec_ctx *ctx);
>   
> +/**
> + * vdec_msg_queue_core_thead - used for core decoder.
> + * @data: private data used for each codec
> + */
> +int vdec_msg_queue_core_thead(void *data);
> +
>   #endif
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
