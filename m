From: Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2 0/2] drm/mediatek: make imported PRIME buffers contiguous
Date: Mon, 29 Jul 2019 14:33:33 +0900
Message-ID: <20190729053335.251379-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

The default DMA segment size was used when importing PRIME buffers,
which resulted in a chance of them not being contiguous in the virtual
IO space of the device and mtk_gem_prime_import_sg_table() complaining
that the SG table was not contiguous as it expects.

This series fixes this issue by

1) Using the correct DMA device when importing PRIME buffers,
2) Setting a more suitable DMA segment size on the DMA device than the
default 64KB.

Changes since v1:
- Split into two patches,
- Fixed an error path that would have returned 0.

Alexandre Courbot (2):
  drm/mediatek: use correct device to import PRIME buffers
  drm/mediatek: set DMA max segment size

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 49 ++++++++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |  2 ++
 2 files changed, 48 insertions(+), 3 deletions(-)

-- 
2.22.0.709.g102302147b-goog
