Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A6DFF4937
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2026 03:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fJgKS+xYGiuhM4C+jM+iQKuLmgPvl+plPrkSGwo6cRo=; b=a9qJC8smVlMTqNXPE424gETKEY
	uMt03+IWEy5L85z1K5yRnDYd1EJBI4/v31zmtDgIfg0E3XvZoigwU5mrdkxt5kD0PzoNVAibrAIRK
	s/k9Q5iFlMM7KHu4/Xu5sCDtW8gew9C+LFxoni6isu0RTLscCs0GH7aSKBNbnz96PADIexpnHo0mF
	uwjdcCHMs9dRALcfwNBh80A3UYXnnA+YQYux94jbhgmm44o8sLTP3sE/5fAU+V6pMoc61HMoxEBUS
	7CmB6erUHRP6I8t9qDc/iPKOmHHiQhSL85AORqoCst4j/1aSR11TSEyuiq9cuAOw/7JR0rNROYDze
	h8URK4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7m7C-0000000Dt8t-2bYl;
	Wed, 01 Apr 2026 03:19:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7m7A-0000000Dt7s-2y87
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Apr 2026 03:19:33 +0000
X-UUID: 95ad78b42d7911f19e7563141e833ce8-20260331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fJgKS+xYGiuhM4C+jM+iQKuLmgPvl+plPrkSGwo6cRo=;
	b=TE27jW/I0mntBGLlvtKAZeX3Ckx1mUHM+lg3X91qfTDpC0FAJjxeWoPCHJfXVm1o7C+uP8XpGESNc1zeGjACth6CHzNpsSS4mKLSsbmGnqbZaD4EmRjWwZG4wXXR6ZLPMMQNL6MMhoaxDeMy94Esx9tZ6I09JcIRTKqYdHq7hxo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1ed51f11-29fb-401b-8d78-8c8c07bf6ba2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:962a75a7-e101-400a-acb5-0dbb5a913469,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 95ad78b42d7911f19e7563141e833ce8-20260331
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1517237534; Tue, 31 Mar 2026 20:19:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 1 Apr 2026 11:19:22 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 1 Apr 2026 11:19:21 +0800
From: Jian Yang <jian.yang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jian.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
	<yonglong.wu@mediatek.com>
Subject: [PATCH v1] PCI: mediatek-gen3: Align PERST# sequence with PCIe CEM specification
Date: Wed, 1 Apr 2026 11:16:42 +0800
Message-ID: <20260401031917.9108-1-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_201932_752882_79290BB5 
X-CRM114-Status: GOOD (  19.24  )
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

Fix the control sequence of PERST# during system bootup/shutdown to
meet the requirement from PCIe CEM specification. There are two major
changes in this patch:

1. Some of MediaTek's chip will stop generating REFCLK if the
PCIE_PHY_RSTB signal of PCIe controller is asserted. We have to
adjust the startup sequence as follows to ensure that PERST# will be
de-asserted after the REFCLK is stable:
Assert PHY reset and PERST# -> delay 10ms -> De-assert PHY reset ->
delay 100ms -> De-assert PERST#

2. Add 'shutdown' callback to control the timing of PERST# and power
during the system shutdown phase, ensuring that PERST# is active
before the power on connector is removed.

Signed-off-by: Jian Yang <jian.yang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 39 +++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index a94fdbaf47fe..66d177918565 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -62,6 +62,7 @@
 #define PCIE_PHY_RSTB			BIT(1)
 #define PCIE_BRG_RSTB			BIT(2)
 #define PCIE_PE_RSTB			BIT(3)
+#define PCIE_BRG_RST_RDY_MS		10
 
 #define PCIE_LTSSM_STATUS_REG		0x150
 #define PCIE_LTSSM_STATE_MASK		GENMASK(28, 24)
@@ -133,6 +134,7 @@
 #define MAX_NUM_PHY_RESETS		3
 
 #define PCIE_MTK_RESET_TIME_US		10
+#define PCIE_MTK_PDN_PERST_TIME_MS	5
 
 /* Time in ms needed to complete PCIe reset on EN7581 SoC */
 #define PCIE_EN7581_RESET_TIME_MS	100
@@ -430,6 +432,21 @@ static int mtk_pcie_devices_power_up(struct mtk_gen3_pcie *pcie)
 		return err;
 	}
 
+	/*
+	 * Some of MediaTek's chips won't output REFCLK when PCIE_PHY_RSTB is
+	 * asserted, we have to de-assert MAC & PHY & BRG reset signals first
+	 * to allow the REFCLK to be stable. While PCIE_BRG_RSTB is asserted,
+	 * there is a short period during which the PCIe internal register
+	 * cannot be accessed, so we need to wait 10ms here.
+	 */
+	msleep(PCIE_BRG_RST_RDY_MS);
+
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
+		/* De-assert MAC, PHY and BRG reset signals */
+		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB);
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
+
 	/*
 	 * Described in PCIe CEM specification revision 6.0.
 	 *
@@ -439,9 +456,8 @@ static int mtk_pcie_devices_power_up(struct mtk_gen3_pcie *pcie)
 	msleep(PCIE_T_PVPERL_MS);
 
 	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
-		/* De-assert reset signals */
-		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
-			 PCIE_PE_RSTB);
+		/* De-assert PERST# signal */
+		val &= ~PCIE_PE_RSTB;
 		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
 	}
 
@@ -459,6 +475,14 @@ static void mtk_pcie_devices_power_down(struct mtk_gen3_pcie *pcie)
 		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
 	}
 
+	/*
+	 * Described in PCIe CEM specification revision 6.0.
+	 *
+	 * The PERST# gose active before the power on the connector is removed.
+	 * Wait a while to ensure the voltage transition of PERST# is completed.
+	 */
+	msleep(PCIE_MTK_PDN_PERST_TIME_MS);
+
 	pci_pwrctrl_power_off_devices(pcie->dev);
 }
 
@@ -1266,6 +1290,14 @@ static void mtk_pcie_remove(struct platform_device *pdev)
 	mtk_pcie_irq_teardown(pcie);
 }
 
+static void mtk_pcie_shutdown(struct platform_device *pdev)
+{
+	struct mtk_gen3_pcie *pcie = platform_get_drvdata(pdev);
+
+	mtk_pcie_devices_power_down(pcie);
+	mtk_pcie_power_down(pcie);
+}
+
 static void mtk_pcie_irq_save(struct mtk_gen3_pcie *pcie)
 {
 	int i;
@@ -1404,6 +1436,7 @@ MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);
 static struct platform_driver mtk_pcie_driver = {
 	.probe = mtk_pcie_probe,
 	.remove = mtk_pcie_remove,
+	.shutdown = mtk_pcie_shutdown,
 	.driver = {
 		.name = "mtk-pcie-gen3",
 		.of_match_table = mtk_pcie_of_match,
-- 
2.45.2


