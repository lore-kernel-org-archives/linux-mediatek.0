Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B29C25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 13:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkW74FUiX04blR8OZENKGUJWhe+uyUA9KxhSmXum+Aw=; b=XoI0aKMADoYK0K3aFI36wdlKGB
	WP835i8twrfr5iiBoqIOx48rBvmQiZfroO8kXITtNnHfqBgvUMyNW6P4JzU1WrCoVRBu2N+dJbyfm
	Df04SPjUUzY1aY49QTRv5w4+dorbgwP72XTD2nflOBTAUpn6fgjURO70FuntW0v8IysKsszqM1Rzb
	6KoqpQRRv+6vluPpOIaXcqAW5jYLqeJm9TLw3tgO6ZOoof1lb+so40+uy3/qzFpIWhG41UloEpY5y
	u+n0HwpTOPGSyecHCnheHfK+qXQpLAfzQFVFg53GYGaRM6rhXxftaCG9QaCEB8mSnmtbrRUtI1hvY
	oIFYZUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJ7d-002Oos-Q2; Wed, 17 Aug 2022 13:30:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJ7S-002OjT-QP; Wed, 17 Aug 2022 13:30:04 +0000
X-UUID: e783d4eabb5d46c88bbb43e601202879-20220817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vkW74FUiX04blR8OZENKGUJWhe+uyUA9KxhSmXum+Aw=;
	b=uqAMb86+hTNrdWDfIu6FkK5i1ay4SdhpjK3JMpCAzbsISPW5zu+oF0Wu81eY7dIuhzSKZZJXbI0YrcnMz328Jy8mO6vBpp/hOOjxxnVm/3B//U1aD2aINBHQMn/mCQ503r3mKlr3ogD0nzSlzYj1hyAW6nvxR1L5r6DiTssydV4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:8976533b-4b72-4d43-aeac-fefd1c0c8cc2,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:264c97fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e783d4eabb5d46c88bbb43e601202879-20220817
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1076786887; Wed, 17 Aug 2022 06:29:55 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 17 Aug 2022 20:49:02 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 17 Aug 2022 20:49:01 +0800
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yi.kuo@mediatek.com>,
	<anthony.huang@mediatek.com>, <wendy-st.lin@mediatek.com>, Chengci.Xu
	<chengci.xu@mediatek.com>
Subject: [PATCH v5 3/4] memory: mtk-smi: Add enable IOMMU SMC command for MM master
Date: Wed, 17 Aug 2022 20:46:07 +0800
Message-ID: <20220817124608.10062-4-chengci.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817124608.10062-1-chengci.xu@mediatek.com>
References: <20220817124608.10062-1-chengci.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_063003_103909_0CA37242 
X-CRM114-Status: GOOD (  17.51  )
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
 drivers/memory/mtk-smi.c                 | 18 ++++++++++++++++++
 include/linux/soc/mediatek/mtk_sip_svc.h |  3 +++
 include/soc/mediatek/smi.h               |  5 +++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 7e97406ab4a3..73a8a9867082 100644
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
@@ -256,6 +260,20 @@ static int mtk_smi_larb_config_port_gen2_general(struct device *dev)
 	for (i = 0; i < SMI_LARB_PORT_NR_MAX && larbostd && !!larbostd[i]; i++)
 		writel_relaxed(larbostd[i], larb->base + SMI_LARB_OSTDL_PORTx(i));
 
+	/*
+	 * When mmu_en bits are in security world, the bank_sel still is in the
+	 * LARB_NONSEC_CON below. And the mmu_en bits of LARB_NONSEC_CON have no
+	 * effect in this case.
+	 */
+	if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_CFG_PORT_SEC_CTL)) {
+		arm_smccc_smc(MTK_SIP_KERNEL_IOMMU_CONTROL, IOMMU_ATF_CMD_CONFIG_SMI_LARB,
+			      larb->larbid, *larb->mmu, 0, 0, 0, 0, &res);
+		if (res.a0 != 0) {
+			dev_err(dev, "Enable iommu fail, ret %ld\n", res.a0);
+			return -EINVAL;
+		}
+	}
+
 	for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
 		reg = readl_relaxed(larb->base + SMI_LARB_NONSEC_CON(i));
 		reg |= F_MMU_EN;
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


