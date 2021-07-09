Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAB5C07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 09:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87459613C0
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 09:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87459613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOXvOUVbH9M5EJWMXl4VMW4Pjx+PiDJAUDkt2yxFC50=; b=BIzglqzCAzNtfd
	UjjyJKcKIJAjCe/o4k89afvXwGITXBE4/KDlN4UM7xs0Wxp/yiDXf/lzkgj0QtxpoBs2RzHYEGsuJ
	RoKoxtZEE36t/2q2ItR1U5C1dZyx2GAMu6mS+BSoeR87ZmmvnZcExHrxs15zDu+Un485ubda4nJby
	Mx7rdDVxMuDw9locHZDMSDal5KNA3g7qRILreYV8nK43y4o0XJHY2oIb6DbcuikY58FRj3nmYJnrb
	nh7qDw4O9/t3reXUWmuXjIZ1nS0QjGQips0nttDhEh25z0tXUDZDplkLfNADdzUW5DKjxgy0K2L72
	SA/huHfzBLdbQE968J7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1mz7-001NGn-S3; Fri, 09 Jul 2021 09:39:49 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1myt-001NDl-U6
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 09:39:39 +0000
Received: by mail-io1-xd2d.google.com with SMTP id l5so11737789iok.7
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 02:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CPm+UWTNiAIbOXTnyThDLwHKCYRI8nfAa3UJkpw22i4=;
 b=YUqkR0wAiqFcellO135dfvE1OHkkkK/UZtngpoUb3duLFViGdej3lqzs8rW7zYXdYT
 XmBLzurgGguT+eVuQn2OAsWRYR3unlhnQcXwui28sTOdyJ15FzH4dp2WS1zgAKDmnHNT
 2mSGfcPf4WAcEwUjTfYwFFKUANeZUflOb5DpA/HaPSICE3kHmX1QFEGBASd+mJtymGF0
 21+C1kdfx6N5QmEefng8HIYihwp6tLrgj0WmSE0vjmw6Np0IP9FsOjL/yiwxcU2O9hbf
 0/E20dNh1Eqh2HZoUqydzpfBUwy0tIgaL3dry9m/YYb4Qpxcl4CVy8s+MNTCv5k0dVuT
 W3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CPm+UWTNiAIbOXTnyThDLwHKCYRI8nfAa3UJkpw22i4=;
 b=YV2Cg1HsgIL5pMviwQFpqVEti2JjBD5l0DXQz1IFJXsVRbO/IwuBikOeP74efwAqUQ
 aI+slAYRj5UQa0tkpEjZwGBJ9NVbbn03e+fVKZtPkdEPmncnampy78V63Lc+sFk671I9
 xCeP+bc84+swp9UgzQi1S3yrjuBxRVT497GVWGnX30aLFszAqQG6n7ZLneF0ilhfZlx2
 O7tPb9shF43Z5LmlP/Fy3P8WB6DJAClWkh+diZXMrUrulGJO3nUcYkVGoZWZ+m1TZzNV
 q6B/5lnPfNWKjcde9MNSsFAjwrM9Flj+8IdtyYxyW/Tedwt63o/OMIVNfrAHOye38Kgn
 +paA==
X-Gm-Message-State: AOAM531EsvfxHVcC6I4lG0iG0E4WbnPzsYLAZmVXTGDnVyyHvq5BIn/h
 5v16drzjAFkcRKzYJEKAj1lDJ5fiUhcnOKQBf9PGLA==
X-Google-Smtp-Source: ABdhPJz9hBCcJi5wbr9fX947LEIKbmpwMjcsEGA+ZlwVa7jEzL37XpfMwe+vnsSi16IqtEUtdVHeKOtpfM/gDHcOBxA=
X-Received: by 2002:a02:b155:: with SMTP id s21mr27123288jah.50.1625823574468; 
 Fri, 09 Jul 2021 02:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
 <20210707062157.21176-8-yunfei.dong@mediatek.com>
In-Reply-To: <20210707062157.21176-8-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 9 Jul 2021 17:39:23 +0800
Message-ID: <CA+Px+wUjJwksVfU6N8VZ9WMw-F-DHu67XwvDvMoiMcUBKF=P6Q@mail.gmail.com>
Subject: Re: [PATCH v1, 07/14] media: mtk-vcodec: Add msg queue feature for
 lat and core architecture
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_023936_030978_EB20A733 
X-CRM114-Status: GOOD (  23.08  )
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

