From: Krzysztof Wilczynski <kw@linux.com>
Subject: [PATCH] PCI: mediatek: Remove surplus return from a void function
Date: Mon, 26 Aug 2019 00:10:39 +0200
Message-ID: <20190825221039.6977-1-kw@linux.com>
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
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <helgaas@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Remove unnecessary empty return statement at the
end of a void function mtk_pcie_intr_handler() in
the drivers/pci/controller/pcie-mediatek.c.

The surplus return statement was added as part of
the work in commit 42fe2f91b4eb ("PCI: mediatek:
Implement chained IRQ handling setup").

Signed-off-by: Krzysztof Wilczynski <kw@linux.com>
---
 drivers/pci/controller/pcie-mediatek.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 3eaa7081ab2a..626a7c352dfd 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -635,8 +635,6 @@ static void mtk_pcie_intr_handler(struct irq_desc *desc)
 	}
 
 	chained_irq_exit(irqchip, desc);
-
-	return;
 }
 
 static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
-- 
2.22.1
