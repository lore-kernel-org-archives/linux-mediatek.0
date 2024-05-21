Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B76C25B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZ1k0uetES8u8MlD8iJUWjUc76+6FpZkYnzMg83sWbo=; b=B1/Ino3sP5o0gpX48TsYekMrh5
	G7hnbKMnEvvL+K2PhUo0JsoHveTDTxmYD6Fr/+Ra/YtlYxenXWmOUr3KHBSnneB/fYMaAag/8IUa6
	aDKeUVV+oHS/FuHtJRwhYESYDagIZccvSzuXM6rrFzmNLtpXU/wSUYTPG/HMCz3yVENjfxeayF3g8
	UzHDbyQmF3exYBAhYaFKZIySrxhi8WseakbfXLB4QkanDgCj6jEKYzrkn2/JsCme3NHErFZvt4Hi8
	BCgVrYnfbAdJGQtXdQtdYwWzTm4V/wUneGD5i7U5EsV9DzXPhxqrSWIM1syYWJuU83WhIub1obPho
	+E3mbd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9QgM-00000000Cs1-3QPo;
	Tue, 21 May 2024 14:41:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9QgI-00000000Cpu-3cp2
	for linux-mediatek@lists.infradead.org;
	Tue, 21 May 2024 14:41:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-351d4909783so3270545f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 May 2024 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716302493; x=1716907293; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZ1k0uetES8u8MlD8iJUWjUc76+6FpZkYnzMg83sWbo=;
        b=JStZ/2d1+EFC1RV0GgMo9xHiWvyCqQ3K4AJh0cZ5lrmdpzqFC40OjtCw95d5yP8ero
         wTzuKlslT+Z8MuytfWzJzB9M/ZqnCrTifTQ2mpiXeod24NfFBGsFm/E1ua5QctZLsZU8
         /TIiPnlvCRCdt2Hb7t0xhlmRDTdmhL5faYkKIY1paSri7fsKTMTgyiROdGLpTWRW2sLy
         o34z559R3Drn09DrUWvnXaX3AL49zWl3EkgDldAPjZP/15fvuooUryLmyYH9kzTtcTMQ
         lYIbG9Irh2KFO86X993Paou7jfuQgzu9mFggPaWn+STxSinglldTP2VXWGsNFHgJy9MY
         GmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716302493; x=1716907293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZ1k0uetES8u8MlD8iJUWjUc76+6FpZkYnzMg83sWbo=;
        b=O3//EIzU1FBeS+/tBDL1cYX9IKkNYM5LgS3cDEHVngZxPzuX/Eukc548V6XnCVYjQg
         prpPgNyMWyfTmSUAvAYbawRI3r+PC8K9yHahlKUmR1gTScgGvqMBN0OQQVp/ZDUi3FsJ
         LcGBN8q7h6dgrq1+oY+5gWUywBqSkrV6ZgbsH4WZ+l1WLQm93WYrpgsZn2x5yfE3BdfK
         vJsRzLgCbkm8GW13gLfcgBz/bFnhH0EDIGchIsJFcS6driac1L6FElpDXe/Iz9GuMJG5
         qoO0tkHntMMhcao3vMAL6OcWx57iEk7tBUjjBVH9Xo0Y117Rb6+emcVPE4x31NaY1xc+
         ogvg==
X-Forwarded-Encrypted: i=1; AJvYcCXx/Dtv1jxFNOeh4PChhsH7a2MDDpqt3bx/TwF3VzI081KYl4VVnkGrtYkh3wBBYqjxR8FGOF4SlG127OcRBrfEjm1X1Z3hJAT+wyFsz0lIGO/u
X-Gm-Message-State: AOJu0YzLxv8ZeuFHk055mcm2CfPXdRXmwktEX7rfmfUYySF2ojMIexZC
	CGuMvv22NFOxqShtQ39PWo2oRQi4a915h2f24KNnYdAQS1Bwp+mczSBbVLbz7XM=
X-Google-Smtp-Source: AGHT+IHj1hRyPZRmpYHWeU3LYRrDP7CJ224DzJ6GRA/c94bv1YnN1lYSiHKxZR3Gf4iM4ruXYyQNOA==
X-Received: by 2002:a05:600c:1794:b0:41e:454b:2f7 with SMTP id 5b1f17b1804b1-41feab40be5mr262645805e9.23.1716302492758;
        Tue, 21 May 2024 07:41:32 -0700 (PDT)
