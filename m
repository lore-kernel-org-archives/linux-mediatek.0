Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386CBC433E9
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:36:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA08A22248
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA08A22248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8So604LL4IyCrDysfn4w7tHnDGn1OJMgosvcYC5smpE=; b=o7bcjlDYtUVCNle5rWPSidrAZ
	J3hey5OVLEWelfP9pTFy9iEdPcSmwHHvmjAYvTZSn3MpZkSx0jKHz2V8FfH0O5mjCJT+zSMYxH8Q6
	FAWPcOVT1BXowVyWZHQal6FJyv96RCAQI5DbQiwlE5bxX0VN/1PmV8hafVPKVDUkTzJVGAKj5Nb3i
	OzI65PyQm667xtgCfHRjcOKs3h60edalFiW1I1EffymfF+jrbsUJ7qkeVYltwSWdb5ObGvacye0+7
	grlk0l5m8g5YRzUwsY4/gFGqeDl3A7GiBJN6oMJPmaef9AgEo/KYN2zyp2UGF0fKQrXoQswtcWbLW
	NMTBrZbzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krzcz-0006AA-5G; Wed, 23 Dec 2020 08:36:13 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krzcw-00068q-HG
 for linux-mediatek@lists.infradead.org; Wed, 23 Dec 2020 08:36:11 +0000
Received: by mail-pg1-x534.google.com with SMTP id g15so5270681pgu.9
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Dec 2020 00:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OfrCLZAsvCa9E+UEDy5cUIBPR5zJvNqTrXdr4SCdt8c=;
 b=UMtBz2ORbpVVyCNyCiHvLukqnZRr+r1kBszkzGgaFwSRTKhnXtkTKFOQ3j4EW8oH6w
 GFbFzzbhOy/70vwgvVKxApt7Q2zMX4OxTTGx9xgMIoDQkcRAdA14b3rhrMW+6EhQoTOJ
 TqJ6Iy2alC5vUZDfgy4IAEav+SfuPKmg9Nkxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OfrCLZAsvCa9E+UEDy5cUIBPR5zJvNqTrXdr4SCdt8c=;
 b=d4/Zy9sTIUv0fLsCbt+MfKxijG06pSK4QsqFyMM+DGMMK94wm+ijsNmyE89q/bbwB9
 SQU8zIlyY1q/C6sSzCpQYYcv+8y30WELBVZqequBR4y6KzEd7cWzCeXPi0lwjm3vLbtE
 i5UL6xXQXy4tChX0/Rnpocjoz5dN8bpzgGc9BRtNp2abyAqgZJueGeWmZgK9pdxoZR8a
 0iDraGUJRj8/bJBqNHM74vkEUSIPeVa5GASONxhbgOxIUbuSU6mPzF82yOFZtCBEAtS+
 +cChnIMJmsAWDqoRtZT3eHjwycrpcaM1ZMV3mmOpB5f3zPYiy1pK5ibrEgT5xJe6dWU2
 PpZQ==
X-Gm-Message-State: AOAM530a9lAjCJKUP4vupk1DNqj8vu0RKTfmHcPVzAgLCzrQgq8d9s83
 H4vE6g35mXzGdRUzJzSH+KmEqw==
X-Google-Smtp-Source: ABdhPJy/ufv05/kcnbxdEivoZ5wcPsxjZGhiKhgHTe44wYRRjbq3ykCToz7VfuynLjBYvDDkre6gdA==
X-Received: by 2002:a63:504e:: with SMTP id q14mr5162728pgl.21.1608712568834; 
 Wed, 23 Dec 2020 00:36:08 -0800 (PST)
Received: from chromium.org ([2401:fa00:8f:2:a28c:fdff:fef0:43bf])
 by smtp.gmail.com with ESMTPSA id l197sm23336277pfd.97.2020.12.23.00.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 00:36:08 -0800 (PST)
