Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F828C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 08:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+WO/cQnTPDY26a+c0YnZB5Rj7r+3UGTDNcHHBi2CH8=; b=SJ9TMd/CWEoetun0FTyZe+GTBd
	e0HpoQRfBzen4EY+/JUSUNyTxXeoABMZMn0FwoXLVr8h7IC6+bna4IpUI1VU20PDXDS6YufobtnFp
	7hbYyb+Kctlu9tb71+g1okjiFZwYOgbIlR6cJyrvpIvEsRe2pW0t5M3xO9K8G2Jyi5I1oMBE6PJFu
	CiwhHq9rULAdkolpk29MxJGb0M5AeIHvkILoqE9lPKsdpyc076K0LWm3zJ6PMbctJeBGvCwyKVi8z
	l1OSaAzi84PnhT/Z3v2LYRTDI5xKEOdfkZmXczd/SQ/kfKD0U+N5Cnyhq7p0T6BEfeP7NEz1Tx5um
	2CYE9FVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJ8m-002SQc-2G;
	Fri, 28 Jul 2023 08:48:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJ8d-002SGS-0d;
	Fri, 28 Jul 2023 08:47:56 +0000
Received: from [192.168.0.125] (unknown [82.76.24.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CCE0C660704F;
	Fri, 28 Jul 2023 09:47:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690534073;
	bh=EzxFZArV4oI2fCzctc4R32csijV5z1G9a6OEFqMajKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CW5upOAAhgUwkGCV5r+QGymSnPFnm+8hQNTzW7rtwnnpeu0c7ns2vFKGihPkmHu67
	 MOduQZnPu4kwGX2Wu9GpBHMqttajI0/6o5SV8a0vWDikM28OSAAqwFo0wEsyE+QZUQ
	 Cxy8QP+UprSOBhJxTXSXgu6Kr7wwzCjeb8l6a5Raz1eCZwIP4sE/uFfaKCNnw252Hj
	 q7oVDVSj7YXv6gTespMznLI0JHusPSaAp9pMJhWO1d+rW6p8YiGj0eL4tnNvO90hxy
	 bhIBPQOH4H1FffP+ud6f7tzOwtKiclNby6V/RViHB8Z8zfDLZG5ZrGDOn0vu2AfKPH
	 U+94D5K67kZhQ==
Message-ID: <d74f959b-2255-4587-e99c-2c6b043dc44c@collabora.com>
Date: Fri, 28 Jul 2023 11:47:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 2/4] drm/mediatek: Fix using wrong drm private data to
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
References: <20230727164114.20638-1-jason-jh.lin@mediatek.com>
 <20230727164114.20638-3-jason-jh.lin@mediatek.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230727164114.20638-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_014755_401204_7F9B1EB4 
X-CRM114-Status: GOOD (  17.91  )
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

Hi,

On 7/27/23 19:41, Jason-JH.Lin wrote:
> Add checking the length of each data path before assigning drm private
> data into all_drm_priv array.
> 
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 249c9fd6347e..d2fb1fb4e682 100644
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
> +			if (temp_drm_priv->mtk_drm_bound)
> +				cnt++;
> +
> +			if (temp_drm_priv->data->main_len)
> +				all_drm_priv[0] = temp_drm_priv;
> +			else if (temp_drm_priv->data->ext_len)
> +				all_drm_priv[1] = temp_drm_priv;
> +			else if (temp_drm_priv->data->third_len)
> +				all_drm_priv[2] = temp_drm_priv;
> +		}

Previously the code was assigning stuff into all_drm_priv[cnt] and 
incrementing it.
With your change, it assigns to all_drm_priv[0], [1], [2]. Is this what 
you intended ?
If this loop has second run, you will reassign to all_drm_priv again ?
I would expect you to take `cnt` into account.
Also, is it expected that all_drm_priv has holes in the array ?

Eugen



>   	}
>   
>   	if (drm_priv->data->mmsys_dev_num == cnt) {


