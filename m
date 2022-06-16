Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 02:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7Q7kRJxYcruNpXY9p/Y35ywfubnVVBmL/oXVE3IR88=; b=MPLB24VhWrwYI8sMn+6tVnhEV5
	n2ur9ufwIrRE9jiWMvsHW8Ijm9zveRrC3841iXpIqdr2yVZ+zvFdUjH0044bS6TfB1zKDEsVuZtdA
	+UZjJriLq5x3ikKQ6POmtnRzbedYiHBIn/chSfrMJPVblaGyW8y9AgS69quqSDBAXYPYyQFau8jzz
	OY8odmKaNAw5q7GEU2tN+nc/Nkx+fksbMMWQYnCZ1LFndsBabOs6yUP1k9dDR7z96KKyDZaAY8qkn
	9ZmYLut0Vl0bUsKMrRk8l8fX6NVvqAss87K4Nsj97rLD64ZmqjDeof9kc8KJkZ20T1Q/RDGyNJB/K
	IVtdaOPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1exS-00Hayf-Fo; Thu, 16 Jun 2022 02:10:06 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1exP-00HaxN-Pd; Thu, 16 Jun 2022 02:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655345403; x=1686881403;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u/polTrCcfTR/bnfvj7XjWWQORpzgrJJNnRIhd6+LYo=;
  b=CWL4Tv3lJxN6IJhTfEFP/sNgYNAoUUTkhmQ/h13Jbo3eXE+WOH5CdPsa
   eCanR1HL4jeAKNMF6TYWcDJwgYbQU6S11JPfEnp5n6zMgdMV/gtrt/G4S
   +z0cVl2eXZuQ3tbpmo1cQ9HPLj5vvZOWrZodF+lwh2EcCy2BXpfJ/i2W7
   wqa4nq/fFLiL+W6psHq6V9gYBvimbEQvaXID8B4USqPiLUJ7QkeohVgn3
   0Sbi3cEZJB0eVnDiWh100Nxr8q4aIYpqG0eWQJNRh94nzfT3cJ6Vhcb9S
   oeBDTtzzairwkSEWEnyEOyQ6z7Gf2BO+064yQKREOVQPreogQ1cNWoZ/j
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="340800672"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="340800672"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 19:09:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="831355596"
Received: from yuefengs-mobl.ccr.corp.intel.com (HELO [10.255.30.105]) ([10.255.30.105])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 19:09:51 -0700
Message-ID: <0c0e6ec8-725d-93e8-44f1-db6c8a673a97@linux.intel.com>
Date: Thu, 16 Jun 2022 10:09:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
 alyssa@rosenzweig.io, dwmw2@infradead.org, yong.wu@mediatek.com,
 mjrosato@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 cohuck@redhat.com, thunder.leizhen@huawei.com, tglx@linutronix.de,
 christophe.jaillet@wanadoo.fr, john.garry@huawei.com,
 chenxiang66@hisilicon.com, saiprakash.ranjan@codeaurora.org,
 isaacm@codeaurora.org, yangyingliang@huawei.com, jordan@cosmicpenguin.net,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux-foundation.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH v2 1/5] iommu: Return -EMEDIUMTYPE for incompatible domain
 and device/group
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org, will@kernel.org,
 marcan@marcan.st, sven@svenpeter.dev, robin.murphy@arm.com,
 robdclark@gmail.com, matthias.bgg@gmail.com, orsonzhai@gmail.com,
 baolin.wang7@gmail.com, zhang.lyra@gmail.com, jean-philippe@linaro.org,
 alex.williamson@redhat.com, jgg@nvidia.com, kevin.tian@intel.com
References: <20220616000304.23890-1-nicolinc@nvidia.com>
 <20220616000304.23890-2-nicolinc@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220616000304.23890-2-nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_191003_964844_8BD6662E 
X-CRM114-Status: GOOD (  10.94  )
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

On 2022/6/16 08:03, Nicolin Chen wrote:
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 44016594831d..0dd13330fe12 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -4323,7 +4323,7 @@ static int prepare_domain_attach_device(struct iommu_domain *domain,
>   		return -ENODEV;
>   
>   	if (dmar_domain->force_snooping && !ecap_sc_support(iommu->ecap))
> -		return -EOPNOTSUPP;
> +		return -EMEDIUMTYPE;
>   
>   	/* check if this iommu agaw is sufficient for max mapped address */
>   	addr_width = agaw_to_width(iommu->agaw);
> @@ -4331,10 +4331,10 @@ static int prepare_domain_attach_device(struct iommu_domain *domain,
>   		addr_width = cap_mgaw(iommu->cap);
>   
>   	if (dmar_domain->max_addr > (1LL << addr_width)) {
> -		dev_err(dev, "%s: iommu width (%d) is not "
> +		dev_dbg(dev, "%s: iommu width (%d) is not "
>   		        "sufficient for the mapped address (%llx)\n",
>   		        __func__, addr_width, dmar_domain->max_addr);
> -		return -EFAULT;
> +		return -EMEDIUMTYPE;
>   	}
>   	dmar_domain->gaw = addr_width;

Can we simply remove the dev_err()? As the return value has explicitly
explained the failure reason, putting a print statement won't help much.

Best regards,
baolu

