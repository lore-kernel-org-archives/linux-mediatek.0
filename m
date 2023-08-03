Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9302C001DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 13:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1Iw7rL5dZgiTWreS7C5x1LpdOlpDQZX1Lg6jZN3hxA=; b=GldSsmC+hjV0i8SCkEc0ZYPHYt
	XRuQGl7G1mKFujgoeENZwTD3ENqXT9aSUwMlB3DQmytWRDhOjLicKHOPJMP97htaXcsg99UWivu3l
	Fv/XxVz6+RQ8DGqRlp+lMXKOoR/iqJ/06bCXVVdYP45mCjyFuHgbVr+VSvIg7ukUZiHIGsNL5x/Ab
	Wn0Nl55DQNN3s5vgFcFaIl+VkfOpnnDRslAkemAjTPFcN62ecYHkM5oK3rwu8DEk6jgqplqyMI8TW
	pNUOsxU2pv7jAKsvNQYt7Igo0lyLhh00Z0qy+2qq91YxvF+c6N5GzbtAWVP0Y7fL11y1F14ln0Vfu
	uhapSPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYI3-008w9W-3B;
	Thu, 03 Aug 2023 13:22:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYHy-008w5I-2f;
	Thu, 03 Aug 2023 13:22:54 +0000
Received: from [192.168.0.125] (unknown [82.76.24.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 932BA66003AA;
	Thu,  3 Aug 2023 14:22:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691068969;
	bh=QjOypgF2tjYzN7SWK9FWCkeF0m/mCGr8viJpxU+QpfU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QRhY6RjuYvQYrtIjk7tguUaphwsxhkMgvaV5aXqsta5ceFPkEv3CpeM5u+E+MyWQC
	 2q4o3TYK6QQUY4SbYMwEkO+d6Y0k3JmwehKBKEKqDZdHm5JHPl+BhAuYYVY5cNc9mF
	 qF3u/ztJjpNcnzfOjDVqsQ3y9Tf5NEgWUeEAk/t5OocMl1tZS2u1PRETUzd39cm+vq
	 E9SBCEZMkNKmJHuCleyHVAMoAbwb5PA6YIxrGFVWHElaLpFHbUGVuFo7Z6+3A8p23a
	 tztmQQhw5Rsxno+eL4PQbNJstMoaAX+auT90i6P+GF71g7g7ci3hZGrwIDGWCyMTxf
	 hu7c45LAT5jQA==
Message-ID: <3d5de892-8311-86e8-b962-0e564903b0e6@collabora.com>
Date: Thu, 3 Aug 2023 16:22:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 3/8] drm/mediatek: Fix using wrong drm private data to
 bind mediatek-drm
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
 <20230802144802.751-4-jason-jh.lin@mediatek.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230802144802.751-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_062252_187126_51990BA8 
X-CRM114-Status: GOOD (  19.33  )
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
> In mtk_drm_kms_init(), each element in all_drm_priv should has one
> display path private data only, such as:
> all_drm_priv[CRTC_MAIN] should has main_path data only
> all_drm_priv[CRTC_EXT] should has ext_path data only
> all_drm_priv[CRTC_THIRD] should has third_path data only

s/should has/should have/ ?

> 
> So we need to add the length checking for each display path before
> assigning their drm private data into all_drm_priv array.
> 
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 89a38561ba27..c12886f31e54 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -351,6 +351,7 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
>   {
>   	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
>   	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
> +	struct mtk_drm_private *temp_drm_priv;
>   	struct device_node *phandle = dev->parent->of_node;
>   	const struct of_device_id *of_id;
>   	struct device_node *node;
> @@ -373,9 +374,18 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
>   		if (!drm_dev || !dev_get_drvdata(drm_dev))
>   			continue;
>   
> -		all_drm_priv[cnt] = dev_get_drvdata(drm_dev);
> -		if (all_drm_priv[cnt] && all_drm_priv[cnt]->mtk_drm_bound)
> -			cnt++;
> +		temp_drm_priv = dev_get_drvdata(drm_dev);
> +		if (temp_drm_priv) {

This is inside a 'for' loop right ?
Why don't you just 'continue' if temp_drm_priv is null ?


> +			if (temp_drm_priv->mtk_drm_bound)
> +				cnt++;
> +
> +			if (temp_drm_priv->data->main_len)
> +				all_drm_priv[CRTC_MAIN] = temp_drm_priv;
> +			else if (temp_drm_priv->data->ext_len)
> +				all_drm_priv[CRTC_EXT] = temp_drm_priv;
> +			else if (temp_drm_priv->data->third_len)
> +				all_drm_priv[CRTC_THIRD] = temp_drm_priv;
> +		}
>   	}
>   
>   	if (drm_priv->data->mmsys_dev_num == cnt) {


