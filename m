Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5510C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 23:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8I2HIwqtL6YRfLU4Nj6AY8YZVF0YCRTwM3ptraOkSg8=; b=k9TULtL7kHPKkj
	/Uvgi+pJlWPFrqJF79UHi1DU3YLyUf29EFcUh8O2lyNEFNDTapouB5OXBZqzo7ivrc1BYMLOtZ2c4
	mkYs5MhaGBEFZtXA/EUr5kaWoYR+xq8JIGLNLUX6d/eZv/bMdkV0w057IcRm1Kqv/ls+uIdsdwM0H
	WMq72/DhICLxaiQFOOyyOfF0XEyKLmum7HtD06q12OJbrspGWlFheiThbMRm/4cEyfNXIXdG/h93y
	9HMyfgXf+cBY9QilH5UyVNMoyDvmHUsaxWWh0MvEiF+pm5Qw3VHCTRd+fceN/Q2F6l6jDKzwZ5JND
	aJjMn1970ZFpje5pd7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvT63-000QAY-KZ; Thu, 09 Dec 2021 23:45:07 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvT5o-000Q5z-Gf
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 23:44:54 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id jo22so6568133qvb.13
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Dec 2021 15:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z8ul/68TTMd0vCXelwEXbTf2Y8+4CmIOh8pjnYzpEeY=;
 b=HKchMdZDouQpqT1O5HjguvjPWBPz5meO4ShyPblqGvL14MCZ+bL7PTDY/4z9k56BpQ
 KZCb2a2oVelWePKPdWYqk3djkd1IimxvXoic+QwJFtOjUv8T6uBHfuHOfBVQOVd6sOaW
 fQJ5P1RPrRuXBjunLQ+OT9IAVh/3dd4uJx0Bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z8ul/68TTMd0vCXelwEXbTf2Y8+4CmIOh8pjnYzpEeY=;
 b=RN9HFXj2aaMe9G803fNs9NRvMmR152ul4gSQgPI37vD00SymXpxtVpS49PcIUZ85Xs
 iS03e+YgrRWr4Nmqi9PoROrzguRfhT3mB4Xxqk6kTpMqagQWVsiUJ9+TFv24QeO9vssw
 hLtUJCeAEGL+SygH9C8pQZr3Q+9G8OtmEedpemrVig7HqmLeCiwXeemPujhClUVo//o9
 +XiAi7g2DJJy01lUQt4UOM5DT2BUGMh2qB4yACNdGeyFEf9+fPMiwGoz/xnocf03x9Gd
 tLOkJxqU2C0yQScURrKLvUvah7VgJq1M7/nmGg3EYnzEyCyJoM1ZQK1IabcQYPie+Z5G
 uHTQ==
X-Gm-Message-State: AOAM532fJsC1RUtUb1FAO89PY6fsanHpvSgmeeY9G0dnr7xjrwos8MRY
 kBNMoDtj59XUmquR0V5m3jCDtcx3Rq9U6qjZHuzpZAvJxD8=
X-Google-Smtp-Source: ABdhPJzV6/TnXjUOLjFzM/ma9fmG9Nt8FCU/gSZz36pPI4LByD43heeF0Dr9GJ2LVcnM2DQhO0cSrj4qiEKvoaPI/+c=
X-Received: by 2002:a05:6214:5193:: with SMTP id
 kl19mr20845472qvb.77.1639093491509; 
 Thu, 09 Dec 2021 15:44:51 -0800 (PST)
MIME-Version: 1.0
References: <20211202034544.2750-1-yunfei.dong@mediatek.com>
 <20211202034544.2750-14-yunfei.dong@mediatek.com>
In-Reply-To: <20211202034544.2750-14-yunfei.dong@mediatek.com>
From: Steve Cho <stevecho@chromium.org>
Date: Thu, 9 Dec 2021 15:44:41 -0800
Message-ID: <CAC-pXoPV0MrX91DfuiscmkOwviJ6Gh4RcYRZ+GW6482NpMGFtg@mail.gmail.com>
Subject: Re: [PATCH v12, 13/19] media: mtk-vcodec: Add work queue for core
 hardware decode
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_154452_608486_9D86E11C 
X-CRM114-Status: GOOD (  30.03  )
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

