Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF17C77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 17:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPJs63vkmES77vLWP6h36VSVcoJgnvHBO16dXz7aLLA=; b=X9hMXItlaNonXAcXlPpKw71tLM
	IwbCBfB+kL3jXBB7kbBkzGVrwP1hcBxInmJZKnwkfK064SvYavNZS/hrljjsswDJsJNoRdtzKyzZo
	BzAGU7KglLY0jpob6/SHsgcaD9vzW8PZfii1yDI/6b3e/N07v5zW28qxyCvxqQXtntDl0YyZZ2mKX
	2rU2IWtoX/SIbfXOj7DH9dso4CYE8VIPLQYZfVzriGyjFAoMZViQbxib7FvXNFKnZwAXp+Ue4YTCi
	kJ60nRPQlF/Ahk/BwtxS/Fec4EZb6Bq7aC2nnW4vLPyDm492WorPwyYFrgm2hlF72olg91MG6IvZs
	aAkDCY1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phvzE-004ccC-0f;
	Thu, 30 Mar 2023 17:22:56 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phvzA-004caH-2b;
	Thu, 30 Mar 2023 17:22:54 +0000
Received: by mail-wr1-x436.google.com with SMTP id v1so19865342wrv.1;
        Thu, 30 Mar 2023 10:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680196971;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPJs63vkmES77vLWP6h36VSVcoJgnvHBO16dXz7aLLA=;
        b=HXRk0gSjc7UzTeVlVScMI/bFzbgMX6Yx0jQ7+4jjV6DbiTYXpmzqrCfaC6n/XV5O1s
         GTmmS93u4AXEG/2sSwLT0vXUqxiJ8DO6xBkmyY3kWOQgjtA1yZr/x0LSK9l0j01p0U5U
         CWV95X1Lbaur4n4ym0ubz4jziweW0xxdp+Xg9jblSMmG9Pu70RpkNGFWxGr1pYMJu55J
         FC5/CEsyB7kDishxKTQILkUpwj24mwr/qxifNx+6eZcTxEjXTXokLd71O7ffNfjP1z2Y
         Wy2VW9ADXsVVW/lCjhTPZ2gvKUUhp+ErKtO0jvW+Hj0JLgkUzyiqpyilqKwOYXA0+tzK
         IlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680196971;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pPJs63vkmES77vLWP6h36VSVcoJgnvHBO16dXz7aLLA=;
        b=0TyPQxteJVzs1jUAw8wdNi/UdMVSpiYxQIZFYAFxZpoHb6wTEpjJdfkCbMbBRF3dAd
         vsq5midR2VPfJyPzWNbHjsPAsNDSC4/gRorgFv1BFhrRR6cdxDkyXkl85JUvQ1AmSWnI
         yLFludG9VVKLaaePwJCj6ujFQUE2GnjiRMQLYgQhYyh+fyfAexLKwMIFuw7XEEgm+VWv
         8OUVpnzfFLM3T7GruvBUJYvDV/5itG+Ny0maCuiePm4/Ig2vKqYe1K7JwnE8OApGyXgW
         DNgcW8uTFjgnw1zw/XeoNYcBPzONZrQ3HrMf2KHNzOaE+NApDiYL6RPvRO+MTXGBSzNV
         6afA==
X-Gm-Message-State: AAQBX9f3KuAMphly++v55R4/G0hsFWxAsZ8Bni0Azu1tipLTGXMnhJfX
	wJ5wLf9jHzZKR0ax8YGtW3w=
X-Google-Smtp-Source: AKy350beiItDOkhHiEWsPQhED+hZbp9xWyCi7X3rVDzlAVAglOScC+nn76KoyGNSMhG9Vj0f6PhHGA==
X-Received: by 2002:a5d:66ca:0:b0:2d3:bde8:9ff with SMTP id k10-20020a5d66ca000000b002d3bde809ffmr20716784wrw.34.1680196970778;
        Thu, 30 Mar 2023 10:22:50 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d4d52000000b002d1e49cff35sm33258678wru.40.2023.03.30.10.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 10:22:49 -0700 (PDT)
Message-ID: <5e929f59-7565-25c1-51af-ccb346a06036@gmail.com>
Date: Thu, 30 Mar 2023 19:22:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 06/17] arm64: dts: mediatek: add pwrap support to
 mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-6-0003e80e0095@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230203-evk-board-support-v3-6-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_102252_845178_94841094 
X-CRM114-Status: GOOD (  16.05  )
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



On 29/03/2023 10:54, Alexandre Mergnat wrote:
> In order to use the PMIC, the pwrap support should be added
> to allow communication between the SoC and the PMIC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Applied, thanks.

> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index e018df6844f6..687011353f69 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -186,6 +186,18 @@ apmixedsys: syscon@1000c000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		pwrap: pwrap@1000d000 {
> +			compatible = "mediatek,mt8365-pwrap";
> +			reg = <0 0x1000d000 0 0x1000>;
> +			reg-names = "pwrap";
> +			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&infracfg CLK_IFR_PWRAP_SPI>,
> +				 <&infracfg CLK_IFR_PMIC_AP>,
> +				 <&infracfg CLK_IFR_PWRAP_SYS>,
> +				 <&infracfg CLK_IFR_PWRAP_TMR>;
> +			clock-names = "spi", "wrap", "sys", "tmr";
> +		};
> +
>   		keypad: keypad@10010000 {
>   			compatible = "mediatek,mt6779-keypad";
>   			reg = <0 0x10010000 0 0x1000>;
> 

