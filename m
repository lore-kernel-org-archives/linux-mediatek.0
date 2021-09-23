Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB1CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 12:18:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 526CA61216
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 12:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 526CA61216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yW7T4veWuAR87WUAMVxf95OC1WPN+S/1BsbGcuNmT/4=; b=ojN9vFdcJOFIeW
	P1TBPZZ1V7R4k1hgSLFPC8bOIWxu1ZZbaaC+KL3jWODsWwBuJYRE5ksizTXk96XrJLCJ9woQaj0ne
	ZXtog8zcVLvWtrYzOdt0LbTvOlzbsUEWjiYWeWspZaRy2F8Pe+bYJP8DhE4kQH9CbiCrLiY82giy+
	yB9sF92Rew9gq1xqXb6BcdQzxzX6qRPZEMpAD/b/Te26GfAcol+X1zRw7yIz1a+lJHkPZWLkLCnJ4
	ULpx+vJjtOWr2GoDeRbt1SMPly6YqfxlF3k77YqESp2SI18hYl7TYyNTnQPx8TIGj9meFfRWk54eO
	2COi417kyWLndHH6IeBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTNfr-00BIvm-2l; Thu, 23 Sep 2021 12:17:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTNXn-00BEZk-VN; Thu, 23 Sep 2021 12:09:41 +0000
X-UUID: 6b3c9a0353004c7baaee997fc81e43de-20210923
X-UUID: 6b3c9a0353004c7baaee997fc81e43de-20210923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 561225143; Thu, 23 Sep 2021 05:09:33 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 05:00:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 20:00:37 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Sep 2021 20:00:36 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <chao.hao@mediatek.com>, <yen-chang.chen@mediatek.com>
Subject: [PATCH v3 10/33] iommu/mediatek: Add tlb_lock in tlb_flush_all
Date: Thu, 23 Sep 2021 19:58:17 +0800
Message-ID: <20210923115840.17813-11-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210923115840.17813-1-yong.wu@mediatek.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_050940_099308_D207EB88 
X-CRM114-Status: GOOD (  15.20  )
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
Add spinlock in it to protect the tlb registers. since the tlb_range
already hold the spinlock, move it a bit outside the spinlock to
print log.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0b4c30baa864..ab484d20b441 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -204,15 +204,24 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
 	return container_of(dom, struct mtk_iommu_domain, domain);
 }
 
-static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
+static void mtk_iommu_tlb_do_flush_all(struct mtk_iommu_data *data)
 {
-	if (pm_runtime_get_if_in_use(data->dev) <= 0)
-		return;
+	unsigned long flags;
 
+	spin_lock_irqsave(&data->tlb_lock, flags);
 	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
 		       data->base + data->plat_data->inv_sel_reg);
 	writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
 	wmb(); /* Make sure the tlb flush all done */
+	spin_unlock_irqrestore(&data->tlb_lock, flags);
+}
+
+static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
+{
+	if (pm_runtime_get_if_in_use(data->dev) <= 0)
+		return;
+
+	mtk_iommu_tlb_do_flush_all(data);
 
 	pm_runtime_put(data->dev);
 }
@@ -247,14 +256,16 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
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
-			mtk_iommu_tlb_flush_all(data);
+			mtk_iommu_tlb_do_flush_all(data);
 		}
-		/* Clear the CPE status */
-		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
-		spin_unlock_irqrestore(&data->tlb_lock, flags);
 
 		if (has_pm)
 			pm_runtime_put(data->dev);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
