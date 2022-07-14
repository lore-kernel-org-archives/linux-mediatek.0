Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88363C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 14:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jm010gidW5+O5I2gzSjXUhP/k6+j90Fw/kTsQwHYTY4=; b=YO1BxNsf/3KD3wIFKrpvJ8FF2T
	hSLBmWOy/ZNa2P1hkvmiUdis3HaVW5n6sXkbXtJJi3M/rcJEeb1UWVHqIpbV31kALfUqWFsunBdrm
	GIfSwCyyfNxsbm2kGBbagXVu1HwHC/wqbR2lVZ3RkTYSQi+D9Eqf1o1ntj+TnPenTmlCfkA6qeJqE
	Z8NF2mps25YmqWLc1SuXGLnD2pImF23vFzTyUwQgdk20v00Z6nkChfpsvtgOdiY6teyW2iBETLrTo
	Rw2PcOrqvzlPDojIUj13yOuxzyV7Dm1okG0BN3awZrT73kk3SelixRZaE7swHa/Tfk/T074WnJ+OA
	YWAT2b/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzas-00F4fQ-Ho; Thu, 14 Jul 2022 14:13:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzaV-00F4T5-3X; Thu, 14 Jul 2022 14:13:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B6EFC6601A3B;
	Thu, 14 Jul 2022 15:13:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657807985;
	bh=K1pAx4yUym6fPpWmvpm8rAcGNbLZfMNPgYQz3MOq/KM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KkuVebcLx9P3YNSG5CYljp9B98IOxqVxAVxR3Z5DXxVLFCO+yM9qMTKuKQxVkUg0x
	 pxpEm2JYS8pt7RkXL8eG4YquZ2Q/pIF3pUQ9QIpecnHutC6jxUFr4mIyJplFhnpAma
	 AKqpbRQh/9D5UXVYx79cdq5cynV3pV8Q/Nk9xehoS4cucN25RG8a0HNRaWpdipcs2R
	 PeOV6P3gCzUcTCi22FNwHoG+fgblDAhXkGhVr9pPito0xY66ujKkrbRY8Jlh183eQy
	 wvUmwpMItZTzcRGfLOgoK9qXCmwUM154IToVD4OsPNoHHiXfMJc540R5WZdVutvGK/
	 LYYyPSkRARddw==
Message-ID: <6991dcc6-5902-a9ed-78c4-c7bd4f60f91c@collabora.com>
Date: Thu, 14 Jul 2022 16:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 5/8] ASoC: mediatek: mt8186: add machine driver with
 mt6366, da7219 and max98357
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220712150442.32504-1-jiaxin.yu@mediatek.com>
 <20220712150442.32504-6-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220712150442.32504-6-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_071307_357606_E958585E 
X-CRM114-Status: GOOD (  11.03  )
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

Il 12/07/22 17:04, Jiaxin Yu ha scritto:
> Add support for mt8186 board with mt6366, da7219 and max98357.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>   sound/soc/mediatek/Kconfig                    |   16 +
>   sound/soc/mediatek/mt8186/Makefile            |    1 +
>   .../mt8186/mt8186-mt6366-da7219-max98357.c    | 1002 +++++++++++++++++
>   3 files changed, 1019 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
> 

> +
> +static int mt8186_mt6366_da7219_max98357_dev_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card;
> +	struct snd_soc_dai_link *dai_link;
> +	struct mt8186_mt6366_da7219_max98357_priv *priv;
> +	struct device_node *platform_node, *headset_codec, *playback_codec;
> +	int ret, i;
> +
> +	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);

You don't really need this cast, plus, you can use device_get_match_data() instead.

After that:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

