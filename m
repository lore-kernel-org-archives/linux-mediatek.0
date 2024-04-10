Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E905CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 15:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQ+uqsDAejP76v594GWmmgMr+pkLe99jnIl9kIiTI+A=; b=kQVGnzXc1eB7FjMT56ughKZrsm
	8aYkXiY4iELtvev67cRQzdpBCirwo/8L0tfF9Segp/Jfm8TPjT5DVvcivBcvEZj4qMQCVxHuJQ1i8
	OK09oKi5DrEjUaveXgEurZPE7sNPg8dLuzJxl7Jor9vFljtZrsK4cLT+yjyFxHzHpL0xJch4HMy+2
	LTb/HDvqLMZ2CBv2lLmpfTNr06JPL1TAK73TO98NdU7lX5sflqT44XbQyQ1sd6zuV+yEoewoTKyhE
	4oMeKhd6v0xnlvRIR/VWxe2xGC1TkyA2Lq7utS1qTcn4/hWrmL1QLUOj0WrHkKNs4IrZewyBfoQbu
	GinQfRhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZsd-00000007mEs-2MNc;
	Wed, 10 Apr 2024 15:28:55 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZsZ-00000007mC1-23t3;
	Wed, 10 Apr 2024 15:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712762924;
	bh=CKYJu7WyQjbgodgDBQk/bD0aZ+5Ih4b2bRRph8ajJNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K1g8NZ9XR3lakU90fT945gzq+DiAo/FRpF8YT7T6u+aQZmErduUjLkdbPHkFjx8pu
	 mzrRW1tBX48RU8nBach238E42fYVQLFIvISoTqSysZhQeyZRkdXYnEHB78EC60oPHs
	 HcAah3gmFWgu5zRhllO7O8W1tC98QU5Xc6BgbldS76U0M9dPM1Vw68ZgGPP9D1G5R4
	 dCTniLg2gjCeqAcr5rFQDwfICu23kOxzIWORkG44Xmu1YRVXkgd2ISRqssYHuleWcZ
	 2riMyfqkOmZ9NXXLB+wUCSUs577ZiwKxtmL1FoSDrtAxskh8Uj1CoNZCDrihogfJW5
	 HhS7bd8w+H66w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 89F423780C13;
	Wed, 10 Apr 2024 15:28:42 +0000 (UTC)
Message-ID: <636411e6-05fd-4e32-8e3c-6bcc0c9ec063@collabora.com>
Date: Wed, 10 Apr 2024 17:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/18] ASoC: mediatek: mt8192: Migrate to
 mtk_soundcard_common_probe
To: Alexandre Mergnat <amergnat@baylibre.com>, broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
 <20240409113310.303261-6-angelogioacchino.delregno@collabora.com>
 <cf0184c4-2b3e-4074-9e30-bf65ec7f0aaa@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cf0184c4-2b3e-4074-9e30-bf65ec7f0aaa@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_082851_856240_9BA4DDBF 
X-CRM114-Status: GOOD (  12.95  )
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

Il 10/04/24 15:59, Alexandre Mergnat ha scritto:
> 
> 
> On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
>> @@ -1211,52 +1196,85 @@ static int mt8192_mt6359_dev_probe(struct platform_device 
>> *pdev)
>>           if (dai_link->num_codecs && dai_link->codecs[0].dai_name &&
>>               strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
>>               dai_link->ops = &mt8192_rt1015_i2s_ops;
>> -
>> -        if (!dai_link->platforms->name)
>> -            dai_link->platforms->of_node = platform_node;
>> -    }
>> -
>> -    priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> -    if (!priv) {
>> -        ret = -ENOMEM;
>> -        goto err_probe;
>> -    }
>> -    snd_soc_card_set_drvdata(card, priv);
>> -
>> -    ret = mt8192_afe_gpio_init(&pdev->dev);
>> -    if (ret) {
>> -        dev_err_probe(&pdev->dev, ret, "%s init gpio error\n", __func__);
> 
> I don't think __func__ is necessary.
> 
>> -        goto err_probe;
>>       }
>> -    ret = devm_snd_soc_register_card(&pdev->dev, card);
>> -    if (ret)
>> -        dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", 
>> __func__);
> 
> I don't think __func__ is necessary.

I am removing the line, here :-P

> 
>> -
>> -err_probe:
>>       of_node_put(headset_codec);
>>   err_headset_codec:
>>       of_node_put(speaker_codec);
>>   err_speaker_codec:
>> -    of_node_put(platform_node);
>> -err_platform_node:
>> -    of_node_put(hdmi_codec);
>> +    if (hdmi_codec)
>> +        of_node_put(hdmi_codec);
>> +
>>       return ret;
>>   }
>> +static int mt8192_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data, 
>> bool legacy)
>> +{
>> +    struct mtk_platform_card_data *card_data = soc_card_data->card_data;
>> +    struct snd_soc_card *card = card_data->card;
>> +    int ret;
>> +
>> +    if (legacy) {
>> +        ret = mt8192_mt6359_legacy_probe(soc_card_data);
>> +        if (ret)
>> +            return ret;
>> +    } else {
>> +        struct snd_soc_dai_link *dai_link;
>> +        int i;
>> +
>> +        for_each_card_prelinks(card, i, dai_link)
>> +            if (dai_link->num_codecs && dai_link->codecs[0].dai_name &&
>> +                strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
>> +                dai_link->ops = &mt8192_rt1015_i2s_ops;
>> +    }
>> +
>> +    ret = mt8192_afe_gpio_init(card->dev);
>> +    if (ret)
>> +        return dev_err_probe(card->dev, ret, "%s init gpio error\n", __func__);
> 
> I don't think __func__ is necessary.
> 

That was on purpose.
I'm migrating things, but I am leaving the prints as they were.

Cheers,
Angelo

>> +
>> +    return 0;
>> +}
> 
> Beside that,
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> 




