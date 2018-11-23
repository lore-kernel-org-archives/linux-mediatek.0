From: <qii.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] i2c: mediatek: Add driver for MediaTek MT8183 I2C controller
Date: Fri, 23 Nov 2018 16:05:30 +0800
Message-ID: <1542960330-28839-1-git-send-email-qii.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: qii wang <qii.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: qii wang <qii.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add mediatek MT8183 I2C controller driver. Compare to I2C controller
of earlier mediatek SoC, MT8183 has different registers, offsets, clock,
and add multi-user function.

Change-Id: I6027787c978f1f2e4a923095bfc46e971879d1a6
Signed-off-by: qii wang <qii.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/i2c/busses/i2c-mt65xx.c |  279 ++++++++++++++++++++++++++++++---------
 1 file changed, 214 insertions(+), 65 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index a74ef76..5b515c8 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -35,22 +35,26 @@
 #include <linux/slab.h>
 
 #define I2C_RS_TRANSFER			(1 << 4)
+#define I2C_ARB_LOST			(1 << 3)
 #define I2C_HS_NACKERR			(1 << 2)
 #define I2C_ACKERR			(1 << 1)
 #define I2C_TRANSAC_COMP		(1 << 0)
 #define I2C_TRANSAC_START		(1 << 0)
+#define I2C_RESUME_ARBIT		(1 << 1)
 #define I2C_RS_MUL_CNFG			(1 << 15)
 #define I2C_RS_MUL_TRIG			(1 << 14)
 #define I2C_DCM_DISABLE			0x0000
 #define I2C_IO_CONFIG_OPEN_DRAIN	0x0003
 #define I2C_IO_CONFIG_PUSH_PULL		0x0000
 #define I2C_SOFT_RST			0x0001
-#define I2C_FIFO_ADDR_CLR		0x0001
+#define I2C_FIFO_ADDR_CLR		0x0003
+#define I2C_HFIFO_DATA			0x8208
+#define I2C_FIFO_ADDR_CLR_MCH		0x0004
 #define I2C_DELAY_LEN			0x0002
 #define I2C_ST_START_CON		0x8001
 #define I2C_FS_START_CON		0x1800
 #define I2C_TIME_CLR_VALUE		0x0000
-#define I2C_TIME_DEFAULT_VALUE		0x0003
+#define I2C_TIME_DEFAULT_VALUE		0x0083
 #define I2C_WRRD_TRANAC_VALUE		0x0002
 #define I2C_RD_TRANAC_VALUE		0x0001
 
@@ -76,6 +80,8 @@
 #define I2C_CONTROL_DIR_CHANGE          (0x1 << 4)
 #define I2C_CONTROL_ACKERR_DET_EN       (0x1 << 5)
 #define I2C_CONTROL_TRANSFER_LEN_CHANGE (0x1 << 6)
+#define I2C_CONTROL_DMAACK_EN           (0x1 << 8)
+#define I2C_CONTROL_ASYNC_MODE          (0x1 << 9)
 #define I2C_CONTROL_WRAPPER             (0x1 << 0)
 
 #define I2C_DRV_NAME		"i2c-mt65xx"
