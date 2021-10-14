Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE563C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 12:30:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF8B5610EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 12:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF8B5610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jFhzAgn40u0lWRMQbe++GkpWVHDVcWqc1mAnPXfEzfI=; b=e6Nk25jWA9Mdfo
	mdSvaX6uHixz5abxXQvl233M+qlcUA+8IguPA9Uz6nUOAghSHD4yl72bwXAjvOvp+amX8Nt79hKl/
	rB3VphQaxl7I07DOHMb5Hc4n0up6Nq7EJqt21Cvbq6xpsz3Dr0F1Sq+7LwWTSTNwwtmt63HmJCfL0
	Ly7FmIFga9nDPuZG/114GvuqJFijG3QC9bc7H75cis5xU5qGI95iXUWv3KXQhs06TlK6ZW/vNh5cN
	3Ym64vy06Ho2YGzDmXP6tLKpHqE4kpawffPE4+Wxe6lqQ1kAqFEMQ9pxc5L36HcaonbwyyztaHWoa
	01wAa6b/ahWFsIDM2vyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mazru-0034bt-UQ; Thu, 14 Oct 2021 12:29:54 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mazrs-0034aG-C1
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 12:29:54 +0000
Received: by mail-ua1-x92d.google.com with SMTP id e10so6259224uab.3
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 05:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bpEt5S2I1jECJZ7RAHxHySVXzboFeasK/FtBe+cjO18=;
 b=yHj0RLsispl3pZOx9OzQRdtNdyJkziqY9hxlNeIeAdjRANYoVp3gT0ZHuJt++TVuLE
 Fs6uvLKVQ3/EfqaX88EnLDmlO8KLYxuYkeCSIiy+O0kLtnQbBr5bAFwsO+DXKyHQGiOa
 HJN/Ucm4pLg4vxoMKuZJJjhAh6HCCjXuzqOdOb/PmWZ/RkzN2ET0KIMgWgisCz/fHkgx
 r4HLxdDuoMCq9Gn7CraNwRXBkENmGDLCg+9DIs5gOlk96PoEcJz6EMJk+YC6BatRNhRE
 sqPuauczqUPyN/RIKpvfOJt9L1aJ704G7BkWwfJ4iHkq7WmmRig6UUW7h7+iknrv26v7
 qkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bpEt5S2I1jECJZ7RAHxHySVXzboFeasK/FtBe+cjO18=;
 b=yoju/5eUhvP4j6bCUHfjpfmhjQfc3TwKEGfsPzbmSlythZ4nY+E9vjyb83Unr2D8iy
 0hNJiQN8xsUEwX+oPsTJTCx1HhlZsnnDRKmuYKjIE9TNdvoBzH3THmZIquW1BkKuM0VA
 73Kg9GQASVFgvJrs70UcKLRjr4f9Qq0wUFEZWUbEM92c1itHc1734/x5wevuT4ex7BLK
 z32aYoAIUZIbvDLvwlkdMxkdamo27SppspySg2fkGV73qIvCVxXkyeWThHyhJ+7WWPI0
 heJs5kK9T6yYpu7wq6B2Z4WY0YIdPpFwFpOr2JzMuBEKDM9KhBw0B7mqcYophdEpvvEg
 dHvw==
X-Gm-Message-State: AOAM531JjzS11k2hV9NRElNnepgFKk37ZzFvYqX6a904rkP3V21d5TKT
 WP6TXIaRlERq3aX1jEL1AmdPqA==
X-Google-Smtp-Source: ABdhPJwpZPIshTtwDQYZynBXVHPTqsAW65pNND3KsVH+Ilc20oOix2EKPoY+nV7xF5rMeic3f2Z8gg==
X-Received: by 2002:a05:6102:e86:: with SMTP id
 l6mr2706001vst.40.1634214590367; 
 Thu, 14 Oct 2021 05:29:50 -0700 (PDT)