On Wed, Dec 1, 2021 at 7:46 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Add work queue to process core hardware information.
> First, get lat_buf from message queue, then call core
> hardware of each codec(H264/VP9/AV1) to decode, finally
> puts lat_buf back to the message.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 16 +++++++-
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 ++
>  .../platform/mtk-vcodec/vdec_msg_queue.c      | 41 ++++++++++++++++---
>  .../platform/mtk-vcodec/vdec_msg_queue.h      |  8 ++--
>  4 files changed, 57 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index d460703f335d..4fbff61d2334 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -341,6 +341,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>                 goto err_dec_pm;
>         }
>
> +       if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
> +               vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx, MTK_VDEC_CORE);
> +               dev->core_workqueue = alloc_ordered_workqueue("core-decoder",
> +                       WQ_MEM_RECLAIM | WQ_FREEZABLE);
> +               if (!dev->core_workqueue) {
> +                       mtk_v4l2_err("Failed to create core workqueue");
> +                       ret = -EINVAL;
> +                       goto err_res;
> +               }
> +       }
> +
>         for (i = 0; i < MTK_VDEC_HW_MAX; i++)
>                 mutex_init(&dev->dec_mutex[i]);
>         spin_lock_init(&dev->irqlock);
> @@ -351,7 +362,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>         ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>         if (ret) {
>                 mtk_v4l2_err("v4l2_device_register err=%d", ret);
> -               goto err_res;
> +               goto err_core_workq;
>         }
>
>         init_waitqueue_head(&dev->queue);
> @@ -450,6 +461,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>         video_unregister_device(vfd_dec);
>  err_dec_alloc:
>         v4l2_device_unregister(&dev->v4l2_dev);
> +err_core_workq:
> +       if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
> +               destroy_workqueue(dev->core_workqueue);
>  err_res:
>         mtk_vcodec_release_dec_pm(&dev->pm);
>  err_dec_pm:
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index cbaed96dcfa2..a558cc16026d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -27,6 +27,7 @@
>  #define MTK_VCODEC_MAX_PLANES  3
>  #define MTK_V4L2_BENCHMARK     0
>  #define WAIT_INTR_TIMEOUT_MS   1000
> +#define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)

Basic question: What is practical meaning of this? What architectures
are supported?