Received: from [10.2.5.115] (abordeaux-651-1-78-161.w90-5.abo.wanadoo.fr. [90.5.97.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41ff5e3dcfbsm428288055e9.22.2024.05.21.07.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 07:41:32 -0700 (PDT)
Message-ID: <8078d106-0173-4f04-aab7-4b2726b0bb3a@baylibre.com>
Date: Tue, 21 May 2024 16:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: mediatek: mt8188: add default thermal
 zones
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240521-mtk-thermal-mt818x-dtsi-v4-0-b91ee678411c@baylibre.com>
 <20240521-mtk-thermal-mt818x-dtsi-v4-4-b91ee678411c@baylibre.com>
 <ff12e104-da8b-4800-bfbe-a006ffe1b840@collabora.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <ff12e104-da8b-4800-bfbe-a006ffe1b840@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_074134_938072_CCCDB21E 
X-CRM114-Status: GOOD (  18.18  )
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

On 5/21/24 16:19, AngeloGioacchino Del Regno wrote:
> Il 21/05/24 16:05, Julien Panis ha scritto:
>> From: Nicolas Pitre <npitre@baylibre.com>
>>
>> Inspired by the vendor kernel but adapted to the upstream thermal
>> driver version.
>>
>> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 432 +++++++++++++++++++++++++++++++
>>   1 file changed, 432 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
>> index a9f1b9db54a6..2b0f3e03acc1 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
>> @@ -12,6 +12,8 @@
>>   #include <dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h>
>>   #include <dt-bindings/power/mediatek,mt8188-power.h>
>>   #include <dt-bindings/reset/mt8188-resets.h>
>> +#include <dt-bindings/thermal/thermal.h>
>> +#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
>>     / {
>>       compatible = "mediatek,mt8188";
>
> ..snip..
>
>> +
>> +        gpu1-thermal {
>
> You forgot to implement my feedback to Nicolas - this must be gpu-thermal

Sorry, I did not forget. I just did not understand correctly.
Even after looking at mt8195, I thought that only the '_'
in 'cpu_big0-thermal' and 'cpu_big1-thermal' were wrong
in v3. Thanks for making it clear.

>
>> +            polling-delay = <1000>;
>> +            polling-delay-passive = <250>;
>> +            thermal-sensors = <&lvts_ap MT8188_AP_GPU1>;
>> +
>> +            trips {
>> +                gpu1_alert0: trip-alert0 {
>> +                    temperature = <85000>;
>> +                    hysteresis = <2000>;
>> +                    type = "passive";
>> +                };
>> +
>> +                gpu1_alert1: trip-alert1 {
>> +                    temperature = <95000>;
>> +                    hysteresis = <2000>;
>> +                    type = "hot";
>> +                };
>> +
>> +                gpu1_crit: trip-crit {
>> +                    temperature = <100000>;
>> +                    hysteresis = <0>;
>> +                    type = "critical";
>> +                };
>> +            };
>> +        };
>> +
>> +        gpu2-thermal {
>
> ...and for consistency with the other SoCs, this must be gpu1-thermal.

Now I think I get it, thank you.

>
>> +            polling-delay = <1000>;
>> +            polling-delay-passive = <250>;
>> +            thermal-sensors = <&lvts_ap MT8188_AP_GPU2>;
>> +
>> +            trips {
>> +                gpu2_alert0: trip-alert0 {
>> +                    temperature = <85000>;
>> +                    hysteresis = <2000>;
>> +                    type = "passive";
>> +                };
>> +
>> +                gpu2_alert1: trip-alert1 {
>> +                    temperature = <95000>;
>> +                    hysteresis = <2000>;
>> +                    type = "hot";
>> +                };
>> +
>> +                gpu2_crit: trip-crit {
>> +                    temperature = <100000>;
>> +                    hysteresis = <0>;
>> +                    type = "critical";
>> +                };
>> +            };
>> +        };
>> +
>> +        soc1-thermal {
>
> Any idea of what can "soc1" ever be? What measurement point is that?
>
> VPU? IMG? INFRA?
>
> soc1, soc2, soc3 make little sense.

No idea to be honest. I'll try to find out that information
and will change that in v5.

Julien

