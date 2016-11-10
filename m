From: Wu-Cheng Li <wuchengli@chromium.org>
Subject: [PATCH v1] mtk-vcodec: add index check in decoder vidioc_qbuf
Date: Thu, 10 Nov 2016 13:24:04 +0800
Message-ID: <1478755445-23494-1-git-send-email-wuchengli@chromium.org>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: pawel@osciak.com, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com, djkurtz@chromium.org, dan.carpenter@oracle.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Wu-Cheng Li <wuchengli@google.com>
List-Id: linux-mediatek@lists.infradead.org

From: Wu-Cheng Li <wuchengli@google.com>

This patch adds a buffer index check in decoder vidioc_qbuf.

Wu-Cheng Li (1):
  mtk-vcodec: add index check in decoder vidioc_qbuf.

 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.8.0.rc3.226.g39d4020
