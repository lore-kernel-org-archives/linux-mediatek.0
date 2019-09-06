From: Alexandre Courbot <acourbot@chromium.org>
Subject: [RFC PATCH v2 05/13] media: mtk-vcodec: vdec: handle firmware version field
Date: Fri,  6 Sep 2019 20:55:05 +0900
Message-ID: <20190906115513.159705-6-acourbot@chromium.org>
References: <20190906115513.159705-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906115513.159705-1-acourbot@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

Firmwares for decoders newer than MT8173 will include an ABI version
number in their initialization ack message. Add the capacity to manage
it and make initialization fail if the firmware ABI is of a version that
we don't support.

For MT8173, this ABI version field does not exist ; thus ignore it on
this chip. There should only be one firmware version available for it
anyway.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  8 +++++++
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  5 +++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 21 +++++++++++++++++--
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index 2471624ddfe3..73b16c34d3d9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -616,6 +616,7 @@ static struct vb2_ops mtk_vdec_frame_vb2_ops = {
 };
 
 const struct mtk_vcodec_dec_pdata mtk_frame_8173_pdata = {
+	.chip = MTK_MT8173,
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_frame_vb2_ops,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 23d4cc135ee6..fc99f686faa9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -300,6 +300,10 @@ struct mtk_vcodec_ctx {
 
 };
 
+enum mtk_chip {
+	MTK_MT8173,
+};
+
 /**
  * struct mtk_vcodec_dec_pdata - compatible data for each IC
  * @init_vdec_params: init vdec params
@@ -317,6 +321,8 @@ struct mtk_vcodec_ctx {
  * @vdec_framesizes: supported video decoder frame sizes
  * @num_framesizes: count of video decoder frame sizes
  *
+ * @chip: chip this decoder is compatible with
+ *
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
  */
 
@@ -336,6 +342,8 @@ struct mtk_vcodec_dec_pdata {
 	const struct mtk_codec_framesizes *vdec_framesizes;
 	const int num_framesizes;
 
+	enum mtk_chip chip;
+
 	bool uses_stateless_api;
 };
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index 47a1c1c0fd04..eb66729fda63 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -83,12 +83,17 @@ struct vdec_ap_ipi_dec_start {
  * @status	: VPU exeuction result
  * @ap_inst_addr	: AP vcodec_vpu_inst instance address
  * @vpu_inst_addr	: VPU decoder instance address
+ * @vdec_abi_version:	ABI version of the firmware. Kernel can use it to
+ *			ensure that it is compatible with the firmware.
+ *			This field is not valid for MT8173 and must not be
+ *			accessed for this chip.
  */
 struct vdec_vpu_ipi_init_ack {
 	uint32_t msg_id;
 	int32_t status;
 	uint64_t ap_inst_addr;
 	uint32_t vpu_inst_addr;
+	uint32_t vdec_abi_version;
 };
 
 #endif
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 70abfd4cd4b9..cc963c813654 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -22,6 +22,22 @@ static void handle_init_ack_msg(struct vdec_vpu_ipi_init_ack *msg)
 	vpu->inst_addr = msg->vpu_inst_addr;
 
 	mtk_vcodec_debug(vpu, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
+
+	/* Firmware version field does not exist on MT8173. */
+	if (vpu->ctx->dev->vdec_pdata->chip == MTK_MT8173)
+		return;
+
+	/* Check firmware version. */
+	mtk_vcodec_debug(vpu, "firmware version 0x%x\n", msg->vdec_abi_version);
+	switch (msg->vdec_abi_version) {
+	case 1:
+		break;
+	default:
+		mtk_vcodec_err(vpu, "unhandled firmware version 0x%x\n",
+			       msg->vdec_abi_version);
+		vpu->failure = 1;
+		break;
+	}
 }
 
 /*
@@ -42,6 +58,9 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 
 	mtk_vcodec_debug(vpu, "+ id=%X", msg->msg_id);
 
+	vpu->failure = msg->status;
+	vpu->signaled = 1;
+
 	if (msg->status == 0) {
 		switch (msg->msg_id) {
 		case VPU_IPIMSG_DEC_INIT_ACK:
@@ -61,8 +80,6 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 	}
 
 	mtk_vcodec_debug(vpu, "- id=%X", msg->msg_id);
-	vpu->failure = msg->status;
-	vpu->signaled = 1;
 }
 
 static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
-- 
2.23.0.187.g17f5b7556c-goog
