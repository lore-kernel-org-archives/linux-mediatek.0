Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5555BC83F33
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 09:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ut2rSNj5yTfrFpECnkBxD5ulH0IKc1tIDJj/2vnujps=; b=Hfb7XC2QcPMgqL
	BQIbLwAxHQ8tkp/8PD4Zcn+yglENeLxNrHuO5s8l9oN3ZhO3k/lpJ3nOeIglVtCpEb6tTmyXjoZcy
	KFTMd9h9V1L98R6rM5dBjElY/QoPVRvc4SyU9Xd/yjBOwS0A70A72pCxyuaiKLX6I/X8/XZpPMRzC
	qx2bQDb/4BDuUUAiCJ5bM4Qe/lHUnzQlKj1maousieFpaJQ7/9wpsQcWTQtDN3kcNHQhlGMPNnv6n
	mgqQNRl6mgjBn9/ZA/e6CVaYfn55BvF80Jq+S5EcUsMUUDjxkcC79bGK3nUR7FuFnLrI/V5tH8V7G
	kD1BNabp9DI7ITigdpkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdRwJ-005bOT-0d;
	Tue, 05 Sep 2023 09:01:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdRwF-005bN5-1O;
	Tue, 05 Sep 2023 09:01:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D8C7566056FC;
	Tue,  5 Sep 2023 10:01:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693904490;
	bh=l2OPuoN0S34rozWzW5FLBGuPQ/HVeExL6jI/FMgrsFw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oJlHFuSx/Mbls9SEAuJdRoia704lXRQR4rorl9NOo6sPjt51NLBxdAs3eflHdPAsl
	 zh6ABc93As7NKbJaDeSJunY1bbrrI7zb/ugDG3/8OgoH7rQhor+KPmKHjA4VDXMwJQ
	 kNxDoRZtHOzHqdTN3ctJHc2ZZB9e0ZJVICKhFsz7BwzTp15frdv4yjtlC5OtIdb2iq
	 0lmIIGncA+J4B0DAjvnagDqhQJhq7ybSqag7h8pBwO1PFXSwQfaIqUKwqhCJcreeb4
	 efzNyJNL56u9bim40iOhOC4Ys9Lfl0H35JGx45c5WLY10yib+a/6PB20m9FQ70rImc
	 7jvmfRTsv4+qg==
Message-ID: <33c9d30f-e378-597d-c258-2b2009c10649@collabora.com>
Date: Tue, 5 Sep 2023 11:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs
 calculation
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230905084922.3908121-1-mwalle@kernel.org>
 <20230905084922.3908121-2-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230905084922.3908121-2-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_020135_741299_252128D6 
