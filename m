Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B864C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 09:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QADdV9qWfhyqRyZQwLUgj+DLz4m5p4O6o6bY3sB1iag=; b=WHvusBWSDJFhBy
	8pOl9El8MoZ9X85mSmLLOHbj+JDSehmireY1W/pun8AKJpd88XcB+WUJMHcQUziyYeMijyY4cAvFB
	PmbUSpZVxootaSl8dL4l9qHSVGD5vn3/OvmxWd0mNa2YEudjBcDz+mds9R5zLM7YNdBONz29FhcL5
	R2INMrb6vRVNSA6G0KNaGz7gaxpn4Zhh5DICBarioEs6XVMGRrV5OjjWXJIWAl94qYYepdXLHxpPu
	mx43ZP/K9qdn/D9OoVWAolb3dlHBft5Z1CdXt+5U8jM4BSbnlcYb48YFMIH+qa3OsTAmYo0N/G4sT
	6oquKYjQwfOJ6ngyr3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwhHC-008VG5-Ka; Mon, 13 Dec 2021 09:05:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwh4g-008PTC-8R; Mon, 13 Dec 2021 08:52:48 +0000
X-UUID: 99b5820d73d0464fa33d108b7d15ab95-20211213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nh2pzg5ezSu90nE5Vw866CY2CweAt9tmRwS+GU2f7J4=; 
 b=Klv/4Is/rudkoA2Y1TVzjsqKHc9W7CI3ldK4pEitAM63KJhbChkR5mtCrmHQun9shjPLpmO0G7mDmlFIal7QeE91FvItxyQX/chFCRJqq9wqFRbFO5/sZYc7NaW7ZrfD4nguA0fwMlWa2kR0SvGyGCZtjBZYq2OMvVRn/idL4og=;
X-UUID: 99b5820d73d0464fa33d108b7d15ab95-20211213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 425591564; Mon, 13 Dec 2021 01:52:45 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Dec 2021 00:52:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 13 Dec 2021 16:52:41 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Dec 2021 16:52:39 +0800
Message-ID: <385bd033f88eba79262f1dd25fbd98dc9089bf8d.camel@mediatek.com>
Subject: Re: [PATCH v12, 13/19] media: mtk-vcodec: Add work queue for core
 hardware decode
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Steve Cho <stevecho@chromium.org>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 13 Dec 2021 16:52:42 +0800
In-Reply-To: <CAC-pXoPV0MrX91DfuiscmkOwviJ6Gh4RcYRZ+GW6482NpMGFtg@mail.gmail.com>
References: <20211202034544.2750-1-yunfei.dong@mediatek.com>
 <20211202034544.2750-14-yunfei.dong@mediatek.com>
 <CAC-pXoPV0MrX91DfuiscmkOwviJ6Gh4RcYRZ+GW6482NpMGFtg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_005246_358251_E3D60C66 
X-CRM114-Status: GOOD (  33.34  )
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

Hi steve,

Thanks for your suggestion.

