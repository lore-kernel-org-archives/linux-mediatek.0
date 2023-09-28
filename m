Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00582CE7B17
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 10:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfUsmwPYQtL1gEXuj33qGMo9YvsAj5baexERr6MAtIc=; b=ur7VZ8+7ORld+SrrIRH/R0GS6G
	vCjoGaqm1KVVo0ugQak0BtZZQ2CaA8bTLlXENqQjPuDzVV1CnIm00/sY1ucyEqZ18KnL53XgiKM/E
	aDzOnkb3a+Q7g3+aHrfFgyGDhN6AD9BVcEtBe5+OE2ZOaLjMfuBQHNmA6VWgeanCSGC6l1ueHnpqD
	uwMCYd6XjXbg21l+xHS8UCqCpqFSmF3AwH7sy+g1oy+7anjrvMGVZDEd4Vxve4TCuFB9nlHL7LXQ/
	75X8/oDSp0N1u+MeOP9PKqkNr4YGxpmp21pecck7uwuqsL/4+QlbKJxQ3a4pFCcuCiKzTlJ7k2JOn
	ypVkDDAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnp4-002n4M-2n;
	Thu, 28 Sep 2023 10:00:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnp0-002n2X-1e;
	Thu, 28 Sep 2023 10:00:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 317C966072EC;
	Thu, 28 Sep 2023 11:00:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695895232;
	bh=IOt9+rGgYzpIVn9RzySH66oZB/5PUk0iIHrQnBjbmzY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JIGL0fdE9UtWJmr1uWbygEYpt3o+4EnArL7XJeSgBUPejcOFFJVirdQd3ldexweqv
	 cKVL2jiX7yT548vDFMPobCMjvKUesNR3YMQYj2bJYA6mBLkA9X6YxNiN79VESu1GOF
	 Qzu1aX0hGbtOyTFD2/tJMjMaVvrTLWnI1ZFsQMSsxCl451E18oLprQCebD42awVotj
	 Zm7i8Y9c7BzY/xZxfGAYfLQ4JSrSn3E6EFdaU1g9ASd0Y1D4e1nAYGFSlkK5ZWNNTT
	 zhhIL2rTmvg550GGqeOwKct3lt21DAZJNTyNadqTyotYS9YyDfW+gUseoV8VcOaMGf
	 IEpYGSWSK7F8g==
Message-ID: <891fe60a-cee9-29ab-3214-848b1161a0a7@collabora.com>
Date: Thu, 28 Sep 2023 12:00:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 5/9] drm/mediatek: Add connector dynamic selection
 capability
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nathan Lu <nathan.lu@mediatek.com>
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
 <20230927153833.23583-6-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927153833.23583-6-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_030039_030848_30957785 
X-CRM114-Status: GOOD (  32.89  )
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

