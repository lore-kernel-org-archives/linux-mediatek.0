Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EF3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 10:56:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95D7661040
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 10:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95D7661040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/f6d1CIkN36+0f8aaLB5tZvqAa1eGVCMUE8dupiHp9c=; b=NsSfBWPX1vJvM2q0SS77BES3vI
	rp+iUOiKZKsXv0pv17PVcQheGjAFuW7JgGp6FKy2jsVKG5hy5jXQHDKCORnks8hsxfqZjeiL5up1R
	fAmtlOUSulpXefNsGJqLRSqYzcpcp6t1e9scRBP/48kfvv4C6IY8iiqI+2tvarCFVZv95ATnwpR6O
	lma+sdrq5ZxbDoI1g2VRliWu9uzj9cccnZNj9rKbgzAMuHcIiVKmwr/iu7qEmJ3a04TGOiGfIvLIW
	UVmtcgVh1elJQsVkKl/wkqD9v1rdSaj+9lJFC+cVrTICtgPRQgZQvCusVqGD1avadvMQ/8TqD6qSe
	aSjee8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mayPj-002iyW-Fc; Thu, 14 Oct 2021 10:56:43 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mayPU-002itf-1Q; Thu, 14 Oct 2021 10:56:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D18251F43904
Subject: Re: [PATCH v7, 11/15] media: mtk-vcodec: Add core thread
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-12-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <3b7084d4-e530-9a55-11f4-d67c37f8f5fa@collabora.com>
Date: Thu, 14 Oct 2021 12:56:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011070247.792-12-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_035628_391837_1F7A33E6 
X-CRM114-Status: GOOD (  28.58  )
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

> Core thread:
> 1. Gets lat_buf from core msg queue.
> 2. Proceeds core decode.
> 3. Puts the lat_buf back to lat msg queue.
> 
> Both H264 and VP9 rely on the core thread.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

I would be happier to see a better commit message, for example:
"Introduce a core thread, responsible for... getting lat_buf from ...
which then proceeds core decode by ... and finally, puts the lat_buf
back to the lat message queue"

> ---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 12 +++++++
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  7 ++++
>   .../platform/mtk-vcodec/vdec_msg_queue.c      | 32 +++++++++++++++++++
>   .../platform/mtk-vcodec/vdec_msg_queue.h      |  6 ++++
>   4 files changed, 57 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index e21e0c4bcd86..de83e3b821b4 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -364,6 +364,18 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   		goto err_dec_pm;
>   	}
>   
> +	if (VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
> +		vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx,
> +			MTK_VDEC_CORE);

No need to break this line.

> +		dev->kthread_core = kthread_run(vdec_msg_queue_core_thead, dev,
> +			"mtk-%s", "core");

Please fix indentation, like so:
		dev->kthread_core = kthread_run(vdec_msg_queue_core_thead, dev,

						"mtk-%s", "core");

> +		if (IS_ERR(dev->kthread_core)) {
> +			dev_err(&pdev->dev, "Failed to create core thread");
> +			ret = PTR_ERR(dev->kthread_core);
> +			goto err_res;
> +		}
> +	}
> +
>   	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
>   		mutex_init(&dev->dec_mutex[i]);
>   	spin_lock_init(&dev->irqlock);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 9d072c082f73..68a9b1a2d3b3 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -27,6 +27,7 @@
>   #define MTK_VCODEC_MAX_PLANES	3
>   #define MTK_V4L2_BENCHMARK	0
>   #define WAIT_INTR_TIMEOUT_MS	1000
> +#define VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)

I'd propose to change this to IS_VDEC_LAT_ARCH(hw_arch): that would increase human
readability when using this macro.

>   
>   /*
>    * enum mtk_hw_reg_idx - MTK hw register base index
> @@ -466,6 +467,9 @@ struct mtk_vcodec_enc_pdata {
>    * @comp_dev: component hardware device
>    * @component_node: component node
>    *
> + * @kthread_core: thread used for core hardware decode
> + * @msg_queue_core_ctx: msg queue context used for core thread
> + *
>    * @hardware_bitmap: used to record hardware is ready or not
>    */
>   struct mtk_vcodec_dev {
> @@ -508,6 +512,9 @@ struct mtk_vcodec_dev {
>   	void *comp_dev[MTK_VDEC_HW_MAX];
>   	struct device_node *component_node[MTK_VDEC_HW_MAX];
>   
> +	struct task_struct *kthread_core;
> +	struct vdec_msg_queue_ctx msg_queue_core_ctx;
> +
>   	DECLARE_BITMAP(hardware_bitmap, MTK_VDEC_HW_MAX);
>   };
>   
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> index d66ed98c79a9..665f571eab4b 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> @@ -256,3 +256,35 @@ void vdec_msg_queue_deinit(
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
> +		lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
> +		if (!lat_buf)
> +			continue;
> +
> +		ctx = lat_buf->ctx;
> +		mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
> +
> +		if (!lat_buf->core_decode)
> +			mtk_v4l2_err("Core decode callback func is NULL");

Is this supposed to really happen?
I see that this is always initialized in function vdec_msg_queue_init().

Regards,
- Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
