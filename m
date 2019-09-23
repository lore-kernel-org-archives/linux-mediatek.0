From: Pi-Hsun Shih <pihsun@chromium.org>
Subject: Re: [PATCH 2/2] drm/mediatek: Apply CMDQ control flow
Date: Mon, 23 Sep 2019 16:14:55 +0800
Message-ID: <CANdKZ0du8unMedhmdjCyXR7xKYBoWEZ7YLmrvd6Y_W-Y=u3TfQ@mail.gmail.com>
References: <20190830074103.16671-1-bibby.hsieh@mediatek.com> <20190830074103.16671-3-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830074103.16671-3-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Philipp Zabel <p.zabel@pengutronix.de>, YT Shen <yt.shen@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, CK Hu <ck.hu@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>, open list <linux-kernel@vger.kernel.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Bibby,

On Fri, Aug 30, 2019 at 3:41 PM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
> ...
> +static void ddp_cmdq_cb(struct cmdq_cb_data data)
> +{
> +
> +#if IS_ENABLED(CONFIG_MTK_CMDQ)
> +       struct mtk_cmdq_cb_data *cb_data = data.data;
> +       struct drm_crtc_state *crtc_state = cb_data->state;
> +       struct drm_atomic_state *atomic_state = crtc_state->state;
> +       struct drm_crtc *crtc = crtc_state->crtc;
> +       struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +
> +       DRM_DEBUG_DRIVER("%s\n", __func__);
This debug message is printed about twice per second when enabled,
which makes debugging other things that also use DRM_DEBUG_DRIVER
harder. Can this be rate-limited or removed?

> +
> +       if (mtk_crtc->pending_needs_vblank) {
> +               /* cmdq_vblank_event must be read after cmdq_needs_event */
> +               smp_rmb();
> +
> ...
> +void mtk_drm_crtc_plane_update(struct drm_crtc *crtc, struct drm_plane *plane,
> +                              struct mtk_plane_state *state)
> +{
> +       struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +       struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
> +       struct drm_crtc_state *crtc_state = crtc->state;
> +       struct mtk_crtc_state *mtk_crtc_state = to_mtk_crtc_state(crtc_state);
> +       struct cmdq_pkt *cmdq_handle = mtk_crtc_state->cmdq_handle;
> +       unsigned int comp_layer_nr = mtk_ddp_comp_layer_nr(comp);
> +       unsigned int local_layer;
> +       unsigned int plane_index = plane - mtk_crtc->planes;
> +
> +       DRM_DEBUG_DRIVER("%s\n", __func__);
Same with this one.

> +       if (mtk_crtc->cmdq_client) {
> +               if (plane_index >= comp_layer_nr) {
> +                       comp = mtk_crtc->ddp_comp[1];
> +                       local_layer = plane_index - comp_layer_nr;
> ...
> @@ -494,13 +599,29 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>                                       struct drm_crtc_state *old_crtc_state)
>  {
>         struct drm_atomic_state *old_atomic_state = old_crtc_state->state;
> +       struct drm_crtc_state *crtc_state = crtc->state;
> +       struct mtk_crtc_state *state = to_mtk_crtc_state(crtc_state);
> +       struct cmdq_pkt *cmdq_handle = state->cmdq_handle;
>         struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>         struct mtk_drm_private *priv = crtc->dev->dev_private;
> +       struct mtk_cmdq_cb_data *cb_data;
>         unsigned int pending_planes = 0;
>         int i;
>
> -       if (mtk_crtc->event)
> -               mtk_crtc->pending_needs_vblank = true;
> +       DRM_DEBUG_DRIVER("[CRTC:%u] [STATE:%p(%p)->%p(%p)]\n", crtc->base.id,
> +                        old_crtc_state, old_crtc_state->state,
> +                        crtc_state, crtc_state->state);
Same with this one.

> +
> +       if (IS_ENABLED(CONFIG_MTK_CMDQ) && mtk_crtc->cmdq_client) {
> +               drm_atomic_state_get(old_atomic_state);
> +               cb_data = kmalloc(sizeof(*cb_data), GFP_KERNEL);
> +               cb_data->state = old_crtc_state;
> ...
