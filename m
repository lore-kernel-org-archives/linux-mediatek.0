Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D67C001DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 07:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKafka3pGjcLn6R2OiYGs1IpkrjESTuIB/oh908hDCM=; b=eCxSV7sTucGz6ivyoL0XCDVi1M
	c5CVWaPXM3/LzPw4othWc5XD+uTv2F/mLAey7CBLhsZUWRqQZui/JMu22HdySj7Yoh583uQm95Qgj
	vciochiH0yyW9Z57xFRVa5NU9cNu4+R2SqLWVyE/29k5wmdfhXdIT/MVuh/ipWIawqhuOUbNaKbBm
	pcGWFhkWQiSQJ3WCgpNKnrNItz15URD6BjNPYN1hdxjjAjBpyYERGAW2lBr/SUTLO46EpW9GXj9gv
	DQag8mZtvGVd2Prf0RDAtuiK4poIIj6/nPnbaDVIgpC61vRzcxOSZ8P4emxBJiPE+UjnYLStx6o6r
	3Laze0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOC82-006Wfv-1d;
	Tue, 25 Jul 2023 07:06:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOC7y-006Wei-2V;
	Tue, 25 Jul 2023 07:06:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D00966606FD7;
	Tue, 25 Jul 2023 08:06:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690268797;
	bh=yqfpjqkUtJH8uA1hTRcsCtHn3jzO74FwhI8vleq5HQE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nHiL7NR+q2o7lXVyMeePASERgqUyC3BYbt3zfNt7DM4zusoA4rV3YPGVBFVmpFTSa
	 VJIVjtglO7xTFXLdOwKVjcTFvr5S36Ya8QXkNr9d75TP2nJ7470hmLwXpENkAfN9oD
	 C5R/AAoHno/7Pd2N2Ik8g9VfO43sCXGxNU6oF3K8FA1tqpSo74WA92u1dy+goNZqio
	 hAa69oZdWSsIg56ZakNdgtQK/nQpIpdUqXsbORMt+VdzDaXt2bLh9zq5N6MPx4F9Mh
	 8auc6NhSvESCZQKVmbCcoU7983vixRHxguODL4jMzPZny1C5qW+Xw2/J5n9phfuj1q
	 oEuBrVp7znHrw==
Message-ID: <5314542c-9a99-fad1-93f6-4f72c8698715@collabora.com>
Date: Tue, 25 Jul 2023 09:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] ASoC: mediatek: mt8188-mt6359: support dynamic
 pinctrl
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230725035304.2864-1-trevor.wu@mediatek.com>
 <20230725035304.2864-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230725035304.2864-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_000638_950604_059ED068 
X-CRM114-Status: GOOD (  20.41  )
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

Il 25/07/23 05:53, Trevor Wu ha scritto:
> To avoid power leakage, it is recommended to replace the default pinctrl
> state with dynamic pinctrl since certain audio pinmux functions can
> remain in a HIGH state even when audio is disabled. Linking pinctrl with
> DAPM using SND_SOC_DAPM_PINCTRL will ensure that audio pins remain in
> GPIO mode by default and only switch to an audio function when necessary.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index 7c9e08e6a4f5..667d79f33bf2 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -246,6 +246,11 @@ static const struct snd_soc_dapm_widget mt8188_mt6359_widgets[] = {
>   	SND_SOC_DAPM_MIC("Headset Mic", NULL),
>   	SND_SOC_DAPM_SINK("HDMI"),
>   	SND_SOC_DAPM_SINK("DP"),
> +
> +	/* dynamic pinctrl */
> +	SND_SOC_DAPM_PINCTRL("ETDM_SPK_PIN", "aud_etdm_spk_on", "aud_etdm_spk_off"),
> +	SND_SOC_DAPM_PINCTRL("ETDM_HP_PIN", "aud_etdm_hp_on", "aud_etdm_hp_off"),
> +	SND_SOC_DAPM_PINCTRL("MTKAIF_PIN", "aud_mtkaif_on", "aud_mtkaif_off"),
>   };
>   
>   static const struct snd_kcontrol_new mt8188_mt6359_controls[] = {
> @@ -267,6 +272,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
>   	struct snd_soc_component *cmpnt_codec =
>   		asoc_rtd_to_codec(rtd, 0)->component;
> +	struct snd_soc_dapm_widget *pin_w = NULL, *w;
>   	struct mtk_base_afe *afe;
>   	struct mt8188_afe_private *afe_priv;
>   	struct mtkaif_param *param;
> @@ -306,6 +312,18 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   		return 0;
>   	}
>   
> +	for_each_card_widgets(rtd->card, w) {
> +		if (!strcmp(w->name, "MTKAIF_PIN")) {

if (strncmp(w->name, "MTKAIF_PIN", strlen(w->name) == 0) {
	pin_w = w;
	break;
}

That's safer.

> +			pin_w = w;
> +			break;
> +		}
> +	}
> +
> +	if (!pin_w)

Just a nitpick: you're checking for `if (pin_w)` later in this function, so
to increase readability please do the same here.

if (pin_w)
	dapm_pinctrl_event(...)
else
	dev_dbg(...)

Regards,
Angelo

