Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39531EB8FB4
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFD2tKig988p+nyLWDkmgUfiyTgw/5tkGCahsn8FoGo=; b=bxaMGtNjLASspLgfx2nj7eWfaQ
	2ueEti67Ie+/XOOIaO+GSpalb+MDCmCNr4GqhFIAW30eEceV9NuG4s48SPTnJCJpnAxxdieUOBjwy
	0ujbqyJaWBNPhtjjwTj02RjQt2DSJuP8OrPPJxHVHYX3x9qiDYRTcaGqLSVYSaPKnTRvGRJiNZMoq
	EfGSOKyoAItUrITwzjfkzpdFze2IDQQoV2KCZkS7LnIC5wyDSnZH8maStGFKsJR3h1nDijGXpJ1Vt
	ewcbqMwxqWnpFzgvdR9pIu/6N0aNkPGsJylzmahusiyT0WWf9gaOLuIO2MVBJAWpI97bMBVAXwqqv
	w7CeKJ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdovd-007wX3-2X;
	Wed, 06 Sep 2023 09:34:29 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdova-007wV8-2i
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Sep 2023 09:34:28 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-52c9be5e6f0so4600562a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Sep 2023 02:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693992864; x=1694597664; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFD2tKig988p+nyLWDkmgUfiyTgw/5tkGCahsn8FoGo=;
        b=BtY68YbYKlVtN5KG7Ml9yzfyvGvq2QQ50YziZ49xhuOgDpPjBDWovj4EsUcVUQF+5k
         qM1r/hzUiAAabmCgb0i+rjxtYmZ/7wcgS0WAulW3jjLOZgNwhkJZ0xn5n4h4O9uiND/g
         hET9+XOcoJQKtGsfNTFu7monxV6A9DgDz6P+R4UKJ4XT1CpA6N9xqa4e8Zy9bmBurnp+
         ck/8t5XghSrIuahEGBIlG6VkYaEOmgyMXaM5WDoekEIyeSlkXJj9FgQxnmdgrfYTlQnM
         BqxY2PO3pO+5Ip4DVNF4NA9k1c5inpkDCzNeXOsu5vQEzn51fuN3bPkZL5roS0PHEKzY
         nXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992864; x=1694597664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFD2tKig988p+nyLWDkmgUfiyTgw/5tkGCahsn8FoGo=;
        b=Vz8idbL0sTkQH4Awul7WlAylVq3tFvSNGLX0Gi3/sogRV7r0b//Up9YCLaLaxbK7TV
         SHIHfXRDrM0WRGmYV0/bxJHFQyj+Pv3wdAapglNQIDRcSr000kdbgI4eMoef0eMM7u3S
         bQs78wPBlG+YLRMyHu67cF1SyiadD9JEcHuH1pBk8FY83OC0TtrDp7I/gEebQdJt9oin
         btTorCo1V5fPkhPBroU036vuckVb1FxtsdcuU1jFmj2X/ZKBXbNqrWb3bgQ1WL0dE4hc
         BI8aCQxJ6nslyZ9H3h+Cf8YyEB/P1/iTHHItM5Ll/UvpjfZ4bflT8NuGHv8XzLG9uZdk
         E96A==
X-Gm-Message-State: AOJu0Yw5DFUmMYWDkcLY0ym9sb/8FBT6qfCm/qRM2lah+/sXSM4dNu5/
	Wlxkts1J76HVIsews8WA+gz5lA==
X-Google-Smtp-Source: AGHT+IH6q0YbahWp/ZkV/kLa2NyEia2qzHpTs1IMS+0oSP9G5r5jyvzt5JtP17ezqw/WAp681nsONw==
X-Received: by 2002:a17:906:3017:b0:9a1:e1cf:6c6c with SMTP id 23-20020a170906301700b009a1e1cf6c6cmr1874832ejz.30.1693992864037;
        Wed, 06 Sep 2023 02:34:24 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id a6-20020a170906244600b0099cce6f7d50sm8872914ejb.64.2023.09.06.02.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 02:34:23 -0700 (PDT)
Message-ID: <2cb8069a-976b-0af4-a427-1e63ba4e7870@linaro.org>
Date: Wed, 6 Sep 2023 11:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: add device-tree for Genio
 1200 EVK board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Ben Lok <ben.lok@mediatek.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <20230906092527.18281-1-macpaul.lin@mediatek.com>
 <20230906092527.18281-2-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230906092527.18281-2-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_023426_878626_70F4BCF4 
X-CRM114-Status: GOOD (  10.67  )
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

On 06/09/2023 11:25, Macpaul Lin wrote:
> +	edp_panel_fixed_12v: regulator-1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "edp_backlight_12v";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		enable-active-high;
> +		gpio = <&pio 96 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&edp_panel_12v_en_pins>;
> +	};
> +
> +	backlight_lcd0: backlight-lcd0 {
> +		compatible = "pwm-backlight";
> +		pwms = <&disp_pwm0 0 500000>;
> +		enable-gpios = <&pio 47 GPIO_ACTIVE_HIGH>;
> +		brightness-levels = <0 1023>;
> +		num-interpolated-steps = <1023>;
> +		default-brightness-level = <576>;
> +	};
> +
> +	backlight_lcd1: backlight-lcd1 {
> +		compatible = "pwm-backlight";
> +		pwms = <&disp_pwm1 0 500000>;
> +		enable-gpios = <&pio 46 GPIO_ACTIVE_HIGH>;
> +		brightness-levels = <0 1023>;
> +		num-interpolated-steps = <1023>;
> +		default-brightness-level = <576>;
> +	};
> +
> +	keys: gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-volume-up {
> +			wakeup-source;
> +			debounce-interval = <100>;
> +			gpios = <&pio 106 GPIO_ACTIVE_LOW>;
> +			label = "volume_up";
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
> +
> +	can_clk: can-clk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <20000000>;
> +		clock-output-names = "can-clk";
> +	};
> +
> +	wifi_3v3: wifi-3v3-regulator {

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof


