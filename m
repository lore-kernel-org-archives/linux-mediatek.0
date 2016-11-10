From: Wu-Cheng Li <wuchengli@chromium.org>
Subject: [PATCH v1] mtk-vcodec: add index check in decoder vidioc_qbuf.
Date: Thu, 10 Nov 2016 13:24:05 +0800
Message-ID: <1478755445-23494-2-git-send-email-wuchengli@chromium.org>
References: <1478755445-23494-1-git-send-email-wuchengli@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478755445-23494-1-git-send-email-wuchengli@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pawel@osciak.com, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com, djkurtz@chromium.org, dan.carpenter@oracle.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Wu-Cheng Li <wuchengli@google.com>, Wu-Cheng Li <wuchengli@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

From: Wu-Cheng Li <wuchengli@google.com>

vb2_qbuf will check the buffer index. If a driver overrides
vidioc_qbuf and use the buffer index, the driver needs to check
the index.

Signed-off-by: Wu-Cheng Li <wuchengli@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 0520919..0746592 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -533,6 +533,10 @@ static int vidioc_vdec_qbuf(struct file *file, void *priv,
 	}
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, buf->type);
+	if (buf->index >= vq->num_buffers) {
+		mtk_v4l2_debug(1, "buffer index %d out of range", buf->index);
+		return -EINVAL;
+	}
 	vb = vq->bufs[buf->index];
 	vb2_v4l2 = container_of(vb, struct vb2_v4l2_buffer, vb2_buf);
 	mtkbuf = container_of(vb2_v4l2, struct mtk_video_dec_buf, vb);
-- 
2.8.0.rc3.226.g39d4020
