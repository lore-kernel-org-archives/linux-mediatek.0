From: Wen Yang <yellowriver2010@hotmail.com>
Subject: [PATCH v3 3/3] mtd: rawnand: mtk: fix possible object reference leak
Date: Thu, 7 Feb 2019 03:52:42 +0000
Message-ID: <HK0PR02MB363405B62123937DC17F33B6B2680@HK0PR02MB3634.apcprd02.prod.outlook.com>
References: <1549511278-7735-1-git-send-email-yellowriver2010@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1549511278-7735-1-git-send-email-yellowriver2010@hotmail.com>
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
To: "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Wen Yang <yellowriver2010@hotmail.com>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Xiaolei Li <xiaolei.li@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

of_find_device_by_node() takes a reference to the struct device
when it finds a match via get_device, there is no need to call
get_device() twice.
We also should make sure to drop the reference to the device
taken by of_find_device_by_node() on driver unbind.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Signed-off-by: Wen Yang <yellowriver2010@hotmail.com>
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
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
v3->v2: Avoid two times of calling grtform_get_drvdata()
v2->v1: Since there is the only one user, let's remove the err_put_device label.

 drivers/mtd/nand/raw/mtk_ecc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
index 6432bd7..db804fe 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.c
+++ b/drivers/mtd/nand/raw/mtk_ecc.c
@@ -267,11 +267,14 @@ static struct mtk_ecc *mtk_ecc_get(struct device_node *np)
 	struct mtk_ecc *ecc;
 
 	pdev = of_find_device_by_node(np);
-	if (!pdev || !platform_get_drvdata(pdev))
+	if (!pdev)
 		return ERR_PTR(-EPROBE_DEFER);
-
-	get_device(&pdev->dev);
 	ecc = platform_get_drvdata(pdev);
+	if (!ecc) {
+		put_device(&pdev->dev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
 	clk_prepare_enable(ecc->clk);
 	mtk_ecc_hw_init(ecc);
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
