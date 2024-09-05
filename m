Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AFCCE7AA2
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 23:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HUUgDpFpg7CH7B/u64K6gdMfWIHArY9NWamcfsBl4o=; b=TfMe7U8qZsJQn4RKwgy+Oiroq8
	crc6eR3TfUYsqfedxqxd8lwgsCG3NNMNGb4oRc4CFyCnscWQh3ZtcXVsVnV9S11vI/TVH6F7SBDh5
	C/n+z8CmpjzfmA7fYlPQ8JwHpjt2Ut1Oq6ajhXB4nGBzL5VCYfKn59MGDDDh1dzuQ7cISFO29Gp8B
	VHHKa7kpdqtIRA9NUCms0TKldQyChZQ8YX8kX6AaTmiGOtsTAM793FSf3k8ObWf6KbbezvQHSLh2F
	U5tZcvVdrOi/RwWPwnqIiZXwlwf5o2K1GTmNJM47LNWoYIEWN6BQqPEBHBa21pK7N9lGNUKWoC5Nr
	DDS6iRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smLhz-0000000A5yI-2OoK;
	Thu, 05 Sep 2024 23:16:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smKXL-00000009wxL-1c6x;
	Thu, 05 Sep 2024 22:01:18 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-374cacf18b1so864538f8f.2;
        Thu, 05 Sep 2024 15:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725573665; x=1726178465; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5HUUgDpFpg7CH7B/u64K6gdMfWIHArY9NWamcfsBl4o=;
        b=iktwlLpHw1R6Z+OCZUZaR061O324XwFZcXZi7Uk5y5jSyZKEQHuwt2YaYMQc/aWtug
         6Dg9oTHiuDI0akhvQd+YVvoLgkd6AqM04LO0c51t6KMlq6/nIfzrKsVRsS0AByXgh6vT
         zBQDSlW+mzN2uCkmNes4qzK+y780vNT0MW2taOqpkLT6wk1Rbq+XKZQDbC90f7LO2acZ
         yFUy8Fg3i/y+o96OookjZ+8f231V4g6iAAPuqAzIHf6qgRmtb8YMEhmcFwGf4p/NuRfp
         2pVGCBZqLuEOKYvzSZFiPkxr3U2G60zHVBFkqWgtYTTrvp3RQ8k1K4w8DUQLfWx8/IgF
         /7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725573665; x=1726178465;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HUUgDpFpg7CH7B/u64K6gdMfWIHArY9NWamcfsBl4o=;
        b=dsxlNpRx3PglFxqVg0nqVgyawuTcCZ6mH+K4Ezs+8jM7S5vMv6v5xIwBsG9GEvX3pd
         P3hHnqhIg6YhjYnincH0TnYlTN3LHEsvOH/dL9GkXSYwM46WF5OnXqR2pvwYfXDZNbR1
         9RToEy6cfoyQlcMjn1YBaYpSETRK84zHYIWSRjsZZcm71DGOKdRn04q8UbFxDZB6F+BD
         FNp+wAGiriTLGjCYJNq/IUspPgHyKEO2IFStGOoTCv3n24IZn5leMRxEchx6AXQWYE8f
         ZTK0Cp0SP/5bm09opGFkwfd4UOR4G8V1P88mVGdTbcuFB84cw3Z+x/IbR5wiV3zH2Au6
         1QRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFA3+xFj8xSmM2l4iPfIwzEmjqJG3cDg59ClJ6mbRdwUyNkP0YzqYfSLx52grbKLcRddYrft0cyKCbzoHi3h8=@lists.infradead.org, AJvYcCXv8/mTUIkP70FpX7x31ariKHiitsaLnRT7X7PEmnevnIhdm4IUbmpnbtwVnlJGQ8b5/boih7XFn4ziTh1GszPZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/Jdx7Q81iMX/cN4atlbuJE2blbs4JU4m5U/jvtw42/424MLKZ
	tkE+30Hbumb5QWBkp7oRadc5NUwN4e9+BhSYRABH5me9QaEsJiPM
X-Google-Smtp-Source: AGHT+IElmqtoaM4ugIP0F84FqbTkzYo43tKuoYe27gwYhYG+/JbVKL3d4EHnf4sLbNRkLnSCI011IQ==
X-Received: by 2002:a5d:5388:0:b0:376:27b7:da81 with SMTP id ffacd0b85a97d-37627b7e3a3mr7200895f8f.22.1725573664211;
        Thu, 05 Sep 2024 15:01:04 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.7.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca05ca70fsm194115e9.16.2024.09.05.15.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 15:01:03 -0700 (PDT)
Message-ID: <72b3ddc2-1c56-402b-a58a-cfe7e9f4aaa7@gmail.com>
Date: Fri, 6 Sep 2024 00:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] arm64: defconfig: enable mt8365 sound
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
 <20240226-audio-i350-v8-3-e80a57d026ce@baylibre.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240226-audio-i350-v8-3-e80a57d026ce@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_150107_465812_972869E9 
X-CRM114-Status: GOOD (  12.85  )
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



On 05/09/2024 11:07, Alexandre Mergnat wrote:
> Enable the MediaTek MT8365-EVK sound support.
> 
> The audio feature is handled by the MT8365 SoC and
> the MT6357 PMIC codec audio.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Applied, thanks.

> ---
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7d32fca64996..111ca3abd651 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -960,6 +960,8 @@ CONFIG_SND_SOC_MT8192=m
>   CONFIG_SND_SOC_MT8192_MT6359_RT1015_RT5682=m
>   CONFIG_SND_SOC_MT8195=m
>   CONFIG_SND_SOC_MT8195_MT6359=m
> +CONFIG_SND_SOC_MT8365=m
> +CONFIG_SND_SOC_MT8365_MT6357=m
>   CONFIG_SND_MESON_AXG_SOUND_CARD=m
>   CONFIG_SND_MESON_GX_SOUND_CARD=m
>   CONFIG_SND_SOC_QCOM=m
> 

