Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0FDC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 11:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/Y0TcoHGjvS9UkTGXSKAMG9qsDihb5aIo76yk/OMtY=; b=vvqfLHVqvIopJ8Edn04MvTn3lD
	fZSmwjSSs/+inQEjXbfsMgZ7+PmAKq5q0gPCvYdjiRMxP1sv+rQkWe7py4yvD5hO0Aa324rP74gMS
	s2Bf7vSu/qNXUo5hiZrmCHdPqSpgngLMEHX4hJ4qvr9bPC52azZy5owzXdo+9SCQrHNjiTv5D661O
	i2uNo9ypzLFzdyQjN57hXpsG2/rCADCWGiZnfyXo5tKz1a/pjc3pSAinaLKqpNPCwq2+Afw3kIZRc
	ORlPtprpW82JeGJ5hYhxXnDZt3V7p5XEHbyFg+oPQbg5Iun0VLlq4E0qmqFdjfJq/PLiXe2j0gmRI
	MpsdSizg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qusm4-007CxW-0g;
	Mon, 23 Oct 2023 11:07:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qusm0-007Cwc-1f;
	Mon, 23 Oct 2023 11:07:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8195F66056D1;
	Mon, 23 Oct 2023 12:07:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698059223;
	bh=ZPYct6TKPhXnwWujFdM+whLqN4S0h84pY9ooYkcyhfU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ZmpjuItuKqDzcvKhkTGQ3aOxdbFgtc9cKGZmWMS2Pl2MP66OX0vrBjUF2t9m5hpSW
	 8baH8ixIFNnK3661E9pO6zpI6M1wPVoo8txnxIPC2ZtGAl6jPTVIKEetRb5L+77Xmw
	 l1YjXzrrSNtubejjbOmTPVkzZltSqYNH65Xm8j+JUuua7tyYkfXYn7vg1A9dmwjatk
	 eb6PsUzZyKaxJp1Niy538gGG0ejv8ZU76Uux3lkR4r3HXreHsZcWs9H09iiluK6rUG
	 6fifRdjbUbyRuanhPkA3Vgo4jewDrPDUaIEZlbB2xxER9X4+frxPSBN6ThhKzV1j+c
	 aRscoCphKQPxg==
Message-ID: <d1c7833a-10d6-4188-a0e7-fab31a6bad43@collabora.com>
Date: Mon, 23 Oct 2023 13:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: mediatek: mt7986: add sample rate checker
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231023095453.4860-1-maso.huang@mediatek.com>
 <20231023095453.4860-3-maso.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023095453.4860-3-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_040704_734424_5439F085 
X-CRM114-Status: GOOD (  13.72  )
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

Il 23/10/23 11:54, Maso Huang ha scritto:
> mt7986 only supports 8/12/16/24/32/48/96/192 kHz
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 22 +++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
> index e523d33846fe..270852ce3dd9 100644
> --- a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
> +++ b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
> @@ -237,12 +237,26 @@ static int mtk_dai_etdm_hw_params(struct snd_pcm_substream *substream,
>   				  struct snd_pcm_hw_params *params,
>   				  struct snd_soc_dai *dai)
>   {
> +	unsigned int rate = params_rate(params);
>   	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
>   
> -	mtk_dai_etdm_config(afe, params, dai, SNDRV_PCM_STREAM_PLAYBACK);
> -	mtk_dai_etdm_config(afe, params, dai, SNDRV_PCM_STREAM_CAPTURE);
> -
> -	return 0;
> +	switch (rate) {
> +	case 8000:
> +	case 12000:
> +	case 16000:
> +	case 24000:
> +	case 32000:
> +	case 48000:
> +	case 96000:
> +	case 192000:
> +		mtk_dai_etdm_config(afe, params, dai, SNDRV_PCM_STREAM_PLAYBACK);
> +		mtk_dai_etdm_config(afe, params, dai, SNDRV_PCM_STREAM_CAPTURE);
> +		return 0;
> +	default:
> +		dev_warn(afe->dev, "%s(), sample rate: %d is not supported\n", __func__, rate);
> +		dev_warn(afe->dev, "%s(), only support 8/12/16/24/32/48/96/192 kHz\n", __func__);

That's better:

dev_err(afe->dev,
	"Sample rate %d invalid. Supported rates: 8/12/16/24/32/48/96/192 kHz\n",
	rate, __func__);

after which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
Angelo



