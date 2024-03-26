Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EED9CD11DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Mar 2024 09:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SlUvErwAnYqUqDGZohx8yc7/n1w1bJF62439LoJFUM=; b=gBJ1GK5nLIVGO8ndHH4oSJKkFf
	AVV4sbu5JaX19+PuW9nFn61z856xQmuMfg/90ZhEUhctOvmMSwOYHbg1M4mN5XLtVnjq6zrfTXJSt
	15bsTN/uSjBs1ypHTd5naGKosPG3CfXWvAHV97uv7qdGsYETgX4VMjCYEmDwX/h/leAT/vnHRCRws
	MWgj/wbPu9LcbpSGphI9Xp3dC6cVNU7T3+WFAlVJGr2cRhLbAjVX8+GIRqg6SUgwur+C426WX33gu
	qA1+KtBOBTeFQZYwfVmxr9DYeLNftlRlceDoGlWXKZ2x1hZ1ukhMiMyTOJIuXp1UuK48B3yEyoKXt
	kANdR+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp2gZ-00000003iQX-2TXe;
	Tue, 26 Mar 2024 09:01:36 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp2gR-00000003iKg-07Aa;
	Tue, 26 Mar 2024 09:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711443682;
	bh=ixR84/hC5ObDuk4xPuGOBtJ9kzC3VnB6M3PMiFfGYYw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xVo5qX9gWM7zCDSwnSrhWrJ89WQvr7Mbc8CNeGAKCYK8/DNDNUah7EFJtxQsJQteW
	 pwHub4vWv7+ankvLH9iVnb3NilI/G/gn5g4ssqgBuAMsTkG0XhBKVGw4mg2Qq5nPpO
	 croR8uM9EiMqWkOpeGDYUWP4vMdJbgFKuUn/xTItahZ7+NaWD3vz2hgCiZGvbbtZ+a
	 oWifTWYZw2g2fRnlXx8xQYfX9I7Pn6yFQyGaKZnyTth+SqgOzxAhMeo6rwwjZaKjAd
	 3cevRIaBA+SSmFVdKAFeITWqCF0EzI7DS2OH7ViPquRFEKRIM+JoZaqX4qhH3fEzVH
	 jl47zmQ8nbWbA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 15BA33782082;
	Tue, 26 Mar 2024 09:01:20 +0000 (UTC)
Message-ID: <eb4b5b1d-90dc-4355-8fb0-5fb7f2bb2426@collabora.com>
Date: Tue, 26 Mar 2024 10:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/22] ASoC: mediatek: Add common machine soundcard
 driver probe mechanism
To: Mark Brown <broonie@kernel.org>
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com,
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
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
 <20240313110147.1267793-6-angelogioacchino.delregno@collabora.com>
 <6b9dd2ad-a24e-497a-8a5c-c7c04475cf5d@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6b9dd2ad-a24e-497a-8a5c-c7c04475cf5d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_020127_269559_3B91D56B 
X-CRM114-Status: GOOD (  11.30  )
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

Il 25/03/24 15:18, Mark Brown ha scritto:
> On Wed, Mar 13, 2024 at 12:01:30PM +0100, AngeloGioacchino Del Regno wrote:
>> Add a common machine soundcard driver probe function that supports both
>> DSP and AFE-direct usecases and also provides a hook for legacy machine
>> soundcard driver probe mechanisms.
>>
>> Note that the hook is there because, even for legacy probe, a lot of the
>> actual code can still be commonized, hence still reducing duplication
>> for the legacy devicetree retrocompatibility cases.
>>
>> This common probe function deprecates all of the inconsistent previous
>> probe mechanisms and aims to settle all of the MediaTek card drivers on
>> consistent and common devicetree properties describing wanted DAIs,
>> device specific DAI configuration and DAI links to codecs found on
>> each device/board.
> 
> This breaks allmodconfig builds:

Oops. Forgot to test this commit without the next one constifying stuff around.
I'll recheck and make this one right. Good catch!

Thanks for notifying!

Cheers,
Angelo

> 
> 
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In function ‘mtk_sof_dai_link_fixup’:
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:18:41: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>     18 |         struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
>        |                                         ^~~~~~~~~~~~~
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In function ‘mtk_sof_card_probe’:
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:58:41: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>     58 |         struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
>        |                                         ^~~~~~~~~~~~~
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In function ‘mtk_sof_find_tplg_be’:
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:76:41: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>     76 |         struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
>        |                                         ^~~~~~~~~~~~~
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In function ‘mtk_sof_check_tplg_be_dai_link_fixup’:
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:116:41: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>    116 |         struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
>        |                                         ^~~~~~~~~~~~~
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In function ‘mtk_sof_card_late_probe’:
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:147:41: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>    147 |         struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
>        |                                         ^~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> 

