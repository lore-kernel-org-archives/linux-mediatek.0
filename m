Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE17CDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWSNGXWyZedj0p4rqDDH/tlg+K2TGVmwLmJw5pYotl8=; b=YhkDNFFU2S1xBm20YhjPgL+S0R
	UnIoK1bmhU2I0bSTWSLtLvqZiXrSmeq/DcSLsl98hXosrwe+hyJDkqmiSNnf+SSorjPpetNO5FtH6
	BTw6fUEJdxNPyRhFjZyx0c+/pIko0c4w4TU8qmHm9LoI/8oYijkl12ZGVwtygR2QXZSAA8tlga+Rh
	2nZqEgNSVZLvqCfKdamO9cMWxkNr1oXWNcZD95Qmmie0588gSlYm2oOUJJNpgggRpuZ9N5gsSV21A
	8TJwYcuvNPmV9t5HEm2cl3K6ZJoAAQDYW5LGImWyK9KvFvKYJBNaUXVnL3V/ajKGZS6SwVBcwUHqb
	vwME9iZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOhl-00GlCz-2m;
	Thu, 19 Oct 2023 08:48:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOhj-00GlCJ-1y
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 08:48:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E2B7B6607323;
	Thu, 19 Oct 2023 09:48:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697705310;
	bh=pJY2RrBl5HLa1epp69dnJbCNH+l6+T/i2vO65sSp5Pw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hbDae1DC8huSAsFEOB+wlMw6CdiLB4yv9Sl6q2n3K2P06RiYY7Q8fnqoLfcbv3sB1
	 HYu6m/TjMjHKrD27qeKBwo2yHqAvmcWg69/uOww0GK5VrQ2y5t78giSn6nNOynY6sE
	 soLknpa6UnGsk2nNfvPbtXjWNRwzdDeqmpPS3AS96BtwXcl2PjhgBlc5W1XMHU7g0h
	 FBlUs1RoWEWoM3WPwR3rgX6rKceSkT5148giRe0zkoN8WKKbfWD6DhCs3vC6dCjCIv
	 o68/OAkxUGlj6wVP/m6WMtvp8PBtpSlsZtIiglmwaLAz/8TUrU0G+rQF8VdSLFS3TT
	 a6O7wFnZRZkjA==
Message-ID: <54ec6435-e69b-444a-a31a-c878a4b3564a@collabora.com>
Date: Thu, 19 Oct 2023 10:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 2/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650
 support
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, trevor.wu@mediatek.com,
 jiaxin.yu@mediatek.com
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20231019021133.23855-3-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231019021133.23855-3-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_014831_779874_B4F3DC6A 
X-CRM114-Status: GOOD (  14.92  )
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

Il 19/10/23 04:11, xiazhengqiao ha scritto:
> To use RT5650 as the codec and the amp, add a new
> sound card named mt8186_rt5650.
> 
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> ---
>   sound/soc/mediatek/Kconfig                    |  1 +
>   .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 45 ++++++++++++++++++-
>   2 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 43c8fea00439..b93d455744ab 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -210,6 +210,7 @@ config SND_SOC_MT8186_MT6366_RT1019_RT5682S
>   	select SND_SOC_MAX98357A
>   	select SND_SOC_RT1015P
>   	select SND_SOC_RT5682S
> +	select SND_SOC_RT5645
>   	select SND_SOC_BT_SCO
>   	select SND_SOC_DMIC
>   	select SND_SOC_HDMI_CODEC
> diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
> index 4684bfd89ecd..8c534c338f0e 100644
> --- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
> +++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
> @@ -170,6 +170,7 @@ static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
>   	struct snd_soc_component *cmpnt_codec =
>   		snd_soc_rtd_to_codec(rtd, 0)->component;
>   	int ret;
> +	int type;
>   
>   	ret = mt8186_dai_i2s_set_share(afe, "I2S1", "I2S0");
>   	if (ret) {
> @@ -193,7 +194,8 @@ static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
>   	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
>   	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
>   
> -	return snd_soc_component_set_jack(cmpnt_codec, jack, NULL);
> +	type = SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3;
> +	return snd_soc_component_set_jack(cmpnt_codec, jack, (void *)&type);
>   }
>   
>   static int mt8186_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
> @@ -1058,6 +1060,28 @@ mt8186_mt6366_rt1019_rt5682s_routes[] = {
>   	{"DSP_DL2_VIRT", NULL, SOF_DMA_DL2},
>   };
>   
> +static const struct snd_soc_dapm_route
> +mt8186_mt6366_rt5650_routes[] = {

This fits in one line, please fix.

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


