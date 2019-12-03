Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0B9C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 07:25:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F166020684
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 07:25:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sqf/7I3L";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YD9x8SmL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F166020684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U95vkK0As1tkDf4T/PwZmXpOHHWXmXMT1M/Yv8GdjbQ=; b=Sqf/7I3L6/NBix
	jm9yVL/qcG82Hzxo24urXHlumZiUoBHHnjNT+Sjlg23WSf31844gfzYChNb6K/J/GWKXtMAXy4+wZ
	C4JLS37y1eEg1eneW/AvdT+ZHuThO3KjFM9i7ZAKG3bojFz4ULmlXOJ+UN0MTeisw9HPL/V6Yex20
	28Pgwq0p5U3oak1a6aBmbrFWYKIZDRknBj4Er0oLOZDjEYVzxld6P4ZhLjWvWo7XY9bgNhJc6+PjZ
	VKlHZgBVslq/obVx0WO8j1plAaX+VPHdiABdqaIy8glyxFpOO/r4HZLQc4ZFvc5M5m08blUn6PuV3
	oNQ+84+Tm01qfaVh0+Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic2YY-0003lI-6k; Tue, 03 Dec 2019 07:25:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic2YG-00031F-Ug; Tue, 03 Dec 2019 07:24:54 +0000
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0E87309;
 Tue,  3 Dec 2019 08:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1575357891;
 bh=sAQFNNZ440Vab1+8Na2Bxa9TGm6vttJhJrontuPgDZA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YD9x8SmLLYHikneU71eOyZ8x2fR/msfR6zJzJz8pqI9yULDm3Gmv01HVjW8BqAEU/
 TLO3y1j77KJFRcRvihUH6UIEo9145O7D9VROBibD3cpUSdelgQQzNQhWX9rzGc8OaV
 hQhTcoJxvfBQ7AjDlKEU0/lyx+8KH10mW6epkakg=
