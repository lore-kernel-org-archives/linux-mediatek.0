Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83485C77B7D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 09:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqvZm3jX+oCky55eGGEiBj1DIykp3O76uqhIHQxlofs=; b=Idnn6uQ+nCUYZCR5B94uzqNNQf
	n856Y90183YVqCG0JX3KVkdsxhexqnMFo3SXY1UPeCFi+jZMZbjEBjfz2lD9Z+Pdc52seJEbhcVaY
	Est4Y4aunqnNaO3FLfaD6W8WjdQWawByib8oVGX8f7tTfZDWW3d1LQInycdIL9KV107CXJOQcjOfL
	X+WVP+APKOqPH7Hz4go8ybn1l5xMq+3HCpxG0nDod2w37aPinUQRO6GWUEEeV7lWIPzyJgufgw9Wj
	y8XdAWoP/X0MXSv8Y+zVJe95zo4/X09wmlIroY4howukUkcXaKLbwE3vP8+HTcMBEtYjAOra7vL0H
	OOHUi+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzZwt-00CSOt-2U;
	Thu, 18 May 2023 09:29:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzZwq-00CSNI-0j;
	Thu, 18 May 2023 09:29:26 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8AB0B6605861;
	Thu, 18 May 2023 10:29:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684402160;
	bh=nO1qbDSDKeG4upZYJigwBkYn0wg3Z18pIrTau60pRpQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NlxO0kvnAnt4rAqVLGHRALxbE9Npm3bdEo/S6HFWhtZ/wyKmU3EN3mR2ldnm9TiQu
	 hetmFjAQqdN1Vtn+tf5vnQFJllN0AIK3KgnHrqhiB4/53dn9n1NsyKrwCtvLbodE1x
	 nTFlicbGA4yt6qSNBXxWrSCPuZZ01Gg04v6xYf5Aqjquf5d71ybyA3O0/ypY9jqPkd
	 qxn4MMrorLli6Cywk0sYW1X1Ij6Dh7ok0HK0Lp7zoQ1t+t7iSTzUGyxHilxLScL5Us
	 O8N23b/Lk7BURDYMiipCS+N7jHO5ofdhyY6wnEVjI+aNHNT2T9o+Hl3sPl2a5C1R1Y
	 NVjwCQioqFDTA==
Message-ID: <4ebdee84-9c02-b8fc-9f52-2da91fd3c82c@collabora.com>
Date: Thu, 18 May 2023 11:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 1/2] drm/mediatek: Add ability to support dynamic
 connector selection
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nathan Lu <nathan.lu@mediatek.com>
References: <20230509150737.8075-1-jason-jh.lin@mediatek.com>
 <20230509150737.8075-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230509150737.8075-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_022924_526935_734699B1 
