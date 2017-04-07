From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [GIT PULL] mediatek-drm-next for 4.12
Date: Sat, 8 Apr 2017 00:42:20 +0800
Message-ID: <1491583340.5667.9.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Shaoming Chen <shaoming.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Dave:

This series is MT2701 DRM support.

The following changes since commit
0168778115687486575a6831df865dbc4f5369fe:

  Merge branch 'drm-next-4.12' of
git://people.freedesktop.org/~agd5f/linux into drm-next (2017-04-07
05:49:12 +1000)

are available in the git repository at:


  https://github.com/ckhu-mediatek/linux.git-tags.git drm-next-4.12

for you to fetch changes up to 84a5ead18e57e9018d3de0a5388be8f6c2686329:

  drm/mediatek: add support for Mediatek SoC MT2701 (2017-04-08 00:02:17
+0800)

----------------------------------------------------------------
shaoming chen (2):
      drm/mediatek: add dsi interrupt control
      drm/mediatek: add dsi transfer function

yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org (10):
      dt-bindings: display: mediatek: update supported chips
      drm/mediatek: add helpers for coverting from the generic
components
      drm/mediatek: add *driver_data for different hardware settings
      drm/mediatek: add shadow register support
      drm/mediatek: add BLS component
      drm/mediatek: update display module connections
      drm/mediatek: cleaning up and refine
      drm/mediatek: add non-continuous clock mode and EOT packet control
      drm/mediatek: update DSI sub driver flow for sending commands to
panel
      drm/mediatek: add support for Mediatek SoC MT2701

 .../bindings/display/mediatek/mediatek,disp.txt    |   2 +
 .../bindings/display/mediatek/mediatek,dsi.txt     |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  64 ++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  39 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  75 +--
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 138 +++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  69 ++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  54 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   9 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 | 572
++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c             |  38 +-
 13 files changed, 828 insertions(+), 238 deletions(-)

Regards,
CK
