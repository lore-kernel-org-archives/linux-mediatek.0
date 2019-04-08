From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH 04/14] [media] mtk-mipicsi: get the w/h/bytepwerline for mtk_mipicsi
Date: Mon, 8 Apr 2019 19:54:55 +0800
Message-ID: <1554724505-19882-5-git-send-email-stu.hsieh@mediatek.com>
References: <1554724505-19882-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554724505-19882-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

This patch get the w/h/bytepwerline to save in mtk_mipicsi.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index ccf2d18a3e74..f9deff1e5a9f 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -100,6 +100,9 @@ struct mtk_mipicsi_dev {
 	u32 id;
 	int clk_num;
 	struct clk		*clk[MIPICSI_CLK];
+	u32 width;
+	u32 height;
+	u32 bytesperline;
 };
 
 #define MTK_MIPICSI_BUS_PARAM (V4L2_MBUS_MASTER |	\
@@ -111,13 +114,36 @@ struct mtk_mipicsi_dev {
 		V4L2_MBUS_PCLK_SAMPLE_FALLING |	\
 		V4L2_MBUS_DATA_ACTIVE_HIGH)
 
+static u32 get_bytesperline(const u32 fmt, const u32 width)
+{
+	u32 bytesperline = 0;
+
+	switch (fmt) {
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_VYUY8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YVYU8_2X8:
+		bytesperline = width * 2U;
+		break;
+	default:
+		break;
+	}
+
+	return bytesperline;
+}
+
 static int mtk_mipicsi_add_device(struct soc_camera_device *icd)
 {
+	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
+	struct mtk_mipicsi_dev *mipicsi = ici->priv;
 	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 	int ret;
+	u32 width;
+	u32 height;
+	u32 fmt;
 
 	/* Get width/height info from subdev. Then use them to set register */
 	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &format);
@@ -126,6 +152,19 @@ static int mtk_mipicsi_add_device(struct soc_camera_device *icd)
 		return ret;
 	}
 
+	width = format.format.width;
+	height = format.format.height;
+	fmt = format.format.code;
+	mipicsi->bytesperline = get_bytesperline(fmt, width);
+	if ((width == 0U) || (height == 0U) || (mipicsi->bytesperline == 0U)) {
+		dev_err(icd->parent, "invalid sub device width/height/bytesperline %d/%d/%d\n",
+			width, height, mipicsi->bytesperline);
+		return -EINVAL;
+	}
+
+	mipicsi->width = width;
+	mipicsi->height = height;
+
 	/*
 	 * If power domain was closed before, it will be open.
 	 * Then clock will be open and register will be set
-- 
2.18.0
