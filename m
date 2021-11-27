Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8589BC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Nov 2021 02:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YYc6GPvgsB0bCKz1UXCD19QeeeSz8a49zcUhb1GyfM=; b=AOZ9e7DkI+bJtJ
	0aNnws27bGDA08UJ+NSEC/EzotV78bTbY4WZ/DkJjQgXoJ7E/QHh8+wSA0Tok3ucK6HA1AhNwtnbF
	5Iudn7e4TpwgIsKiRPOnXg6EW67dtuA0kXBCTiC31BW2M5i84i9OgcD0DNKOfLfNzqRk6tKGxq7HS
	xUBQNSPVJE+QdQ83zdoJhb6LpzQytNMdihRmjjuCCR5Hj5IAzDhJXCkPTkKj3Bnk8xEa0TtpQrNtC
	YJIOyX/ou8nC1wXxV8mNVkVJ3wVcBSGyCMjBsACTzYiAaXHei208dpTrrytVfA/TEW6maUFtD0cRV
	f8WIZPuaeguvz33Ha/Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqntU-00CnYD-Vx; Sat, 27 Nov 2021 02:56:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqntS-00CnX6-BP; Sat, 27 Nov 2021 02:56:51 +0000
X-UUID: 7b34247e66cc48c588fb72407ed5c41f-20211126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Xwnnc0yRrgLNUO+A6mfKrlsVJTbuBikrg6HCN5kbh9s=; 
 b=P9ZbnPaxsjXKLhWC2pYpoYxyh8DSH8Z8OeUklq6E/WuY3Bq8gnnkZMGawR+Xyfx8WItBT1K3piZ0x8jFJYYWH8KeUOZe9qmMx89wjEzUgfrUYPdG/6kDFn4D2BNPkR9LY5tTWCn4vLEnZpHgDzeBo332Q5GNO/wu64OnM70Bizc=;
X-UUID: 7b34247e66cc48c588fb72407ed5c41f-20211126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1606727491; Fri, 26 Nov 2021 19:56:48 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Nov 2021 18:46:46 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 27 Nov 2021 10:46:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 27 Nov 2021 10:46:44 +0800
Message-ID: <6abef78f6447c626b737fd35688f421c29871f43.camel@mediatek.com>
Subject: Re: [PATCH 1/2] iommu/mediatek: Always tlb_flush_all when each PM
 resume
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC: <kernel@collabora.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated
 list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "open
 list" <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <sebastian.reichel@collabora.com>, <iommu@lists.linux-foundation.org>
Date: Sat, 27 Nov 2021 10:46:44 +0800
In-Reply-To: <20211122104400.4160-2-dafna.hirschfeld@collabora.com>
References: <20211122104400.4160-1-dafna.hirschfeld@collabora.com>
 <20211122104400.4160-2-dafna.hirschfeld@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_185650_420786_6855FB9F 
X-CRM114-Status: GOOD (  34.82  )
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

Hi Dafna,

Sorry for reply late.

On Mon, 2021-11-22 at 12:43 +0200, Dafna Hirschfeld wrote:
> From: Yong Wu <yong.wu@mediatek.com>
> 
> Prepare for 2 HWs that sharing pgtable in different power-domains.
> 
> When there are 2 M4U HWs, it may has problem in the flush_range in
> which
> we get the pm_status via the m4u dev, BUT that function don't reflect
> the
> real power-domain status of the HW since there may be other HW also
> use
> that power-domain.
> 
> The function dma_alloc_attrs help allocate the iommu buffer which
> need the corresponding power domain since tlb flush is needed when
> preparing iova. BUT this function only is for allocating buffer,
> we have no good reason to request the user always call pm_runtime_get
> before calling dma_alloc_xxx. Therefore, we add a tlb_flush_all
> in the pm_runtime_resume to make sure the tlb always is clean.
> 
> Another solution is always call pm_runtime_get in the
> tlb_flush_range.
> This will trigger pm runtime resume/backup so often when the iommu
> power is not active at some time(means user don't call pm_runtime_get
> before calling dma_alloc_xxx), This may cause the performance drop.
> thus we don't use this.
> 
> In other case, the iommu's power should always be active via device
> link with smi.
> 
> The previous SoC don't have PM except mt8192. the mt8192 IOMMU is
> display's
> power-domain which nearly always is enabled. thus no need fix tags
> here.
> Prepare for mt8195.

In this patchset, this message should be not proper. I think you could
add the comment why this patch is needed in mt8173.

> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [imporvie inline doc]
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/iommu/mtk_iommu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 25b834104790..28dc4b95b6d9 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -964,6 +964,13 @@ static int __maybe_unused
> mtk_iommu_runtime_resume(struct device *dev)
>  		return ret;
>  	}
>  
> +	/*
> +	 * Users may allocate dma buffer before they call
> pm_runtime_get,
> +	 * in which case it will lack the necessary tlb flush.
> +	 * Thus, make sure to update the tlb after each PM resume.
> +	 */
> +	mtk_iommu_tlb_flush_all(data);

This should not work. since current the *_tlb_flush_all call
pm_runtime_get_if_in_use which will always return 0 when it called from
this runtime_cb in my test. thus, It won't do the tlb_flush_all
actually.

I guess this also depend on these two patches of mt8195 v3.
[PATCH v3 09/33] iommu/mediatek: Remove for_each_m4u in tlb_sync_all
[PATCH v3 10/33] iommu/mediatek: Add tlb_lock in tlb_flush_all

like in [10/33], I added a mtk_iommu_tlb_do_flush_all which don't have
the pm operation.

This looks has a dependence. Let me know if I can help this.

> +
>  	/*
>  	 * Uppon first resume, only enable the clk and return, since
> the values of the
>  	 * registers are not yet set.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
