Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C2FD5AE7C
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2024 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNGDZFn6BFfHOXHdbqmi5GIr1NOgRIL8yzEY3j9R85k=; b=ZYxAH+Z49TmHg8SX8pWUpeLWA3
	dDsDaNQyeJLQdTQLBB+3mYLazwpVLX/PsGQw9Ws+OV3ouZW5DJ+HTR6wMFSn/hWf/MSZm+j6UAG1r
	ZTButWzdJgHMdi+PC7Bf21ETa7xIlafmvPAxAW8q8OultbUdjcEFDuSiRR0361aCpwbIDenzLcNo0
	lNv7SbB7hcx4e846/UdGNqAtgIoxD3qjy2aRXvR1+8ezf1EzF3hybC3aolO0PKNhsgfieALRNoUzU
	c68qfQ20/hv6/auvIsBRAepPqS1XqCNm6j5ZPGuH3MOvrYQD/SaVjfJALJ3VfdBvB4db0I/s4sR2t
	LMsFgHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zO9-00000006Oya-1FbA;
	Thu, 07 Nov 2024 10:05:17 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zBE-00000006MBa-0dQ6
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Nov 2024 09:51:58 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539eb97f26aso534875e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Nov 2024 01:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730973113; x=1731577913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNGDZFn6BFfHOXHdbqmi5GIr1NOgRIL8yzEY3j9R85k=;
        b=d1+1f75vcZtUDJAtIADvGzPpiT720vpDopzxRFBUxUd5BySR32ISCM9npXdlRsxeSI
         T6bia7jLRrV5rFJW5eE9fuIyM24B3jQHH3BsulCUkJnTMnXLY3K1uRsSehjLcVTdnQDZ
         tybaT2oIUNI9S4lZYdt0zgifSNZV3qIc8MdUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730973113; x=1731577913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNGDZFn6BFfHOXHdbqmi5GIr1NOgRIL8yzEY3j9R85k=;
        b=c7RRy90llRLM+nBKoGy1nQyUXyfQiyBksCyRVnpu3QdGTxDokgcH/3VezA1i/UlqEP
         uQYPMK1cPRgWO+SkI4hRUGkimheciARkKu+q3TNNtr6EwMq6teNx/byOqRYFNzbn6Evy
         RUIucYp7LLs+USYHeFScT9xZJlbURifhY1cH6Q6vYkP1gNxJGs3xzHB7uQRnjKxHJ7wA
         lQNIkS+UpbOPdtO/TD3zFrrMFyp1bHHWR1hCgrqOMHfUb8iYm2uiioQMEf1mxKUFD8rj
         +oDuAoa7WMWeZWDJIArSXy5dmirPZgjPge27lvyeEWLbxr7irZsdEvymvpNnXJgWgf9Y
         zFbg==
X-Forwarded-Encrypted: i=1; AJvYcCXImNqId57RLGaY11f4HFYedcVqcuW3vSdisIt+D0GEu+ojuIV11UkG2tDD+wyRU7IRZH1VV5K9zUVbJ5tQpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi8KZOXQWSkCBH98Z5KZ+tMRrXCsmE8wsaCBLTheYofkZPDxUW
	WtAuP79CAkL/dgQHFSW/XwfeQHlMVoOLZL/Ce+ikD/fNdANYvNzeAkjUyx33ip1pWsfw3cYYkD4
	ra0YwCXtZny7b9Yif8RXOJB11kwqguMI8FMxs
X-Google-Smtp-Source: AGHT+IEnXPQWMP+Dvcvi+dUp8x3Ks93IzGCACftaRF0ayAabRXNIc0K3QoU6l6e3upA/E3kiCMYfJSgDzYjB+oi7sEs=
X-Received: by 2002:a05:6512:3ca9:b0:535:6aa9:9868 with SMTP id
 2adb3069b0e04-53d8408370amr240812e87.19.1730973113190; Thu, 07 Nov 2024
 01:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20241012064333.27269-1-yunfei.dong@mediatek.com> <20241012064333.27269-4-yunfei.dong@mediatek.com>
