Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFDDC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 15:55:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EFBF208C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 15:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jH/FCvHp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebljxtw8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EFBF208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O9QiMQt1PnEU4G/f3mpTr6xWrDCfWLu6yXpeZnL/jyM=; b=jH/FCvHprDgOZt9hRXAMEtOY1
	EsH0RkeWZGjD4SDVXVbfPMuR73ynVNKwN04/3fVc1ZM9GVFBKANuWeVL0TyirNqDpNymkLfiHPGQk
	87pxHxaHvdAPzcu6tfKAyNHCfGiKZiRTpliqRZ9TTzDcffIHaMTV6jrEUXCd+slRpVxQBkbVhnNF6
	zNvxM2yA7UmtjhPVzhA90WmJDAbY255ZdZYht40tLOR7be8jW6VyR1Wsk7vuJBUzJ+YNPlYZuxW9Q
	ympU64snA5Cq3LloA9dEb7bdsZWrcgXpGg3snZhdfvRyXR5uRGuqWZRiNX1q0I5qMdMLryQ6gYeHI
	JtRvO9NQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8muL-00045z-Ep; Thu, 20 Aug 2020 15:55:17 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8muJ-00045V-9F; Thu, 20 Aug 2020 15:55:16 +0000
Received: by mail-wm1-x344.google.com with SMTP id x5so2058997wmi.2;
 Thu, 20 Aug 2020 08:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4gsAD01Lu/a6HHuOZz2Js+H3gnol7gh8tJ3zMDutdDc=;
 b=ebljxtw8UtQQ032VUUuCGK812jroSyyHZHtTYoOMrud/UydGhZ3UMgBUN9qe9aAvk4
 EHygzdAvntJ9+R/Y3KA0p2V8fSCNXm6RFtsp3+CZNKezVJQ8X2aAKOeBHvVnuXgBzp1O
 Z4mdnxldoQFQbYRJYgGPkdtLHKlnlIzkaDXqkqTa3laBrCC8GM7uy1HvEv9ndhSWNfl7
 gtrl6II21EVeL5x1fdWpBOS2x6s/Ea7ce8pWBuPej62eiBTIeFwATx0cPhjPkPFtdmbp
 cpVIJwigFocq1ZQgZzWrnaG3CAmE48jwTnhO+RO8Uw3CBwiyc46QOxMJqP5MrYAE3v9X
 TZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4gsAD01Lu/a6HHuOZz2Js+H3gnol7gh8tJ3zMDutdDc=;
 b=uk7nJyBe4YzUaqK5z/qiyGkAOn4yJU5pRlR8q8VJON/c/Xn3wK0OkmDjGWiAz8/3jI
 wido7GGPQNnbRDf0qp6pY139K7q8BbKXPkTLuslEE4h7Zlrfej/PvbH1NeYk09nkCfk/
 z0KyibUd6v7AGDsc5+/v1AM1kRKV8NVa5mzMBtwKmKLhHubQvcaIhUVhzS5M8gJjnhVO
 AQCOl1GD42ynm31dv9meg4miIfLcZV22eAOwIjrowFfIb8GbYWK+GuTEHU02JBjrvynA
 1HyfE2Vs6f2PiAeG5oEe6qoIqjorlNBmKNXGtuOMhK5B8wbaWWAvPDUhPVqSKdn3cswc
 NU6g==
X-Gm-Message-State: AOAM532QWa0MZEGxu3/SjsXNpboGAoEYb6cLvGjBGEmnjCcAkqVT/g2u
 waIE/GQBdiXeTUKS8YJZ+hF0/7yZ7vVKDvfo9Nk=
X-Google-Smtp-Source: ABdhPJymrLvmSo2mjxf1P+WzawgnYC5TC99FhFkAg2iJ/mZCttmTx/9BBIkjwyymKsU721sVZprDLyZXm16x0EfQzm0=
X-Received: by 2002:a7b:c257:: with SMTP id b23mr3974646wmj.164.1597938913876; 
 Thu, 20 Aug 2020 08:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597931875.git.robin.murphy@arm.com>
 <93d7de3533cfd952aecd6198b9221d7a58c0e521.1597931876.git.robin.murphy@arm.com>
In-Reply-To: <93d7de3533cfd952aecd6198b9221d7a58c0e521.1597931876.git.robin.murphy@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Aug 2020 08:55:02 -0700
Message-ID: <CAF6AEGuKa4P=gfus08CdfT2H5pG6a2PBumGb=Pw3qvD=NWueig@mail.gmail.com>
Subject: Re: [PATCH 10/18] iommu/msm: Add IOMMU_DOMAIN_DMA support
To: Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_115515_389844_5D721A77 
X-CRM114-Status: GOOD (  24.74  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, digetx@gmail.com,
 Suman Anna <s-anna@ti.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <joro@8bytes.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Krishna Reddy <vdumpa@nvidia.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, t-kristo@ti.com,
 Kyungmin Park <kyungmin.park@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Side note, I suspect we'll end up needing something like
0e764a01015dfebff8a8ffd297d74663772e248a .. if someone can dig a 32b
device out of the closet and dust it off, the fix is easy enough.
Just wanted to mention that here so anyone with a 32b device could
find what is needed.

BR,
-R

On Thu, Aug 20, 2020 at 8:09 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Now that arch/arm is wired up for default domains and iommu-dma,
> implement the corresponding driver-side support for DMA domains.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/msm_iommu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 3615cd6241c4..f34efcbb0b2b 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -8,6 +8,7 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
> +#include <linux/dma-iommu.h>
>  #include <linux/errno.h>
>  #include <linux/io.h>
>  #include <linux/io-pgtable.h>
> @@ -314,13 +315,16 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
>  {
>         struct msm_priv *priv;
>
> -       if (type != IOMMU_DOMAIN_UNMANAGED)
> +       if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
>                 return NULL;
>
>         priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 goto fail_nomem;
>
> +       if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(&priv->domain))
> +               goto fail_nomem;
> +
>         INIT_LIST_HEAD(&priv->list_attached);
>
>         priv->domain.geometry.aperture_start = 0;
> @@ -339,6 +343,7 @@ static void msm_iommu_domain_free(struct iommu_domain *domain)
>         struct msm_priv *priv;
>         unsigned long flags;
>
> +       iommu_put_dma_cookie(domain);
>         spin_lock_irqsave(&msm_iommu_lock, flags);
>         priv = to_msm_priv(domain);
>         kfree(priv);
> --
> 2.28.0.dirty
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
