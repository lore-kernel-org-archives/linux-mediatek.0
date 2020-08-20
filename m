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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A00C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 17:05:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43E42208A9
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 17:05:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nkBYovB6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z11Hdhb8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43E42208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bM4I6tKyt/glL5U98ZI+GwF4LOauuR86YSTv4z8/mF0=; b=nkBYovB61NKpxSMI/IhMM+vW9
	ah5AKBk1M9qUrcaUZq7zL9iJWdK/OyVZIeq51jVPcedeJENXsOwvETt3OPoJwngk+ofgsZRMBHQuJ
	8N6TbxK9voTpHB8rWLdGhM61UXLhggFnT0fs+gNDIyyicG1z+GoSpIzXHhv7T7WkuymF82KZFgJxh
	/H7zumQh/lHFiv2Lgk762MnfKR28arv9j87Amj8G45wo1WfCgQhRndDjIXH9JETFdyNRMVeYVgP8p
	dmg3ohKCLsi5DOPK3fpj0HY9Iv0GtZdDf0m2uypb8lnmVIqi2ANIjpRLASa1zWITmfabvac5nbymX
	+FQqxbvrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8o0R-0005lf-RR; Thu, 20 Aug 2020 17:05:39 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8o0Q-0005l7-0v; Thu, 20 Aug 2020 17:05:38 +0000
Received: by mail-wm1-x344.google.com with SMTP id o21so2278566wmc.0;
 Thu, 20 Aug 2020 10:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4eX00c0ckm8hT0A0C/n4MyfX4EjjAaDz31mN/Lb//fY=;
 b=Z11Hdhb8fIf+RWDsfZYkftMhqk7M2OXy0n6MgA0ETp9jr3pQV8ulNcpRKj/wKp+Jcb
 TJydKyyk8agCFCKNNVnmf/LSzwt5bkfqxPoBrJfk9wIeWsj3ZxeZ0ypZrs1MtkVmxRRX
 x81JDHis0hoohcY0Q6Ywz9FkA4+uo/uBfiR3m6br16gLBDZ0jm2DrQuA5qDaLjy/F60S
 V1fg+5A7e4NKYugc3e5Xg2R7tNWQTDUK4LztV5U6/Rt21jkXnI9pXAOnIuQyz923d1dR
 HzHV5ev7gLhj5R1KTo733m06xj4N6pqkhAWVg59VKP5cboJK1OKaF5Gqsjv4rsSG1r1h
 /zsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4eX00c0ckm8hT0A0C/n4MyfX4EjjAaDz31mN/Lb//fY=;
 b=GDzzyu9WaJA01Pr20DCayx83QfxmfNAYl+lRNIGV+F+rykcDReV2khl2l9meYU/bEo
 IYIhxeLF9PkOQ1K8cPUOltJcG23od539xE6ckab9QM7vMeK2U1C3BWzRaSPz9UDkyh2R
 AUQR5mq2CHT32baxSaD7aAItoqY5HfU0bbPtGtAssHJSJPwOy0WWd5GUGy+vBzf4+19f
 ued6tTbW0mQxXVbUAgvo6Y8y59B8dLz7s0erNOyzJY6I46dXtCH20hYfT3iu4B0aq9kw
 7W3zgDiq69UqMr3c/HuWQiEjK2XD45hnQQLd7zWJO1WuUlcZWv19gOHUUzv9J+I7TSi2
 qq+Q==
X-Gm-Message-State: AOAM533HWa8H2FJyU6TduM3SeHXAm1fjp2SrChJX55Xz2c3VDvu4twy/
 cz6mnYdNX2ZmtFbNqzubvtkdTT8yFp4iXdkpPgM=