X-CRM114-Status: GOOD (  27.36  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 09/05/23 17:07, Jason-JH.Lin ha scritto:
> 1. Move output drm connector from each ddp_path array to connector array.
> 2. Add dynamic select available connector flow in crtc create and enable.
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   1 +
>   drivers/gpu/drm/mediatek/mtk_dpi.c          |   9 ++
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 111 +++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   5 +-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  27 +++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   8 ++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  44 ++++++--
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   8 ++
>   8 files changed, 202 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 2254038519e1..72c57442f965 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -44,6 +44,7 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
>   
>   void mtk_dpi_start(struct device *dev);
>   void mtk_dpi_stop(struct device *dev);
> +int mtk_dpi_encoder_index(struct device *dev);
>   
>   void mtk_dsi_ddp_start(struct device *dev);
>   void mtk_dsi_ddp_stop(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 948a53f1f4b3..765fc976e41f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -782,6 +782,15 @@ void mtk_dpi_stop(struct device *dev)
>   	mtk_dpi_power_off(dpi);
>   }
>   
> +int mtk_dpi_encoder_index(struct device *dev)
> +{
> +	struct mtk_dpi *dpi = dev_get_drvdata(dev);
> +	int encoder_index = drm_encoder_index(&dpi->encoder);
> +
> +	dev_dbg(dev, "encoder index:%d", encoder_index);
> +	return encoder_index;
> +}
> +
>   static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>   {
>   	struct mtk_dpi *dpi = dev_get_drvdata(dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d40142842f85..54d48932b833 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -60,8 +60,12 @@ struct mtk_drm_crtc {
>   	struct device			*mmsys_dev;
>   	struct device			*dma_dev;
>   	struct mtk_mutex		*mutex;
> +	unsigned int			ddp_comp_nr_ori;
> +	unsigned int			max_ddp_comp_nr;
>   	unsigned int			ddp_comp_nr;
>   	struct mtk_ddp_comp		**ddp_comp;
> +	unsigned int			conn_route_nr;

`num_conn_routes` is clearer.

> +	const struct mtk_drm_route	*conn_routes;
>   
>   	/* lock for display hardware access */
>   	struct mutex			hw_lock;
> @@ -649,6 +653,84 @@ static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
>   	mtk_ddp_comp_disable_vblank(comp);
>   }
>   
> +static unsigned int mtk_drm_crtc_max_num_route_comp(struct mtk_drm_crtc *mtk_crtc)
> +{
> +	unsigned int max_num = 0;
> +	unsigned int i;
> +
> +	if (!mtk_crtc->conn_route_nr)
> +		return 0;
> +
> +	for (i = 0; i < mtk_crtc->conn_route_nr; i++)
> +		max_num = max(mtk_crtc->conn_routes[i].route_len, max_num);

If we rename this to `num_routes` or `max_routes` it becomes a bit more
understandable.

> +
> +	return max_num;
> +}
> +
> +static int mtk_drm_crtc_update_output(struct drm_crtc *crtc,
> +				      struct drm_atomic_state *state)
> +{
> +	const struct mtk_drm_route *conn_routes;
> +	int crtc_index = drm_crtc_index(crtc);
> +	int i;
> +	struct device *dev;
> +	struct drm_crtc_state *crtc_state = state->crtcs[crtc_index].new_state;
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	struct mtk_drm_private *priv = crtc->dev->dev_private;
> +	unsigned int comp_id;
> +	unsigned int encoder_mask = crtc_state->encoder_mask;
> +	unsigned int route_len = 0, route_index = 0;
> +
> +	if (!mtk_crtc->conn_route_nr)
> +		return 0;
> +
> +	priv = priv->all_drm_private[crtc_index];
> +	dev = priv->dev;
> +
> +	dev_dbg(dev, "connector change:%d, encoder mask0x%x for crtc%d",
> +		crtc_state->connectors_changed, encoder_mask, crtc_index);
> +
> +	if (!crtc_state->connectors_changed)
> +		return 0;
> +
> +	conn_routes = mtk_crtc->conn_routes;
> +
> +	for (i = 0; i < mtk_crtc->conn_route_nr; i++) {
> +		route_len = conn_routes[i].route_len;
> +		if (route_len > 0) {

route_len is unsigned, it can never be < 0, so...

		if (route_len) {

> +			comp_id = conn_routes[i].route_ddp[route_len - 1];
> +			if (priv->comp_node[comp_id]) {
> +				if ((1 << priv->ddp_comp[comp_id].encoder_index) == encoder_mask) {

This is effectively BIT().

if (encoder_mask == BIT(priv->ddp_comp[comp_id].encoder_index)) {

P.S.: Are you sure that this shouldn't be (encoder_mask & BIT(encoder_index))??

> +					route_index = i;
> +					break;
> +				}
> +			}
> +		}
> +	}
> +

..snip..

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> index 3e9046993d09..672b9c7afee6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> @@ -8,6 +8,7 @@
>   
>   #include <drm/drm_crtc.h>
>   #include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
>   #include "mtk_drm_plane.h"
>   
>   #define MTK_LUT_SIZE	512
> @@ -18,7 +19,9 @@ void mtk_drm_crtc_commit(struct drm_crtc *crtc);
>   int mtk_drm_crtc_create(struct drm_device *drm_dev,
>   			const unsigned int *path,
>   			unsigned int path_len,
> -			int priv_data_index);
> +			int priv_data_index,
> +			const struct mtk_drm_route *conn_routes,
> +			unsigned int conn_routes_num);

num_conn_routes looks better.

>   int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
>   			     struct mtk_plane_state *state);
>   void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index f114da4d36a9..fe20ce26b19f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c

..snip..

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index febcaeef16a1..1c1d670cfe41 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -80,6 +80,7 @@ struct mtk_ddp_comp_funcs {
>   	void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
>   	void (*add)(struct device *dev, struct mtk_mutex *mutex);
>   	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
> +	int (*encoder_index)(struct device *dev);

drm_encoder_index returns an unsigned int type, so this one can never be negative:
please change the return value of this function to unsigned int type.

>   };
>   
>   struct mtk_ddp_comp {
> @@ -87,6 +88,7 @@ struct mtk_ddp_comp {
>   	int irq;
>   	unsigned int id;
>   	const struct mtk_ddp_comp_funcs *funcs;
> +	int encoder_index;

Same here, unsigned int.

>   };
>   
>   static inline int mtk_ddp_comp_clk_enable(struct mtk_ddp_comp *comp)

Regards,
Angelo


