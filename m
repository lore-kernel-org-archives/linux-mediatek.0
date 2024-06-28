Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199C5C2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SnXZtfZRgQLQPWJA151fA7RHWZ900y2yQctddd8aAI=; b=pIj/Y5Lec3xr75/bx3FXY9DypF
	S9jL8QTGCVVQ0YqewKuHzQxGNI8NmAzGkinu72DTP6TdLaxmxh3Hka+L/XScRCoe2l3ArKwPE4Kz5
	PtxnlwpmGKeTN/L24sp9tar2NfXQ0S2vi9zr9lGDhBm3YzDiU1uVT3Hz9lleGVJ4Iv/0mGormpqdN
	ipSMfJviCfCNK6Aqmv5/OrRc4FG5mYqxhgE69EsD18vN3fqVhLQEbI532rg7rJrmx9+WCQ8J0+sa6
	Iovd6h9YG2h3Ye/aDxsAbrSaPw/6OBvinFnLock+uLObRMT12/IG8NtC+91NZRNigt4YAUBmQrZIk
	+NetN+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAmz-0000000Dha6-3EQ5;
	Fri, 28 Jun 2024 12:33:17 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAmo-0000000DhWS-0Yeg;
	Fri, 28 Jun 2024 12:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719577986; x=1751113986;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iP72sjx0dw/MwgE+xmP0d2ItZCoMMkXEZyU0W+SEO5o=;
  b=j5H7dNBwT5k8Ju9xJo+tNe0mGaMxEhVwVktQi/ioU9Far072qobBVysA
   lhZnE1PX8swjsCmE/hfsw3Le12ft338q7SQQ2I9rpx0igsSiPgfDm0SOA
   OM5Pjddeu/l4kkKuHE7Ez+2ql6Fmqh91hCI8bnJIqPud5l+m3Gof7r0Z7
   E1QoDwMmQZEh2+w82GhiuyETWo3lRLPXIxLQiG0XXScF3Gsli3QLaWKXX
   NdsLhiukgMrAlVlaV+HLmfirKpH10aIr0ycqJd28rDuWLANxPJ57o/hto
   Y/pkYXNbZCdMM8hJGmJqpb4nALIm7aOPwp7+Prei5QQtxT2VZZbEfPZnc
   Q==;
X-CSE-ConnectionGUID: k5dcU4OSRTON9LiZbCGzWQ==
X-CSE-MsgGUID: tQ64KyXDR/2Ie6/Re2KR0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="12299775"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="12299775"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 05:33:05 -0700
X-CSE-ConnectionGUID: 8ZksAHdgQ3upAMxwF8GTzw==
X-CSE-MsgGUID: rZ8Cq3WYRyyuvf5sMQtcqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44563171"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.125.248.220]) ([10.125.248.220])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 05:33:03 -0700
Message-ID: <fbede9a0-cfbc-4782-99c1-803f611c28b1@linux.intel.com>
Date: Fri, 28 Jun 2024 20:33:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, yj.chiang@mediatek.com, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] iommu: Remove iommu_sva_unbind_gpasid
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240628113011.3535-1-mark-pk.tsai@mediatek.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20240628113011.3535-1-mark-pk.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_053306_252632_22B077F8 
X-CRM114-Status: GOOD (  12.63  )
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

On 2024/6/28 19:30, Mark-PK Tsai wrote:
> This is a left over of commit 0c9f17877891
> ("iommu: Remove guest pasid related interfaces and definitions")
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>   include/linux/iommu.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 17b3f36ad843..225403cfe614 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -785,8 +785,6 @@ extern int iommu_attach_device(struct iommu_domain *domain,
>   			       struct device *dev);
>   extern void iommu_detach_device(struct iommu_domain *domain,
>   				struct device *dev);
> -extern int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
> -				   struct device *dev, ioasid_t pasid);

Not sure why this still remains there. But it seems not alone.

$ git grep iommu_sva_unbind_gpasid
Documentation/userspace-api/iommu.rst:  int 
iommu_sva_unbind_gpasid(struct iommu_domain *domain,
include/linux/iommu.h:extern int iommu_sva_unbind_gpasid(struct 
iommu_domain *domain,

I believe the document should also be removed.

>   extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
>   extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
>   extern int iommu_map(struct iommu_domain *domain, unsigned long iova,

Best regards,
baolu

