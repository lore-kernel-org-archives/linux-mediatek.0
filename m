Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD28C83F2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 10:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/U9siKDyazHDG6r3zqTARi8NY0BAa80rOt591lmpFyA=; b=WuC9AVuATl2GzuQc4YifAVf5Nh
	OV57KYkTmHIvouzdKo/1GAJ8E9eyl8lzQsGxJxV+ii+QBMkKXFUSYvUKU5agBTOVXSzA0StT+vjuC
	IWQVD8iLXm/yQtvs1LuNU1uCtFZcO9OkVnBJhZ8oEugk2raDb1ISrNEOeHKZDXfkYLPxQO0AwQWnA
	+JrHAFPFQtEqNp2H4pWjnt+qVoCy3qic7K+A8jF4zgoM+meQ1Pt58UnWeRYbezw1R9uJbwhc44n/u
	+NM+AXqYzuZ2LijQdH8nEA26vUZaC9jcJTMwm1WYdHrE/ajzMwcj0PDMSpKlc0gTfcyTIxotrP4MP
	YYMJrhLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTPo-005psG-1O;
	Tue, 05 Sep 2023 10:36:12 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTPi-005prZ-1a
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Sep 2023 10:36:10 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5007abb15e9so3910711e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Sep 2023 03:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693910162; x=1694514962; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/U9siKDyazHDG6r3zqTARi8NY0BAa80rOt591lmpFyA=;
        b=Bj7GwDL+0Bfp+Vf1Uku6aIxBJICpGwzB7PKLVEdrybOJYd10lfy/ydoOXbnP7V+/eN
         bhDWs4XYlClVtvEz+lUhzvgfH6cqZq+gnyjtz15IDNDsAJugiAzVvMKRPS0kzy0ZiOAb
         QYiUqfd/z1Q6TYSFIbHAMYqH4EyUNOmHOEnqaBa7DHjfYE//V97eWFaWlX5LplP8/YHU
         QDZJ7ViTpaeeOHm/HjJpgYnqlA4zmGcFxLrXNWLHcyKykWapmXyEvaQTjHXzP/rG+8Qa
         LOLQBIeCUtqS1F2l3rYxADRUuMxYUWvwhirZIrDR/a+IHZvuZAxiAK2fNP6m69uacSXt
         67VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693910162; x=1694514962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/U9siKDyazHDG6r3zqTARi8NY0BAa80rOt591lmpFyA=;
        b=EDslip77eVLC3rtAg4E74Dk654yIcSdscT5/uNx1iAyQkQNVJQFd16EZkV1g34oucd
         ZLUSL79ivPm6xXPt9WPZNXR3iowi3QUbgcSfWtA0RW5kHJ0OX0+PV5ZX3ax3u+s+feKP
         rXc4gaot4hKkmPhYWIjJAleGICx/fsFYKQ0fWrxyJVb2oOkCQZCQigDMO7CU/U4TtbRO
         mQipDIHmqXYA/3ZroVJrXW3KLXYEK9/fCmcnMkR+zBEbn1OAGv/8sOL4yYdzXQKB+NB8
         ZEXMLjoMiFUT8M+XS0Xw9nTiBFYuFPSL2Ft0MerTJTwTk5tbHX2HE0oOYEDm4babUOu3
         5Pxw==
X-Gm-Message-State: AOJu0YxZ/gq29hqLzKTx1vH+KoF+gNAky6sjpQPgh+dV8YoTun4U+rp3
	w15d6+M1tId5yJhrVz/p6jJeZA==
X-Google-Smtp-Source: AGHT+IEEwILeUUAxmLD1NfgpOLlzLDQpUZMD+JAAHfLvTOal4CKjljt/zxapSOY7fQ7wrcKXF88iDA==
X-Received: by 2002:a05:6512:3087:b0:500:9a45:62f with SMTP id z7-20020a056512308700b005009a45062fmr10157967lfd.8.1693910162221;
        Tue, 05 Sep 2023 03:36:02 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id f8-20020a1709067f8800b009a1a5a7ebacsm7282198ejr.201.2023.09.05.03.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 03:36:01 -0700 (PDT)
Message-ID: <ddbc2681-bbda-88a1-643c-54fcabc9b83a@linaro.org>
Date: Tue, 5 Sep 2023 12:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: Add mt8395-evk
 board
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
 Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <e2e35d4d-7853-fccc-28c2-b8ecf309d6ec@linaro.org>
 <00f0a1cf-6246-92e9-13b0-cf31bb292a94@mediatek.com>
 <97b82a16-8710-9430-35c8-673381aaa417@linaro.org>
 <d5645707-bcb0-4d4b-1d94-d3cd17c042fb@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d5645707-bcb0-4d4b-1d94-d3cd17c042fb@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_033606_552654_94E9D7B4 
X-CRM114-Status: GOOD (  18.54  )
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

On 05/09/2023 11:36, Macpaul Lin wrote:
> 
> 
> On 9/4/23 20:11, Krzysztof Kozlowski wrote:
>> 	
>>
>> External email : Please do not click links or open attachments until you 
>> have verified the sender or the content.
>>
>> On 04/09/2023 11:50, Macpaul Lin wrote:
>>>
>>>
>>> On 9/4/23 17:33, Krzysztof Kozlowski wrote:
>>>>
>>>>
>>>> External email : Please do not click links or open attachments until you 
>>>> have verified the sender or the content.
>>>>
>>>> On 04/09/2023 11:20, Macpaul Lin wrote:
>>>>> Add bindings for the MediaTek mt8395-evk board.
>>>>> The mt8359-evk board is also named as "Genio 1200-EVK".
>>>>> MT8195 and MT8395 are the same family series SoC could share
>>>>
>>>> How can be the same and have different numbers? You sill need dedicated
>>>> compatible.
>>>>
>>>
>>> The SoCs mt8195 and mt8395 are designed for different market application 
>>> and physical characteristics, using different efuse values for 
>>> distinction. The booting flow and configurations are controllered by the 
>>> boot loaders, firmware, and TF-A. Therefore, the part numbers and 
>>> procurement channels are different. The detail information of these 
>>> efuse values is proprietary, so I cant disclose it futher. Hence the 
>>> most of peripheral drivers and base address are almost the same.
>>
>> 1. Drivers? So we talk about compatibility, not the same.
>> 2. "almost the same" is not the same. Follow the guidelines for writing
>> bindings.
>>
> 
> Thanks for the review.
> 
> After internal confirmation and discussion, it can be confirmed that the 
> MT8195 and MT8395 are identical SoCs from to binding's perspective. 

I am sorry, but I really do not care what you internally discussed about
bindings. I do not think your internal review respect existing
guidelines. You talked about drivers, not "bindings perspective", so
your internal discussion is clearly discussing something else.

> MediaTek hope the mt8395 boards could directly use mt8195.dtsi, without 
> the need to create a separate mt8395.dtsi to include mt8195.dtsi. 
> Therefore, we hope to fully adopt the bindings of mt8195. However, I 
> will submit a revised patch for compatible since they are different boards.

You can disagree but then I expect arguments from your side.

Best regards,
Krzysztof


