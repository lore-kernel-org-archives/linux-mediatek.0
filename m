Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB4EEE49AE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 08:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmMZFZ62OdIAtWcX5zw3zpQ/Qr+ShV602MOY+LKIebw=; b=fSb+sFRm8ODugwsyL4ZtP+HwkE
	vBrJ/HbELxp9kXkHr0vBSx1Yw1RsvpVO3dTW/0vhFPQ8xCw0snS49lKZvzzQo5s7jcqWVuVm1Jgb1
	sxbTW2pCX4qRTuCtKyEWjZFhX55dHAzdoc/YTW1H6oe4jeqY8BurULjjN8KgpP2b2ezTMfnomn3Ii
	i/uJjK+ugrUp9IWMuLA552/dVYu6mMSASTBvhUIfOf+hpbfc3GDzSFgg7BJIAHgCfgn4akkRJ7q/s
	njTt9OUPi+IV9m3C4XhyiARdzwCkI+lyEDbv/8/ZAnD4pergWTS5GQ08kayBGXAXVbw8kdz7fCC0j
	N9YzI6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjKU-00HZbq-0r;
	Wed, 23 Aug 2023 08:35:06 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjKP-00HZan-1l
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Aug 2023 08:35:03 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-48d14d11756so1126665e0c.2
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Aug 2023 01:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692779700; x=1693384500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmMZFZ62OdIAtWcX5zw3zpQ/Qr+ShV602MOY+LKIebw=;
        b=aSQ7medMm32HRzU8weU8tNYTnPBrEEFQ41Kbmbur21/iF3yhiy/NKXSjPFkJmK47ce
         bLOyRL2bjw153X6Zfwi5lIUgdDgBV2F3vQilek37DvEZdVgNnc4KT3GmiQLXPZQAlUJC
         qynbBKaZYR7QVIC3/bxEKKUVTr1QP0b3/ezgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692779700; x=1693384500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmMZFZ62OdIAtWcX5zw3zpQ/Qr+ShV602MOY+LKIebw=;
        b=MPM+SmK/rQjitpea6r9B3+6Z8Ma5tcEFzhDnEA8dnJv5C0rLFBlooAAOE9jZLaN9dw
         c6STTDxlkPNHWNbW9ccjGrYxeTmKFQtCfMLaTokxUmn+OMBj1Y3WWSYGiJa9FiIeXZnm
         fTj/pAxWoZr978rRZfz0TXorGfKrK8W15hYFzPiFHbK2FFT7KVqMz9Mov2XGVJ32CJJ+
         7LGO4qjEHXZ8CQUvjNCG5jLQe2oRRpDXmwB1X8AMzE402ihoV0zUq+MXKqmFky2jSXe7
         eUSfgf0be8YumKhs+VOdRzs4X8DzFr/BD/ymV023uVs3gCuTV0QZ32CAaMLcMm433Yas
         AhTw==
X-Gm-Message-State: AOJu0YzC7NFHOpTiTEiAUHJXz0uTLUTvQNYXh8zLd6VaCPqbiPdnlygL
	OPGjhDBoCAbVdZwBeBs40aeE+9nfhJhuHvU7JjuEsA==
X-Google-Smtp-Source: AGHT+IGSDVGVupZv/MLbXhRgCOL+pMnSbFh3lgLbXxMSB5Hcf2CbFqQt0tXsFwyI797JMNTB1vUE2gYu9sF1UiFPuZQ=
X-Received: by 2002:a1f:cd85:0:b0:48d:2a1:5d26 with SMTP id
 d127-20020a1fcd85000000b0048d02a15d26mr9307618vkg.4.1692779700344; Wed, 23
 Aug 2023 01:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230823082549.24756-1-shuijing.li@mediatek.com>
In-Reply-To: <20230823082549.24756-1-shuijing.li@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 23 Aug 2023 16:34:49 +0800
Message-ID: <CAGXv+5FKpt0uxPPBTd0D0+PSD068NJFSf2AuQ5nckK8KW7WNag@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Support IGT in dp driver
To: Shuijing Li <shuijing.li@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, jitao.shi@mediatek.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_013501_627926_BB830C77 
X-CRM114-Status: GOOD (  19.15  )
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

On Wed, Aug 23, 2023 at 4:25=E2=80=AFPM Shuijing Li <shuijing.li@mediatek.c=
om> wrote:
>
> Support IGT (Intel GPU Tools) in Mediatek DisplayPort driver

The commit message makes little sense.

First of all, you are changing the DSI driver, not the DisplayPort driver.

Second, the subject should say what was changed. In this case it would be
something like "Add mode_valid callback to DSI bridge". "Support IGT" is
*why* the change was done, should only be mentioned in the commit message
body, and you could be more specific about which test in IGT needs it.

ChenYu

> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 7d5250351193..a494e04f0ddf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -806,6 +806,25 @@ static void mtk_dsi_bridge_atomic_post_disable(struc=
t drm_bridge *bridge,
>         mtk_dsi_poweroff(dsi);
>  }
>
> +static enum drm_mode_status
> +mtk_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> +                         const struct drm_display_info *info,
> +                         const struct drm_display_mode *mode)
> +{
> +       struct mtk_dsi *dsi =3D bridge_to_dsi(bridge);
> +       u32 bpp;
> +
> +       if (dsi->format =3D=3D MIPI_DSI_FMT_RGB565)
> +               bpp =3D 16;
> +       else
> +               bpp =3D 24;
> +
> +       if (mode->clock * bpp / dsi->lanes > 1500000)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs =3D {
>         .attach =3D mtk_dsi_bridge_attach,
>         .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> @@ -815,6 +834,7 @@ static const struct drm_bridge_funcs mtk_dsi_bridge_f=
uncs =3D {
>         .atomic_pre_enable =3D mtk_dsi_bridge_atomic_pre_enable,
>         .atomic_post_disable =3D mtk_dsi_bridge_atomic_post_disable,
>         .atomic_reset =3D drm_atomic_helper_bridge_reset,
> +       .mode_valid =3D mtk_dsi_bridge_mode_valid,
>         .mode_set =3D mtk_dsi_bridge_mode_set,
>  };
>
> --
> 2.40.1
>

