Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B04C77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 11:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ra9xJEZTA2MbhrUan6uLduuw9K7IyS0UN+mO9K+Ojt0=; b=SdiTARuWpiKfAqoYTAzmX/CI18
	ThvoOFKyEBuDmbnT5fD8TGrEJsGzK/vaEl29omgPIJbanyspVCaQxfS5FV96Lw72OF/TufxGvZyGW
	FCl/GKhuY1wfKmBDKZduWdm7sFy7f8PRQ+ezl4RZeqUPtpa+NKaM50ZxjY0+w53uB9XFlxlRg7SG8
	UXB87h6RUiMMW4U4ImmWk2CfSSwSgnwyaKHgq7Ay/ui3s2nQv8LMclaQZ0x2r2AfFb028log2qn2U
	olQy+4T8vP1OZFwQf6EFv507P48RQmRmtXCLVYapGPG6DSdfJnTXJxdAdoZWrfLA2GjOLG0vVq1xG
	MWeT4fjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFdZ-009fXd-0r;
	Wed, 17 May 2023 11:48:09 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFdW-009fVq-1K;
	Wed, 17 May 2023 11:48:07 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 36796660574E;
	Wed, 17 May 2023 12:48:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684324083;
	bh=pdURUQBQCGZwUYqLO8wHO9znW+z0Fce579FBz8y/290=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n5EEQbPvjfAzCHlxP0Yv0FWn8la8yKekCCiB7eUFzyS5QfzfhMeV8qiQsdFMJ9ORU
	 R94ccrA5DvKOsA5U1vkVnwc62L7Rjy2TkRKo8KKqiGqNNe/XeV19/VBM8oPhqk/EZJ
	 6FdOSm8P4sQbofdXZ+NFIpnHlWJehch51ubTROSluORGI8pOIWI8SGgm+ENd4JnzMo
	 AfzfmNhk5rPs5Tf6tRUvUEC+hMTmND+BTH/G+cAL9iujQ+ap+w+M4EW2xNC7xpoIvT
	 7UWj4ZBGLHJp7Gbke8YgVnRg2TzSK8up/K4rXu0J7DH7lOD04z6zZEWFhVIXjPwrpT
	 6Og2dQOJgMVOA==
Message-ID: <daac5c71-e6d3-04b0-f628-c53a4e12640d@collabora.com>
Date: Wed, 17 May 2023 13:48:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/5] ASoC: mediatek: common: soundcard driver add dai_fmt
 support
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
 <20230517111534.32630-4-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230517111534.32630-4-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_044806_580537_230BAD5E 
X-CRM114-Status: GOOD (  29.44  )
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
> There are two changes included in the patch.
> 
> First, add set_dailink_daifmt() function, so dai_fmt can be updated by
> the configuration in dai-link sub node.
> 
> Second, remove codec phandle from required property in dai-link sub node.
> For example, user possibly needs to update dai-format for all etdm
> co-clock dai-links, but codec doesn't need to be specified in capture
> dai-link for a speaker amp.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   .../mediatek/common/mtk-soundcard-driver.c    | 49 ++++++++++++++++++-
>   1 file changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> index 738093451ccb..5e291092046b 100644
> --- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
> +++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> @@ -22,7 +22,7 @@ static int set_card_codec_info(struct snd_soc_card *card,
>   
>   	codec_node = of_get_child_by_name(sub_node, "codec");
>   	if (!codec_node)
> -		return -EINVAL;
> +		return 0;
>   
>   	/* set card codec info */
>   	ret = snd_soc_of_get_dai_link_codecs(dev, codec_node, dai_link);
> @@ -36,6 +36,47 @@ static int set_card_codec_info(struct snd_soc_card *card,
>   	return 0;
>   }
>   
> +static int set_dailink_daifmt(struct snd_soc_card *card,
> +			      struct device_node *sub_node,
> +			      struct snd_soc_dai_link *dai_link)
> +{
> +	unsigned int daifmt;
> +	const char *str;
> +	int ret;
> +	struct {
> +		char *name;
> +		unsigned int val;
> +	} of_clk_table[] = {
> +		{ "cpu",	SND_SOC_DAIFMT_CBC_CFC },
> +		{ "codec",	SND_SOC_DAIFMT_CBP_CFP },
> +	};
> +

This is an optional property and this function should not do anything if that
property is not found, so....

	/*
	 * Check "mediatek,clk-provider" to select the clock provider
	 * in SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK area, if specified.
	 */
	if (!of_property_read_string(sub_node, "mediatek,clk-provider", &str))
		return 0;

...this allows you to reduce indentation as well.

> +	daifmt = snd_soc_daifmt_parse_format(sub_node, NULL);
> +	if (daifmt) {
> +		dai_link->dai_fmt &= SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
> +		dai_link->dai_fmt |= daifmt;
> +	}
> +
> +	/*
> +	 * check "mediatek,clk-provider = xxx"
> +	 * SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK area
> +	 */
> +	ret = of_property_read_string(sub_node, "mediatek,clk-provider", &str);
> +	if (ret == 0) {
> +		int i;
> +
> +		for (i = 0; i < ARRAY_SIZE(of_clk_table); i++) {
> +			if (strcmp(str, of_clk_table[i].name) == 0) {
> +				dai_link->dai_fmt &= ~SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
> +				dai_link->dai_fmt |= of_clk_table[i].val;
> +				break;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   int parse_dai_link_info(struct snd_soc_card *card)
>   {
>   	struct device *dev = card->dev;
> @@ -67,6 +108,12 @@ int parse_dai_link_info(struct snd_soc_card *card)
>   			of_node_put(sub_node);
>   			return ret;
>   		}
> +
> +		ret = set_dailink_daifmt(card, sub_node, dai_link);
> +		if (ret < 0) {

if (ret) {
  ...
}

> +			of_node_put(sub_node);
> +			return ret;
> +		}

Regards,
Angelo


