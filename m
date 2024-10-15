Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA542CFC274
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 08:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eC4BB+tDEl8JjaqDwzWgkstqnxwTVkHhasRVEYNy6PE=; b=zvpamZhdViQEzNjsjsFBO5ao+4
	JvEVoewJifTH7U4cUutbfbECo5tA4sNe7PDlFI/e6z9qDdJRhXE8+WGTmxaAkQK9cpwU50aGptr+p
	A2sdaG/2RXaZ7kmhrWVjSRosLuSrav1HDXI3MDup2PhA04+5zMuISPnnH2pfRQtsgUk/zK3F6aPXl
	KzwtsYER/N7B811v8wYkGeRcAzYzRFy4V+8HbaTFAbnBiS+IcE7yvT5KMeQfr8IK41wN/as40vL1g
	dJkZ5cJXD8tNloz5Xmo7I4u8d3G7kkWHpzFeLtVbQD9wccK+nss22sxyU6P/MqbNezQyH1c+I4C9v
	ABx6tKkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cYf-00000007Qxo-3gIJ;
	Tue, 15 Oct 2024 08:05:33 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cRe-00000007PpC-1OZK
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 07:58:39 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539e4b7409fso2829853e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 00:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728979096; x=1729583896; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC4BB+tDEl8JjaqDwzWgkstqnxwTVkHhasRVEYNy6PE=;
        b=kbnY4SXaUXiDl/oCzSbqQFM3u8Y1ySH24aSEDp2Kc3hRGWU37bB86VquZwgRugRPjA
         +43AykbEwMI7jb5EMikExGfarj6Q6IAbCAxRuGi5ev6J4GxP3kaczwz6LgdI4cxwrDiW
         ZAsOZ+ubJBuU/1gPzW9MU7SsUiGBSWIrvVUu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728979096; x=1729583896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eC4BB+tDEl8JjaqDwzWgkstqnxwTVkHhasRVEYNy6PE=;
        b=iL5twcZNfBaSBrLBqgAgA/b+8wqswmMPJHUS2NmQdnWtHzzvsPVMdRcEYQTdcTQf3b
         tRzY3jV7pyCbl8F1kHoYxaX7SoHxnwa1OpbgfcfXdo4K3BpdWT6wIItn7xJSFUBf4k9C
         UiXx+kxTbFUZ142UfDVN5ec9vGG0G1hUR+RCgBXiAg/AWas3TadRIVDYw5uX6RJiYpv6
         OAeu05xpSHwWejpcT6M7UWxB2h95pwAIH4dmiS88R0DYHeD81c7V7Ju59+NOYHq5iD5C
         byJfkPSsx4cQ7uLVaj8IWjXfBACa5Wnrw1DRgbnKgZ07snpc23Ul2lF5E+gMqzBXe1KY
         TzBg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ0TRJoDTl+V4CUkxM+kJH2ZywbYM0spPc2RIR75yKC0cdR7b+a5NiegAhPKnVV+CDaqHtjum/KYFiP9IVpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdS1ndXv74Y4FA8XTHINENCSwrKYoi+ANxaTZdRrhBzbL8g3ag
	PruOSaXuVN0WszFUgSvem3Dkv01Iiy2DxvgN3iyTYPMhlIzvBsPdVlnjr6iwMYweL/I7nepYbCe
	B+cLkxJtp2Ssov5qjIA4HsWbsM3Eh+FgjQjoS
X-Google-Smtp-Source: AGHT+IGjJNGNwEUDC+KZo44b4hUQtyEA+RBC3R7OuIVRUtmEkMET/oSfQ/G/cmV6HDCYX8i5o2poiLBvda9ljao0a+8=
X-Received: by 2002:a05:6512:2254:b0:539:f775:c0bc with SMTP id
 2adb3069b0e04-539f775c343mr1766569e87.29.1728979096001; Tue, 15 Oct 2024
 00:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241014073314.18409-1-yunfei.dong@mediatek.com> <20241014073314.18409-3-yunfei.dong@mediatek.com>
In-Reply-To: <20241014073314.18409-3-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 15:58:05 +0800
Message-ID: <CAGXv+5H4FsadBheokwO7hTxDxAtYakL15Ki+EcnhQ3Unbz3o9w@mail.gmail.com>
Subject: Re: [PATCH 2/6] media: mediatek: vcodec: remove parse nal info in kernel
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
X-CRM114-CacheID: sfid-20241015_005818_400648_BBBA1080 
X-CRM114-Status: GOOD (  15.30  )
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

On Mon, Oct 14, 2024 at 3:33=E2=80=AFPM Yunfei Dong <yunfei.dong@mediatek.c=
om> wrote:
>
> Hardware can parse the slice synatx to get nal information in
> scp, needn't to parse it in kernel again.

Does this apply to all existing shipped SCP firmware? If not, please
put this behind a vdec firmware flag.

ChenYu


> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h26=
4_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_h264_req_multi_if.c
> index d3f8d62238c0..76b96924a2a7 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> @@ -634,11 +634,10 @@ static int vdec_h264_slice_lat_decode(void *h_vdec,=
 struct mtk_vcodec_mem *bs,
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
>                                 vdec_h264_slice_core_decode,
> @@ -662,14 +661,6 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, =
struct mtk_vcodec_mem *bs,
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
> @@ -677,7 +668,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, s=
truct mtk_vcodec_mem *bs,
>         if (err)
>                 goto err_free_fb_out;
>
> -       vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size,
> +       vdec_h264_insert_startcode(inst->ctx->dev, bs->va, &bs->size,
>                                    &share_info->h264_slice_params.pps);
>
>         *res_chg =3D inst->resolution_changed;
> --
> 2.46.0
>
>

