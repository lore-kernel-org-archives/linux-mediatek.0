From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v7 0/4] Panel rotation patches
Date: Wed, 10 Jul 2019 17:49:16 +0200
Message-ID: <20190710154916.GA13810@ravnborg.org>
References: <20190710021659.177950-1-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190710021659.177950-1-dbasehore@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Derek Basehore <dbasehore@chromium.org>
Cc: linux-kernel@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Derek.

On Tue, Jul 09, 2019 at 07:16:55PM -0700, Derek Basehore wrote:
> This adds the plumbing for reading panel rotation from the devicetree
> and sets up adding a panel property for the panel orientation on
> Mediatek SoCs when a rotation is present.
> 
> v7 changes:
> -forgot to add static inline
> 
> v6 changes:
> -added enum declaration to drm_panel.h header
> 
> v5 changes:
> -rebased
> 
> v4 changes:
> -fixed some changes made to the i915 driver
> -clarified comments on of orientation helper
> 
> v3 changes:
> -changed from attach/detach callbacks to directly setting fixed panel
>  values in drm_panel_attach
> -removed update to Documentation
> -added separate function for quirked panel orientation property init
> 
> v2 changes:
> fixed build errors in i915
> 
> Derek Basehore (4):
>   drm/panel: Add helper for reading DT rotation
>   drm/panel: set display info in panel attach
>   drm/connector: Split out orientation quirk detection
>   drm/mtk: add panel orientation property

First two patches are:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Last two patches are:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
