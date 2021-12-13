Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96EFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 23:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJ4z+DbHm7nU22+DD7V8RLmCCkIDP1hX/RMdW+Pv//8=; b=vEGwJTSEYsO82D
	hHHmXfS/qbugGshoMQuzPvLk7RGcen00yPytnsrtSi2L2gAiEuUj5xRHFY2SNlYpXmAzQ098xxSDs
	XeItKojdPedYjvGZpc6LthQ6QHC9kwu2Ku1dqTONqbupiKhSOfZFtB2j+Q70P2t1xiSbT6FecfOTF
	bY+m2T6xCrb2OYHbKmbiY9cFl2zWHOpBPtQiFvhDGUtUEUSBbniWi9k5sWMUWEDEth+RTFKaWuYaq
	MJYKa3a+uWSvi8pVKUlgIVq4INOFgrE4yBEIXWw90U3GGeHYJAV00yt4XJmgaxW1xClwxSFmbLHmt
	fdMUxje5yDAaa7rjDeVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwv4F-00C1KA-HH; Mon, 13 Dec 2021 23:49:15 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwv4C-00C1Ic-Md
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 23:49:14 +0000
Received: by mail-qv1-xf29.google.com with SMTP id kj6so638168qvb.2
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Dec 2021 15:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZkDKt4lfT3jpD+Eyk7JUanIulHpdncvjDTGrBdkT9E=;
 b=YVtLklBKXVvSpSeVdkWS0B3CM9Sd1NHwBogJ9mgU+NeQCpk6csqa4xOnmanBALbV6u
 JXF69vhDMP0UOf4rsM6UAvSR7Psfq+mTLj2AIYAYE84c6hsvibGvEi8w7VwYnLnHKYNc
 WKlyn4PiLCCadnqRzPd8UWE8lqRgCmKqIatPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZkDKt4lfT3jpD+Eyk7JUanIulHpdncvjDTGrBdkT9E=;
 b=ZaCgSAboLb6IzuAqm4JHNlWFtQUSo+9WmUHbYPJZnr408nQvzEzJkNOduPexvhUyy/
 0eepcMN0F0xhQVxE04xU3AAgH1C1hwQVuIZBDz9sDSsX0whtdU3UrJf81Gr61yTRmuFe
 RsYrZzuz7PGmyIPKrv7lmAixMbz67rwQ4s0yMAvD+RFgU3tGuNgnNcSlaHYwPQcXPKCx
 v4jpY8zD68AlEsNoGhaOFBakpho4aWi4CrDx5oBxD5nN0aGTiukvXzyO9eq4sUAqMGgw
 V/Az25/HLfQAT1NL2yIaoNbHbavWzS2lVngZHoBKU5OVqF8ysKjIyWy20foAIQueoETb
 MqKQ==
X-Gm-Message-State: AOAM533VrtNyMc1OKKe2Jx70f0RkXOotPi4+/UCqOUoTBwzRzHanGWuo
 6EWwJ8bzh/i5mDCL5TsRdXPHV/mnz/CIjMPIdQasyw==
X-Google-Smtp-Source: ABdhPJw2lx/ps96eQtiR/nGxXNSpzMteyrPpQvqXxVdOmouZecwIOmPT85jYptQr/M9fbgN7fPfmK+LILCvnHgKHFV4=
X-Received: by 2002:a05:6214:5193:: with SMTP id
 kl19mr1758151qvb.77.1639439350888; 
 Mon, 13 Dec 2021 15:49:10 -0800 (PST)
MIME-Version: 1.0
References: <20211202034544.2750-1-yunfei.dong@mediatek.com>
 <20211202034544.2750-14-yunfei.dong@mediatek.com>
 <CAC-pXoPV0MrX91DfuiscmkOwviJ6Gh4RcYRZ+GW6482NpMGFtg@mail.gmail.com>
 <385bd033f88eba79262f1dd25fbd98dc9089bf8d.camel@mediatek.com>
In-Reply-To: <385bd033f88eba79262f1dd25fbd98dc9089bf8d.camel@mediatek.com>
From: Steve Cho <stevecho@chromium.org>
Date: Mon, 13 Dec 2021 15:49:00 -0800
Message-ID: <CAC-pXoP8jXhFiV2g4gPNvCPs41Y=k21tmJdSzF35SVvR1SR9hw@mail.gmail.com>
Subject: Re: [PATCH v12, 13/19] media: mtk-vcodec: Add work queue for core
 hardware decode
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
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
X-CRM114-CacheID: sfid-20211213_154912_769951_2A3B7878 
X-CRM114-Status: GOOD (  41.99  )
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

Thank you for addressing my questions and comments.

Note that my comments for formatting are usually based on standards
from chromium & chrome os.
So feel free to reflect only if you think it is relevant.

Reviewed-by: Steve Cho <stevecho@chromium.org>

