Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6BAC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 23:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HU2ROMB1RwgpNN/1oH4E+VcxpemIY8yS+CXoJjHUUU=; b=Etod+vwfUUxZfxoNncauxszxsj
	oMvDb/HjAFTi4n9th6RiRNngCbZZmkNsfGitSfEeQneoR6m58PTeahP4CH8hjwA5Mg8LWhjsQActH
	bp1DhnKKqPnj87gSSfkMNsxLNfAxwJiczgUEtRNaCT7sNIOCqNylE41sZuyPeiOaej1w2bybQrq9o
	oPvIKMWWb+Wsz8io2RiOs6+hI4CONvNdG9KYdLBycEmMh1141Fg2sm7ive+rDRCczbnl24Sj8dmvt
	5niNDlZnQUxApQNfr/twgyMalUGFNtruWkWTMLR+qb2fGoqvi53m+oIpi+a3khDdVvp02oef/KiGf
	p1gy6AHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBNqr-00EDWB-1N;
	Thu, 07 Dec 2023 23:32:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBNqn-00EDV8-2l;
	Thu, 07 Dec 2023 23:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 263EBB82AC1;
	Thu,  7 Dec 2023 23:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BADC43391;
	Thu,  7 Dec 2023 23:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701991930;
	bh=C/W5Zqmm3kI2CHjWroHcjD9PIpXCfj28AU66trdDTUM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d+yTdQC4dTkX9Gr/sFWB02o7o7wyinsoIGO7q3AGOPK3ieUcmiwO/zr9nNcX095N4
	 wLWTs14qPYf1jwm/rVHBI6V77ZbFaEVADKJdgr5Uwsk+U753ad+M9BqYSjUCxpTE4X
	 1VesagEAATWfxPLUe31lVDzFaX+Y9Hs9LCDmyu/+LNRo69p3gE6ol+ANKZnsBsPd87
	 lwDmZfusP93IVMch4/L0N7H/3WlppJgjXXGVUm0JyJ3yL50TI82Thj4guZbw//ftGt
	 U3prV3km6go6hodv9yErhFeLDLEp24Tkz7Zj2HEyKNJ+vATvX6MFSe5V9C1EWOxo57
	 edwKNNuVh/4iw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ca0715f0faso19838821fa.0;
        Thu, 07 Dec 2023 15:32:10 -0800 (PST)
X-Gm-Message-State: AOJu0Yw6toyiB4gmTb1kiT1ZiSymxOigPPmkRCrjdvQUTONXfhbZQdZB
	3syDjF8QU39uJXYOZ91EAyZtp3Plp9wD65DsGQ==
X-Google-Smtp-Source: AGHT+IEXkXUCSw2a+d4ytwMlKqOGSXhd9HUHp4O6aHLJqy1GBZczWauiJZgZq9F9PdRnsM1RFPLW0gm/6S/wwTE4IGA=
X-Received: by 2002:a2e:804a:0:b0:2cb:20f0:b869 with SMTP id
 p10-20020a2e804a000000b002cb20f0b869mr95776ljg.12.1701991928954; Thu, 07 Dec
 2023 15:32:08 -0800 (PST)
MIME-Version: 1.0
References: <fd1b62aa006556f29f37535814abfe41be63f7ae.1700746094.git.robin.murphy@arm.com>
In-Reply-To: <fd1b62aa006556f29f37535814abfe41be63f7ae.1700746094.git.robin.murphy@arm.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 8 Dec 2023 07:31:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9HG_Y+vJ4g_V+5DXEFsPP=2vudyxbhcrTXYKn0E=9sLQ@mail.gmail.com>
Message-ID: <CAAOTY_9HG_Y+vJ4g_V+5DXEFsPP=2vudyxbhcrTXYKn0E=9sLQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: Stop using iommu_present()
To: Robin Murphy <robin.murphy@arm.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, yong.wu@mediatek.com, 
	airlied@gmail.com, daniel@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_153214_198099_E2E67AC8 
X-CRM114-Status: GOOD (  17.93  )
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

Hi, Robin:

Robin Murphy <robin.murphy@arm.com> =E6=96=BC 2023=E5=B9=B411=E6=9C=8823=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:41=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Remove the pointless check. If an IOMMU is providing transparent DMA API
> ops for any device(s) we care about, the DT code will have enforced the
> appropriate probe ordering already. And if the IOMMU *is* entirely
> absent, then attempting to go ahead with CMA and either suceeding or
> failing decisively seems more useful than deferring forever.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>
> I realised that last time I sent this I probably should have CCed a
> wider audience of reviewers, so here's one with an updated commit
> message as well to make the resend more worthwhile.
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 2dfaa613276a..48581da51857 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -5,7 +5,6 @@
>   */
>
>  #include <linux/component.h>
> -#include <linux/iommu.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> @@ -608,9 +607,6 @@ static int mtk_drm_bind(struct device *dev)
>         struct drm_device *drm;
>         int ret, i;
>
> -       if (!iommu_present(&platform_bus_type))
> -               return -EPROBE_DEFER;
> -
>         pdev =3D of_find_device_by_node(private->mutex_node);
>         if (!pdev) {
>                 dev_err(dev, "Waiting for disp-mutex device %pOF\n",
> --
> 2.39.2.101.g768bb238c484.dirty
>

