From: Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 00/36] Add support 10bit yuv format
Date: Mon, 23 Sep 2019 20:38:49 +0800
Message-ID: <1569242365-182133-1-git-send-email-hjc@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, hjc@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

This series of patches is to add 2 plane YCbCr 10bit format
support, but now the drm_format_info.cpp[3] unit is BytePerPlane,
when we add define 10bit YUV format, here have some problems.
So we change cpp to bpp, use unit BitPerPlane to describe the data
format.

Sandy Huang (36):
  drm/fourcc: Add 2 plane YCbCr 10bit format support
  drm/rockchip: use bpp instead of cpp for drm_format_info
  drm/i915: use bpp instead of cpp for drm_format_info
  drm: exynos: use bpp instead of cpp for drm_format_info
  drm/sun4i: use bpp instead of cpp for drm_format_info
  drm/amd: use bpp instead of cpp for drm_format_info
  drm/gma500: use bpp instead of cpp for drm_format_info
  drm/msm: use bpp instead of cpp for drm_format_info
  dm/vmwgfx: use bpp instead of cpp for drm_format_info
  drm/arm: use bpp instead of cpp for drm_format_info
  drm/armada: use bpp instead of cpp for drm_format_info
  drm/radeon: use bpp instead of cpp for drm_format_info
  drm/nouveau: use bpp instead of cpp for drm_format_info
  drm/tegra: use bpp instead of cpp for drm_format_info
  drm/mediatek: use bpp instead of cpp for drm_format_info
  drm/tilcdc: use bpp instead of cpp for drm_format_info
  drm/zte: use bpp instead of cpp for drm_format_info
  drm/xen: use bpp instead of cpp for drm_format_info
  drm/vkms: use bpp instead of cpp for drm_format_info
  drm/ast: use bpp instead of cpp for drm_format_info
  drm/vc4: use bpp instead of cpp for drm_format_info
  drm/atmel-hlcdc: use bpp instead of cpp for drm_format_info
  drm/cirrus: use bpp instead of cpp for drm_format_info
  drm/hisilicon: use bpp instead of cpp for drm_format_info
  drm/imx: use bpp instead of cpp for drm_format_info
  drm/vboxvideo: use bpp instead of cpp for drm_format_info
  drm/pl111: use bpp instead of cpp for drm_format_info
  drm/qxl: use bpp instead of cpp for drm_format_info
  drm/ingenic: use bpp instead of cpp for drm_format_info
  drm/sti: use bpp instead of cpp for drm_format_info
  drm/stm: use bpp instead of cpp for drm_format_info
  drm/mcde: use bpp instead of cpp for drm_format_info
  drm/mgag200: use bpp instead of cpp for drm_format_info
  drm/tve200: use bpp instead of cpp for drm_format_info
  drm/udl: use bpp instead of cpp for drm_format_info
  drm/omapdrm: use bpp instead of cpp for drm_format_info

 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   6 +-
 .../drm/arm/display/komeda/komeda_framebuffer.c    |   2 +-
 drivers/gpu/drm/arm/malidp_hw.c                    |   2 +-
 drivers/gpu/drm/arm/malidp_planes.c                |   2 +-
 drivers/gpu/drm/armada/armada_fbdev.c              |   2 +-
 drivers/gpu/drm/armada/armada_plane.c              |   6 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   8 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |   2 +-
 drivers/gpu/drm/cirrus/cirrus.c                    |  10 +-
 drivers/gpu/drm/drm_client.c                       |   4 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   8 +-
 drivers/gpu/drm/drm_format_helper.c                |   4 +-
 drivers/gpu/drm/drm_fourcc.c                       | 172 +++++++++++----------
 drivers/gpu/drm/drm_framebuffer.c                  |   2 +-
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |   4 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |   4 +-
 drivers/gpu/drm/exynos/exynos_mixer.c              |   4 +-
 drivers/gpu/drm/gma500/framebuffer.c               |   4 +-
 drivers/gpu/drm/gma500/gma_display.c               |   4 +-
 drivers/gpu/drm/gma500/mdfld_intel_display.c       |   6 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |   4 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |   6 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  28 ++--
 drivers/gpu/drm/i915/display/intel_fbc.c           |   8 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   6 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   4 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   4 +-
 drivers/gpu/drm/i915/intel_pm.c                    |  28 ++--
 drivers/gpu/drm/imx/ipuv3-plane.c                  |   8 +-
 drivers/gpu/drm/ingenic/ingenic-drm.c              |   2 +-
 drivers/gpu/drm/mcde/mcde_display.c                |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_fb.c              |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |   2 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |   2 +-
 drivers/gpu/drm/msm/msm_fb.c                       |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/base507c.c        |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c        |   2 +-
 drivers/gpu/drm/omapdrm/omap_fb.c                  |   8 +-
 drivers/gpu/drm/pl111/pl111_display.c              |   2 +-
 drivers/gpu/drm/qxl/qxl_draw.c                     |   2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c             |  10 +-
 drivers/gpu/drm/radeon/r100.c                      |   4 +-
 drivers/gpu/drm/radeon/radeon_display.c            |   6 +-
 drivers/gpu/drm/radeon/radeon_fb.c                 |   2 +-
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c        |  14 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   4 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |   2 +-
 drivers/gpu/drm/stm/ltdc.c                         |   2 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   2 +-
 drivers/gpu/drm/tegra/dc.c                         |   2 +-
 drivers/gpu/drm/tegra/drm.c                        |   2 +-
 drivers/gpu/drm/tegra/fb.c                         |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   2 +-
 drivers/gpu/drm/tve200/tve200_display.c            |   2 +-
 drivers/gpu/drm/udl/udl_fb.c                       |   4 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |   2 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |  10 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   2 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c            |   2 +-
 drivers/gpu/drm/zte/zx_plane.c                     |   4 +-
 include/drm/drm_fourcc.h                           |   4 +-
 include/uapi/drm/drm_fourcc.h                      |  15 ++
 86 files changed, 299 insertions(+), 277 deletions(-)

-- 
2.7.4
