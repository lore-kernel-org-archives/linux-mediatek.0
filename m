Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D70CCD4F39
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulz194QmeBrMLCZK1rETilTzDBFqDAWZtZk/ROvnkfs=; b=zAmlvcxQbj96lbrSWWeV8geOKZ
	kRUuoIYz3iZUsPYzp1VWwcYpSEq9DGC+cacwlz9Msf9CSz82reloUT8t43fKQmeL+l3X0d3MgwExc
	PRaeOjdY0hzVDRkSV4squLocmunY+WFZNioo7zPEaIRnKvo47aHGZ8PZbgUbumkInxs6gal4h+IP2
	MnOgqA/+9YXaSKwOLmTvtm66ws2l9fjq1XdHSHf6mwwlw1f5s6K0Uph9Plwx0UE1n5BpTUv7AC7O7
	ZFUlW1cgKnuJ3jI4toIdVZTMG7n2lPjoOv8+VTJ+A8r3LoOur+4ldt2fHDdb0LTVLizsEJ4baj66C
	PxT1tz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNB46-000000030JI-0HD2;
	Wed, 13 May 2026 15:00:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNB44-000000030IH-0EO4
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 15:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DB0260139
	for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 14:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5174C4AF09
	for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778684398;
	bh=b65Hj6vzoGQXDZXC2RU8pJ9mqehhTTIbmi7MEFwB91g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EcCxLE80HyAkiMQl9wnKaOyPCwvsa61x4UC91VHBTAPbnm8GFbgQ57yTZvw3Wp8s6
	 Rpc7y4M19BbqYjr2RiyVoqU+xBmBgJXnEZxmtuLa6S1Wm7UEHwvqwOON63FbNSox83
	 i7K/73sw8czbs7JgtopUuNUoZUSlbHbqWKgaxU29qrec1pk+ucW7KG4mGcNXdaXGVM
	 EwTEPsoRs4fOKtvtKBfoLK/fUNnLY28HE5cV7Wk4dpNoDF1FyUnA4KeqbsPcZZtK4S
	 7nlrcHFJgu/uYW5u6FElDT/k/H63bkM2OxSfPLeHNqAWwDvImeSakle+Bwq8jLN5G+
	 Y5G6YGyjbKUIA==
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1334825de43so2292276c88.0
        for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 07:59:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+DuVxUlIawTK3ox3k8rK3F6pMX76J5J5L+pDwFRA2q0q4ln1lxBodaVnLngcGEhS98ytvSpps0YrWttDmixg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaXF2x9yoTIBCVORWK4MhvW3QQcuVpaMsapst3vGhrmTGARK+d
	lJImP1IMVc9SIGXcabVeZgWozq7+WZbd0U1z+a3A7MIRVFSKv8GkzL6oZoSzs9UyABDRRTFkYnX
	BVCdECMBLMbzdsnrLE7jWRONAq8s0ig==
X-Received: by 2002:a05:7022:41a0:b0:132:1e79:9c55 with SMTP id
 a92af1059eb24-13436aa4a7amr2312761c88.31.1778684398054; Wed, 13 May 2026
 07:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260403-drm-mediatek-opencode-encoder-init-v1-1-7be86241b876@zohomail.in>
In-Reply-To: <20260403-drm-mediatek-opencode-encoder-init-v1-1-7be86241b876@zohomail.in>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 13 May 2026 14:59:45 +0000
X-Gmail-Original-Message-ID: <CAAOTY__a6R7CkNApwymRYFLOQ3LErTvWXNh0oOMS7d6iK5+nNQ@mail.gmail.com>
X-Gm-Features: AVHnY4Kxza9CuHOvMdkcK_8Vffimp1ycRH16uNep4anPkT7aEPEK318s88QDYsE
Message-ID: <CAAOTY__a6R7CkNApwymRYFLOQ3LErTvWXNh0oOMS7d6iK5+nNQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Open-code drm_simple_encoder_init()
To: shivamkalra98@zohomail.in
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Shivam:

Shivam Kalra via B4 Relay
<devnull+shivamkalra98.zohomail.in@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=
=9C=883=E6=97=A5=E9=80=B1=E4=BA=94
=E4=B8=8B=E5=8D=8812:00=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Shivam Kalra <shivamkalra98@zohomail.in>
>
> The helper drm_simple_encoder_init() is a trivial wrapper around
> drm_encoder_init() that only provides a static drm_encoder_funcs with
> .destroy set to drm_encoder_cleanup(). Open-code the initialization
> with a driver-specific instance of drm_encoder_funcs and remove the
> dependency on drm_simple_kms_helper.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
> ---
> Addresses the "Open-code drm_simple_encoder_init()" task from
> Documentation/gpu/todo.rst.
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 53360b5d12ba..5b83ca6aecb2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -25,8 +25,8 @@
>  #include <drm/drm_bridge_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_encoder.h>
>  #include <drm/drm_of.h>
> -#include <drm/drm_simple_kms_helper.h>
>
>  #include "mtk_ddp_comp.h"
>  #include "mtk_disp_drv.h"
> @@ -993,6 +993,10 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_=
funcs =3D {
>         .debugfs_init =3D mtk_dpi_debugfs_init,
>  };
>
> +static const struct drm_encoder_funcs mtk_dpi_encoder_funcs =3D {
> +       .destroy =3D drm_encoder_cleanup,
> +};
> +
>  void mtk_dpi_start(struct device *dev)
>  {
>         struct mtk_dpi *dpi =3D dev_get_drvdata(dev);
> @@ -1026,8 +1030,8 @@ static int mtk_dpi_bind(struct device *dev, struct =
device *master, void *data)
>         int ret;
>
>         dpi->mmsys_dev =3D priv->mmsys_dev;
> -       ret =3D drm_simple_encoder_init(drm_dev, &dpi->encoder,
> -                                     DRM_MODE_ENCODER_TMDS);
> +       ret =3D drm_encoder_init(drm_dev, &dpi->encoder, &mtk_dpi_encoder=
_funcs,
> +                              DRM_MODE_ENCODER_TMDS, NULL);
>         if (ret) {
>                 dev_err(dev, "Failed to initialize decoder: %d\n", ret);
>                 return ret;
>
> ---
> base-commit: 4b9c36c83b34f710da9573291404f6a2246251c1
> change-id: 20260403-drm-mediatek-opencode-encoder-init-36336e4c4ff3
>
> Best regards,
> --
> Shivam Kalra <shivamkalra98@zohomail.in>
>
>

