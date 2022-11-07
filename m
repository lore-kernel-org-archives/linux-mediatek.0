Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7D7C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKsZ1pUPn3K5pRE/Dp7ngoFgBEjp8MGy+3G1/3kBp9o=; b=YVEruEgZ6G4vvUaqT+yFEo9ZjZ
	wGKzWWyhdJBGMW5/+t+F6zgUDJZcMk5X4Ex275v22Pt8N1q2f+nkqPpC/A7S+aQi0uLl8BGGf+lYJ
	ZFHwxww1vWLIciyc/AjEplafrX6J6ONMm8Y/HPnHHIa99CFdEQbxrA++1NOcLnThut/29EAf0uh1O
	RCfUjFXJFQXnrBFIpUjFxbfXrEN4OsmVYN8qjqCcNHKE8bs5RyzcNuek5/jlSLNsHgi8Eyux61w0j
	NE7P9pNyfXo0DGbc7dIFEx85PHrAWWyHtInjZMtaPFkCS6VUenc8FhKyZhjYIeBJCFDPGmCeMuk12
	/lI9JuIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os41l-00Fje8-OD; Mon, 07 Nov 2022 15:27:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os41Z-00FjaR-RC; Mon, 07 Nov 2022 15:26:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 189FAB8121D;
	Mon,  7 Nov 2022 15:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45829C433C1;
	Mon,  7 Nov 2022 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667834814;
	bh=W675gqNAfxBDemkU93uk7keZsNkIbPSTt12Mk3qnGOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CtQqMj5pvofsT6RL6c73nOHyJPNzYHtWR26lgwhR5lL+mFr3DLmnfXNOyM2ctk2EB
	 DXSnyVmwBDVWCuh6t/jOYy4sGDpVuaah8fWod0gReT/fuEvZjRhpL+WKjRyfD3KxA5
	 StyJ8iTVWr2AYevyJncv9jcjUdKTGN08CG+c4sb5sthZwvKGwtnyE5ke3jg/Iw5YSO
	 IG58eDQv1Bu1n7fbiBR5ddQtysHqTwy/hn4mRBxbfYaLnb08KeHt4dh1qmmSMB2QnU
	 Rbls6y5O+krcPIpTHylZ9sv6MHtZf+7JOJAm12EOSyHvBewer8sDqrAkrqaWflTupW
	 qNvv+jC8xzkbQ==
Date: Mon, 7 Nov 2022 15:26:45 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, robin.murphy@arm.com, jgg@nvidia.com,
	kevin.tian@intel.com, quic_jjohnson@quicinc.com,
	suravee.suthikulpanit@amd.com, robdclark@gmail.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, yong.wu@mediatek.com,
	matthias.bgg@gmail.com, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	jean-philippe@linaro.org, tglx@linutronix.de,
	shameerali.kolothum.thodi@huawei.com, christophe.jaillet@wanadoo.fr,
	yangyicong@hisilicon.com, yangyingliang@huawei.com,
	quic_saipraka@quicinc.com, jon@solid-run.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v7 4/5] iommu: Use EINVAL for incompatible device/domain
 in ->attach_dev
Message-ID: <20221107152645.GD21002@willie-the-truck>
References: <cover.1666042872.git.nicolinc@nvidia.com>
 <f52a07f7320da94afe575c9631340d0019a203a7.1666042873.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f52a07f7320da94afe575c9631340d0019a203a7.1666042873.git.nicolinc@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_072658_203054_E58C483F 
X-CRM114-Status: GOOD (  19.84  )
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

On Mon, Oct 17, 2022 at 04:02:21PM -0700, Nicolin Chen wrote:
> Following the new rules in include/linux/iommu.h kdocs, update all drivers
> ->attach_dev callback functions to return EINVAL in the failure paths that
> are related to domain incompatibility.
> 
> Also, drop adjacent error prints to prevent a kernel log spam.
> 
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 +----------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       |  3 ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c     |  7 +------
>  drivers/iommu/intel/iommu.c                 | 10 +++-------
>  drivers/iommu/ipmmu-vmsa.c                  |  2 --
>  drivers/iommu/omap-iommu.c                  |  2 +-
>  drivers/iommu/sprd-iommu.c                  |  4 +---
>  drivers/iommu/tegra-gart.c                  |  2 +-
>  drivers/iommu/virtio-iommu.c                |  3 +--
>  9 files changed, 9 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index ba47c73f5b8c..01fd7df16cb9 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2430,23 +2430,14 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  			goto out_unlock;
>  		}
>  	} else if (smmu_domain->smmu != smmu) {
> -		dev_err(dev,
> -			"cannot attach to SMMU %s (upstream of %s)\n",
> -			dev_name(smmu_domain->smmu->dev),
> -			dev_name(smmu->dev));
> -		ret = -ENXIO;
> +		ret = -EINVAL;
>  		goto out_unlock;
>  	} else if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1 &&
>  		   master->ssid_bits != smmu_domain->s1_cfg.s1cdmax) {
> -		dev_err(dev,
> -			"cannot attach to incompatible domain (%u SSID bits != %u)\n",
> -			smmu_domain->s1_cfg.s1cdmax, master->ssid_bits);
>  		ret = -EINVAL;
>  		goto out_unlock;
>  	} else if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1 &&
>  		   smmu_domain->stall_enabled != master->stall_enabled) {
> -		dev_err(dev, "cannot attach to stall-%s domain\n",
> -			smmu_domain->stall_enabled ? "enabled" : "disabled");
>  		ret = -EINVAL;
>  		goto out_unlock;
>  	}

I think it would be helpful to preserve these messages using
dev_err_ratelimited() so that attach failure can be diagnosed without
having to hack the messages back into the driver.

With that:

Acked-by: Will Deacon <will@kernel.org>

Will

