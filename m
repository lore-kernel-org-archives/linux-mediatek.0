Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0D5CA0FE9
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 07:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ptlfewvkXCBDq/b/tbr6JFerKt1/0bvE3UP3Nr7uW8=; b=E9tR9Tr8BTbQ2x
	ISIAIlPP/PR0X4/RDhcKEXdqygkQFlbX6oqLD+s/dG/6DtjjHVCcvBHxuVqwGwEYy2SxtPXjv26Tt
	orDD5z4/AtJ+0hXeB5KgxqAi7YpUN6FoNJZZTQJxYUo/ArdhkR/c6kGGjaSEZ/cKlbKqzAS0Zrf4z
	B+eJjdnpZjCwh9Y1krMpJxaWQx0539cpKCsaUHfeUb6XAwTFCB1HTGpu7TXIRjs3ve+pLj1EBLwWM
	OotcKsyroZwbLe90PRchoxidKLjxXqmYMb8ViT31GDh168bIcCUU/zaJeT78aOzoD/t/Hni2a3mUo
	QjoHJod8szNU6PWJcY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQuH-005Thj-1A;
	Tue, 05 Sep 2023 07:55:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQuE-005TgZ-0O;
	Tue, 05 Sep 2023 07:55:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A98F96607033;
	Tue,  5 Sep 2023 08:55:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693900524;
	bh=xt47hUabKnjBtbHUoL8inJXCx6CIgoMdxyYnRODbfk4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nm9jiGx03PuBQ6bzC3uYyuldX+v2XvpzGRYCoqsiMdDgQvlvmxZDE46YoBY/io4nL
	 42t1gquH3BXJe6ygHMkY+ewiBe6BmuK+2GE/GYpn0Mzkfdpj0dU3FJSqvX5mHX0ovt
	 ObeEbaotc/Xzgz+RwjjlyW0TGSdU9WkqIhjAm+GonA9AxnvNXNGtOnhakJlS3hPxio
	 A2oZ+gACpzH0KRglts6dzTYrZhLvcI5MaPv1KZkbLWYUHVDAf64eNYGWEsvBccuTku
	 JziVX1QqfJw9NgaKLAGjEPzDdZcYQ/dEjAk2vZ6MVWCc/M8eBzQdELy8l3Nt2YSxt7
	 b3dERTjLrBpkA==
Message-ID: <d7e6917d-7315-12d6-d7d4-dc7ea8c58dc9@collabora.com>
Date: Tue, 5 Sep 2023 09:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs
 calculation
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230901174557.3617839-1-mwalle@kernel.org>
 <20230901174557.3617839-2-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230901174557.3617839-2-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_005526_468981_EEC5BFEF 
X-CRM114-Status: GOOD (  28.74  )
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

Il 01/09/23 19:45, Michael Walle ha scritto:
> mtk_drm_find_possible_crtc_by_comp() assumed that the main path will
> always have the CRTC with id 0, the ext id 1 and the third id 2. This
> is only true if the paths are all available. But paths are optional (see
> also comment in mtk_drm_kms_init()), e.g. the main path might not be
> enabled or available at all. Then the CRTC IDs will shift one up, e.g.
> ext will be 0 and the third path will be 1.
> 
> To fix that, dynamically calculate the IDs by the presence of the paths.
> 
> Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting possible_crtc way")
> Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> v3:
>   - use data instead of priv_n->data
>   - fixed typos
>   - collected Rb and Tb tags
> v2:
>   - iterate over all_drm_private[] to get any vdosys
>   - new check if a path is available
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 72 +++++++++++++++++----
>   1 file changed, 58 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 771f4e173353..c00f4669cc50 100644
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
> @@ -526,21 +547,44 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
>   						struct device *dev)
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
> +	return 0;

At this point, I think that it would be sane to change this function to
return a signed type, so that we can return -ENOENT if we couldn't find
any DDP path (so, if we couldn't find any possible crtc).

This function is called only twice, once in DPI, once in DSI - so the
change should also be pretty straightforward to do.

Cheers,
Angelo

>   }
>   
>   int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,




