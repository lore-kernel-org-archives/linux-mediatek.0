Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504EFC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIc1HDjYzefg/CVbe2Xb6gm/Ty5rNUeIrztAt83SE00=; b=rLt7E18U85yghb1xUPoLocdykb
	4Nj+jG4VBDZIG8Qa178FPEO2fm83wbf8dwWkCZ1oswtSKDuJYAEGA8+H1HTUkUyPwswwwCPRKgR69
	MpaLG24+zMrFqysqRgwTc2pa9f/IlWsIzkW5RNKJS5KVjerTIlShSVHTKU60DClvUMO1Z30OF7IOs
	fQdf+pv7hVTS504pbzkhP7K1oruhz4XETf5miONN82dgM5a1t6Pd/MUWWdJe4VsVzxxazytu5i+Lr
	40gH8LWswSetmP1jev8sZpcYNWXSlaOBbp9+lTTY+j/sglvgXpKbJvOp5CT6fh/rrtvi6jsAAyMS3
	J25GNzng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rChWQ-005DZS-26;
	Mon, 11 Dec 2023 14:44:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rChWE-005DVV-0r;
	Mon, 11 Dec 2023 14:44:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DEDC1B80CA2;
	Mon, 11 Dec 2023 14:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14348C433CD;
	Mon, 11 Dec 2023 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702305861;
	bh=IExdtmWmPMyY8Pay6KZb0S6W8wKmO6J3E3GfBIV1Cio=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LeXVj4Bu+T7n50b8HfpbHRiQwZNCwPXA3r/XqcRRjZbXn45jFPYhiFzfyIrn7RDyv
	 yBQAEgO8Z005TEuQnXqrs/oWoSAhSfX3otjLedh0fatrxHkPWPZpH1X2tyfOr7w56f
	 fBZ0QjFfZgUGSx5kYqpACVfKdtXLQ6H3Ssci02dxVpLJVr6fZjXMNfhkOW5qJSkpdR
	 /Iz8ZCH7P+yMD+RNonu2mXg/WDDc8xLlYFtgWrcPBZ1zA+XVUzIyL2G8ARXG1vZwDU
	 aZWaqO5PSB9MooT0ex4Pj7BGne+26lm+9OjjsQCi8AxiOzgDjmwb4L/ZvnCeKAA5Wo
	 KlRwDjdToXXJg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50bf4f97752so5767629e87.1;
        Mon, 11 Dec 2023 06:44:21 -0800 (PST)
X-Gm-Message-State: AOJu0Yy9N9A6DzDxeB4RPkmKtK72NCyvRfwIjwrK4lDNOjk8uRQwaMLk
	FlZ7o0ViFcqU7HDbHOH5hjxu5Wg0p7XG2diQhw==
X-Google-Smtp-Source: AGHT+IHbV4puB5U8GlwIN/BZWBEsAsegaKynxZaOnbkAQ6wtk5UHRy14LSHQMn757papUqYJTbpaelmS3QylqrwmPx0=
X-Received: by 2002:a05:651c:807:b0:2cc:2120:81b3 with SMTP id
 r7-20020a05651c080700b002cc212081b3mr758630ljb.3.1702305859144; Mon, 11 Dec
 2023 06:44:19 -0800 (PST)
MIME-Version: 1.0
References: <20231110012914.14884-1-stuart.lee@mediatek.com> <20231110012914.14884-2-stuart.lee@mediatek.com>
In-Reply-To: <20231110012914.14884-2-stuart.lee@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 11 Dec 2023 22:44:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY__NgTPDedbuRQLZSS-0AC2rTW7Jfbm-e42sTU+-czzvew@mail.gmail.com>
Message-ID: <CAAOTY__NgTPDedbuRQLZSS-0AC2rTW7Jfbm-e42sTU+-czzvew@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/mediatek: Fix access violation in mtk_drm_crtc_dma_dev_get
To: Stuart Lee <stuart.lee@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	"Nancy . Lin" <nancy.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Lancelot Wu <lancelot.wu@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_064427_427367_0EEF3CBE 
X-CRM114-Status: GOOD (  18.19  )
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

Hi, Stuart:

Stuart Lee <stuart.lee@mediatek.com> =E6=96=BC 2023=E5=B9=B411=E6=9C=8810=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:29=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Add error handling to check NULL input in
> mtk_drm_crtc_dma_dev_get function.
>
> While display path is not configured correctly, none of crtc is
> established. So the caller of mtk_drm_crtc_dma_dev_get may pass
> input parameter *crtc as NULL, Which may cause coredump when
> we try to get the container of NULL pointer.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: cb1d6bcca542 ("drm/mediatek: Add dma dev get function")
> Signed-off-by: Stuart Lee <stuart.lee@mediatek.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index c277b9fae950..047c9a31d306 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -921,7 +921,14 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_=
device *drm_dev,
>
>  struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
>  {
> -       struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
> +       struct mtk_drm_crtc *mtk_crtc =3D NULL;
> +
> +       if (!crtc)
> +               return NULL;
> +
> +       mtk_crtc =3D to_mtk_crtc(crtc);
> +       if (!mtk_crtc)
> +               return NULL;
>
>         return mtk_crtc->dma_dev;
>  }
> --
> 2.18.0
>

