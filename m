From: "dbasehore ." <dbasehore@chromium.org>
Subject: Re: [PATCH v3 2/4] drm/panel: set display info in panel attach
Date: Mon, 24 Jun 2019 16:04:54 -0700
Message-ID: <CAGAzgsrhS_nsXqf83ivZS5qcfT+Ss0=pzshH_i2+-Hd1iVNgNA@mail.gmail.com>
References: <20190622034105.188454-1-dbasehore@chromium.org> <20190622034105.188454-3-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190622034105.188454-3-dbasehore@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-med>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Jun 21, 2019 at 8:41 PM Derek Basehore <dbasehore@chromium.org> wrote:
>
> Devicetree systems can set panel orientation via a panel binding, but
> there's no way, as is, to propagate this setting to the connector,
> where the property need to be added.
> To address this, this patch sets orientation, as well as other fixed
> values for the panel, in the drm_panel_attach function. These values
> are stored from probe in the drm_panel struct.
>
> Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> ---
>  drivers/gpu/drm/drm_panel.c | 28 ++++++++++++++++++++++++++++
>  include/drm/drm_panel.h     | 14 ++++++++++++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 507099af4b57..5690fca30236 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -104,11 +104,23 @@ EXPORT_SYMBOL(drm_panel_remove);
>   */
>  int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector)
>  {
> +       struct drm_display_info *info;
> +
>         if (panel->connector)
>                 return -EBUSY;
>
>         panel->connector = connector;
>         panel->drm = connector->dev;
> +       info = &connector->display_info;
> +       info->width_mm = panel->width_mm;
> +       info->height_mm = panel->height_mm;
> +       info->bpc = panel->bpc;
> +       info->panel_orientation = panel->orientation;
> +       info->bus_flags = panel->bus_flags;
> +       if (panel->bus_formats)
> +               drm_display_info_set_bus_formats(&connector->display_info,
> +                                                panel->bus_formats,
> +                                                panel->num_bus_formats);
>
>         return 0;
>  }
> @@ -128,6 +140,22 @@ EXPORT_SYMBOL(drm_panel_attach);
>   */
>  int drm_panel_detach(struct drm_panel *panel)
>  {
> +       struct drm_display_info *info;
> +
> +       if (!panel->connector)
> +               goto out;
> +
> +       info = &panel->connector->display_info;
> +       info->width_mm = 0;
> +       info->height_mm = 0;
> +       info->bpc = 0;
> +       info->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> +       info->bus_flags = 0;
> +       kfree(info->bus_formats);
> +       info->bus_formats = NULL;
> +       info->num_bus_formats = 0;
> +
> +out:
>         panel->connector = NULL;
>         panel->drm = NULL;
>
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 3564952f1a4f..760ca5865962 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -37,6 +37,8 @@ struct display_timing;
>   * struct drm_panel_funcs - perform operations on a given panel
>   * @disable: disable panel (turn off back light, etc.)
>   * @unprepare: turn off panel
> + * @detach: detach panel->connector (clear internal state, etc.)
> + * @attach: attach panel->connector (update internal state, etc.)
>   * @prepare: turn on panel and perform set up
>   * @enable: enable panel (turn on back light, etc.)
>   * @get_modes: add modes to the connector that the panel is attached to and
> @@ -93,6 +95,18 @@ struct drm_panel {
>
>         const struct drm_panel_funcs *funcs;
>
> +       /*
> +        * panel information to be set in the connector when the panel is
> +        * attached.
> +        */
> +       unsigned int width_mm;
> +       unsigned int height_mm;
> +       unsigned int bpc;
> +       int orientation;
> +       const u32 *bus_formats;
> +       unsigned int num_bus_formats;
> +       u32 bus_flags;

Should probably put these in a struct to ensure the connector and
panel have the same data types. Will do in a following patch if we
stay with this.

> +
>         struct list_head list;
>  };
>
> --
> 2.22.0.410.gd8fdbe21b5-goog
>
