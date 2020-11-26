Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C685C63697
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 15:49:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB46121D40
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 15:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hZOfYWhP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB46121D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Jlg1uPTC+mFtN3W/OJ8rbnttsmut+1hgws0koa9K2A=; b=hZOfYWhPg6rOiBlE95LySvKUs
	qYGxWQN1AMUga7r0MMirvD/iDo/8EetPps+gqzLyLBH3Z+iar2UHssv80oqRDv1pOnlJB83EjaphN
	Ulzn3h8tW0KxWoWn9JZ0cvsd3z5xkyfMYmp+p/h5R1aJ6pgrPnVEMHQYbdNdKk0ak41tTNS3z4oTH
	5jd46yy4YCMZq+Ork+rPBXvCYvbncheP41MRsCxscDa6TUQl5hGAyd/fzfTd152Yrzz2bVBoJN0d/
	si6GeKDynu1OT/5BI8N4BU96du8m7LpFAK+S74TAuYev0mpZvwO3Gnnm/p0PsFYuQF9lLDqk2ZqYq
	vDLOmFe4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiJWU-0006qe-8r; Thu, 26 Nov 2020 15:49:30 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiJWQ-0006pS-8W; Thu, 26 Nov 2020 15:49:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A539531B;
 Thu, 26 Nov 2020 07:49:23 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BC053F23F;
 Thu, 26 Nov 2020 07:49:20 -0800 (PST)
Subject: Re: [PATCH v4 08/24] iommu/io-pgtable-arm-v7s: Extend PA34 for
 MediaTek
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Will Deacon <will@kernel.org>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-9-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a85692d8-d514-8c52-e2c7-53c7fc357c66@arm.com>
Date: Thu, 26 Nov 2020 15:49:19 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201111123838.15682-9-yong.wu@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_104926_477428_20950772 
X-CRM114-Status: GOOD (  21.86  )
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
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-11 12:38, Yong Wu wrote:
> MediaTek extend the bit5 in lvl1 and lvl2 descriptor as PA34.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Acked-by: Will Deacon <will@kernel.org>
> ---
>   drivers/iommu/io-pgtable-arm-v7s.c | 9 +++++++--
>   drivers/iommu/mtk_iommu.c          | 2 +-
>   include/linux/io-pgtable.h         | 4 ++--
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index e880745ab1e8..4d0aa079470f 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -112,9 +112,10 @@
>   #define ARM_V7S_TEX_MASK		0x7
>   #define ARM_V7S_ATTR_TEX(val)		(((val) & ARM_V7S_TEX_MASK) << ARM_V7S_TEX_SHIFT)
>   
> -/* MediaTek extend the two bits for PA 32bit/33bit */
> +/* MediaTek extend the bits below for PA 32bit/33bit/34bit */
>   #define ARM_V7S_ATTR_MTK_PA_BIT32	BIT(9)
>   #define ARM_V7S_ATTR_MTK_PA_BIT33	BIT(4)
> +#define ARM_V7S_ATTR_MTK_PA_BIT34	BIT(5)
>   
>   /* *well, except for TEX on level 2 large pages, of course :( */
>   #define ARM_V7S_CONT_PAGE_TEX_SHIFT	6
> @@ -194,6 +195,8 @@ static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
>   		pte |= ARM_V7S_ATTR_MTK_PA_BIT32;
>   	if (paddr & BIT_ULL(33))
>   		pte |= ARM_V7S_ATTR_MTK_PA_BIT33;
> +	if (paddr & BIT_ULL(34))
> +		pte |= ARM_V7S_ATTR_MTK_PA_BIT34;
>   	return pte;
>   }
>   
> @@ -218,6 +221,8 @@ static phys_addr_t iopte_to_paddr(arm_v7s_iopte pte, int lvl,
>   		paddr |= BIT_ULL(32);
>   	if (pte & ARM_V7S_ATTR_MTK_PA_BIT33)
>   		paddr |= BIT_ULL(33);
> +	if (pte & ARM_V7S_ATTR_MTK_PA_BIT34)
> +		paddr |= BIT_ULL(34);
>   	return paddr;
>   }
>   
> @@ -754,7 +759,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
>   	if (cfg->ias > ARM_V7S_ADDR_BITS)
>   		return NULL;
>   
> -	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
> +	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 35 : ARM_V7S_ADDR_BITS))
>   		return NULL;
>   
>   	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 6451d83753e1..ec3c87d4b172 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -320,7 +320,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
>   			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
>   		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
>   		.ias = 32,
> -		.oas = 34,
> +		.oas = 35,
>   		.tlb = &mtk_iommu_flush_ops,
>   		.iommu_dev = data->dev,
>   	};
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 4cde111e425b..1ae0757f4f94 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -77,8 +77,8 @@ struct io_pgtable_cfg {
>   	 *	TLB maintenance when mapping as well as when unmapping.
>   	 *
>   	 * IO_PGTABLE_QUIRK_ARM_MTK_EXT: (ARM v7s format) MediaTek IOMMUs extend
> -	 *	to support up to 34 bits PA where the bit32 and bit33 are
> -	 *	encoded in the bit9 and bit4 of the PTE respectively.
> +	 *	to support up to 35 bits PA where the bit32, bit33 and bit34 are
> +	 *	encoded in the bit9, bit4 and bit5 of the PTE respectively.
>   	 *
>   	 * IO_PGTABLE_QUIRK_NON_STRICT: Skip issuing synchronous leaf TLBIs
>   	 *	on unmap, for DMA domains using the flush queue mechanism for
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