On Mon, Dec 13, 2021 at 12:52 AM yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi steve,
>
> Thanks for your suggestion.
>
> On Thu, 2021-12-09 at 15:44 -0800, Steve Cho wrote:
> > On Wed, Dec 1, 2021 at 7:46 PM Yunfei Dong <yunfei.dong@mediatek.com>
> > wrote:
> > >
> > > Add work queue to process core hardware information.
> > > First, get lat_buf from message queue, then call core
> > > hardware of each codec(H264/VP9/AV1) to decode, finally
> > > puts lat_buf back to the message.
> > >
> > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > ---
> > >  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 16 +++++++-
> > >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 ++
> > >  .../platform/mtk-vcodec/vdec_msg_queue.c      | 41
> > > ++++++++++++++++---
> > >  .../platform/mtk-vcodec/vdec_msg_queue.h      |  8 ++--
> > >  4 files changed, 57 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > index d460703f335d..4fbff61d2334 100644
> > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > @@ -341,6 +341,17 @@ static int mtk_vcodec_probe(struct
> > > platform_device *pdev)
> > >                 goto err_dec_pm;
> > >         }
> > >
> > > +       if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
> > > +               vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx,
> > > MTK_VDEC_CORE);
> > > +               dev->core_workqueue =
> > > alloc_ordered_workqueue("core-decoder",
> > > +                       WQ_MEM_RECLAIM | WQ_FREEZABLE);
> > > +               if (!dev->core_workqueue) {
> > > +                       mtk_v4l2_err("Failed to create core
> > > workqueue");
> > > +                       ret = -EINVAL;
> > > +                       goto err_res;
> > > +               }
> > > +       }
> > > +
> > >         for (i = 0; i < MTK_VDEC_HW_MAX; i++)
> > >                 mutex_init(&dev->dec_mutex[i]);
> > >         spin_lock_init(&dev->irqlock);
> > > @@ -351,7 +362,7 @@ static int mtk_vcodec_probe(struct
> > > platform_device *pdev)
> > >         ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> > >         if (ret) {
> > >                 mtk_v4l2_err("v4l2_device_register err=%d", ret);
> > > -               goto err_res;
> > > +               goto err_core_workq;
> > >         }
> > >
> > >         init_waitqueue_head(&dev->queue);
> > > @@ -450,6 +461,9 @@ static int mtk_vcodec_probe(struct
> > > platform_device *pdev)
> > >         video_unregister_device(vfd_dec);
> > >  err_dec_alloc:
> > >         v4l2_device_unregister(&dev->v4l2_dev);
> > > +err_core_workq:
> > > +       if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
> > > +               destroy_workqueue(dev->core_workqueue);
> > >  err_res:
> > >         mtk_vcodec_release_dec_pm(&dev->pm);
> > >  err_dec_pm:
> > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > index cbaed96dcfa2..a558cc16026d 100644
> > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > @@ -27,6 +27,7 @@
> > >  #define MTK_VCODEC_MAX_PLANES  3
> > >  #define MTK_V4L2_BENCHMARK     0
> > >  #define WAIT_INTR_TIMEOUT_MS   1000
> > > +#define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >=
> > > MTK_VDEC_LAT_SINGLE_CORE)
> >
> > Basic question: What is practical meaning of this? What architectures
> > are supported?
> >
> This definition is used to separate different architectures.
> Pure single core/lat single core at current period is supported.
> > >
> > >  /*
> > >   * enum mtk_hw_reg_idx - MTK hw register base index
> > > @@ -464,6 +465,7 @@ struct mtk_vcodec_enc_pdata {
> > >   * @dec_capability: used to identify decode capability, ex: 4k
> > >   * @enc_capability: used to identify encode capability
> > >   *
> > > + * @core_workqueue: queue used for core hardware decode
> > >   * @msg_queue_core_ctx: msg queue context used for core workqueue
> > >   *
> > >   * @subdev_dev: subdev hardware device
> > > @@ -506,6 +508,7 @@ struct mtk_vcodec_dev {
> > >         unsigned int dec_capability;
> > >         unsigned int enc_capability;
> > >
> > > +       struct workqueue_struct *core_workqueue;
> > >         struct vdec_msg_queue_ctx msg_queue_core_ctx;
> > >
> > >         void *subdev_dev[MTK_VDEC_HW_MAX];
> > > diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > > b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > > index 913aefa67618..24f1d03df9f1 100644
> > > --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > > +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > > @@ -68,6 +68,9 @@ int vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx
> > > *msg_ctx, struct vdec_lat_buf
> > >
> > >         if (msg_ctx->hardware_index != MTK_VDEC_CORE)
> > >                 wake_up_all(&msg_ctx->ready_to_use);
> > > +       else
> > > +               queue_work(buf->ctx->dev->core_workqueue,
> > > +                       &buf->ctx->msg_queue.core_work);
> >
> > need {} for else here?
> >
> If condition not add "{}", else need not to add "{}" ?

I was suggesting as it had 2 lines.

> > >
> > >         mtk_v4l2_debug(3, "enqueue buf type: %d addr: 0x%p num:
> > > %d",
> > >                 msg_ctx->hardware_index, buf, msg_ctx->ready_num);
> > > @@ -169,8 +172,7 @@ bool vdec_msg_queue_wait_lat_buf_full(struct
> > > vdec_msg_queue *msg_queue)
> > >         return false;
> > >  }
> > >
> > > -void vdec_msg_queue_deinit(
> > > -       struct vdec_msg_queue *msg_queue,
> > > +void vdec_msg_queue_deinit(struct vdec_msg_queue *msg_queue,
> > >         struct mtk_vcodec_ctx *ctx)
> > >  {
> > >         struct vdec_lat_buf *lat_buf;
> > > @@ -196,10 +198,36 @@ void vdec_msg_queue_deinit(
> > >         }
> > >  }
> > >
> > > -int vdec_msg_queue_init(
> > > -       struct vdec_msg_queue *msg_queue,
> > > -       struct mtk_vcodec_ctx *ctx,
> > > -       core_decode_cb_t core_decode,
> > > +static void vdec_msg_queue_core_work(struct work_struct *work)
> > > +{
> > > +       struct vdec_msg_queue *msg_queue =
> > > +               container_of(work, struct vdec_msg_queue,
> > > core_work);
> > > +       struct mtk_vcodec_ctx *ctx =
> > > +               container_of(msg_queue, struct mtk_vcodec_ctx,
> > > msg_queue);
> > > +       struct mtk_vcodec_dev *dev = ctx->dev;
> > > +       struct vdec_lat_buf *lat_buf;
> > > +
> > > +       lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
> > > +       if (!lat_buf)
> > > +               return;
> >
> > If we were to return in this error condition,
> > isn't it better to also differentiate this error with return code and
> > change void return type?
> >
> vdec_msg_queue_core_work function is callback for param "func" in
> struct work_struct, need not to add return value.
>
> > > +
> > > +       ctx = lat_buf->ctx;
> > > +       mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
> > > +
> > > +       lat_buf->core_decode(lat_buf);
> > > +
> > > +       mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
> > > +       vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
> > > +
> > > +       if (!list_empty(&ctx->msg_queue.lat_ctx.ready_queue)) {
> > > +               mtk_v4l2_debug(3, "re-schedule to decode for core",
> > > +                       dev->msg_queue_core_ctx.ready_num);
> > > +               queue_work(dev->core_workqueue, &msg_queue-
> > > >core_work);
> > > +       }
> > > +}
> > > +
> > > +int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
> > > +       struct mtk_vcodec_ctx *ctx,     core_decode_cb_t
> > > core_decode,
> > >         int private_size)
> > >  {
> > >         struct vdec_lat_buf *lat_buf;
> > > @@ -210,6 +238,7 @@ int vdec_msg_queue_init(
> > >                 return 0;
> > >
> > >         vdec_msg_queue_init_ctx(&msg_queue->lat_ctx,
> > > MTK_VDEC_LAT0);
> > > +       INIT_WORK(&msg_queue->core_work, vdec_msg_queue_core_work);
> > >         msg_queue->wdma_addr.size = vde_msg_queue_get_trans_size(
> > >                 ctx->picinfo.buf_w, ctx->picinfo.buf_h);
> > >
> > > diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > > b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > > index 21a9c0aeb1b4..43eae638a2a8 100644
> > > --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > > +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > > @@ -67,6 +67,7 @@ struct vdec_lat_buf {
> > >   * @wdma_addr: wdma address used for ube
> > >   * @wdma_rptr_addr: ube read point
> > >   * @wdma_wptr_addr: ube write point
> > > + * @core_work: core hardware work
> > >   * @lat_ctx: used to store lat buffer list
> > >   */
> > >  struct vdec_msg_queue {
> > > @@ -76,6 +77,7 @@ struct vdec_msg_queue {
> > >         uint64_t wdma_rptr_addr;
> > >         uint64_t wdma_wptr_addr;
> > >
> > > +       struct work_struct core_work;
> > >         struct vdec_msg_queue_ctx lat_ctx;
> > >  };
> > >
> > > @@ -86,10 +88,8 @@ struct vdec_msg_queue {
> > >   * @core_decode: core decode callback for each codec
> > >   * @private_size: the private data size used to share with core
> > >   */
> > > -int vdec_msg_queue_init(
> > > -       struct vdec_msg_queue *msg_queue,
> > > -       struct mtk_vcodec_ctx *ctx,
> > > -       core_decode_cb_t core_decode,
> > > +int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
> > > +       struct mtk_vcodec_ctx *ctx,     core_decode_cb_t
> > > core_decode,
> >
> > Not sure about the formatting rule, but is it supposed to be one
> > param per line?
> > If so, this comment also applied to function definition part.
> >
> > >         int private_size);
> > >
> I try to review other files, it looks that two or more parameters per
> line is ok. Whether you mean that we'd better to write one parameter
> per line?
> int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
>         struct mtk_vcodec_ctx *ctx,
>         core_decode_cb_t

Yes, that's what I meant, but you are welcome to keep current change.

>
> Thanks,
> Yunfei Dong
> > >  /**
> > > --
> > > 2.25.1
> > >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
