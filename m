Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2895EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 07:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SlkAL/4t49HVmaX77Q0h5L6eNijfxtvxlQZh0sKJJB4=; b=ZFrdqiCBnOhDNh
	si/g8gA12ypzv34DciVCVOvmVI3Un+t+GXYEdvNyrlgsDQUNe4ow4PFH6ZQjmfr3QDCIvRS1zB/Bo
	Y+k8X3kcfcXLqzdGePxlJAvl1MVX3eqqs4qI2QyG6jDG4k2NVOL9nncje/neshcZOqUn6RxtKLbla
	osDOR5fjxBPl6rlP2YnltsJmCOXw8FaPTRHhTmvUOR56Hq9DVnlw7u893Iht7E3uqErrrbR9W3sYX
	jjS/sMkFR8TM0E1Hx3jjXpm88Z+TKeJv8P6yc9ujs+JdrjnzxmeZ+D/TDLfp+gsUFx/Db00HXSsC1
	MB+IwuDA/fbJ6cNo+/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1kDX-00GIvP-KQ; Mon, 27 Dec 2021 07:14:47 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1kDU-00GIv5-Nf
 for linux-mediatek@lists.infradead.org; Mon, 27 Dec 2021 07:14:46 +0000
Received: by mail-qk1-x72f.google.com with SMTP id e25so8047498qkl.12
 for <linux-mediatek@lists.infradead.org>; Sun, 26 Dec 2021 23:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4FLR5aRa6nhcAgyU88oGHnr22kyfHCN3jOQK5fS/Kkc=;
 b=M0PfZbMlw980hwdVk9JbyWaetJDLPWLwxYeBHJdEl2uuiJ8GnjnEPfcxX0K8CQR/n4
 V4QK4xZ5M1mZXcLBSs7h6N1U4dRbPnw31gHEJs57N/bhAM6moXrSxwLfv2P+yF3k81zp
 9BTuY0mt3jxwVqUh25JSB2TvEHEtVAxQXrOAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4FLR5aRa6nhcAgyU88oGHnr22kyfHCN3jOQK5fS/Kkc=;
 b=3iyNsgCe9q/dBPghnbuEISFNohXK0cf+/MYGGaqTidTq9sI7nkD5fp9QYFywn2RF+W
 sgkEeQv789QqbTDHRhCaVWDNYghQExz0uleHhWbPjyK+8yjV3WfW4vTT7VLgYKfEqD8J
 eP3h67ec9Exn5fKoV+Pvj5WBCM2Se/c/zwvHyISQAaHGvrUMj9ol7nmR+i20GJIPw80i
 bZTYoBbjy30rg8PmIKGJ1aNVGknDHvjf7bWA+Lsy7oPmgm/V/R0FvUWJcn7/FF8RQBrk
 uyAReB8W5FGzcSfsoniyFGyyjXVrs0+Av5eGPmoruHphBWxOWWhrBaXtKQmOXC5+YyFM
 h08w==
X-Gm-Message-State: AOAM532QHASknu04/KSH3zCJJYV75QTZk1+lwYIthN2JPNc3wN6AIAvS
 gb8kWdKhvX+jwMdXs7GTPlSNaBPXy8/oXQ==
X-Google-Smtp-Source: ABdhPJzYBF5gDs9sgjmviPiPbuAzjl5XXqUDbpiAk3IzcqwY5K68BkgroLQ+gLbsHOz4+DFjUBRf2g==
X-Received: by 2002:a05:620a:4249:: with SMTP id
 w9mr11131342qko.251.1640589283417; 
 Sun, 26 Dec 2021 23:14:43 -0800 (PST)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com.
 [209.85.219.49])
 by smtp.gmail.com with ESMTPSA id o4sm11893380qkh.107.2021.12.26.23.14.43
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Dec 2021 23:14:43 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id h5so13153233qvh.8
 for <linux-mediatek@lists.infradead.org>; Sun, 26 Dec 2021 23:14:43 -0800 (PST)
X-Received: by 2002:a05:6102:3218:: with SMTP id
 r24mr4753042vsf.74.1640588787493; 
 Sun, 26 Dec 2021 23:06:27 -0800 (PST)
MIME-Version: 1.0
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
 <20211117130635.11633-6-dafna.hirschfeld@collabora.com>
In-Reply-To: <20211117130635.11633-6-dafna.hirschfeld@collabora.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 27 Dec 2021 16:06:16 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXyV7K3NuSLCWApC_TNjhFW=+3Eb_7d2028Nyno7fnkMA@mail.gmail.com>
Message-ID: <CAPBb6MXyV7K3NuSLCWApC_TNjhFW=+3Eb_7d2028Nyno7fnkMA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] media: mtk-vcodec: replace func vidioc_try_fmt
 with two funcs for out/cap
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
X-CRM114-CacheID: sfid-20211226_231444_813942_8B1458E5 
X-CRM114-Status: GOOD (  25.98  )
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
> The function vidioc_try_fmt has a big 'if-else' for
> the capture and output cases. There is hardly any code
> outside of that condition. It is therefore better to split
> that functions into two different functions, one for each case.
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Makes much more sense that way, thanks!

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>


