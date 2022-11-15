Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866E5C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 10:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51eyqY8UTV5ywIgQsiHkYmYRRcSexiaefC0ZpHFo2a8=; b=RhStrOqzgPrL9YgvdBpKNOJa+X
	vqV7dkwPseshGPVZQHPB3vZ1z4EFdozakxmVL1SLDdcRQ4EhrjruvWuJIakOMBWVCWjjut49tIppX
	esiJy3rqTEY/szQb1hiANcSuYbJsmZS0eM5CpJhsaxyRR1RH/r93BX8VhCZWEj/jbWZK8GUscg+SA
	Y6m/8s4Z9ZRy2Zu4AgXKPSf1k//G2tp5aKO14k6BDjCuwtZcUeJ27KCLhEfTpOkImMAoso86kt+mf
	APXrOiJ5ScpaV67OcN6k6rel7jhN6vLMWF0/50tihAeTwrbG1oFPhjPOsg0M3cwIY8VObcEWQRXKN
	UWqk1YdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1outV2-00A8tJ-0s; Tue, 15 Nov 2022 10:49:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1outHE-009zbO-Fu
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 10:34:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id i186-20020a1c3bc3000000b003cfe29a5733so2920932wma.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 02:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51eyqY8UTV5ywIgQsiHkYmYRRcSexiaefC0ZpHFo2a8=;
        b=XQhNYO7eEMH/ML6Ek2vWNsT1W4wWTdKTdS4A7rD21XxH+U4UZWYtW4zGE1rAekXTsw
         jArznlvIdrcFLoYBqFSrc3k9jBKKmtpNPd5VJEerOotNauut47I59zs4LUO9Nofqarru
         wIbFoP49X4eTJXGdpiwGbzfISJ9J7ng49wYdO7S+wXybs1xV/MA4HkUAM68Hb5Gp1fa5
         UpMXIwaCuDUi5ZaMFSHDt9uxnEGFv2udkfScPawgxYuEqM0Ch3+qDBZt8Hxzr5n6Xsar
         1zUbdldqRdKY/QyxoxCUmSlPQSQnIbn/M2lWiuobH/nmms3sAcKDQn5aO0lG0prGddnp
         faLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=51eyqY8UTV5ywIgQsiHkYmYRRcSexiaefC0ZpHFo2a8=;
        b=6KfB01GcyuxRNTZuX4t0J6rjpCG94abwLnaVH3kbHTnc3OUGMY1EIZbti8fUE4GtKM
         Coz5bfUjGfXc6pmurz3hQEsEmfCVLwCeO5OH+lZfW/Szec47Mzw4zWn98BR5FSxK7bIX
         roJP9tR7A3+iEBP14SOiNTgrwDZ5CrBRLzGH0wbiOXpI7nXQW3qDSiBu6Aqteus0Mssj
         TSU1+sE2fC7eWpzk8M1yETWhrmKK5v6bV8CPoveURPTGG+pUXfrP/7rCSQuyCWMkyZ/J
         EdN1oqfFL+Wl84sGD1Syj2ylELGinPrv5ot/+ScXTY3XDeBcITfpk6aMVjUfgM4GLAOg
         7m5Q==
X-Gm-Message-State: ANoB5plb8HG8kSUZL0RVjeql2Cm67tTUipDBAGPc4YW/fUSZHL2WaTdy
	Pjhc+WlDF6gP1cBQg001mpDnPA==
X-Google-Smtp-Source: AA0mqf5wOpmiqEs0k+MjZLqrmjy48gJaqw7MB07dSClzfm9gxF2kTyHEIeCaGZHkqdxGGrgmZhgQDQ==
X-Received: by 2002:a1c:720f:0:b0:3cf:6f77:375 with SMTP id n15-20020a1c720f000000b003cf6f770375mr92914wmc.102.1668508483147;
        Tue, 15 Nov 2022 02:34:43 -0800 (PST)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003c6b9749505sm23742112wmq.30.2022.11.15.02.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 02:34:42 -0800 (PST)
Message-ID: <ba0901a0-56c5-4e60-49b3-356899921934@baylibre.com>
Date: Tue, 15 Nov 2022 11:34:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: krzysztof.kozlowski@linaro.org
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 amergnat@baylibre.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chen.zhong@mediatek.com, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, fabien.parent@linaro.org, fparent@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
 matthias.bgg@gmail.com, mkorpershoek@baylibre.com, pavel@ucw.cz,
 robh@kernel.org, sean.wang@mediatek.com
References: <09495553-e563-e12b-056e-bed95531ab6b@linaro.org>
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <09495553-e563-e12b-056e-bed95531ab6b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_023448_649553_34353A3F 
X-CRM114-Status: GOOD (  12.49  )
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

Hi, thanks for your help

>>>> I checked and it doesn't support it but this needs to be fixed.  >>>> >>>>> What about rest of rtc.yaml schema? >>>>> >>>> >>>> 
wakeup-source would make sense but the driver doesn't support it yet. 
 >>> >>> The question is about hardware - does hardware support waking 
up the >>> system via interrupt? This is usually a domain of PMICs which 
still are >>> powered on when system sleeps. >>> >> >> I'd say that it 
is possible that a PMIC is able to wake up the system >> with or without 
having an interrupt wired to the SoC so wakeup-source >> makes sense. We 
don't need it if it is interrupt only. >
>Then I propose to reference the rtc.yaml.

I think I understand my error.
Actually, the RTC (HW) support the "start-year" feature, then I suggest
to fix the binding like that:

allOf:
   - $ref: "rtc.yaml#"

properties:
   compatible:
     enum:
       - mediatek,mt6323-rtc
       - mediatek,mt6357-rtc
       - mediatek,mt6358-rtc
       - mediatek,mt6366-rtc
       - mediatek,mt6397-rtc

   start-year: true

additionalProperties: false

required:
   - compatible

examples:
   - |
     pmic {
         rtc {
             compatible = "mediatek,mt6397-rtc";
         };
     };


