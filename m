Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BD2C38142
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Jan 2023 02:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lgNskV3X7MZuDgl/2VjE8FjQJ7rf0JHCDXNz//a8fM=; b=2BtRYd3vcbzO8Sj+Cvlu75L/hf
	kzE5c5vdSy4a495OzNXkBy6kzgnil2Q3WJdCEoZ+zXzfwUUi7xdWlHNr+Ynb6VzoYBkX4BhzSVBUN
	Dka78nnkNcznjD/styWWOcasEFxXlTgbDO0v1+gzrnMAuabKz5SooKZVZ91N7/LLPl3WXzbZ627UA
	MGwfSCVMJO6aNDRnXtVAIecQY4TyHkpM1JIl99QxBpqpwNrhJdOeVGipRh5i9QL6cC3YCs4yeOWJU
	vGaWVpY6Zp2hueDcdto4OjlIXEzYAXAYwE24oVG35kXPkNGDRP1nT75fA76X96TDblMyL23ez5aCz
	BqdF+VbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLxBy-000sWe-PI; Sun, 29 Jan 2023 02:13:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLxBn-000sTy-1p; Sun, 29 Jan 2023 02:13:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 72FF4B80C7E;
	Sun, 29 Jan 2023 02:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C77C433D2;
	Sun, 29 Jan 2023 02:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674958380;
	bh=bDBCMu/zp8KjdqS3kbfEEJifaegCwLaj9SYK4obytd4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IO5XW3WULpEnzd4xFl9C0XW1AThAkrj3dsblKaf5+atHlkwaAzHJter9AKUKFPJX2
	 /JRAtIpxSoZaMxMp+b9wFdLnTyIKQAVHgRwVqEUKr56HjFH9tr8M8Cy6dnImwVctGa
	 krhNjbI21aohw0IufJ6X0mCnKlMUgIwIPFFlH5ePp1KEIyNopVd4WsLz5lI3arsKFx
	 DeDlyzBiXvI3Qz+h4jraJZvow2tofh36qELB0cm0WPhNsBDamZoZeBBe41uaicDicX
	 O24ez/nFrxyGXl5EssymlMLJbfqu1d4BPjQ0yMvJOjyFIPt+XnxCu2uJcn7atOj58S
	 1WS/YKZ2EvC2g==
Received: by mail-lj1-f180.google.com with SMTP id z27so2218355ljq.5;
        Sat, 28 Jan 2023 18:12:59 -0800 (PST)
X-Gm-Message-State: AFqh2kpCTze9J9h/K4P5iNLYo0lAbWUtY1AlWmvCpQ/126jH5UmzWn7G
	c1RT5dDDyMoT42L74l7U4GqaiRyBcWhuUv8bmA==
X-Google-Smtp-Source: AMrXdXshUXXA9XhEjUJCThTvj3W2ig/URidG30bwfoNNiTptwiWYB7juno5yIjwBpSxxDjxTUvjSkRcPFqRJH6TADrA=
X-Received: by 2002:a2e:a80b:0:b0:28b:802d:ecee with SMTP id
 l11-20020a2ea80b000000b0028b802deceemr2952306ljq.259.1674958378087; Sat, 28
 Jan 2023 18:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20230127165409.3512501-1-robdclark@gmail.com>
In-Reply-To: <20230127165409.3512501-1-robdclark@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 29 Jan 2023 10:12:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-fCTpZs9-LU+MaMd0EMrQQW51OLjQwnixupEVu-Vr5Ug@mail.gmail.com>
Message-ID: <CAAOTY_-fCTpZs9-LU+MaMd0EMrQQW51OLjQwnixupEVu-Vr5Ug@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Remove unused GEM DMA header include
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Doug Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Clark <robdclark@chromium.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	"moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_181303_268574_C6B3A61C 
X-CRM114-Status: GOOD (  14.31  )
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

Rob Clark <robdclark@gmail.com> =E6=96=BC 2023=E5=B9=B41=E6=9C=8828=E6=97=
=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8812:54=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Rob Clark <robdclark@chromium.org>
>
> No longer needed since the removal of dependency on DMA helper.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 2ea8aec56bf1 ("drm/mediatek: Remove dependency on GEM DMA helper")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index cd5b18ef7951..7e2fad8e8444 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -20,8 +20,8 @@
>  #include <drm/drm_fbdev_generic.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem.h>
> -#include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_ioctl.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> --
> 2.38.1
>

