Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B913C001DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TD90mx/J4VQmWoAC4jGr8MeSBckXZnIRdDpMY+yO3zg=; b=X4HGaMhkkZDKdaZrm0H8xOd6ar
	xRqELkHDyX9lMN+1QjMCDS4YaPcELlvNtK3MPi8oEoG/LLgDWvQStEuTBZ0aBGh3bthUMhbUBRWdF
	orAZK/vxgE7Ykg0Ugy3VQsd+NdwZpoOpthWbbcyNHjjGMCxJd3TNwRQ7hsRWIs9YKIvtHOh1bVrFD
	8ENKi09u05PVP4rCp0cmWKFbd9r3i7x7FMh1dtrVj9jMhRfQFAAGY2TtObIa4PTaWcII95/WaRA01
	4eJcOPrM/z48mE3vDs5tYJMDq7HeEEz6rBZWJGaNejey379aJHJKl4VDKg7d0YwWSO7Rd9tJOahTt
	8F9ZPQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYMQ-008z3l-0j;
	Thu, 03 Aug 2023 13:27:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYML-008yyw-2V;
	Thu, 03 Aug 2023 13:27:23 +0000
Received: from [192.168.0.125] (unknown [82.76.24.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F24966015A0;
	Thu,  3 Aug 2023 14:27:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691069240;
	bh=GKxVpL2htb4W/V44J3R/Ch3TGxu315qMlN6i5BaRp1I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oo7mc+GB6YB9oHQ4koa2nFWMb8g7v4RNgRYnrJHXmeh30XNsgyn8zplPvdMUNDlFO
	 BdmZbGx13CeVWR+/isBu7FirOF9+o5xQ4uWaz4789oqKXDk4F5PujVr3zb3idQbDD8
	 eJ/l8O50Hbnolo2AOvdECXDijID+AdjplSkKF+I3BOagFtr1pu3SkH4sia0BCikRBi
	 W/dn8xJk4OMFa/U6h8+tq+iqGv/KbbodwNPsUOcJrYcysqnKchFj0Vh7Aeuw50hEJr
	 +lzzCdiTECDbV2dumyS0ec2Y2lKvt3kHZ47gfP/7bPn6EamnwGNec0ZYR033sBNKa/
	 o2VDfs0neynLw==
Message-ID: <a0b5ab0a-4c2e-d14c-508c-09a981d7087b@collabora.com>
Date: Thu, 3 Aug 2023 16:27:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 4/8] drm/mediatek: Add encoder_index function to
 mtk_ddp_comp_funcs
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230802144802.751-1-jason-jh.lin@mediatek.com>
 <20230802144802.751-5-jason-jh.lin@mediatek.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230802144802.751-5-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_062721_957780_7C654FE6 
X-CRM114-Status: GOOD (  20.59  )
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

On 8/2/23 17:47, Jason-JH.Lin wrote:
> 1. Add encoder_index function to mtk_ddp_comp_funcs to support dynamic
> connector selection for some ddp_comp who has encoder_index.
> 2. Add mtk_ddp_comp_encoder_index_set function to set encoder_index to
> each comp.
> 

Usually a commit that does two things in a list is supposed to be two 
actual commits.


> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index febcaeef16a1..8428baca70f4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -80,6 +80,7 @@ struct mtk_ddp_comp_funcs {
>   	void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
>   	void (*add)(struct device *dev, struct mtk_mutex *mutex);
>   	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
> +	unsigned int (*encoder_index)(struct device *dev);
>   };
>   
>   struct mtk_ddp_comp {
> @@ -87,6 +88,7 @@ struct mtk_ddp_comp {
>   	int irq;
>   	unsigned int id;
>   	const struct mtk_ddp_comp_funcs *funcs;
> +	unsigned int encoder_index;

For better alignment I would suggest variables to be declared together 
and pointers afterwards, not mixed up

>   };
>   
>   static inline int mtk_ddp_comp_clk_enable(struct mtk_ddp_comp *comp)
> @@ -275,6 +277,12 @@ static inline bool mtk_ddp_comp_disconnect(struct mtk_ddp_comp *comp, struct dev
>   	return false;
>   }
>   
> +static inline void mtk_ddp_comp_encoder_index_set(struct mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->encoder_index)
> +		comp->encoder_index = comp->funcs->encoder_index(comp->dev);
> +}

it's also a bit strange that you added a function that is not used 
anywhere. Don't you get like a compiler warning for it ?

> +
>   int mtk_ddp_comp_get_id(struct device_node *node,
>   			enum mtk_ddp_comp_type comp_type);
>   unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,


