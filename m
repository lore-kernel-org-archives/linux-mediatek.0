Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C74C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4iYzUMPp1O6ze5S6AjCBaQyekxGDoepSfXS/BqAYbs=; b=4oMQYN01ppWTrZ
	S0wg2SGxV9UIBCSw1fNPpNXtbQ+TAo3CT45/2yqZCbl4He6CiwRsJPuyzMt+Xq+hwvg09tRMQlGSR
	k9DbZpyQtBgMSOxnBFr3pfJYLpvp+W3nh3GrNcpYLda0cg6DSXATm9/zGEeJBPPV5zmSXi4tSUt0d
	Hd5ypya38C+5dwiC7X8YWsh8qnKodmJt6aj+FG9UNxLcVZhImQm1GgyCct8paDXedZ7mJ+Vy4pOdg
	/vVsBQhWoGXt3eF0DBDU4RNaiTul0agktMSbqHqZYkL4NYR5IveZyMV8Uyri0R2RNhIcxz8hA8fmH
	l9mW1sokD6R26XfqqGGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muvkY-00CO0f-W9; Wed, 08 Dec 2021 12:08:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muvk2-00CNlN-ET; Wed, 08 Dec 2021 12:08:12 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a00:c281:1230:3700:51d0:7039:5913:64d3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E7B1B1F45C87;
 Wed,  8 Dec 2021 12:08:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638965289; bh=/ksqLGRqcx9RPvezQU0f63T25oDST3xu9zSisBbGyqQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=i/LWg2n8z2KMdp8HIIjkNn1xo/fr0fLDwfwLt7svKE9NR2p3Gf9/2bv4lH9xOHzpD
 /+dwsNPVKbByunLTi8ZVdEh4acbq+KKVnEbl4+2fPAhJYOOgxUwed1R6yu/Nmqni8q
 XZuGjkKlFUI5u6zNGwHf4UlNMaOncuL2fzEHgM+x2giWgW7hjwEcVAAwWlbBnzXFJv
 hMkCCAU5b5YKfQATsvJNRoqjzqwX1opyFxS1ZipzmaJviXYtelzgCiuGzLlpsbRNUo
 R6DEHUTh7mfJezgGkhq1Ranbr+Fuq6RSOXh38z18YtmYh8z2t9QPuS7SiUdNBzf+ft
 QeIZilzrM/dhQ==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: iommu@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org (moderated list:MEDIATEK IOMMU DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-kernel@vger.kernel.org (open list), dafna.hirschfeld@collabora.com,
 kernel@collabora.com, linux-media@vger.kernel.org,
 sebastian.reichel@collabora.com
Subject: [PATCH v2 1/5] iommu/mediatek: Remove for_each_m4u in tlb_sync_all
Date: Wed,  8 Dec 2021 14:07:40 +0200
Message-Id: <20211208120744.2415-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
References: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_040810_643952_1BF7A663 
X-CRM114-Status: GOOD (  12.85  )
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

The tlb_sync_all is called from these three functions:
a) flush_iotlb_all: it will be called for each a iommu HW.
b) tlb_flush_range_sync: it already has for_each_m4u.
c) in irq: When IOMMU HW translation fault, Only need flush itself.

Thus, No need for_each_m4u in this tlb_sync_all. Remove it.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 507123ae7485..342aa562ab6a 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -210,17 +210,15 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
 
 static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
 {
-	for_each_m4u(data) {
-		if (pm_runtime_get_if_in_use(data->dev) <= 0)
-			continue;
+	if (pm_runtime_get_if_in_use(data->dev) <= 0)
+		return;
 
-		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
-			       data->base + data->plat_data->inv_sel_reg);
-		writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
-		wmb(); /* Make sure the tlb flush all done */
+	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
+		       data->base + data->plat_data->inv_sel_reg);
+	writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
+	wmb(); /* Make sure the tlb flush all done */
 
-		pm_runtime_put(data->dev);
-	}
+	pm_runtime_put(data->dev);
 }
 
 static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
