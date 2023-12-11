Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D64C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 14:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7noqJIIFLhFjkA8/afhqV2bph4J7a8XBP28TLJNC/g=; b=QQvYvQ3BXnUI0pS2uK56k9BVSc
	vtj/4J/k5hOE0E4V9Q+6hL8eB+keIriULX6HClf97eQrxF+TJsXv8mhIzvc7CoZlQl3zv3TY24r0q
	YX3AZ5sav5vuG4GQNAW0gKYFUz8CNv4f4oXqOPDoqASntjNXgVbKQh/Qp9Z/52PehOnBxhO5JkxNu
	O1SjYq0lPCW+17FRE3GKpwp4jbTxROOGYb0G01fTbbjgQKY9qgCoZpa+lzNtOHkMG6dfEb79yJEK4
	p0Hm7yFS53lpDX9xSixx0xbRijDkKZsv7Ho7LPPFvjg1T8KSJymvu2VzrYBrAbYo+ckJGsJzbJceb
	WxGyhzaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rChSC-005CtR-21;
	Mon, 11 Dec 2023 14:40:17 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rChS2-005CsI-0a
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Dec 2023 14:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702305604;
	bh=mHqy3MLA/9M7nW96ItcsknqxLKHqo776t076HdgMBAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cTbkhIzCFdoEV0uYQTVUa6/pb9AXzjTzF6cLn47gY7+4LU9L21xaasczt2/YfGeHd
	 wRXGelT8P6bZSD5eeKxrMyWAXTfaxBNQ1Ki/J58+AKbfn33cGxzrBtiedrrwtqZSGc
	 DM7er+YsapqrVSR3YG9vkouR7mP4ezoJPdMvsHzrUiOvZZaDxgZvugG3TCY5F3gDl5
	 UHNee14BOZkryVP5CfTDPXpVDYhlig6bJU8ihObIC5XO9OP0lQEd0h4VMWZFAdessk
	 mseWsgcV+A0VHUj13S36WRk5s3rdnEKQytFkjSZVOKYVRxSGzKm6OKyPXkFZIoqBke
	 QXU6QUrwgbdsg==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 481CB37813FD;
	Mon, 11 Dec 2023 14:40:03 +0000 (UTC)
Message-ID: <db3429e0-0173-4f13-bccb-78ac56ad4ed9@collabora.com>
Date: Mon, 11 Dec 2023 15:40:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v8 3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
Content-Language: en-US
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, perex@perex.cz, trevor.wu@mediatek.com,
 allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com
Cc: linux-mediatek@lists.infradead.org
References: <20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com>
 <20231208070933.720324-4-zhourui@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231208070933.720324-4-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_064007_355118_1B1AD03C 
X-CRM114-Status: GOOD (  23.52  )
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

Il 08/12/23 08:09, Rui Zhou ha scritto:
> To use ES8326 as the codec, add a new sound card
> named mt8186_es8326.
> 
> Reviewed-by: Trevor Wu <trevor.wu@mediatek.com>
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
> ---
>   sound/soc/mediatek/Kconfig                |  1 +
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 51 ++++++++++++++++++++++-
>   2 files changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index b93d455744ab..296b434caf81 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -252,6 +252,7 @@ config SND_SOC_MT8188_MT6359
>   	select SND_SOC_NAU8315
>   	select SND_SOC_NAU8825
>   	select SND_SOC_RT5682S
> +	select SND_SOC_ES8326
>   	help
>   	  This adds support for ASoC machine driver for MediaTek MT8188
>   	  boards with the MT6359 and other I2S audio codecs.
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index b4606a28794c..ddbdf9265640 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -34,6 +34,8 @@
>   
>   #define NAU8825_HS_PRESENT	BIT(0)
>   #define RT5682S_HS_PRESENT	BIT(1)
> +#define ES8326_HS_PRESENT	BIT(2)
> +#define MAX98390_TWO_AMP	BIT(3)
>   /*
>    * Maxim MAX98390
>    */
> @@ -48,6 +50,11 @@
>    */
>   #define NAU8825_CODEC_DAI  "nau8825-hifi"
>   
> +/*
> + * ES8326
> + */
> +#define ES8326_CODEC_DAI  "ES8326 HiFi"
> +
>   #define SOF_DMA_DL2 "SOF_DMA_DL2"
>   #define SOF_DMA_DL3 "SOF_DMA_DL3"
>   #define SOF_DMA_UL4 "SOF_DMA_UL4"
> @@ -888,6 +895,30 @@ static const struct snd_soc_ops mt8188_sof_be_ops = {
>   	.hw_params = mt8188_sof_be_hw_params,
>   };
>   
> +static int mt8188_es8326_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
> +	unsigned int rate = params_rate(params);
> +	int ret;
> +
> +	/* Configure MCLK for codec */
> +	ret = snd_soc_dai_set_sysclk(codec_dai, 0, rate * 256, SND_SOC_CLOCK_IN);
> +	if (ret < 0) {
> +		dev_err(codec_dai->dev, "can't set MCLK %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Configure MCLK for cpu */
> +	return snd_soc_dai_set_sysclk(cpu_dai, 0, rate * 256, SND_SOC_CLOCK_OUT);
> +}
> +
> +static const struct snd_soc_ops mt8188_es8326_ops = {
> +	.hw_params = mt8188_es8326_hw_params,
> +};
> +
>   static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
>   	/* FE */
>   	[DAI_LINK_DL2_FE] = {
> @@ -1197,7 +1228,7 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
>   	struct mt8188_card_data *card_data = (struct mt8188_card_data *)priv->private_data;
>   	struct snd_kcontrol *kctl;
>   
> -	if (card_data->quirk & (NAU8825_HS_PRESENT | RT5682S_HS_PRESENT)) {
> +	if (card_data->quirk & (NAU8825_HS_PRESENT | RT5682S_HS_PRESENT | ES8326_HS_PRESENT)) {
>   		struct snd_soc_dapm_widget *w, *next_w;
>   
>   		for_each_card_widgets_safe(card, w, next_w) {
> @@ -1238,6 +1269,7 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
>   	struct mt8188_card_data *card_data;
>   	struct snd_soc_dai_link *dai_link;
>   	bool init_mt6359 = false;
> +	bool init_es8326 = false;
>   	bool init_nau8825 = false;
>   	bool init_rt5682s = false;
>   	bool init_max98390 = false;
> @@ -1344,7 +1376,9 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
>   			   strcmp(dai_link->name, "ETDM1_IN_BE") == 0 ||
>   			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
>   			if (!strcmp(dai_link->codecs->dai_name, MAX98390_CODEC_DAI)) {
> -				dai_link->ops = &mt8188_max98390_ops;
> +				if (!(card_data->quirk & MAX98390_TWO_AMP)) {
> +					dai_link->ops = &mt8188_max98390_ops;
> +				}

Can you please explain why is it *not* necessary to setup the TDM with
mt8188_max98390_ops in the TWO_AMP case?

Please also add that as a comment in the code, as this looks strange.

Thanks,
Angelo