Il 27/09/23 17:38, Jason-JH.Lin ha scritto:
> Add dynamic select available connector flow in mtk_drm_crtc_create()
> and mtk_drm_crtc_atomic_enable().
> 
> In mtk_drm_crtc_create(), if there is a connector routes array in drm
> driver data, all components definded in the connector routes array will
> be checked and their encoder_index will be set.
> 
> In mtk_drm_crtc_atomic_enable(), crtc will check its encoder_index to
> identify which componet in the connector routes array should append.
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Tested-by: Fei Shao <fshao@chromium.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 78 ++++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  5 +-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 27 ++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 13 +++-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  7 ++
>   5 files changed, 123 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index b6fa4ad2f94d..8eb4d2646a76 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -63,6 +63,8 @@ struct mtk_drm_crtc {
>   	struct mtk_mutex		*mutex;
>   	unsigned int			ddp_comp_nr;
>   	struct mtk_ddp_comp		**ddp_comp;
> +	unsigned int			num_conn_routes;
> +	const struct mtk_drm_route	*conn_routes;
>   
>   	/* lock for display hardware access */
>   	struct mutex			hw_lock;
> @@ -647,6 +649,45 @@ static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
>   	mtk_ddp_comp_disable_vblank(comp);
>   }
>   
> +static void mtk_drm_crtc_update_output(struct drm_crtc *crtc,
> +				       struct drm_atomic_state *state)
> +{
> +	int crtc_index = drm_crtc_index(crtc);
> +	int i;
> +	struct device *dev;
> +	struct drm_crtc_state *crtc_state = state->crtcs[crtc_index].new_state;
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	struct mtk_drm_private *priv = crtc->dev->dev_private;
> +	unsigned int comp_id;

You're not using comp_id globally in this function....

> +	unsigned int encoder_mask = crtc_state->encoder_mask;
> +
> +	if (!crtc_state->connectors_changed)
> +		return;
> +
> +	if (!mtk_crtc->num_conn_routes)
> +		return;
> +
> +	priv = priv->all_drm_private[crtc_index];

This is a bit confusing. You're reassigning priv: please avoid that.
I would prefer directly seeing the final assignment, or otherwise two pointers.

	struct mtk_drm_private *priv;

	if ....
	...........

	priv = crtc->dev->dev_private->all_drm_private[crtc_index];

> +	dev = priv->dev;
> +
> +	dev_dbg(dev, "connector change:%d, encoder mask:0x%x for crtc:%d\n",
> +		crtc_state->connectors_changed, encoder_mask, crtc_index);
> +
> +	for (i = 0; i < mtk_crtc->num_conn_routes; i++) {
> +		struct mtk_ddp_comp *comp;

...so you can move it here...

		unsigned int comp_id = mtk_crtc->conn_routes[i].route_ddp;
		struct mtk_ddp_comp *comp = &priv->ddp_comp[comp_id];

> +
> +		comp_id = mtk_crtc->conn_routes[i].route_ddp;
> +		comp = &priv->ddp_comp[comp_id];
> +		if (comp->encoder_index >= 0 &&
> +		    encoder_mask & BIT(comp->encoder_index)) {

For readability, I would prefer to see

		if (comp->encoder_index >= 0 &&
		    (encoder_mask & BIT(comp->encoder_index))) {

...but I don't have strong opinions on that.

> +			mtk_crtc->ddp_comp[mtk_crtc->ddp_comp_nr - 1] = comp;
> +			dev_dbg(dev, "Add comp_id: %d at path index %d\n",
> +				comp->id, mtk_crtc->ddp_comp_nr - 1);
> +			break;
> +		}
> +	}
> +}
> +
>   int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
>   			     struct mtk_plane_state *state)
>   {
> @@ -679,6 +720,8 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>   
>   	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
>   
> +	mtk_drm_crtc_update_output(crtc, state);
> +

What's the point of updating the output before pm_runtime_resume_and_get()?
If PM resume fails we're not enabling the CRTC so the update is actually useless.

Please move this after PM resume: that will also possibly come handy in the future.


>   	ret = pm_runtime_resume_and_get(comp->dev);
>   	if (ret < 0) {
>   		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n", ret);
> @@ -884,7 +927,8 @@ struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
>   
>   int mtk_drm_crtc_create(struct drm_device *drm_dev,
>   			const unsigned int *path, unsigned int path_len,
> -			int priv_data_index)
> +			int priv_data_index, const struct mtk_drm_route *conn_routes,
> +			unsigned int num_conn_routes)
>   {
>   	struct mtk_drm_private *priv = drm_dev->dev_private;
>   	struct device *dev = drm_dev->dev;
> @@ -935,7 +979,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>   
>   	mtk_crtc->mmsys_dev = priv->mmsys_dev;
>   	mtk_crtc->ddp_comp_nr = path_len;
> -	mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr,
> +	mtk_crtc->ddp_comp = devm_kmalloc_array(dev,
> +						mtk_crtc->ddp_comp_nr + (conn_routes ? 1 : 0),
>   						sizeof(*mtk_crtc->ddp_comp),
>   						GFP_KERNEL);
>   	if (!mtk_crtc->ddp_comp)
> @@ -1038,5 +1083,34 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>   		init_waitqueue_head(&mtk_crtc->cb_blocking_queue);
>   	}
>   #endif
> +
> +	if (conn_routes) {
> +		struct device_node *node;
> +		struct mtk_ddp_comp *comp;
> +		unsigned int comp_id;
> +
> +		for (i = 0; i < num_conn_routes; i++) {

Same here, you're locally using comp_id, node and comp *only* in the for loop....

			unsigned int comp_id = conn_routes[i].route_ddp;
			struct device_node *node = priv->comp_node[comp_id];
			struct mtk_ddp_comp *comp = &priv->ddp_comp[comp_id];

> +			comp_id = conn_routes[i].route_ddp;
> +			node = priv->comp_node[comp_id];
> +			comp = &priv->ddp_comp[comp_id];
> +
> +			if (!comp->dev) {
> +				dev_dbg(dev, "comp_id:%d, Component %pOF not initialized\n",
> +					comp_id, node);
> +				/* mark encoder_index to -1, if route comp device is not enabled */
> +				comp->encoder_index = -1;
> +				continue;
> +			}
> +
> +			mtk_ddp_comp_encoder_index_set(&priv->ddp_comp[comp_id]);
> +		}
> +
> +		mtk_crtc->num_conn_routes = num_conn_routes;
> +		mtk_crtc->conn_routes = conn_routes;
> +
> +		/* increase ddp_comp_nr at the end of mtk_drm_crtc_create */
> +		mtk_crtc->ddp_comp_nr++;
> +	}
> +
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> index 3e9046993d09..3c224595fa71 100644
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
> +			unsigned int num_conn_routes);
>   int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
>   			     struct mtk_plane_state *state);
>   void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 771f4e173353..4ddb5e561116 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -507,6 +507,23 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
>   	return false;
>   }
>   
> +static int mtk_drm_find_comp_in_ddp_conn_path(struct device *dev,
> +					      const struct mtk_drm_route *routes,
> +					      unsigned int num_routes,
> +					      struct mtk_ddp_comp *ddp_comp)
> +{
> +	unsigned int i;
> +
> +	if (!routes)
> +		return -EINVAL;
> +
> +	for (i = 0; i < num_routes; i++)
> +		if (dev == ddp_comp[routes[i].route_ddp].dev)
> +			return BIT(routes[i].crtc_id);
> +
> +	return -ENODEV;
> +}
> +
>   int mtk_ddp_comp_get_id(struct device_node *node,
>   			enum mtk_ddp_comp_type comp_type)
>   {
> @@ -538,7 +555,15 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
>   					  private->data->third_len, private->ddp_comp))
>   		ret = BIT(2);
>   	else
> -		DRM_INFO("Failed to find comp in ddp table\n");
> +		ret = mtk_drm_find_comp_in_ddp_conn_path(dev,
> +							 private->data->conn_routes,
> +							 private->data->num_conn_routes,
> +							 private->ddp_comp);
> +
> +	if (ret <= 0) {
> +		DRM_INFO("Failed to find comp in ddp table, ret =%d\n", ret);
> +		ret = 0;

Why are you returning 0 for error here?!

> +	}
>   
>   	return ret;
>   }

Regards,
Angelo