>
>  /*
>   * enum mtk_hw_reg_idx - MTK hw register base index
> @@ -464,6 +465,7 @@ struct mtk_vcodec_enc_pdata {
>   * @dec_capability: used to identify decode capability, ex: 4k
>   * @enc_capability: used to identify encode capability
>   *
> + * @core_workqueue: queue used for core hardware decode
>   * @msg_queue_core_ctx: msg queue context used for core workqueue
>   *
>   * @subdev_dev: subdev hardware device
> @@ -506,6 +508,7 @@ struct mtk_vcodec_dev {
>         unsigned int dec_capability;
>         unsigned int enc_capability;
>
> +       struct workqueue_struct *core_workqueue;
>         struct vdec_msg_queue_ctx msg_queue_core_ctx;
>
>         void *subdev_dev[MTK_VDEC_HW_MAX];
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> index 913aefa67618..24f1d03df9f1 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> @@ -68,6 +68,9 @@ int vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *msg_ctx, struct vdec_lat_buf
>
>         if (msg_ctx->hardware_index != MTK_VDEC_CORE)
>                 wake_up_all(&msg_ctx->ready_to_use);
> +       else
> +               queue_work(buf->ctx->dev->core_workqueue,
> +                       &buf->ctx->msg_queue.core_work);

need {} for else here?

>
>         mtk_v4l2_debug(3, "enqueue buf type: %d addr: 0x%p num: %d",
>                 msg_ctx->hardware_index, buf, msg_ctx->ready_num);
> @@ -169,8 +172,7 @@ bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
>         return false;
>  }
>
> -void vdec_msg_queue_deinit(
> -       struct vdec_msg_queue *msg_queue,
> +void vdec_msg_queue_deinit(struct vdec_msg_queue *msg_queue,
>         struct mtk_vcodec_ctx *ctx)
>  {
>         struct vdec_lat_buf *lat_buf;
> @@ -196,10 +198,36 @@ void vdec_msg_queue_deinit(
>         }
>  }
>
> -int vdec_msg_queue_init(
> -       struct vdec_msg_queue *msg_queue,
> -       struct mtk_vcodec_ctx *ctx,
> -       core_decode_cb_t core_decode,
> +static void vdec_msg_queue_core_work(struct work_struct *work)
> +{
> +       struct vdec_msg_queue *msg_queue =
> +               container_of(work, struct vdec_msg_queue, core_work);
> +       struct mtk_vcodec_ctx *ctx =
> +               container_of(msg_queue, struct mtk_vcodec_ctx, msg_queue);
> +       struct mtk_vcodec_dev *dev = ctx->dev;
> +       struct vdec_lat_buf *lat_buf;
> +
> +       lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
> +       if (!lat_buf)
> +               return;

If we were to return in this error condition,
isn't it better to also differentiate this error with return code and
change void return type?

> +
> +       ctx = lat_buf->ctx;
> +       mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
> +
> +       lat_buf->core_decode(lat_buf);
> +
> +       mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
> +       vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
> +
> +       if (!list_empty(&ctx->msg_queue.lat_ctx.ready_queue)) {
> +               mtk_v4l2_debug(3, "re-schedule to decode for core",
> +                       dev->msg_queue_core_ctx.ready_num);
> +               queue_work(dev->core_workqueue, &msg_queue->core_work);
> +       }
> +}
> +
> +int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
> +       struct mtk_vcodec_ctx *ctx,     core_decode_cb_t core_decode,
>         int private_size)
>  {
>         struct vdec_lat_buf *lat_buf;
> @@ -210,6 +238,7 @@ int vdec_msg_queue_init(
>                 return 0;
>
>         vdec_msg_queue_init_ctx(&msg_queue->lat_ctx, MTK_VDEC_LAT0);
> +       INIT_WORK(&msg_queue->core_work, vdec_msg_queue_core_work);
>         msg_queue->wdma_addr.size = vde_msg_queue_get_trans_size(
>                 ctx->picinfo.buf_w, ctx->picinfo.buf_h);
>
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> index 21a9c0aeb1b4..43eae638a2a8 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> @@ -67,6 +67,7 @@ struct vdec_lat_buf {
>   * @wdma_addr: wdma address used for ube
>   * @wdma_rptr_addr: ube read point
>   * @wdma_wptr_addr: ube write point
> + * @core_work: core hardware work
>   * @lat_ctx: used to store lat buffer list
>   */
>  struct vdec_msg_queue {
> @@ -76,6 +77,7 @@ struct vdec_msg_queue {
>         uint64_t wdma_rptr_addr;
>         uint64_t wdma_wptr_addr;
>
> +       struct work_struct core_work;
>         struct vdec_msg_queue_ctx lat_ctx;
>  };
>
> @@ -86,10 +88,8 @@ struct vdec_msg_queue {
>   * @core_decode: core decode callback for each codec
>   * @private_size: the private data size used to share with core
>   */
> -int vdec_msg_queue_init(
> -       struct vdec_msg_queue *msg_queue,
> -       struct mtk_vcodec_ctx *ctx,
> -       core_decode_cb_t core_decode,
> +int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
> +       struct mtk_vcodec_ctx *ctx,     core_decode_cb_t core_decode,

Not sure about the formatting rule, but is it supposed to be one param per line?
If so, this comment also applied to function definition part.

>         int private_size);
>
>  /**
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
