From: Abdun Nihaal <abdun.nihaal@gmail.com>
Subject: [PATCH 5/7] staging: mt7621-pci: add spaces around equal symbol
Date: Sun,  3 Jun 2018 21:30:02 +0530
Message-ID: <1e90044ff2eff4012fbdf546607354074a580fcf.1528040188.git.abdun.nihaal@gmail.com>
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

ERROR: spaces required around that '=' (ctx:VxW)

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index f347eaf9063c..3bd715a4b139 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -308,7 +308,7 @@ pci_config_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u
 	}
 }
 
-struct pci_ops mt7621_pci_ops= {
+struct pci_ops mt7621_pci_ops = {
 	.read		=  pci_config_read,
 	.write		= pci_config_write,
 };
@@ -584,8 +584,8 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 	unsigned long val = 0;
 
 	iomem_resource.start = 0;
-	iomem_resource.end= ~0;
-	ioport_resource.start= 0;
+	iomem_resource.end = ~0;
+	ioport_resource.start = 0;
 	ioport_resource.end = ~0;
 
 #if defined (CONFIG_PCIE_PORT0)
-- 
2.17.0
