Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F06BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 13:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J37bnxv35AKNMkkxULLkWayVHEaMjv0zIAo9khsK/xs=; b=OZjVdsk4/7i3bEucuLhMNS+/Tw
	WfSi+DZJ7DD/0lG2DQTTt0ZkkT1YCtcei4PpRK9+z6xoDMYiXXlOYj2W2/NWZpge8WORVprMeiS/k
	+4SI3pPiQvYarKuw/KU3P7ozgYwmV+6ipju29a+J/bJcn+UzbktyirIMKi4LkPbDRduCw3eKfGiEb
	I2rLlwEimcjYC7ZrZ6ElL0JpJ6wAGjOKafflo7XbXz4Z+Rul6fDqEx+zpQiUrme/O6I+533yZclCL
	eqmA8iZDq9XROo/3+Q5dgQrSZS8vhbkJKYKw9pdP0AwhWIRTLkOYXzZZS5i/LaE5dsMZzfftctdfI
	dT2dzWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95Hk-00ALV4-LL; Wed, 06 Jul 2022 13:41:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95Hi-00ALPN-29; Wed, 06 Jul 2022 13:41:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l40-20020a05600c1d2800b003a18adff308so9355294wms.5;
        Wed, 06 Jul 2022 06:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=J37bnxv35AKNMkkxULLkWayVHEaMjv0zIAo9khsK/xs=;
        b=Jlle0rhzTTAnWZ/MNh25r/iMQIdPg+Nu4CyuUQnEB3+XRfZWe+9CZwdtvObPWmIv6g
         d913Ju/S7mnMovkMbGewR/EJ+C5hKF2jryill+Reaw1pTWmgv8OAkwAghmrTDutguk4Q
         SDRosAPaNN+hGVT71HuA/B9Esxx0cYVXiQjFvXDsdTGo7ASRZIONNC4+54ApG9tqpPi8
         dAp/BlYJDauy6Cy12yvpidH/bodG8wQQhyC1J0YUuQOVTwNttLSB8AvN8+SX88WjcVbl
         b+DKOSfFHI1jNA6LLUabbhounPawG5AlMa6HNpwSyCeqBqtN+6gRteWmi1fx+JReOXzf
         dCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J37bnxv35AKNMkkxULLkWayVHEaMjv0zIAo9khsK/xs=;
        b=UA+ok76+l1Rbbm3PS6jcV7glIYkF7s3ZMTrMyS8lrPxH+UlHFhR2EJqgYpGlsYMoVZ
         VhsPW4HNP3YHwFqswGBM6ggERlzZWHMfjzuGuUKfe4y0U37jjGUTcixlCEW20uj8s+2N
         2G8pUExw+2OjAMUqHw7SY0NrkhB5SMqVyMwldf8D1ioN9Y6nkOQjN24hdbVut9Rny0ts
         3lybjWNrKjXqFrBq8XkfuvAAQAi/A2xWPP9UVStJmUkZuXz74/f4N6dO9P6Hkrxz9x/r
         KKjaXmcRiAKSzuy340EbyOsbjOCVY9DO7BuP0d1366+um8WFCRYIcQQJywRbGLgZ2UE2
         ZJhg==
X-Gm-Message-State: AJIora8RjNQtbmf4TOpncpT9XfJ/6G8vGnyf5zAwE59jXzNfIwTPUVyY
	M04BrXcPYmMcsUbqQ1UdHto=
X-Google-Smtp-Source: AGRyM1uzrUL3jgHl7v16xkNIYUGr+iA0aegNeob2FrKF9QFhYl/5MRV7Rool8Fm50IsaKRG6foS/1A==
X-Received: by 2002:a05:600c:274b:b0:3a0:47e8:ca85 with SMTP id 11-20020a05600c274b00b003a047e8ca85mr45800324wmw.156.1657114898287;
        Wed, 06 Jul 2022 06:41:38 -0700 (PDT)
Received: from [192.168.0.14] ([37.223.147.254])
        by smtp.gmail.com with ESMTPSA id h16-20020a5d4310000000b0021d7b41255esm2225662wrq.98.2022.07.06.06.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 06:41:37 -0700 (PDT)
Message-ID: <17203a8a-407e-30cf-79de-352716c3ebce@gmail.com>
Date: Wed, 6 Jul 2022 15:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 08/16] arm64: dts: mt8195: Add power domains controller
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-9-tinghan.shen@mediatek.com>
 <3b65405d-167f-a0c7-d15e-5da6f08d99b3@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <3b65405d-167f-a0c7-d15e-5da6f08d99b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_064142_156367_195652C1 
X-CRM114-Status: GOOD (  15.06  )
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



On 04/07/2022 14:38, Krzysztof Kozlowski wrote:
> On 04/07/2022 12:00, Tinghan Shen wrote:
>> Add power domains controller node for mt8195.
>>
>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 327 +++++++++++++++++++++++
>>   1 file changed, 327 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> index 8d59a7da3271..d52e140d9271 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> @@ -10,6 +10,7 @@
>>   #include <dt-bindings/interrupt-controller/irq.h>
>>   #include <dt-bindings/phy/phy.h>
>>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>> +#include <dt-bindings/power/mt8195-power.h>
>>   
>>   / {
>>   	compatible = "mediatek,mt8195";
>> @@ -338,6 +339,332 @@
>>   			#interrupt-cells = <2>;
>>   		};
>>   
>> +		scpsys: syscon@10006000 {
>> +			compatible = "syscon", "simple-mfd";
> 
> These compatibles cannot be alone.
> 

You mean we would need something like "mediatek,scpsys" as dummy compatible 
that's not bound to any driver?

>> +			reg = <0 0x10006000 0 0x1000>;
>> +			#power-domain-cells = <1>;
> 
> If it is simple MFD, then probably it is not a power domain provider.
> Decide.

The SCPSYS IP block of MediaTek SoCs group several functionality, one is the 
power domain controller. Others are not yet implemented, but defining the scpsys 
as a MFD will give us the possibility to do so in the future.

Regards,
Matthias

> 
> Best regards,
> Krzysztof

