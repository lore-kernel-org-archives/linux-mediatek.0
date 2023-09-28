Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A61DE732C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 11:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTl+5rJDHXHaFhRSPKGBEYBBFhhWzNurSbbh6oNLLFM=; b=srTiLhausVQm7+Tvqwnas/H6Hu
	HVxyRhAvR0r6Tcfj1AtOlqE2n7+liJLLQsfTnaWmeNvlLfrl5+EmL29sAK/4KL9oXnPvLH10MZ3sy
	A0gxJzmSkfjSybBfAcmni1nLRySqD3bKmyfh8VsWI4/eEpJWzzT7TH2KjkWymKIIQ9NPCviTsEujK
	y56DCXoCEzXtFcS9jj0HI5Of1f4NE1lrsP9TqPuomAquzxF9CAsvr/oM8PX4l4Ja7jKbCABEc49vU
	tbxY6Sg3qLBfyNlMFkFdm0z4ojKtR94WFafSRhENlbZ9Z02hGA8KXVNIEDmZ46gXixihWjc9ygZPp
	S2UeDRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlou4-0036Ip-2V;
	Thu, 28 Sep 2023 11:09:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlotz-0036Fu-1S;
	Thu, 28 Sep 2023 11:09:54 +0000
X-UUID: 89d7e15c5def11ee9b7791016c24628a-20230928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eTl+5rJDHXHaFhRSPKGBEYBBFhhWzNurSbbh6oNLLFM=;
	b=jx9cZh2f2ONlu5gDTg+2O3UxGwmgXWZKwsJxjHPC7x6BZ7AKWknsyeid5o7ioo7n7YZ6AXLd6L+dMZdV6jYEpcaqBLLp4NXHZ+xFnui3HeFhfIrLW64T+6N2vow7m9SFtPQInJjGWJU9uP6OSTcXGrK2oo1+bbZSdl1s7Qfu58w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:c46759ec-8c4a-4e8f-b424-dfd49443775a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:4be63df0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 89d7e15c5def11ee9b7791016c24628a-20230928
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 580055528; Thu, 28 Sep 2023 04:09:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Sep 2023 18:59:12 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Sep 2023 18:59:11 +0800
From: Jian Yang <jian.yang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, Rob Herring <robh@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<Chuanjia.Liu@mediatek.com>, <Jieyy.Yang@mediatek.com>,
	<Qizhong.Cheng@mediatek.com>, <Jian.Yang@mediatek.com>, jian.yang
	<jian.yang@mediatek.com>
Subject: [PATCH v3 2/2] PCI: mediatek-gen3: Add power and reset control feature for downstream component
Date: Thu, 28 Sep 2023 18:58:22 +0800
Message-ID: <20230928105819.5161-3-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928105819.5161-1-jian.yang@mediatek.com>
References: <20230928105819.5161-1-jian.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.888800-8.000000
X-TMASE-MatchedRID: LTAc3o+XUF8kYRdjNXG/+XTnOygHVQpOmX+W7bzPOQHdyLGp/yhwWgoe
	ktpGiVj3mcuyb+ll2ykfKM+QT8rKpGhyvm9EcIhqk3ewifG2MNNCX8V1FiRRkt9RlPzeVuQQost
	SmZzTxtotz23lNbS2WkTQlgPQUcNkszLAY5oHhBCQOktEo73GFKX1XMd/SqvuNE5yhKhaSOqtbj
	X4EGqr77NyHVC04zQVHX4qwBWZhmIEshQLfIZrynV7tdtvoibauIQDHu9PGw7IvQIyugvKdfhTq
	8/WMstvw90VsoEgW724vmdMTUrXti7SCjRWRA7yngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIHm9g
	gFVoCcDu4f3bZWiBPMJZMKP/NAMokGveOWGf/ArhJ5aAtS3hZB6VAK3Ivyh9ftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.888800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 745D00A8C4D6B43D7943DEC9C409B8A90006EB607EE7240CACFF34509D9E55202000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_040951_508691_650293B6 
X-CRM114-Status: GOOD (  19.48  )
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

From: "jian.yang" <jian.yang@mediatek.com>

Make MediaTek's controller driver capable of controlling power
supplies and reset pin of a downstream component in power-on and
power-off flow.

Some downstream components (e.g., a WIFI chip) may need an extra
reset pin other than PERST# and their power supplies, depending on
the requirements of platform, may need to controlled by their
parent's driver. To meet the requirements described above, I add this
feature to MediaTek's PCIe controller driver as an optional feature.

Signed-off-by: jian.yang <jian.yang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 93 ++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index e0e27645fdf4..ad4b25c34f5d 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
@@ -20,6 +21,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeup.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
 #include "../pci.h"
