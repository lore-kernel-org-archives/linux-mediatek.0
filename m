Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F99C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 06:57:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 532CA60FC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 06:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 532CA60FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49I1HExU1QHHEfybwt6GB6AxK659CyEEGPb+o2nD+JY=; b=FSe/IMdwlQmCmp
	xvptwQJcDf/dDG5Og72GZ6B1pfCgTbkcEXpzNfO7qGgctCmEufPWmZs0IGx4bKHUOSnLsWonsMLgS
	suT7jrK59UH1TwWI2dWixNmedZjGDg7yw0/IW4rkYhhQpdsASMecPM5Uw9zLmNHxjem8b17nuZT19
	5pFAx5Ki9HjG2DBKQjn07Ba9UsVoWg9gVFHgSFIXzV/LY2cuAE7B7xj1RyT8KIloX8Enm0Q5Ey5gR
	6AWwfDVs2G/HQGJIfSmJkMD2XMalkFxyLvCWSXnWFCcpa0xGNO4fbDrEmSGzn4JSZXP0VU49np7I8
	+k0ZonrYI3wt9R6PWbHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mER7w-00Bvx0-Gn; Fri, 13 Aug 2021 06:57:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mER7b-00BvmT-6D; Fri, 13 Aug 2021 06:56:55 +0000
X-UUID: 50f76bd5d1a54bae9eae6fdc50cb47af-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+DJ1cll+65HxqnLxE2WdO8DH95diWl+F6xnsS0cUNEQ=; 
 b=TBuOSb9fynCA8M8IcQMUmDuPvOPqmTQPbr7aU8PnH8aCArxyHqh+YpH+p6YTz691botBFHW/BPOttLVjQFI0zKOzcbfClCTMg47vTR0vB7D/JBZc8bLQyvxyzqzV5lBncNHuKPFIRH783O1AyZv4oYsSo5V9uj6ogj9qPVBLgUc=;
X-UUID: 50f76bd5d1a54bae9eae6fdc50cb47af-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 974176520; Thu, 12 Aug 2021 23:56:46 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 23:54:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 14:54:50 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 14:54:49 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Evan Green
 <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>
Subject: [PATCH v2 09/29] iommu/mediatek: Add tlb_lock in tlb_flush_all
Date: Fri, 13 Aug 2021 14:53:04 +0800
Message-ID: <20210813065324.29220-10-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210813065324.29220-1-yong.wu@mediatek.com>
References: <20210813065324.29220-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_235651_276276_A1564A16 
X-CRM114-Status: GOOD (  13.34  )
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

The tlb_flush_all also touches the registers about tlb operations.
Add spinlock in it to protect the tlb registers. If flush_all is called
from tlb_flush_range, then no need this spinlock as tlb_flush_range
already hold the tlb_lock.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 1e18fff76e61..d64139ab59d0 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -205,15 +205,24 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
 	return container_of(dom, struct mtk_iommu_domain, domain);
 }
 
-static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
+static void __mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
 {
-	if (pm_runtime_get_if_in_use(data->dev) <= 0)
-		return;
-
 	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
 		       data->base + data->plat_data->inv_sel_reg);
 	writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
 	wmb(); /* Make sure the tlb flush all done */
+}
+
+static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
+{
+	unsigned long flags;
+
+	if (pm_runtime_get_if_in_use(data->dev) <= 0)
+		return;
+
+	spin_lock_irqsave(&data->tlb_lock, flags);
+	__mtk_iommu_tlb_flush_all(data);
+	spin_unlock_irqrestore(&data->tlb_lock, flags);
 
 	pm_runtime_put(data->dev);
 }
@@ -251,7 +260,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 		if (ret) {
 			dev_warn(data->dev,
 				 "Partial TLB flush timed out, falling back to full flush\n");
-			mtk_iommu_tlb_flush_all(data);
+			__mtk_iommu_tlb_flush_all(data);
 		}
 		/* Clear the CPE status */
 		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
