From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 1/4] drm: mediatek: fix unbind functions
Date: Thu, 30 May 2019 10:13:35 +0800
Message-ID: <1559182415.6868.0.camel@mtksdaap41>
References: <20190529102555.251579-1-hsinyi@chromium.org>
         <20190529102555.251579-2-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529102555.251579-2-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Hsin-Yi:

On Wed, 2019-05-29 at 18:25 +0800, Hsin-Yi Wang wrote:
> detatch panel in mtk_dsi_destroy_conn_enc(), since .bind will try to
> attach it again.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Fixes: 2e54c14e310f ("drm/mediatek: Add DSI sub driver")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> change log v1->v2:
> * mipi_dsi_host_unregister() should be fixed in another patch on the list.
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index b00eb2d2e086..1ae3be99e0ff 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -844,6 +844,8 @@ static void mtk_dsi_destroy_conn_enc(struct mtk_dsi *dsi)
>  	/* Skip connector cleanup if creation was delegated to the bridge */
>  	if (dsi->conn.dev)
>  		drm_connector_cleanup(&dsi->conn);
> +	if (dsi->panel)
> +		drm_panel_detach(dsi->panel);
>  }
>  
>  static void mtk_dsi_ddp_start(struct mtk_ddp_comp *comp)
