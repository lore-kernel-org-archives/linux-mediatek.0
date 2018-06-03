From: Abdun Nihaal <abdun.nihaal@gmail.com>
Subject: [PATCH 6/7] staging: mt7621-pci: add space after '==' symbol
Date: Sun,  3 Jun 2018 21:30:03 +0530
Message-ID: <e02b77f8a6eff5d66b68999252d304102860d082.1528040188.git.abdun.nihaal@gmail.com>
References: <cover.1528040188.git.abdun.nihaal@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <cover.1528040188.git.abdun.nihaal@gmail.com>
In-Reply-To: <cover.1528040188.git.abdun.nihaal@gmail.com>
References: <cover.1528040188.git.abdun.nihaal@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, neil@brown.name, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

This fixes the following checkpatch error:

ERROR: spaces required around that '==' (ctx:WxV)

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 3bd715a4b139..510aa633589a 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -417,13 +417,13 @@ pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 			irq = RALINK_INT_PCIE1;
 		}
 		printk("bus=0x%x, slot = 0x%x, irq=0x%x\n", dev->bus->number, slot, dev->irq);
-	} else if ((dev->bus->number ==3) && (slot == 0x0)) {
+	} else if ((dev->bus->number == 3) && (slot == 0x0)) {
 		irq = RALINK_INT_PCIE2;
 		printk("bus=0x%x, slot = 0x%x, irq=0x%x\n", dev->bus->number, slot, dev->irq);
-	} else if ((dev->bus->number ==3) && (slot == 0x1)) {
+	} else if ((dev->bus->number == 3) && (slot == 0x1)) {
 		irq = RALINK_INT_PCIE2;
 		printk("bus=0x%x, slot = 0x%x, irq=0x%x\n", dev->bus->number, slot, dev->irq);
-	} else if ((dev->bus->number ==3) && (slot == 0x2)) {
+	} else if ((dev->bus->number == 3) && (slot == 0x2)) {
 		irq = RALINK_INT_PCIE2;
 		printk("bus=0x%x, slot = 0x%x, irq=0x%x\n", dev->bus->number, slot, dev->irq);
 	} else {
-- 
2.17.0
