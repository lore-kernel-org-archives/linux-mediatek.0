From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH] gpu/drm: mediatek: call mtk_dsi_stop() after mtk_drm_crtc_atomic_disable()
Date: Wed, 20 Mar 2019 13:39:25 +0800
Message-ID: <CAJMQK-gSWiqu-cdBpsz54U_427bB7w3vZ01u6n2L0Ghd9vG6Dw@mail.gmail.com>
References: <20190318040915.101218-1-hsinyi@chromium.org> <1553051356.20221.23.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553051356.20221.23.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Mar 20, 2019 at 11:09 AM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Hsin-yi:
>
> On Mon, 2019-03-18 at 12:09 +0800, Hsin-Yi Wang wrote:
> > mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(), which needs
> > ovl irq for drm_crtc_wait_one_vblank(), since after mtk_dsi_stop() is called,
> > ovl irq will be disabled. If drm_crtc_wait_one_vblank() is called after last
> > irq, it will timeout with this message: "vblank wait timed out on crtc 0". This
> > happens sometimes when turning off the screen.
> >
> > In drm_atomic_helper.c#disable_outputs(),
> > the calling sequence when turning off the screen is:
> >
> > 1. mtk_dsi_encoder_disable()
> >      --> mtk_output_dsi_disable()
> >        --> mtk_dsi_stop();  // sometimes make vblank timeout in atomic_disable
> >          --> mtk_dsi_poweroff();
> > 2. mtk_drm_crtc_atomic_disable()
> >      --> drm_crtc_wait_one_vblank();
> >      ...
> >        --> mtk_dsi_ddp_stop()
> >          --> mtk_dsi_poweroff();
> >
>
> Thanks for your inference, but I wonder this patch meet all
> consideration. In MT8173 with a bridge chip, the timing to disable dsi
> signal output would influence bridge chip output garbage or not. It's
> better that you could test this on MT8173, or let this patch go for
> weeks and wait for someone to test. If no one care about MT8173, I could
> accept this patch.
We care about MT8173, but it's not easy to test since we have to bring
the whole kernel to >= 4.19 to be able to test latest dsi driver.
The patch (0707632b5bac) that added mtk_dsi_stop() was after MT8173
(on 3.18), for panel without bridge, so I think without mtk_dsi_stop()
was also working fine for MT8173.

>
> > Change to make mtk_dsi_stop() called in mtk_dsi_ddp_stop() instead of
> > mtk_output_dsi_disable().
>
> mtk_dsi_poweroff() has reference count, why not just move mtk_dsi_stop()
> into mtk_dsi_poweroff()?
Yes, we can also call mtk_dsi_stop() in mtk_dsi_poweroff() when
refcount is 0. I can send v2 if you think this way is better.

Thanks
>
> Regards,
> CK
>
> >
> > Fixes: 0707632b5bac ("drm/mediatek: update DSI sub driver flow for sending commands to panel")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index b00eb2d2e086..cdd9637dd517 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -696,7 +696,6 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
> >               }
> >       }
> >
> > -     mtk_dsi_stop(dsi);
> >       mtk_dsi_poweroff(dsi);
> >
> >       dsi->enabled = false;
> > @@ -857,6 +856,7 @@ static void mtk_dsi_ddp_stop(struct mtk_ddp_comp *comp)
> >  {
> >       struct mtk_dsi *dsi = container_of(comp, struct mtk_dsi, ddp_comp);
> >
> > +     mtk_dsi_stop(dsi);
> >       mtk_dsi_poweroff(dsi);
> >  }
> >
> > @@ -1178,6 +1178,8 @@ static int mtk_dsi_remove(struct platform_device *pdev)
> >       struct mtk_dsi *dsi = platform_get_drvdata(pdev);
> >
> >       mtk_output_dsi_disable(dsi);
> > +     mtk_dsi_stop(dsi);
> > +     mtk_dsi_poweroff(dsi);
> >       component_del(&pdev->dev, &mtk_dsi_component_ops);
> >
> >       return 0;
>
>
