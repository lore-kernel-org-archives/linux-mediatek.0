From: Armando Miraglia <arma2ff0@gmail.com>
Subject: [PATCH] dma: mediatek: addres minor style issues flagged by
 clang-format.
Date: Sun, 17 Mar 2019 09:44:45 +0100
Message-ID: <20190317084443.158913-1-armax@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: matthias.bgg@gmail.com, neil@brown.name
Cc: devel@driverdev.osuosl.org, jbi.octave@gmail.com, gustavo@embeddedor.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Armando Miraglia <armax@google.com>, linux-mediatek@lists.infradead.org, bhanusreemahesh@gmail.com, christian@lkamp.de, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Running clang-format on mtk-hsdma.c I noticed that few lines would not
need to be wrapped, since they fit 80 columns. This change changes such
lines to better fit the style-guide.

Signed-off-by: Armando Miraglia <armax@google.com>
---
 drivers/staging/mt7621-dma/mtk-hsdma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
index 97571f1d697b..74c374f7bef4 100644
--- a/drivers/staging/mt7621-dma/mtk-hsdma.c
+++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
@@ -264,8 +264,7 @@ static void mtk_hsdma_reset(struct mtk_hsdam_engine *hsdma,
 	/* init desc value */
 	for (i = 0; i < HSDMA_DESCS_NUM; i++) {
 		chan->tx_ring[i].addr0 = 0;
-		chan->tx_ring[i].flags = HSDMA_DESC_LS0 |
-			HSDMA_DESC_DONE;
+		chan->tx_ring[i].flags = HSDMA_DESC_LS0 | HSDMA_DESC_DONE;
 	}
 	for (i = 0; i < HSDMA_DESCS_NUM; i++) {
 		chan->rx_ring[i].addr0 = 0;
@@ -435,8 +434,7 @@ static irqreturn_t mtk_hsdma_irq(int irq, void *devid)
 	if (likely(status & HSDMA_INT_RX_Q0))
 		tasklet_schedule(&hsdma->task);
 	else
-		dev_dbg(hsdma->ddev.dev, "unhandle irq status %08x\n",
-			status);
+		dev_dbg(hsdma->ddev.dev, "unhandle irq status %08x\n", status);
 	/* clean intr bits */
 	mtk_hsdma_write(hsdma, HSDMA_REG_INT_STATUS, status);
 
-- 
2.21.0.360.g471c308f928-goog
