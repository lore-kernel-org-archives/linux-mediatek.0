Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235E4D1715E
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 03:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26QZsdFfjNaf2R0pL13dD/w4NeLPSwhQ9nw1ajQqK40=; b=SsgWmXl7WTCvmdso+2pWY1gTHz
	433IjOiLOqq6I9LxLjPhXDrQE8d4kRccufXLw/8aB9rkGC8ELROttC5EoubFKHW6zEJOtQ+Lf6gUd
	qQMECJFldahjh5rX7zz7n06wUFHlFJjxaUbOMQhNLz9ulWarGy1aKNLg/GUQonOVIi+kcKcRUdxXP
	U0YPDNLt0OW+lwrKzS3i82uciNdjYEO558Fki0VcOulnpTXrrgkC+pOIBkp7JxrkjZ+WQ+4A1Aq3g
	YiBHpS0On+BZNSDPEBfLrKLqchMJw/AIqgzzinmb9eA7XqlFyAJi6Pi8sn8b99Ovz6dCuY7YvPpve
	aGYWGhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t362d-00000009Vty-3nnu;
	Tue, 22 Oct 2024 03:58:43 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t362b-00000009Vt6-0UyH
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Oct 2024 03:58:42 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so56106851fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Oct 2024 20:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729569518; x=1730174318; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26QZsdFfjNaf2R0pL13dD/w4NeLPSwhQ9nw1ajQqK40=;
        b=Bi6wDPOtYYuRVjDpUvRGbOLPrmQAZKmNiF9qEktq4UTZTfpeAFT/t/h8DulSDvarbY
         PhI6Dy2t0ji+8q85LOEoPlmR9UzL5upyLQM77yoemMRP0O2GEL1uiiHSyX/tx4N++sXL
         VD0uOMA1bvFHTiTSaEfoiFbGuICpFq033jFNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729569518; x=1730174318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26QZsdFfjNaf2R0pL13dD/w4NeLPSwhQ9nw1ajQqK40=;
        b=c6kbQTGm2nyytIHDk6Ce+6lEeR4AsytMnWNRKSI6dz+FLlcMnykDON03J24/YNumM1
         +7PajQ/QYled+OtGvw/qXU+7TOS3KlqA5qlczfdgGhT8IFBDg2tJpmE5dSeWpQsQfy4w
         6NX9JMPEKW8zyUBSfjDUUp3H74S/b3IR0wAyAbbZk3iBmRvEzDkHckLkW89ahK94XYnD
         YzMfUB82HakasRfj/9Gh2Ec+uAz5TS9cy8AvvrhEzPCi9zMK2+7LnOLAUZilj+40lKxo
         vSLHLRT6Uf3wE4Z1/HW4SverkRW0odCxRV+LAX51QQ4CRcnVC7ZVjIo6EpgWobJKtPrb
         5UcA==
X-Forwarded-Encrypted: i=1; AJvYcCWgA0hPVkvnfekWfTzwEl0BSAIfbI6ewFj9L17Ry9631PLBYf93M4m4z8fVg8c3zG9wG1DYCdS6dETgSbqI3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YynfeAYY9T4h5f3sq8kIiB7XDH4fA2QVjQUqOUBfr94R4gJ7s2b
	zUqwLf5Fegyyh9WGupAT9AEjd4kRq38VfOQnOOsZA9Z14R+NIU3QIfSfVmlEUNEji5DYCiQGN16
	E+z1L6YqYb80yUovbVbwa4T2ka6EL82y2sMTo
X-Google-Smtp-Source: AGHT+IFqMhHSx8Ip59Ca3lTQjk0rTWzLpRf1LICtZkUGARVmXCcNDbvtoO7vAUrk/aZyUBhNLkQE7MFo/l8i4R5X7hA=
X-Received: by 2002:a2e:bc08:0:b0:2fb:51e0:91b with SMTP id
 38308e7fff4ca-2fb832285d4mr68651001fa.43.1729569517643; Mon, 21 Oct 2024
 20:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241016034927.8181-1-yunfei.dong@mediatek.com> <20241016034927.8181-2-yunfei.dong@mediatek.com>