@@ -106,34 +112,104 @@ enum mtk_trans_op {
 };
 
 enum I2C_REGS_OFFSET {
-	OFFSET_DATA_PORT = 0x0,
-	OFFSET_SLAVE_ADDR = 0x04,
-	OFFSET_INTR_MASK = 0x08,
-	OFFSET_INTR_STAT = 0x0c,
-	OFFSET_CONTROL = 0x10,
-	OFFSET_TRANSFER_LEN = 0x14,
-	OFFSET_TRANSAC_LEN = 0x18,
-	OFFSET_DELAY_LEN = 0x1c,
-	OFFSET_TIMING = 0x20,
-	OFFSET_START = 0x24,
-	OFFSET_EXT_CONF = 0x28,
-	OFFSET_FIFO_STAT = 0x30,
-	OFFSET_FIFO_THRESH = 0x34,
-	OFFSET_FIFO_ADDR_CLR = 0x38,
-	OFFSET_IO_CONFIG = 0x40,
-	OFFSET_RSV_DEBUG = 0x44,
-	OFFSET_HS = 0x48,
-	OFFSET_SOFTRESET = 0x50,
-	OFFSET_DCM_EN = 0x54,
-	OFFSET_PATH_DIR = 0x60,
-	OFFSET_DEBUGSTAT = 0x64,
-	OFFSET_DEBUGCTRL = 0x68,
-	OFFSET_TRANSFER_LEN_AUX = 0x6c,
-	OFFSET_CLOCK_DIV = 0x70,
+	OFFSET_DATA_PORT,
+	OFFSET_SLAVE_ADDR,
+	OFFSET_INTR_MASK,
+	OFFSET_INTR_STAT,
+	OFFSET_CONTROL,
+	OFFSET_TRANSFER_LEN,
+	OFFSET_TRANSAC_LEN,
+	OFFSET_DELAY_LEN,
+	OFFSET_TIMING,
+	OFFSET_START,
+	OFFSET_EXT_CONF,
+	OFFSET_FIFO_STAT,
+	OFFSET_FIFO_THRESH,
+	OFFSET_FIFO_ADDR_CLR,
+	OFFSET_IO_CONFIG,
+	OFFSET_RSV_DEBUG,
+	OFFSET_HS,
+	OFFSET_SOFTRESET,
+	OFFSET_DCM_EN,
+	OFFSET_PATH_DIR,
+	OFFSET_DEBUGSTAT,
+	OFFSET_DEBUGCTRL,
+	OFFSET_TRANSFER_LEN_AUX,
+	OFFSET_CLOCK_DIV,
+	/* MT8183 only regs */
+	OFFSET_LTIMING,
+	OFFSET_DATA_TIMING,
+	OFFSET_MCU_INTR,
+	OFFSET_HW_TIMEOUT,
+	OFFSET_HFIFO_DATA,
+	OFFSET_HFIFO_STAT,
+	OFFSET_MULTI_DMA,
+	OFFSET_ROLLBACK,
+};
+
+static const u16 mt_i2c_regs_v1[] = {
+	[OFFSET_DATA_PORT] = 0x0,
+	[OFFSET_SLAVE_ADDR] = 0x4,
+	[OFFSET_INTR_MASK] = 0x8,
+	[OFFSET_INTR_STAT] = 0xc,
+	[OFFSET_CONTROL] = 0x10,
+	[OFFSET_TRANSFER_LEN] = 0x14,
+	[OFFSET_TRANSAC_LEN] = 0x18,
+	[OFFSET_DELAY_LEN] = 0x1c,
+	[OFFSET_TIMING] = 0x20,
+	[OFFSET_START] = 0x24,
+	[OFFSET_EXT_CONF] = 0x28,
+	[OFFSET_FIFO_STAT] = 0x30,
+	[OFFSET_FIFO_THRESH] = 0x34,
+	[OFFSET_FIFO_ADDR_CLR] = 0x38,
+	[OFFSET_IO_CONFIG] = 0x40,
+	[OFFSET_RSV_DEBUG] = 0x44,
+	[OFFSET_HS] = 0x48,
+	[OFFSET_SOFTRESET] = 0x50,
+	[OFFSET_DCM_EN] = 0x54,
+	[OFFSET_PATH_DIR] = 0x60,
+	[OFFSET_DEBUGSTAT] = 0x64,
+	[OFFSET_DEBUGCTRL] = 0x68,
+	[OFFSET_TRANSFER_LEN_AUX] = 0x6c,
+	[OFFSET_CLOCK_DIV] = 0x70,
+};
+
+static const u16 mt_i2c_regs_v2[] = {
+	[OFFSET_DATA_PORT] = 0x0,
+	[OFFSET_SLAVE_ADDR] = 0x4,
+	[OFFSET_INTR_MASK] = 0x8,
+	[OFFSET_INTR_STAT] = 0xc,
+	[OFFSET_CONTROL] = 0x10,
+	[OFFSET_TRANSFER_LEN] = 0x14,
+	[OFFSET_TRANSAC_LEN] = 0x18,
+	[OFFSET_DELAY_LEN] = 0x1c,
+	[OFFSET_TIMING] = 0x20,
+	[OFFSET_START] = 0x24,
+	[OFFSET_EXT_CONF] = 0x28,
+	[OFFSET_LTIMING] = 0x2c,
+	[OFFSET_HS] = 0x30,
+	[OFFSET_IO_CONFIG] = 0x34,
+	[OFFSET_FIFO_ADDR_CLR] = 0x38,
+	[OFFSET_DATA_TIMING] = 0x3c,
+	[OFFSET_MCU_INTR] = 0x40,
+	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
+	[OFFSET_CLOCK_DIV] = 0x48,
+	[OFFSET_HW_TIMEOUT] = 0x4c,
+	[OFFSET_SOFTRESET] = 0x50,
+	[OFFSET_HFIFO_DATA] = 0x70,
+	[OFFSET_DEBUGSTAT] = 0xe0,
+	[OFFSET_DEBUGCTRL] = 0xe8,
+	[OFFSET_FIFO_STAT] = 0xf4,
+	[OFFSET_FIFO_THRESH] = 0xf8,
+	[OFFSET_HFIFO_STAT] = 0xfc,
+	[OFFSET_DCM_EN] = 0xf88,
+	[OFFSET_MULTI_DMA] = 0xf8c,
+	[OFFSET_ROLLBACK] = 0xf98,
 };
 
 struct mtk_i2c_compatible {
 	const struct i2c_adapter_quirks *quirks;
+	const u16 *regs;
 	unsigned char pmic_i2c: 1;
 	unsigned char dcm: 1;
 	unsigned char auto_restart: 1;
@@ -153,8 +229,10 @@ struct mtk_i2c {
 	struct clk *clk_main;		/* main clock for i2c bus */
 	struct clk *clk_dma;		/* DMA clock for i2c via DMA */
 	struct clk *clk_pmic;		/* PMIC clock for i2c from PMIC */
+	struct clk *clk_arb;		/* Arbitrator clock for i2c */
 	bool have_pmic;			/* can use i2c pins from PMIC */
 	bool use_push_pull;		/* IO config push-pull mode */
+	u32 ch_offset;			/* i2c multi-user channel offset */
 
 	u16 irq_stat;			/* interrupt status */
 	unsigned int clk_src_div;
@@ -162,6 +240,7 @@ struct mtk_i2c {
 	enum mtk_trans_op op;
 	u16 timing_reg;
 	u16 high_speed_reg;
+	u16 ltiming_reg;
 	unsigned char auto_restart;
 	bool ignore_restart_irq;
 	const struct mtk_i2c_compatible *dev_comp;
@@ -181,6 +260,7 @@ struct mtk_i2c {
 };
 
 static const struct mtk_i2c_compatible mt2712_compat = {
+	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 0,
 	.dcm = 1,
 	.auto_restart = 1,
@@ -191,6 +271,7 @@ struct mtk_i2c {
 
 static const struct mtk_i2c_compatible mt6577_compat = {
 	.quirks = &mt6577_i2c_quirks,
+	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 0,
 	.dcm = 1,
 	.auto_restart = 0,
@@ -201,6 +282,7 @@ struct mtk_i2c {
 
 static const struct mtk_i2c_compatible mt6589_compat = {
 	.quirks = &mt6577_i2c_quirks,
+	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 1,
 	.dcm = 0,
 	.auto_restart = 0,
@@ -211,6 +293,7 @@ struct mtk_i2c {
 
 static const struct mtk_i2c_compatible mt7622_compat = {
 	.quirks = &mt7622_i2c_quirks,
+	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 0,
 	.dcm = 1,
 	.auto_restart = 1,
@@ -220,6 +303,7 @@ struct mtk_i2c {
 };
 
 static const struct mtk_i2c_compatible mt8173_compat = {
+	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 0,
 	.dcm = 1,
 	.auto_restart = 1,
@@ -228,16 +312,38 @@ struct mtk_i2c {
 	.timing_adjust = 0,
 };
 
+static const struct mtk_i2c_compatible mt8183_compat = {
+	.regs = mt_i2c_regs_v2,
+	.pmic_i2c = 0,
+	.dcm = 0,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.support_33bits = 1,
+	.timing_adjust = 1,
+};
+
 static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt2712-i2c", .data = &mt2712_compat },
 	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
 	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
 	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
+	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_i2c_of_match);
 
+static u16 mtk_i2c_readw(struct mtk_i2c *i2c, enum I2C_REGS_OFFSET reg)
+{
+	return readw(i2c->base + i2c->ch_offset + i2c->dev_comp->regs[reg]);
+}
+
+static void mtk_i2c_writew(struct mtk_i2c *i2c, u16 val,
+			   enum I2C_REGS_OFFSET reg)
+{
+	writew(val, i2c->base + i2c->ch_offset + i2c->dev_comp->regs[reg]);
+}
+
 static int mtk_i2c_clock_enable(struct mtk_i2c *i2c)
 {
 	int ret;
@@ -255,8 +361,18 @@ static int mtk_i2c_clock_enable(struct mtk_i2c *i2c)
 		if (ret)
 			goto err_pmic;
 	}
+
+	if (i2c->clk_arb != NULL) {
+		ret = clk_prepare_enable(i2c->clk_arb);
+		if (ret)
+			goto err_arb;
+	}
+
 	return 0;
 
+err_arb:
+	if (i2c->have_pmic)
+		clk_disable_unprepare(i2c->clk_pmic);
 err_pmic:
 	clk_disable_unprepare(i2c->clk_main);
 err_main:
@@ -267,6 +383,9 @@ static int mtk_i2c_clock_enable(struct mtk_i2c *i2c)
 
 static void mtk_i2c_clock_disable(struct mtk_i2c *i2c)
 {
+	if (i2c->clk_arb != NULL)
+		clk_disable_unprepare(i2c->clk_arb);
+
 	if (i2c->have_pmic)
 		clk_disable_unprepare(i2c->clk_pmic);
 
@@ -278,31 +397,40 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 {
 	u16 control_reg;
 
-	writew(I2C_SOFT_RST, i2c->base + OFFSET_SOFTRESET);
+	mtk_i2c_writew(i2c, I2C_SOFT_RST, OFFSET_SOFTRESET);
 
 	/* Set ioconfig */
 	if (i2c->use_push_pull)
-		writew(I2C_IO_CONFIG_PUSH_PULL, i2c->base + OFFSET_IO_CONFIG);
+		mtk_i2c_writew(i2c, I2C_IO_CONFIG_PUSH_PULL, OFFSET_IO_CONFIG);
 	else
-		writew(I2C_IO_CONFIG_OPEN_DRAIN, i2c->base + OFFSET_IO_CONFIG);
+		mtk_i2c_writew(i2c, I2C_IO_CONFIG_OPEN_DRAIN, OFFSET_IO_CONFIG);
 
 	if (i2c->dev_comp->dcm)
-		writew(I2C_DCM_DISABLE, i2c->base + OFFSET_DCM_EN);
+		mtk_i2c_writew(i2c, I2C_DCM_DISABLE, OFFSET_DCM_EN);
+
+	if (i2c->ch_offset)
+		writew(I2C_RESUME_ARBIT, i2c->base +
+					 i2c->dev_comp->regs[OFFSET_START]);
 
 	if (i2c->dev_comp->timing_adjust)
-		writew(I2C_DEFAULT_CLK_DIV - 1, i2c->base + OFFSET_CLOCK_DIV);
+		mtk_i2c_writew(i2c, (I2C_DEFAULT_CLK_DIV - 1) |
+				    (I2C_DEFAULT_CLK_DIV - 1) << 8,
+				    OFFSET_CLOCK_DIV);
 
-	writew(i2c->timing_reg, i2c->base + OFFSET_TIMING);
-	writew(i2c->high_speed_reg, i2c->base + OFFSET_HS);
+	mtk_i2c_writew(i2c, i2c->timing_reg, OFFSET_TIMING);
+	mtk_i2c_writew(i2c, i2c->high_speed_reg, OFFSET_HS);
+	if (i2c->dev_comp->regs == mt_i2c_regs_v2)
+		mtk_i2c_writew(i2c, i2c->ltiming_reg, OFFSET_LTIMING);
 
 	/* If use i2c pin from PMIC mt6397 side, need set PATH_DIR first */
 	if (i2c->have_pmic)
-		writew(I2C_CONTROL_WRAPPER, i2c->base + OFFSET_PATH_DIR);
+		mtk_i2c_writew(i2c, I2C_CONTROL_WRAPPER, OFFSET_PATH_DIR);
 
-	control_reg = I2C_CONTROL_ACKERR_DET_EN |
-		      I2C_CONTROL_CLK_EXT_EN | I2C_CONTROL_DMA_EN;
-	writew(control_reg, i2c->base + OFFSET_CONTROL);
-	writew(I2C_DELAY_LEN, i2c->base + OFFSET_DELAY_LEN);
+	control_reg = I2C_CONTROL_ACKERR_DET_EN | I2C_CONTROL_DMAACK_EN |
+		      I2C_CONTROL_CLK_EXT_EN | I2C_CONTROL_DMA_EN |
+		      I2C_CONTROL_ASYNC_MODE;
+	mtk_i2c_writew(i2c, control_reg, OFFSET_CONTROL);
+	mtk_i2c_writew(i2c, I2C_DELAY_LEN, OFFSET_DELAY_LEN);
 
 	writel(I2C_DMA_HARD_RST, i2c->pdmabase + OFFSET_RST);
 	udelay(50);
@@ -390,6 +518,8 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 	unsigned int clk_src;
 	unsigned int step_cnt;
 	unsigned int sample_cnt;
+	unsigned int l_step_cnt;
+	unsigned int l_sample_cnt;
 	unsigned int target_speed;
 	int ret;
 
@@ -399,11 +529,11 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 	if (target_speed > MAX_FS_MODE_SPEED) {
 		/* Set master code speed register */
 		ret = mtk_i2c_calculate_speed(i2c, clk_src, MAX_FS_MODE_SPEED,
-					      &step_cnt, &sample_cnt);
+					      &l_step_cnt, &l_sample_cnt);
 		if (ret < 0)
 			return ret;
 
-		i2c->timing_reg = (sample_cnt << 8) | step_cnt;
+		i2c->timing_reg = (l_sample_cnt << 8) | l_step_cnt;
 
 		/* Set the high speed mode register */
 		ret = mtk_i2c_calculate_speed(i2c, clk_src, target_speed,
@@ -413,6 +543,8 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 
 		i2c->high_speed_reg = I2C_TIME_DEFAULT_VALUE |
 			(sample_cnt << 12) | (step_cnt << 8);
+		i2c->ltiming_reg = (l_sample_cnt << 6) | l_step_cnt |
+				   (sample_cnt << 12) | (step_cnt << 9);
 	} else {
 		ret = mtk_i2c_calculate_speed(i2c, clk_src, target_speed,
 					      &step_cnt, &sample_cnt);
@@ -423,6 +555,8 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 
 		/* Disable the high speed transaction */
 		i2c->high_speed_reg = I2C_TIME_CLR_VALUE;
+
+		i2c->ltiming_reg = (sample_cnt << 6) | step_cnt;
 	}
 
 	return 0;
@@ -454,7 +588,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 
 	reinit_completion(&i2c->msg_complete);
 
-	control_reg = readw(i2c->base + OFFSET_CONTROL) &
+	control_reg = mtk_i2c_readw(i2c, OFFSET_CONTROL) &
 			~(I2C_CONTROL_DIR_CHANGE | I2C_CONTROL_RS);
 	if ((i2c->speed_hz > 400000) || (left_num >= 1))
 		control_reg |= I2C_CONTROL_RS;
@@ -462,40 +596,47 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 	if (i2c->op == I2C_MASTER_WRRD)
 		control_reg |= I2C_CONTROL_DIR_CHANGE | I2C_CONTROL_RS;
 
-	writew(control_reg, i2c->base + OFFSET_CONTROL);
+	mtk_i2c_writew(i2c, control_reg, OFFSET_CONTROL);
 
 	/* set start condition */
 	if (i2c->speed_hz <= 100000)
-		writew(I2C_ST_START_CON, i2c->base + OFFSET_EXT_CONF);
+		mtk_i2c_writew(i2c, I2C_ST_START_CON, OFFSET_EXT_CONF);
 	else
-		writew(I2C_FS_START_CON, i2c->base + OFFSET_EXT_CONF);
+		mtk_i2c_writew(i2c, I2C_FS_START_CON, OFFSET_EXT_CONF);
 
 	addr_reg = i2c_8bit_addr_from_msg(msgs);
-	writew(addr_reg, i2c->base + OFFSET_SLAVE_ADDR);
+	mtk_i2c_writew(i2c, addr_reg, OFFSET_SLAVE_ADDR);
 
 	/* Clear interrupt status */
-	writew(restart_flag | I2C_HS_NACKERR | I2C_ACKERR |
-	       I2C_TRANSAC_COMP, i2c->base + OFFSET_INTR_STAT);
-	writew(I2C_FIFO_ADDR_CLR, i2c->base + OFFSET_FIFO_ADDR_CLR);
+	mtk_i2c_writew(i2c, restart_flag | I2C_HS_NACKERR | I2C_ACKERR |
+			    I2C_ARB_LOST | I2C_TRANSAC_COMP,
+			    OFFSET_INTR_STAT);
+
+	mtk_i2c_writew(i2c, I2C_FIFO_ADDR_CLR_MCH | I2C_FIFO_ADDR_CLR,
+			    OFFSET_FIFO_ADDR_CLR);
+
+	if ((i2c->speed_hz > 400000) && (i2c->dev_comp->regs == mt_i2c_regs_v2))
+		mtk_i2c_writew(i2c, I2C_HFIFO_DATA, OFFSET_HFIFO_DATA);
 
 	/* Enable interrupt */
-	writew(restart_flag | I2C_HS_NACKERR | I2C_ACKERR |
-	       I2C_TRANSAC_COMP, i2c->base + OFFSET_INTR_MASK);
+	mtk_i2c_writew(i2c, restart_flag | I2C_HS_NACKERR | I2C_ACKERR |
+			    I2C_ARB_LOST | I2C_TRANSAC_COMP,
+			    OFFSET_INTR_MASK);
 
 	/* Set transfer and transaction len */
 	if (i2c->op == I2C_MASTER_WRRD) {
 		if (i2c->dev_comp->aux_len_reg) {
-			writew(msgs->len, i2c->base + OFFSET_TRANSFER_LEN);
-			writew((msgs + 1)->len, i2c->base +
-			       OFFSET_TRANSFER_LEN_AUX);
+			mtk_i2c_writew(i2c, msgs->len, OFFSET_TRANSFER_LEN);
+			mtk_i2c_writew(i2c, (msgs + 1)->len,
+					    OFFSET_TRANSFER_LEN_AUX);
 		} else {
-			writew(msgs->len | ((msgs + 1)->len) << 8,
-			       i2c->base + OFFSET_TRANSFER_LEN);
+			mtk_i2c_writew(i2c, msgs->len | ((msgs + 1)->len) << 8,
+					    OFFSET_TRANSFER_LEN);
 		}
-		writew(I2C_WRRD_TRANAC_VALUE, i2c->base + OFFSET_TRANSAC_LEN);
+		mtk_i2c_writew(i2c, I2C_WRRD_TRANAC_VALUE, OFFSET_TRANSAC_LEN);
 	} else {
-		writew(msgs->len, i2c->base + OFFSET_TRANSFER_LEN);
-		writew(num, i2c->base + OFFSET_TRANSAC_LEN);
+		mtk_i2c_writew(i2c, msgs->len, OFFSET_TRANSFER_LEN);
+		mtk_i2c_writew(i2c, num, OFFSET_TRANSAC_LEN);
 	}
 
 	/* Prepare buffer data to start transfer */
@@ -607,14 +748,14 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 		if (left_num >= 1)
 			start_reg |= I2C_RS_MUL_CNFG;
 	}
-	writew(start_reg, i2c->base + OFFSET_START);
+	mtk_i2c_writew(i2c, start_reg, OFFSET_START);
 
 	ret = wait_for_completion_timeout(&i2c->msg_complete,
 					  i2c->adap.timeout);
 
 	/* Clear interrupt mask */
-	writew(~(restart_flag | I2C_HS_NACKERR | I2C_ACKERR |
-	       I2C_TRANSAC_COMP), i2c->base + OFFSET_INTR_MASK);
+	mtk_i2c_writew(i2c, ~(restart_flag | I2C_HS_NACKERR | I2C_ACKERR |
+			    I2C_ARB_LOST | I2C_TRANSAC_COMP), OFFSET_INTR_MASK);
 
 	if (i2c->op == I2C_MASTER_WR) {
 		dma_unmap_single(i2c->dev, wpaddr,
@@ -726,8 +867,8 @@ static irqreturn_t mtk_i2c_irq(int irqno, void *dev_id)
 	if (i2c->auto_restart)
 		restart_flag = I2C_RS_TRANSFER;
 
-	intr_stat = readw(i2c->base + OFFSET_INTR_STAT);
-	writew(intr_stat, i2c->base + OFFSET_INTR_STAT);
+	intr_stat = mtk_i2c_readw(i2c, OFFSET_INTR_STAT);
+	mtk_i2c_writew(i2c, intr_stat, OFFSET_INTR_STAT);
 
 	/*
 	 * when occurs ack error, i2c controller generate two interrupts
@@ -739,8 +880,8 @@ static irqreturn_t mtk_i2c_irq(int irqno, void *dev_id)
 	if (i2c->ignore_restart_irq && (i2c->irq_stat & restart_flag)) {
 		i2c->ignore_restart_irq = false;
 		i2c->irq_stat = 0;
-		writew(I2C_RS_MUL_CNFG | I2C_RS_MUL_TRIG | I2C_TRANSAC_START,
-		       i2c->base + OFFSET_START);
+		mtk_i2c_writew(i2c, I2C_RS_MUL_CNFG | I2C_RS_MUL_TRIG |
+				    I2C_TRANSAC_START, OFFSET_START);
 	} else {
 		if (i2c->irq_stat & (I2C_TRANSAC_COMP | restart_flag))
 			complete(&i2c->msg_complete);
@@ -774,6 +915,10 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
 	if (i2c->clk_src_div == 0)
 		return -EINVAL;
 
+	ret = of_property_read_u32(np, "ch_offset", &i2c->ch_offset);
+	if (ret < 0)
+		i2c->ch_offset = 0;
+
 	i2c->have_pmic = of_property_read_bool(np, "mediatek,have-pmic");
 	i2c->use_push_pull =
 		of_property_read_bool(np, "mediatek,use-push-pull");
@@ -841,6 +986,10 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->clk_dma);
 	}
 
+	i2c->clk_arb = devm_clk_get(&pdev->dev, "arb");
+	if (IS_ERR(i2c->clk_arb))
+		i2c->clk_arb = NULL;
+
 	clk = i2c->clk_main;
 	if (i2c->have_pmic) {
 		i2c->clk_pmic = devm_clk_get(&pdev->dev, "pmic");
-- 
1.7.9.5
