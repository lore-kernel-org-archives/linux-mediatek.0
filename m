Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8AAC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJLugdPEe27YeXNWvBumJUG7FKitcSBNu6f/D6mjtxc=; b=p0hJCQUwMK+9eUCojAETToikS3
	kqJBV7sQcRoCNtsx5Ybr+UXImblo/wScQBJblLpD0tbaG7LN0A8R9xTiE+Em4bV4u5SJvyECe0Fi2
	DoHcDIVqHrethYK/jmSoQZWS6Be+250mKZTnKK19mA6C1SP4QXi4F2YE4ltSGaq3iPi5vER8z9VRE
	IOyhLDmLlO7zYtXFvlRwAmel4XpwqR/msXcxFt0qmz3wD0O8/B9ABlHbEJiDy8prFSJT8gVnXbjp/
	A9gB/ByQDuMSXcbBjXk0J2+a7kxXi/dRIZMKAqk4d1NH466FJarjFshxP9Gsnp2oxk2TnWQl8iXXl
	oyBVyj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mLV-00CAkP-NQ; Tue, 04 Jan 2022 16:07:33 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m9i-00C4t4-Jy; Tue, 04 Jan 2022 15:55:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 807461F43593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311721;
 bh=V052X6CDRqGtUFJ9/x/emU0xn91Fbjw/PEV/sXPRzeQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DONGLC2hY7afAnjU2pD69F6yoQtckqgDyfVXGrV9S7yr4nBspBHhjw+C5Y7ZfSRD6
 pcy60TFAq9Gjd8ObWJUnIkyC3zKY8Ef47nQx9V7caoOiCp3L4HPd+VWVS7wttJrZI5
 xyhlyiQ8aOFEk4edgoHX+3zuRvz98P58oOa2Sq8up9fu5YN5qUyYbnJ2e1bk03QfBS
 yepEvPax+fe1PvQDBmdlvyGBxehQxCOn+OufgkQuwWjPMUSn1XC31TN1wAIsYqS2oD
 D/fSKoZsUKhuSPi86VkYTS7fq80pyNf1t3DYDePF8KHSV7Kk6FRneoroyM9WRpbcNu
 yL3AUJ3Z3bKpA==
Subject: Re: [PATCH v3 09/33] iommu/mediatek: Remove for_each_m4u in
 tlb_sync_all
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, chao.hao@mediatek.com,
 yen-chang.chen@mediatek.com
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-10-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <bfa33e94-c2e5-5dab-c9af-b674e1669daa@collabora.com>
Date: Tue, 4 Jan 2022 16:55:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-10-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075522_848686_C873FEC4 
X-CRM114-Status: GOOD (  22.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/09/21 13:58, Yong Wu ha scritto:
> The tlb_sync_all is called from these three functions:
> a) flush_iotlb_all: it will be called for each a iommu HW.
> b) tlb_flush_range_sync: it already has for_each_m4u.
> c) in irq: When IOMMU HW translation fault, Only need flush itself.
> 
> Thus, No need for_each_m4u in this tlb_sync_all. Remove it.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 6f4f6624e3ac..0b4c30baa864 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -206,19 +206,15 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
>   
>   static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
>   {
> -	struct list_head *head = data->hw_list;
> -
> -	for_each_m4u(data, head) {
> -		if (pm_runtime_get_if_in_use(data->dev) <= 0)
> -			continue;
> +	if (pm_runtime_get_if_in_use(data->dev) <= 0)
> +		return;
>   
> -		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> -			       data->base + data->plat_data->inv_sel_reg);
> -		writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
> -		wmb(); /* Make sure the tlb flush all done */
> +	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> +		       data->base + data->plat_data->inv_sel_reg);
> +	writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
> +	wmb(); /* Make sure the tlb flush all done */

There aren't a lot of writes here - not anymore, since you are no longer doing
this for_each_m4u()...
...so, please change writel_relaxed() to writel() calls, allowing you to also
remove the write barrier at the end (since in the non relaxed version, order
is already ensured).

>   
> -		pm_runtime_put(data->dev);
> -	}
> +	pm_runtime_put(data->dev);
>   }
>   
>   static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
