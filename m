From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Subject: [PATCH] staging: mt7621-pci: pci-mt7621: Remove unneeded variable err
Date: Fri, 24 May 2019 00:05:10 +0530
Message-ID: <20190523183510.GA12942@hari-Inspiron-1545>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: reg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Mamta Shukla <mamtashukla555@gmail.com>, NeilBrown <neil@brown.name>, Peter Vernia <peter.vernia@gmail.com>, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

devm_request_pci_bus_resources function will return -EBUSY/-ENOMEM
in fail case and returns 0 on success.

So no need to store return value in err variable.

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 03d919a..bc2a3d1 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -596,17 +596,12 @@ static int mt7621_pcie_request_resources(struct mt7621_pcie *pcie,
 					 struct list_head *res)
 {
 	struct device *dev = pcie->dev;
-	int err;
 
 	pci_add_resource_offset(res, &pcie->io, pcie->offset.io);
 	pci_add_resource_offset(res, &pcie->mem, pcie->offset.mem);
 	pci_add_resource(res, &pcie->busn);
 
-	err = devm_request_pci_bus_resources(dev, res);
-	if (err < 0)
-		return err;
-
-	return 0;
+	return devm_request_pci_bus_resources(dev, res);
 }
 
 static int mt7621_pcie_register_host(struct pci_host_bridge *host,
-- 
2.7.4
