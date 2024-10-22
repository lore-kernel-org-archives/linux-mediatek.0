Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17670D1CDA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 07:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuZG9TjFhS0J3cabCqnpd26zyrTahESHkPMMm0tbHo8=; b=IlZhWrw7mydhtJjHrSnz4+uHyx
	6H3Sew5/7yS3v5xhwWfTd1M3NhHdJLi3J/e+DLBwTTrXLhBTp0tq2RVu1uDlkEuSLe9oCyX5geS+q
	zJCJpwA3j9n7vVQ7qWNs1TXEDsPafVP7hJ5ic13YR9zwZxgAzGr3juY7Zh3IIaDL1p0/n5OoKE2iP
	u+mnOz2w3JVa4JZ7gJaXngu0RvxoPCTxyQXLbTij9zGxQ0ig4PcjLLtC2A5OsQObqpljA+IP+wQEV
	363X2PQ6CzWZCJGETZDzqyqTS7MQ6z2i9wSvYx+OHBHbEuGzaxBRObeyNQEXqz8BvfBqXESMUzdSo
	gPStXe9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3932-00000009vf1-3QRv;
	Tue, 22 Oct 2024 07:11:20 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t392v-00000009vbn-0wdC
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Oct 2024 07:11:15 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so4630190e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Oct 2024 00:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729581071; x=1730185871; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuZG9TjFhS0J3cabCqnpd26zyrTahESHkPMMm0tbHo8=;
        b=DQuwJqzunbkwGK1Dx8NweGUVOt5970nAGLqNFaBQPfsYZAc5sOKX+vTPZ5xSas12Ix
         hV1Ff4RRo/TWR+zELRTO27h2oCWvkuToFRAtLMFmi+HcJWZR3oeebat14q+0bEsCzC8a
         E0ErtpuZG/eDy0OSsSribX8kCNdYhceuUmLxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729581071; x=1730185871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuZG9TjFhS0J3cabCqnpd26zyrTahESHkPMMm0tbHo8=;
        b=B1GdYHl5W3Tztm71hg82jjShTSM7Cue0IjofJX67F2fCYrZBGjytZSt9g+JZkhPm96
         uYkya2C3m4dJ6lZPrwhCuXm8CsjVWbvmAOmwLOYb3xQWW3t1QFFbQtF2b9/Vi+IKhrAH
         1or4TLlCf/Qb9kQtt6FyJKcE5xo9RhPc14llC7jl3hMWXI89DjZCXLtzlA8au6ffBstD
         UlTRz4r0vMat3snH1zZ4GSh5o7pmdj8ZHPtcT2yLWPoWUTAg//j8kgp9J8yJCxUiMd+b
         mzrN2g3NNonnSYiFauPipa2O210SpLlOQQKxsUtCH78FASpQXX34CBffGRTUkMKcQATj
         LW1g==
X-Forwarded-Encrypted: i=1; AJvYcCXIM4AR61avJkps16aucTX5miy18Sd2m1gLlBizMQU1WRok3Ehleilno7x3JBYlp/WetRwVeIrtIsQjLoIs/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCUObjw5yuAJ2l8WE6wVb8lzLoYc/7DMPKkJoWh2GFn2Cf57ft
	XTrb5GS3PE5Pcz/MipEyAMWdxBnHazlr1aN+TqxJlNJcFf2lGiTl7rQbM/mycMn2KYCKFDw6eWe
	jDfcc49KMQn+1DyzzhuqBT+WHvl3ctwlFJs4V
X-Google-Smtp-Source: AGHT+IF+1EcCcjdprpZUxHQiyLOSW34mZjTqf2CtGDmKqLDG4nbcEgmNJg/VHulKiMJv5nQCszElvS5awGTY6T21MgA=
X-Received: by 2002:a05:6512:304f:b0:539:fb6f:cb8d with SMTP id
 2adb3069b0e04-53a15229db8mr7057177e87.27.1729581070757; Tue, 22 Oct 2024
 00:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241016034927.8181-1-yunfei.dong@mediatek.com> <20241016034927.8181-5-yunfei.dong@mediatek.com>
In-Reply-To: <20241016034927.8181-5-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Oct 2024 15:10:59 +0800
Message-ID: <CAGXv+5H4BfUcDL1Rp+-CVefxdPtxxf63Bj+Ay9daMdy6127F3A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] media: mediatek: vcodec: remove parse nal info in kernel
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_001113_309188_0A42AE84 
X-CRM114-Status: GOOD (  17.68  )
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

