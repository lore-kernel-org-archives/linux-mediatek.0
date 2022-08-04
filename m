Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF1CC19F2C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 11:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FuD5UFeDZW+zOlmAJO1MmE8VQ8VrGMdai3hQVVSU30=; b=WF1+nyZqz8j0vPBveOYjgaUG8d
	jkzUH4iS1k3YlC3kq7Hj4GLG/cc1TGDwiz0DHTN72kfiBsBCyssOh5Ti6bw/FT+7iVsh+9cpkBth8
	yKZlqT3mZNmQeYxZw71kT3t5L9YkShGkzCHIL8AoxSfEdCQEiB5mzIVucQ0mrreXS4te16YSbTb6m
	hvjjjmMLEyu2EbHdZE9sfhpZHrVe749MOHx8jCyNehZ0D+oagzP8EFR+BtrUsN4jNwPfD/VztoEwQ
	hEZxdnrEteVCTDwPCxAxohb+ykOJw1mtU6XofplHUNuFdpHHituxKqg2KRZov/u5F9oFb1sDqADCi
	ZqDPrdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJYtS-005X6i-PG; Thu, 04 Aug 2022 11:19:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJYtG-005Wzt-8q; Thu, 04 Aug 2022 11:19:48 +0000
X-UUID: 2a0d3f46604044cabbd4f842562b2dc3-20220804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:b9295585-433a-4322-a048-29328e28c30f,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:cc373bd1-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 2a0d3f46604044cabbd4f842562b2dc3-20220804
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 688178692; Thu, 04 Aug 2022 04:19:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 18:58:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Aug 2022 18:58:59 +0800
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chengci.Xu
	<chengci.xu@mediatek.com>
Subject: [PATCH 2/3] iommu/mediatek: Add enable IOMMU SMC command for INFRA master
Date: Thu, 4 Aug 2022 18:58:33 +0800
Message-ID: <20220804105834.626-3-chengci.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804105834.626-1-chengci.xu@mediatek.com>
References: <20220804105834.626-1-chengci.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_041946_368523_1227062A 
X-CRM114-Status: GOOD (  18.22  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The register which can enable IOMMU for INFRA master should be setted
in secure world for security concerns. Therefore, we add a SMC command
for INFRA master to enable/disable INFRA IOMMU in ATF. This function is
prepared for MT8188.

Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
---
This patch depends on "Add enable IOMMU SMC command for MM master"[1].

Patch[1] enables SMI to help MM masters configure MM IOMMU in secure world.
Similarly, INFRA masters also need to configure INFRA IOMMU in secure world. 
So please also accept this patch together with patch[1].

[1]https://lore.kernel.org/linux-mediatek/20220801021851.7169-4-chengci.xu@mediatek.com/
---
 drivers/iommu/mtk_iommu.c  | 34 ++++++++++++++++++++++++++--------
 include/soc/mediatek/smi.h |  1 +
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 7e363b1f24df..6fe780783ec8 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015-2016 MediaTek Inc.
  * Author: Yong Wu <yong.wu@mediatek.com>
  */
+#include <linux/arm-smccc.h>
 #include <linux/bitfield.h>
 #include <linux/bug.h>
 #include <linux/clk.h>
@@ -28,6 +29,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/soc/mediatek/infracfg.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
 #include <asm/barrier.h>
 #include <soc/mediatek/smi.h>
 
@@ -138,6 +140,7 @@
 #define PM_CLK_AO			BIT(15)
 #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
 #define PGTABLE_PA_35_EN		BIT(17)
+#define CFG_IFA_MASTER_IN_ATF		BIT(18)
 
 #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
 				((((pdata)->flags) & (mask)) == (_x))
@@ -554,14 +557,29 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 			else
 				larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
 		} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA)) {
-			peri_mmuen_msk = BIT(portid);
-			/* PCI dev has only one output id, enable the next writing bit for PCIe */
-			if (dev_is_pci(dev))
-				peri_mmuen_msk |= BIT(portid + 1);
-
-			peri_mmuen = enable ? peri_mmuen_msk : 0;
-			ret = regmap_update_bits(data->pericfg, PERICFG_IOMMU_1,
-						 peri_mmuen_msk, peri_mmuen);
+			if (MTK_IOMMU_HAS_FLAG(data->plat_data, CFG_IFA_MASTER_IN_ATF)) {
+				struct arm_smccc_res res;
+
+				portid = MTK_M4U_TO_PORT(fwspec->ids[i]);
+				arm_smccc_smc(MTK_SIP_KERNEL_IOMMU_CONTROL,
+					      IOMMU_ATF_CMD_CONFIG_INFRA_IOMMU,
+					      portid, enable, 0, 0, 0, 0, &res);
+				ret = (int)res.a0;
+
+			} else {
+				peri_mmuen_msk = BIT(portid);
+				/* PCI dev has only one output id,
+				 * enable the next writing bit for PCIe
+				 */
+				if (dev_is_pci(dev))
+					peri_mmuen_msk |= BIT(portid + 1);
+
+				peri_mmuen = enable ? peri_mmuen_msk : 0;
+				ret = regmap_update_bits(data->pericfg,
+							 PERICFG_IOMMU_1,
+							 peri_mmuen_msk,
+							 peri_mmuen);
+			}
 			if (ret)
 				dev_err(dev, "%s iommu(%s) inframaster 0x%x fail(%d).\n",
 					enable ? "enable" : "disable",
diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
index dfd8efca5e60..99f13b0e416d 100644
--- a/include/soc/mediatek/smi.h
+++ b/include/soc/mediatek/smi.h
@@ -13,6 +13,7 @@
 
 enum iommu_atf_cmd {
 	IOMMU_ATF_CMD_CONFIG_SMI_LARB,		/* For mm master to en/disable iommu */
+	IOMMU_ATF_CMD_CONFIG_INFRA_IOMMU,	/* For infra master en/disable iommu */
 	IOMMU_ATF_CMD_MAX,
 };
 
-- 
2.25.1


