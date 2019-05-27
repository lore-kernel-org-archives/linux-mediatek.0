From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH 0/3] fix mediatek drm, dis, and disp-* unbind/bind
Date: Mon, 27 May 2019 12:50:51 +0800
Message-ID: <20190527045054.113259-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

There are some errors when unbinding and rebinding mediatek drm, dsi,
and disp-* drivers. This series is to fix those errors and warnings.

Hsin-Yi Wang (3):
  drm: mediatek: fix unbind functions
  drm: mediatek: remove clk_unprepare() in mtk_drm_crtc_destroy()
  drm: mediatek: unbind components in mtk_drm_unbind()

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 4 ----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 8 +++-----
 drivers/gpu/drm/mediatek/mtk_dsi.c      | 4 +++-
 3 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.20.1
