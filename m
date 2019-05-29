From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v2 0/4] fix mediatek drm, dis, and disp-* unbind/bind
Date: Wed, 29 May 2019 18:25:51 +0800
Message-ID: <20190529102555.251579-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

There are some errors when unbinding and rebinding mediatek drm, dsi,
and disp-* drivers. This series is to fix those errors and warnings.

Hsin-Yi Wang (4):
  drm: mediatek: fix unbind functions
  drm: mediatek: unbind components in mtk_drm_unbind()
  drm: mediatek: call drm_atomic_helper_shutdown() when unbinding driver
  drm: mediatek: clear num_pipes when unbind driver

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 +++-----
 drivers/gpu/drm/mediatek/mtk_dsi.c     | 2 ++
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.20.1
