From: Alexandre Courbot <acourbot@chromium.org>
Subject: [RFCv1 12/12] media: mtk-vcodec: enable MT8183 decoder
Date: Tue, 28 May 2019 14:56:35 +0900
Message-ID: <20190528055635.12109-13-acourbot@chromium.org>
References: <20190528055635.12109-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528055635.12109-1-acourbot@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

Now that all the supporting blocks are present, enable decoder for
MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
[acourbot: refactor, cleanup and split]

Change-Id: I5696b186fae16f12b97745247331732beb1192e2
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 8be0c04f7e81..60dd312500a4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -401,6 +401,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
 		.compatible = "mediatek,mt8173-vcodec-dec",
 		.data = &mtk_frame_8173_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8183-vcodec-dec",
+		.data = &mtk_req_8183_pdata,
+	},
 	{},
 };
 
-- 
2.22.0.rc1.257.g3120a18244-goog
