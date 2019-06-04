From: Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 0/5] media: mtk-vcodec: cleanups and fixes
Date: Tue,  4 Jun 2019 18:37:32 +0900
Message-ID: <20190604093737.172599-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

This series extracts the cleanup patches from the RFC of MT8183 support [1] as
these patches can already be merged. MT8183 support will be sent separately.

[1] https://patchwork.kernel.org/cover/10963769/

Changes since RFC:

- Replaced all GPLv2 headers with SPDX

- Replaced EXPORT_SYMBOL with EXPORT_SYMBOL_GPL

Alexandre Courbot (4):
  media: mtk-vcodec: replace GPLv2 with SPDX
  media: mtk-vcodec: avoid unneeded pointer-to-long conversions
  media: mtk-vcodec: remove unneeded proxy functions
  media: mtk-vcodec: constify formats

Yunfei Dong (1):
  media: mtk-vcodec: support single-buffer frames

 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 45 ++++++++-----------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      | 15 +------
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 15 +------
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 14 +-----
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   | 14 +-----
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 19 ++------
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 34 +++++---------
 .../platform/mtk-vcodec/mtk_vcodec_enc.h      | 15 +------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 15 +------
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 14 +-----
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   | 14 +-----
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     | 14 +-----
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     | 14 +-----
 .../platform/mtk-vcodec/mtk_vcodec_util.c     | 15 +------
 .../platform/mtk-vcodec/mtk_vcodec_util.h     | 15 +------
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   | 35 ++++-----------
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    | 36 ++++-----------
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    | 37 ++++-----------
 .../media/platform/mtk-vcodec/vdec_drv_base.h | 22 +++------
 .../media/platform/mtk-vcodec/vdec_drv_if.c   | 29 ++++--------
 .../media/platform/mtk-vcodec/vdec_drv_if.h   | 15 +------
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 15 +------
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 14 +-----
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   | 14 +-----
 .../platform/mtk-vcodec/venc/venc_h264_if.c   | 36 +++------------
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    | 35 +++------------
 .../media/platform/mtk-vcodec/venc_drv_base.h | 25 +++--------
 .../media/platform/mtk-vcodec/venc_drv_if.c   | 27 +++--------
 .../media/platform/mtk-vcodec/venc_drv_if.h   | 17 +------
 .../media/platform/mtk-vcodec/venc_ipi_msg.h  | 17 +------
 .../media/platform/mtk-vcodec/venc_vpu_if.c   | 15 +------
 .../media/platform/mtk-vcodec/venc_vpu_if.h   | 15 +------
 32 files changed, 114 insertions(+), 562 deletions(-)

-- 
2.22.0.rc1.311.g5d7573a151-goog
