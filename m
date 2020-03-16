Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1D6C18E5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 17:55:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E10F20658
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 17:55:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdfKdshs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y/R6qyTP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E10F20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpxVbb6hJgSc5UBGy6HCMn8TzEIswRCIi1gJpuTokJ4=; b=pdfKdshsIFpp5H
	PTOie/J3tq4Cm6duHFdZw+EFyyXE4u5yst3N25STZn+s85WNuKYv1tqmF8hMaKkd8axpuoNUeAlb9
	9+HEljA/p7NFMKfysjv73ez/UWxucn61gw3Fi1RijRqPXxPHQB3FBevXbnw0RUAT/BgUMmrL/mvCj
	g5jW272aLYAaufU6punMFQwfQ69yVQFBR8cbk0K3HLElLA267ZDyZCf06V7fqbIMMO+HWReQA2sbP
	5BaCy9Z3hd4BlhWM1ssgpoKPQXg0sY1mvr7VTttUATSYUDB63GbSTLZLRSRLI8X3Zy60N4mIz6iqy
	3IoDeCd+TyFvnsX4ygJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDtxY-0000za-Fy; Mon, 16 Mar 2020 17:55:28 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDtxV-0000z2-Mj
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 17:55:27 +0000
Received: by mail-wr1-x444.google.com with SMTP id s1so665609wrv.5
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 10:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KZCpP6b3rcDrFb5nL77Llc1TqP6zJQRoyalcv/Uk/U4=;
 b=Y/R6qyTPo9TH/wBiHH7KTVuPGU3xiYNdjGryws2oZjJT4EdE1Ukovm/qw0EUnU24gU
 S55BE2BmG4HOCtOwEOXGyy7AXs7ku0tleXQgOw9PFvVcXjBuY7X76ik6J67WXOAkluwY
 N8AUX6GldQgLMC2mjOJDUYeeFD61OI8upFJvU0u4LMkkLTWuKAqoRyeRXtYobTQC3CM1
 DhcjEhjnIN+SU8WqnWGyVuamv6HlAzsykRt5ewg6nLfQTUffQQtYpl8UmUJbnXxtaH9t
 SxVsykhhy/G0nCc53h3pcXuufWOU2IhPvnEjecW1aIFH4e1Rdj9IpsbjZMLyQjBC3MnB
 v6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KZCpP6b3rcDrFb5nL77Llc1TqP6zJQRoyalcv/Uk/U4=;
 b=h0JiS2s7iJji+WvI11HUbMocTQr472Xy7lC12dB+qKhHGgvdVCRuRZ9OeNbCj9rHS3
 86DzXa0kMRHIdGcKTZSz0yuAErRb40ylLqvXupmtZ38NBiNWlm+6JR5YgRKAa2nfyc9E
 wKSPMNE7txzEKiLBi8ldjilQqilKreX0x6moCT19SbPfqVE7hUcYMWEtehOt4yQFv+eK
 2HAIFrLsJobJA9hXZysCpTTsLSnL36RQhWFinABuZ4LOZx4BXS6r1OV51JwMPfptv+EU
 +NK8ozVMhpo9sjOubephoZ7504t4I+zfKqo9IbX2ySKCez07MOElyp1HpSwCWlLvcYdV
 8jmg==
X-Gm-Message-State: ANhLgQ1E3gC605kRJGxfXih5zdFBbuEU1vCV1dqx6vvOriN8AHt2MXPr
 JjUCTM2Igr0pVFqzGvsxAbMoZMk9dQ0=
X-Google-Smtp-Source: ADFU+vuHWkRqgMn4prXCXTnSNDBAjWBUzoa8syi0tqbAh8eRnR4X3rD/HVE1PtCHryXLNIoYPL6aMQ==
X-Received: by 2002:adf:f14a:: with SMTP id y10mr485041wro.325.1584381324158; 
 Mon, 16 Mar 2020 10:55:24 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id n10sm964333wro.14.2020.03.16.10.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 10:55:23 -0700 (PDT)
Date: Mon, 16 Mar 2020 18:55:15 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 10/15] iommu/arm-smmu: Use accessor functions for iommu
 private data
Message-ID: <20200316175515.GP304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-11-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-11-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_105525_743385_820EFD0F 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: Rob Clark <robdclark@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Hanjun Guo <guohanjun@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2020 at 10:12:24AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions and simplify the code
> where possible with this change.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
[...]
> @@ -1467,7 +1470,7 @@ static void arm_smmu_remove_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &arm_smmu_ops)
>  		return;
>  
> -	cfg  = fwspec->iommu_priv;
> +	cfg  = dev_iommu_priv_get(dev);
>  	smmu = cfg->smmu;
>  
>  	ret = arm_smmu_rpm_get(smmu);
> @@ -1475,23 +1478,22 @@ static void arm_smmu_remove_device(struct device *dev)
>  		return;
>  
>  	iommu_device_unlink(&smmu->iommu, dev);
> -	arm_smmu_master_free_smes(fwspec);
> +	arm_smmu_master_free_smes(dev);
>  
>  	arm_smmu_rpm_put(smmu);
>  
>  	iommu_group_remove_device(dev);
> -	kfree(fwspec->iommu_priv);
>  	iommu_fwspec_free(dev);
> +	kfree(cfg);

nit: cfg is allocated after fwspec so it might be cleaner to free cfg
before fwspec.

But more importantly, should we clear the private data here and in the
other drivers, by calling dev_iommu_priv_set(dev, NULL) from
remove_device()?  We are leaving stale pointers in dev->iommu and I think
some of the drivers could end up reusing them.

Thanks,
Jean


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