Date: Wed, 23 Dec 2020 17:36:02 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 18/27] iommu/mediatek: Add power-domain operation
Message-ID: <X+MBcmzQn9iQWlVZ@chromium.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-19-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209080102.26626-19-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_033610_609843_86E0C602 
X-CRM114-Status: GOOD (  36.85  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 09, 2020 at 04:00:53PM +0800, Yong Wu wrote:
> In the previous SoC, the M4U HW is in the EMI power domain which is
> always on. the latest M4U is in the display power domain which may be
> turned on/off, thus we have to add pm_runtime interface for it.
> 
> When the engine work, the engine always enable the power and clocks for
> smi-larb/smi-common, then the M4U's power will always be powered on
> automatically via the device link with smi-common.
> 
> Note: we don't enable the M4U power in iommu_map/unmap for tlb flush.
> If its power already is on, of course it is ok. if the power is off,
> the main tlb will be reset while M4U power on, thus the tlb flush while
> m4u power off is unnecessary, just skip it.
> 
> There will be one case that pm runctime status is not expected when tlb
> flush. After boot, the display may call dma_alloc_attrs before it call
> pm_runtime_get(disp-dev), then the m4u's pm status is not active inside
> the dma_alloc_attrs. Since it only happens after boot, the tlb is clean
> at that time, I also think this is ok.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 41 +++++++++++++++++++++++++++++++++------
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 6fe3ee2b2bf5..0e9c03cbab32 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -184,6 +184,8 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
>  	struct mtk_iommu_data *data = cookie;
>  
>  	for_each_m4u(data) {
> +		if (!pm_runtime_active(data->dev))
> +			continue;

Is it guaranteed that the status is active in the check above, but then
the process is preempted and it goes down here?

Shouldn't we do something like below?

        ret = pm_runtime_get_if_active();
        if (!ret)
                continue;
        if (ret < 0)
                // handle error
        
        // Flush
        
        pm_runtime_put();

Similar comment to the other places being changed by this patch.

>  		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
>  			       data->base + data->plat_data->inv_sel_reg);
>  		writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
> @@ -200,6 +202,10 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>  	u32 tmp;
>  
>  	for_each_m4u(data) {
> +		/* skip tlb flush when pm is not active. */
> +		if (!pm_runtime_active(data->dev))
> +			continue;
> +
>  		spin_lock_irqsave(&data->tlb_lock, flags);
>  		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
>  			       data->base + data->plat_data->inv_sel_reg);
> @@ -384,6 +390,8 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
>  {
>  	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
>  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> +	struct device *m4udev = data->dev;
> +	bool pm_enabled = pm_runtime_enabled(m4udev);
>  	int ret;
>  
>  	if (!data)
> @@ -391,12 +399,25 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
>  
>  	/* Update the pgtable base address register of the M4U HW */
>  	if (!data->m4u_dom) {
> +		if (pm_enabled) {
> +			ret = pm_runtime_get_sync(m4udev);
> +			if (ret < 0) {
> +				pm_runtime_put_noidle(m4udev);
> +				return ret;
> +			}
> +		}
>  		ret = mtk_iommu_hw_init(data);
> -		if (ret)
> +		if (ret) {
> +			if (pm_enabled)
> +				pm_runtime_put(m4udev);
>  			return ret;
> +		}
>  		data->m4u_dom = dom;
>  		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
>  		       data->base + REG_MMU_PT_BASE_ADDR);
> +
> +		if (pm_enabled)
> +			pm_runtime_put(m4udev);
>  	}
>  
>  	mtk_iommu_config(data, dev, true);
> @@ -747,10 +768,13 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  	if (dev->pm_domain) {
>  		struct device_link *link;
>  
> +		pm_runtime_enable(dev);
> +
>  		link = device_link_add(data->smicomm_dev, dev,
>  				       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
>  		if (!link) {
>  			dev_err(dev, "Unable link %s.\n", dev_name(data->smicomm_dev));
> +			pm_runtime_disable(dev);
>  			return -EINVAL;
>  		}
>  	}
> @@ -785,8 +809,10 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  out_sysfs_remove:
>  	iommu_device_sysfs_remove(&data->iommu);
>  out_link_remove:
> -	if (dev->pm_domain)
> +	if (dev->pm_domain) {
>  		device_link_remove(data->smicomm_dev, dev);
> +		pm_runtime_disable(dev);
> +	}
>  	return ret;
>  }
>  
> @@ -801,8 +827,10 @@ static int mtk_iommu_remove(struct platform_device *pdev)
>  		bus_set_iommu(&platform_bus_type, NULL);
>  
>  	clk_disable_unprepare(data->bclk);
> -	if (pdev->dev.pm_domain)
> +	if (pdev->dev.pm_domain) {
>  		device_link_remove(data->smicomm_dev, &pdev->dev);
> +		pm_runtime_disable(&pdev->dev);
> +	}
>  	devm_free_irq(&pdev->dev, data->irq, data);
>  	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
>  	return 0;
> @@ -834,6 +862,9 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
>  	void __iomem *base = data->base;
>  	int ret;
>  
> +	/* Avoid first resume to affect the default value of registers below. */
> +	if (!m4u_dom)
> +		return 0;
>  	ret = clk_prepare_enable(data->bclk);
>  	if (ret) {
>  		dev_err(data->dev, "Failed to enable clk(%d) in resume\n", ret);
> @@ -847,9 +878,7 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
>  	writel_relaxed(reg->int_main_control, base + REG_MMU_INT_MAIN_CONTROL);
>  	writel_relaxed(reg->ivrp_paddr, base + REG_MMU_IVRP_PADDR);
>  	writel_relaxed(reg->vld_pa_rng, base + REG_MMU_VLD_PA_RNG);
> -	if (m4u_dom)
> -		writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
> -		       base + REG_MMU_PT_BASE_ADDR);
> +	writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK, base + REG_MMU_PT_BASE_ADDR);
>  	return 0;
>  }
>  
> -- 
> 2.18.0
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
