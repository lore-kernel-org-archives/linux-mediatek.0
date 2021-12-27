Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD03C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 07:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZbiABdtrXyetb1jPJg9n0KMS9K673S1YBaQzEvxeaw=; b=jMM4po1GnuHFwF
	4C2jojfPZUV1jHpvB0JW7uwmnqQolHFAu3K9sO/3uySX4jdb0mVZjDwIg9ZKDjtJXGgLOvKyRdinV
	HDPpR2hXuxC4b8kbG08iO5UtpoowRVbpJ1kGtLXNHN6uqZUlffPpqiJW42eHtx+WRsGLKJ+IX/8HF
	1wcyNYiBwpAtZnTgDYltsNFXCOmomN4HZvhESO36Ifah9ua8IAs+0cwK2Y4f1N4z9B7W3Pz7NawXv
	fpq9w/v/0dKqH6N6ulnFgdv8eNJEs3Za3SyZP4GKyrRcvGVo/fdAzlC/AmEkzfZOS+5PacCCYSMTZ
	46nxQabHnJep6RGwOPFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1k5h-00GIar-Oz; Mon, 27 Dec 2021 07:06:41 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1k5f-00GIZz-Cs
 for linux-mediatek@lists.infradead.org; Mon, 27 Dec 2021 07:06:40 +0000
Received: by mail-ua1-x935.google.com with SMTP id t18so18009279uaj.1
 for <linux-mediatek@lists.infradead.org>; Sun, 26 Dec 2021 23:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mn5z8Yw7iLT0GibyNVJxOywmkk9xNTM1BsrsY50wxA0=;
 b=Fmu3inELwWGRoc+/d047G0g91Zv/JR90W9NOSw/paEwBvKsD/seV2kd6KMhmQMyjEP
 VxxFHzhHRq85jeUM+nCTmXkBEnRGxQJodRABLc7BfGzPji+Jo1iD+h8ZKO8Esce8q2XT
 3W8yFRUP3uzfuiVQK6DTrBiiFl5jnApeNlSf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mn5z8Yw7iLT0GibyNVJxOywmkk9xNTM1BsrsY50wxA0=;
 b=SZ5ghDWbmQ0vczsuC5wngwbx5sfZsBi7dOkz/OpGAh9PQqeFG+keioy3sg/05XY5Pp
 R7O8AgdPQ25rH4+7bkcLONG0TE5WP6s6xUgfZWyI989SCU9qZ5DUSCaZyBEJ7gpn+pu4
 wkweU7UNItfIgPXas/K02VTPXBmrAWMtRHfeFSclZ1Il1iCJoYzG6dWqZVvk9K4X1OKP
 4TD2VmvjuccoUr6S2aIxvOzLA+zDOrnnQ0xPbqPnOHXxWYqV2grWrB4OAr74TMNnK7/J
 XosLPlCqdnccMohFht/DsPxJxUgT1KxdAx/AGsxhTd+5GHqI/Ov6wqKHgXWlqPTFhn0K
 zIvA==
X-Gm-Message-State: AOAM5308G3mRU/KM+gel8PJGwFdqDtHTaU9GYWnPlMuOsc0OwN4bxVlo
 2WVXtnPWnnwDFd7O/kgdHKXPFwt8Nawl7Q==
X-Google-Smtp-Source: ABdhPJwacenXTacRE24mhZyfl4jXBO0z8brF0tcLpw+y+uPs/BNFX5M3zxB4IKi5YNlPnZTNYe3ucg==
X-Received: by 2002:ab0:2b96:: with SMTP id q22mr4453738uar.87.1640588797358; 
 Sun, 26 Dec 2021 23:06:37 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id f132sm3127946vkf.18.2021.12.26.23.06.36
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Dec 2021 23:06:37 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id v14so7902616uau.2
 for <linux-mediatek@lists.infradead.org>; Sun, 26 Dec 2021 23:06:36 -0800 (PST)
X-Received: by 2002:a05:6102:2368:: with SMTP id
 o8mr4126408vsa.47.1640588796568; 
 Sun, 26 Dec 2021 23:06:36 -0800 (PST)
MIME-Version: 1.0
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
 <20211117130635.11633-7-dafna.hirschfeld@collabora.com>
In-Reply-To: <20211117130635.11633-7-dafna.hirschfeld@collabora.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 27 Dec 2021 16:06:25 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXqwWDhCVrdvdUZ3U6P8-CJXo22mkQ_wrQ3_LLGacOvvg@mail.gmail.com>
Message-ID: <CAPBb6MXqwWDhCVrdvdUZ3U6P8-CJXo22mkQ_wrQ3_LLGacOvvg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] media: mtk-vcodec: don't check return val of
 mtk_venc_get_q_data
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 kernel@collabora.com, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, courbot@chromium.org, 
 Dafna Hirschfeld <dafna3@gmail.com>, eizan@chromium.org,
 houlong.wei@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Irui Wang <irui.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= <maoguang.meng@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, minghsiu.tsai@mediatek.com, 
 Tomasz Figa <tfiga@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_230639_465604_1D7056FB 