@@ -100,6 +103,13 @@
 #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
 #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
 
+/* Downstream Component power supplies used by MediaTek PCIe */
+static const char *const dsc_power_supplies[] = {
+	"pcie1v8",
+	"pcie3v3",
+	"pcie12v",
+};
+
 /**
  * struct mtk_msi_set - MSI information for each set
  * @base: IO mapped register base
@@ -122,6 +132,9 @@ struct mtk_msi_set {
  * @phy: PHY controller block
  * @clks: PCIe clocks
  * @num_clks: PCIe clocks count for this port
+ * @supplies: Downstream Component power supplies
+ * @num_supplies: Downstream Component power supplies count
+ * @dsc_reset: The GPIO pin to reset Downstream component
  * @irq: PCIe controller interrupt number
  * @saved_irq_state: IRQ enable state saved at suspend time
  * @irq_lock: lock protecting IRQ register access
@@ -141,6 +154,9 @@ struct mtk_gen3_pcie {
 	struct phy *phy;
 	struct clk_bulk_data *clks;
 	int num_clks;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
+	struct gpio_desc *dsc_reset;
 
 	int irq;
 	u32 saved_irq_state;
@@ -763,7 +779,7 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource *regs;
-	int ret;
+	int ret, i;
 
 	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
 	if (!regs)
@@ -809,14 +825,86 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 		return pcie->num_clks;
 	}
 
+	pcie->num_supplies = ARRAY_SIZE(dsc_power_supplies);
+	pcie->supplies = devm_kcalloc(dev, pcie->num_supplies,
+				      sizeof(*pcie->supplies),
+				      GFP_KERNEL);
+	if (!pcie->supplies)
+		return -ENOMEM;
+
+	for (i = 0; i < pcie->num_supplies; i++)
+		pcie->supplies[i].supply = dsc_power_supplies[i];
+
+	ret = devm_regulator_bulk_get(dev, pcie->num_supplies, pcie->supplies);
+	if (ret)
+		return ret;
+
+	pcie->dsc_reset = devm_gpiod_get_optional(dev, "dsc-reset",
+						  GPIOD_OUT_LOW);
+	if (IS_ERR(pcie->dsc_reset)) {
+		ret = PTR_ERR(pcie->dsc_reset);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to request DSC reset gpio\n");
+
+		return ret;
+	}
+
 	return 0;
 }
 
+static int mtk_pcie_dsc_power_up(struct mtk_gen3_pcie *pcie)
+{
+	struct device *dev = pcie->dev;
+	int ret;
+
+	/*
+	 * Skip downstream component's power-up flow if it was kept power-on
+	 * while system entered suspend state
+	 */
+	if (device_wakeup_path(dev))
+		return 0;
+
+	/* Assert Downstream Component reset */
+	if (pcie->dsc_reset)
+		gpiod_set_value_cansleep(pcie->dsc_reset, 1);
+
+	ret = regulator_bulk_enable(pcie->num_supplies, pcie->supplies);
+	if (ret)
+		dev_err(dev, "failed to enable DSC power supplies: %d\n", ret);
+
+	/* De-assert Downstream Component reset */
+	if (pcie->dsc_reset)
+		gpiod_set_value_cansleep(pcie->dsc_reset, 0);
+
+	return ret;
+}
+
+static void mtk_pcie_dsc_power_down(struct mtk_gen3_pcie *pcie)
+{
+	/*
+	 * Keep downstream component power-on if it need to wake up the
+	 * system in suspend state
+	 */
+	if (device_wakeup_path(pcie->dev))
+		return;
+
+	/* Assert Downstream Component reset */
+	if (pcie->dsc_reset)
+		gpiod_set_value_cansleep(pcie->dsc_reset, 1);
+
+	regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
+}
+
 static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
 	int err;
 
+	/* Downstream Component power up before RC */
+	err = mtk_pcie_dsc_power_up(pcie);
+	if (err)
+		return err;
+
 	/* PHY power on and enable pipe clock */
 	reset_control_deassert(pcie->phy_reset);
 
@@ -855,6 +943,7 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
 	phy_exit(pcie->phy);
 err_phy_init:
 	reset_control_assert(pcie->phy_reset);
+	mtk_pcie_dsc_power_down(pcie);
 
 	return err;
 }
@@ -870,6 +959,8 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
 	phy_power_off(pcie->phy);
 	phy_exit(pcie->phy);
 	reset_control_assert(pcie->phy_reset);
+
+	mtk_pcie_dsc_power_down(pcie);
 }
 
 static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
-- 
2.18.0


