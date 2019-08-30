From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH 0/2] drm/mediatek: fixup cursor moving unsmooth issue
Date: Fri, 30 Aug 2019 15:38:17 +0800
Message-ID: <20190830073819.16566-1-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, YT Shen <yt.shen@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org, tfiga@chromium.org, drinkcat@chromium.org, linux-kernel@vger.kernel.org, Bibby Hsieh <bibby.hsieh@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

These patches can fixup cursor moving is not smooth when heavy load in
webgl.

Bibby Hsieh (2):
  drm/mediatek: Only block updates to CRTCs that have a pending update
  drm/mediatek: Bypass atomic helpers for cursor updates

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  53 +++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h  |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 214 ++++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.h   |  15 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c |  73 +++++++-
 5 files changed, 330 insertions(+), 27 deletions(-)

-- 
2.18.0
