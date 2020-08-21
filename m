Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C96C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 08:07:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31CE22078D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 08:07:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+fAKXkh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvzNVTn3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31CE22078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7neFNVlN2fL8epCRzw7tHue3t7Vn2mJ/v2XnIgHQCGQ=; b=G+fAKXkhCw/Ons/KHNUDQhFWg
	xEHqldOEhjTPiVrRobe7Vpe8TwSrP9RvW1kE/gljSucVfOHSPMI+zNk9iY/MelwxjUQg5cvLiMdL2
	GIsB1ZH5MI+qiuxlsYMVOK3Z6O4nYQZ/jyK2X6xoSrQ/unrJU5a93gpVatNn5Ysn/QqkKjF0dSV+a
	VgTYhuLkqXN3OYrlNVb96TXzTQWx7ypTExAVO0Z8nWnjDFaYeOZ01jhaiHVtBRzoaXjSKnnlgSnQU
	15v9JZxpmszf90a2ExwL0yLT3OYoiNv9jDPVwqtxorMtlM36f2uQckJmtcvrm+6eY/XuIcTOmsQHI
	6T0YC60KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k925L-0003xN-2v; Fri, 21 Aug 2020 08:07:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k925F-0003vE-FC; Fri, 21 Aug 2020 08:07:34 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DA4C2078D;
 Fri, 21 Aug 2020 08:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597997252;
 bh=LaMlJ8OWitxR94LYzLAW+/aCIQp70S1xt+7fdRecGkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lvzNVTn3kK+R6rhX3v2r5kGGWFVmcbdZ4VJtDADKQTwh2Aes+1MU5H+LAHiN8OQ+H
 ket2nq3Gs0f+y7KGGrtoh30Khl+NLrKZB5sMVZ4StNWFcKM28IvThm25QAGBbg8Bw9
 DAQdnRs+m1kjIK5XxPYS+MsULpHW1cs7ylBpEn4U=
Date: Fri, 21 Aug 2020 09:07:25 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 07/18] iommu/arm-smmu: Remove arch/arm workaround
Message-ID: <20200821080724.GA20060@willie-the-truck>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <ef39be82b98d2471c9e99c82d0eeda37ba30e4fa.1597931876.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef39be82b98d2471c9e99c82d0eeda37ba30e4fa.1597931876.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_040733_671023_6EC7F531 
X-CRM114-Status: GOOD (  18.49  )
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, digetx@gmail.com,
 s-anna@ti.com, hch@lst.de, m.szyprowski@samsung.com,
 linux-samsung-soc@vger.kernel.org, joro@8bytes.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, jonathanh@nvidia.com, agross@kernel.org,
 yong.wu@mediatek.com, kyungmin.park@samsung.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, inki.dae@samsung.com, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 20, 2020 at 04:08:26PM +0100, Robin Murphy wrote:
> Now that arch/arm is wired up for default domains and iommu-dma, remove
> the add_device workaround.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 09c42af9f31e..4e52d8cb67dd 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -1164,17 +1164,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  		return -ENXIO;
>  	}
>  
> -	/*
> -	 * FIXME: The arch/arm DMA API code tries to attach devices to its own
> -	 * domains between of_xlate() and probe_device() - we have no way to cope
> -	 * with that, so until ARM gets converted to rely on groups and default
> -	 * domains, just say no (but more politely than by dereferencing NULL).
> -	 * This should be at least a WARN_ON once that's sorted.
> -	 */
>  	cfg = dev_iommu_priv_get(dev);
> -	if (!cfg)
> -		return -ENODEV;
> -
>  	smmu = cfg->smmu;
>  
>  	ret = arm_smmu_rpm_get(smmu);

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
