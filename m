From: Keiichi Watanabe <keiichiw@chromium.org>
Subject: [PATCH v3 3/3] media: mtk-vcodec: Support VP9 profile in decoder
Date: Thu, 14 Jun 2018 16:46:52 +0900
Message-ID: <20180614074652.162796-4-keiichiw@chromium.org>
References: <20180614074652.162796-1-keiichiw@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180614074652.162796-1-keiichiw@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kamil Debski <kamil@wypas.org>, Jeongtae Park <jtp.park@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, Keiichi Watanabe <keiichiw@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Smitha T Murthy <smitha.t@samsung.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Tomasz Figa <tfiga@chromium.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kern
List-Id: linux-mediatek@lists.infradead.org

Add V4L2_CID_MPEG_VIDEO_VP9_PROFILE control in MediaTek decoder's
driver.
MediaTek decoder only supports profile 0 for now.

Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 86f0a7134365..ba986232b953 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -1400,6 +1400,11 @@ int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 				V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
 				0, 32, 1, 1);
 	ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+	v4l2_ctrl_new_std_menu(&ctx->ctrl_hdl,
+				&mtk_vcodec_dec_ctrl_ops,
+				V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
+				V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+				0, V4L2_MPEG_VIDEO_VP9_PROFILE_0);

 	if (ctx->ctrl_hdl.error) {
 		mtk_v4l2_err("Adding control failed %d",
--
2.18.0.rc1.242.g61856ae69a-goog
