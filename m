From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/19] drm: drop use of drmp.h in drm-misc
Date: Tue, 16 Jul 2019 08:50:22 +0200
Message-ID: <20190716065022.GA18452@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190716064220.18157-1-sam@ravnborg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dri-devel@lists.freedesktop.org
Cc: Maxime Jourdan <mjourdan@baylibre.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>, Eric Anholt <eric@anholt.net>, Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Deepak Sharma <deepak.sharma@amd.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Kevin Hilman <khilman@baylibre.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Francisco Jerez <currojerez@riseup.net>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Dan Carpenter <dan.carpenter@oracle.com>, Robert Tarasov <tutankhame>
List-Id: linux-mediatek@lists.infradead.org

Copied all recipients on the cover letter.
As the list is long this mail may not hit the mailing lists.

	Sam

On Tue, Jul 16, 2019 at 08:42:01AM +0200, Sam Ravnborg wrote:
> This patch set removes a far share of the remaining uses of drmP.h.
> Common for all patches are that the respective files are maintained
> in drm-misc.
> All patches are independent.
> 
> Patches have all been build tested with various configs and various
> architectures.
> There are likely introduced a few build issues that randconfig
> build will reveal, but for all configs I have used the build was OK.
> 
> This patchset does not conclude the quest to kill all uses
> of drmP.h, but it is a major step towards the goal.
> 
> Please review/ack.
> I plan to apply the patches to drm-misc, but feel free
> to do it yourself.
> 
> There will be conflicts with the ongoing work on ttm, gem etc.
> But let's deal with the conflicts when they hit us - it
> is simple conflicts in the list of include files.
> 
> v2:
> - Removed merged patches
> - Added ack from Emil Velikov to the full series
> - Rebased on top of drm-misc-next
> - Hand-edited the list of Cc: as get_maintainer.pl in some
>   cases looks up too much people, due to cross kernel commits
> 
>         Sam
> 
> Sam Ravnborg (19):
>       drm/meson: drop use of drmP.h
>       drm/v3d: drop use of drmP.h
>       drm/pl111: drop use of drmP.h
>       drm/zte: drop use of drmP.h
>       drm/sun4i: drop use of drmP.h
>       drm/vc4: drop use of drmP.h
>       drm/r128: drop use of drmP.h
>       drm/udl: drop use of drmP.h
>       drm/omapdrm: drop use of drmP.h
>       drm/selftests: drop use of drmP.h
>       drm/tdfx: drop use of drmP.h
>       drm/vgem: drop use of drmP.h
>       drm/i810: drop use of drmP.h
>       drm/tilcdc: drop use of drmP.h
>       drm/i2c/ch7006: drop use of drmP.h
>       drm/i2c/sil164: drop use of drmP.h
>       drm/imx: drop use of drmP.h
>       drm/rockchip: drop use of drmP.h
>       drm/mediatek: drop use of drmP.h
> 
>  drivers/gpu/drm/i2c/ch7006_priv.h                |  1 -
>  drivers/gpu/drm/i2c/sil164_drv.c                 |  3 ++-
>  drivers/gpu/drm/i810/i810_dma.c                  | 17 +++++++++----
>  drivers/gpu/drm/i810/i810_drv.c                  |  8 +++---
>  drivers/gpu/drm/i810/i810_drv.h                  |  2 ++
>  drivers/gpu/drm/imx/dw_hdmi-imx.c                | 14 ++++++-----
>  drivers/gpu/drm/imx/imx-drm-core.c               |  8 ++++--
>  drivers/gpu/drm/imx/imx-ldb.c                    | 22 +++++++++--------
>  drivers/gpu/drm/imx/imx-tve.c                    | 10 +++++---
>  drivers/gpu/drm/imx/ipuv3-crtc.c                 |  8 ++++--
>  drivers/gpu/drm/imx/ipuv3-plane.c                |  5 ++--
>  drivers/gpu/drm/imx/parallel-display.c           |  8 +++---
>  drivers/gpu/drm/mediatek/mtk_disp_color.c        |  2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c          |  2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c         |  2 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c               | 18 ++++++++------
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c          | 10 +++++---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c      |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c           | 16 +++++++-----
>  drivers/gpu/drm/mediatek/mtk_drm_fb.c            |  7 +++---
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c           |  6 +++--
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c         |  2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c               | 14 ++++++-----
>  drivers/gpu/drm/mediatek/mtk_hdmi.c              | 14 +++++++----
>  drivers/gpu/drm/meson/meson_crtc.c               | 16 ++++++------
>  drivers/gpu/drm/meson/meson_drv.c                | 27 +++++++++------------
>  drivers/gpu/drm/meson/meson_drv.h                | 11 ++++++---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c            | 19 ++++++++-------
>  drivers/gpu/drm/meson/meson_overlay.c            | 13 ++++------
>  drivers/gpu/drm/meson/meson_plane.c              | 16 +++++-------
>  drivers/gpu/drm/meson/meson_registers.h          |  2 ++
>  drivers/gpu/drm/meson/meson_vclk.c               |  7 +++---
>  drivers/gpu/drm/meson/meson_vclk.h               |  4 +++
>  drivers/gpu/drm/meson/meson_venc.c               | 10 ++++----
>  drivers/gpu/drm/meson/meson_venc.h               |  2 ++
>  drivers/gpu/drm/meson/meson_venc_cvbs.c          | 11 ++++-----
>  drivers/gpu/drm/meson/meson_viu.c                |  7 ++----
>  drivers/gpu/drm/meson/meson_vpp.c                |  7 +++---
>  drivers/gpu/drm/meson/meson_vpp.h                |  3 +++
>  drivers/gpu/drm/omapdrm/omap_crtc.c              |  4 ++-
>  drivers/gpu/drm/omapdrm/omap_debugfs.c           |  2 ++
>  drivers/gpu/drm/omapdrm/omap_drv.c               | 10 ++++++--
>  drivers/gpu/drm/omapdrm/omap_drv.h               |  5 ++--
>  drivers/gpu/drm/omapdrm/omap_fb.c                |  4 +--
>  drivers/gpu/drm/omapdrm/omap_fbdev.c             |  2 ++
>  drivers/gpu/drm/omapdrm/omap_gem.c               |  2 ++
>  drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c        |  3 +++
>  drivers/gpu/drm/omapdrm/omap_irq.c               |  2 ++
>  drivers/gpu/drm/pl111/pl111_debugfs.c            |  4 ++-
>  drivers/gpu/drm/pl111/pl111_display.c            |  6 +++--
>  drivers/gpu/drm/pl111/pl111_drm.h                | 11 +++++----
>  drivers/gpu/drm/pl111/pl111_drv.c                |  9 ++++---
>  drivers/gpu/drm/pl111/pl111_nomadik.h            |  3 ++-
>  drivers/gpu/drm/pl111/pl111_versatile.c          |  9 ++++---
>  drivers/gpu/drm/pl111/pl111_versatile.h          |  3 +++
>  drivers/gpu/drm/r128/r128_ioc32.c                |  3 ++-
>  drivers/gpu/drm/r128/r128_irq.c                  |  5 +++-
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c  | 10 +++-----
>  drivers/gpu/drm/rockchip/cdn-dp-core.c           | 17 ++++++-------
>  drivers/gpu/drm/rockchip/cdn-dp-core.h           |  2 +-
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c  |  9 ++++---
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c      |  5 ++--
>  drivers/gpu/drm/rockchip/inno_hdmi.c             |  3 +--
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c      | 12 +++++----
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c       |  3 ++-
>  drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c    |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c      |  8 +++---
>  drivers/gpu/drm/rockchip/rockchip_drm_psr.c      |  1 -
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c      | 31 ++++++++++++------------
>  drivers/gpu/drm/rockchip/rockchip_lvds.c         | 16 ++++++------
>  drivers/gpu/drm/rockchip/rockchip_rgb.c          |  9 +++----
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c      | 11 ++++++---
>  drivers/gpu/drm/selftests/test-drm_framebuffer.c |  7 +++++-
>  drivers/gpu/drm/sun4i/sun4i_backend.c            | 16 ++++++------
>  drivers/gpu/drm/sun4i/sun4i_crtc.c               | 13 +++++-----
>  drivers/gpu/drm/sun4i/sun4i_drv.c                |  5 +++-
>  drivers/gpu/drm/sun4i/sun4i_framebuffer.c        |  1 -
>  drivers/gpu/drm/sun4i/sun4i_frontend.c           | 10 +++++---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c           | 17 +++++++------
>  drivers/gpu/drm/sun4i/sun4i_layer.c              |  3 +--
>  drivers/gpu/drm/sun4i/sun4i_lvds.c               |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_rgb.c                |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c               | 20 ++++++++-------
>  drivers/gpu/drm/sun4i/sun4i_tv.c                 |  4 ++-
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c           |  9 ++++---
>  drivers/gpu/drm/sun4i/sun8i_csc.c                |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c            |  3 +--
>  drivers/gpu/drm/sun4i/sun8i_mixer.c              | 14 +++++------
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c           |  6 ++---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c           |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c           |  1 -
>  drivers/gpu/drm/tdfx/tdfx_drv.c                  | 11 ++++++---
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c             | 18 ++++++++------
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c              | 19 ++++++++++++---
>  drivers/gpu/drm/tilcdc/tilcdc_drv.h              | 31 +++++++++++++-----------
>  drivers/gpu/drm/tilcdc/tilcdc_external.c         |  1 +
>  drivers/gpu/drm/tilcdc/tilcdc_panel.c            | 11 ++++++---
>  drivers/gpu/drm/tilcdc/tilcdc_plane.c            |  4 +--
>  drivers/gpu/drm/tilcdc/tilcdc_tfp410.c           |  8 +++---
>  drivers/gpu/drm/udl/udl_connector.c              |  4 +--
>  drivers/gpu/drm/udl/udl_connector.h              |  2 ++
>  drivers/gpu/drm/udl/udl_dmabuf.c                 |  6 +++--
>  drivers/gpu/drm/udl/udl_drv.c                    |  7 +++++-
>  drivers/gpu/drm/udl/udl_drv.h                    |  8 +++++-
>  drivers/gpu/drm/udl/udl_encoder.c                |  6 ++---
>  drivers/gpu/drm/udl/udl_fb.c                     | 15 ++++++------
>  drivers/gpu/drm/udl/udl_gem.c                    |  9 ++++---
>  drivers/gpu/drm/udl/udl_main.c                   |  6 +++--
>  drivers/gpu/drm/udl/udl_modeset.c                |  6 ++---
>  drivers/gpu/drm/udl/udl_transfer.c               |  4 ---
>  drivers/gpu/drm/v3d/v3d_debugfs.c                |  3 ++-
>  drivers/gpu/drm/v3d/v3d_drv.c                    |  5 +++-
>  drivers/gpu/drm/v3d/v3d_drv.h                    | 13 ++++++++--
>  drivers/gpu/drm/v3d/v3d_gem.c                    | 12 +++++----
>  drivers/gpu/drm/v3d/v3d_irq.c                    |  2 ++
>  drivers/gpu/drm/vc4/vc4_crtc.c                   | 11 ++++++---
>  drivers/gpu/drm/vc4/vc4_debugfs.c                |  1 -
>  drivers/gpu/drm/vc4/vc4_drv.c                    |  7 +++++-
>  drivers/gpu/drm/vc4/vc4_drv.h                    | 17 +++++++++----
>  drivers/gpu/drm/vc4/vc4_dsi.c                    | 17 +++++++------
>  drivers/gpu/drm/vc4/vc4_gem.c                    |  2 ++
>  drivers/gpu/drm/vc4/vc4_hvs.c                    |  5 +++-
>  drivers/gpu/drm/vc4/vc4_kms.c                    |  4 ++-
>  drivers/gpu/drm/vc4/vc4_plane.c                  |  6 +++--
>  drivers/gpu/drm/vc4/vc4_txp.c                    | 14 ++++++-----
>  drivers/gpu/drm/vc4/vc4_v3d.c                    |  4 +++
>  drivers/gpu/drm/vgem/vgem_drv.c                  | 11 +++++++--
>  drivers/gpu/drm/vgem/vgem_drv.h                  |  1 -
>  drivers/gpu/drm/vgem/vgem_fence.c                |  2 ++
>  drivers/gpu/drm/zte/zx_drm_drv.c                 |  3 ++-
>  drivers/gpu/drm/zte/zx_hdmi.c                    |  2 +-
>  drivers/gpu/drm/zte/zx_plane.c                   |  2 +-
>  drivers/gpu/drm/zte/zx_tvenc.c                   |  4 ++-
>  drivers/gpu/drm/zte/zx_vga.c                     |  4 ++-
>  drivers/gpu/drm/zte/zx_vou.c                     |  5 +++-
>  include/linux/soc/amlogic/meson-canvas.h         |  1 +
>  136 files changed, 626 insertions(+), 427 deletions(-)
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
