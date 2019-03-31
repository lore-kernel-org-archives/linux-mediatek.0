From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [v2 PATCH] PCI: mediatek: get optional clock by devm_clk_get_optional()
Date: Sun, 31 Mar 2019 20:41:03 +0800
Message-ID: <1554036063-1381-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, Honghui Zhang <honghui.zhang@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Use devm_clk_get_optional() to get optional clock

Cc: Ryder Lee <ryder.lee@mediatek.com>
Cc: Honghui Zhang <honghui.zhang@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2:
  1. cc Ryder and Honghui
  2. fix up omitted 'if (IS_ERR())'
---
 drivers/pci/controller/pcie-mediatek.c | 50 ++++++++------------------
 1 file changed, 15 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 0b6c72804e03..adb6cb15daa2 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -915,49 +915,29 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
 
 	/* sys_ck might be divided into the following parts in some chips */
 	snprintf(name, sizeof(name), "ahb_ck%d", slot);
-	port->ahb_ck = devm_clk_get(dev, name);
-	if (IS_ERR(port->ahb_ck)) {
-		if (PTR_ERR(port->ahb_ck) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		port->ahb_ck = NULL;
-	}
+	port->ahb_ck = devm_clk_get_optional(dev, name);
+	if (IS_ERR(port->ahb_ck))
+		return PTR_ERR(port->ahb_ck);
 
 	snprintf(name, sizeof(name), "axi_ck%d", slot);
-	port->axi_ck = devm_clk_get(dev, name);
-	if (IS_ERR(port->axi_ck)) {
-		if (PTR_ERR(port->axi_ck) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		port->axi_ck = NULL;
-	}
+	port->axi_ck = devm_clk_get_optional(dev, name);
+	if (IS_ERR(port->axi_ck))
+		return PTR_ERR(port->axi_ck);
 
 	snprintf(name, sizeof(name), "aux_ck%d", slot);
-	port->aux_ck = devm_clk_get(dev, name);
-	if (IS_ERR(port->aux_ck)) {
-		if (PTR_ERR(port->aux_ck) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		port->aux_ck = NULL;
-	}
+	port->aux_ck = devm_clk_get_optional(dev, name);
+	if (IS_ERR(port->aux_ck))
+		return PTR_ERR(port->aux_ck);
 
 	snprintf(name, sizeof(name), "obff_ck%d", slot);
-	port->obff_ck = devm_clk_get(dev, name);
-	if (IS_ERR(port->obff_ck)) {
-		if (PTR_ERR(port->obff_ck) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		port->obff_ck = NULL;
-	}
+	port->obff_ck = devm_clk_get_optional(dev, name);
+	if (IS_ERR(port->obff_ck))
+		return PTR_ERR(port->obff_ck);
 
 	snprintf(name, sizeof(name), "pipe_ck%d", slot);
-	port->pipe_ck = devm_clk_get(dev, name);
-	if (IS_ERR(port->pipe_ck)) {
-		if (PTR_ERR(port->pipe_ck) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		port->pipe_ck = NULL;
-	}
+	port->pipe_ck = devm_clk_get_optional(dev, name);
+	if (IS_ERR(port->pipe_ck))
+		return PTR_ERR(port->pipe_ck);
 
 	snprintf(name, sizeof(name), "pcie-rst%d", slot);
 	port->reset = devm_reset_control_get_optional_exclusive(dev, name);
-- 
2.20.1
