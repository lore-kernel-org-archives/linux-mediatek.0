Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81BAC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 14:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZvm4qxdEA1ZNfsh2rSmSezhLCpTP9E/xFoV/HT1x/Y=; b=mbeTK0eeyeodMYK9Z7ZrqwgKC+
	Ir8H9N2MLE95eFvWL+n/gQNY08/58+oUtWiwzqX6x4X6OTTaayNwF2ZxcOmscOJ+ExWGoxSU6ISqZ
	jeh3t7QmRGD1ugTJbj9HWur8V+n5z1F9/q6Wj/TbO8zAw/+Qd5ScHjXysqe3WE5HmtlgNDoK2fUwc
	TD2z/C8SeBtWDyQaqQMEyw5PKr/qrcVX0XQfJnJ73YegBtehFJooYQlNGp4TrWs0V0nsdPCax13+m
	Wdf3s9jkvNfzNLUrg52BSNX4h8xgCkW6x5U/g+q2nS9GIifk1rSUL6Bo0etV7oVewGxnHDTkYf7hV
	vY2s1wZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8fB-0000000D7ey-2CKM;
	Thu, 22 Aug 2024 14:19:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8eP-0000000D7XQ-3vTZ;
	Thu, 22 Aug 2024 14:18:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D3A2A40441;
	Thu, 22 Aug 2024 14:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67EFC4AF0E;
	Thu, 22 Aug 2024 14:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724336336;
	bh=3GWoh+NIjDuNmYprHwkg92rITwy5ncJNiKWjfdVr/H4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cez+LBE5FuMS7MOuHzeoYBffg2OYo1A1RyFMJ/z79CGDpNOsWywgyVicagMQgj0NM
	 sfCp2JtPcQ5B3UXfPgs3+3+93AiK0waUnFda2tVjN0f/hVpA9nKYiAt+ulQCk3v92L
	 yH32mEnAl1waFO2F0T8RspWgx/Q3Zv5ic/Q5DXZ+Pw/zQTMD2SxWgVS0G+1eEDDthF
	 bphNP85mBw/WitrkkW8AvMsJk7Nhr1uKGGVHNPELmtbU2eeCxq4e4UXMqQXoHOUWcC
	 aHKPvbBqNMqIy6FKlP16n390fURpxF47NUdVXnzyfhF2fpFbUE39ZWrVIj9N7QlUh0
	 RadDMhJ/f36gw==
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2d3c0d587e4so635244a91.2;
        Thu, 22 Aug 2024 07:18:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNzbafYt8P75pWcY7qkBu8JPzjhtNiD0XyNsnyK+f1RMBQbvtzemj+XC7mNgTQlTvF7syyIJgDAFpTBsS45s9F@lists.infradead.org, AJvYcCXydRNs0+Meb65LlQdCRlQE3jhw9Sg7ooCpELFFTUj+224BdHwlzauaeuabjGx6BPN5acX1RWzvZTdG9RLPTTA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzB8pjwx4PVX2e3xmk2Id3dwkNNA1kTxiiUncmJ1v9frwJLke8Z
	6fchdzdehjzopOPCkwYyQ4fL2FB+EZczWfkgFHviOnTc5KGUZxQZS9wU99ZOMg8G5wNmHNqJSSr
	84zMN6SFKBHyGWeNKR/SMfwoTBQ==
X-Google-Smtp-Source: AGHT+IGhC5P6/hthqUI5LUfSSQTgN84GTtxPfVyWb1+65zBVxRuWL4kVlMrBRKN/1zwtX32x5+MJ14DekdwVil/rPYY=
X-Received: by 2002:a17:90b:204:b0:2d3:cd22:e67b with SMTP id
 98e67ed59e1d1-2d5e9a0581emr6419698a91.6.1724336336253; Thu, 22 Aug 2024
 07:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Aug 2024 22:19:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8VkkxsC3yOcFSLcToVaueUtAjsdhkhAN+Zw_POO=fHtw@mail.gmail.com>
Message-ID: <CAAOTY_8VkkxsC3yOcFSLcToVaueUtAjsdhkhAN+Zw_POO=fHtw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240822_071858_130862_F5BC85AE 
X-CRM114-Status: GOOD (  25.20  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2024=E5=B9=B47=E6=9C=8818=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:2=
5=E5=AF=AB=E9=81=93=EF=BC=9A
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

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
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

