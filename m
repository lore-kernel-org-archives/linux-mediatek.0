From: Alexandre Courbot <acourbot@chromium.org>
Subject: [RFCv1 00/12] media: mtk-vcodec: support for MT8183 decoder
Date: Tue, 28 May 2019 14:56:23 +0900
Message-ID: <20190528055635.12109-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

This series is a refactoring/split of the initial patch for MT8183 codec support
that was posted for Chrome OS [1] in order to make it upstreamable.

The line count has been significantly reduced compared to the initial patch,
although support for the MT8183 encoder is not here yet to limit the amount of
code to review.

Although the series applies on top of today's media tree, it will not compile
until support for the SCP is merged, hence the RFC status. Note also that the
H.264 structures used and implementation of the stateless codec API may not be
completely up-to-date. So the goal of this publication is to review the general
idea (especially split unto stateful and stateless ops), and maybe merge the
first 5 patches.

Patches 1-5 are cleanup/small fixes that came while working on this series. They
should be harmless and can be merged.

Patches 6 adds a layer of abstraction to some of the decoder operations.
Currently mtk-vcodec and MT8173 use the stateful codec API, but MT8183 is based
on a stateless model. So patch 6 isolates the ops specific to the stateful codec
so MT8173 and MT8183 can share a big part of the code.

Patch 7 abstracts the firmware interface, as MT8173 and MT8183 are controlled
by different interfaces (VPU or SCP). Patch 8 adds the firmware ops for MT8183.

Patch 9 and 10 add support for stateless decoders in the driver, and support for
stateless H.264 decoding respectively.

Patch 11 takes care of adding the media device for stateless codecs, and
patch 12 allows the MT8183 decoder to probe.

I am mostly expecting comments about the general direction, but of course more
in-depth reviews are also welcome.

[1] https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1377757/

Alexandre Courbot (3):
  media: mtk-vcodec: avoid unneeded pointer-to-long conversions
  media: mtk-vcodec: remove unneeded proxy functions
  media: mtk-vcodec: constify formats

Yunfei Dong (9):
  media: mtk-vcodec: fix copyright indent
  media: mtk-vcodec: support single-buffer frames
  media: mtk-vcodec: move stateful ops into their own file
  media: mtk-vcodec: abstract firmware interface
  media: mtk-vcodec: add SCP firmware ops
  media: mtk-vcodec: vdec: support stateless API
  media: mtk-vcodec: vdec: support stateless H.264 decoding
  media: mtk-vcodec: vdec: add media device if using stateless api
  media: mtk-vcodec: enable MT8183 decoder

 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/mtk-vcodec/Makefile    |   7 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 751 +++---------------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  30 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 103 ++-
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 629 +++++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 493 ++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  81 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  45 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  49 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  26 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 208 +++++
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  38 +
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |   1 -
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |  22 +-
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 533 +++++++++++++
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |  22 +-
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |  22 +-
 .../media/platform/mtk-vcodec/vdec_drv_base.h |  10 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |  19 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  10 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  11 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  34 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  27 +-
 .../media/platform/mtk-vcodec/venc_drv_base.h |   8 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |  11 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.c   |  15 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   5 +-
 29 files changed, 2328 insertions(+), 884 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

-- 
2.22.0.rc1.257.g3120a18244-goog
