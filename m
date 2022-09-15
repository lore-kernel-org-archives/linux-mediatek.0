Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D749CECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 16:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OW/Ex82NxAoUPhZ7WksjsJWpT0Wxc4UMr3Q8n9sA3l0=; b=Ggr7L+UhBsWH/OgiF+zZRCFhs9
	vaC5bUXJav5u2abv9piJEFMQC0N0SrpLnPtWutvP3CqdkUVs106URqd/MGwzCzS7rDMqJbbtZTRJq
	WlsP/3Lk9cqS0lbo8lmz7ZqSpfD6FIRlHknq892wK/FZuotVygEkrVfukGXO0umQxgs41ed3gmhjL
	RBB4oiHrUoaaiTznjQjh3F27BGL9PCWiaX1cwnOP8rs/DOJz62N6ur8U14JuGBryqxzSfXvqAA39w
	dFYDun7Gde4GB17YZCRvSZJ0y3npEs5U9MOzWgMtYWvZyN5BdN801ueC/9cNORhZyrNnDt8/hI4iw
	eTKGBV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrn9-00DaDE-EM; Thu, 15 Sep 2022 16:32:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrmy-00Da9x-KC; Thu, 15 Sep 2022 16:32:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id r186-20020a1c44c3000000b003b494ffc00bso107038wma.0;
        Thu, 15 Sep 2022 09:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OW/Ex82NxAoUPhZ7WksjsJWpT0Wxc4UMr3Q8n9sA3l0=;
        b=oa1iAq2oQGEn8eKul2dVLQzOitSaXu1V04U72I5Tb0OJxKctS0GCAc9ZSxB0ODpizN
         dJ/F5KUO+H+d6BJkjcgX4GbYv5T2yLX6nJjt7FZ6xuQNXQUNp615t60zU28VyfC20HYa
         EyRu7HQpsUN9ud7rY9SDSkPkrXYxVs1LFi1qkOyBpO05fcwiS76omNG8QrNo0OayXhWO
         cVNqgX4cl5DNheQtok6eO86lW3GRYsEm4iN9IZD1saczShJXfDcjsWa0TWoZS6F8uwbP
         uUzh2eNswEfdIkHix87bYZ2fxQerSaaSUB7vkmwvx0813r39HwLdzpBcLYm0RR4ouMhe
         z0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OW/Ex82NxAoUPhZ7WksjsJWpT0Wxc4UMr3Q8n9sA3l0=;
        b=ed9NnUOQwknACbFB25oqdRjDNDSwoAkThN72RJTBZnkNa4mqeIMNCk69R14pos4FGw
         RRTFN6DrL32ZQucqAR8q+HJoIvRCKLyRN+xRA7wMuCyshyKdnIjRj12CICS7Z/LMuFt3
         6PJQYpo9HAi1acSb7EBQ4PU7pcGS/bcQVF5IYw1cP05KqQ6rSzzvh+P35ZLNTgjJ043s
         gqG1d2iV0SHmd+Sx4+JZIWCl9Izax6Jnlb7QeX+XJYnXkaOgcYm2GtedkekYMROSK9O2
         BJv4whH8RgE51ue6Ax3+YkyZzgNEw5nuIKdvEbi+44WYiksGv5Vk7B5i8bcnVLEQAeqA
         JnAQ==
X-Gm-Message-State: ACrzQf1Oo3WLZ12K/8kO89aiTxf7dP+NVS/M91Ps0tzcKCuo0rdIMitc
	+cyUISamp6/gukjsRZvCf0A=
X-Google-Smtp-Source: AMsMyM5vSjMhWO1RDq7b4M3mpsFrRuHxRzzw7FrIG+23DFOAsZqCTFeWng1l9RQ7qYEL5fpA6SuztA==
X-Received: by 2002:a05:600c:6029:b0:3b4:9fcc:cbb3 with SMTP id az41-20020a05600c602900b003b49fcccbb3mr451881wmb.169.1663259546781;
        Thu, 15 Sep 2022 09:32:26 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id fc8-20020a05600c524800b003b48dac344esm3975873wmb.43.2022.09.15.09.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 09:32:25 -0700 (PDT)
Message-ID: <990c00a4-f20d-1e7e-e4d3-6731947c1456@gmail.com>
Date: Thu, 15 Sep 2022 18:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt6795: Add CPUX system timer node
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220729093536.27623-1-angelogioacchino.delregno@collabora.com>
 <3a91e743-2b8f-51b6-9ac1-adc3e7ec8cc4@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <3a91e743-2b8f-51b6-9ac1-adc3e7ec8cc4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_093232_681437_17719E31 
X-CRM114-Status: GOOD (  14.75  )
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



On 14/09/2022 13:01, AngeloGioacchino Del Regno wrote:
> Il 29/07/22 11:35, AngeloGioacchino Del Regno ha scritto:
>> Add a node for mt6795-systimer: this is necessary to start the
>> System Timer(s) for all cores, finally making CNTVCT_EL0 usable.
>>
>> Signed-off-by: AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno@collabora.com>
> 
> Hello Matthias,
> 
> gentle ping for this one - this has no floating dependencies and it's
> verified to work as expected.
> 

Applied, thanks!

> Cheers,
> Angelo
> 
>> ---
>>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>> index d4842b4a4eb7..46f0e54be766 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>> @@ -230,6 +230,14 @@ sysirq: intpol-controller@10200620 {
>>               reg = <0 0x10200620 0 0x20>;
>>           };
>> +        systimer: timer@10200670 {
>> +            compatible = "mediatek,mt6795-systimer";
>> +            reg = <0 0x10200670 0 0x10>;
>> +            interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&system_clk>;
>> +            clock-names = "clk13m";
>> +        };
>> +
>>           gic: interrupt-controller@10221000 {
>>               compatible = "arm,gic-400";
>>               #interrupt-cells = <3>;
> 
> 