On Wed, Oct 16, 2024 at 11:49=E2=80=AFAM Yunfei Dong <yunfei.dong@mediatek.=
com> wrote:
>
> Hardware can parse the slice syntax to get nal information in
> scp for extend architecture, needn't to parse it again in
> kernel.

Squash this in with the other "add extended architecture" patches.
You are removing code that you just added. So why add it in the
first place?

You can just mention in the commit message that the new architecture
can parse the slice syntax directly.

ChenYu

> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../decoder/vdec/vdec_h264_req_multi_if.c     | 24 +++----------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h26=
4_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_h264_req_multi_if.c
> index 69ca775bb3f1..c99a64384edf 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> @@ -802,11 +802,10 @@ static int vdec_h264_slice_lat_decode_ex(void *h_vd=
ec, struct mtk_vcodec_mem *bs
>         struct vdec_h264_slice_inst *inst =3D h_vdec;
>         struct vdec_vpu_inst *vpu =3D &inst->vpu;
>         struct mtk_video_dec_buf *src_buf_info;
> -       int nal_start_idx, err, timeout =3D 0;
> +       int err, timeout =3D 0;
>         unsigned int data[2];
>         struct vdec_lat_buf *lat_buf;
>         struct vdec_h264_slice_share_info *share_info;
> -       unsigned char *buf;
>
>         if (vdec_msg_queue_init(&inst->ctx->msg_queue, inst->ctx,
>                                 vdec_h264_slice_core_decode_ex,
> @@ -830,14 +829,6 @@ static int vdec_h264_slice_lat_decode_ex(void *h_vde=
c, struct mtk_vcodec_mem *bs
>         share_info =3D lat_buf->private_data;
>         src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, bs_bu=
ffer);
>
> -       buf =3D (unsigned char *)bs->va;
> -       nal_start_idx =3D mtk_vdec_h264_find_start_code(buf, bs->size);
> -       if (nal_start_idx < 0) {
> -               err =3D -EINVAL;
> -               goto err_free_fb_out;
> -       }
> -
> -       inst->vsi->dec.nal_info =3D buf[nal_start_idx];
>         lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
>         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->t=
s_info, true);
>
> @@ -846,7 +837,7 @@ static int vdec_h264_slice_lat_decode_ex(void *h_vdec=
, struct mtk_vcodec_mem *bs
>         if (err)
>                 goto err_free_fb_out;
>
> -       vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size,
> +       vdec_h264_insert_startcode(inst->ctx->dev, bs->va, &bs->size,
>                                    &share_info->h264_slice_params.pps);
>
>         *res_chg =3D inst->resolution_changed;
> @@ -1078,11 +1069,10 @@ static int vdec_h264_slice_single_decode_ex(void =
*h_vdec, struct mtk_vcodec_mem
>         struct vdec_vpu_inst *vpu =3D &inst->vpu;
>         struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
>         struct vdec_fb *fb;
> -       unsigned char *buf;
>         unsigned int data[2], i;
>         u64 y_fb_dma, c_fb_dma;
>         struct mtk_vcodec_mem *mem;
> -       int err, nal_start_idx;
> +       int err;
>
>         /* bs NULL means flush decoder */
>         if (!bs)
> @@ -1117,14 +1107,6 @@ static int vdec_h264_slice_single_decode_ex(void *=
h_vdec, struct mtk_vcodec_mem
>         memcpy(&inst->vsi_ctx_ex.h264_slice_params, &inst->h264_slice_par=
am,
>                sizeof(inst->vsi_ctx_ex.h264_slice_params));
>
> -       buf =3D (unsigned char *)bs->va;
> -       nal_start_idx =3D mtk_vdec_h264_find_start_code(buf, bs->size);
> -       if (nal_start_idx < 0) {
> -               err =3D -EINVAL;
> -               goto err_free_fb_out;
> -       }
> -       inst->vsi_ctx_ex.dec.nal_info =3D buf[nal_start_idx];
> -
>         *res_chg =3D inst->resolution_changed;
>         if (inst->resolution_changed) {
>                 mtk_vdec_debug(inst->ctx, "- resolution changed -");
> --
> 2.46.0
>