In-Reply-To: <20241012064333.27269-4-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 7 Nov 2024 17:51:42 +0800
Message-ID: <CAGXv+5Fc98b_VTYopo38t1O3M1G+pyAzAQzUeu917UFKSRLZaQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] media: mediatek: vcodec: Get SRC buffer from
 bitstream instead of M2M
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
X-CRM114-CacheID: sfid-20241107_015156_569217_4C7A81B4 
X-CRM114-Status: GOOD (  19.02  )
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

On Sat, Oct 12, 2024 at 2:44=E2=80=AFPM Yunfei Dong <yunfei.dong@mediatek.c=
om> wrote:
>
> Getting the SRC buffer from M2M will pick a different than the one
> used for current decode operation when the SRC buffer is removed
> from ready list.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c     | 13 +++++++------
>  .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c     | 15 +++++++--------
>  2 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index 90217cc8e242..a744740ba5f1 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> @@ -1062,19 +1062,20 @@ static inline void vdec_av1_slice_vsi_to_remote(s=
truct vdec_av1_slice_vsi *vsi,
>
>  static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_i=
nstance *instance,
>                                                  struct vdec_av1_slice_vs=
i *vsi,
> +                                                struct mtk_vcodec_mem *b=
s,
>                                                  struct vdec_lat_buf *lat=
_buf)
>  {
> -       struct vb2_v4l2_buffer *src;
> +       struct mtk_video_dec_buf *src_buf_info;
>         struct vb2_v4l2_buffer *dst;
>
> -       src =3D v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
> -       if (!src)
> +       src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, bs_bu=
ffer);
> +       if (!src_buf_info)
>                 return -EINVAL;

This doesn't make sense.

First of all, you are getting the container of bs, and
mtk_video_dec_buf.bs_buffer is at a non-zero offset, so even if bs is NULL,
container_of(bs, struct mtk_video_dec_buf, bs_buffer) is not going to be
NULL.

Second, vdec_av1_slice_setup_lat_from_src_buf() is called from
vdec_av1_slice_setup_lat(), which itself is called from
vdec_av1_slice_lat_decode(). Earlier in that function, bs is already
checked. If bs is NULL, it's considered a request to flush the decoder.

The other changes look OK. It's just the check that seems meaningless.

>
> -       lat_buf->vb2_v4l2_src =3D src;
> +       lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
>
>         dst =3D &lat_buf->ts_info;
> -       v4l2_m2m_buf_copy_metadata(src, dst, true);
> +       v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, dst, true);
>         vsi->frame.cur_ts =3D dst->vb2_buf.timestamp;
>
>         return 0;
> @@ -1724,7 +1725,7 @@ static int vdec_av1_slice_setup_lat(struct vdec_av1=
_slice_instance *instance,
>         struct vdec_av1_slice_vsi *vsi =3D &pfc->vsi;
>         int ret;
>
> -       ret =3D vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, lat_=
buf);
> +       ret =3D vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, bs, =
lat_buf);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index 3dceb668ba1c..c50a454ab4f7 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -712,19 +712,18 @@ int vdec_vp9_slice_setup_single_from_src_to_dst(str=
uct vdec_vp9_slice_instance *
>  }
>
>  static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_i=
nstance *instance,
> +                                                struct mtk_vcodec_mem *b=
s,
>                                                  struct vdec_lat_buf *lat=
_buf)
>  {
> -       struct vb2_v4l2_buffer *src;
> -       struct vb2_v4l2_buffer *dst;
> +       struct mtk_video_dec_buf *src_buf_info;
>
> -       src =3D v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
> -       if (!src)
> +       src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, bs_bu=
ffer);
> +       if (!src_buf_info)
>                 return -EINVAL;

Same thing here.

> -       lat_buf->vb2_v4l2_src =3D src;
> +       lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
>
> -       dst =3D &lat_buf->ts_info;
> -       v4l2_m2m_buf_copy_metadata(src, dst, true);
> +       v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, &lat_buf->ts_in=
fo, true);
>         return 0;
>  }
>
> @@ -1154,7 +1153,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9=
_slice_instance *instance,
>         struct vdec_vp9_slice_vsi *vsi =3D &pfc->vsi;
>         int ret;
>
> -       ret =3D vdec_vp9_slice_setup_lat_from_src_buf(instance, lat_buf);
> +       ret =3D vdec_vp9_slice_setup_lat_from_src_buf(instance, bs, lat_b=
uf);
>         if (ret)
>                 goto err;
>
> --
> 2.46.0
>
>

