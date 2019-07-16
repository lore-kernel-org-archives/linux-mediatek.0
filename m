From: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] staging: mt7621-pci: Add of_node_put() before return
Date: Tue, 16 Jul 2019 11:29:44 +0530
Message-ID: <20190716055944.3237-1-nishkadg.linux@gmail.com>
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
To: gregkh@linuxfoundation.org, matthias.bgg@gmail.com, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Each iteration of for_each_available_child_of_node puts the previous
node, but in the case of a return from the middle of the loop, there is
no put, thus causing a memory leak. Hence add an of_node_put before the
return in two places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 89fa813142ab..2e37fd136ab8 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -400,6 +400,7 @@ static int mt7621_pcie_parse_dt(struct mt7621_pcie *pcie)
 
 		err = of_pci_get_devfn(child);
 		if (err < 0) {
+			of_node_put(child);
 			dev_err(dev, "failed to parse devfn: %d\n", err);
 			return err;
 		}
@@ -407,8 +408,10 @@ static int mt7621_pcie_parse_dt(struct mt7621_pcie *pcie)
 		slot = PCI_SLOT(err);
 
 		err = mt7621_pcie_parse_port(pcie, child, slot);
-		if (err)
+		if (err) {
+			of_node_put(child);
 			return err;
+		}
 	}
 
 	return 0;
-- 
2.19.1
