From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH 0/2] Support CMDQ interface and control flow
Date: Fri, 30 Aug 2019 15:41:01 +0800
Message-ID: <20190830074103.16671-1-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, YT Shen <yt.shen@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org, tfiga@chromium.org, drinkcat@chromium.org, linux-kernel@vger.kernel.org, Bibby Hsieh <bibby.hsieh@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

The CMDQ (Command Queue) in MT8183 is used to help
update all relevant display controller registers
with critical time limation.

These patched add CMDQ interface in ddp_comp interface
and add CMDQ control flow.

This patch depends on ptach:
drm/mediatek: fixup cursor moving unsmooth issue
(https://patchwork.kernel.org/cover/11123119/)
add drm support for MT8183
(https://patchwork.kernel.org/cover/11121519/)
support gce on mt8183 platform
(https://patchwork.kernel.org/cover/11120153/)

Bibby Hsieh (2):
  drm/mediatek: Support CMDQ interface in ddp component
  drm/mediatek: Apply CMDQ control flow

 drivers/gpu/drm/mediatek/mtk_disp_color.c   |   7 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  78 ++++----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  66 +++----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 190 +++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 144 +++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  55 ++++--
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    |   4 +
 8 files changed, 393 insertions(+), 153 deletions(-)

-- 
2.18.0
