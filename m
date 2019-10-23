Return-Path: <SRS0=HtVu=YQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33328CA9EB6
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 16:53:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0180721906
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 16:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L2db8e8g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vM3wriHv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0180721906
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rAQwFbyfMh8NrO75IIB0ETOp/X6S4ss/Xyw4PtUwCk=; b=L2db8e8gGJ5QMw
	exvc7Np/eb+pCpuL29XxVrx6+N2c0mKo5E4t5GAM0huA8c6LEhqmG6UGWgmX1uz2BCrrQZWkpKrsA
	2Otcwe9h3a5sPZ0o52VeV92yZnmtYLH+TvKZ3GrL4rDlOZgWGZtCKK3O2X85Q7Kg3b0ku313auzcO
	CEUpLPX2qlNBUg9Uz/BBqiRi/k2x4KdbiSmntPP2/VXIWIlC5eZCP1X7F4IOtthZ6rk0FSy65uLFY
	tm99mS0QyUJeit21AWfXf2tJ3qN3JbrSslMd9rHWjShu6xPfMwaBcdqwGYegL6s4L9POJkXRaFlJm
	HwEbTvcSDlXc2zQxpRTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNJsy-0007vW-Ez; Wed, 23 Oct 2019 16:53:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNJsa-0007iL-6L; Wed, 23 Oct 2019 16:53:01 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F2EF21906;
 Wed, 23 Oct 2019 16:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571849579;
 bh=F5Izp3I8AX+Ri+LTIkBe2psZof2nJUu/2jw8CqPmo+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vM3wriHv2BCfsl4QWE/Yo0Tr9tEwuSOYD/+jXqoi+TwKpYLw+r7KqC/INuDeE6paR
 8kN95fF7O/278RKBRp+COHuOA0qlcJLdeS3sShi0ETrCZk8FOTwW3RTHbduQUIfc83
 EcxQlpdh+2SDSt3EWDK/G1983yOPo7V7MQo9/1sY=
Date: Wed, 23 Oct 2019 17:52:53 +0100
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 2/7] iommu/mediatek: Add a new tlb_lock for tlb_flush
Message-ID: <20191023165252.GA27471@willie-the-truck>
References: <1571196792-12382-1-git-send-email-yong.wu@mediatek.com>
 <1571196792-12382-3-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571196792-12382-3-git-send-email-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_095300_269209_AAC252F0 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Joerg Roedel <joro@8bytes.org>, edison.hsieh@mediatek.com,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 16, 2019 at 11:33:07AM +0800, Yong Wu wrote:
> The commit 4d689b619445 ("iommu/io-pgtable-arm-v7s: Convert to IOMMU API
> TLB sync") help move the tlb_sync of unmap from v7s into the iommu
> framework. It helps add a new function "mtk_iommu_iotlb_sync", But it
> lacked the lock, then it will cause the variable "tlb_flush_active"
> may be changed unexpectedly, we could see this warning log randomly:
> 
> mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to
> full flush
> 
> The HW requires tlb_flush/tlb_sync in pairs strictly, this patch adds
> a new tlb_lock for tlb operations to fix this issue.
> 
> Fixes: 4d689b619445 ("iommu/io-pgtable-arm-v7s: Convert to IOMMU API TLB
> sync")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 23 ++++++++++++++++++++++-
>  drivers/iommu/mtk_iommu.h |  1 +
>  2 files changed, 23 insertions(+), 1 deletion(-)

[...]

>  static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
>  					    unsigned long iova, size_t granule,
>  					    void *cookie)
>  {
> +	struct mtk_iommu_data *data = cookie;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&data->tlb_lock, flags);
>  	mtk_iommu_tlb_add_flush_nosync(iova, granule, granule, true, cookie);
> +	spin_unlock_irqrestore(&data->tlb_lock, flags);

Given that you release the lock here, what prevents another nosync()
operation being issued before you've managed to do the sync()?

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
