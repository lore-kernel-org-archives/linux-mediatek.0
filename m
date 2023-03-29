Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E19AC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 07:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhUeJU6e4h9PitXkQe9MfipgTdaNoe9G7C662XIORfM=; b=gCTWC9G6liT3gEDOV4foc55bOZ
	1W+929LnmeS7+xJx/gXg9UB4N8Wpl4GPYBykLLiEWQKTOGDaBZUmESkDqgNUd/+xwEXGy37nbwtJy
	JA8crqIzybzmsc/lX8VV811BjHm/yBUor7QsCyy/hiiKz5V6p1GJhWKIuwUqbWl66EMzjSqwezVcx
	B9//fYPxTnkeuNS5CSfxUDzDFuMihBkVkTg9JIQgAI2ec14bv1oB+Fv8wYH9yLaM02yQW2C2FUCSE
	M9M8I15QieJ5meOWPD6DZ9YiIN74SzZ3qNZQGSzZmhVEfD9VsWsznAPvUOrIiWen4GhAd+cavcwEo
	0+51WZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQi1-00GzqJ-1T;
	Wed, 29 Mar 2023 07:59:05 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQhy-00GzoO-2a
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 07:59:04 +0000
Received: by mail-lf1-x132.google.com with SMTP id h11so12058462lfu.8
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 00:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680076739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JhUeJU6e4h9PitXkQe9MfipgTdaNoe9G7C662XIORfM=;
        b=NlS/k/gyKOpyGz4+n2dMHIv5Jyl5X0BUWman6JDHpG5pL/V9m3XN7KqKkZcQiYffYF
         pYZwXz//KXBnXxhR+VP2YV4/VGQNt8AoW/Ar+WrbuzXfCS4cx9REG/xdtmcxDtFqpvtI
         UPcxSLbU/vsMu4bKc8gLObJSZbeA9I+siU4PlXG5JKdKbfwnTdy4k1tK8d5J+sjYH8l0
         klNL9UxtSg5IQKr6I1C2wu3s+ik9ffYX8NBI/KD2nPyyLAB8Pwi5zqOxLQnpMI6CjuEK
         VFfBufv+QdE1Ul/x+Qdw2CeP0Rm287S584hTA6bS6ft0+Un03enQEJu29BzO65tKlw8f
         dwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680076739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JhUeJU6e4h9PitXkQe9MfipgTdaNoe9G7C662XIORfM=;
        b=tcyDFNzyfvodXZ5pq1zxrCOC9I/C/ONNhmpFX9zN80iMV2k7rINIY2J/HD+ENjboRX
         RkxKJY3+M3SXGSLl05jgud88l3uvZvl9CBRT+yeas6zlCgGukjU15lc9UGKR3kCMFerD
         wop2SxWPGTdFVpYphtTAEcw1PKuznysB80JaesWB8mk/mqr1XWGRfgs3DF3wIKTsVV58
         GCsL0nrvF5Y53YWJwGfuHZO2fzuVkXDqv8W+rv0aCLUSLy2/Z+R7Ko7Aw2JS3yFegXla
         ixTzIfUATOgxwsfGEn6wk5j/o3uK5hgMiP/HQANskLj4HQZ+sZE8R4db22EFt9rkFh6A
         JolA==
X-Gm-Message-State: AAQBX9dI5BdUovY3/pG9JtrfPYn3yWbOQ9uN/oFRyRDDa5Rg/bO/+bSS
	cv+pv2DveyEKqbhLucTRUPsKFQ==
X-Google-Smtp-Source: AKy350b+22Kn5HHx0uKk+5FJ3GJSg9tKTqXFD4BKu62/Z2qhoT6gF4mFK69Es0wrx/7N5SnIZDK8DA==
X-Received: by 2002:ac2:4859:0:b0:4e8:487a:7c34 with SMTP id 25-20020ac24859000000b004e8487a7c34mr5663278lfy.12.1680076738773;
        Wed, 29 Mar 2023 00:58:58 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m19-20020a195213000000b004eaf393dc46sm3194558lfb.249.2023.03.29.00.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 00:58:58 -0700 (PDT)
Message-ID: <3fbb78e9-a450-3741-070b-2caedbaa47a5@linaro.org>
Date: Wed, 29 Mar 2023 09:58:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: deprecate custom
 drive strength property
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230327-cleanup-pinctrl-binding-v1-0-b695e32e4f2e@baylibre.com>
 <20230327-cleanup-pinctrl-binding-v1-1-b695e32e4f2e@baylibre.com>
 <334089fd-f0e8-bf63-5100-d8632c478ccc@collabora.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <334089fd-f0e8-bf63-5100-d8632c478ccc@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_005902_847652_32E2537A 
X-CRM114-Status: GOOD (  20.38  )
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

On 28/03/2023 15:41, AngeloGioacchino Del Regno wrote:
> Il 28/03/23 15:06, Alexandre Mergnat ha scritto:
>> Deprecate mediatek,drive-strength-adv which shall not exist, that was an
>> unnecessary property that leaked upstream from downstream kernels and
>> there's no reason to use it.
>>
>> The generic property drive-strength-microamp should be used instead.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   .../devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml      | 8 ++++++--
>>   .../devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml      | 6 +++++-
>>   2 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
>> index c30cd0d010dd..b82a066b91ec 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
> 
> Thanks for doing MT8183!!!
> 
>> @@ -110,8 +110,13 @@ patternProperties:
>>             drive-strength:
> 
> ..snip..
> 
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
>> index 4b96884a1afc..347f533776ba 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
>> @@ -91,8 +91,13 @@ patternProperties:
>>   
>>             input-schmitt-disable: true
>>   
>> +          drive-strength-microamp:
>> +            enum: [125, 250, 500, 1000]
>> +
>>             mediatek,drive-strength-adv:
>> +            deprecated: true
> 
> In the case of MT8365, since there's *no* devicetree using this property, *at all*,
> I think you can even just entirely remove this block, as that should not be
> considered an ABI breakage in that case.
> 
> Krzysztof, can you please confirm?

If it is defined as ABI in a released kernel, then should be rather
deprecated.

Best regards,
Krzysztof


