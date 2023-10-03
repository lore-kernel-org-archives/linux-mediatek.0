Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D19DE75434
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bitTTBesOlX5jNs0WrntjlIVBf0r6k8vUqdJl07s2a4=; b=n2DTgPdCjZ6codWho7f65NIeXr
	L3UVXU8Qdr3gkR3+yL4TiR6yxhFEmM3YfuH/Ej5Uv3Tve5kGYxntmn3+ODgP9BLOK1jAxaY53R8Vf
	XdPgS9UQnJLE+bPLtZYTvysBSsudPhA6KCK0gTMstvcH6NlOzYGoHkLUdaka97l4/+zrlMsquqRxK
	Obh+Yc6SrXd3wk/vcgbmTOv3hKUypK1HLqTRYFWxa7hb1TXEqTMumUL61HbkAp33hNGFP9Q5QnHnt
	SPWtCzZgrZiSTHMkLRLmirbLxlJWzQMYxbyFlIgRSh1JMm8CWXoOPBzrSnWYzXrgH5PIGFepNVex2
	mR7Jswsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnarN-00E9ex-0o;
	Tue, 03 Oct 2023 08:34:29 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnarJ-00E9cf-05
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Oct 2023 08:34:27 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-59bc956b029so7989667b3.2
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Oct 2023 01:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696322061; x=1696926861; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bitTTBesOlX5jNs0WrntjlIVBf0r6k8vUqdJl07s2a4=;
        b=cMguo3iGjK98DKuF6q3Cy4gz/unB9KvjtXJ5/y24VFw9nTo0UeMQKFeCfzPbyOhaQP
         dJ7drGPwVK9r991eF6ynRt6T/CWigymnXf1pEJD4tThtcuQolrZSmwzUlncGgHS05ERB
         bMW+8HSKitGsC6/RNgJjz6yb7F89859eDGgS5WCAnXGdhJmqRugEeDlbq8sAmLJjqJeI
         c8VYsSt82MKTZlPamjYY2SgVlO7jyRCF4QQWL9bky+UTaZljXATUWZB1iOqORsIsv2lo
         TxLN9nF9dAjA/fXNJff0iwZzfd8UGrBOsFBbm5SV0uVC0z+1mAdcHK4hSDz6CN8P3aJB
         X6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696322061; x=1696926861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bitTTBesOlX5jNs0WrntjlIVBf0r6k8vUqdJl07s2a4=;
        b=PcXr1O7fk8VAbnO+Cj3rhEo+AS0NP99Pm94EZtimmJJUIkppeBCFJITFrqg/xhN/3z
         dulIpmEM4qvcA6jkmMFmy5nJo+74jdTDRZiLqIh9NGWINagrx6cnlRw+uwySE3tEGa9o
         MSGEe86QLZNMKlKC1NA8l1OenQXh0qcfPRwtw+te9r34+hPkyYG4t0ZaMLROpmLyZwf8
         GkCibLy325Ibsz1GfIor9uP5lH3cOM8cIjn1yW37hCQBiLBIhPK/jTuV9jOkmr3iUeWi
         MRyFkBctkIyqbdikV179YZTA+VT4F3a3Ztuc/2pZfr9p/9LymIW0F6eoRwgYDIZaQmgC
         uiMw==
X-Gm-Message-State: AOJu0YyUb4tFAQvcx87bNRKLAJaO0WHLjoz4oZtBBWv8PPzn0D8h+93V
	oKxyihqbWrv0JlElKWLslaUNVjl9CEvAWc9O1Ff6UA==
X-Google-Smtp-Source: AGHT+IFDzIQLW0laXGE7JKd6lbdhFAMnDeThlxxmtoO8UChMspJgCI8sx/aRikQspuJgbcSRJHW6nrx+DUBW3F7ngjs=
X-Received: by 2002:a0d:f685:0:b0:59e:8f6d:92e with SMTP id
 g127-20020a0df685000000b0059e8f6d092emr14665847ywf.49.1696322060718; Tue, 03
 Oct 2023 01:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
 <20-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com> <CAA8EJprz7VVmBG68U9zLuqPd0UdSRHYoLDJSP6tCj6H6qanuTQ@mail.gmail.com>
 <20231002230000.GA682044@nvidia.com>
In-Reply-To: <20231002230000.GA682044@nvidia.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Oct 2023 11:34:08 +0300
Message-ID: <CAA8EJpr-CpgTVipd_t1uj7iHHq6__pj3mrm4Mn-pdZwhpS8aDA@mail.gmail.com>
Subject: Re: [PATCH v8 20/24] iommu: Require a default_domain for all iommu drivers
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	linuxppc-dev@lists.ozlabs.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, 
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Jerry Snitselaar <jsnitsel@redhat.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, 
	Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_013425_066113_AB62B0CB 
X-CRM114-Status: GOOD (  23.37  )
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

On Tue, 3 Oct 2023 at 02:00, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Tue, Oct 03, 2023 at 12:21:59AM +0300, Dmitry Baryshkov wrote:
> > On Wed, 13 Sept 2023 at 16:45, Jason Gunthorpe <jgg@nvidia.com> wrote:
> > >
> > > At this point every iommu driver will cause a default_domain to be
> > > selected, so we can finally remove this gap from the core code.
> > >
> > > The following table explains what each driver supports and what the
> > > resulting default_domain will be:
> > >
> > >                                         ops->defaut_domain
> > >                     IDENTITY   DMA  PLATFORM    v      ARM32          dma-iommu  ARCH
> > > amd/iommu.c             Y       Y                       N/A             either
> > > apple-dart.c            Y       Y                       N/A             either
> > > arm-smmu.c              Y       Y                       IDENTITY        either
> > > qcom_iommu.c            G       Y                       IDENTITY        either
> > > arm-smmu-v3.c           Y       Y                       N/A             either
> > > exynos-iommu.c          G       Y                       IDENTITY        either
> > > fsl_pamu_domain.c                       Y       Y       N/A             N/A     PLATFORM
> > > intel/iommu.c           Y       Y                       N/A             either
> > > ipmmu-vmsa.c            G       Y                       IDENTITY        either
> > > msm_iommu.c             G                               IDENTITY        N/A
> >
> > Unfortunately this patch breaks msm_iommu platforms. This driver
> > doesn't select ARM_DMA_USE_IOMMU, so iommu_get_default_domain_type()
> > returns 0, bus_iommu_probe() fails with -ENODEV.
> > If I make MSM_IOMMU select ARM_DMA_USE_IOMMU, then GPU probing fails
> > with -EBUSY.
>
> Oh, OK.
>
> Does this fix it?

It indeed fixes the issue, so could you please post it, adding:
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index cdc7b730192a35..f7ef081c33dcb2 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -685,10 +685,16 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
>         return 0;
>  }
>
> +static int msm_iommu_def_domain_type(struct device *dev)
> +{
> +       return IOMMU_DOMAIN_IDENTITY;
> +}
> +
>  static struct iommu_ops msm_iommu_ops = {
>         .identity_domain = &msm_iommu_identity_domain,
>         .domain_alloc_paging = msm_iommu_domain_alloc_paging,
>         .probe_device = msm_iommu_probe_device,
> +       .def_domain_type = msm_iommu_def_domain_type,
>         .device_group = generic_device_group,
>         .pgsize_bitmap = MSM_IOMMU_PGSIZES,
>         .of_xlate = qcom_iommu_of_xlate,

-- 
With best wishes
Dmitry

