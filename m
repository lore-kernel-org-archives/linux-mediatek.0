From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH 02/14] [media] mtk-mipicsi: add pm function
Date: Mon, 8 Apr 2019 19:54:53 +0800
Message-ID: <1554724505-19882-3-git-send-email-stu.hsieh@mediatek.com>
References: <1554724505-19882-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554724505-19882-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

This patch add PM function to enable/disable clk and larb.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 2e6c3073c064..a5ed720df900 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -465,6 +465,85 @@ static struct soc_camera_host_ops mtk_soc_camera_host_ops = {
 	.set_bus_param		= mtk_mipicsi_set_bus_param,
 };
 
+static int mtk_mipicsi_pm_suspend(struct device *dev)
+{
+	struct soc_camera_host *ici = to_soc_camera_host(dev);
+	struct mtk_mipicsi_dev *mipicsi = NULL;
+	int ret = 0;
+	int i = 0;
+
+	mipicsi = container_of(ici, struct mtk_mipicsi_dev, soc_host);
+	if (mipicsi->soc_host.icd != NULL) {
+		struct v4l2_subdev *sd =
+			soc_camera_to_subdev(mipicsi->soc_host.icd);
+
+		ret = v4l2_subdev_call(sd, core, s_power, 0);
+		if (ret == -ENOIOCTLCMD)
+			ret = 0;
+	}
+
+	/* close digtal and analog clock */
+	for (i = 0; i < mipicsi->clk_num; ++i)
+		clk_disable_unprepare(mipicsi->clk[i]);
+
+	if (mipicsi->larb_pdev != NULL)
+		mtk_smi_larb_put(mipicsi->larb_pdev);
+
+	return ret;
+}
+
+static int mtk_mipicsi_suspend(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return mtk_mipicsi_pm_suspend(dev);
+}
+
+static int mtk_mipicsi_pm_resume(struct device *dev)
+{
+	struct soc_camera_host *ici = to_soc_camera_host(dev);
+	struct mtk_mipicsi_dev *mipicsi =
+		container_of(ici, struct mtk_mipicsi_dev, soc_host);
+	int ret = 0;
+	int i = 0;
+
+	if (mipicsi->soc_host.icd != NULL) {
+		struct v4l2_subdev *sd =
+			soc_camera_to_subdev(mipicsi->soc_host.icd);
+
+		ret = v4l2_subdev_call(sd, core, s_power, 1);
+		if (ret == -ENOIOCTLCMD)
+			ret = 0;
+	}
+
+	if (mipicsi->larb_pdev != NULL) {
+		ret = mtk_smi_larb_get(mipicsi->larb_pdev);
+		if (ret != 0)
+			return ret;
+	}
+
+	/* enable digtal clock */
+	for (i = 0; i < mipicsi->clk_num; ++i)
+		(void)clk_prepare_enable(mipicsi->clk[i]);
+
+	return ret;
+}
+
+static int mtk_mipicsi_resume(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return mtk_mipicsi_pm_resume(dev);
+}
+
+static const struct dev_pm_ops mtk_mipicsi_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_mipicsi_suspend, mtk_mipicsi_resume)
+	SET_RUNTIME_PM_OPS(mtk_mipicsi_pm_suspend,
+		mtk_mipicsi_pm_resume, NULL)
+};
+
 static int seninf_mux_camsv_node_parse(struct mtk_mipicsi_dev *mipicsi,
 		int index)
 {
@@ -757,6 +836,7 @@ static const struct of_device_id mtk_mipicsi_of_match[] = {
 static struct platform_driver mtk_mipicsi_driver = {
 	.driver		= {
 		.name	= MTK_MIPICSI_DRV_NAME,
+		.pm	= &mtk_mipicsi_pm,
 		.of_match_table = of_match_ptr(mtk_mipicsi_of_match),
 	},
 	.probe		= mtk_mipicsi_probe,
-- 
2.18.0
