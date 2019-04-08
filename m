From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH 03/14] [media] mtk-mipicsi: add color format support for mt2712
Date: Mon, 8 Apr 2019 19:54:54 +0800
Message-ID: <1554724505-19882-4-git-send-email-stu.hsieh@mediatek.com>
References: <1554724505-19882-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554724505-19882-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

This patch add color format support for mt2712

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index a5ed720df900..ccf2d18a3e74 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -139,6 +139,25 @@ static void mtk_mipicsi_remove_device(struct soc_camera_device *icd)
 	(void)pm_runtime_put_sync(icd->parent);
 }
 
+static bool is_supported(struct soc_camera_device *icd, const u32 pixformat)
+{
+	bool ret = false;
+
+	switch (pixformat) {
+	/* YUV422 */
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_YVYU:
+	case V4L2_PIX_FMT_VYUY:
+		ret = true;
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 static int mtk_mipicsi_set_fmt(struct soc_camera_device *icd,
 				struct v4l2_format *f)
 {
@@ -154,6 +173,12 @@ static int mtk_mipicsi_set_fmt(struct soc_camera_device *icd,
 	struct v4l2_mbus_framefmt *mf = &format.format;
 	int ret = 0;
 
+	if (!is_supported(icd, pix->pixelformat)) {
+		dev_err(dev, "Format %x not support. set V4L2_PIX_FMT_YUYV as default\n",
+			pix->pixelformat);
+		pix->pixelformat = V4L2_PIX_FMT_YUYV;
+	}
+
 	xlate = soc_camera_xlate_by_fourcc(icd, pix->pixelformat);
 	if (xlate == NULL) {
 		dev_err(dev, "Format 0x%x not found\n", pix->pixelformat);
-- 
2.18.0
