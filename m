Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EF5C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Nov 2021 02:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVaJFa2ZEyQPdT11WGS+rv+Xs5eLDg8OMyHLFg1LDpE=; b=BmteKYbgatelWL
	xhFc8pi7M+qbmkIcXta0OfGVnuaPihhUmVrkqYnBIfoDTPaXhBx9QRDm5xwYGj0NfCHN3nnnE0vPM
	dt5BWe0Yk5HfamdKXCCs9TxYEgfljiy8T3L1diQZXNV8ec4RTY2YKyTD5UAR9ijDQf8LNi4SGZvlj
	Zw9aMVhP84+rANiBSt9D4ZFd3t7ZoCKnXvwsmXTrClCnCwRJKG0OKNdPCxL74V94yPyIawupf9P/7
	x9LDk2eNIZMGUiknBVzhRoapH7AbtUM9aw4DyN2lwT7Zde/YFGsWlND+vQ+ImNEc5xud7twcLxbLB
	ZyBoJgD8p/MatFGWnbEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqnkB-00Cl6F-Gw; Sat, 27 Nov 2021 02:47:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqnk9-00Cl5h-J2; Sat, 27 Nov 2021 02:47:14 +0000
X-UUID: 3bd24908f79b4529a9d4f27f4e5857fa-20211126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ujgxNDgOxn13iafpFO6sRZICJ73MLq1oFrLOiv1fYeY=; 
 b=bPmANuoT3cfKXUNqiiCIKIBt36G5QsT5X1foyd6PeX8RDglm4eoXsdsdzOiQLfyxvLnjJUNQQ7x+RBMns+IqBm5AIbKu7ltcdy/u9XRkTjZNLyVeNg2nXZyZCj/z9wMAZRwagN5KI/8k1+yQZ73y7AJ7TWxNAecP+bhl8z43yow=;
X-UUID: 3bd24908f79b4529a9d4f27f4e5857fa-20211126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 268191276; Fri, 26 Nov 2021 19:47:09 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Nov 2021 18:47:08 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 27 Nov 2021 10:46:55 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 27 Nov 2021 10:46:54 +0800
Message-ID: <afb46ad6ca9477a2bf71233858406caa6ccb1588.camel@mediatek.com>
Subject: Re: [PATCH 2/2] iommu/mediatek: always check runtime PM status in
 tlb flush range callback
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 <iommu@lists.linux-foundation.org>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>,
 <kernel@collabora.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated
 list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "open
 list" <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Date: Sat, 27 Nov 2021 10:46:54 +0800
In-Reply-To: <20211122104400.4160-3-dafna.hirschfeld@collabora.com>
References: <20211122104400.4160-1-dafna.hirschfeld@collabora.com>
 <20211122104400.4160-3-dafna.hirschfeld@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_184713_655584_68FF4730 
X-CRM114-Status: GOOD (  20.10  )
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

On Mon, 2021-11-22 at 12:44 +0200, Dafna Hirschfeld wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> In case of v4l2_reqbufs() it is possible, that a TLB flush is done
> without runtime PM being enabled. In that case the "Partial TLB flush
> timed out, falling back to full flush" warning is printed.
> 
> Commit c0b57581b73b ("iommu/mediatek: Add power-domain operation")
> introduced has_pm as optimization to avoid checking runtime PM
> when there is no power domain attached. But without the PM domain
> there is still the device driver's runtime PM suspend handler, which
> disables the clock. Thus flushing should also be avoided when there
> is no PM domain involved.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

> ---
>  drivers/iommu/mtk_iommu.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 28dc4b95b6d9..b0535fcfd1d7 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -227,16 +227,13 @@ static void
> mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>  					   size_t granule,
>  					   struct mtk_iommu_data *data)
>  {
> -	bool has_pm = !!data->dev->pm_domain;
>  	unsigned long flags;
>  	int ret;
>  	u32 tmp;
>  
>  	for_each_m4u(data) {
> -		if (has_pm) {
> -			if (pm_runtime_get_if_in_use(data->dev) <= 0)
> -				continue;
> -		}
> +		if (pm_runtime_get_if_in_use(data->dev) <= 0)
> +			continue;
>  
>  		spin_lock_irqsave(&data->tlb_lock, flags);
>  		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> @@ -261,8 +258,7 @@ static void
> mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>  		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
>  		spin_unlock_irqrestore(&data->tlb_lock, flags);
>  
> -		if (has_pm)
> -			pm_runtime_put(data->dev);
> +		pm_runtime_put(data->dev);
>  	}
>  }
>  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