Date: Tue, 3 Dec 2019 09:24:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 0/26] drm/panel infrastructure + backlight update
Message-ID: <20191203072443.GK4730@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_232453_285945_D8903DB5 
X-CRM114-Status: GOOD (  21.35  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stefan Agner <stefan@agner.ch>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sam,

On Mon, Dec 02, 2019 at 08:32:04PM +0100, Sam Ravnborg wrote:
> This patchset include a couple of different
> things - all related to panels.
> 
> - The panel callbacks are optional - so drop error if
>   callback is not present.
>  
> - Add support for backlight in drm_panel.
>   This allows us to make much simpler backlight
>   support to most panels.
>   The patchset include conversion of most of the
>   trivial cases.
> 
> - Drop drm_connector from drm_panel.
>   This change required many changes to most
>   panels and many bridges and display drivers.
>   This is by far the most invasive change in this patchset.
> 
> - Drop the unused get_timings() callback.
>   No users, so no need to keep it around.
> 
> With this patchset drm_panel_(attach|detach) are nop's
> but they are kept for now.
> 
> A few of these patches has been sent out before - but versioning
> started again from v1 - as the most patches are new.
> 
> I have tested the panel-simple changes, and thus some
> of the infrastructure changes.
> The testing was done on an earlier iteration - and I ended
> up submitting this as Laurent and others started to depend on it.
> Jitao has a patch to add more callbacks, and I wanted the
> simplification of the callbacks before we add more callbacks.

Great series !!! Thanks for working on this.

> Sam Ravnborg (26):
>       drm/drm_panel: no error when no callback
>       drm/panel: add backlight support
>       drm/panel: simple: use drm_panel backlight support
>       drm: get drm_bridge_panel connector via helper
>       drm/panel: add drm_connector argument to get_modes()
>       drm/panel: decouple connector from drm_panel
>       drm/panel: remove get_timings
>       drm/panel: drop drm_device from drm_panel
>       drm/panel: feiyang-fy07024di26a30d: use drm_panel backlight support
>       drm/panel: ilitek-ili9881c: use drm_panel backlight support
>       drm/panel: innolux-p079zca: use drm_panel backlight support
>       drm/panel: kingdisplay-kd097d04: use drm_panel backlight support
>       drm/panel: lvds: use drm_panel backlight support
>       drm/panel: olimex-lcd-olinuxino: use drm_panel backlight support
>       drm/panel: osd-osd101t2587-53ts: use drm_panel backlight support
>       drm/panel: panasonic-vvx10f034n00: use drm_panel backlight support
>       drm/panel: raydium-rm68200: use drm_panel backlight support
>       drm/panel: rocktech-jh057n00900: use drm_panel backlight support
>       drm/panel: ronbo-rb070d30: use drm_panel backlight support
>       drm/panel: seiko-43wvf1g: use drm_panel backlight support
>       drm/panel: sharp-lq101r1sx01: use drm_panel backlight support
>       drm/panel: sharp-ls043t1le01: use drm_panel backlight support
>       drm/panel: sitronix-st7701: use drm_panel backlight support
>       drm/panel: sitronix-st7789v: use drm_panel backlight support
>       drm/panel: tpo-td028ttec1: use drm_panel backlight support
>       drm/panel: tpo-tpg110: use drm_panel backlight support

For patches 09/26 to 26/26,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> 
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   2 +-
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   2 +-
>  drivers/gpu/drm/bridge/panel.c                     |  18 +++-
>  drivers/gpu/drm/bridge/parade-ps8622.c             |   2 +-
>  drivers/gpu/drm/bridge/tc358764.c                  |   2 +-
>  drivers/gpu/drm/bridge/tc358767.c                  |   2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   2 +-
>  drivers/gpu/drm/drm_panel.c                        |  96 ++++++++++++++----
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c            |   2 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |   2 +-
>  drivers/gpu/drm/imx/imx-ldb.c                      |   2 +-
>  drivers/gpu/drm/imx/parallel-display.c             |   2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +-
>  .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |   2 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c              |   2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_out.c                  |   2 +-
>  drivers/gpu/drm/omapdrm/omap_connector.c           |   3 +-
>  drivers/gpu/drm/panel/panel-arm-versatile.c        |   6 +-
>  .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |  16 ++-
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |  20 ++--
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  29 ++----
>  drivers/gpu/drm/panel/panel-innolux-p079zca.c      |  45 +++------
>  drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |  11 ++-
>  drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |  43 +++-----
>  drivers/gpu/drm/panel/panel-lg-lb035q02.c          |   6 +-
>  drivers/gpu/drm/panel/panel-lg-lg4573.c            |  12 +--
>  drivers/gpu/drm/panel/panel-lvds.c                 |  46 ++-------
>  drivers/gpu/drm/panel/panel-nec-nl8048hl11.c       |   6 +-
>  drivers/gpu/drm/panel/panel-novatek-nt39016.c      |   6 +-
>  drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c |  27 ++---
>  drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |  11 ++-
>  drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |  37 +++----
>  .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |  58 +++--------
>  .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |   9 +-
>  drivers/gpu/drm/panel/panel-raydium-rm67191.c      |   8 +-
>  drivers/gpu/drm/panel/panel-raydium-rm68200.c      |  26 +++--
>  drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c |  35 +++----
>  drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |  31 ++----
>  drivers/gpu/drm/panel/panel-samsung-ld9040.c       |   4 +-
>  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |   6 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |   6 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |   6 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |   6 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |   4 +-
>  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |  72 +++-----------
>  drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    |  34 +++----
>  drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c    |   6 +-
>  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |  33 +++----
>  drivers/gpu/drm/panel/panel-simple.c               | 110 ++++++---------------
>  drivers/gpu/drm/panel/panel-sitronix-st7701.c      |  23 ++---
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c     |  49 ++-------
>  drivers/gpu/drm/panel/panel-sony-acx565akm.c       |   6 +-
>  drivers/gpu/drm/panel/panel-tpo-td028ttec1.c       |  20 ++--
>  drivers/gpu/drm/panel/panel-tpo-td043mtea1.c       |   6 +-
>  drivers/gpu/drm/panel/panel-tpo-tpg110.c           |  26 ++---
>  drivers/gpu/drm/panel/panel-truly-nt35597.c        |   4 +-
>  drivers/gpu/drm/pl111/pl111_drv.c                  |   2 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                |   2 +-
>  drivers/gpu/drm/rockchip/rockchip_lvds.c           |   2 +-
>  drivers/gpu/drm/sti/sti_dvo.c                      |   2 +-
>  drivers/gpu/drm/sun4i/sun4i_lvds.c                 |   2 +-
>  drivers/gpu/drm/sun4i/sun4i_rgb.c                  |   2 +-
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |   2 +-
>  drivers/gpu/drm/tegra/output.c                     |   2 +-
>  drivers/gpu/drm/tve200/tve200_drv.c                |   2 +-
>  include/drm/drm_bridge.h                           |   1 +
>  include/drm/drm_panel.h                            |  49 ++++-----
>  68 files changed, 460 insertions(+), 664 deletions(-)

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
