Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C35CC3DA61
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RynWyZj/Mk6W2PWFZ6UdeaZvnGfxuKvGDrjfGdoRyoQ=; b=zgFqGXcPlY35icohLlIXR4XPFu
	GCSNgX24ZbPkWs83ytO5XiJBkyml0n4O+6Opr63rid4Ns+2wzFdc/CUpfcFEYZ8pG2Y3IT7J1I2iX
	WVMNxSbk5p14SjIoZwF6Mvk+rnvHVYuAH+ctpdZJMslTgOLrfYwbRyLZDWwVo8MTLvUuWcsxHbJz1
	6EW6zTLJZIglppB4XGoy7z7ydVkBof/uoV2bPHun+4iRhzsr5vTNLmqdd8PaToHs5Qs2m0/Hjgsvo
	MMFTTlDe9d7s1hvpJ4d0GbPQjtp0YZ5lHtSTt69cjXPxG0JExCRmOABQpZpcnWYqGD1q/O60E2XHI
	bI6fEpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNnD-0000000Gbqe-3yR7;
	Thu, 18 Jul 2024 09:51:20 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNnA-0000000GbpS-46zL
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jul 2024 09:51:18 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-8100ff1cec5so248225241.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jul 2024 02:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721296275; x=1721901075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RynWyZj/Mk6W2PWFZ6UdeaZvnGfxuKvGDrjfGdoRyoQ=;
        b=NsiwnULNzR4m4WKHmTwBrCZc2aGAXjAKCrgs7hlCkUNRDcSZyDzN8rsknA6rBELjDd
         4pJqEpn1VZO32sqVTH2OrdCmm44mDOvNSjUBm5ZrSM1j62GE/Jzm2lqAaWzidl3Gb7OX
         cE1po2oAF7+HE5SV4CO7n/NnRt8eWeCLLIq6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296275; x=1721901075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RynWyZj/Mk6W2PWFZ6UdeaZvnGfxuKvGDrjfGdoRyoQ=;
        b=KERb8NnoNv7vpRX6o7RpSlvXIuHCv9ksuMMM0+lkQaShaJXHws5uiD1HZd7HlPGsHa
         Tqoqs4WNrWJ0587wK9/QBqxAhdSa4QJI66CWZwG68c28TNpcnl14D9jlY9TK+YvOs3aI
         tXI1t22OnL+3oHcuD3dyyvhuoYHIvSpGghSqjCexuPXfLYdywEAvBkygygN8oyQhqCii
         dYGEWDfxlZ5TVVCiKpr5pMwYesCPZ/Z+FsSlAJwXxZKJ9w0MVknHInviS98V97+FNohx
         ZAX/ttZV1gCq46szKNnLTz9ww/+t/2Qg9TZZ0FLpcxdG8qj4VxD5CKALBnB9LH82yAIx
         eibA==
X-Forwarded-Encrypted: i=1; AJvYcCUJc3udP6FpGtQE+/Z4BwPxYVGCZuqeHrjeoUMQnKfrt4YtE5D9DJ0yHSoYg5QTpsdgNTFrffhnJNQWmALZj+dTva74MRss5G162IXKtiZjugDP
X-Gm-Message-State: AOJu0YzosZZ3t13jgUUM08Kjv20yBiGCrIgPZD3yjJJuwcM6safbk/If
	ckFsQ4AjSetGxudAPTB+GZ4Ctul9tL90OnhDMLxmCAwLcJWbvUtvAU4/nKrA4PNuwWY7lelKSA7
	+GQ==
X-Google-Smtp-Source: AGHT+IHVV034zUfmaQrVSQJ6kIZttrYPYcfC2LzY200KfOKbtqh1pVYq2H4/fsy8AgsdCcyxSH5CJA==
X-Received: by 2002:a05:6102:4b8c:b0:48f:9682:1b1b with SMTP id ada2fe7eead31-49159733d2fmr5472111137.7.1721296275477;
        Thu, 18 Jul 2024 02:51:15 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-822c8ac43c4sm128998241.27.2024.07.18.02.51.14
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 02:51:15 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4f2f24f6470so252187e0c.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jul 2024 02:51:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEmqfW+5nsDxLDq2ztE6IuEUzKEA2vz6AFlO1FnPA/2Nx9mkZzlv5D8SSG8LQj3HULuQKNcH5CRTzyPa4nZgmlAE+aquRSX1zOssJApIo/fNE9
X-Received: by 2002:a05:6122:a0b:b0:4f2:ff08:ba3c with SMTP id
 71dfb90a1353d-4f4df688321mr6001081e0c.5.1721296273968; Thu, 18 Jul 2024
 02:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 18 Jul 2024 17:50:37 +0800
