From: "dbasehore ." <dbasehore@chromium.org>
Subject: Re: [v8,2/4] drm/panel: set display info in panel attach
Date: Mon, 7 Oct 2019 15:01:25 -0700
Message-ID: <CAGAzgsoGNNTeYTmRyC5YNGDHL+SBB2oCFaHFubYa=dnPst=f8Q@mail.gmail.com>
References: <20190925225833.7310-3-dbasehore@chromium.org> <20190929052307.GA28304@jamwan02-TSP300>
 <CAGAzgspEA0mcEHwgxyWWh3Gn-iC+a21g5GUrhsRJrTHQ_OAYqQ@mail.gmail.com> <20191007164441.GB126146@art_vandelay>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007164441.GB126146@art_vandelay>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Paul <sean@poorly.run>
Cc: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, nd <nd@arm.com>
List-Id: linux-mediatek@lists.infradead.org

On Mon, Oct 7, 2019 at 9:44 AM Sean Paul <sean@poorly.run> wrote:
>
> On Mon, Sep 30, 2019 at 04:14:54PM -0700, dbasehore . wrote:
> > On Sat, Sep 28, 2019 at 10:23 PM james qian wang (Arm Technology
> > China) <james.qian.wang@arm.com> wrote:
> > >
> > > On Wed, Sep 25, 2019 at 03:58:31PM -0700, Derek Basehore wrote:
> > > > Devicetree systems can set panel orientation via a panel binding, but
> > > > there's no way, as is, to propagate this setting to the connector,
> > > > where the property need to be added.
> > > > To address this, this patch sets orientation, as well as other fixed
> > > > values for the panel, in the drm_panel_attach function. These values
> > > > are stored from probe in the drm_panel struct.
> > > >
> > > > Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> > > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_panel.c | 28 +++++++++++++++++++++
> > > >  include/drm/drm_panel.h     | 50 +++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 78 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > > > index 0909b53b74e6..1cd2b56c9fe6 100644
> > > > --- a/drivers/gpu/drm/drm_panel.c
> > > > +++ b/drivers/gpu/drm/drm_panel.c
> > > > @@ -104,11 +104,23 @@ EXPORT_SYMBOL(drm_panel_remove);
> > > >   */
> > > >  int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector)
> > > >  {
> > > > +     struct drm_display_info *info;
> > > > +
> > > >       if (panel->connector)
> > > >               return -EBUSY;
> > > >
> > > >       panel->connector = connector;
> > > >       panel->drm = connector->dev;
> > > > +     info = &connector->display_info;
> > > > +     info->width_mm = panel->width_mm;
> > > > +     info->height_mm = panel->height_mm;
> > > > +     info->bpc = panel->bpc;
> > > > +     info->panel_orientation = panel->orientation;
> > > > +     info->bus_flags = panel->bus_flags;
> > > > +     if (panel->bus_formats)
> > > > +             drm_display_info_set_bus_formats(&connector->display_info,
> > > > +                                              panel->bus_formats,
> > > > +                                              panel->num_bus_formats);
> > > >
> > > >       return 0;
> > > >  }
> > > > @@ -126,6 +138,22 @@ EXPORT_SYMBOL(drm_panel_attach);
> > > >   */
> > > >  void drm_panel_detach(struct drm_panel *panel)
> > > >  {
> > > > +     struct drm_display_info *info;
> > > > +
> > > > +     if (!panel->connector)
> > > > +             goto out;
> > > > +
> > > > +     info = &panel->connector->display_info;
> > > > +     info->width_mm = 0;
> > > > +     info->height_mm = 0;
> > > > +     info->bpc = 0;
> > > > +     info->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> > > > +     info->bus_flags = 0;
> > > > +     kfree(info->bus_formats);
> > > > +     info->bus_formats = NULL;
> > > > +     info->num_bus_formats = 0;
> > > > +
> > > > +out:
> > > >       panel->connector = NULL;
> > > >       panel->drm = NULL;
> > > >  }
> > > > diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> > > > index d16158deacdc..f3587a54b8ac 100644
> > > > --- a/include/drm/drm_panel.h
> > > > +++ b/include/drm/drm_panel.h
> > > > @@ -141,6 +141,56 @@ struct drm_panel {
> > > >        */
> > > >       const struct drm_panel_funcs *funcs;
> > > >
> > >
> > > All these new added members seems dupliated with drm_display_info,
> > > So I think, can we add a new drm_plane_funcs func:
> > >
> > > int (*set_display_info)(struct drm_panel *panel,
> > >                         struct drm_display_info *info);
> >
> > I don't disagree personally, since I originally wrote it this way, but
> > 2 maintainers, Daniel Vetter and Thierry Reding, requested that it be
> > changed. Unless that decision is reversed, I won't be changing this.
> >
>
> Reading back the feedback on v1, I don't think anyone said they were against
> storing a drm_display_info struct in drm_panel (no one really weighed in on
> it one way or another). IMO duplicating a bunch of fields feels pretty icky.

Thanks for the review. Should we duplicate the entire struct, or just
create a sub-struct, say, physical_properties that will be part of
drm_display_info and drm_panel?

>
> I think most fields in drm_display_info have pretty reasonable defaults, so I'd
> recommend just storing a copy in drm_panel. As Thierry suggests, we can
> populate the dt parts in probe (orientation) and then copy over all or a subset
> of the struct to connector on attach.
>
> Sean
>
> > >
> > > Then in drm_panel_attach(), via this interface the specific panel
> > > driver can directly set connector->display_info. like
> > >
> > >    ...
> > >    if (panel->funcs && panel->funcs->set_display_info)
> > >                 panel->funcs->unprepare(panel, connector->display_info);
> > >    ...
> > >
> > > Thanks
> > > James
> > >
> > > > +     /**
> > > > +      * @width_mm:
> > > > +      *
> > > > +      * Physical width in mm.
> > > > +      */
> > > > +     unsigned int width_mm;
> > > > +
> > > > +     /**
> > > > +      * @height_mm:
> > > > +      *
> > > > +      * Physical height in mm.
> > > > +      */
> > > > +     unsigned int height_mm;
> > > > +
> > > > +     /**
> > > > +      * @bpc:
> > > > +      *
> > > > +      * Maximum bits per color channel. Used by HDMI and DP outputs.
> > > > +      */
> > > > +     unsigned int bpc;
> > > > +
> > > > +     /**
> > > > +      * @orientation
> > > > +      *
> > > > +      * Installation orientation of the panel with respect to the chassis.
> > > > +      */
> > > > +     int orientation;
> > > > +
> > > > +     /**
> > > > +      * @bus_formats
> > > > +      *
> > > > +      * Pixel data format on the wire.
> > > > +      */
> > > > +     const u32 *bus_formats;
> > > > +
> > > > +     /**
> > > > +      * @num_bus_formats:
> > > > +      *
> > > > +      * Number of elements pointed to by @bus_formats
> > > > +      */
> > > > +     unsigned int num_bus_formats;
> > > > +
> > > > +     /**
> > > > +      * @bus_flags:
> > > > +      *
> > > > +      * Additional information (like pixel signal polarity) for the pixel
> > > > +      * data on the bus.
> > > > +      */
> > > > +     u32 bus_flags;
> > > > +
> > > >       /**
> > > >        * @list:
> > > >        *
> >
> > Thanks for the review
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
