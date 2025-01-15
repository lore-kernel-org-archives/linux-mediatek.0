Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18659C02183
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2025 17:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmGKfjxlT4o2JIXj1sDT8bEwEwluKLzjBiwPR0kyOwQ=; b=v7YCD1pU/3xBwPz64RSBakZtsi
	f2UndZHf+V2092GfH0b3J0SJmFX0CswGMK+23WC5XSR+3rpwS6xTC9Zu8FfmZAZg7xQyuh1D0hu5m
	/A9NVEjzBtraIOQCzM2Lq35F3ws+LHbS5pcD9RfPnWyJHfioHyMDPKI+4AN1pPcZ0V3gkgFgk3m0/
	IBSi7fzzKOiWdnSQ33ym63J1cgjETkCkIp4f+99dmFyfnZqLAFUMrtlnSE8KNuJ7bWBu8xKwPrAyv
	KXaXBL2yv4nenvVQ3Ew7+UYSjzPxa71iMK3Jbpui/EsVrEI/oO0nb5VUeOl+aw8vIi5RkYFjnQYaS
	9Aq0k6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7Lm-0000000Cd4Y-0kZh;
	Wed, 15 Jan 2025 17:38:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7Gr-0000000Cc53-0z5g;
	Wed, 15 Jan 2025 17:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6AF80A41E80;
	Wed, 15 Jan 2025 17:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FE2C4CED1;
	Wed, 15 Jan 2025 17:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736962416;
	bh=X1iUr4Z3xOp2+2SXrinRazhxNTDYDO8wPhrfSPaaZSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZeqyiJwQ9iZpAtxKr6wN9eWfGdHiYrJgQL5e7HznK240KZxasrQt6U6xrrjw5YbeB
	 KL8uk4SpYvjRObFhZbtlabjwjceDWuzBI/6sVKgRxReM7ddari+RbEHrr4rVsRaZml
	 +9j5GSHQlAARPemjSdclwryAtAJ743Ql6dNyiYy7MwZaH2exoCf5V/fBsRmHtMJfpS
	 27lCE+0/Di4H6Wr6ej36NGPwHlkZPX7JGTcbb+dx3KH0u36EIE9u1HYWvlQ0KDbUMe
	 GcOIEYVAe+TEAXcOjRFlxfUeXndppK0g8ArtOSBBvUYFN7hqPIj580FA/QGhJHKWF3
	 jcmomyEPWN2tQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Jan 2025 18:32:31 +0100
Subject: [PATCH 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers for
 EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-en7581-pcie-pbus-csr-v1-2-40d8fcb9360f@kernel.org>
References: <20250115-en7581-pcie-pbus-csr-v1-0-40d8fcb9360f@kernel.org>
In-Reply-To: <20250115-en7581-pcie-pbus-csr-v1-0-40d8fcb9360f@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_093337_416405_D8C6AFC8 
X-CRM114-Status: GOOD (  14.23  )
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

Configure PBus base address and address mask in order to allow the hw
detecting if a given address is on PCIE0, PCIE1 or PCIE2.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index aa24ac9aaecc749b53cfc4faf6399913d20cdbf2..b172a46cf95a9c728291c5b7a88457d3b725681a 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -15,6 +15,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of_device.h>
@@ -24,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "../pci.h"
@@ -127,6 +129,13 @@
 
 #define PCIE_MTK_RESET_TIME_US		10
 
+#define PCIE_EN7581_PBUS_ADDR(_n)	(0x00 + ((_n) << 3))
+#define PCIE_EN7581_PBUS_ADDR_MASK(_n)	(0x04 + ((_n) << 3))
+#define PCIE_EN7581_PBUS_BASE_ADDR(_n)	\
+	((_n) == 2 ? 0x28000000 :	\
+	 (_n) == 1 ? 0x24000000 : 0x20000000)
+#define PCIE_EN7581_PBUS_BASE_ADDR_MASK	GENMASK(31, 26)
+
 /* Time in ms needed to complete PCIe reset on EN7581 SoC */
 #define PCIE_EN7581_RESET_TIME_MS	100
 
@@ -931,7 +940,8 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
-	int err;
+	struct regmap *map;
+	int err, slot;
 	u32 val;
 
 	/*
@@ -945,6 +955,23 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	/* Wait for the time needed to complete the reset lines assert. */
 	msleep(PCIE_EN7581_RESET_TIME_MS);
 
+	map = syscon_regmap_lookup_by_compatible("airoha,en7581-pbus-csr");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	/*
+	 * Configure PBus base address and address mask in order to allow the
+	 * hw detecting if a given address is on PCIE0, PCIE1 or PCIE2.
+	 */
+	slot = of_get_pci_domain_nr(dev->of_node);
+	if (slot < 0)
+		return slot;
+
+	regmap_write(map, PCIE_EN7581_PBUS_ADDR(slot),
+		     PCIE_EN7581_PBUS_BASE_ADDR(slot));
+	regmap_write(map, PCIE_EN7581_PBUS_ADDR_MASK(slot),
+		     PCIE_EN7581_PBUS_BASE_ADDR_MASK);
+
 	/*
 	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
 	 * requires PHY initialization and power-on before PHY reset deassert.

-- 
2.48.0


