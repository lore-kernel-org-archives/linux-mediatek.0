Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619C5C3064D
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 05:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJ7Ynq9MkRv2q/uROrv7ZcY3RV88kQmpl3Phsrkilf4=; b=0gXryYqjXcbcG70tbogHzwN8fB
	JmzKbU6Roj6iYIrqZmEhQN7pzNPKL8skba2dk2Q8zezc+CPd789+xpssHzEgWNUxU6FMl5Xh75Mav
	DSkeBN582G5lGLrt+WZpP46F2GC0E5bCdn/OXW1Wnx0mPTfcMQFndZ60RxAzVBKRg37JB8dTDSUMA
	g6uCMrly7l89jvceiYJHdl8uB/i2mHs6jhCWJuQzGV10bo+5GbMwX6FES2TMXKQF6GssB+wEJDAog
	NMMyrZGxKk4ppwhinVfma9vYMVaSzGIUMT8WOnmEhNOdA4knwmHVFig601TA2fMUxQkC02Qq5wMh9
	p4BYlQ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOWIM-00000005c8s-10L4;
	Tue, 02 Jul 2024 05:43:14 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOWI9-00000005c5P-3n3C;
	Tue, 02 Jul 2024 05:43:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719898977;
	bh=esiAP32KVMqSCDoDEUg5OeBa3oPnhXiS2SjgngyYTCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FvBqmHI5QSG6PLNjYhl4coC4sujtELF3mLHrLfRgGGeJEtpTsPAa/jd8k5KQwWIRw
	 o29viYrHJIh5+LgStVF7iO4tumF1lo7g0txDjyW89J/Xy/c87h8PiuL8bdXTuROCob
	 hSDUTJCck7mJPCleSkLAXM9sh3C8EraTdeGl+ene1nozidnY6lZYIUnpFwkP/92+eL
	 yiEqozHOHjDVzBoQRS796JHzGbronmKkcGV0Lxp5Z4GvSuU4zfp2GoIGZWpJ/sPULJ
	 dOefj+o1pLp/chHC8gqiFuL3CZETX0Mb0JTPfLt3vPT9L6UmT7Sv3RQetgRcMNf1Yg
	 MjjTBUpTujpMw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 866DC37811EB;
	Tue,  2 Jul 2024 05:42:56 +0000 (UTC)
Message-ID: <f648b751-482e-46ba-8ef2-8d04c0633c2c@collabora.com>
Date: Tue, 2 Jul 2024 07:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: Remove iommu_sva_unbind_gpasid
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: yj.chiang@mediatek.com, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240628113011.3535-1-mark-pk.tsai@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240628113011.3535-1-mark-pk.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_224302_119456_99744812 
X-CRM114-Status: GOOD (  11.78  )
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

Il 28/06/24 13:30, Mark-PK Tsai ha scritto:
> This is a left over of commit 0c9f17877891
> ("iommu: Remove guest pasid related interfaces and definitions")
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

Please also fix the documentation, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

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
>   extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
>   extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
>   extern int iommu_map(struct iommu_domain *domain, unsigned long iova,



