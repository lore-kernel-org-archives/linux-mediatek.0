Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9B9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 01:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3ZBkE60napi0gEbMif/FYxZwKekiIUDFqWsM99Gmqc=; b=NkPup2L5Ij1bviHXrstb+Tphog
	8VRn/jcIcJbN9Lpme+HpbWKt1PORPlKcwnsDni0c7yrj7gPfS9UEOXXjOwdsth5R6oQ/5R7ouJK4A
	5zgt0bmiHIrUuWyieIXlQd5cooauHVFarN6+FssqfSP4niQq1UOrxxnXLhLwRumFM63QHE0cKbGOn
	4BaxZbmqGi+WJaEkLv64sCS+wR1QSnfgXIkbBh6KhwD0a+JOxkxyKAf/P5asLiOTyqqUq4afEKPaZ
	DqrjEe+W6LDGqUs6LzSTkWIaSQk7DWS10k5zSjj8RwuK6FYBMRntN0SsYaZ3AL+p9Mo98ZKlgq31s
	+cv++0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4YF4-00HKuv-W7; Fri, 24 Jun 2022 01:36:15 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4YEt-00HKrY-K0; Fri, 24 Jun 2022 01:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656034563; x=1687570563;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gyA97i97HwL5wq54DYwFbjfmzziuSTurfIWHXSjG3gU=;
  b=kuR4fVJM8EdOGv5uUf7M12/7+VxM8I4UBs59E9otJMapVgHWSgRue5GW
   mh5PELTGbCQ+FXisY9CgX+PM9F1bv/9XZd90NOY7GnyAM0PhDTXTA3Dqc
   RuL9dmAKwSdVPNSY5gkFSqRVdm87f/R6r5WaK5SGsWug4VRd6RE6rn/Iz
   KmZhIGAW4usfciw7R9/nCFySsQECjFqtgRJR2af92Rg5HGUQwN2lrFdBf
   fNjDw9Kw40z//yegVgAskjqAMa5bB8x0P0xtxw34VOjnpYIJyU/JF5e5X
   Hsda6MMX4Jy/bzjA3Gh2MhQr9c79N1w+ZdqMIwpbTjPXpfxSWVfNVu1Mf
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="342579203"
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; 
   d="scan'208";a="342579203"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 18:35:59 -0700
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; 
   d="scan'208";a="645038369"
Received: from wenli3x-mobl.ccr.corp.intel.com (HELO [10.249.168.117]) ([10.249.168.117])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 18:35:51 -0700
Message-ID: <270eec00-8aee-2288-4069-d604e6da2925@linux.intel.com>
Date: Fri, 24 Jun 2022 09:35:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
 alyssa@rosenzweig.io, dwmw2@infradead.org, yong.wu@mediatek.com,
 mjrosato@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 cohuck@redhat.com, thunder.leizhen@huawei.com, tglx@linutronix.de,
 chenxiang66@hisilicon.com, christophe.jaillet@wanadoo.fr,
 john.garry@huawei.com, yangyingliang@huawei.com, jordan@cosmicpenguin.net,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux-foundation.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH v3 1/5] iommu: Return -EMEDIUMTYPE for incompatible domain
 and device/group
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org, will@kernel.org,
 marcan@marcan.st, sven@svenpeter.dev, robin.murphy@arm.com,
 robdclark@gmail.com, matthias.bgg@gmail.com, orsonzhai@gmail.com,
 baolin.wang7@gmail.com, zhang.lyra@gmail.com, jean-philippe@linaro.org,
 alex.williamson@redhat.com, jgg@nvidia.com, kevin.tian@intel.com
References: <20220623200029.26007-1-nicolinc@nvidia.com>
 <20220623200029.26007-2-nicolinc@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220623200029.26007-2-nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_183603_762182_E4C36698 
X-CRM114-Status: GOOD (  11.11  )
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

On 2022/6/24 04:00, Nicolin Chen wrote:
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index e1cb51b9866c..5386d889429d 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -304,7 +304,7 @@ static int mtk_iommu_v1_attach_device(struct iommu_domain *domain, struct device
>   	/* Only allow the domain created internally. */
>   	mtk_mapping = data->mapping;
>   	if (mtk_mapping->domain != domain)
> -		return 0;
> +		return -EMEDIUMTYPE;
>   
>   	if (!data->m4u_dom) {
>   		data->m4u_dom = dom;

This change looks odd. It turns the return value from success to
failure. Is it a bug? If so, it should go through a separated fix patch.

Best regards,
baolu

