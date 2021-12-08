Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FF4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWyd8YxQHW6Y88WNPkAF1xrQ62mvYDAgEZMWGHKbLok=; b=Du1fETFhhPjuJd
	QhCgJoNWrULeP5DL1nlUC+jTJwRaMqDN9KSlWt6SWwzJP1TVh03cTD0xJ7y9O9VafV0YcC+wtQuKo
	ef6HeGAXbOdaCSFl2ur4hS5pv3XppRx7ajY8YIwA/h+s352iFB2+9WkJkfpZz9J5Bi++CkhoZT7ji
	Gc5WNp/TYCDYH5a+Poj5hKs0fzAVyNeYtx2tbYBqVjebdBjKnquJdGe+I7vidh2pwqIU01qwoLGfT
	KGrlVWYqN6WOAK2yPP1zxHmwBbMdeBx3hYSg8Syu2MntStQxejOMvxiIJxeiJ1lrlTKCne78GAnR9
	WawCU8EATtxjEKJUP4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muvle-00COdi-Pq; Wed, 08 Dec 2021 12:09:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muvk6-00CNnn-4L; Wed, 08 Dec 2021 12:08:15 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a00:c281:1230:3700:51d0:7039:5913:64d3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D7C771F45CC9;
 Wed,  8 Dec 2021 12:08:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638965293; bh=aF1CmfT7rFK3gT9NbxPrEgiL2o8vrik2HcU3n2bTSNo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VifOHbOVseprUORLm78HIaWVplsXqc6xsRubtS5k+E23fEBezt4y3wyUY22YQMeTC
 4T8i/Bbt1hmWrGpaxcbpd948DLgu2JNMoH+MBYGaP3ndJfROIUe1n9tLV6swmgzfna
 fUNocaZxkbyRb115W7JNy42KjU8cErEcB23/sf/YGBeYMboaQetxDUshIbMYbUDkUU
 ztPqbX4TdFyKt1C4rLJw86MwIDZvwtFadZZHTNZNTeZFyDvLPknMt3eR2NhFk8uQv6
 F7npF9bv0Zh0+vofFrsfle4VDiyt7VSauq5w5MaWAnNKV5V6iaKBOwNKJc0aFOneNY
 taK39LGvmkOEA==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: iommu@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org (moderated list:MEDIATEK IOMMU DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-kernel@vger.kernel.org (open list), dafna.hirschfeld@collabora.com,
 kernel@collabora.com, linux-media@vger.kernel.org,
 sebastian.reichel@collabora.com
Subject: [PATCH v2 4/5] iommu/mediatek: Add tlb_lock in tlb_flush_all
Date: Wed,  8 Dec 2021 14:07:43 +0200
Message-Id: <20211208120744.2415-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
References: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_040814_346771_9758ED13 
X-CRM114-Status: GOOD (  13.45  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yong Wu <yong.wu@mediatek.com>

The tlb_flush_all touches the registers controlling tlb operations.
Protect it with the tlb_lock spinlock.
This also require the range_sync func to release that spinlock before
calling tlb_flush_all.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
[refactor commit log]
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e30ac68fab48..195a411e3087 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -210,10 +210,14 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
 
 static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&data->tlb_lock, flags);
 	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
 		       data->base + data->plat_data->inv_sel_reg);
 	writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
 	wmb(); /* Make sure the tlb flush all done */
+	spin_unlock_irqrestore(&data->tlb_lock, flags);
 }
 
 static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
@@ -242,14 +246,16 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 		/* tlb sync */
 		ret = readl_poll_timeout_atomic(data->base + REG_MMU_CPE_DONE,
 						tmp, tmp != 0, 10, 1000);
+
+		/* Clear the CPE status */
+		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
+		spin_unlock_irqrestore(&data->tlb_lock, flags);
+
 		if (ret) {
 			dev_warn(data->dev,
 				 "Partial TLB flush timed out, falling back to full flush\n");
 			mtk_iommu_tlb_flush_all(data);
 		}
-		/* Clear the CPE status */
-		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
-		spin_unlock_irqrestore(&data->tlb_lock, flags);
 
 		pm_runtime_put(data->dev);
 	}
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
