From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 1/3] drm: mediatek: fix unbind functions
Date: Wed, 29 May 2019 12:13:12 +0800
Message-ID: <CAJMQK-inLLC+ePfgBJuGYro3z87hvQ8rLQJX-uiEDn_8svnQ1w@mail.gmail.com>
References: <20190527045054.113259-1-hsinyi@chromium.org> <20190527045054.113259-2-hsinyi@chromium.org>
 <1559093711.11380.6.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559093711.11380.6.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, May 29, 2019 at 9:35 AM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Hsin-yi:
>
> On Mon, 2019-05-27 at 12:50 +0800, Hsin-Yi Wang wrote:
> > move mipi_dsi_host_unregister() to .remove since mipi_dsi_host_register()
> > is called in .probe.
>
> In the latest kernel [1], mipi_dsi_host_register() is called in
> mtk_dsi_bind(), I think we don't need this part.
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_dsi.c?h=v5.2-rc2

This patch https://patchwork.kernel.org/patch/10949305/ moves
mipi_dsi_host_register() from .bind to .probe. I'll reply there to ask
the owner to do this.

>
> >
> > detatch panel in mtk_dsi_destroy_conn_enc(), since .bind will try to
> > attach it again.
> >
> > Fixes: 2e54c14e310f ("drm/mediatek: Add DSI sub driver")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index b00eb2d2e086..c9b6d3a68c8b 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -844,6 +844,8 @@ static void mtk_dsi_destroy_conn_enc(struct mtk_dsi *dsi)
> >       /* Skip connector cleanup if creation was delegated to the bridge */
> >       if (dsi->conn.dev)
> >               drm_connector_cleanup(&dsi->conn);
> > +     if (dsi->panel)
> > +             drm_panel_detach(dsi->panel);
>
> I think mtk_dsi_destroy_conn_enc() has much thing to do and I would like
> you to do more. You could refer to [2] for complete implementation.
>
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/exynos/exynos_drm_dsi.c?h=v5.2-rc2#n1575

Will update in next version.

Thanks