On Thu, 2021-12-09 at 15:44 -0800, Steve Cho wrote:
> On Wed, Dec 1, 2021 at 7:46 PM Yunfei Dong <yunfei.dong@mediatek.com>
> wrote:
> > 
> > Add work queue to process core hardware information.
> > First, get lat_buf from message queue, then call core
> > hardware of each codec(H264/VP9/AV1) to decode, finally
> > puts lat_buf back to the message.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 16 +++++++-
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 ++
> >  .../platform/mtk-vcodec/vdec_msg_queue.c      | 41
> > ++++++++++++++++---
> >  .../platform/mtk-vcodec/vdec_msg_queue.h      |  8 ++--
> >  4 files changed, 57 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c 
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index d460703f335d..4fbff61d2334 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -341,6 +341,17 @@ static int mtk_vcodec_probe(struct
> > platform_device *pdev)
> >                 goto err_dec_pm;
> >         }
> > 
> > +       if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
> > +               vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx,
> > MTK_VDEC_CORE);
> > +               dev->core_workqueue =
> > alloc_ordered_workqueue("core-decoder",
> > +                       WQ_MEM_RECLAIM | WQ_FREEZABLE);
> > +               if (!dev->core_workqueue) {
> > +                       mtk_v4l2_err("Failed to create core
> > workqueue");
> > +                       ret = -EINVAL;
> > +                       goto err_res;
> > +               }
> > +       }
> > +
> >         for (i = 0; i < MTK_VDEC_HW_MAX; i++)
> >                 mutex_init(&dev->dec_mutex[i]);
> >         spin_lock_init(&dev->irqlock);
> > @@ -351,7 +362,7 @@ static int mtk_vcodec_probe(struct
> > platform_device *pdev)
> >         ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> >         if (ret) {
> >                 mtk_v4l2_err("v4l2_device_register err=%d", ret);
> > -               goto err_res;
> > +               goto err_core_workq;
> >         }
> > 
> >         init_waitqueue_head(&dev->queue);
> > @@ -450,6 +461,9 @@ static int mtk_vcodec_probe(struct
> > platform_device *pdev)
> >         video_unregister_device(vfd_dec);
> >  err_dec_alloc:
> >         v4l2_device_unregister(&dev->v4l2_dev);
> > +err_core_workq:
> > +       if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
> > +               destroy_workqueue(dev->core_workqueue);
> >  err_res:
> >         mtk_vcodec_release_dec_pm(&dev->pm);
> >  err_dec_pm:
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index cbaed96dcfa2..a558cc16026d 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -27,6 +27,7 @@
> >  #define MTK_VCODEC_MAX_PLANES  3
> >  #define MTK_V4L2_BENCHMARK     0
> >  #define WAIT_INTR_TIMEOUT_MS   1000
> > +#define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >=
> > MTK_VDEC_LAT_SINGLE_CORE)
> 
> Basic question: What is practical meaning of this? What architectures
> are supported?
> 
This definition is used to separate different architectures.
Pure single core/lat single core at current period is supported.
> > 
> >  /*
> >   * enum mtk_hw_reg_idx - MTK hw register base index
> > @@ -464,6 +465,7 @@ struct mtk_vcodec_enc_pdata {
> >   * @dec_capability: used to identify decode capability, ex: 4k
> >   * @enc_capability: used to identify encode capability
> >   *
> > + * @core_workqueue: queue used for core hardware decode
> >   * @msg_queue_core_ctx: msg queue context used for core workqueue
> >   *
> >   * @subdev_dev: subdev hardware device
> > @@ -506,6 +508,7 @@ struct mtk_vcodec_dev {
> >         unsigned int dec_capability;
> >         unsigned int enc_capability;
> > 
> > +       struct workqueue_struct *core_workqueue;
> >         struct vdec_msg_queue_ctx msg_queue_core_ctx;
> > 
> >         void *subdev_dev[MTK_VDEC_HW_MAX];
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > index 913aefa67618..24f1d03df9f1 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > @@ -68,6 +68,9 @@ int vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx
> > *msg_ctx, struct vdec_lat_buf
> > 
> >         if (msg_ctx->hardware_index != MTK_VDEC_CORE)
> >                 wake_up_all(&msg_ctx->ready_to_use);
> > +       else
> > +               queue_work(buf->ctx->dev->core_workqueue,
> > +                       &buf->ctx->msg_queue.core_work);
> 
> need {} for else here?
> 
If condition not add "{}", else need not to add "{}" ?
> > 
> >         mtk_v4l2_debug(3, "enqueue buf type: %d addr: 0x%p num:
> > %d",
> >                 msg_ctx->hardware_index, buf, msg_ctx->ready_num);
> > @@ -169,8 +172,7 @@ bool vdec_msg_queue_wait_lat_buf_full(struct
> > vdec_msg_queue *msg_queue)
> >         return false;
> >  }
> > 
> > -void vdec_msg_queue_deinit(
> > -       struct vdec_msg_queue *msg_queue,
> > +void vdec_msg_queue_deinit(struct vdec_msg_queue *msg_queue,
> >         struct mtk_vcodec_ctx *ctx)
> >  {
> >         struct vdec_lat_buf *lat_buf;
> > @@ -196,10 +198,36 @@ void vdec_msg_queue_deinit(
> >         }
> >  }
> > 
> > -int vdec_msg_queue_init(
> > -       struct vdec_msg_queue *msg_queue,
> > -       struct mtk_vcodec_ctx *ctx,
> > -       core_decode_cb_t core_decode,
> > +static void vdec_msg_queue_core_work(struct work_struct *work)
> > +{
> > +       struct vdec_msg_queue *msg_queue =
> > +               container_of(work, struct vdec_msg_queue,
> > core_work);
> > +       struct mtk_vcodec_ctx *ctx =
> > +               container_of(msg_queue, struct mtk_vcodec_ctx,
> > msg_queue);
> > +       struct mtk_vcodec_dev *dev = ctx->dev;
> > +       struct vdec_lat_buf *lat_buf;
> > +
> > +       lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
> > +       if (!lat_buf)
> > +               return;
> 
> If we were to return in this error condition,
> isn't it better to also differentiate this error with return code and
> change void return type?
> 
vdec_msg_queue_core_work function is callback for param "func" in
struct work_struct, need not to add return value.

> > +
> > +       ctx = lat_buf->ctx;
> > +       mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
> > +
> > +       lat_buf->core_decode(lat_buf);
> > +
> > +       mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
> > +       vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
> > +
> > +       if (!list_empty(&ctx->msg_queue.lat_ctx.ready_queue)) {
> > +               mtk_v4l2_debug(3, "re-schedule to decode for core",
> > +                       dev->msg_queue_core_ctx.ready_num);
> > +               queue_work(dev->core_workqueue, &msg_queue-
> > >core_work);
> > +       }
> > +}
> > +
> > +int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
> > +       struct mtk_vcodec_ctx *ctx,     core_decode_cb_t
> > core_decode,
> >         int private_size)
> >  {
> >         struct vdec_lat_buf *lat_buf;
> > @@ -210,6 +238,7 @@ int vdec_msg_queue_init(
> >                 return 0;
> > 
> >         vdec_msg_queue_init_ctx(&msg_queue->lat_ctx,
> > MTK_VDEC_LAT0);
> > +       INIT_WORK(&msg_queue->core_work, vdec_msg_queue_core_work);
> >         msg_queue->wdma_addr.size = vde_msg_queue_get_trans_size(
> >                 ctx->picinfo.buf_w, ctx->picinfo.buf_h);
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > index 21a9c0aeb1b4..43eae638a2a8 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > @@ -67,6 +67,7 @@ struct vdec_lat_buf {
> >   * @wdma_addr: wdma address used for ube
> >   * @wdma_rptr_addr: ube read point
> >   * @wdma_wptr_addr: ube write point
> > + * @core_work: core hardware work
> >   * @lat_ctx: used to store lat buffer list
> >   */
> >  struct vdec_msg_queue {
> > @@ -76,6 +77,7 @@ struct vdec_msg_queue {
> >         uint64_t wdma_rptr_addr;
> >         uint64_t wdma_wptr_addr;
> > 
> > +       struct work_struct core_work;
> >         struct vdec_msg_queue_ctx lat_ctx;
> >  };
> > 
> > @@ -86,10 +88,8 @@ struct vdec_msg_queue {
> >   * @core_decode: core decode callback for each codec
> >   * @private_size: the private data size used to share with core
> >   */
> > -int vdec_msg_queue_init(
> > -       struct vdec_msg_queue *msg_queue,
> > -       struct mtk_vcodec_ctx *ctx,
> > -       core_decode_cb_t core_decode,
> > +int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
> > +       struct mtk_vcodec_ctx *ctx,     core_decode_cb_t
> > core_decode,
> 
> Not sure about the formatting rule, but is it supposed to be one
> param per line?
> If so, this comment also applied to function definition part.
> 
> >         int private_size);
> > 
I try to review other files, it looks that two or more parameters per
line is ok. Whether you mean that we'd better to write one parameter
per line?
int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
	struct mtk_vcodec_ctx *ctx,
	core_decode_cb_t

Thanks,
Yunfei Dong
> >  /**
> > --
> > 2.25.1
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
