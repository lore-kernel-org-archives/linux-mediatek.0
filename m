Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84789C77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 11:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXC8tywFNAN6RzIOdVtc1AGsA4V02A2ta8DwbaXBaAA=; b=L9mj1pUi8P1QcNNpm6npAlj+0a
	2M/ahdB8/4vuUdCURNLtH8oSirszPK0bH0Z+2i5La9yBwmcC64tmBw3Uze97qW+g1Mh/30aMt8B/l
	EAopya1cmaRLM7owKQDQ7qRXYxhNMixaI/pihDbHpM0xiBybk0piRyyCQ1QEgr6IZhr8Im+yYqb3b
	uIcSrhx8vm1QWJlHt3A48AHZfM5L4gboEydVBWB2cHu2/b0rZh0x3jFhQZqHv5Ew1UXsDhA35q0Sl
	J0Yd0Qzh7CZ8QrKi06Sw1r/zKu4OVIBlT9O9kS7bB5AFEzoAbAHsMWb86LjTpOBPjVPLIWXJbyBC4
	7Y5jc81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFWR-009e2U-2R;
	Wed, 17 May 2023 11:40:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFWO-009dxs-0F;
	Wed, 17 May 2023 11:40:45 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 70613660574E;
	Wed, 17 May 2023 12:40:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684323636;
	bh=T9QRvTUI9a2/9gMxw4EVMYbBrsZXmiyXdxxur97JjRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDe0ONrNUP6O+7KKxqro1r1AwJ8T+J6mjKbO/Sug2Bdx51DW7SkNwsZfzLMixIaO6
	 0pUIPHll3JiHy14znIc//PsdbS4Y3iYsv2U94yIVkadCwIN60PKdjja2ZQA+gr89t/
	 dXZLex8/5/X4olr9pf9EPgUIgmFSB0DRt7ynZfxdSSWJNPppN6SOVaHoaqNXIXN8Ae
	 8yGkkj020lLJmGhQc+aEy+6OYYRfuTQidYgcRlWf6DxxqiqXBBIfPqs8XnW2/cflpj
	 NQJVE1G5/bcKV7RJVoLZEPaEP80djdiUTimzzl0AjH7bPT3HF6dbrrCdNiHBxzMdY5
	 DOt6wVtvUooMQ==
Message-ID: <678f3582-ff1e-033a-f8d9-f73910156d15@collabora.com>
Date: Wed, 17 May 2023 13:40:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/5] ASoC: mediatek: mt8188: separate ADDA playback dai
 from capture dai
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
 <20230517111534.32630-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230517111534.32630-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_044044_246633_22310155 
X-CRM114-Status: GOOD (  20.43  )
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

Il 17/05/23 13:15, Trevor Wu ha scritto:
> MT8188 will support SOF. In SOF, be_hw_params_fixup callback are used to
> configure BE hardware parameters. However, playback and capture stream
> share the same callback function in which it can't know the stream type.
> 
> It's possible to require different paremters for playback and capture
> stream, so separate them into two dais for SOF usage.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-afe-common.h |  3 +-
>   sound/soc/mediatek/mt8188/mt8188-dai-adda.c   | 76 ++++++++++---------
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 34 +++++++--
>   3 files changed, 68 insertions(+), 45 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-common.h b/sound/soc/mediatek/mt8188/mt8188-afe-common.h
> index eb7e57c239bd..1304d685a306 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-afe-common.h
> +++ b/sound/soc/mediatek/mt8188/mt8188-afe-common.h
> @@ -39,7 +39,7 @@ enum {
>   	MT8188_AFE_MEMIF_END,
>   	MT8188_AFE_MEMIF_NUM = (MT8188_AFE_MEMIF_END - MT8188_AFE_MEMIF_START),
>   	MT8188_AFE_IO_START = MT8188_AFE_MEMIF_END,
> -	MT8188_AFE_IO_ADDA = MT8188_AFE_IO_START,
> +	MT8188_AFE_IO_DL_SRC = MT8188_AFE_IO_START,
>   	MT8188_AFE_IO_DMIC_IN,
>   	MT8188_AFE_IO_DPTX,
>   	MT8188_AFE_IO_ETDM_START,
> @@ -52,6 +52,7 @@ enum {
>   	MT8188_AFE_IO_ETDM_NUM =
>   		(MT8188_AFE_IO_ETDM_END - MT8188_AFE_IO_ETDM_START),
>   	MT8188_AFE_IO_PCM = MT8188_AFE_IO_ETDM_END,
> +	MT8188_AFE_IO_UL_SRC,
>   	MT8188_AFE_IO_END,
>   	MT8188_AFE_IO_NUM = (MT8188_AFE_IO_END - MT8188_AFE_IO_START),
>   	MT8188_DAI_END = MT8188_AFE_IO_END,
> diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
> index fed9f927e623..9a6673a6f28a 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
> @@ -53,8 +53,7 @@ enum {
>   };
>   
>   struct mtk_dai_adda_priv {
> -	unsigned int dl_rate;
> -	unsigned int ul_rate;
> +	bool hires_required;
>   };
>   
>   static unsigned int afe_adda_dl_rate_transform(struct mtk_base_afe *afe,

..snip..

> @@ -503,13 +495,15 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
>   	dev_dbg(afe->dev, "%s(), id %d, stream %d, rate %u\n",
>   		__func__, id, substream->stream, rate);
>   
> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		adda_priv->dl_rate = rate;
> +	if (rate > ADDA_HIRES_THRES)
> +		adda_priv->hires_required = 1;
> +	else
> +		adda_priv->hires_required = 0;
> +

hires_required is a boolean, so assigning 1 or 0 should be replaced with
assigning true or false; regardless of that, what about...

	adda_priv->hires_required = (rate > ADDA_HIRES_THRES);

> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>   		ret = mtk_dai_da_configure(afe, rate, id);
> -	} else {
> -		adda_priv->ul_rate = rate;
> +	else
>   		ret = mtk_dai_ad_configure(afe, rate, id);
> -	}
>   
>   	return ret;
>   }

Regards,
Angelo

