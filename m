From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 1/3] drm: mediatek: fix unbind functions
Date: Wed, 29 May 2019 15:06:27 +0800
Message-ID: <CAJMQK-jDhDNViUA3dpixG=_Pe7x0qH4utBWy3k+D_+oKwEOPig@mail.gmail.com>
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
> I think mtk_dsi_destroy_conn_enc() has much thing to do and I would like
> you to do more. You could refer to [2] for complete implementation.
>
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/exynos/exynos_drm_dsi.c?h=v5.2-rc2#n1575
>
Hi CK,

Since drm_encoder_cleanup() would already call drm_bridge_detach() to
detach bridge, I think we only need to handle panel case here.
We don't need to call mtk_dsi_encoder_disable() since
mtk_output_dsi_disable() is called in mtk_dsi_remove() and
dsi->enabled will be set to false. Calling second time will just
returns immediately.
So, besides setting

dsi->panel = NULL;
dsi->conn.status = connector_status_disconnected;

are there other things we need to do here?

Original code doesn't have drm_kms_helper_hotplug_event(), and I'm not
sure if mtk dsi would need this.
Also, mtk_dsi_stop() would also stop irq.

Thanks
