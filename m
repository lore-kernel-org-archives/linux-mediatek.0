Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B43CA0EDC
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 09:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUGdpiEBvij3QABk3TeXAVu9+edp1QZJrsLkuXoDk+M=; b=oNkbM16eoSaPDynohb+Y+G/AgC
	AITin2L5uqwAYbiSPom8Eax3HbFxG43n+1QATmoz0JtPLz+SP7lHJYA2EHaV4SjTLycMEdH0teE6t
	bTowXdRdkHpQKciY10ul/9GRP6dVl1jaC7FMlCJ1Npwj5721hc/75Z2u6wNs4krt3i/bGRRLpLkEt
	/RhCR5/HFzP1vs5nF/ZJ9wRVbcpiFd5HGx1WMpt0jXD+f8BNxrBQ85xutuj/RLRMQEMeZcTJD9jHD
	aQtwjIjrJim5HPU6qXcWMvMk9PUI8/V4BNRfccweax6p1rdjkOp18l2YfkhEv7+KRx/ron+sLNWBG
	FnAoH3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeiD-0000000Cpfq-1jlx;
	Wed, 20 Aug 2025 09:02:29 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodxW-0000000Ch6z-2A3L
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Aug 2025 08:14:15 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7e8704c7a46so728929185a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Aug 2025 01:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755677653; x=1756282453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUGdpiEBvij3QABk3TeXAVu9+edp1QZJrsLkuXoDk+M=;
        b=ll4ZXRcKGfoOUBWtsTwAYAFNL/rLlbwn6JX1Aej0do4zESvcMRKm0mmMshOeLSTJoR
         bb9OANBgj+wW2clnLh9+sjVL/C2D6VMstb7G5o4f7MCjQQC5ImmL+H0efVSJs6G6AbB5
         b54MKF5mUMpEdfY0W8R8e/agg/bp2IuTLCbns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755677653; x=1756282453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUGdpiEBvij3QABk3TeXAVu9+edp1QZJrsLkuXoDk+M=;
        b=XhJjjk1owEuAe3TtSm2pJqpbUrv3wuxmKpeVnSRU89wEIl6bANd13b9SYtMFr6yNs3
         zn5R4FrmEX00sv50cqBU9FevIRvsyZ7wjvkN8acvHuCBHr/Le3tBzwOtnBdYDpibkBXh
         pYFG9nEsOVhEi2Ac7w3mdxwAbH6Z0Qq4eDw/Z3JfxgyjMo38Eii8bAqj8hACvqPh0shJ
         HRn+cpEYuP/kiIoXQGoHJhf8kSFjK51V1s3o4rNH7ojnXoXevCjot0YwDw6UxErXYU++
         qnZlHDcVu7qE0x/tKwQUNNEy5azr6EU3WpTIDRSJWk06o7zVbkIQeX7PZ7DCbqJpAPNu
         fs4g==
X-Forwarded-Encrypted: i=1; AJvYcCW8QHLe5aVOU+bCGMqo6VYAeCJKjuT1fibp2bhkaVcgmbZ0DTAioXUUG+zDpH9FoRFHnrMEx3h9tloGWFHwWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ3G6Ht/LkdIAgz/tH1VGmHFcf6n3CZZ+9CvXJ3aNCo2YSl19D
	cRjSkiHFZOwvdTmonyxHN8TKl+l9MHcozvlpaphr2mIRyU7AFaf1mwQWkOgENKUxR80OhbCbL3L
	6V6hBKg==
X-Gm-Gg: ASbGncv0ISu9Y0g1aRe6lwAWBdfvUJLFP6zVH2ITuxvn4LfVrEGFzMALa34dbqW8ofX
	O3sjKOeKxeAmMK0nUmc4bteHvn8jUZ7tR4QnBUWaJ5+Q+Sc+vtlzYRl2R6lC/uCFfXYY0aJT0yk
	E+VloL+uxJR7mH6ZhI4ZwKdMEz7+vczACJH629JSzxYA0rUpQcs39mddyVH+YXkptL6IGZDF2iE
	gwVrTn0NHGXJe/cZCKyHNwfiQ+q+2rqLv0AFCQUqFV8oaxHgg4kXoAC9cOvJh8ESoUTCGuXzvov
	DGqpfTxXcYZ8HoZ7CzyKqVQvdS0rTuOyB9B/B9mPvg5Kyc6LkIm7tmYugfM/WeNZbIy8WtBircC
	1V96D3lBXhEaAeEvx5HqytAl3VZpV01Tip9F9ptQ52RnAH41GpYpIT25nyUkE1g==
