Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CDCC61D94
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 14:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ora9LNQojLFOHpN5TfIswvOn2ErYWx9aqDb30umlaSI=; b=HnOt8c64pi+DCT
	jwOce+OT62tnJCKoov4llPYdJrn+BnznmU4S8oCwZnkxrchAU6rRveQBHu6tM23AxwmTvovtZZW1B
	V/CAjLeH/kjYAVopH1+sOzgZi7eV0W1qkJs8EnYRrvN6/Fux78UehIt1B2nykSwf5HUCDb6sX6st0
	hBzhIyr1kDLgaoJ6Cvvyo8OPw9D2GjK1zc2VdcXTq6N66UuL2IV5NAPgLOjaAXVDe+G5Sg/dJq3Gd
	8NPL+Me+yrqlDDEUoPg63F3l6pI39/IRR6TgC6uughVGVkZw853GymcArsTnDvLM2GUK/CavWuH4H
	3+2mqQ9dJ8C6KvlnaYXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RzE-00H3r4-0i;
	Tue, 21 Nov 2023 14:44:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RzA-00H3px-1K;
	Tue, 21 Nov 2023 14:44:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C1DB61962;
	Tue, 21 Nov 2023 14:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80F3C433C7;
	Tue, 21 Nov 2023 14:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700577858;
	bh=i4k9JATCdARgpGIsnHRdPJazvwXg7FUJt9BeVRU1bpE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tyY22s12GfB+H/yBT0ENPS7IZmDxag0iY/ghg3pIXF2vP+qWmgTxyhsGfijaaBOkX
	 rHfGRKquiqoPqyT00HZOPy3G6oWeyYJ1qvzoCFycdC2rEaeeU5KEvc7c3qx5IJy9M9
	 69FWxR1J2b9QFxveDp99y51TPdaztY+VyrEDI6EcnvJkiYTVx7PZBiTgdl2qKvIl7p
	 vctT6tpXYnu22hv4gfl8vJ6Srx/GSVyQ5Wydcvfb40LugS8KnpE0r1hI8xYTteTWhJ
	 rIe3SSN3EEYBoXdRs1JSNfqKGcEQvGNHgP1kTcXTUpPy+4vn8wAtOhC3127DhOT5pv
	 v3xBP99CTS8jw==
MIME-Version: 1.0
Date: Tue, 21 Nov 2023 15:44:13 +0100
From: Michael Walle <mwalle@kernel.org>
To: =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?=
 <nfraprado@collabora.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs
 calculation
In-Reply-To: <20230905084922.3908121-2-mwalle@kernel.org>
References: <20230905084922.3908121-1-mwalle@kernel.org>
 <20230905084922.3908121-2-mwalle@kernel.org>
Message-ID: <93576c3b04c8378c5c9296ec7a6585d9@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_064420_551363_2BEF9224 
X-CRM114-Status: GOOD (  30.25  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

> mtk_drm_find_possible_crtc_by_comp() assumed that the main path will
> always have the CRTC with id 0, the ext id 1 and the third id 2. This
> is only true if the paths are all available. But paths are optional 
> (see
> also comment in mtk_drm_kms_init()), e.g. the main path might not be
> enabled or available at all. Then the CRTC IDs will shift one up, e.g.
> ext will be 0 and the third path will be 1.
> 
> To fix that, dynamically calculate the IDs by the presence of the 
> paths.
> 
> While at it, make the return code a signed one and return -ENOENT if no
> path is found and handle the error in the callers.
> 
> Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting 
> possible_crtc way")
> Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Is there anything wrong with these two patches? They are now lingering
around for more than two months.

Unfortunately, patch 2/2 won't apply anymore because of commit
01389b324c97 ("drm/mediatek: Add connector dynamic selection
capability). And I'm a bit puzzled for what the crtc_id is used
there because I guess it will have the same problem this patch
fixes.

-michael

> ---
> v4:
>  - return -ENOENT if mtk_drm_find_possible_crtc_by_comp() doesn't find
>    any path
> v3:
>  - use data instead of priv_n->data
>  - fixed typos
>  - collected Rb and Tb tags
> v2:
>  - iterate over all_drm_private[] to get any vdosys
>  - new check if a path is available
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c          |  5 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 75 ++++++++++++++++-----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  3 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c          |  5 +-
>  4 files changed, 68 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c 
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 2f931e4e2b60..f9250f7ee706 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -796,7 +796,10 @@ static int mtk_dpi_bind(struct device *dev, struct 
> device *master, void *data)
>  		return ret;
>  	}
> 
> -	dpi->encoder.possible_crtcs = 
> mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->dev);
> +	ret = mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->dev);
> +	if (ret < 0)
> +		goto err_cleanup;
> +	dpi->encoder.possible_crtcs = ret;
> 
>  	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL,
>  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c 
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 771f4e173353..83ae75ecd858 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -507,6 +507,27 @@ static bool mtk_drm_find_comp_in_ddp(struct device 
> *dev,
>  	return false;
>  }
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
>  int mtk_ddp_comp_get_id(struct device_node *node,
>  			enum mtk_ddp_comp_type comp_type)
>  {
> @@ -522,25 +543,47 @@ int mtk_ddp_comp_get_id(struct device_node *node,
>  	return -EINVAL;
>  }
> 
> -unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device 
> *drm,
> -						struct device *dev)
> +int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm, struct 
> device *dev)
>  {
>  	struct mtk_drm_private *private = drm->dev_private;
> -	unsigned int ret = 0;
> -
> -	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, 
> private->data->main_len,
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
>  }
> 
>  int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp 
> *comp,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h 
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index febcaeef16a1..6a95df72de0a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -277,8 +277,7 @@ static inline bool mtk_ddp_comp_disconnect(struct 
> mtk_ddp_comp *comp, struct dev
> 
>  int mtk_ddp_comp_get_id(struct device_node *node,
>  			enum mtk_ddp_comp_type comp_type);
> -unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device 
> *drm,
> -						struct device *dev);
> +int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm, struct 
> device *dev);
>  int mtk_ddp_comp_init(struct device_node *comp_node, struct 
> mtk_ddp_comp *comp,
>  		      unsigned int comp_id);
>  enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id);
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c 
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d8bfc2cce54d..d67e5c61a9b9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -843,7 +843,10 @@ static int mtk_dsi_encoder_init(struct drm_device 
> *drm, struct mtk_dsi *dsi)
>  		return ret;
>  	}
> 
> -	dsi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm, 
> dsi->host.dev);
> +	ret = mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
> +	if (ret < 0)
> +		goto err_cleanup_encoder;
> +	dsi->encoder.possible_crtcs = ret;
> 
>  	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
>  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);

