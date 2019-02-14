From: <honghui.zhang@mediatek.com>
Subject: [RFC PATCH v2] PCI/portdrv: Support for subtractive decode bridge
Date: Thu, 14 Feb 2019 13:21:17 +0800
Message-ID: <1550121677-10474-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, matthias.bgg@gmail.com
Cc: youlin.pei@mediatek.com, poza@codeaurora.org, fred@fredlawl.com, rafael.j.wysocki@intel.com, jianjun.wang@mediatek.com, Honghui Zhang <honghui.zhang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Honghui Zhang <honghui.zhang@mediatek.com>

The Class Code for subtractive decode PCI-to-PCI bridge is 060401h,
add one entry to make portdrv support this type bridge.

Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
---
 drivers/pci/pcie/portdrv_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/pcie/portdrv_pci.c b/drivers/pci/pcie/portdrv_pci.c
index 0acca35..c129f2f 100644
--- a/drivers/pci/pcie/portdrv_pci.c
+++ b/drivers/pci/pcie/portdrv_pci.c
@@ -185,6 +185,8 @@ static void pcie_portdrv_err_resume(struct pci_dev *dev)
 static const struct pci_device_id port_pci_ids[] = { {
 	/* handle any PCI-Express port */
 	PCI_DEVICE_CLASS(((PCI_CLASS_BRIDGE_PCI << 8) | 0x00), ~0),
+	/* subtractive decode PCI-to-PCI bridge, class type is 060401h */
+	PCI_DEVICE_CLASS(((PCI_CLASS_BRIDGE_PCI << 8) | 0x01), ~0),
 	}, { /* end: all zeroes */ }
 };
 
-- 
2.6.4
