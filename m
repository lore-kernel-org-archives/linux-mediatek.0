Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C779C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 11:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mx+1LEKjG08mHXdWiW0HFl/U3LRaOvUzyjCNt5ITLZc=; b=W2jLzgUOZgfgv/isLFE02DjT0Y
	8dcOewQUMX/Cvwq6jQ93gb3/yGHrqCgteT00tZnl7Xb3hT6LGIo0HM+AL5aVxTNucENJH3j31wBCS
	bk1JRmQrmOE/ym25RA8gRYQ8JYeyvskGsKf1iK3G4osq3W4A+fIt4H1dQ3sJLr/eCC0xwAUAkgGYt
	wfIipipeB7hxdS388ROm1oz+UBEiENH+p0qYkr6e6q3BjkFA+7RAz337vdZSR37CBHdZ8i5HlYOSC
	2+ESVsR9wu+ym6EWMVvhP7pikIit2MzscNDArbYkPaUCNdOmers+ihsU+oK5tVL9YxyqZeCxvWpE3
	eMls+czA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiCua-00FNIZ-3D;
	Mon, 18 Sep 2023 11:59:33 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiCuY-00FNFv-0W
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 11:59:31 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9ada6b0649fso590058866b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 04:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695038366; x=1695643166; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mx+1LEKjG08mHXdWiW0HFl/U3LRaOvUzyjCNt5ITLZc=;
        b=c9lVzMu609WWFHI9Dx/HzUi4jLUqox+g5CR7MBYzpRQcXmQy/5vHNRTGbfGiuUP264
         8ZBZf7peus6zxu5TATagHajOmoi8LYLvLr0gBgXV7YfGkdHH3vDyrH1bHfWn3NAYA7p/
         YHTF1GfUqs5yYaG9ARsN/k7lFBKl0UBe8LFnOGS2uGmhv8Jr1l7RQuv+KX7cjLDeVvoS
         12yaKbFZT6er65anfOItnYyePRJ3AyY5e8ErpKX/bsF6WvCcZYIYYDvZQVxwmrZzAPLY
         oaLLu7PKqglsg4upAL5muQSKCEJs+nfg5Nm4AkEdHnMudrmwxkorB/JwHK2hge465dmU
         ADJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695038366; x=1695643166;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mx+1LEKjG08mHXdWiW0HFl/U3LRaOvUzyjCNt5ITLZc=;
        b=UqgToqyZfxQ/9lIJw4Du+XpN7IEJ+Fz0pQ8Wnqje0PhsCUsuc0p830kgZAp8s7P/zi
         JeaMmkJG/xtqUknJ+TtnAMYgrx1UX6J/N21iyR+Rs2z25wq5noUn/4JI7Jm+uABGsl0A
         R3bQ5elLQ9pX14ZD99lumK93dKtO2AvvxT49unFReo20YrZiRlAlXxgBi2WXvq4Vhz/t
         S40f09yRa0HFb8bYRmOVfGjm8oJ9oMJJ7Ml/64hmKMNTwUHPGwk8TetIemmYwRG0r7BY
         yBFL+eoY8iZnGdBqA/E2duusgkMjobmdUG4qfXujtg4y87hnNGeUm/EsRulsAong5n0O
         nzsQ==
X-Gm-Message-State: AOJu0YwZKtfwaKiMvoZNthFKGypBcqPDgD90ktVry24pyYE15DKoGJMw
	ZXQUgk7c0DYAcnNQoQHAWulxFg==
X-Google-Smtp-Source: AGHT+IEQU5aP9n0ZpbF9FIWm05VurFH/Lgko0yhluHa5UJmuOfDQoNjoIOALZWR4TY4wUZ0dcYYJAQ==
X-Received: by 2002:a17:906:5188:b0:9a1:db97:62a1 with SMTP id y8-20020a170906518800b009a1db9762a1mr7333228ejk.46.1695038366283;
        Mon, 18 Sep 2023 04:59:26 -0700 (PDT)
Received: from [172.25.80.114] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id j9-20020a170906410900b0099cc3c7ace2sm6466812ejk.140.2023.09.18.04.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 04:59:25 -0700 (PDT)
Message-ID: <fad9eb3c-49f9-5ece-b51a-aaff4d8888ad@linaro.org>
Date: Mon, 18 Sep 2023 13:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/3] dt-bindings: hwinfo: Add mtk-socinfo driver
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kevin Hilman <khilman@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230915152607.18116-1-william-tw.lin@mediatek.com>
 <20230915152607.18116-4-william-tw.lin@mediatek.com>
 <3e7bc476-ffc7-fb07-8e64-246427da736c@linaro.org>
 <9acc8d99-e3db-3df8-4051-21d95450b28d@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9acc8d99-e3db-3df8-4051-21d95450b28d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_045930_196576_BA829464 
X-CRM114-Status: GOOD (  20.53  )
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

On 18/09/2023 10:47, AngeloGioacchino Del Regno wrote:
> Il 17/09/23 10:26, Krzysztof Kozlowski ha scritto:
>> On 15/09/2023 17:26, William-tw Lin wrote:
>>> dt-binding documentation for mtk-socinfo driver.
>>
>> Here and in subject, drop driver and instead descrbe hardware.
>>
>>> mtk-socinfo driver provides SoC-related information.
>>> Such information includes manufacturer information, SoC name,
>>> SoC segment name, and SoC marketing name.
>>>
>>> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
>>> ---
>>>   .../bindings/hwinfo/mtk-socinfo.yaml          | 48 +++++++++++++++++++
>>>   1 file changed, 48 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/hwinfo/mtk-socinfo.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwinfo/mtk-socinfo.yaml b/Documentation/devicetree/bindings/hwinfo/mtk-socinfo.yaml
>>> new file mode 100644
>>> index 000000000000..74f03f1dc404
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/hwinfo/mtk-socinfo.yaml
>>
>> Nothing improved.
>>
>> This is a friendly reminder during the review process.
>>
>> It seems my previous comments were not fully addressed. Maybe my
>> feedback got lost between the quotes, maybe you just forgot to apply it.
>> Please go back to the previous discussion and either implement all
>> requested changes or keep discussing them.
>>
>> Thank you.
>>
>>> @@ -0,0 +1,48 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/hwinfo/mtk-socinfo.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek SoC ChipID
>>> +
>>> +maintainers:
>>> +  - William Lin <william-tw.lin@mediatek.com>
>>> +  - Matthias Brugger <matthias.bgg@gmail.com>
>>> +  - Kevin Hilman <khilman@kernel.org>
>>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> +
>>> +description:
>>> +  MediaTek SoCs store various product information in eFuses, including
>>> +  Chip ID and Revision fields, usable to identify the manufacturer,
>>> +  SoC version, plus segment and marketing names.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,socinfo
>>
>> What happened to compatibles? No, this is just wrong and no explained.
>> You ignored other comments as well. Really, that's not the way to go.
>>
> 
> Practically, having different compatibles for each SoC is not needed, as
> the only thing that changes between SoCs is the eFuse(s) that you read to
> get the information - and that's all.


And how do you guarantee that no future SoC will have any difference?
How can you even predict it?

> 
> So ... we either use this driver with devicetree, giving it the right eFuses

I am talking about bindings, no driver.

> to read from, or we duplicate the mtk-efuse driver, or we statically assign
> the eFuses in the driver itself and we set compatibles like
> "mediatek,mt8195-socinfo" to select that... ideas?

Device specific compatibles followed by fallback, just like for every
other review coming from me.

Best regards,
Krzysztof