X-CRM114-Status: GOOD (  29.74  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 05/09/23 10:49, Michael Walle ha scritto:
> mtk_drm_find_possible_crtc_by_comp() assumed that the main path will
> always have the CRTC with id 0, the ext id 1 and the third id 2. This
> is only true if the paths are all available. But paths are optional (see
> also comment in mtk_drm_kms_init()), e.g. the main path might not be
> enabled or available at all. Then the CRTC IDs will shift one up, e.g.
> ext will be 0 and the third path will be 1.
> 
> To fix that, dynamically calculate the IDs by the presence of the paths.
> 
> While at it, make the return code a signed one and return -ENOENT if no
> path is found and handle the error in the callers.
> 
> Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting possible_crtc way")
> Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Perfect!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> v4:
>   - return -ENOENT if mtk_drm_find_possible_crtc_by_comp() doesn't find
>     any path
> v3:
>   - use data instead of priv_n->data
>   - fixed typos
>   - collected Rb and Tb tags
> v2:
>   - iterate over all_drm_private[] to get any vdosys
>   - new check if a path is available
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c          |  5 +-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 75 ++++++++++++++++-----
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  3 +-
>   drivers/gpu/drm/mediatek/mtk_dsi.c          |  5 +-
>   4 files changed, 68 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 2f931e4e2b60..f9250f7ee706 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -796,7 +796,10 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>   		return ret;
>   	}
>   
> -	dpi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->dev);
> +	ret = mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->dev);
> +	if (ret < 0)
> +		goto err_cleanup;
> +	dpi->encoder.possible_crtcs = ret;
>   
>   	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL,
>   				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 771f4e173353..83ae75ecd858 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -507,6 +507,27 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
>   	return false;
>   }
>   
> +static bool mtk_ddp_path_available(const unsigned int *path,
> +				   unsigned int path_len,
> +				   struct device_node **comp_node)
> +{
> +	unsigned int i;
> +
> +	if (!path)
> +		return false;
> +
> +	for (i = 0U; i < path_len; i++) {
> +		/* OVL_ADAPTOR doesn't have a device node */
> +		if (path[i] == DDP_COMPONENT_DRM_OVL_ADAPTOR)
> +			continue;
> +
> +		if (!comp_node[path[i]])
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   int mtk_ddp_comp_get_id(struct device_node *node,
>   			enum mtk_ddp_comp_type comp_type)
>   {
> @@ -522,25 +543,47 @@ int mtk_ddp_comp_get_id(struct device_node *node,
>   	return -EINVAL;
>   }
>   
> -unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
> -						struct device *dev)
> +int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm, struct device *dev)
>   {
>   	struct mtk_drm_private *private = drm->dev_private;
> -	unsigned int ret = 0;
> -
> -	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
> -				     private->ddp_comp))
> -		ret = BIT(0);
> -	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
> -					  private->data->ext_len, private->ddp_comp))
> -		ret = BIT(1);
> -	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
> -					  private->data->third_len, private->ddp_comp))
> -		ret = BIT(2);
> -	else
> -		DRM_INFO("Failed to find comp in ddp table\n");
> +	const struct mtk_mmsys_driver_data *data;
> +	struct mtk_drm_private *priv_n;
> +	int i = 0, j;
> +
> +	for (j = 0; j < private->data->mmsys_dev_num; j++) {
> +		priv_n = private->all_drm_private[j];
> +		data = priv_n->data;
> +
> +		if (mtk_ddp_path_available(data->main_path, data->main_len,
> +					   priv_n->comp_node)) {
> +			if (mtk_drm_find_comp_in_ddp(dev, data->main_path,
> +						     data->main_len,
> +						     priv_n->ddp_comp))
> +				return BIT(i);
> +			i++;
> +		}
> +
> +		if (mtk_ddp_path_available(data->ext_path, data->ext_len,
> +					   priv_n->comp_node)) {
> +			if (mtk_drm_find_comp_in_ddp(dev, data->ext_path,
> +						     data->ext_len,
> +						     priv_n->ddp_comp))
> +				return BIT(i);
> +			i++;
> +		}
> +
> +		if (mtk_ddp_path_available(data->third_path, data->third_len,
> +					   priv_n->comp_node)) {
> +			if (mtk_drm_find_comp_in_ddp(dev, data->third_path,
> +						     data->third_len,
> +						     priv_n->ddp_comp))
> +				return BIT(i);
> +			i++;
> +		}
> +	}
>   
> -	return ret;
> +	DRM_INFO("Failed to find comp in ddp table\n");
> +	return -ENOENT;
>   }
>   
>   int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index febcaeef16a1..6a95df72de0a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -277,8 +277,7 @@ static inline bool mtk_ddp_comp_disconnect(struct mtk_ddp_comp *comp, struct dev
>   
>   int mtk_ddp_comp_get_id(struct device_node *node,
>   			enum mtk_ddp_comp_type comp_type);
> -unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
> -						struct device *dev);
> +int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm, struct device *dev);
>   int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
>   		      unsigned int comp_id);
>   enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id);
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d8bfc2cce54d..d67e5c61a9b9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -843,7 +843,10 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>   		return ret;
>   	}
>   
> -	dsi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
> +	ret = mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
> +	if (ret < 0)
> +		goto err_cleanup_encoder;
> +	dsi->encoder.possible_crtcs = ret;
>   
>   	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
>   				DRM_BRIDGE_ATTACH_NO_CONNECTOR);


