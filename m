From: <honghui.zhang@mediatek.com>
Subject: [RFC PATCH] PCI/portdrv: Support for subtractive decode bridge
Date: Fri, 14 Dec 2018 11:40:29 +0800
Message-ID: <1544758829-10327-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, matthias.bgg@gmail.com
Cc: rafael.j.wysocki@intel.com, fred@fredlawl.com, poza@codeaurora.org, youlin.pei@mediatek.com, jianjun.wang@mediatek.com, Honghui Zhang <honghui.zhang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Honghui Zhang <honghui.zhang@mediatek.com>

The Class Code for subtractive decode PCI-to-PCI bridge is 060401h,
change the class_mask values to make portdrv support this type bridge.

Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
---
 drivers/pci/pcie/portdrv_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/portdrv_pci.c b/drivers/pci/pcie/portdrv_pci.c
index eef22dc..86926ea 100644
--- a/drivers/pci/pcie/portdrv_pci.c
+++ b/drivers/pci/pcie/portdrv_pci.c
@@ -179,7 +179,7 @@ static void pcie_portdrv_err_resume(struct pci_dev *dev)
  */
 static const struct pci_device_id port_pci_ids[] = { {
 	/* handle any PCI-Express port */
-	PCI_DEVICE_CLASS(((PCI_CLASS_BRIDGE_PCI << 8) | 0x00), ~0),
+	PCI_DEVICE_CLASS(((PCI_CLASS_BRIDGE_PCI << 8) | 0x00), ~0x01),
 	}, { /* end: all zeroes */ }
 };
 
-- 
2.6.4
