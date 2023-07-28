Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D126C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fpe9hwu2JpbkIpAcwWqimZiTho8Z9MqWoUOsDI26M5A=; b=4Srdy8UJ8J1gq4l0PdBm6E75bT
	2dfTNm3Nn1t3rj9QR4KXjFVf3/JCji5rMXkuDCtU/Mx84oG1x0xSVxWMEMma3Cxpe9OFduu9+Uf/x
	4XNDTfCbfBjZCR2lbm9/mXWIZYqTgnF9v6PsrrnhcAltlghn/6/VzN0g1PNsScV/X0TW49O7xaNOF
	svu4Lf4cMbp1bBikOSJA+3ypsjVhxgcAiXPwSyTiG3/0+ZdXqdHL2Y8syP/LMB4fWfyZV3o47nCMb
	1dIp8zga27AnMgNE2mp1UJc6E3cfVNKUitQp18gLcQR2MM25hI3OcrX5ttCzG4uGehcGqIzbTkH0D
	Ha/sPQxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPK6T-002g3E-1R;
	Fri, 28 Jul 2023 09:49:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPK6Q-002g24-0q;
	Fri, 28 Jul 2023 09:49:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 127DD6607033;
	Fri, 28 Jul 2023 10:49:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690537780;
	bh=ij4/ehW7H1cIgNevCPDbeUMWtq6MltZ6I3dqFyecL5M=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=L4INdvrqYQBtlDD1Rq/3x9hYJEhTvrQmTzOW1bQzXSiHxpxn0e5+Xu7xSEddOIPXC
	 NydDHOFP7ZDj85NhKPT9VsYHkdgLmhKC5DgkKav5QFcAFWKfWnhJcd64EIvRnYYwuz
	 Gh1pdk2mOpAPoSj5aTSis56LHFRHc+bQL4ThigvmnV422MjtFYtQd6AO/YnUvODLwu
	 yzh4XRAAeGw4b8cTAHCgePMKWjMjEhLbG3y3V7EnFPJRuqMgVAZ0qTXBYjcUyFN28W
	 rFTTTFz6fKWA9tReZ7aiM8vqjLmfCW/v64m+GwIQ+2mRTpGT8sy+fIeihEAxOQ/0kW
	 6nKXXXJ4KifsA==
Message-ID: <bab11add-b56f-59d3-f4fc-ad248ebe9b99@collabora.com>
Date: Fri, 28 Jul 2023 11:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/6] ASoC: mediatek: mt7986: add machine driver with
 wm8960
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-5-maso.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230728090819.18038-5-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_024942_559774_EA26B8AC 
X-CRM114-Status: GOOD (  27.61  )
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

Il 28/07/23 11:08, Maso Huang ha scritto:
> Add support for mt7986 board with wm8960.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>   sound/soc/mediatek/Kconfig                |  10 ++
>   sound/soc/mediatek/mt7986/Makefile        |   1 +
>   sound/soc/mediatek/mt7986/mt7986-wm8960.c | 184 ++++++++++++++++++++++
>   3 files changed, 195 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt7986/mt7986-wm8960.c
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 558827755a8d..8d1bc8814486 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -64,6 +64,16 @@ config SND_SOC_MT7986
>   	  Select Y if you have such device.
>   	  If unsure select "N".
>   
> +config SND_SOC_MT7986_WM8960
> +	tristate "ASoc Audio driver for MT7986 with WM8960 codec"
> +	depends on SND_SOC_MT7986 && I2C
> +	select SND_SOC_WM8960
> +	help
> +	  This adds support for ASoC machine driver for MediaTek MT7986
> +	  boards with the WM8960 codecs.
> +	  Select Y if you have such device.
> +	  If unsure select "N".
> +
>   config SND_SOC_MT8173
>   	tristate "ASoC support for Mediatek MT8173 chip"
>   	depends on ARCH_MEDIATEK
> diff --git a/sound/soc/mediatek/mt7986/Makefile b/sound/soc/mediatek/mt7986/Makefile
> index de0742a67cae..fc4c82559b29 100644
> --- a/sound/soc/mediatek/mt7986/Makefile
> +++ b/sound/soc/mediatek/mt7986/Makefile
> @@ -6,3 +6,4 @@ snd-soc-mt7986-afe-objs := \
>   	mt7986-dai-etdm.o
>   
>   obj-$(CONFIG_SND_SOC_MT7986) += snd-soc-mt7986-afe.o
> +obj-$(CONFIG_SND_SOC_MT7986_WM8960) += mt7986-wm8960.o
> diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
> new file mode 100644
> index 000000000000..a880fcb8662e
> --- /dev/null
> +++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c

..snip..

> +static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = &mt7986_wm8960_card;
> +	struct snd_soc_dai_link *dai_link;
> +	struct mt7986_wm8960_priv *priv;
> +	int ret, i;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->platform_node = of_parse_phandle(pdev->dev.of_node,
> +					       "mediatek,platform", 0);
> +	if (!priv->platform_node) {
> +		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	for_each_card_prelinks(card, i, dai_link) {
> +		if (dai_link->platforms->name)
> +			continue;
> +		dai_link->platforms->of_node = priv->platform_node;
> +	}
> +
> +	card->dev = &pdev->dev;
> +
> +	priv->codec_node = of_parse_phandle(pdev->dev.of_node,
> +					    "mediatek,audio-codec", 0);
> +	if (!priv->codec_node) {
> +		dev_err(&pdev->dev,
> +			"Property 'audio-codec' missing or invalid\n");
> +		of_node_put(priv->platform_node);
> +		return -EINVAL;
> +	}
> +
> +	for_each_card_prelinks(card, i, dai_link) {
> +		if (dai_link->codecs->name)
> +			continue;
> +		dai_link->codecs->of_node = priv->codec_node;
> +	}
> +
> +	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
> +		goto err_of_node_put;
> +	}
> +
> +	ret = devm_snd_soc_register_card(&pdev->dev, card);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
> +			__func__, ret);
> +		goto err_of_node_put;
> +	}
> +
> +err_of_node_put:
> +	of_node_put(priv->codec_node);
> +	of_node_put(priv->platform_node);
> +	return ret;
> +}
> +
> +static void mt7986_wm8960_machine_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = platform_get_drvdata(pdev);
> +	struct mt7986_wm8960_priv *priv = snd_soc_card_get_drvdata(card);
> +
> +	of_node_put(priv->codec_node);
> +	of_node_put(priv->platform_node);
> +}
> +
> +#ifdef CONFIG_OF

Your probe function *relies on* devicetree, and you're adding an ifdef for
CONFIG_OF? That wouldn't make sense, would it? ;-)

> +static const struct of_device_id mt7986_wm8960_machine_dt_match[] = {
> +	{.compatible = "mediatek,mt7986-wm8960-machine",},

please...

{ .compatible = "mediatek,mt7986-wm8960-machine" },

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mt7986_wm8960_machine_dt_match);
> +#endif
> +
> +static struct platform_driver mt7986_wm8960_machine = {
> +	.driver = {
> +		.name = "mt7986-wm8960",
> +#ifdef CONFIG_OF

Check `struct device_driver`: const struct of_device_id *of_match_table is
always present, there's no ifdef.... and that's done in order to avoid seeing
a bunch of ifdefs in drivers...

...so, why is this callback enclosed in an ifdef?

Please drop all those ifdefs.


After addressing those last comments, you can get my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
Angelo