X-CRM114-Status: GOOD (  22.51  )
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

On Wed, Nov 17, 2021 at 10:07 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> The function mtk_venc_get_q_data always returns a reference
> so there is no need to check if the return value is null.
> In addition move the q_data initialization to the declaration
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>


> ---
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 39 ++++---------------
>  1 file changed, 7 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index be28f2401839..5caaeb4773ca 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -399,7 +399,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
>         struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
>         const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
>         struct vb2_queue *vq;
> -       struct mtk_q_data *q_data;
> +       struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
>         int i, ret;
>         const struct mtk_video_fmt *fmt;
>
> @@ -414,12 +414,6 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
>                 return -EBUSY;
>         }
>
> -       q_data = mtk_venc_get_q_data(ctx, f->type);
> -       if (!q_data) {
> -               mtk_v4l2_err("fail to get q data");
> -               return -EINVAL;
> -       }
> -
>         fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
>         if (!fmt) {
>                 fmt = &ctx->dev->venc_pdata->capture_formats[0];
> @@ -460,7 +454,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
>         struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
>         const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
>         struct vb2_queue *vq;
> -       struct mtk_q_data *q_data;
> +       struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
>         int ret, i;
>         const struct mtk_video_fmt *fmt;
>
> @@ -475,12 +469,6 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
>                 return -EBUSY;
>         }
>
> -       q_data = mtk_venc_get_q_data(ctx, f->type);
> -       if (!q_data) {
> -               mtk_v4l2_err("fail to get q data");
> -               return -EINVAL;
> -       }
> -
>         fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
>         if (!fmt) {
>                 fmt = &ctx->dev->venc_pdata->output_formats[0];
> @@ -520,14 +508,13 @@ static int vidioc_venc_g_fmt(struct file *file, void *priv,
>         struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
>         struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
>         struct vb2_queue *vq;
> -       struct mtk_q_data *q_data;
> +       struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
>         int i;
>
>         vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
>         if (!vq)
>                 return -EINVAL;
>
> -       q_data = mtk_venc_get_q_data(ctx, f->type);
>
>         pix->width = q_data->coded_width;
>         pix->height = q_data->coded_height;
> @@ -596,15 +583,11 @@ static int vidioc_venc_g_selection(struct file *file, void *priv,
>                                      struct v4l2_selection *s)
>  {
>         struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> -       struct mtk_q_data *q_data;
> +       struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, s->type);
>
>         if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
>                 return -EINVAL;
>
> -       q_data = mtk_venc_get_q_data(ctx, s->type);
> -       if (!q_data)
> -               return -EINVAL;
> -
>         switch (s->target) {
>         case V4L2_SEL_TGT_CROP_DEFAULT:
>         case V4L2_SEL_TGT_CROP_BOUNDS:
> @@ -630,15 +613,11 @@ static int vidioc_venc_s_selection(struct file *file, void *priv,
>                                      struct v4l2_selection *s)
>  {
>         struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> -       struct mtk_q_data *q_data;
> +       struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, s->type);
>
>         if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
>                 return -EINVAL;
>
> -       q_data = mtk_venc_get_q_data(ctx, s->type);
> -       if (!q_data)
> -               return -EINVAL;
> -
>         switch (s->target) {
>         case V4L2_SEL_TGT_CROP:
>                 /* Only support crop from (0,0) */
> @@ -805,11 +784,9 @@ static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
>                                    struct device *alloc_devs[])
>  {
>         struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vq);
> -       struct mtk_q_data *q_data;
> +       struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, vq->type);
>         unsigned int i;
>
> -       q_data = mtk_venc_get_q_data(ctx, vq->type);
> -
>         if (q_data == NULL)
>                 return -EINVAL;
>
> @@ -829,11 +806,9 @@ static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
>  static int vb2ops_venc_buf_prepare(struct vb2_buffer *vb)
>  {
>         struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> -       struct mtk_q_data *q_data;
> +       struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, vb->vb2_queue->type);
>         int i;
>
> -       q_data = mtk_venc_get_q_data(ctx, vb->vb2_queue->type);
> -
>         for (i = 0; i < q_data->fmt->num_planes; i++) {
>                 if (vb2_plane_size(vb, i) < q_data->sizeimage[i]) {
>                         mtk_v4l2_err("data will not fit into plane %d (%lu < %d)",
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
