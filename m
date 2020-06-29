Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA680C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 07:14:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7FFD2332B
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 07:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gg7EOsyC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Qf7d1sof"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7FFD2332B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S6YjLhzXrOprOYtontxLpyNkNWShmQHbwVMCEVUYp3w=; b=Gg7EOsyCOHwSRjDjauwTkBMca
	pootJdqoudWQYmVFBzeBnKPNHN2ghomImvN3oAMbku9/uIYkTK7w8V/gu9mglppZQzGDHSQSUuAqT
	dpr/yb8lVwFjRSyvbG7xmXEXCd0xwq/VO97BcxGOSSBJk8e7u6eeD5mOy3f1hLNDcttejGqwEWEiE
	du1ZL+6913sg+Xb24+8UqgnJGTtnumPnLv1j9D3t1fj42UOBDmhdsy44oOMbZpQVHnfHdQfRu9x8P
	bLFSO4yE8owY7i41IM5iPmuZwE5Wtoc8ORmX6fWgvtB63zH3W6a5ZdR67EwUPLRnlWX1C9El99ntH
	DSP+Daing==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpnzk-0007jk-68; Mon, 29 Jun 2020 07:14:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpnzh-0007jA-Am; Mon, 29 Jun 2020 07:14:22 +0000
X-UUID: 85101b3957b749d29746c7fa9150708c-20200628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pLAUS/DRU9wpthxePkSQM5YFUf5E76lHXAjpdpQF3iQ=; 
 b=Qf7d1sofs/S5VzvQO5OBY6xZXni+HktcMXCS+EgVjZ6CnFeeT06hEezIGEE9Bhh9dQlrEX93TBFz2P91PwNH2NFbgRUiMs6PaMJOCUOylqiun47Buaur788jaYbOjZ1UzjNNTDNu8l0tvfItTS0nv46tPrRCkFUcux7YaNbrQAk=;
X-UUID: 85101b3957b749d29746c7fa9150708c-20200628
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 302390625; Sun, 28 Jun 2020 23:14:13 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 00:14:14 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 15:14:12 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Jun 2020 15:14:12 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v5 02/10] iommu/mediatek: Rename the register
 STANDARD_AXI_MODE(0x48) to MISC_CTRL
Date: Mon, 29 Jun 2020 15:13:02 +0800
Message-ID: <20200629071310.1557-3-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200629071310.1557-1-chao.hao@mediatek.com>
References: <20200629071310.1557-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D41DBD47599BC199E1A5682A8FCA0F880A567EFF4BD36DF6D4C8D614814547632000:8
X-MTK: N
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
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For iommu offset=0x48 register, only the previous mt8173/mt8183 use the
name STANDARD_AXI_MODE, all the latest SoC extend the register more
feature by different bits, for example: axi_mode, in_order_en, coherent_en
and so on. So rename REG_MMU_MISC_CTRL may be more proper.

This patch only rename the register name, no functional change.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/iommu/mtk_iommu.c | 14 +++++++-------
 drivers/iommu/mtk_iommu.h |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2be96f1cdbd2..88d3df5b91c2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -41,7 +41,7 @@
 #define F_INVLD_EN0				BIT(0)
 #define F_INVLD_EN1				BIT(1)
 
-#define REG_MMU_STANDARD_AXI_MODE		0x048
+#define REG_MMU_MISC_CTRL			0x048
 #define REG_MMU_DCM_DIS				0x050
 
 #define REG_MMU_CTRL_REG			0x110
@@ -573,8 +573,10 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	}
 	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
 
-	if (data->plat_data->reset_axi)
-		writel_relaxed(0, data->base + REG_MMU_STANDARD_AXI_MODE);
+	if (data->plat_data->reset_axi) {
+		/* The register is called STANDARD_AXI_MODE in this case */
+		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
+	}
 
 	if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
 			     dev_name(data->dev), (void *)data)) {
@@ -718,8 +720,7 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
 	void __iomem *base = data->base;
 
-	reg->standard_axi_mode = readl_relaxed(base +
-					       REG_MMU_STANDARD_AXI_MODE);
+	reg->misc_ctrl = readl_relaxed(base + REG_MMU_MISC_CTRL);
 	reg->dcm_dis = readl_relaxed(base + REG_MMU_DCM_DIS);
 	reg->ctrl_reg = readl_relaxed(base + REG_MMU_CTRL_REG);
 	reg->int_control0 = readl_relaxed(base + REG_MMU_INT_CONTROL0);
@@ -743,8 +744,7 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
 		dev_err(data->dev, "Failed to enable clk(%d) in resume\n", ret);
 		return ret;
 	}
-	writel_relaxed(reg->standard_axi_mode,
-		       base + REG_MMU_STANDARD_AXI_MODE);
+	writel_relaxed(reg->misc_ctrl, base + REG_MMU_MISC_CTRL);
 	writel_relaxed(reg->dcm_dis, base + REG_MMU_DCM_DIS);
 	writel_relaxed(reg->ctrl_reg, base + REG_MMU_CTRL_REG);
 	writel_relaxed(reg->int_control0, base + REG_MMU_INT_CONTROL0);
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index ea949a324e33..1b6ea839b92c 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -18,7 +18,7 @@
 #include <soc/mediatek/smi.h>
 
 struct mtk_iommu_suspend_reg {
-	u32				standard_axi_mode;
+	u32				misc_ctrl;
 	u32				dcm_dis;
 	u32				ctrl_reg;
 	u32				int_control0;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
