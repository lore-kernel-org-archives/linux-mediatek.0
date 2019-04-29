From: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: [PATCH 2/5] mtd: rawnand: mtk: Improve data sampling timing for read
 cycle
Date: Mon, 29 Apr 2019 14:38:31 +0800
Message-ID: <20190429063834.45967-3-xiaolei.li@mediatek.com>
References: <20190429063834.45967-1-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190429063834.45967-1-xiaolei.li@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: miquel.raynal@bootlin.com, richard@nod.at
Cc: linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com, linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Currently, we expand RE# low level time by choosing the max value
between RE# pulse width and RE# access time, and sample data at the
rising edge of RE#.

Then, if RE# access time is bigger than RE# pulse width, the real
read cycle time may be more than NAND SPEC required. This makes
read performance be worse than that expected.

This patch improves data sampling timing by calculating RE# low level
time according to RE# pulse width. If RE# access time is bigger than
RE# pulse width, then delay sampling data timing.

The result of contrast test base on MT2712 evaluat board is as follow.

nand: Micron MT29F16G08ADBCAH4
nand: 2048 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 224

NFI 2x clock rate: 124800000 HZ.

Test tool: mtd_speedtest.ko

Read speed without this patch:
mtd_speedtest: page read speed is 14012 KiB/s
mtd_speedtest: 2 page read speed is 14860 KiB/s

Read speed with this patch:
mtd_speedtest: page read speed is 18724 KiB/s
mtd_speedtest: 2 page read speed is 18713 KiB/s

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index dd855f860a4b..a2f7af536380 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -87,6 +87,10 @@
 #define NFI_FDMM(x)		(0xA4 + (x) * sizeof(u32) * 2)
 #define NFI_FDM_MAX_SIZE	(8)
 #define NFI_FDM_MIN_SIZE	(1)
+#define NFI_DEBUG_CON1		(0x220)
+#define		STROBE_MASK		GENMASK(4, 3)
+#define		STROBE_SHIFT		(3)
+#define		MAX_STROBE_DLY		(3)
 #define NFI_MASTER_STA		(0x224)
 #define		MASTER_STA_MASK		(0x0FFF)
 #define NFI_EMPTY_THRESH	(0x23C)
@@ -509,6 +513,7 @@ static int mtk_nfc_setup_data_interface(struct nand_chip *chip, int csline,
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
 	const struct nand_sdr_timings *timings;
 	u32 rate, tpoecs, tprecs, tc2r, tw2r, twh, twst = 0, trlt = 0;
+	u32 tsel, reg;
 
 	timings = nand_get_sdr_timings(conf);
 	if (IS_ERR(timings))
@@ -556,10 +561,25 @@ static int mtk_nfc_setup_data_interface(struct nand_chip *chip, int csline,
 	if ((twh + 1) * 1000000 / rate < timings->tRC_min / 1000)
 		trlt = (timings->tRC_min / 1000 - (twh + 1) * 1000000 / rate)
 			* 1000;
-	trlt = max3(trlt, timings->tREA_max, timings->tRP_min) / 1000;
+	trlt = max(trlt, timings->tRP_min) / 1000;
 	trlt = DIV_ROUND_UP(trlt * rate, 1000000) - 1;
 	trlt &= 0xf;
 
+	/* Calculate strobe sel */
+	reg = nfi_readl(nfc, NFI_DEBUG_CON1);
+	reg &= ~STROBE_MASK;
+	if ((trlt + 1) * 1000000 / rate < timings->tREA_max / 1000) {
+		tsel = timings->tREA_max / 1000;
+		tsel = DIV_ROUND_UP(tsel * rate, 1000000);
+		tsel -= (trlt + 1);
+		if (tsel > MAX_STROBE_DLY) {
+			trlt += tsel - MAX_STROBE_DLY;
+			tsel = MAX_STROBE_DLY;
+		}
+		reg |= tsel << STROBE_SHIFT;
+	}
+	nfi_writel(nfc, reg, NFI_DEBUG_CON1);
+
 	/*
 	 * ACCON: access timing control register
 	 * -------------------------------------
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