X-Google-Smtp-Source: AGHT+IEdJrbH7rZpdL4nR2957UIAcTV3RHxNdisj4zfdgNs/e9b1w8Vt79rW9MiD+n4TheZ6FQ1hgg==
X-Received: by 2002:a05:620a:710c:b0:7e8:46f8:6d5e with SMTP id af79cd13be357-7e9fcb08b87mr228948585a.51.1755677652613;
        Wed, 20 Aug 2025 01:14:12 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e192901sm900408485a.38.2025.08.20.01.14.11
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 01:14:11 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b0bf08551cso181311cf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Aug 2025 01:14:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkFj+/DavIUY5O6sz43TabL6oq6DIEJcjz9Y7KNuyzhgAm2/PVjBGGVyc78C/s2txl4A68D2o0Ib8KvXm6Nw==@lists.infradead.org
X-Received: by 2002:ac8:580f:0:b0:4b0:8318:a95 with SMTP id
 d75a77b69052e-4b291917518mr3343931cf.8.1755677650289; Wed, 20 Aug 2025
 01:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250820075405.1041838-1-wenst@chromium.org>
In-Reply-To: <20250820075405.1041838-1-wenst@chromium.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 20 Aug 2025 17:13:52 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DTOJ2=ibyykpCxDnUhUM8EXm4-MShKxBbH02FA8fzQGw@mail.gmail.com>
X-Gm-Features: Ac12FXz1tD17T4pJyJ5nYaNhIcW7uWOQMmG3q0C-wH7bBxp3Zu-B_gudXTVL_ek
Message-ID: <CAAFQd5DTOJ2=ibyykpCxDnUhUM8EXm4-MShKxBbH02FA8fzQGw@mail.gmail.com>
Subject: Re: [PATCH v2] media: mediatek: vcodec: Use spinlock for context list
 protection lock
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_011414_593182_D8DC3EE9 
X-CRM114-Status: GOOD (  24.85  )
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

On Wed, Aug 20, 2025 at 4:54=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Previously a mutex was added to protect the encoder and decoder context
> lists from unexpected changes originating from the SCP IP block, causing
> the context pointer to go invalid, resulting in a NULL pointer
> dereference in the IPI handler.
>
> Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
> context. This causes a big warning from the scheduler. This was first
> reported downstream on the ChromeOS kernels, but is also reproducible
> on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even though
> the actual capture format is not supported, the affected code paths
> are triggered.
>
> Since this lock just protects the context list and operations on it are
> very fast, it should be OK to switch to a spinlock.
>
> Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to protect dec=
oder context list")
> Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect enc=
oder context list")
> Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Switched to _irqsave / _irqrestore variants even in helper only called
>   by IRQ handler (Tomasz)
>
>  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-----
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
>  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  5 +++--
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-----
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
>  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  5 +++--
>  7 files changed, 28 insertions(+), 20 deletions(-)

Thanks!

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best,
Tomasz

