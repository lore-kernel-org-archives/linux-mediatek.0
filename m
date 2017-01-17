From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] mtd: nand: mediatek: remove redundant dev_err call in mtk_nfc_probe()
Date: Tue, 17 Jan 2017 14:22:46 +0000
Message-ID: <20170117142246.9607-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

From: Wei Yongjun <weiyongjun1@huawei.com>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mtd/nand/mtk_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
index 6c3eed3..6c517c6 100644
--- a/drivers/mtd/nand/mtk_nand.c
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -1383,7 +1383,6 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	nfc->regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(nfc->regs)) {
 		ret = PTR_ERR(nfc->regs);
-		dev_err(dev, "no nfi base\n");
 		goto release_ecc;
 	}
 
