From: Wu-Cheng Li <wuchengli@chromium.org>
Subject: [PATCH v1] mtk-vcodec: use V4L2_DEC_CMD_STOP to implement flush
Date: Fri,  2 Dec 2016 10:38:33 +0800
Message-ID: <1480646314-75478-1-git-send-email-wuchengli@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, djkurtz@chromium.org, pawel@osciak.com, Wu-Cheng Li <wuchengli@google.com>
List-Id: linux-mediatek@lists.infradead.org

From: Wu-Cheng Li <wuchengli@google.com>

This patch uses V4L2_DEC_CMD_STOP to implement flush -- requesting
the remaining images to be returned to userspace. The old unofficial
way was to use a size-0 input buffer and the code is removed.

Tiffany Lin (1):
  mtk-vcodec: use V4L2_DEC_CMD_STOP to implement flush

 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 151 ++++++++++++++-------
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |  14 ++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |   2 +
 3 files changed, 117 insertions(+), 50 deletions(-)

-- 
2.8.0.rc3.226.g39d4020