X-Gmail-Original-Message-ID: <CAC=S1njFSULdpTefLpb8biEUARVH4c_dZndUav_S-6D-bstn6w@mail.gmail.com>
Message-ID: <CAC=S1njFSULdpTefLpb8biEUARVH4c_dZndUav_S-6D-bstn6w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Declare Z Position for all planes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, shawn.sung@mediatek.com, 
	ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_025117_073288_A34652C6 
X-CRM114-Status: GOOD (  25.44  )
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

On Thu, Jul 18, 2024 at 4:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MediaTek SoCs support multiple planes, one of which is the primary
> and all the others are overlays (and CURSOR is the last overlay).
>
> In all currently supported SoCs, the Z order of the overlays can't
> be changed with any fast muxing action, and can only be changed by
> swapping the contents of the entire register set of one overlay
> with the other to internally reorder the layer properties, which
> is indeed feasible, but probably more expensive than desired.
>
> Declare the Z position for all planes with an immutable property
> at least for now, so that the userspace can take its decisions
> accordingly.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c  |  2 +-
>  drivers/gpu/drm/mediatek/mtk_plane.c | 18 +++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_plane.h |  3 +--
>  3 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 072b2fdae87b..327214721b4d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -874,7 +874,7 @@ static int mtk_crtc_init_comp_planes(struct drm_devic=
e *drm_dev,
>                                 mtk_crtc_plane_type(mtk_crtc->layer_nr, n=
um_planes),
>                                 mtk_ddp_comp_supported_rotations(comp),
>                                 mtk_ddp_comp_get_formats(comp),
> -                               mtk_ddp_comp_get_num_formats(comp));
> +                               mtk_ddp_comp_get_num_formats(comp), i);
>                 if (ret)
>                         return ret;
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/media=
tek/mtk_plane.c
> index 5bf757a3ef20..7d2cb4e0fafa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_plane.c
> @@ -321,7 +321,7 @@ static const struct drm_plane_helper_funcs mtk_plane_=
helper_funcs =3D {
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
>                    unsigned int supported_rotations, const u32 *formats,
> -                  size_t num_formats)
> +                  size_t num_formats, unsigned int plane_idx)
>  {
>         int err;
>
> @@ -338,6 +338,22 @@ int mtk_plane_init(struct drm_device *dev, struct dr=
m_plane *plane,
>                 return err;
>         }
>
> +       /*
> +        * The hardware does not support repositioning planes by muxing: =
their
> +        * Z-position is infact fixed and the only way to change the actu=
al
> +        * order is to swap the contents of the entire register set of on=
e
> +        * overlay with another, which may be more expensive than desired=
.
> +        *
> +        * With no repositioning, the caller of this function guarantees =
that
> +        * the plane_idx is correct. This means that, for example, the PR=
IMARY
> +        * plane fed to this function will always have plane_idx zero.
> +        */
> +       err =3D drm_plane_create_zpos_immutable_property(plane, plane_idx=
);
> +       if (err) {
> +               DRM_ERROR("Failed to create zpos property for plane %u\n"=
, plane_idx);
> +               return err;
> +       }
> +
>         if (supported_rotations) {
>                 err =3D drm_plane_create_rotation_property(plane,
>                                                          DRM_MODE_ROTATE_=
0,
> diff --git a/drivers/gpu/drm/mediatek/mtk_plane.h b/drivers/gpu/drm/media=
tek/mtk_plane.h
> index 231bb7aac947..5b177eac67b7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_plane.h
> @@ -49,6 +49,5 @@ to_mtk_plane_state(struct drm_plane_state *state)
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
>                    unsigned int supported_rotations, const u32 *formats,
> -                  size_t num_formats);
> -
> +                  size_t num_formats, unsigned int plane_idx);
>  #endif
> --
> 2.45.2
>
>

