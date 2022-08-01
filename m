Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08AAC00140
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 02:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/s8cLEbci6CWYgGbk9Mm4UGug/H67nn97+euPNczIYQ=; b=FC2M7UqaL+PnGkfH3biCyA5Is/
	NHPfcyeKE6uz39rAIBJ6S1OzpzQDVHuMn6NN6xi1MnzDN587W7PTkKAygdT1GaMC5EEX+NQOLfiJe
	MSVMsheWwt1AncXiXFYakNRnfONj/jq0AxJHQJ/AGEtmMT/U/6RpsjszMi8QfdWMt378Zj+e2f7ON
	YVWOqpSRhLIWK8IR9Hi/xnjvpSQl2hKXI5Zfp1IY+qQbHwdmjPHQb5C4NSsozMA0xlEqgKr3juIir
	4PctXbRsWTIu6H/XKRZ/NNQJ0WQDhXQbkFft5KU4/3BarMhNq63KgFQm92VB0wpyTdwaElGDk0pH6
	gl/HxJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIL4x-000gm2-2X; Mon, 01 Aug 2022 02:22:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIL4h-000gdv-8l; Mon, 01 Aug 2022 02:22:32 +0000
X-UUID: 93cb23414a1848ab826f6c94dd377fb1-20220731
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:93f48243-1d23-4f1a-b5c4-4ab9b6c2cfd5,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:5c24e024-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 93cb23414a1848ab826f6c94dd377fb1-20220731
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 318481695; Sun, 31 Jul 2022 19:22:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 1 Aug 2022 10:19:27 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 1 Aug 2022 10:19:25 +0800
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yi.kuo@mediatek.com>,
	<anthony.huang@mediatek.com>, <wendy-st.lin@mediatek.com>, Chengci.Xu
	<chengci.xu@mediatek.com>
Subject: [PATCH v4 3/4] memory: mtk-smi: Add enable IOMMU SMC command for MM master
Date: Mon, 1 Aug 2022 10:18:50 +0800
Message-ID: <20220801021851.7169-4-chengci.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220801021851.7169-1-chengci.xu@mediatek.com>
References: <20220801021851.7169-1-chengci.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220731_192231_336741_10BD7DF5 
X-CRM114-Status: GOOD (  15.74  )
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
 drivers/memory/mtk-smi.c                 | 19 +++++++++++++++++++
 include/linux/soc/mediatek/mtk_sip_svc.h |  3 +++
 include/soc/mediatek/smi.h               |  5 +++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 08c1668d47bf..28e1123f9d76 100644
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
+#define MTK_SMI_FLAG_CFG_PORT_SEC_CTL	BIT(3)
 #define MTK_SMI_CAPS(flags, _x)		(!!((flags) & (_x)))
 
 struct mtk_smi_reg_pair {
@@ -238,6 +241,7 @@ static int mtk_smi_larb_config_port_gen2_general(struct device *dev)
 	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
 	u32 reg, flags_general = larb->larb_gen->flags_general;
 	const u8 *larbostd = larb->larb_gen->ostd ? larb->larb_gen->ostd[larb->larbid] : NULL;
+	struct arm_smccc_res res;
 	int i;
 
 	if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
@@ -262,6 +266,21 @@ static int mtk_smi_larb_config_port_gen2_general(struct device *dev)
 		reg |= BANK_SEL(larb->bank[i]);
 		writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
 	}
+
+	/*
+	 * We still need to write above NONSEC_CON register for bank selection
+	 * even if enabling IOMMU is failed by SMC call. Otherwise, all master
+	 * will be configured to bank 0 with a state of IOMMU enable due to the
+	 * HW default value of register.
+	 */
+	if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_CFG_PORT_SEC_CTL)) {
+		arm_smccc_smc(MTK_SIP_KERNEL_IOMMU_CONTROL, IOMMU_ATF_CMD_CONFIG_SMI_LARB,
+			      larb->larbid, (u32)(*larb->mmu), 0, 0, 0, 0, &res);
+		if (res.a0 != 0) {
+			dev_err(dev, "Enable iommu fail, ret %ld\n", res.a0);
+			return -EINVAL;
+		}
+	}
 	return 0;
 }
 
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
index 11f7d6b59642..dfd8efca5e60 100644
--- a/include/soc/mediatek/smi.h
+++ b/include/soc/mediatek/smi.h
@@ -11,6 +11,11 @@
 
 #if IS_ENABLED(CONFIG_MTK_SMI)
 
+enum iommu_atf_cmd {
+	IOMMU_ATF_CMD_CONFIG_SMI_LARB,		/* For mm master to en/disable iommu */
+	IOMMU_ATF_CMD_MAX,
+};
+
 #define MTK_SMI_MMU_EN(port)	BIT(port)
 
 struct mtk_smi_larb_iommu {
-- 
2.25.1