In-Reply-To: <20241016034927.8181-2-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Oct 2024 11:58:26 +0800
Message-ID: <CAGXv+5GMisONhxu5nnRdLvkav4ttwtrupft26-J01P8ACDx=9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] media: mediatek: vcodec: remove vsi operation in
 common interface
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
X-CRM114-CacheID: sfid-20241021_205841_201281_E1A1B840 
X-CRM114-Status: GOOD (  18.41  )
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
> Remove vsi related operation in common interface to make sure the
> interface can be called by different architecture at the same time.

Nit: it would be nice to provide more context here. You could mention
that a new extended interface with a different shared memory layout (vsi)
will be introduced in later patches.

> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../decoder/vdec/vdec_h264_req_multi_if.c     | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h26=
4_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_h264_req_multi_if.c
> index 732d78f63e5a..57c85af5ffb4 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> @@ -171,9 +171,9 @@ struct vdec_h264_slice_inst {
>  };
>
>  static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice=
_inst *inst,
> -                                                 struct vdec_h264_slice_=
share_info *share_info)
> +                                                 struct vdec_h264_slice_=
share_info *share_info,
> +                                                 struct vdec_h264_slice_=
lat_dec_param *slice_data)

Nit: you could just name this new parameter |slice_param| and avoid the
changes in the next bit.

>  {
> -       struct vdec_h264_slice_lat_dec_param *slice_param =3D &inst->vsi-=
>h264_slice_params;
>         const struct v4l2_ctrl_h264_decode_params *dec_params;
>         const struct v4l2_ctrl_h264_scaling_matrix *src_matrix;
>         const struct v4l2_ctrl_h264_sps *sps;
> @@ -203,9 +203,9 @@ static int vdec_h264_slice_fill_decode_parameters(str=
uct vdec_h264_slice_inst *i
>                 return -EINVAL;
>         }
>
> -       mtk_vdec_h264_copy_sps_params(&slice_param->sps, sps);
> -       mtk_vdec_h264_copy_pps_params(&slice_param->pps, pps);
> -       mtk_vdec_h264_copy_scaling_matrix(&slice_param->scaling_matrix, s=
rc_matrix);
> +       mtk_vdec_h264_copy_sps_params(&slice_data->sps, sps);
> +       mtk_vdec_h264_copy_pps_params(&slice_data->pps, pps);
> +       mtk_vdec_h264_copy_scaling_matrix(&slice_data->scaling_matrix, sr=
c_matrix);
>
>         memcpy(&share_info->sps, sps, sizeof(*sps));
>         memcpy(&share_info->dec_params, dec_params, sizeof(*dec_params));
> @@ -266,9 +266,6 @@ static int get_vdec_sig_decode_parameters(struct vdec=
_h264_slice_inst *inst)
>         mtk_vdec_h264_get_ref_list(b0_reflist, v4l2_b0_reflist, reflist_b=
uilder.num_valid);
>         mtk_vdec_h264_get_ref_list(b1_reflist, v4l2_b1_reflist, reflist_b=
uilder.num_valid);
>
> -       memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
> -              sizeof(inst->vsi_ctx.h264_slice_params));
> -
>         return 0;
>  }
>
> @@ -608,7 +605,8 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, s=
truct mtk_vcodec_mem *bs,
>         lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
>         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->t=
s_info, true);
>
> -       err =3D vdec_h264_slice_fill_decode_parameters(inst, share_info);
> +       err =3D vdec_h264_slice_fill_decode_parameters(inst, share_info,
> +                                                    &inst->vsi->h264_sli=
ce_params);
>         if (err)
>                 goto err_free_fb_out;
>
> @@ -749,6 +747,9 @@ static int vdec_h264_slice_single_decode(void *h_vdec=
, struct mtk_vcodec_mem *bs
>         if (err)
>                 goto err_free_fb_out;
>
> +       memcpy(&inst->vsi_ctx.h264_slice_params, &inst->h264_slice_param,
> +              sizeof(inst->vsi_ctx.h264_slice_params));
> +
>         buf =3D (unsigned char *)bs->va;
>         nal_start_idx =3D mtk_vdec_h264_find_start_code(buf, bs->size);
>         if (nal_start_idx < 0) {

Code wise this patch seems fine.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

