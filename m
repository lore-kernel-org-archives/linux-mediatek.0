Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0589BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 10:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lg4u45ytAcCCBS9aWEky3Yj57HeXc8rQqWuOugfRQL8=; b=Yd+6eITZUTVI1o
	gUBpVs/Rsa+PQ82IAeJ/o7udo8F8p9tBNGqJ2skqyMk6j50QCC83JOwmY3F50RznSDNcicOiR7jfv
	JwpEXgdlg+UcCRS1sGVzQh5UueLsBmj4QbHfbh0epvxXXfQfB5iigiI76fO64QbRxYahXitqrRGsJ
	f0QCe+9s1d53xtQIyJl1Q2uQrY50rRhSCqNkY6ELRxdW7IR2EmnRe/KtLo6dkzVBxeCyhzfCsg/5f
	ssr8PAC77HZ5WeDcQRXdLt70E0Yi3CAivjh3DOVZsnA4onVo6uVzzzKdSeMLiQPjAK+twnUEdWfNn
	2B5E67cI/MbMOPRS23JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muXqR-0084I6-NX; Tue, 07 Dec 2021 10:37:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muX5I-007sWR-AS; Tue, 07 Dec 2021 09:48:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 63B4BB8169C;
 Tue,  7 Dec 2021 09:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9FEC341C3;
 Tue,  7 Dec 2021 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638870505;
 bh=vU8wO38cP4NaOW9H1aLEKq1y2IOx0CaMh4iBi218CjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JKxmAVaxRiMthinPzyb/GcsePkjpJw8O/mteJcgWW9g3zif2K+CfLAKjdwJxdrV6h
 4r+MXtfN5+JID54y4/Z+GKX2EX/usLdo1iXgniGYgujBHcGZc07NhBk21P9XvCGVlq
 zkrpag/zlD0PM6BVrhCHBl6pwYe2FhBlTvxhDzgDgM/cl1+FIm4eD/claqL9k6ZFXW
 uJtDSGZ9uWSd7+DrynFCx74rwtQdFsEbCkAwGIzqhM+/s1NzaIys5E/1aNOlJprNGx
 Hkv8fd7EG7o4HrkIHd3IKyHz0/FpXfUhnFrQmD1SVMoYx/Dy5w6RjfHfcqFeP87Hol
 50IdLUEtOQDqg==
Date: Tue, 7 Dec 2021 09:48:18 +0000
From: Will Deacon <will@kernel.org>
To: yf.wang@mediatek.com
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upstream@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
 Yong Wu <Yong.Wu@mediatek.com>, Guangming Cao <Guangming.Cao@mediatek.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm-v7s: Add error handle for page
 table allocation failure
Message-ID: <20211207094817.GA31382@willie-the-truck>
References: <20211207024723.25751-1-yf.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211207024723.25751-1-yf.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_014828_568811_67CEDF68 
X-CRM114-Status: GOOD (  18.79  )
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

On Tue, Dec 07, 2021 at 10:47:22AM +0800, yf.wang@mediatek.com wrote:
> From: Yunfei Wang <yf.wang@mediatek.com>
> 
> In __arm_v7s_alloc_table function:
> iommu call kmem_cache_alloc to allocate page table, this function
> allocate memory may fail, when kmem_cache_alloc fails to allocate
> table, call virt_to_phys will be abnomal and return unexpected phys
> and goto out_free, then call kmem_cache_free to release table will
> trigger KE, __get_free_pages and free_pages have similar problem,
> so add error handle for page table allocation failure.
> 
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> ---
>  drivers/iommu/io-pgtable-arm-v7s.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index bfb6acb651e5..d84240308f4b 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -246,6 +246,12 @@ static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
>  			__GFP_ZERO | ARM_V7S_TABLE_GFP_DMA, get_order(size));
>  	else if (lvl == 2)
>  		table = kmem_cache_zalloc(data->l2_tables, gfp);
> +
> +	if (!table) {
> +		dev_err(dev, "Page table allocation failure lvl:%d\n", lvl);

I'd expect the allocator to shout loudly on failure anyway, so I don't think
we need to print another message here.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
