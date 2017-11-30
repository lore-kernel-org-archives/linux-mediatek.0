From: Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH 1/5] mtd: nand: use usual return values for the ->erase() hook
Date: Thu, 30 Nov 2017 18:01:28 +0100
Message-ID: <20171130170132.27522-2-miquel.raynal@free-electrons.com>
References: <20171130170132.27522-1-miquel.raynal@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20171130170132.27522-1-miquel.raynal@free-electrons.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Hanna Hawa <hannah@marvell.com>, Stefan Agner <stefan@agner.ch>, Nadav Haklai <nadavh@marvell.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, devel@driverdev.osuosl.org, Maxim Levitsky <maximlevitsky@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-mediatek@lists.infradead.org, Miquel Raynal <miquel.raynal@free-electrons.com>, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>, Ofer Heifetz <oferh@marvell.com>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundati>
List-Id: linux-mediatek@lists.infradead.org

Avoid using specific defined values for checking returned status of the
->erase() hook. Instead, use usual negative error values on failure,
zero otherwise.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/denali.c    | 2 +-
 drivers/mtd/nand/docg4.c     | 7 ++++++-
 drivers/mtd/nand/nand_base.c | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 34008a02ddb0..3e19861a46c6 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -951,7 +951,7 @@ static int denali_erase(struct mtd_info *mtd, int page)
 	irq_status = denali_wait_for_irq(denali,
 					 INTR__ERASE_COMP | INTR__ERASE_FAIL);
 
-	return irq_status & INTR__ERASE_COMP ? 0 : NAND_STATUS_FAIL;
+	return irq_status & INTR__ERASE_COMP ? 0 : -EIO;
 }
 
 static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 2436cbc71662..45c01b4b34c7 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -900,6 +900,7 @@ static int docg4_erase_block(struct mtd_info *mtd, int page)
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 	void __iomem *docptr = doc->virtadr;
 	uint16_t g4_page;
+	int status;
 
 	dev_dbg(doc->dev, "%s: page %04x\n", __func__, page);
 
@@ -939,7 +940,11 @@ static int docg4_erase_block(struct mtd_info *mtd, int page)
 	poll_status(doc);
 	write_nop(docptr);
 
-	return nand->waitfunc(mtd, nand);
+	status = nand->waitfunc(mtd, nand);
+	if (status < 0)
+		return status;
+
+	return status & NAND_STATUS_FAIL ? -EIO : 0;
 }
 
 static int write_page(struct mtd_info *mtd, struct nand_chip *nand,
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 630048f5abdc..4d1f2bda6095 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3077,7 +3077,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		status = chip->erase(mtd, page & chip->pagemask);
 
 		/* See if block erase succeeded */
-		if (status & NAND_STATUS_FAIL) {
+		if (status) {
 			pr_debug("%s: failed erase, page 0x%08x\n",
 					__func__, page);
 			instr->state = MTD_ERASE_FAILED;
-- 
2.11.0
