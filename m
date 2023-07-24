Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC1FEB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 22:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=358vZqiTvej61X45civfUiKJd7hpr9GfM3mB5tO/1oY=; b=iSEgsP2ypjatLhzKK0aGEU28DX
	2B0DgeGlScPIAnw5UzSlLvdyFWREnchgET/m/UtzKpf3jbhqeCY1IU1oEi6W0m9Z2B7BkF2bDxh4K
	8AH7qsgkKt6YkeRgvC3tWOCJYfaq+omLY8ng2g5a/TmqEmvbfLuBLv9ZVDxv5wHAT9CYH2FwGpvj6
	X67Ax5jq5fz60fkZ/Lo/uSHjfZyr0BTxJF2v4MBwXF2ZbxCGFfYbnH23lKTPTjtlBPXnoThr5o1cM
	36Z94bwYCnBqa1eAqveQZ+xD6KZqn570kQf7ogwwUgE+PTMXZZucSN09eFDyB06MYMHieNbNyG3YZ
	XFROUpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO3wY-005X8Q-2K;
	Mon, 24 Jul 2023 22:22:18 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO3wV-005X6y-0I
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jul 2023 22:22:16 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b6f97c7115so68566111fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Jul 2023 15:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690237333; x=1690842133;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=358vZqiTvej61X45civfUiKJd7hpr9GfM3mB5tO/1oY=;
        b=CWyKsn+fyo8A461uDHxlWqqNhJomz0p6jdiOowLbkzTOopNmfoNhBambSUtyEO5LNP
         8ZQxB7OKJaeWWTdMhye3/FhUuSUb6YLLGS6tLS8eTeyjps6Os2KMTEOOdQUN1ADiCs3y
         tA0O7NC2tWbxVi7BepJAcNSNZkhixC7NKrkyP0vhsnEwjCiYipyYGlcql329pVK4BS47
         IfmJj/dcHadTRR7pUVMVGXVFDeOJiREG11Vvrqk5HFB7zqjuhkzKS+VYHT76+UwT2Gws
         qaFPHFJZm9lmjfRt0gfHRI/55a+4obs2xjmHv1pvycZ69nHjRtSM9uYLS680TirWHpGK
         c0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690237333; x=1690842133;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=358vZqiTvej61X45civfUiKJd7hpr9GfM3mB5tO/1oY=;
        b=jYng/BGws3DHVI/NzF+g4Y8xF5PNiOJyfh+DlM5uzn8vFA6FcGoZZ/QEfLFtMP7Bg6
         pFPXKTN1e7V0ZUMxlSvRAzFeeppcXc5IbhfsIjVdFd8P5RDlo3pwlqKL8MZkDaGwYf62
         NzRFb9+x0aWJRB33LBzCINs+UsitsDZ46iUqPojlinMEupSlPVgLSjs1C3DeyOx8z69A
         lT0tr3LGY+xJikMd/t+JAMc9ra88saveWoeR002FdaiQU3AEgdnjYetC3mV1DRRu2iGg
         TibiwZ3B8GRJF1wFgga47Bw8kYozJsVHFUvwQA921IW1Op0VD1foGIBgju+dIpkoVFvp
         tIFg==
X-Gm-Message-State: ABy/qLab+E1F78r4X1afBgNg7z02GAYX/v4P22PYIOCQjgQhK5WLnzkL
	eV+u3Uyu0mgRhoiNgpyPPftYNA==
X-Google-Smtp-Source: APBJJlGRGPfacjmUq1tdWpenzld24E4eJsyR1C29jO0mKIDTugwb8qJZ+ixEzpUc6MmlTv/TGWeMgQ==
X-Received: by 2002:a05:6512:2036:b0:4f6:d7b:2f19 with SMTP id s22-20020a056512203600b004f60d7b2f19mr5787071lfs.24.1690237332390;
        Mon, 24 Jul 2023 15:22:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x27-20020ac25ddb000000b004fbb69d8791sm2391586lfq.79.2023.07.24.15.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 15:22:11 -0700 (PDT)
Message-ID: <7b250095-8245-53be-e593-cecbc3cc6763@linaro.org>
Date: Tue, 25 Jul 2023 01:22:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 14/25] iommu/msm: Implement an IDENTITY domain
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson
 <andersson@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linuxppc-dev@lists.ozlabs.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy
 <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Dmitry Osipenko <digetx@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>,
 Thierry Reding <treding@nvidia.com>
References: <14-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <14-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_152215_133035_0C2E12B2 
X-CRM114-Status: GOOD (  23.26  )
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

On 24/07/2023 20:22, Jason Gunthorpe wrote:
> What msm does during omap_iommu_set_platform_dma() is actually putting the

typo: msm driver doesn't use/provide omap_iommu_set_platform_dma().

> iommu into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
> compiled on ARM64 either. Most likely it is fine to support dma-iommu.c
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/msm_iommu.c | 23 +++++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 79d89bad5132b7..26ed81cfeee897 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -443,15 +443,20 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   	return ret;
>   }
>   
> -static void msm_iommu_set_platform_dma(struct device *dev)
> +static int msm_iommu_identity_attach(struct iommu_domain *identity_domain,
> +				     struct device *dev)
>   {
>   	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
> -	struct msm_priv *priv = to_msm_priv(domain);
> +	struct msm_priv *priv;
>   	unsigned long flags;
>   	struct msm_iommu_dev *iommu;
>   	struct msm_iommu_ctx_dev *master;
> -	int ret;
> +	int ret = 0;
>   
> +	if (domain == identity_domain || !domain)
> +		return 0;
> +
> +	priv = to_msm_priv(domain);
>   	free_io_pgtable_ops(priv->iop);
>   
>   	spin_lock_irqsave(&msm_iommu_lock, flags);
> @@ -468,8 +473,18 @@ static void msm_iommu_set_platform_dma(struct device *dev)
>   	}
>   fail:
>   	spin_unlock_irqrestore(&msm_iommu_lock, flags);
> +	return ret;
>   }
>   
> +static struct iommu_domain_ops msm_iommu_identity_ops = {
> +	.attach_dev = msm_iommu_identity_attach,
> +};
> +
> +static struct iommu_domain msm_iommu_identity_domain = {
> +	.type = IOMMU_DOMAIN_IDENTITY,
> +	.ops = &msm_iommu_identity_ops,
> +};
> +
>   static int msm_iommu_map(struct iommu_domain *domain, unsigned long iova,
>   			 phys_addr_t pa, size_t pgsize, size_t pgcount,
>   			 int prot, gfp_t gfp, size_t *mapped)
> @@ -675,10 +690,10 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
>   }
>   
>   static struct iommu_ops msm_iommu_ops = {
> +	.identity_domain = &msm_iommu_identity_domain,
>   	.domain_alloc = msm_iommu_domain_alloc,
>   	.probe_device = msm_iommu_probe_device,
>   	.device_group = generic_device_group,
> -	.set_platform_dma_ops = msm_iommu_set_platform_dma,
>   	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
>   	.of_xlate = qcom_iommu_of_xlate,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {

-- 
With best wishes
Dmitry