Received: from fedora ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
 by smtp.gmail.com with ESMTPSA id x125sm1589796vkc.25.2021.10.14.05.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 05:29:48 -0700 (PDT)
Date: Thu, 14 Oct 2021 09:29:42 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7, 11/15] media: mtk-vcodec: Add core thread
Message-ID: <YWgitrqT9sWyELpr@fedora>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-12-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211011070247.792-12-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_052952_588527_5EEB7C9F 
X-CRM114-Status: GOOD (  26.69  )
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

Hi Yunfei,

On Mon, Oct 11, 2021 at 03:02:43PM +0800, Yunfei Dong wrote:
> Core thread:
> 1. Gets lat_buf from core msg queue.
> 2. Proceeds core decode.
> 3. Puts the lat_buf back to lat msg queue.
> 
> Both H264 and VP9 rely on the core thread.
> 

Avoid the kthread API and instead go with the workqueue API.

See Documentation/core-api/workqueue.rst and include/linux/workqueue.h.

Thanks!
Ezequiel

> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 12 +++++++
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  7 ++++
>  .../platform/mtk-vcodec/vdec_msg_queue.c      | 32 +++++++++++++++++++
>  .../platform/mtk-vcodec/vdec_msg_queue.h      |  6 ++++
>  4 files changed, 57 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index e21e0c4bcd86..de83e3b821b4 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -364,6 +364,18 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  		goto err_dec_pm;
>  	}
>  
> +	if (VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
> +		vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx,
> +			MTK_VDEC_CORE);
> +		dev->kthread_core = kthread_run(vdec_msg_queue_core_thead, dev,
> +			"mtk-%s", "core");
> +		if (IS_ERR(dev->kthread_core)) {
> +			dev_err(&pdev->dev, "Failed to create core thread");
> +			ret = PTR_ERR(dev->kthread_core);
> +			goto err_res;
> +		}
> +	}
> +
>  	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
>  		mutex_init(&dev->dec_mutex[i]);
>  	spin_lock_init(&dev->irqlock);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 9d072c082f73..68a9b1a2d3b3 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -27,6 +27,7 @@
>  #define MTK_VCODEC_MAX_PLANES	3
>  #define MTK_V4L2_BENCHMARK	0
>  #define WAIT_INTR_TIMEOUT_MS	1000
> +#define VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
>  
>  /*
>   * enum mtk_hw_reg_idx - MTK hw register base index
> @@ -466,6 +467,9 @@ struct mtk_vcodec_enc_pdata {
>   * @comp_dev: component hardware device
>   * @component_node: component node
>   *
> + * @kthread_core: thread used for core hardware decode
> + * @msg_queue_core_ctx: msg queue context used for core thread
> + *
>   * @hardware_bitmap: used to record hardware is ready or not
>   */
>  struct mtk_vcodec_dev {
> @@ -508,6 +512,9 @@ struct mtk_vcodec_dev {
>  	void *comp_dev[MTK_VDEC_HW_MAX];
>  	struct device_node *component_node[MTK_VDEC_HW_MAX];
>  
> +	struct task_struct *kthread_core;
> +	struct vdec_msg_queue_ctx msg_queue_core_ctx;
> +
>  	DECLARE_BITMAP(hardware_bitmap, MTK_VDEC_HW_MAX);
>  };
>  
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> index d66ed98c79a9..665f571eab4b 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> @@ -256,3 +256,35 @@ void vdec_msg_queue_deinit(
>  			kfree(lat_buf->private_data);
>  	}
>  }
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
> index 1905ce713592..b5745b144140 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> @@ -148,4 +148,10 @@ void vdec_msg_queue_deinit(
>  	struct vdec_msg_queue *msg_queue,
>  	struct mtk_vcodec_ctx *ctx);
>  
> +/**
> + * vdec_msg_queue_core_thead - used for core decoder.
> + * @data: private data used for each codec
> + */
> +int vdec_msg_queue_core_thead(void *data);
> +
>  #endif
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
