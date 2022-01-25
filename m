Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 09:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJ5tvz4cZ8Jb/6Wjj4gPmMx2kT1HCz+CMBBQSLrV9jw=; b=Z1lPgPDa5mKRO+
	TXxpUBSAOj8S7hiaZXyBK/knG3AA6jIMT4F+uXju8ILsxMVC/LTOY4L3HT4gz3TDOUfMGb2F/UFju
	rOwBli1mjjH7VCFHpw6E8qyac5OauUuyjOcWNABmRTJ1nuJgqjJfjAHqhHnvLB1iydV/CeVF5/UfR
	NemQp/gL9qnjyIgLX7+j36xU5oqHh2gzr7xha66wIXzPrQYyBNZ4E9DDyUrQHfKCYH3A/z1BHbfk+
	3iMQLEEysTpWj69zWeF0k6pcgz/2xKz0REqxFEilhEyKvUSZGU4FDmKGGcug3K0uLL6HLSVsEdW8S
	f8hGo09bVS6Q6Z9CZUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCHpq-0070vy-2X; Tue, 25 Jan 2022 09:09:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCHiD-006xGc-Fz; Tue, 25 Jan 2022 09:02:03 +0000
X-UUID: af795395b5e149cb9fa412b73f641875-20220125
X-UUID: af795395b5e149cb9fa412b73f641875-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1330577146; Tue, 25 Jan 2022 02:01:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 01:00:09 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 25 Jan 2022 17:00:08 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 17:00:06 +0800
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
Subject: [PATCH v4 25/35] iommu/mediatek: Just move code position in hw_init
Date: Tue, 25 Jan 2022 16:56:24 +0800
Message-ID: <20220125085634.17972-26-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220125085634.17972-1-yong.wu@mediatek.com>
References: <20220125085634.17972-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_010201_619184_364B8249 
X-CRM114-Status: GOOD (  12.27  )
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

No functional change too, prepare for mt8195 IOMMU support bank functions.
Some global control settings are in bank0 while the other banks have
their bank independent setting. Here only move the global control
settings and the independent registers together.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 48 +++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index fdc14db5b4c0..496ed9ecd23a 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -766,30 +766,6 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	}
 	writel_relaxed(regval, data->base + REG_MMU_CTRL_REG);
 
-	regval = F_L2_MULIT_HIT_EN |
-		F_TABLE_WALK_FAULT_INT_EN |
-		F_PREETCH_FIFO_OVERFLOW_INT_EN |
-		F_MISS_FIFO_OVERFLOW_INT_EN |
-		F_PREFETCH_FIFO_ERR_INT_EN |
-		F_MISS_FIFO_ERR_INT_EN;
-	writel_relaxed(regval, data->base + REG_MMU_INT_CONTROL0);
-
-	regval = F_INT_TRANSLATION_FAULT |
-		F_INT_MAIN_MULTI_HIT_FAULT |
-		F_INT_INVALID_PA_FAULT |
-		F_INT_ENTRY_REPLACEMENT_FAULT |
-		F_INT_TLB_MISS_FAULT |
-		F_INT_MISS_TRANSACTION_FIFO_FAULT |
-		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
-	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
-
-	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_LEGACY_IVRP_PADDR))
-		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
-	else
-		regval = lower_32_bits(data->protect_base) |
-			 upper_32_bits(data->protect_base);
-	writel_relaxed(regval, data->base + REG_MMU_IVRP_PADDR);
-
 	if (data->enable_4GB &&
 	    MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_VLD_PA_RNG)) {
 		/*
@@ -823,6 +799,30 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	}
 	writel_relaxed(regval, data->base + REG_MMU_MISC_CTRL);
 
+	regval = F_L2_MULIT_HIT_EN |
+		F_TABLE_WALK_FAULT_INT_EN |
+		F_PREETCH_FIFO_OVERFLOW_INT_EN |
+		F_MISS_FIFO_OVERFLOW_INT_EN |
+		F_PREFETCH_FIFO_ERR_INT_EN |
+		F_MISS_FIFO_ERR_INT_EN;
+	writel_relaxed(regval, data->base + REG_MMU_INT_CONTROL0);
+
+	regval = F_INT_TRANSLATION_FAULT |
+		F_INT_MAIN_MULTI_HIT_FAULT |
+		F_INT_INVALID_PA_FAULT |
+		F_INT_ENTRY_REPLACEMENT_FAULT |
+		F_INT_TLB_MISS_FAULT |
+		F_INT_MISS_TRANSACTION_FIFO_FAULT |
+		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
+	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
+
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_LEGACY_IVRP_PADDR))
+		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
+	else
+		regval = lower_32_bits(data->protect_base) |
+			 upper_32_bits(data->protect_base);
+	writel_relaxed(regval, data->base + REG_MMU_IVRP_PADDR);
+
 	if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
 			     dev_name(data->dev), (void *)data)) {
 		writel_relaxed(0, data->base + REG_MMU_PT_BASE_ADDR);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