X-Google-Smtp-Source: ABdhPJyyd8HHoirSU/WeVEZLJyRDkczRjPGF9/eWaPA4wGBOVGhOy7ejxlGod+q0XjTYTyGC7MJSrAGP/V2HLxQLL8g=
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr4638247wmf.49.1597943137022; 
 Thu, 20 Aug 2020 10:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597931875.git.robin.murphy@arm.com>
 <93d7de3533cfd952aecd6198b9221d7a58c0e521.1597931876.git.robin.murphy@arm.com>
 <CAF6AEGuKa4P=gfus08CdfT2H5pG6a2PBumGb=Pw3qvD=NWueig@mail.gmail.com>
 <b5aa001f-6a1c-af0b-1526-c5b7a2e29ef7@arm.com>
In-Reply-To: <b5aa001f-6a1c-af0b-1526-c5b7a2e29ef7@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Aug 2020 10:05:25 -0700
Message-ID: <CAF6AEGs1JyZqNYyHC6DsjZa2wbHVhP-M=ZVJxHqYjeFQPZ3APA@mail.gmail.com>
Subject: Re: [PATCH 10/18] iommu/msm: Add IOMMU_DOMAIN_DMA support
To: Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_130538_087802_BD28A6A1 
X-CRM114-Status: GOOD (  31.00  )
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
 Joerg Roedel <joro@8bytes.org>, Magnus Damm <magnus.damm@gmail.com>,
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

On Thu, Aug 20, 2020 at 9:58 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-08-20 16:55, Rob Clark wrote:
> > Side note, I suspect we'll end up needing something like
> > 0e764a01015dfebff8a8ffd297d74663772e248a .. if someone can dig a 32b
> > device out of the closet and dust it off, the fix is easy enough.
> > Just wanted to mention that here so anyone with a 32b device could
> > find what is needed.
>
> FWIW there shouldn't be any material change here - the generic default
> domain is installed under the same circumstances as the Arm
> dma_iommu_mapping was, so if any platform does have an issue, then it
> should already have started 4 years with f78ebca8ff3d ("iommu/msm: Add
> support for generic master bindings").

ok, it has, I guess, been a while since playing with 32b things..
someone on IRC had mentioned a problem that sounded like what
0e764a01015dfebff8a8ffd297d74663772e248a solved, unless they disabled
some ARCH_HAS_xyz thing (IIRC), which I guess is related..

BR,
-R

> Robin.
>
> >
> > BR,
> > -R
> >
> > On Thu, Aug 20, 2020 at 8:09 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> Now that arch/arm is wired up for default domains and iommu-dma,
> >> implement the corresponding driver-side support for DMA domains.
> >>
> >> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> >> ---
> >>   drivers/iommu/msm_iommu.c | 7 ++++++-
> >>   1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> >> index 3615cd6241c4..f34efcbb0b2b 100644
> >> --- a/drivers/iommu/msm_iommu.c
> >> +++ b/drivers/iommu/msm_iommu.c
> >> @@ -8,6 +8,7 @@
> >>   #include <linux/kernel.h>
> >>   #include <linux/init.h>
> >>   #include <linux/platform_device.h>
> >> +#include <linux/dma-iommu.h>
> >>   #include <linux/errno.h>
> >>   #include <linux/io.h>
> >>   #include <linux/io-pgtable.h>
> >> @@ -314,13 +315,16 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
> >>   {
> >>          struct msm_priv *priv;
> >>
> >> -       if (type != IOMMU_DOMAIN_UNMANAGED)
> >> +       if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
> >>                  return NULL;
> >>
> >>          priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> >>          if (!priv)
> >>                  goto fail_nomem;
> >>
> >> +       if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(&priv->domain))
> >> +               goto fail_nomem;
> >> +
> >>          INIT_LIST_HEAD(&priv->list_attached);
> >>
> >>          priv->domain.geometry.aperture_start = 0;
> >> @@ -339,6 +343,7 @@ static void msm_iommu_domain_free(struct iommu_domain *domain)
> >>          struct msm_priv *priv;
> >>          unsigned long flags;
> >>
> >> +       iommu_put_dma_cookie(domain);
> >>          spin_lock_irqsave(&msm_iommu_lock, flags);
> >>          priv = to_msm_priv(domain);
> >>          kfree(priv);
> >> --
> >> 2.28.0.dirty
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
