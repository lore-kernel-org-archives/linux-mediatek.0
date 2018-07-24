From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v1 00/15] Add RDMA memory mode support for mediatek SOC MT2712
Date: Tue, 24 Jul 2018 16:17:00 +0800
Message-ID: <1532420235-22268-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, Stu Hsieh <stu.hsieh@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

This patch series add RDMA memory mode support for mediatek SOC MT2712.
MT2712 has three display data path, including three HW engine,
two OVL and one RDMA.

The RDMA used in third ddp and it need to be set memory mode,
then RDMA could read data from memory and output to panel.

Stu Hsieh (15):
  drm/mediatek: add connection from RDMA0 to DPI1
  drm/mediatek: add connection from RDMA0 to DSI1
  drm/mediatek: add connection from RDMA1 to DSI0
  drm/mediatek: add connection from RDMA2 to DSI0
  drm/mediatek: add RDMA memory mode for crtc created
  drm/mediatek: add memory mode for RDMA
  drm/mediatek: add layer config to set RDMA for plane setting
  drm/mediatek: add RGB color format support for RDMA
  drm/mediatek: add YUYV/UYVY color format support for RDMA
  drm/mediatek: add drm_device in RDMA for mamory mode to reaquest
    buffer
  drm/mediatek: add dummy buffer for RDMA memory mode
  drm/mediatek: add layer number condition for RDMA to control plane
  drm/mediatek: Update some variable name from ovl to comp
  drm/mediatek: fixed the error value for add DSI1 in mutex
  drm/mediatek: fixed connection from RDMA2 to DSI1

 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 122 +++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  59 +++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c      |  20 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   2 +
 5 files changed, 181 insertions(+), 26 deletions(-)

-- 
2.12.5
