Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDD1D5E13A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Nov 2024 06:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkvxW0TELGak9TGChpUjLN8WW2TtIQcHiwQEYFYHFLY=; b=BmfV7OhWk6+pcNe+W5N8gS62yb
	52j8iLtoOkhl/p7BkVoGExvRUgVVjdmXBNENXtUWcc23+Y8Sa5HOWc8JkFeusl2rj0LGLqwaO/+ow
	UZdFXv33zgol3jgbSBNqg4vvyvUcia8N7ePvWZWtL2IWZM/0/cwSQjDmMaMJMQteGan8jBGXnFDSK
	2tddIdtFNFWozKlfIL9SGKGyYBTaM6vTg8ZZdVzGlFa9FpNAJSrXsN7m1YLTchI+ByjDipgLop8Zv
	LONI1ACCsgppOjvaS/jYUqJxx60/Bj/7sc0UN3tlbuGTRoXO7QpjRVSL0kd6XUb0BeAF8Y3M/meaE
	X+XvkRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9I6M-00000009SHY-2FKu;
	Fri, 08 Nov 2024 06:04:10 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9I4Z-00000009S0H-3qkV
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Nov 2024 06:02:21 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53c73f01284so1883025e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Nov 2024 22:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731045738; x=1731650538; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkvxW0TELGak9TGChpUjLN8WW2TtIQcHiwQEYFYHFLY=;
        b=RQ+Odt1XRXfCb+1RSc/w3XUpsHVIQRTYM3cTQlmyepFwuD0910fjRErb3/V8Tkm1Ot
         HFc6Ef5zWdFZxqJB/xnYEyG4oAOSxpp4LPy6tYAnhSWJMpV/24N2BG7wNQes33Fh8RDH
         sY5khhkSIdcainPSBWhLQH9N+abQ/x3pZOfjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731045738; x=1731650538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkvxW0TELGak9TGChpUjLN8WW2TtIQcHiwQEYFYHFLY=;
        b=cE+R0hdQaf1nfzLofpTFvedjZWuwEqa14e46IE6lO7jWv/E7UouGyHdlu6pwyUmkS9
         mKolfz+eIiYDhfxVVaNlaaIwl442OwSWhSk8yjiZDOXfT1K4tEJ4vytvkJNOX78edpWR
         Olz7fsXfw6eVA1K3QZTYN9i6IeDlb++NJJKMm2mF/g3m+bIz+T0C3oHrXyeUaVF4jXVm
         dP+DT3ON6DPfyy9ItqSKxSS5rZYHxwZfLN70HNituUCezQumXquY4skJGI0eyCGKDvfb
         5vZqnazfGynMn/8RLhDzoRGHIdNeXqRmVt3TQrWOzopapKYAPYflr4t6q0pn8WJEzwIt
         MQ7w==
X-Forwarded-Encrypted: i=1; AJvYcCXcTB7GLv5i9CWn1M0Fif7CTJVchbQlU3OsZTAwV0yBmDk9AW8SbOC/y1yT2iwEkJDqYHCZUFheN46ZWtlFVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxotCRj7rUYoHkKUInbxWNl3tUsIoF/gI9UJwCeTi9uS1y/RO3g
	UhX4QZlxQUo4Eh/UJid2DDT9DPmykdRm/NxCtsIm0U4DxtVaaSgcc2W5QxsxG1twfs8Ku34X5Hn
	YnHFmqLrdTWfXm6xDhErklirhqexTYCR+YH5x
X-Google-Smtp-Source: AGHT+IHrAma7a//3ZnIS1iS1Lm0CwM4nLy0ndtu8X8cJY5OZ/WS7iyuPy8axxsNkbLgivCMUhnj0GhMp35Zvr3+0+ik=
X-Received: by 2002:a05:6512:3b8d:b0:539:e8b5:f296 with SMTP id
 2adb3069b0e04-53d8629d2d5mr722983e87.33.1731045737701; Thu, 07 Nov 2024
 22:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20241108033219.19804-1-yunfei.dong@mediatek.com> <20241108033219.19804-6-yunfei.dong@mediatek.com>
In-Reply-To: <20241108033219.19804-6-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 8 Nov 2024 14:02:06 +0800
Message-ID: <CAGXv+5EfZUXEh6r0GaMKwTgWo8gQHsXFSF2bQzFuw=J4Gj0OGw@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] media: mediatek: vcodec: remove media request checking
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_220219_965282_5C1455E6 
X-CRM114-Status: GOOD (  20.01  )
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

On Fri, Nov 8, 2024 at 11:32=E2=80=AFAM Yunfei Dong <yunfei.dong@mediatek.c=
om> wrote:
>
> Setting the buffer status to error if the media request of
> each source buffer is NULL, then schedule the work to process
> again in case of access NULL pointer.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index 3f94654ebc73..251111678fd8 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -363,10 +363,14 @@ static void mtk_vdec_worker(struct work_struct *wor=
k)
>                           ctx->id, bs_src->va, &bs_src->dma_addr, bs_src-=
>size, vb2_src);
>         /* Apply request controls. */
>         src_buf_req =3D vb2_src->req_obj.req;
> -       if (src_buf_req)
> +       if (src_buf_req) {
>                 v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
> -       else
> +       } else {
>                 mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL"=
);
> +               v4l2_m2m_buf_done(vb2_v4l2_src, VB2_BUF_STATE_ERROR);
> +               v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +               return;

Is this something that actually happens? I would assume that having
the `requires_requests` flag set on the queue would block any QBUF
call that doesn't have a request attached.

> +       }
>
>         ret =3D vdec_if_decode(ctx, bs_src, NULL, &res_chg);
>         if (ret && ret !=3D -EAGAIN) {
> @@ -384,8 +388,7 @@ static void mtk_vdec_worker(struct work_struct *work)
>         state =3D ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
>         if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
>             ctx->current_codec =3D=3D V4L2_PIX_FMT_VP8_FRAME) {
> -               if (src_buf_req)
> -                       v4l2_ctrl_request_complete(src_buf_req, &ctx->ctr=
l_hdl);
> +               v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);

Unrelated change. Please do the cleanup in a separate patch.

v4l2_ctrl_request_setup() and v4l2_ctrl_request_complete() are both
no-ops if either argument is NULL, so you can do one patch going over
the whole driver to clean it up.

>                 vb2_v4l2_dst =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
>                 v4l2_m2m_buf_done(vb2_v4l2_dst, state);
>                 v4l2_m2m_buf_done(vb2_v4l2_src, state);
> @@ -403,8 +406,7 @@ static void mtk_vdec_worker(struct work_struct *work)
>          */
>         ctx->cur_src_buffer =3D (ret !=3D -EAGAIN) ? NULL : vb2_v4l2_src;
>         if (ret && ret !=3D -EAGAIN) {
> -               if (src_buf_req)
> -                       v4l2_ctrl_request_complete(src_buf_req, &ctx->ctr=
l_hdl);
> +               v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);

Unrelated change. Same as above.


ChenYu

>                 v4l2_m2m_buf_done(vb2_v4l2_src, state);
>         }
>
> --
> 2.46.0
>

