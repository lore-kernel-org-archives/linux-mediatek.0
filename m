From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH 12/14] [media] mtk-mipicsi: add the function for Get/Set PARM for application
Date: Mon, 8 Apr 2019 19:55:03 +0800
Message-ID: <1554724505-19882-13-git-send-email-stu.hsieh@mediatek.com>
References: <1554724505-19882-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554724505-19882-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

This patch add the function for Get/Set PARM for application.

Application can get the information about number of link.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 9361cc4c77ac..faf9a94d5157 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -347,6 +347,38 @@ static int get_subdev_link(const struct soc_camera_device *icd,
 	return 0;
 }
 
+static int mtk_mipicsi_get_parm(struct soc_camera_device *icd,
+	struct v4l2_streamparm *a)
+{
+	unsigned int link = 0U;
+	u8 link_reg_val = 0x0U;
+	int ret = 0;
+
+	/*get camera link number*/
+	ret = get_subdev_link(icd, &link, &link_reg_val);
+	if (ret < 0)
+		return ret;
+
+	a->parm.capture.timeperframe.numerator = 1;
+	a->parm.capture.timeperframe.denominator = 30;
+	a->parm.capture.reserved[0] = link_reg_val;
+	a->parm.capture.reserved[1] = (u32)(icd->use_count);
+	dev_info(icd->parent, "use count %d\n", icd->use_count);
+
+	return 0;
+}
+
+static int mtk_mipicsi_set_param(struct soc_camera_device *icd,
+	struct v4l2_streamparm *a)
+{
+	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
+
+	if (ici->ops->get_parm == NULL)
+		return ici->ops->get_parm(icd, a);
+
+	return 0;
+}
+
 static u32 get_bytesperline(const u32 fmt, const u32 width)
 {
 	u32 bytesperline = 0;
@@ -890,6 +922,8 @@ static struct soc_camera_host_ops mtk_soc_camera_host_ops = {
 	.poll			= vb2_fop_poll,
 	.querycap		= mtk_mipicsi_querycap,
 	.set_bus_param		= mtk_mipicsi_set_bus_param,
+	.get_parm		= mtk_mipicsi_get_parm,
+	.set_parm		= mtk_mipicsi_set_param,
 };
 
 static void mtk_mipicsi_ana_init(void __iomem *base)
-- 
2.18.0
