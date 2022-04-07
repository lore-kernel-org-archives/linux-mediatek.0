Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC605C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJJWtP9Ud2RLIV0wihaoPuNwopPI84l/LP3FjGnhsVY=; b=KUvzCOFE3Q14Fb
	0+N2FPPlhWUhjiO6QdnkwwKDaLiYlTc9sHm+o0nCGZprCFqFQ0YTlCReqc1TMEnSrbiTwxypHzvdi
	aHhbmzV8iTQlHT5N5/4aoz0HiTI+Mt3pCnBVuT82u+8X8Pj4JmYe3EaIDIr/Z8IktVevfFkoesr/i
	tjtrhtl7GRzmj9hgIzHlqNih+RWY4FIpTJiFq9tPC3Q2zjoUTWLMsp3nFj0jx+OdZ+yivMLNam/PI
	1CR+QH/W0sTjPx3VDOCq5IFDUtUMjTC2movSw/vS+IH+Fhlvlz+iyupELBnQIWJotOssUMD4Mgmdz
	MopzmaAMTPhGKdBsA8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncNak-00ASAe-5K; Thu, 07 Apr 2022 08:34:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncNCz-00AGGs-LS; Thu, 07 Apr 2022 08:09:39 +0000
X-UUID: d7579d929a124e22b0b0c0dd5431b89c-20220407
X-UUID: d7579d929a124e22b0b0c0dd5431b89c-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 58168454; Thu, 07 Apr 2022 01:09:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 01:00:30 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 7 Apr 2022 16:00:29 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 16:00:27 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <xueqi.zhang@mediatek.com>, <yen-chang.chen@mediatek.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
 <mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, 
 <chengci.xu@mediatek.com>
Subject: [PATCH v6 19/34] iommu/mediatek: Add a PM_CLK_AO flag for infra iommu
Date: Thu, 7 Apr 2022 15:57:11 +0800
Message-ID: <20220407075726.17771-20-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220407075726.17771-1-yong.wu@mediatek.com>
References: <20220407075726.17771-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_010937_828615_80CD54A4 
X-CRM114-Status: GOOD (  19.47  )
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

The power/clock of infra iommu is always on, and it doesn't have the
device link with the master devices, then the infra iommu device's PM
status is not active, thus we add A PM_CLK_AO flag for infra iommu.

The tlb operation is a bit not clear here, there are 2 special cases.
Comment them in the code.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b737613e9046..afb77a530f32 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -130,6 +130,8 @@
 #define MTK_IOMMU_TYPE_MM		(0x0 << 13)
 #define MTK_IOMMU_TYPE_INFRA		(0x1 << 13)
 #define MTK_IOMMU_TYPE_MASK		(0x3 << 13)
+/* PM and clock always on. e.g. infra iommu */
+#define PM_CLK_AO			BIT(15)
 
 #define MTK_IOMMU_HAS_FLAG(pdata, _x)	(!!(((pdata)->flags) & (_x)))
 
@@ -235,13 +237,33 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 					   struct mtk_iommu_data *data)
 {
 	struct list_head *head = data->hw_list;
+	bool check_pm_status;
 	unsigned long flags;
 	int ret;
 	u32 tmp;
 
 	for_each_m4u(data, head) {
-		if (pm_runtime_get_if_in_use(data->dev) <= 0)
-			continue;
+		/*
+		 * To avoid resume the iommu device frequently when the iommu device
+		 * is not active, it doesn't always call pm_runtime_get here, then tlb
+		 * flush depends on the tlb flush all in the runtime resume.
+		 *
+		 * There are 2 special cases:
+		 *
+		 * Case1: The iommu dev doesn't have power domain but has bclk. This case
+		 * should also avoid the tlb flush while the dev is not active to mute
+		 * the tlb timeout log. like mt8173.
+		 *
+		 * Case2: The power/clock of infra iommu is always on, and it doesn't
+		 * have the device link with the master devices. This case should avoid
+		 * the PM status check.
+		 */
+		check_pm_status = !MTK_IOMMU_HAS_FLAG(data->plat_data, PM_CLK_AO);
+
+		if (check_pm_status) {
+			if (pm_runtime_get_if_in_use(data->dev) <= 0)
+				continue;
+		}
 
 		spin_lock_irqsave(&data->tlb_lock, flags);
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
@@ -268,7 +290,8 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 			mtk_iommu_tlb_flush_all(data);
 		}
 
-		pm_runtime_put(data->dev);
+		if (check_pm_status)
+			pm_runtime_put(data->dev);
 	}
 }
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
