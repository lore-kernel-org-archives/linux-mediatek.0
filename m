Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F96AC7EE29
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 07:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ID97egBGuXMI7J4GkeNsqWERFtG/jgBWuZXR0IgIwWE=; b=jEVRraksegxeLZAaJ9WH/35m7U
	7oDNWKajTEnzS1kz9t9nX5NDZrwyJydrQkj9S8J60hgRvZ9XhHa5v42hZSQlzTwZfXoHmR4YQ+Irl
	gehBtRRj8mylmeBQXfFzvYTwgveTpg72CXUTLYU2GRb/jeAQx7Cdq8H4n8vitVQ0opclQ+g0LaBxR
	4daLXUqF8staSPZOHAltcLBRgKskBs7ws4rAZM89nXo/QzOf0IX/AawhNVxjoYywAL4Fy6EOqUtQh
	DbAHGRW2nvu42RL1SSSbgkHq19wOztS7pHJFfSoVZ6fkQfsqoK5bBaDwzUde2UujRwA7rD39glHL7
	iaC6Vd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4yxL-005ytd-0U;
	Fri, 02 Jun 2023 07:12:15 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4yxI-005yrh-0p
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 07:12:13 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-96f7bf29550so245547766b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jun 2023 00:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685689928; x=1688281928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ID97egBGuXMI7J4GkeNsqWERFtG/jgBWuZXR0IgIwWE=;
        b=pJ6WxSKGbQ1lTXGYSx5AV6TgLnndwDX+mYc4xaGh0RzfzalUrq3xVEWx54oWvDi02I
         z1fvVun1fQXFZBEdCACH3A6qBZmGWyjxGbOKud+dLG9w+/9DEIU1owODdv9vBALtlBrf
         OXsvJ2jO/bxffy3BDljQJDG/GORMavqDuUvF6qtPv+yxO/+R3BQdJ3p6BTSbPay0Hxv7
         dY53Bs3Z8PYwSd5WBPOuwBbVrXj+sbZYw7QtiuISgIKdt4FCeuBAoBXK6n1Pq6mUXacl
         ZLN8o4wds8nM3S3H16LEMFHrkqTKHIWPKMnJARqQVdgy0rbl3V2ZrqlFi6a0s3q/rsLW
         KusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685689928; x=1688281928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ID97egBGuXMI7J4GkeNsqWERFtG/jgBWuZXR0IgIwWE=;
        b=H5yocb/B30MZArrj0OnY1Z363C54gH3AULZSYanM6j93oABw/te3GmfJ4eC8d8Pvp0
         TV6UcOzcj0HMt1RYoqT1KoHpCtLiS18lLC5jW6bDJnxjgTxiV/HXG60GhuTGIqcbA9Gz
         oP+Kwgn0+ec/sTY2GdMI4FldH0mWrpRDacpCAYGNwNbSp8PX5AO8wKt6NIXBfpqE6MGY
         1xBujjATKsegUwxzm1izIo8Y+izBwHJolMr2c+RdtaGjX0TH/HqpHeOziZmmAt53TqyQ
         sOWPfZQ1Xqi8Xvtt7GIZolC+a0zczGwVYpym7hjNbZm7I+sOlWPX7OQlo7ZOwQmOIcvs
         64vQ==
X-Gm-Message-State: AC+VfDwOdYKiXGxzl+FJ+Y0clT6kaBBRbYofaCgvimT1q1VaYKqfcnKw
	AKJnSxvrYOKqltS8Zy5Kl+l9GQ==
X-Google-Smtp-Source: ACHHUZ4hbQaYX7U80wxKjvKgnV9pZX+PaiNP2lawdYjP7mjQi3B2eIAZoovKcl7m0wcRKYSz3aVP3Q==
X-Received: by 2002:a17:906:6a16:b0:947:ebd5:c798 with SMTP id qw22-20020a1709066a1600b00947ebd5c798mr10173625ejc.54.1685689927791;
        Fri, 02 Jun 2023 00:12:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id g4-20020a170906c18400b00969f13d886fsm397252ejz.71.2023.06.02.00.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 00:12:07 -0700 (PDT)
Message-ID: <7dfc6241-ed72-d655-7400-fd8f9c413e69@linaro.org>
Date: Fri, 2 Jun 2023 09:12:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: add additional clocks
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Qii Wang <qii.wang@mediatek.com>,
 Sam Shih <sam.shih@mediatek.com>, =?UTF-8?B?6YOt5bCP5qGl?=
 <joe@gainstrong.cn>
References: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
 <12fea13e-e2c3-487f-8d2b-cfd320c98ba7@linaro.org>
 <ZHjtExYIdVFo3HnB@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZHjtExYIdVFo3HnB@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_001212_315262_AAD0523B 
X-CRM114-Status: GOOD (  14.62  )
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

On 01/06/2023 21:10, Daniel Golle wrote:
> On Thu, Jun 01, 2023 at 06:54:01PM +0200, Krzysztof Kozlowski wrote:
>> On 31/05/2023 18:10, Daniel Golle wrote:
>>> Add pck and mck clocks which are needed to access I2C registers on MT7981.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
>>> index fda0467cdd954..550795f6573c5 100644
>>> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
>>> @@ -78,6 +78,8 @@ properties:
>>>        - const: dma
>>>        - const: arb
>>>        - const: pmic
>>> +      - const: mck
>>> +      - const: pck
>>>  
>>
>> Adding names does not magically add the clocks. This wasn't tested.
> 
> Adding the clocks is done in patch 2/2 which just wasn't sent to
> devicetree@ and dt maintainers, but to the relevant mailing lists
> instead. Was that wrong and should I always send the complete series
> also to devicetree@ as well as dt maintainers?

I didn't mean implementation. I meant that you still do not allow more
clocks! You can put into names whatever you wish but clocks are taken
from "clocks" property, not from clock-names.


Best regards,
Krzysztof


