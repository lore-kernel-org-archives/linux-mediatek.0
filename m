Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16323C77B60
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaRoSIyeWAS0YcglF+MkDSwOdoe0p8vmqc9euKe3n3Y=; b=XYndbm7lfRf5/jyli4Fy87C1pB
	nuXOYiwOAcdjN6aCfvTNPXLZYLB7+SWaYtS6EKMVpcl1qLCJW/cD+DG5UkMIp3QA1EDBib3+3EsDV
	dWgleVbnvOQndEfBDXgUXIEav72mGvjnjV4OE+NdPt8trFW/P25G1k8DamNr+DOklOAjSH5jVtoOc
	3USWod5hqMklEMUcq3Gfg3clzas3ejpHO2FOJmPL/JF1RkTQiSDgOCcPP5vHx/HLTWKz8z3PBRMJ6
	Xn+RmkuoGdFhcCUTbFGtsdgo6NOHqMLJbgY/G/bOM6TbgDRV0sQp7xa2Oi3DboHJ5qJG3MW4dyoq2
	W3/F9GDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phvrP-004ayO-1l;
	Thu, 30 Mar 2023 17:14:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phvrL-004axM-1B;
	Thu, 30 Mar 2023 17:14:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so12242104wms.2;
        Thu, 30 Mar 2023 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680196483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RaRoSIyeWAS0YcglF+MkDSwOdoe0p8vmqc9euKe3n3Y=;
        b=DmATT2St4cxNQNUXVh6ikGXrHCSQf/Uf/9U+isdD8i+7RAZWEQsl80EmF5Q4aHjnHy
         zm967qSSxVqnwsXVjD1FzUoMnFDKhm0tuUv0BR+9vlhT/IC2AwLUkxKN3Jhv5BM7c9JL
         yUR3dQMDSoDnfk1q3dc7Cyb6FbmAsrwB9pUr7UHjDEsxA0FbrjqYlGyHWEmyeN/6vwyQ
         iNYj2pUTVISqsHsNfDKbIV7iHhh1XwAh94NlJjMfeWEro0m985BuKpV+vZN1lgUo7cfW
         lHwWI6VMJFfHXPNtgGjLXxg6SWS6sxe3ZKo56u7tLoPm7UgVQVeGF7NlPU0RPB5dC5Yv
         q0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680196483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaRoSIyeWAS0YcglF+MkDSwOdoe0p8vmqc9euKe3n3Y=;
        b=A7K6BN2xhs2igIeWxaUCJhlkeyJ3ZJNJ+tETAztkEQSZZ+rhql1AblrtZTmHTKY2nO
         NpBb4hddTCPGENlYkOP6/ifa8eDGZkthH7QoCzuGTl9y/3WDwanmZUE+MB06GMEAZ0PX
         3mS4zAI8xgBoYCa2y8+pdoqpCklZIDKb9TR/0IPkiU4DIvue0dMvfqRsjr/RLrvsu81q
         0GBLO4bEktfB7kk8Xy8Ddy+Vp30JWHOaZblVWDNro1tudIgmPzzkSWtMV/AfbyNhrBNI
         9nOl6SUzCV2Yo2sfbhLNjjTt33wdK7SwihmLGtPTlWpY/yYc/JDn6JB2ofwOutz6iKQU
         VZSQ==
X-Gm-Message-State: AO0yUKVN0QuPam3Z2y2VfICaGzacswAXUBUlAF3qVh6gSVjbHejDphcY
	mfhxIopIKqA5Np1fcVXziZ4=
X-Google-Smtp-Source: AK7set8caITXbfz/b/v8RPFfOoVv240ptkKm7Gl5BrTyyi/tNMGt7vUfhWHV/SMHnibfOS0cfpU6uA==
X-Received: by 2002:a05:600c:218d:b0:3ed:9576:34ce with SMTP id e13-20020a05600c218d00b003ed957634cemr18141275wme.9.1680196483237;
        Thu, 30 Mar 2023 10:14:43 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n18-20020a1c7212000000b003eafc47eb09sm6418137wmc.43.2023.03.30.10.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 10:14:42 -0700 (PDT)
Message-ID: <c654905d-a8c8-fafb-b8c5-2992b7cac0d8@gmail.com>
Date: Thu, 30 Mar 2023 19:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk
 board
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Qii Wang <qii.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh@kernel.org>
References: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
 <20221122-mt8365-i2c-support-v6-2-e1009c8afd53@baylibre.com>
 <945d8a82-80b3-8ae2-3b2a-7011621ad8d9@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <945d8a82-80b3-8ae2-3b2a-7011621ad8d9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_101447_420405_FD2F4368 
X-CRM114-Status: GOOD (  12.68  )
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



On 28/03/2023 12:04, AngeloGioacchino Del Regno wrote:
> Il 28/03/23 11:04, Alexandre Mergnat ha scritto:
>> Enable the I2C0 bus provides communication with:
>> - The integrated RT9466 Switching Battery Charger.
>> - The integrated MT6691 LP4X buck for VDDQ.
>> - The integrated MT6691 LP4X buck for VDD2.
>> - The pin header, to plug external I2C devices.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts 
>> b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>> index 4683704ea235..adc79ba14b33 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>> @@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
>>       };
>>   };
>> +&i2c0 {
>> +    clock-frequency = <100000>;
>> +    pinctrl-0 = <&i2c0_pins>;
>> +    pinctrl-names = "default";
>> +    status = "okay";
>> +};
>> +
>>   &pio {
>>       gpio_keys: gpio-keys-pins {
>>           pins {
>> @@ -96,6 +103,14 @@ pins {
>>           };
>>       };
>> +    i2c0_pins: i2c0-pins {
>> +        pins {
>> +            bias-pull-up;
> 
> I prefer seeing pinmux first, any other properties last....
> If Matthias can please fix that while applying...
> 

Done and queued the whole series.

Thanks!
Matthias

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> 

