From: weiyj_lk@163.com
Subject: [PATCH] MIPS: pci-mt7620: Fix return value check in mt7620_pci_probe()
Date: Sat,  6 Feb 2016 22:24:19 +0800
Message-ID: <1454768659-32720-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <blogic@openwrt.org>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-mips@linux-mips.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function devm_ioremap_resource() returns
ERR_PTR() and never returns NULL. The NULL test in the return
value check should be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 arch/mips/pci/pci-mt7620.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/pci/pci-mt7620.c b/arch/mips/pci/pci-mt7620.c
index a009ee4..044c1cd 100644
--- a/arch/mips/pci/pci-mt7620.c
+++ b/arch/mips/pci/pci-mt7620.c
@@ -297,12 +297,12 @@ static int mt7620_pci_probe(struct platform_device *pdev)
 		return PTR_ERR(rstpcie0);
 
 	bridge_base = devm_ioremap_resource(&pdev->dev, bridge_res);
-	if (!bridge_base)
-		return -ENOMEM;
+	if (IS_ERR(bridge_base))
+		return PTR_ERR(bridge_base);
 
 	pcie_base = devm_ioremap_resource(&pdev->dev, pcie_res);
-	if (!pcie_base)
-		return -ENOMEM;
+	if (IS_ERR(pcie_base))
+		return PTR_ERR(pcie_base);
 
 	iomem_resource.start = 0;
 	iomem_resource.end = ~0;