>
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> index d7027d600208..223fb2294894 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> @@ -47,30 +47,32 @@ static void mtk_vcodec_vpu_reset_dec_handler(void *pr=
iv)
>  {
>         struct mtk_vcodec_dec_dev *dev =3D priv;
>         struct mtk_vcodec_dec_ctx *ctx;
> +       unsigned long flags;
>
>         dev_err(&dev->plat_dev->dev, "Watchdog timeout!!");
>
> -       mutex_lock(&dev->dev_ctx_lock);
> +       spin_lock_irqsave(&dev->dev_ctx_lock, flags);
>         list_for_each_entry(ctx, &dev->ctx_list, list) {
>                 ctx->state =3D MTK_STATE_ABORT;
>                 mtk_v4l2_vdec_dbg(0, ctx, "[%d] Change to state MTK_STATE=
_ABORT", ctx->id);
>         }
> -       mutex_unlock(&dev->dev_ctx_lock);
> +       spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
>  }
>
>  static void mtk_vcodec_vpu_reset_enc_handler(void *priv)
>  {
>         struct mtk_vcodec_enc_dev *dev =3D priv;
>         struct mtk_vcodec_enc_ctx *ctx;
> +       unsigned long flags;
>
>         dev_err(&dev->plat_dev->dev, "Watchdog timeout!!");
>
> -       mutex_lock(&dev->dev_ctx_lock);
> +       spin_lock_irqsave(&dev->dev_ctx_lock, flags);
>         list_for_each_entry(ctx, &dev->ctx_list, list) {
>                 ctx->state =3D MTK_STATE_ABORT;
>                 mtk_v4l2_vdec_dbg(0, ctx, "[%d] Change to state MTK_STATE=
_ABORT", ctx->id);
>         }
> -       mutex_unlock(&dev->dev_ctx_lock);
> +       spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
>  }
>
>  static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg =3D {
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index 46d176e6de63..3b81fae9f913 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -198,6 +198,7 @@ static int fops_vcodec_open(struct file *file)
>         struct mtk_vcodec_dec_ctx *ctx =3D NULL;
>         int ret =3D 0, i, hw_count;
>         struct vb2_queue *src_vq;
> +       unsigned long flags;
>
>         ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
>         if (!ctx)
> @@ -267,9 +268,9 @@ static int fops_vcodec_open(struct file *file)
>
>         ctx->dev->vdec_pdata->init_vdec_params(ctx);
>
> -       mutex_lock(&dev->dev_ctx_lock);
> +       spin_lock_irqsave(&dev->dev_ctx_lock, flags);
>         list_add(&ctx->list, &dev->ctx_list);
> -       mutex_unlock(&dev->dev_ctx_lock);
> +       spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
>         mtk_vcodec_dbgfs_create(ctx);
>
>         mutex_unlock(&dev->dev_mutex);
> @@ -294,6 +295,7 @@ static int fops_vcodec_release(struct file *file)
>  {
>         struct mtk_vcodec_dec_dev *dev =3D video_drvdata(file);
>         struct mtk_vcodec_dec_ctx *ctx =3D file_to_dec_ctx(file);
> +       unsigned long flags;
>
>         mtk_v4l2_vdec_dbg(0, ctx, "[%d] decoder", ctx->id);
>         mutex_lock(&dev->dev_mutex);
> @@ -312,9 +314,9 @@ static int fops_vcodec_release(struct file *file)
>         v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
>
>         mtk_vcodec_dbgfs_remove(dev, ctx->id);
> -       mutex_lock(&dev->dev_ctx_lock);
> +       spin_lock_irqsave(&dev->dev_ctx_lock, flags);
>         list_del_init(&ctx->list);
> -       mutex_unlock(&dev->dev_ctx_lock);
> +       spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
>         kfree(ctx);
>         mutex_unlock(&dev->dev_mutex);
>         return 0;
> @@ -407,7 +409,7 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
>         for (i =3D 0; i < MTK_VDEC_HW_MAX; i++)
>                 mutex_init(&dev->dec_mutex[i]);
>         mutex_init(&dev->dev_mutex);
> -       mutex_init(&dev->dev_ctx_lock);
> +       spin_lock_init(&dev->dev_ctx_lock);
>         spin_lock_init(&dev->irqlock);
>
>         snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index d047d7c580fb..9d68808e8f9c 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -285,7 +285,7 @@ struct mtk_vcodec_dec_dev {
>         /* decoder hardware mutex lock */
>         struct mutex dec_mutex[MTK_VDEC_HW_MAX];
>         struct mutex dev_mutex;
> -       struct mutex dev_ctx_lock;
> +       spinlock_t dev_ctx_lock;
>         struct workqueue_struct *decode_workqueue;
>
>         spinlock_t irqlock;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index 145958206e38..40b97f114cf6 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -75,16 +75,17 @@ static void handle_get_param_msg_ack(const struct vde=
c_vpu_ipi_get_param_ack *ms
>  static bool vpu_dec_check_ap_inst(struct mtk_vcodec_dec_dev *dec_dev, st=
ruct vdec_vpu_inst *vpu)
>  {
>         struct mtk_vcodec_dec_ctx *ctx;
> +       unsigned long flags;
>         int ret =3D false;
>
> -       mutex_lock(&dec_dev->dev_ctx_lock);
> +       spin_lock_irqsave(&dec_dev->dev_ctx_lock, flags);
>         list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
>                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vpu) {
>                         ret =3D true;
>                         break;
>                 }
>         }
> -       mutex_unlock(&dec_dev->dev_ctx_lock);
> +       spin_unlock_irqrestore(&dec_dev->dev_ctx_lock, flags);
>
>         return ret;
>  }
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.c
> index fb1c3bdc2dae..82b8ff38e8f1 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> @@ -117,6 +117,7 @@ static int fops_vcodec_open(struct file *file)
>         struct mtk_vcodec_enc_ctx *ctx =3D NULL;
>         int ret =3D 0;
>         struct vb2_queue *src_vq;
> +       unsigned long flags;
>
>         ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
>         if (!ctx)
> @@ -176,9 +177,9 @@ static int fops_vcodec_open(struct file *file)
>         mtk_v4l2_venc_dbg(2, ctx, "Create instance [%d]@%p m2m_ctx=3D%p "=
,
>                           ctx->id, ctx, ctx->m2m_ctx);
>
> -       mutex_lock(&dev->dev_ctx_lock);
> +       spin_lock_irqsave(&dev->dev_ctx_lock, flags);
>         list_add(&ctx->list, &dev->ctx_list);
> -       mutex_unlock(&dev->dev_ctx_lock);
> +       spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
>
>         mutex_unlock(&dev->dev_mutex);
>         mtk_v4l2_venc_dbg(0, ctx, "%s encoder [%d]", dev_name(&dev->plat_=
dev->dev),
> @@ -203,6 +204,7 @@ static int fops_vcodec_release(struct file *file)
>  {
>         struct mtk_vcodec_enc_dev *dev =3D video_drvdata(file);
>         struct mtk_vcodec_enc_ctx *ctx =3D file_to_enc_ctx(file);
> +       unsigned long flags;
>
>         mtk_v4l2_venc_dbg(1, ctx, "[%d] encoder", ctx->id);
>         mutex_lock(&dev->dev_mutex);
> @@ -213,9 +215,9 @@ static int fops_vcodec_release(struct file *file)
>         v4l2_fh_exit(&ctx->fh);
>         v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
>
> -       mutex_lock(&dev->dev_ctx_lock);
> +       spin_lock_irqsave(&dev->dev_ctx_lock, flags);
>         list_del_init(&ctx->list);
> -       mutex_unlock(&dev->dev_ctx_lock);
> +       spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
>         kfree(ctx);
>         mutex_unlock(&dev->dev_mutex);
>         return 0;
> @@ -297,7 +299,7 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
>
>         mutex_init(&dev->enc_mutex);
>         mutex_init(&dev->dev_mutex);
> -       mutex_init(&dev->dev_ctx_lock);
> +       spin_lock_init(&dev->dev_ctx_lock);
>         spin_lock_init(&dev->irqlock);
>
>         snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.h
> index 5b304a551236..0cddfa13594f 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
> @@ -206,7 +206,7 @@ struct mtk_vcodec_enc_dev {
>         /* encoder hardware mutex lock */
>         struct mutex enc_mutex;
>         struct mutex dev_mutex;
> -       struct mutex dev_ctx_lock;
> +       spinlock_t dev_ctx_lock;
>         struct workqueue_struct *encode_workqueue;
>
>         int enc_irq;
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> index 51bb7ee141b9..3c229b1f6b21 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> @@ -45,16 +45,17 @@ static void handle_enc_encode_msg(struct venc_vpu_ins=
t *vpu, const void *data)
>  static bool vpu_enc_check_ap_inst(struct mtk_vcodec_enc_dev *enc_dev, st=
ruct venc_vpu_inst *vpu)
>  {
>         struct mtk_vcodec_enc_ctx *ctx;
> +       unsigned long flags;
>         int ret =3D false;
>
> -       mutex_lock(&enc_dev->dev_ctx_lock);
> +       spin_lock_irqsave(&enc_dev->dev_ctx_lock, flags);
>         list_for_each_entry(ctx, &enc_dev->ctx_list, list) {
>                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vpu) {
>                         ret =3D true;
>                         break;
>                 }
>         }
> -       mutex_unlock(&enc_dev->dev_ctx_lock);
> +       spin_unlock_irqrestore(&enc_dev->dev_ctx_lock, flags);
>
>         return ret;
>  }
> --
> 2.51.0.rc1.167.g924127e9c0-goog
>

