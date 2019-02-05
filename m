From: wen yang <yellowriver2010@hotmail.com>
Subject: [PATCH] mtd: rawnand: mtk: fix object reference leaks in mtk_ecc_get
Date: Tue, 5 Feb 2019 10:05:46 +0000
Message-ID: <HK0PR02MB36345BDC344D1A6FE77B4576B26E0@HK0PR02MB3634.apcprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: "xiaolei.li@mediatek.com" <xiaolei.li@mediatek.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>
Cc: wen yang <yellowriver2010@hotmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

of_find_device_by_node() takes a reference to the struct device
when it finds a match via get_device, there is no need to call
get_device() twice.
We also should make sure to drop the reference to the device
taken by of_find_device_by_node() on driver unbind.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Signed-off-by: Wen Yang <yellowriver2010@hotmail.com>
Suggested-by: Boris Brezillon <bbrezillon@kernel.org>
Cc: Xiaolei Li <xiaolei.li@mediatek.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/nand/raw/mtk_ecc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
index 6432bd7..25bdc15 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.c
+++ b/drivers/mtd/nand/raw/mtk_ecc.c
@@ -265,17 +265,25 @@ static struct mtk_ecc *mtk_ecc_get(struct device_node *np)
 {
 	struct platform_device *pdev;
 	struct mtk_ecc *ecc;
+	int ret;
 
 	pdev = of_find_device_by_node(np);
-	if (!pdev || !platform_get_drvdata(pdev))
+	if (!pdev)
 		return ERR_PTR(-EPROBE_DEFER);
+	if (!platform_get_drvdata(pdev)) {
+		ret = -EPROBE_DEFER;
+		goto err_put_device;
+	}
 
-	get_device(&pdev->dev);
 	ecc = platform_get_drvdata(pdev);
 	clk_prepare_enable(ecc->clk);
 	mtk_ecc_hw_init(ecc);
 
 	return ecc;
+
+err_put_device:
+	put_device(&pdev->dev);
+	return ERR_PTR(ret);
 }
 
 struct mtk_ecc *of_mtk_ecc_get(struct device_node *of_node)
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
