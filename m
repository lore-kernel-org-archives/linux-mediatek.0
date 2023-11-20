Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE3EC197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8/E/xZlfo9QLnO29b5tVQnNMcW4PlxC/KQPLbfbxIk=; b=i8lBIqCnZhqvCkYyWDijfNiu9x
	ZRwUwMLVJHYdemNwz4tFc8c+oNxTpPcmVK7K+scAidkQJCKCDtNcoog5yIDuOSC6o2v6+w2lLCmeJ
	dhphQmSEh4mai155svEnsCoDDYn0PSXBhTRO1s0so4LDHGdqEZI7+XEfn9RHfJimGjY6ONn6iVDDl
	UthwmGDjAjL+Wh36ZqpPvGjraDfzx98zcQ4cJV1GxXLEmcdWyQ5/+GGSJgjuqS8nrAdVops9aQ8i0
	IHGzV+Ide2RTpqDnmS9X1X7hZLNTOeoSMILbgvpJhOlRZFvgg1F4FQhJ+RHE+9/CMpASazqBgUt3r
	Q2fn934w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r506C-00BZcq-24;
	Mon, 20 Nov 2023 08:57:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5062-00BZaW-2X;
	Mon, 20 Nov 2023 08:57:41 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D798B6603149;
	Mon, 20 Nov 2023 08:57:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700470651;
	bh=d23ZT5zVaG2k3DicMJVOBp0FoX7BK2oj+2zL9rkLlcU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jFG/4oQkTiPCuFeWdj+hKl+IkpmsojIFQH+cPvfEWyMlJLPEfzYgpC5vo3ZDDcbPj
	 O/ygRUdSfa+jCME81v7FE0srl3G9yeaK9m1nub4CTXF70ffpom3huQQvk1bFence5W
	 4+Gsk+5L/npS23XvSMwPXt6c8++JAVJ9JUnXoWrdeA0Zzd8LmfqtGKoDKapMfTJ2o9
	 yN147CWiV5TaVRcAlkzg0NjsLqUEbvMH6M+Qhu5acHZkXc0Xi10CCtqJ9GbZaftzjK
	 AxJGSyXO2Dfo9g+0ULn20qDO/J3Ax1Rt3TGn3NBeBltmuJa0u9ekcZXXxu1tOJls+4
	 5ZAGzDZSmIvnQ==
Message-ID: <0b95d90d-5dd3-43da-a860-6a84019d097a@collabora.com>
Date: Mon, 20 Nov 2023 09:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8186: trivial: align code
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20231117160914.65341-1-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231117160914.65341-1-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_005735_086104_D737FEAA 
X-CRM114-Status: GOOD (  15.71  )
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

Il 17/11/23 17:09, Eugen Hristev ha scritto:
> No functionality change, squash some lines and align parameters for
> function prototypes to 80 chars.
> 

Please use scripts/get_maintainer.pl to get the correct recipients list.

> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
>   sound/soc/mediatek/mt8186/mt8186-afe-control.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-control.c b/sound/soc/mediatek/mt8186/mt8186-afe-control.c
> index 55edf6374578..dda648c1e8f8 100644
> --- a/sound/soc/mediatek/mt8186/mt8186-afe-control.c
> +++ b/sound/soc/mediatek/mt8186/mt8186-afe-control.c
> @@ -181,7 +181,8 @@ static unsigned int pcm_rate_transform(struct device *dev, unsigned int rate)
>   	return MTK_AFE_PCM_RATE_48K;
>   }
>   
> -unsigned int mt8186_tdm_relatch_rate_transform(struct device *dev, unsigned int rate)
> +unsigned int mt8186_tdm_relatch_rate_transform(struct device *dev,
> +					       unsigned int rate)

That's not needed, 86 columns is ok.

>   {
>   	switch (rate) {
>   	case 8000:
> @@ -222,7 +223,8 @@ unsigned int mt8186_tdm_relatch_rate_transform(struct device *dev, unsigned int
>   	return MTK_AFE_TDM_RELATCH_RATE_48K;
>   }
>   
> -unsigned int mt8186_rate_transform(struct device *dev, unsigned int rate, int aud_blk)
> +unsigned int mt8186_rate_transform(struct device *dev, unsigned int rate,
> +				   int aud_blk)

Same here, not needed.

>   {
>   	switch (aud_blk) {
>   	case MT8186_DAI_PCM:
> @@ -234,14 +236,13 @@ unsigned int mt8186_rate_transform(struct device *dev, unsigned int rate, int au
>   	}
>   }
>   
> -int mt8186_dai_set_priv(struct mtk_base_afe *afe, int id, int priv_size, const void *priv_data)
> +int mt8186_dai_set_priv(struct mtk_base_afe *afe, int id, int priv_size,
> +			const void *priv_data)

ditto.

>   {
>   	struct mt8186_afe_private *afe_priv = afe->platform_priv;
>   	void *temp_data;
>   
> -	temp_data = devm_kzalloc(afe->dev,
> -				 priv_size,
> -				 GFP_KERNEL);
> +	temp_data = devm_kzalloc(afe->dev, priv_size, GFP_KERNEL);

The only change I agree on is this one... but I don't know if it's even worth
making a commit for just this...

Regards,
Angelo


