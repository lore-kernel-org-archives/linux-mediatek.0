Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58625C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NAd5Gm2i7z9F24I5grKJDv4Ygxj3zz3ITLKIsKxczg=; b=cf98hUG5dk7oM0
	IQfWgaeIFJk0bUtTaQX4/PbEAaPg3QEcvweW5OiJT5SwgJ78gZTeElWPduEm+JkA2pFuqW3NzzIzy
	P3OsI5MScy7Mxzeb8LIJVmFAZujhB/uh195Oa3TfMA+tqbbyQva8wEkNBaWKmPcRwVvtAH1b+7cCN
	0yDAaAQmY6QKOyqxRNTQ65XRpEFgz5dBly07jJzzmrBrySLan3cc5XahKEXJgEuFIHJE9hXzGZQI4
	7CkdB1sRYKydUENQMvsviYRNG5cQBBcGnGSe2NGFCB9imsQXGYv0jXKmGlNIBZpVHn0yKV+bUh/RU
	9HXSaoew07YV05bZFubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlwB7-006zBK-OP; Tue, 03 May 2022 17:19:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlwAv-006z2t-A4; Tue, 03 May 2022 17:19:04 +0000
X-UUID: f3fea122351f4665b334d298a8ca71ea-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:fd6efacf-64f0-4e58-8808-c09b9643b18d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:211d912f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f3fea122351f4665b334d298a8ca71ea-20220503
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 661274859; Tue, 03 May 2022 10:18:51 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 10:18:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 01:18:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 4 May 2022 01:18:48 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <yf.wang@mediatek.com>
CC: <Libo.Kang@mediatek.com>, <Yong.Wu@mediatek.com>,
 <iommu@lists.linux-foundation.org>, <isaacm@codeaurora.org>,
 <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <ning.li@mediatek.com>,
 <quic_c_gdjako@quicinc.com>, <robin.murphy@arm.com>,
 <stable@vger.kernel.org>, <sven@svenpeter.dev>, <will@kernel.org>,
 <wsd_upstream@mediatek.com>
Subject: Re: [PATCH 1/2] iommu/io-pgtable-arm-v7s: Add a quirk to support TTBR
 up to 35bit for MediaTek
Date: Wed, 4 May 2022 01:18:48 +0800
Message-ID: <20220503171848.24992-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220429143411.7640-2-yf.wang@mediatek.com>
References: <20220429143411.7640-2-yf.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_101901_398637_07E255C1 
X-CRM114-Status: GOOD (  23.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi YF,

> The calling to kmem_cache_alloc for level 2 page table allocation may
> run in atomic context, and it fails sometimes when DMA32 zone runs out
> of memory.
> 
> Since Mediatek IOMMU hardware support at most 35bit PA in page table,

s/Mediatek/MediaTek/
s/support/supports/

> so add a quirk to allow the PA of level 2 pgtable support bit35.

35bits PA, right?

>
> 

...snip...

>  
>  	phys = virt_to_phys(table);
> -	if (phys != (arm_v7s_iopte)phys) {
> +	if (phys != (arm_v7s_iopte)phys &&
> +	    !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)) {

I have one question while reading this.

If IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT is set, it means that the phys can be up to 35 bits.
In aarch64, kmalloc() could return up to 52 bits PA (e.g., ARM64_PA_BITS_52=y)

How do we guarantee that phys is safe (<= 35 bits) in this case?
For example:
When IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT is set, the platform guarantees its PAs are at most
35 bits?


Thanks,
Miles
>  		/* Doesn't fit in PTE */
>  		dev_err(dev, "Page table does not fit in PTE: %pa", &phys);
>  		goto out_free;
> @@ -457,9 +464,14 @@ static arm_v7s_iopte arm_v7s_install_table(arm_v7s_iopte *table,
>  					   arm_v7s_iopte curr,
>  					   struct io_pgtable_cfg *cfg)
>  {
> +	phys_addr_t phys = virt_to_phys(table);
>  	arm_v7s_iopte old, new;
>  
> -	new = virt_to_phys(table) | ARM_V7S_PTE_TYPE_TABLE;
> +	new = phys | ARM_V7S_PTE_TYPE_TABLE;
> +
> +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)
> +		new = to_iopte_mtk(phys, new, cfg);
> +
>  	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS)
>  		new |= ARM_V7S_ATTR_NS_TABLE;
>  
> @@ -778,6 +790,7 @@ static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
>  static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
>  						void *cookie)
>  {
> +	slab_flags_t slab_flag = ARM_V7S_TABLE_SLAB_FLAGS;
>  	struct arm_v7s_io_pgtable *data;
>  
>  	if (cfg->ias > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
> @@ -788,7 +801,8 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
>  
>  	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
>  			    IO_PGTABLE_QUIRK_NO_PERMS |
> -			    IO_PGTABLE_QUIRK_ARM_MTK_EXT))
> +			    IO_PGTABLE_QUIRK_ARM_MTK_EXT |
> +			    IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT))
>  		return NULL;
>  
>  	/* If ARM_MTK_4GB is enabled, the NO_PERMS is also expected. */
> @@ -801,10 +815,12 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
>  		return NULL;
>  
>  	spin_lock_init(&data->split_lock);
> +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)
> +		slab_flag = 0;
>  	data->l2_tables = kmem_cache_create("io-pgtable_armv7s_l2",
>  					    ARM_V7S_TABLE_SIZE(2, cfg),
>  					    ARM_V7S_TABLE_SIZE(2, cfg),
> -					    ARM_V7S_TABLE_SLAB_FLAGS, NULL);
> +					    slab_flag, NULL);
>  	if (!data->l2_tables)
>  		goto out_free_data;
>  
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 86af6f0a00a2..7ed15ad4710c 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -74,17 +74,22 @@ struct io_pgtable_cfg {
>  	 *	to support up to 35 bits PA where the bit32, bit33 and bit34 are
>  	 *	encoded in the bit9, bit4 and bit5 of the PTE respectively.
>  	 *
> +	 * IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT: (ARM v7s format) MediaTek IOMMUs
> +	 *	extend the translation table support up to 35 bits PA, the
> +	 *	encoding format is same with IO_PGTABLE_QUIRK_ARM_MTK_EXT.
> +	 *
>  	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
>  	 *	for use in the upper half of a split address space.
>  	 *
>  	 * IO_PGTABLE_QUIRK_ARM_OUTER_WBWA: Override the outer-cacheability
>  	 *	attributes set in the TCR for a non-coherent page-table walker.
>  	 */
> -	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
> -	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
> -	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT	BIT(3)
> -	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
> -	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA	BIT(6)
> +	#define IO_PGTABLE_QUIRK_ARM_NS			BIT(0)
> +	#define IO_PGTABLE_QUIRK_NO_PERMS		BIT(1)
> +	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT		BIT(3)
> +	#define IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT	BIT(4)
> +	#define IO_PGTABLE_QUIRK_ARM_TTBR1		BIT(5)
> +	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA		BIT(6)
>  	unsigned long			quirks;
>  	unsigned long			pgsize_bitmap;
>  	unsigned int			ias;
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
