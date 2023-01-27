Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C67C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 03:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKb/Hc6TBMz0uzKd5AAOHy2InR07jJ8Uus5Ytkgh+6Q=; b=IXB91hBC2o8wpAhNNqguwVkXAE
	Pxd6qXRFY9Rx9OhBp/a1kfpwfSUbJ7Dj2GiD/byP8k+EgttW0+gtq5YR7ijsa32vn0LpZqnrPn1ME
	yRh4hZM0NL7lbABlw/mTBtToCdMdTwmKd64GJVF1pPkfcTsbKVB0jmobY9xfRLdVjR3uxOsK7bqtx
	jP+UBjjwY5ipZGYOD8d+wQ3kYsEN3+hFj78udNtwFgFy4Tk3syiuJaC7+y5JE1QI3buz/j/AhUm98
	PxAz9NTJ1jc0d5jTQJtzcseEM/Fnhlw9YgUetJxEZWHVodQph5dbG+HqMDV7zGxneL9PTNdLpzT4N
	Uwjfm1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLF31-00DAeA-NR; Fri, 27 Jan 2023 03:05:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLF2p-00DAc9-5a; Fri, 27 Jan 2023 03:04:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E75561923;
	Fri, 27 Jan 2023 03:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B402DC433EF;
	Fri, 27 Jan 2023 03:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674788689;
	bh=DJAhLqrEmY7pkfx5bWWnse3lSdOX8G52fs2KaDHWvLg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CBc0yJLXIhPVKuiNGRVdCgQBm6vOEDRAQr9kO6oi3XcQNLlqPDtrhitObTIBuyDE3
	 hcOQ1vAJahJ/GCq5nCb5cU9Tg1Efb+ISRzHXRpM6Uy4/pSMzjr9mVXdv8Vc2sEd3zO
	 pU7tTorR860x7Ba86gnQv+Be0NiOYCKpjAu1ffs13e/GSg3AiWfudNs2trHd7tzZVr
	 DuIF/L4jYhpf9HWx4dWtA2vVXlYvRsqm/lHI+HUDT/uLpMtF/02YCDc863MFaS74L9
	 kfcOj0UaM07ESW0/4G0tWA7wcxEtEQ7iRYScG0sGRy38Qalh0pa8T6CBTx4wgHIZkl
	 rYJNdYuN5JWYg==
Received: by mail-lf1-f43.google.com with SMTP id x40so6083474lfu.12;
        Thu, 26 Jan 2023 19:04:49 -0800 (PST)
X-Gm-Message-State: AFqh2kr0pciAfQMEKgboItF2HH66k33DdjFLxuZDOCMu9Uh9TIYDQvUb
	Wx/GP2DqW2GVSlr4IhL9vHmqee1oU5JcxgkXfw==
X-Google-Smtp-Source: AMrXdXvOOZQHsJ0MBswfFDYqDbCBf0JDDNHwOn4nnFjNZh9GxRPWJdT4k7adQhZHGCipeHV2iolxq0GoffYOxz59N7s=
X-Received: by 2002:a05:6512:214b:b0:4d3:d4e4:9b85 with SMTP id
 s11-20020a056512214b00b004d3d4e49b85mr2706617lfr.46.1674788687753; Thu, 26
 Jan 2023 19:04:47 -0800 (PST)
MIME-Version: 1.0
References: <20230119224052.2879106-1-robdclark@gmail.com>
In-Reply-To: <20230119224052.2879106-1-robdclark@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 27 Jan 2023 11:04:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY__CNxgfbZ_+YUNfX_CYNJ-mXF31Q4xxQwfV_m6-ueLB1g@mail.gmail.com>
Message-ID: <CAAOTY__CNxgfbZ_+YUNfX_CYNJ-mXF31Q4xxQwfV_m6-ueLB1g@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Remove dependency on GEM DMA helper
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	"moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_190451_313558_451A9409 
X-CRM114-Status: GOOD (  18.40  )
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

Hi, Rob:

Rob Clark <robdclark@gmail.com> =E6=96=BC 2023=E5=B9=B41=E6=9C=8820=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=886:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Rob Clark <robdclark@chromium.org>
>
> It appears that the dependency on the DMA helpers was only for
> drm_gem_dma_vm_ops.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/Kconfig       | 1 -
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 7 ++++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/=
Kconfig
> index 369e495d0c3e..b451dee64d34 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -7,7 +7,6 @@ config DRM_MEDIATEK
>         depends on HAVE_ARM_SMCCC
>         depends on OF
>         depends on MTK_MMSYS
> -       select DRM_GEM_DMA_HELPER
>         select DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select DRM_PANEL
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index 47e96b0289f9..9b3d15d3a983 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -16,13 +16,18 @@
>
>  static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj, struct vm=
_area_struct *vma);
>
> +static const struct vm_operations_struct vm_ops =3D {
> +       .open =3D drm_gem_vm_open,
> +       .close =3D drm_gem_vm_close,
> +};
> +
>  static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs =3D {
>         .free =3D mtk_drm_gem_free_object,
>         .get_sg_table =3D mtk_gem_prime_get_sg_table,
>         .vmap =3D mtk_drm_gem_prime_vmap,
>         .vunmap =3D mtk_drm_gem_prime_vunmap,
>         .mmap =3D mtk_drm_gem_object_mmap,
> -       .vm_ops =3D &drm_gem_dma_vm_ops,
> +       .vm_ops =3D &vm_ops,
>  };
>
>  static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
> --
> 2.38.1
>

