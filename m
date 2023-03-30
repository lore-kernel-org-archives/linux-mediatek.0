Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEA2C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 17:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Y2DqD4b0TEjJPvYx6jYpEw4YYcOZf2U/uI5AHnyKKE=; b=sYbFp/TQkAjkovW7NAlr9N4HVe
	+o8ziIi5pDk7SaQPV19/PM9MKHOMzHFhC7dSLVPlX5EcDspXS98bqgcCwwAEmuIJXr9qeqtC3eDdg
	f3MhB6hJRATfgyX8CJxzhq0Y7afAgfdIxpb6T/nXROT3070I+ARNuVN0rDX7GCIVEo3MU1pxLNw8k
	EAFASCFkPuUmlsr434qTHn4eV2DYYd9nSxSINK+2dy5yleLj2JCjjF0mAk1esbMjt0+wjdpOkaF/B
	2bq5uDWa3csWe1ConeLE9zI5K3Iqq6W7Rd/3bD/ak5kepo8Ony0dp6hx0Aw4NVXwMHQKx5Gjn9rm8
	RhZutCOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phw5G-004dfh-1b;
	Thu, 30 Mar 2023 17:29:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phw54-004dd1-0H;
	Thu, 30 Mar 2023 17:28:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so13855412wmq.4;
        Thu, 30 Mar 2023 10:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680197336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Y2DqD4b0TEjJPvYx6jYpEw4YYcOZf2U/uI5AHnyKKE=;
        b=WFMeZNzYNRmA4eopOnR7jiHne/7tIemjxw8rqSTQ8QSkYJm5WXH6WM/c8bQ5cx/8/q
         TPvVjODX1ArBalsWhxli6d0h32H5lIa5OcwgRQri6KepMhN8aRC7jYlFFQA4YlNVcJtr
         BbCKcij4XvZm96F1e3spFuhovODz9yIoSRH5dL9ckR+9wi4Qln2yppZp4ccggPnOmdLA
         Rv7C7qjTwQmmJu9TO4NJkzI00doWzskFpMFu/d3mQZqTRk1nuIFS/7AskxbOa1SXhZrK
         bVLTzKaTrM1xqYip2iVtpXxXpcOD3Ak6LvLLLC0+9McOowfX/cVnwFCh5W16YhyDVIP2
         gDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680197336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Y2DqD4b0TEjJPvYx6jYpEw4YYcOZf2U/uI5AHnyKKE=;
        b=d4AudedfT7sNTpiUKdHULZBsRQ6xgaH9ros82X9u9n4q/+lYwqbcrI/f1ZY0MJ+Fr+
         Dv0EQHnnEzFGuAfD2nTdPn2Ejf9iw8Popr5t41PtpyCoPZ7XW9Xtnk6L45WoqJ9Ih5Ia
         mVc0hbjZEZLk0ugRNJZ+mG88a1gmHMY6zF3/o6IC6Fslq5IKrhPjXj5QbduK6NWNrs2Z
         5Qn3FBDHu64nV93lOSzqEaDiiYjJggyseJ8R+7Sx0jPjwSR0QJx9yjkHhsrZOVZ2Vc5I
         ldSa4B8Vqlb5CNQ72pal+WiavMeQf+Jkkjwi4+Lo8xWEZr0ZmKXINX9n3KTr12TDb/Tt
         Z+wA==
X-Gm-Message-State: AO0yUKXyLDpHwromfUHd/EfWmlOXm/pC3dvWJdkAp5CpviEyphFdjU1K
	uEGkWEXB4i7YtHLUSndf/FI=
X-Google-Smtp-Source: AK7set9MIenmW0wOxrwzuKWQ9Susz0ahiNwcPlAjmAJVYRoVF2Kv7qkJghXMUIEjEKEN6BgtEX0Mfg==
X-Received: by 2002:a05:600c:d5:b0:3ed:bc83:3745 with SMTP id u21-20020a05600c00d500b003edbc833745mr17495399wmm.25.1680197336468;
        Thu, 30 Mar 2023 10:28:56 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y5-20020a1c4b05000000b003e91b9a92c9sm6507980wma.24.2023.03.30.10.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 10:28:55 -0700 (PDT)
Message-ID: <c575ac46-28bf-254f-a3c1-e30885ba7933@gmail.com>
Date: Thu, 30 Mar 2023 19:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 08/17] arm64: dts: mediatek: add mmc support for mt8365
 SoC
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 <20230203-evk-board-support-v3-8-0003e80e0095@baylibre.com>
 <c785d80f-e443-cae4-1e17-b79eb2dc385c@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <c785d80f-e443-cae4-1e17-b79eb2dc385c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_102858_149632_D3951D70 
X-CRM114-Status: GOOD (  15.92  )
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



On 29/03/2023 15:21, AngeloGioacchino Del Regno wrote:
> Il 29/03/23 10:54, Alexandre Mergnat ha scritto:
>> There are three ports of MSDC (MMC and SD Controller), which are:
>> - MSDC0: EMMC5.1
>> - MSDC1: SD3.0/SDIO3.0
>> - MSDC2: SDIO3.0+
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 39 ++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
>> index 687011353f69..a67eeca28da5 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
>> @@ -399,6 +399,45 @@ usb_host: usb@11200000 {
>>               };
>>           };
>> +        mmc0: mmc@11230000 {
>> +            compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
>> +            reg = <0 0x11230000 0 0x1000>,
>> +                  <0 0x11cd0000 0 0x1000>;
>> +            interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_LOW>;
>> +            clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
>> +                 <&infracfg CLK_IFR_MSDC0_HCLK>,
>> +                 <&infracfg CLK_IFR_MSDC0_SRC>;
>> +            clock-names = "source", "hclk", "source_cg";
>> +            status = "disabled";
>> +        };
>> +
>> +        mmc1: mmc@11240000 {
>> +            compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
>> +            reg = <0 0x11240000 0 0x1000>,
>> +                  <0 0x11c90000 0 0x1000>;
>> +            interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_LOW>;
>> +            clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
>> +                 <&infracfg CLK_IFR_MSDC1_HCLK>,
>> +                 <&infracfg CLK_IFR_MSDC1_SRC>;
>> +            clock-names = "source", "hclk", "source_cg";
>> +            status = "disabled";
>> +        };
>> +
>> +        mmc2: mmc@11250000 {
>> +            compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
>> +            reg = <0 0x11250000 0 0x1000>,
>> +                  <0 0x11c60000 0 0x1000>;
>> +            interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_LOW>;
>> +            clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>,
>> +                 <&infracfg CLK_IFR_MSDC2_HCLK>,
>> +                 <&infracfg CLK_IFR_MSDC2_SRC>,
>> +                 <&infracfg CLK_IFR_MSDC2_BK>,
>> +                 <&infracfg CLK_IFR_AP_MSDC0>;
>> +            clock-names = "source", "hclk", "source_cg",
>> +                      "bus_clk", "sys_cg";
> 
> clock-names for this do fit in one 90 columns line.
> 
> After compressing it,
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

I applied the patch and dropped you Reviewed-by tag. I think it depends on the 
taste of everybody how you prefer to structure this. I've also seen that on 
boards you care (mt8183 in that case) there a clocks that don't adhere to the 
criteria you mention here ;-)

Anyway many thanks for reviewing this and all the great work in general. 
Honestly I feel I didn't made justice by dropping your tag, but as you stated so 
explicitly... :)

Regards,
Matthias