On Wed, Jul 7, 2021 at 2:22 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> @@ -464,6 +469,11 @@ struct mtk_vcodec_enc_pdata {
>   * comp_dev: component hardware device
>   * component_node: component node
>   * comp_idx: component index
> + *
> + * core_read: Wait queue used to signalize when core get useful lat buffer
> + * core_queue: List of V4L2 lat_buf
To be neat, replace "Wait" to "wait" and "List" to "list".

> +int vdec_msg_queue_init(
> +       struct mtk_vcodec_ctx *ctx,
> +       struct vdec_msg_queue *msg_queue,
> +       core_decode_cb_t core_decode,
> +       int private_size)
> +{
> +       struct vdec_lat_buf *lat_buf;
> +       int i, err;
> +
> +       init_waitqueue_head(&msg_queue->lat_read);
> +       INIT_LIST_HEAD(&msg_queue->lat_queue);
> +       spin_lock_init(&msg_queue->lat_lock);
> +       msg_queue->num_lat = 0;
> +
> +       msg_queue->wdma_addr.size = vde_msg_queue_get_trans_size(
> +               ctx->picinfo.buf_w, ctx->picinfo.buf_h);
> +
> +       err = mtk_vcodec_mem_alloc(ctx, &msg_queue->wdma_addr);
> +       if (err) {
> +               mtk_v4l2_err("failed to allocate wdma_addr buf");
> +               return -ENOMEM;
> +       }
> +       msg_queue->wdma_rptr_addr = msg_queue->wdma_addr.dma_addr;
> +       msg_queue->wdma_wptr_addr = msg_queue->wdma_addr.dma_addr;
> +
> +       for (i = 0; i < NUM_BUFFER_COUNT; i++) {
> +               lat_buf = &msg_queue->lat_buf[i];
> +
> +               lat_buf->wdma_err_addr.size = VDEC_ERR_MAP_SZ_AVC;
> +               err = mtk_vcodec_mem_alloc(ctx, &lat_buf->wdma_err_addr);
> +               if (err) {
> +                       mtk_v4l2_err("failed to allocate wdma_err_addr buf[%d]", i);
> +                       return -ENOMEM;
> +               }
> +
> +               lat_buf->slice_bc_addr.size = VDEC_LAT_SLICE_HEADER_SZ;
> +               err = mtk_vcodec_mem_alloc(ctx, &lat_buf->slice_bc_addr);
> +               if (err) {
> +                       mtk_v4l2_err("failed to allocate wdma_addr buf[%d]", i);
> +                       return -ENOMEM;
> +               }
> +
> +               lat_buf->private_data = kzalloc(private_size, GFP_KERNEL);
> +               if (!lat_buf->private_data) {
> +                       mtk_v4l2_err("failed to allocate private_data[%d]", i);
> +                       return -ENOMEM;
> +               }
> +
> +               lat_buf->ctx = ctx;
> +               lat_buf->core_decode = core_decode;
> +               vdec_msg_queue_buf_to_lat(lat_buf);
> +       }
Doesn't it need to call mtk_vcodec_mem_free() and kfree() for any failure paths?

> +struct vdec_lat_buf *vdec_msg_queue_get_core_buf(
> +       struct mtk_vcodec_dev *dev)
> +{
> +       struct vdec_lat_buf *buf;
> +       int ret;
> +
> +       spin_lock(&dev->core_lock);
> +       if (list_empty(&dev->core_queue)) {
> +               mtk_v4l2_debug(3, "core queue is NULL, num_core = %d", dev->num_core);
> +               spin_unlock(&dev->core_lock);
> +               ret = wait_event_freezable(dev->core_read,
> +                       !list_empty(&dev->core_queue));
> +               if (ret)
> +                       return NULL;
Should be !ret?

> +void vdec_msg_queue_buf_to_core(struct mtk_vcodec_dev *dev,
> +       struct vdec_lat_buf *buf)
> +{
> +       spin_lock(&dev->core_lock);
> +       list_add_tail(&buf->core_list, &dev->core_queue);
> +       dev->num_core++;
> +       wake_up_all(&dev->core_read);
> +       mtk_v4l2_debug(3, "queu buf addr: (0x%p)", buf);
Typo.

> +bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
> +{
> +       long timeout_jiff;
> +       int ret, i;
> +
> +       for (i = 0; i < NUM_BUFFER_COUNT + 2; i++) {
> +              timeout_jiff = msecs_to_jiffies(1000);
> +              ret = wait_event_timeout(msg_queue->lat_read,
> +                    msg_queue->num_lat == NUM_BUFFER_COUNT, timeout_jiff);
> +              if (ret) {
> +                     mtk_v4l2_debug(3, "success to get lat buf: %d",
> +                            msg_queue->num_lat);
> +                     return true;
> +              }
> +       }
Why does it need the loop?  i is unused.

> +void vdec_msg_queue_deinit(
> +       struct mtk_vcodec_ctx *ctx,
> +       struct vdec_msg_queue *msg_queue)
> +{
> +       struct vdec_lat_buf *lat_buf;
> +       struct mtk_vcodec_mem *mem;
> +       int i;
> +
> +       mem = &msg_queue->wdma_addr;
> +       if (mem->va)
> +               mtk_vcodec_mem_free(ctx, mem);
> +       for (i = 0; i < NUM_BUFFER_COUNT; i++) {
> +               lat_buf = &msg_queue->lat_buf[i];
> +
> +               mem = &lat_buf->wdma_err_addr;
> +               if (mem->va)
> +                       mtk_vcodec_mem_free(ctx, mem);
> +
> +               mem = &lat_buf->slice_bc_addr;
> +               if (mem->va)
> +                       mtk_vcodec_mem_free(ctx, mem);
> +
> +               if (lat_buf->private_data)
> +                       kfree(lat_buf->private_data);
> +       }
> +
> +       msg_queue->init_done = false;
Have no idea what init_done does in the code.  It is not included in
any branch condition.

> +/**
> + * vdec_msg_queue_init - init lat buffer information.
> + * @ctx: v4l2 ctx
> + * @msg_queue: used to store the lat buffer information
> + * @core_decode: core decode callback for each codec
> + * @private_size: the private data size used to share with core
> + */
> +int vdec_msg_queue_init(
> +       struct mtk_vcodec_ctx *ctx,
> +       struct vdec_msg_queue *msg_queue,
> +       core_decode_cb_t core_decode,
> +       int private_size);
Would prefer to have *msg_queue as the first argument (also applies to
all operators of vdec_msg_queue).

> +/**
> + * vdec_msg_queue_get_core_buf - get used core buffer for lat decode.
> + * @dev: mtk vcodec device
> + */
> +struct vdec_lat_buf *vdec_msg_queue_get_core_buf(
> +       struct mtk_vcodec_dev *dev);
This is weird: vdec_msg_queue's operator but manipulating mtk_vcodec_dev?

> +
> +/**
> + * vdec_msg_queue_buf_to_core - queue buf to the core for core decode.
> + * @dev: mtk vcodec device
> + * @buf: current lat buffer
> + */
> +void vdec_msg_queue_buf_to_core(struct mtk_vcodec_dev *dev,
> +       struct vdec_lat_buf *buf);
Also weird.

> +/**
> + * vdec_msg_queue_buf_to_lat - queue buf to lat for lat decode.
> + * @buf: current lat buffer
> + */
> +void vdec_msg_queue_buf_to_lat(struct vdec_lat_buf *buf);
It should at least accept a struct vdec_msg_queue argument (or which
msg queue should the buf put into?).

> +/**
> + * vdec_msg_queue_update_ube_rptr - used to updata the ube read point.
Typo.

> +/**
> + * vdec_msg_queue_update_ube_wptr - used to updata the ube write point.
Typo.

> +/**
> + * vdec_msg_queue_deinit - deinit lat buffer information.
> + * @ctx: v4l2 ctx
> + * @msg_queue: used to store the lat buffer information
> + */
> +void vdec_msg_queue_deinit(
> +       struct mtk_vcodec_ctx *ctx,
> +       struct vdec_msg_queue *msg_queue);
Would prefer to have *msg_queue as the first argument.


The position of struct vdec_msg_queue is weird.  It looks like the msg
queue is only for struct vdec_lat_buf.  If so, would vdec_msg_queue be
better to call vdec_lat_queue or something similar?

It shouldn't touch the core queue in mtk_vcodec_dev anyway.  Is it
possible to generalize the queue-related code for both lat and core
queues?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
