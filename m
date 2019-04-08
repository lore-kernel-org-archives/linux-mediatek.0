From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH 07/14] [media] mtk-mipicsi: enable/disable ana clk
Date: Mon, 8 Apr 2019 19:54:58 +0800
Message-ID: <1554724505-19882-8-git-send-email-stu.hsieh@mediatek.com>
References: <1554724505-19882-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554724505-19882-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

This patch enable/disable ana clk when power on/off

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index c2f75d9b64b8..99991f698edf 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -164,6 +164,41 @@ struct mtk_mipicsi_dev {
 		V4L2_MBUS_PCLK_SAMPLE_FALLING |	\
 		V4L2_MBUS_DATA_ACTIVE_HIGH)
 
+static void mtk_mipicsi_ana_clk_enable(void __iomem *base, bool enable)
+{
+	if (enable) {
+		writel(1UL | readl(base + MIPI_RX_ANA00_CSI),
+			base + MIPI_RX_ANA00_CSI);
+		writel(1UL | readl(base + MIPI_RX_ANA04_CSI),
+			base + MIPI_RX_ANA04_CSI);
+		writel(1UL | readl(base + MIPI_RX_ANA08_CSI),
+			base + MIPI_RX_ANA08_CSI);
+		writel(1UL | readl(base + MIPI_RX_ANA0C_CSI),
+			base + MIPI_RX_ANA0C_CSI);
+		writel(1UL | readl(base + MIPI_RX_ANA10_CSI),
+			base + MIPI_RX_ANA10_CSI);
+		writel(1UL | readl(base + MIPI_RX_ANA20_CSI),
+			base + MIPI_RX_ANA20_CSI);
+		writel(1UL | readl(base + MIPI_RX_ANA24_CSI),
+			base + MIPI_RX_ANA24_CSI);
+	} else {
+		writel(~1UL & readl(base + MIPI_RX_ANA00_CSI),
+			base + MIPI_RX_ANA00_CSI);
+		writel(~1UL & readl(base + MIPI_RX_ANA04_CSI),
+			base + MIPI_RX_ANA04_CSI);
+		writel(~1UL & readl(base + MIPI_RX_ANA08_CSI),
+			base + MIPI_RX_ANA08_CSI);
+		writel(~1UL & readl(base + MIPI_RX_ANA0C_CSI),
+			base + MIPI_RX_ANA0C_CSI);
+		writel(~1UL & readl(base + MIPI_RX_ANA10_CSI),
+			base + MIPI_RX_ANA10_CSI);
+		writel(~1UL & readl(base + MIPI_RX_ANA20_CSI),
+			base + MIPI_RX_ANA20_CSI);
+		writel(~1UL & readl(base + MIPI_RX_ANA24_CSI),
+			base + MIPI_RX_ANA24_CSI);
+	}
+}
+
 static int get_subdev_register(const struct soc_camera_device *icd,
 	struct v4l2_dbg_register *reg)
 {
@@ -802,6 +837,8 @@ static int mtk_mipicsi_pm_suspend(struct device *dev)
 	for (i = 0; i < mipicsi->clk_num; ++i)
 		clk_disable_unprepare(mipicsi->clk[i]);
 
+	mtk_mipicsi_ana_clk_enable(mipicsi->ana, false);
+
 	if (mipicsi->larb_pdev != NULL)
 		mtk_smi_larb_put(mipicsi->larb_pdev);
 
@@ -839,6 +876,8 @@ static int mtk_mipicsi_pm_resume(struct device *dev)
 			return ret;
 	}
 
+	mtk_mipicsi_ana_clk_enable(mipicsi->ana, true);
+
 	/* enable digtal clock */
 	for (i = 0; i < mipicsi->clk_num; ++i)
 		(void)clk_prepare_enable(mipicsi->clk[i]);
-- 
2.18.0
