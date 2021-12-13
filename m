Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97382C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 07:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6A5i8dj60NwTH4WsZihZjBTdw2PkxiOriyywCSkXVo=; b=QSApG9ipm2q1dd
	ah/WdMsmLtoGXxMRGjXVowa53h/PovSAiZQIDHyyJdqkIin8i+64NjCzvf9HUOYQIijzTkNo+tlem
	vWtB8X+/ChsnhotzN7ixWjAzeylz3R2kvCngXuhCc5yyKwSQ4k7pDlR6MvN5OcqkX4t/nWinYcDTY
	GMzd6HdEkJNZmVdxiPkLeqt1gGQaYI89DpMVvH2OmeAW1Y+zzzf+lGETtlYX8um+SXV0duq6+whHu
	i0IUHVQ1NGIbb6vpzhmiSq86OwcDkp1XwjHjAlD0gxye7IDkzLgRqXlAbB6gIiINCIO+jCWboB/+N
	ZGxJypccMDQbIAxt30xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwg9a-008B4Y-PO; Mon, 13 Dec 2021 07:53:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwg9I-008Azh-Lx; Mon, 13 Dec 2021 07:53:30 +0000
X-UUID: b38d7c9f9b90402d83b463444f129431-20211213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Qje268K+koi4R/car/RXG6pCHuYVAIpCtFKrTVwyePw=; 
 b=hEUQeaDAIt80yzZnHJXhppfyMwu8hQHG3Son84yVkg1qjkaXt4/UZ66oTZJJ47UtSsCdK0uizxcRxqxTtKZzjTJxbpnVl2vCOZBMiPLT9mhnGV8snhbemCrfJ3PITWoW9nsNHD1gkXPuyeCZB4yQhGmEgqt3cCbuNqmJicS39AY=;
X-UUID: b38d7c9f9b90402d83b463444f129431-20211213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 129793420; Mon, 13 Dec 2021 00:53:26 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Dec 2021 23:53:24 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Dec 2021 15:53:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Dec 2021 15:53:22 +0800
Message-ID: <00161c73917e4c811a34228ff9729ef22141190d.camel@mediatek.com>
Subject: Re: [PATCH v2 2/5] iommu/mediatek: Always check runtime PM status
 in tlb flush range callback
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC: <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, <kernel@collabora.com>,
 <linux-media@vger.kernel.org>, <sebastian.reichel@collabora.com>
Date: Mon, 13 Dec 2021 15:53:25 +0800
In-Reply-To: <20211208120744.2415-3-dafna.hirschfeld@collabora.com>
References: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
 <20211208120744.2415-3-dafna.hirschfeld@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_235328_756236_3ED6346E 
X-CRM114-Status: GOOD (  20.08  )
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

On Wed, 2021-12-08 at 14:07 +0200, Dafna Hirschfeld wrote:
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
> index 342aa562ab6a..dd2c08c54df4 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -225,16 +225,13 @@ static void
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
> @@ -259,8 +256,7 @@ static void
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
