Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91218C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 08:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Nq3JP5NZg5x/Eq5vifRvHzGySmGrT7C1VRJZwYlhzE=; b=E030uDWP19uzGn
	/WXWiI81QEhV2uacNZ97vxLqWnT9WIAJCaf4MXBScp5EPwDJJycFsJK3Wbk1CqxPUnhd0CX4R+6Qy
	2yBSPETQupr3CcPGC48X5E6m4c9YS0SwF7SmVnWdKLyMNM0GFTwSphHLvGmqueZ4raA1gnRHroL+z
	iYnPy+KTTnqRajtF2tQokm72VYEM3nXujsX7R0Xdq9mmCNsI6j5IfpPqbnUOqwIzCfV/dL5mD1Lr9
	zwkdo2J+Co+R9+7kA8RjvgQQ+Jm2I3filMOt0Fd74u0qODHKSfpc7EYelBqIV3CTTlRKTKqFBAqER
	8dvKlcix+eoCe58dyrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKbhv-009JWf-L7; Thu, 17 Feb 2022 08:00:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKbgE-009IOm-HL; Thu, 17 Feb 2022 07:58:26 +0000
X-UUID: bbeb9b85653b4cafa448a5f2dc0304d9-20220217
X-UUID: bbeb9b85653b4cafa448a5f2dc0304d9-20220217
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1329399269; Thu, 17 Feb 2022 00:58:18 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Feb 2022 23:58:17 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 15:58:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 15:58:14 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3,
 7/7] media: mtk-vcodec: Add to support H264 inner racing mode
Date: Thu, 17 Feb 2022 15:57:58 +0800
Message-ID: <20220217075758.11369-8-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217075758.11369-1-yunfei.dong@mediatek.com>
References: <20220217075758.11369-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_235822_612571_7FD8167B 
X-CRM114-Status: GOOD (  20.17  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In order to reduce decoder latency, enable H264 inner racing mode.

Send lat trans buffer information to core when trigger lat to work,
need not to wait until lat decode done.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  4 +++
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 34 +++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 10 ++++++
 .../mtk-vcodec/vdec/vdec_h264_req_multi_if.c  | 23 ++++++++++---
 4 files changed, 66 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 35da367732a3..3c84e7cf1780 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -390,6 +390,10 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		}
 	}
 
+	atomic_set(&dev->dec_active_cnt, 0);
+	memset(dev->vdec_racing_info, 0 , sizeof(dev->vdec_racing_info));
+	mutex_init(&dev->dec_racing_info_mutex);
+
 	if (dev->vdec_pdata->uses_stateless_api) {
 		dev->mdev_dec.dev = &pdev->dev;
 		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index d69faa463d04..4305e4eb9900 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -144,6 +144,34 @@ static void mtk_vcodec_dec_disable_irq(struct mtk_vcodec_dev *vdec_dev, int hw_i
 	}
 }
 