> ---
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 149 +++++++++---------
>  1 file changed, 72 insertions(+), 77 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index fb3cf804c96a..be28f2401839 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -263,87 +263,82 @@ static struct mtk_q_data *mtk_venc_get_q_data(struct mtk_vcodec_ctx *ctx,
>         return &ctx->q_data[MTK_Q_DATA_DST];
>  }
>
> +static void vidioc_try_fmt_cap(struct v4l2_format *f)
> +{
> +       f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> +       f->fmt.pix_mp.num_planes = 1;
> +       f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
> +       f->fmt.pix_mp.flags = 0;
> +}
> +
>  /* V4L2 specification suggests the driver corrects the format struct if any of
>   * the dimensions is unsupported
>   */
> -static int vidioc_try_fmt(struct mtk_vcodec_ctx *ctx, struct v4l2_format *f,
> -                         const struct mtk_video_fmt *fmt)
> +static int vidioc_try_fmt_out(struct mtk_vcodec_ctx *ctx, struct v4l2_format *f,
> +                             const struct mtk_video_fmt *fmt)
>  {
>         struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
> +       int tmp_w, tmp_h;
> +       unsigned int max_width, max_height;
>
>         pix_fmt_mp->field = V4L2_FIELD_NONE;
>
> -       if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> -               pix_fmt_mp->num_planes = 1;
> -               pix_fmt_mp->plane_fmt[0].bytesperline = 0;
> -       } else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> -               int tmp_w, tmp_h;
> -               unsigned int max_width, max_height;
> -
> -               if (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) {
> -                       max_width = MTK_VENC_4K_MAX_W;
> -                       max_height = MTK_VENC_4K_MAX_H;
> -               } else {
> -                       max_width = MTK_VENC_HD_MAX_W;
> -                       max_height = MTK_VENC_HD_MAX_H;
> -               }
> +       if (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) {
> +               max_width = MTK_VENC_4K_MAX_W;
> +               max_height = MTK_VENC_4K_MAX_H;
> +       } else {
> +               max_width = MTK_VENC_HD_MAX_W;
> +               max_height = MTK_VENC_HD_MAX_H;
> +       }
>
> -               pix_fmt_mp->height = clamp(pix_fmt_mp->height,
> -                                       MTK_VENC_MIN_H,
> -                                       max_height);
> -               pix_fmt_mp->width = clamp(pix_fmt_mp->width,
> -                                       MTK_VENC_MIN_W,
> -                                       max_width);
> +       pix_fmt_mp->height = clamp(pix_fmt_mp->height, MTK_VENC_MIN_H, max_height);
> +       pix_fmt_mp->width = clamp(pix_fmt_mp->width, MTK_VENC_MIN_W, max_width);
>
> -               /* find next closer width align 16, heign align 32, size align
> -                * 64 rectangle
> -                */
> -               tmp_w = pix_fmt_mp->width;
> -               tmp_h = pix_fmt_mp->height;
> -               v4l_bound_align_image(&pix_fmt_mp->width,
> -                                       MTK_VENC_MIN_W,
> -                                       max_width, 4,
> -                                       &pix_fmt_mp->height,
> -                                       MTK_VENC_MIN_H,
> -                                       max_height, 5, 6);
> -
> -               if (pix_fmt_mp->width < tmp_w &&
> -                       (pix_fmt_mp->width + 16) <= max_width)
> -                       pix_fmt_mp->width += 16;
> -               if (pix_fmt_mp->height < tmp_h &&
> -                       (pix_fmt_mp->height + 32) <= max_height)
> -                       pix_fmt_mp->height += 32;
> -
> -               mtk_v4l2_debug(0,
> -                       "before resize width=%d, height=%d, after resize width=%d, height=%d, sizeimage=%d %d",
> -                       tmp_w, tmp_h, pix_fmt_mp->width,
> -                       pix_fmt_mp->height,
> -                       pix_fmt_mp->plane_fmt[0].sizeimage,
> -                       pix_fmt_mp->plane_fmt[1].sizeimage);
> -
> -               pix_fmt_mp->num_planes = fmt->num_planes;
> -               pix_fmt_mp->plane_fmt[0].sizeimage =
> -                               pix_fmt_mp->width * pix_fmt_mp->height +
> -                               ((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
> -               pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
> -
> -               if (pix_fmt_mp->num_planes == 2) {
> -                       pix_fmt_mp->plane_fmt[1].sizeimage =
> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
> -                               (ALIGN(pix_fmt_mp->width, 16) * 16);
> -                       pix_fmt_mp->plane_fmt[2].sizeimage = 0;
> -                       pix_fmt_mp->plane_fmt[1].bytesperline =
> -                                                       pix_fmt_mp->width;
> -                       pix_fmt_mp->plane_fmt[2].bytesperline = 0;
> -               } else if (pix_fmt_mp->num_planes == 3) {
> -                       pix_fmt_mp->plane_fmt[1].sizeimage =
> -                       pix_fmt_mp->plane_fmt[2].sizeimage =
> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
> -                               ((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
> -                       pix_fmt_mp->plane_fmt[1].bytesperline =
> -                               pix_fmt_mp->plane_fmt[2].bytesperline =
> -                               pix_fmt_mp->width / 2;
> -               }
> +       /* find next closer width align 16, heign align 32, size align
> +        * 64 rectangle
> +        */
> +       tmp_w = pix_fmt_mp->width;
> +       tmp_h = pix_fmt_mp->height;
> +       v4l_bound_align_image(&pix_fmt_mp->width,
> +                             MTK_VENC_MIN_W,
> +                             max_width, 4,
> +                             &pix_fmt_mp->height,
> +                             MTK_VENC_MIN_H,
> +                             max_height, 5, 6);
> +
> +       if (pix_fmt_mp->width < tmp_w && (pix_fmt_mp->width + 16) <= max_width)
> +               pix_fmt_mp->width += 16;
> +       if (pix_fmt_mp->height < tmp_h && (pix_fmt_mp->height + 32) <= max_height)
> +               pix_fmt_mp->height += 32;
> +
> +       mtk_v4l2_debug(0, "before resize w=%d, h=%d, after resize w=%d, h=%d, sizeimage=%d %d",
> +                      tmp_w, tmp_h, pix_fmt_mp->width,
> +                      pix_fmt_mp->height,
> +                      pix_fmt_mp->plane_fmt[0].sizeimage,
> +                      pix_fmt_mp->plane_fmt[1].sizeimage);
> +
> +       pix_fmt_mp->num_planes = fmt->num_planes;
> +       pix_fmt_mp->plane_fmt[0].sizeimage =
> +                       pix_fmt_mp->width * pix_fmt_mp->height +
> +                       ((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
> +       pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
> +
> +       if (pix_fmt_mp->num_planes == 2) {
> +               pix_fmt_mp->plane_fmt[1].sizeimage =
> +                       (pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
> +                       (ALIGN(pix_fmt_mp->width, 16) * 16);
> +               pix_fmt_mp->plane_fmt[2].sizeimage = 0;
> +               pix_fmt_mp->plane_fmt[1].bytesperline =
> +                                               pix_fmt_mp->width;
> +               pix_fmt_mp->plane_fmt[2].bytesperline = 0;
> +       } else if (pix_fmt_mp->num_planes == 3) {
> +               pix_fmt_mp->plane_fmt[1].sizeimage =
> +               pix_fmt_mp->plane_fmt[2].sizeimage =
> +                       (pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
> +                       ((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
> +               pix_fmt_mp->plane_fmt[1].bytesperline =
> +                       pix_fmt_mp->plane_fmt[2].bytesperline =
> +                       pix_fmt_mp->width / 2;
>         }
>
>         pix_fmt_mp->flags = 0;
> @@ -432,9 +427,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
>         }
>
>         q_data->fmt = fmt;
> -       ret = vidioc_try_fmt(ctx, f, q_data->fmt);
> -       if (ret)
> -               return ret;
> +       vidioc_try_fmt_cap(f);
>
>         q_data->coded_width = f->fmt.pix_mp.width;
>         q_data->coded_height = f->fmt.pix_mp.height;
> @@ -494,7 +487,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
>                 f->fmt.pix.pixelformat = fmt->fourcc;
>         }
>
> -       ret = vidioc_try_fmt(ctx, f, fmt);
> +       ret = vidioc_try_fmt_out(ctx, f, fmt);
>         if (ret)
>                 return ret;
>
> @@ -572,7 +565,9 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
>         f->fmt.pix_mp.quantization = ctx->quantization;
>         f->fmt.pix_mp.xfer_func = ctx->xfer_func;
>
> -       return vidioc_try_fmt(ctx, f, fmt);
> +       vidioc_try_fmt_cap(f);
> +
> +       return 0;
>  }
>
>  static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
> @@ -594,7 +589,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
>                 f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>         }
>
> -       return vidioc_try_fmt(ctx, f, fmt);
> +       return vidioc_try_fmt_out(ctx, f, fmt);
>  }
>
>  static int vidioc_venc_g_selection(struct file *file, void *priv,
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
