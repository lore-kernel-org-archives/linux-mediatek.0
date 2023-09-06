Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933F7EB8FA5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tKSKwBQVJKDaycrv4wlK1AbEjFOCJ/VVVw+I8g0nGI=; b=i59Cg1bZLvIHr2Y73beMTCxTh0
	kLut7TCWNcdpa7lXwPXUYJIWy2Y6owxCMxyu0D7u6jXB9iRWQ0DhjwOgYPIrcukHNXkEgLZVvcW1W
	doGm6njazOHq2yOjmt1rFmQlPlv/87btnR+2FKGKh7nvEpuM7SActeWaAzEJqYpzd2669M7JG1gjs
	tIQZeNRWaGd8Ycn+PhD11VlCCYGlVh5pOvVILl2dJx8UdkxhTU5EkgsH8bvvIfpxQNCa7CWI4STBT
	exBJOcKVqAiQaI+BXSFzwm/pziEwrVuyYqCbubVPHZoBpeBPnEmCwRMoEufxyYvR3So5D/yzVKy9H
	R77ghqlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpQ0-0084Nj-0e;
	Wed, 06 Sep 2023 10:05:52 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpPw-0084Lk-0X
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Sep 2023 10:05:49 +0000
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9a6190af24aso530474066b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Sep 2023 03:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693994745; x=1694599545; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tKSKwBQVJKDaycrv4wlK1AbEjFOCJ/VVVw+I8g0nGI=;
        b=UP41ZyRq8vLobsLwYD348WLGaM6O3yYE6bJZz5yecdw2tOJ9qDEGEW6Mf9Ja9MDC/T
         q6rd2PYfzquEWB4+AnoWueqLh52lDXbTFHT5T6ZN40KdjnKVyIB1vPL+6eJonswjOks3
         HSRX65Rz8Ec+KiKuhShbzytO7fYpzp+OTQnZZD14WVA8trSvWmszjTvsC5IIPR6Jl2YS
         Bfda0ps7T1xd9mtgODsI3+dU618E6JVC/JynAMA/v8Fja3lwo9r1vTUjS0LUPh9yvaKU
         oKq4eucC5uIHthN+6IUIWoHJ5tFi/NXCf3+E3VGjUuiQAW8aw09ntfIH+UkB1jcURp12
         UpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693994745; x=1694599545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7tKSKwBQVJKDaycrv4wlK1AbEjFOCJ/VVVw+I8g0nGI=;
        b=li9x/3CGYeE6rVPUnsqmdBDpw8uaQ5qhrv4ZYEPACNZyJbHxoQU3SJWq5Yl3NP1Erl
         QlclTdkQPn38xjqqdl8V/RZ7Aba3EVqFukjDHmIZbfKZOAW/IB5tXU3FZKSj78SbP7td
         EoSnEtgg/VyO4eOXnG89+Y/HrahfVmmZ4bl8YnGLU+F4gIalyB41rHykgF1zBQgfFISX
         W+Jpb07j9WYWbWmGdT3vvr5eEePQkTlLEEZVUh1meMpeRtBMpnTP61J0cQ5u46StJM+f
         k9ZeKEWnSADHTU5Im/llJoGh8UiRAc6de7onrRP9pY0DxIyBahjr7zupELLYfodG0sCh
         qSrA==
X-Gm-Message-State: AOJu0YxXdFpSBdg+YXVPAva+L7BeeaoH0pBqPi822tr3iH0t8HQ/WPlK
	z8n1Nv/JflZkjV4tTssFX9lAzA==
X-Google-Smtp-Source: AGHT+IEpRMvEFs2ZXroiFAbWtiUkVoWLxloTk4Lnh3qMYc6HU6F1RXvTuILRkfk3ScVp4BKkj9bzmg==
X-Received: by 2002:a17:906:9e:b0:9a1:eb67:c0ce with SMTP id 30-20020a170906009e00b009a1eb67c0cemr1953939ejc.50.1693994744740;
        Wed, 06 Sep 2023 03:05:44 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id o21-20020a1709062e9500b009a13fdc139fsm8824751eji.183.2023.09.06.03.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 03:05:44 -0700 (PDT)
Message-ID: <5ee0ab7f-0250-accb-83bb-0704ea9074e1@linaro.org>
Date: Wed, 6 Sep 2023 12:05:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
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
 Macpaul Lin <macpaul@gmail.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <20230906092527.18281-1-macpaul.lin@mediatek.com>
 <fbad941f-232b-9f56-5de3-98a16a8c4d89@linaro.org>
 <c3ddf00c-235a-2d23-db60-c998a67a3fcd@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c3ddf00c-235a-2d23-db60-c998a67a3fcd@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_030548_280376_06117783 
X-CRM114-Status: GOOD (  17.47  )
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

On 06/09/2023 11:53, Macpaul Lin wrote:
> 
> 
> On 9/6/23 17:32, Krzysztof Kozlowski wrote:
>> 	
>>
>> External email : Please do not click links or open attachments until you 
>> have verified the sender or the content.
>>
>> On 06/09/2023 11:25, Macpaul Lin wrote:
>>> 1. Add compatible for MT8395.
>>> 2. Add bindings for the MediaTek mt8395-evk board, also known
>>> as the "Genio 1200-EVK".
>>>
>>> The MT8195 and MT8395 belong to the same SoC family,
>>> with only minor differences in their physical characteristics.
>>> They utilize unique efuse values for differentiation.
>>>
>>> The booting process and configurations are managed by boot
>>> loaders, firmware, and TF-A. Consequently, the part numbers
>>> and procurement channels vary.
>>>
>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>
>> Do not attach (thread) your patchsets to some other threads (unrelated
>> or older versions). This buries them deep in the mailbox and might
>> interfere with applying entire sets.
>>
>>>
>>> Changes for v2:
>>>  - add more detail description for mt8395.
>>>  - add bindings for mt8395, and mt8395-evk.
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> index ae12b1cab9fb..d7a20df640d7 100644
>>> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> @@ -248,6 +248,11 @@ properties:
>>>            - enum:
>>>                - mediatek,mt8365-evk
>>>            - const: mediatek,mt8365
>>> +      - description: MediaTek Genio 1200 Boards (Genio 1200 EVK)
>>> +        items:
>>> +          - enum:
>>> +              - mediatek,mt8395-evk
>>> +          - const: mediatek,mt8395
>>
>>
>> I don't understand. You said last time this is fully compatible with
>> mt8195, so why it's not here?
>>
> 
> Yes, mt8395 is fully compatible with mt8195.
> 
> But after reading Angelo's comment, we thought it is necessary to create 
> a new compatible to avoid confusion for users.
> https://lore.kernel.org/lkml/bf8394c6-5460-8696-f46b-0c39927aaf84@collabora.com/
> 

New compatible is a requirement, you got clear comments from me on this
as well. However we did not ask to remove a compatible of compatible
devices. You also need it. Otherwise how your compatibility is going to
work?

Best regards,
Krzysztof