+static void mtk_vcodec_load_racing_info(struct mtk_vcodec_ctx *ctx)
+{
+	void __iomem *vdec_racing_addr;
+	int j;
+
+	mutex_lock(&ctx->dev->dec_racing_info_mutex);
+	if (atomic_inc_return(&ctx->dev->dec_active_cnt) == 1) {
+		vdec_racing_addr = ctx->dev->reg_base[VDEC_MISC] + 0x100;
+		for (j = 0; j < 132; j++)
+			writel(ctx->dev->vdec_racing_info[j], vdec_racing_addr + j * 4);
+	}
+	mutex_unlock(&ctx->dev->dec_racing_info_mutex);
+}
+
+static void mtk_vcodec_record_racing_info(struct mtk_vcodec_ctx *ctx)
+{
+	void __iomem *vdec_racing_addr;
+	int j;
+
+	mutex_lock(&ctx->dev->dec_racing_info_mutex);
+	if (atomic_dec_and_test(&ctx->dev->dec_active_cnt)) {
+		vdec_racing_addr = ctx->dev->reg_base[VDEC_MISC] + 0x100;
+		for (j = 0; j < 132; j++)
+			ctx->dev->vdec_racing_info[j] = readl(vdec_racing_addr + j * 4);
+	}
+	mutex_unlock(&ctx->dev->dec_racing_info_mutex);
+}
+
 static struct mtk_vcodec_pm *mtk_vcodec_dec_get_pm(struct mtk_vcodec_dev *vdec_dev,
 						   int hw_idx)
 {
@@ -214,11 +242,17 @@ void mtk_vcodec_dec_enable_hardware(struct mtk_vcodec_ctx *ctx, int hw_idx)
 	mtk_vcodec_dec_child_dev_on(ctx->dev, hw_idx);
 
 	mtk_vcodec_dec_enable_irq(ctx->dev, hw_idx);
+
+	if (IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
+		mtk_vcodec_load_racing_info(ctx);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dec_enable_hardware);
 
 void mtk_vcodec_dec_disable_hardware(struct mtk_vcodec_ctx *ctx, int hw_idx)
 {
+	if (IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
+		mtk_vcodec_record_racing_info(ctx);
+
 	mtk_vcodec_dec_disable_irq(ctx->dev, hw_idx);
 
 	mtk_vcodec_dec_child_dev_off(ctx->dev, hw_idx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index a8c286307106..2b7b87922754 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -28,6 +28,7 @@
 #define MTK_V4L2_BENCHMARK	0
 #define WAIT_INTR_TIMEOUT_MS	1000
 #define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
+#define IS_VDEC_INNER_RACING(capability) (capability & MTK_VCODEC_INNER_RACING)
 
 /*
  * enum mtk_hw_reg_idx - MTK hw register base index
@@ -357,6 +358,7 @@ enum mtk_vdec_format_types {
 	MTK_VDEC_FORMAT_H264_SLICE = 0x100,
 	MTK_VDEC_FORMAT_VP8_FRAME = 0x200,
 	MTK_VDEC_FORMAT_VP9_FRAME = 0x400,
+	MTK_VCODEC_INNER_RACING = 0x20000,
 };
 
 /**
@@ -477,6 +479,10 @@ struct mtk_vcodec_enc_pdata {
  * @subdev_dev: subdev hardware device
  * @subdev_prob_done: check whether all used hw device is prob done
  * @subdev_bitmap: used to record hardware is ready or not
+ *
+ * @dec_active_cnt: used to mark whether need to record register value
+ * @vdec_racing_info: record register value
+ * @dec_racing_info_mutex: mutex lock used for inner racing mode
  */
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
@@ -522,6 +528,10 @@ struct mtk_vcodec_dev {
 	void *subdev_dev[MTK_VDEC_HW_MAX];
 	int (*subdev_prob_done)(struct mtk_vcodec_dev *vdec_dev);
 	DECLARE_BITMAP(subdev_bitmap, MTK_VDEC_HW_MAX);
+
+	atomic_t dec_active_cnt;
+	u32 vdec_racing_info[132];
+	struct mutex dec_racing_info_mutex;
 };
 
 static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c
index e4adc4bc9c1e..825db7ff06a8 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c
@@ -617,6 +617,17 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		goto err_free_fb_out;
 	}
 
+	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
+		inst->vsi->wdma_end_addr_offset;
+	share_info->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
+	share_info->nal_info = inst->vsi->dec.nal_info;
+
+	if (IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
+		memcpy(&share_info->h264_slice_params, &inst->vsi->h264_slice_params,
+		       sizeof(share_info->h264_slice_params));
+		vdec_msg_queue_qbuf(&inst->ctx->dev->msg_queue_core_ctx, lat_buf);
+	}
+
 	/* wait decoder done interrupt */
 	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
 					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
@@ -630,14 +641,16 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
 		inst->vsi->wdma_end_addr_offset;
-	share_info->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
-	share_info->nal_info = inst->vsi->dec.nal_info;
 	vdec_msg_queue_update_ube_wptr(&lat_buf->ctx->msg_queue,
 				       share_info->trans_end);
 
-	memcpy(&share_info->h264_slice_params, &inst->vsi->h264_slice_params,
-	       sizeof(share_info->h264_slice_params));
-	vdec_msg_queue_qbuf(&inst->ctx->dev->msg_queue_core_ctx, lat_buf);
+	if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
+		memcpy(&share_info->h264_slice_params, &inst->vsi->h264_slice_params,
+		       sizeof(share_info->h264_slice_params));
+		vdec_msg_queue_qbuf(&inst->ctx->dev->msg_queue_core_ctx, lat_buf);
+	}
+	mtk_vcodec_debug(inst, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->vsi->dec.crc[0],
+			 inst->vsi->dec.crc[1], inst->vsi->dec.crc[2]);
 
 	inst->slice_dec_num++;
 	return 0;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
