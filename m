Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF70C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 06:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0B6/XL3DbH7On3ZlTeFQisMTApe4VM/2ap32sf9A48=; b=paiBQKJSq1v4yl0MZPdZ5xqhdC
	EyWv7Kacin1Wq2ZXE6/aFEF5Ux19OEK4gENATYpwzA8xTOl1bVjPAtPj+aZCXcLIntrPnFBWj1OCV
	5VivbOmisU+dw6O43Fvfttq4BOD7ZtXsYUkEcupUVAbJdGxGx+XB33UGns3jnmJu9NzUJ32qu0D/5
	c+kIe2ury0JyLuzHW55SHBCnV0Y6AF4PhujlnYq9YEnADJi6NzGDcaxoK8EbTp9zcC51BLT9OyYwI
	yDTd/yE1aPhNqEy0bkRec+3UmhzdtAYiCHRPd/OFV/Xmfq2pjYlfiZ8g1emIGh2xAxOgxP4KkSewj
	lDLRQZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ4h0-00BaUR-Tv; Mon, 06 Mar 2023 06:51:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ4gp-00BaT3-1P; Mon, 06 Mar 2023 06:51:20 +0000
X-UUID: 49ceb622bbeb11edbbe3f76fe852e059-20230305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=a0B6/XL3DbH7On3ZlTeFQisMTApe4VM/2ap32sf9A48=;
	b=NUDUWu1lc1s2nI1g+5OfwqnscJWIoOdD+UumJy49SPYBaUFrE/WVha1a2IVAl9JcQn6Wuprs+VBp1l9yHVGKHCUK0r6TmjeffYcGNet/D34sJUrOzKVXL6t/q1YOnz5IeHOPEJf5VkakDjKF2mx00bmtmXJhHMP0POJ9ECYOIZk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:28cf0a06-7448-4dfa-805b-3ec0387c78d4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:25b5999,CLOUDID:6cba7027-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 49ceb622bbeb11edbbe3f76fe852e059-20230305
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1873572734; Sun, 05 Mar 2023 23:51:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 6 Mar 2023 14:41:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 6 Mar 2023 14:41:11 +0800
From: Jian Yang <jian.yang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Jianjun Wang <jianjun.wang@mediatek.com>, "Rob
 Herring" <robh@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jian.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
	<jieyy.yang@mediatek.com>, <qizhong.cheng@mediatek.com>
Subject: [PATCH v2 2/2] PCI: mediatek-gen3: Add power and reset control feature for downstream component
Date: Mon, 6 Mar 2023 14:40:59 +0800
Message-ID: <20230306064059.7239-3-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306064059.7239-1-jian.yang@mediatek.com>
References: <20230306064059.7239-1-jian.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_225119_125054_E5CE1D22 
X-CRM114-Status: GOOD (  18.73  )
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
reset other than PERST# and their power supplies, depending on
the requirements of platform, may need to controlled by their
parent's driver. To meet the requirements described above, I add this
feature to MediaTek's PCIe controller driver as a optional feature.

Signed-off-by: jian.yang <jian.yang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 86 ++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b8612ce5f4d0..45e368b03ed2 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -8,6 +8,8 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
@@ -15,11 +17,14 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/msi.h>
+#include <linux/of_gpio.h>
 #include <linux/pci.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeup.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
 #include "../pci.h"
@@ -100,6 +105,13 @@
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
@@ -122,6 +134,9 @@ struct mtk_msi_set {
  * @phy: PHY controller block
  * @clks: PCIe clocks
  * @num_clks: PCIe clocks count for this port
+ * @supplies: Downstream Component power supplies
+ * @num_supplies: Downstream Component power supplies count
+ * @dsc_reset: The GPIO pin to reset Downstream component
  * @irq: PCIe controller interrupt number
  * @saved_irq_state: IRQ enable state saved at suspend time
  * @irq_lock: lock protecting IRQ register access
@@ -141,6 +156,9 @@ struct mtk_gen3_pcie {
 	struct phy *phy;
 	struct clk_bulk_data *clks;
 	int num_clks;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
+	struct gpio_desc *dsc_reset;
 
 	int irq;
 	u32 saved_irq_state;
@@ -763,7 +781,7 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource *regs;
-	int ret;
+	int ret, i;
 
 	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
 	if (!regs)
@@ -809,14 +827,72 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
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
 
@@ -855,6 +931,7 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
 	phy_exit(pcie->phy);
 err_phy_init:
 	reset_control_assert(pcie->phy_reset);
+	mtk_pcie_dsc_power_down(pcie);
 
 	return err;
 }
@@ -870,6 +947,13 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
 	phy_power_off(pcie->phy);
 	phy_exit(pcie->phy);
 	reset_control_assert(pcie->phy_reset);
+
+	/*
+	 * Keep downstream component powered on if it might need to wake up the
+	 * system in suspend state
+	 */
+	if (!pcie->dev->power.is_suspended || !device_wakeup_path(pcie->dev))
+		mtk_pcie_dsc_power_down(pcie);
 }
 
 static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
-- 
2.18.0


