Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B0CC04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 11:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rhMVF1wLt9+xBoym/qy6Dgu5kHctelsoD3CJERk8NQ=; b=Bdq58QdGAlOM5rV74s2TUPmj6Q
	Zn+YmVMFY0wt7CnPh2ZupxGS4P8ESQ2MTvnJQAFN+a9nupQUtIIA7MUJA8RtG1aaukem+1zbGyTRN
	n0Hpi/AHd/o6Brp4pjYvAK9wvS0c6ZsKGQc4OM/UMvU7m4nEaJKTi/n++exG9fGS+153lr4XCGdQF
	bsXVE81wtIKL+XQ+lszPhBw17uczLo5XbhhxddRFVCwTPuavBfj3HuqQ0nAl2refXClYP0k1xx/4k
	vRTgi9FzNwGGfWUPoFNZQQu+akVhsXhM2xjHWkqhYOXT34FFBn8NwM7FmW9VJn9vm7S5ndZ7NynHk
	ktPNd+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGf1U-00CqKj-Bm; Wed, 27 Jul 2022 11:16:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGf1R-00CqIB-BN
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 11:16:14 +0000
X-UUID: 12a177ee54a74195a7136282b4f0526e-20220727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:6f197efe-1db0-40ed-80ea-6a47e6b0e103,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:13b20616-4d40-4085-b6be-c498a879f53d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 12a177ee54a74195a7136282b4f0526e-20220727
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 143384532; Wed, 27 Jul 2022 04:16:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 27 Jul 2022 18:46:03 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 27 Jul 2022 18:46:03 +0800
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chengci.Xu
	<chengci.xu@mediatek.com>
Subject: [PATCH v3 2/3] memory: mtk-smi: Add enable IOMMU SMC command for MM master
Date: Wed, 27 Jul 2022 18:45:40 +0800
Message-ID: <20220727104541.7309-3-chengci.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727104541.7309-1-chengci.xu@mediatek.com>
References: <20220727104541.7309-1-chengci.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_041613_414314_F390944E 
X-CRM114-Status: GOOD (  13.18  )
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

For concerns about security, the register to enable/disable IOMMU of
SMI LARB should only be configured in secure world. Thus, we add some
SMC command for multimedia master to enable/disable MM IOMMU in ATF by
setting the register of SMI LARB. This function is prepared for MT8188.

Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
---
 drivers/memory/mtk-smi.c                 | 11 +++++++++++
 include/linux/soc/mediatek/mtk_sip_svc.h |  3 +++
 include/soc/mediatek/smi.h               |  7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index d7cb7ead2ac7..41ce66c39123 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015-2016 MediaTek Inc.
  * Author: Yong Wu <yong.wu@mediatek.com>
  */
+#include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/device.h>
@@ -14,6 +15,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
 #include <soc/mediatek/smi.h>
 #include <dt-bindings/memory/mt2701-larb-port.h>
 #include <dt-bindings/memory/mtk-memory-port.h>
@@ -89,6 +91,7 @@
 #define MTK_SMI_FLAG_THRT_UPDATE	BIT(0)
 #define MTK_SMI_FLAG_SW_FLAG		BIT(1)
 #define MTK_SMI_FLAG_SLEEP_CTL		BIT(2)
+#define MTK_SMI_FLAG_SEC_REG		BIT(3)
 #define MTK_SMI_CAPS(flags, _x)		(!!((flags) & (_x)))
 
 struct mtk_smi_reg_pair {
@@ -235,6 +238,7 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
 	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
 	u32 reg, flags_general = larb->larb_gen->flags_general;
 	const u8 *larbostd = larb->larb_gen->ostd ? larb->larb_gen->ostd[larb->larbid] : NULL;
+	struct arm_smccc_res res;
 	int i;
 
 	if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
@@ -259,6 +263,13 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
 		reg |= BANK_SEL(larb->bank[i]);
 		writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
 	}
+
+	if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_SEC_REG)) {
+		arm_smccc_smc(MTK_SIP_KERNEL_IOMMU_CONTROL, IOMMU_ATF_CMD_CONFIG_SMI_LARB,
+			      larb->larbid, (u32)(*larb->mmu), 0, 0, 0, 0, &res);
+		if (res.a0 != 0)
+			dev_err(dev, "Enable iommu fail, ret %ld\n", res.a0);
+	}
 }
 
 static const u8 mtk_smi_larb_mt8195_ostd[][SMI_LARB_PORT_NR_MAX] = {
diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
index 082398e0cfb1..0761128b4354 100644
--- a/include/linux/soc/mediatek/mtk_sip_svc.h
+++ b/include/linux/soc/mediatek/mtk_sip_svc.h
@@ -22,4 +22,7 @@
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
 			   ARM_SMCCC_OWNER_SIP, fn_id)
 
+/* IOMMU related SMC call */
+#define MTK_SIP_KERNEL_IOMMU_CONTROL	MTK_SIP_SMC_CMD(0x514)
+
 #endif
diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
index 11f7d6b59642..8c781b7bd88d 100644
--- a/include/soc/mediatek/smi.h
+++ b/include/soc/mediatek/smi.h
@@ -9,6 +9,13 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 
+/* IOMMU & SMI ATF CMD */
+
+enum IOMMU_ATF_CMD {
+	IOMMU_ATF_CMD_CONFIG_SMI_LARB,		/* For mm master to en/disable iommu */
+	IOMMU_ATF_CMD_COUNT,
+};
+
 #if IS_ENABLED(CONFIG_MTK_SMI)
 
 #define MTK_SMI_MMU_EN(port)	BIT(port)
-- 
2.25.1


