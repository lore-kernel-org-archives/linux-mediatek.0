Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB88C25B10
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 May 2024 10:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlWWcS73o1UpoYdngS/9ga1HZ+SR1j3+ii11D9jxQN0=; b=CoLkXiAqSlTFq3RUqKZbGniqrz
	33DnPK0Kj63F6yDxsLIzoRQKJytW02UDtBhN4HTxMntsaZBVVaj+YwMb9XjSHWcb30iCVVTPHK62+
	ITN1XNa1uZZLcXeOwnMghjmLOdXC7b47ifRPjJkXZwxwbVd8x4Pfj9h7EAJlZhXWCab1JafwV7KH3
	P8pBd/LjTQZFH3pAknmhwASItm5ewuNZ3zB+oTgQwk32hRDVEqwwjqSdd/rQN3OZcdOngnsF9xm6c
	FvsdpHTaRpVpC/dC35OR/P/REYPWnJBJD0oL4HfFLb3ZqvdZ/5RRp5xV8voyq6tTF/z80Hc/LlTdb
	FBiv/NHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5N8Z-00000004nuS-1x3p;
	Fri, 10 May 2024 10:05:59 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5N8W-00000004nro-07px;
	Fri, 10 May 2024 10:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715335550;
	bh=vtrYm/vQSHim3jgRX04nOQj9guH68BZEvaolheL2Xv0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2IQqdwqPtoZkkk19USWWt8xgqlcwa+gPD66JC9VAEpwOYIPtXk4CcL340IG3zLdxP
	 nzVp/rwU70UIPRcxvhfHIAobSvLl++PUysKOpB++6Q2BiGJvL4zoPGhKuK52g3RbCJ
	 sUcfDpqiOIe43x1vzTgceS5gGHgqIdDsvw1WuhyHTjzO8LQJRL3MdvPT8U5xiYubn/
	 l7/HEJNl93y2U8hJN0yc7i6GMo1sFCkhbR2EQJA8v4P7sMAAZyG1tVvGCrU5ew6Ew/
	 WxdygCOQ+rLS/K6NZCU7LvPUAHPqq/v+4+UKcbchzpBVRKRbRfkdTqHhcvOm39v6x9
	 olb7rHKz8B05g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 92DD6378217A;
	Fri, 10 May 2024 10:05:49 +0000 (UTC)
Message-ID: <8d624845-7450-485c-8000-0194bcf56458@collabora.com>
Date: Fri, 10 May 2024 12:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] Support YUV422 for DPTX.
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com, mac.shen@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240510021810.19302-1-liankun.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240510021810.19302-1-liankun.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_030556_343360_6D09677B 
X-CRM114-Status: GOOD (  15.19  )
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

Il 10/05/24 04:15, Liankun Yang ha scritto:
> Adjust the training sequence.Detects the actual link condition
> and calculates the bandwidth where the relevant resolution resides.
> 
> The bandwidth is recalculated and modes that exceed the bandwidth are
> filtered.
> 
> Example Modify bandwidth filtering requirements.
> 
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 81 ++++++++++++++++++-------------
>   1 file changed, 46 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 2136a596efa1..3e645bd6fe27 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -66,6 +66,13 @@ enum {
>   	MTK_DP_CAL_MAX,
>   };
>   
> +enum mtk_dp_color_format {
> +	MTK_DP_COLOR_FORMAT_RGB = 0,
> +	MTK_DP_COLOR_FORMAT_YUV422 = 0x1,
> +	MTK_DP_COLOR_FORMAT_YUV444 = 0x2,
> +	MTK_DP_COLOR_FORMAT_YUV420 = 0x3,
> +};

This is giving the same values as drm_dp.h, hence unneeded.

> +
>   struct mtk_dp_train_info {
>   	bool sink_ssc;
>   	bool cable_plugged_in;
> @@ -84,7 +91,7 @@ struct mtk_dp_audio_cfg {
>   };
>   
>   struct mtk_dp_info {
> -	enum dp_pixelformat format;
> +	enum mtk_dp_color_format format;
>   	struct videomode vm;
>   	struct mtk_dp_audio_cfg audio_cur_cfg;
>   };
> @@ -457,7 +464,7 @@ static void mtk_dp_set_msa(struct mtk_dp *mtk_dp)

..snip..

> @@ -1888,9 +1896,28 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
>   			memset(&mtk_dp->info.audio_cur_cfg, 0,
>   			       sizeof(mtk_dp->info.audio_cur_cfg));
>   
> +			mtk_dp->enabled = false;
> +			/* power off aux */
> +			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +			       DP_PWR_STATE_BANDGAP_TPLL,
> +			       DP_PWR_STATE_MASK);
> +

This commit is not even based on upstream, so you haven't even tested it upstream.

Don't send untested commits.
There's nothing to review here.

Regards,
Angelo

