From: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH 0/3] Mediatek drm driver use drm_gem_cma_object instead of mtk_drm_gem_obj
Date: Fri, 26 Oct 2018 15:22:00 +0800
Message-ID: <1540538523-1973-1-git-send-email-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org


Because there are many similar code in drm_gem_cma_helper.c and mtk_drm_gem.c,
merging these two files would reduce code size and be easier to maintain. The
major difference between these two gem object is that drm_gem_cma_object is for
CMA buffer and mtk_drm_gem_obj is for iommu buffer. This series just add two
iommu feature which is used by mediatek drm driver into cma helper, so there
is still some feature just support CMA buffer. The first feature is making sub
device as dma device for dma operation. So far drm core treat drm device as
dma device, but mediatek drm device is not a dma device and it use sub device
as dma device. The second feature is providing interface to create dumb buffer
without mapping kernel virtual address. For iommu buffer, mapping kernel virtual
address would reduce free virtual memory area. Some feature still support only
CMA buffer, for example, drm_gem_cma_prime_vmap(), so we still treat these
helper function as 'cma' helper function.

CK Hu (3):
  drm: Add dma_dev in struct drm_device
  drm: Add drm_gem_cma_dumb_create_no_kmap() helper function
  drm/mediatek: Use drm_gem_cma_object instead of mtk_drm_gem_obj

 drivers/gpu/drm/drm_gem_cma_helper.c     | 110 +++++++++++---
 drivers/gpu/drm/mediatek/Makefile        |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   |  15 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h   |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_fb.c    |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_gem.c   | 243 -------------------------------
 drivers/gpu/drm/mediatek/mtk_drm_gem.h   |  56 -------
 drivers/gpu/drm/mediatek/mtk_drm_plane.c |   8 +-
 include/drm/drm_device.h                 |   1 +
 include/drm/drm_gem_cma_helper.h         |   7 +
 11 files changed, 110 insertions(+), 334 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_gem.c
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_gem.h

-- 
1.9.1
