Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A86EC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 12:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xYnHX1Erl5u5KfXsFsM2CCOcYE1hgAFey0pHbtrlGw=; b=bnFmpO6ddP3y7wRUYtg4fW9NOH
	7yXJeLPItndlcJsP66i0W0cJmEpLzSVxjtJhEF6pzWs/S4qwTSR7l/7SQIMKWWUEN5uD46ruxmftM
	F5fQA+CuNSMujeAauiMrActq1vfS+puY5cg8CoeTPFI/ymdMRlYI/+RbHBLJ9i4VKV6e+7XOKRGqQ
	nvOFWYt7Kb5nnFj9nxxgm5JPdVyUXAm9oLyckp0bLRSmOmgF9/LuL3eMno1yp1v3sHxPeV9GTBY8x
	l25cXy88lwpJ4FtpfsXhVrkvfhRnQYGFPd1xM+9R4NpVTqRxCrdLsC6ROsU7CHMfdSseEh23uPauC
	RQ5uBoeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPN3P-00C5VD-F8; Tue, 07 Feb 2023 12:26:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPN3F-00C5Ox-5b
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 12:26:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id bk16so13360619wrb.11
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 04:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5xYnHX1Erl5u5KfXsFsM2CCOcYE1hgAFey0pHbtrlGw=;
        b=a0bYF8vFZ81omWoSjjcDJcOsQPx0IJKXO2MNRiT9l9onGXaGU/wJv/i2K99OGIqcp7
         ihdwgekxx34k/NvtSiaofvZjKIRkq1Gr46OJM4n4ysLojX6AZ2xR1xvSjnBut7H/2Mm5
         8fi1YvW7KVgOJ1rXKQn7mg4bC89gcex54BUyX418qwHJ7IdMfDUxIXyFJ1oW3XbTbubd
         /ieHDCdsL1zjj0I/unn0HAHeDghr6unOEfRIAlgeJ2dj8xHT/gk42owOCUPeMedXbbyz
         j+AivNuy9YL3wEAIJ2NKTETQpyVQuPor+n9so2GzpBypaEyYTWGpIOrft7HAPnHDPCTc
         IggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5xYnHX1Erl5u5KfXsFsM2CCOcYE1hgAFey0pHbtrlGw=;
        b=tVnLexc0mZhC0iO2yxhjLlpHNUkh5enWi7tJuieXhVCjzV08ynptCB17Du282iRF9H
         ClzlWdpemf1oUl0pFGMrtpK8NWQRWCB42jrA8YdxsOfmneEfFC02gbXAfiAT9lD3BqU6
         KrEsb+xsSVx/nOjC4oTdZNj+XH6/eTc1vvhTs1PO+y7OhDNr5257mTPVBU/ISLTCMHmb
         cq59510jXxaWT1oxnj14CwoNcbK43exBi/heXI3B2xJqeyGhgMpzR7Vc/b1KOkXYgVET
         hNtFnxghlU8zdS6AilxGI1XxZ9D+ujQoACu0V6ipnqBb81We930VBq+jGzDojpLFLvdn
         6eHA==
X-Gm-Message-State: AO0yUKWMEMJ+S4Yq0cFZJac25FMVZgs/2IBe/GFwznJRwcTY22acPuEp
	gwqpqFEte2K3Vxna/EpUA//KBg==
X-Google-Smtp-Source: AK7set88Lxl1qHumI/CfBw3/LLuxkMuEJHa+tXasBGB44CpUVlsBGzjZqivjRlNLNjNxDs0SM2+K5w==
X-Received: by 2002:adf:efcc:0:b0:2c3:e07d:46cc with SMTP id i12-20020adfefcc000000b002c3e07d46ccmr2519530wrp.41.1675772776749;
        Tue, 07 Feb 2023 04:26:16 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i14-20020a0560001ace00b002bfb8f829eesm11816006wry.71.2023.02.07.04.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 04:26:16 -0800 (PST)
Message-ID: <cd2f7933-6f51-5100-f7c1-cd9900e796e5@linaro.org>
Date: Tue, 7 Feb 2023 13:26:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Aw: Re: [PATCH] dt-bindings: mt76: add active-low property to led
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230207102501.11418-1-linux@fw-web.de>
 <fe3673d9-b921-c445-0f5f-a6bc824e8582@linaro.org>
 <trinity-808b2619-4325-4d03-b2f5-1a7bc27d42ea-1675771928390@3c-app-gmx-bap02>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <trinity-808b2619-4325-4d03-b2f5-1a7bc27d42ea-1675771928390@3c-app-gmx-bap02>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_042621_226874_04F7AC0E 
X-CRM114-Status: GOOD (  16.69  )
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

On 07/02/2023 13:12, Frank Wunderlich wrote:
>> Gesendet: Dienstag, 07. Februar 2023 um 11:40 Uhr
>> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
>> On 07/02/2023 11:25, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> LEDs can be in low-active mode, so add dt property for it.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> ---
>>>  .../devicetree/bindings/net/wireless/mediatek,mt76.yaml      | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
>>> index f0c78f994491..212508672979 100644
>>> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
>>> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
>>> @@ -112,6 +112,11 @@ properties:
>>>      $ref: /schemas/leds/common.yaml#
>>>      additionalProperties: false
>>>      properties:
>>> +      led-active-low:
>>> +        description:
>>> +          LED is enabled with ground signal.
>>
>> What does it mean? You set voltage of regulator to 0? Or you set GPIO as
>> 0? If the latter, it's not the property of LED...
> 
> basicly it is a gpio-led mapped into the mt76 driver, but not passing gpio itself in this property (like gpio-led does).
> This gpio is set to 0 signal (gnd) to let the led go on ;) so imho it is a led-property, but below the wifi-node as
> the trigger comes from mt76 hardware, not an external (soc) gpio controller.
> 
> mt76 driver supports it already like i post change here:
> 

If the driver supports it already and it was never documented, please
state it. Your commit says you add a new property.

Best regards,
Krzysztof


