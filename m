Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4501BC47DDB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 21:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdh/VQpoX951eaSBCyP28Nr1FHihNafI7p4+z0vryQs=; b=19Ug/4t9yHgr1Sr1yHxVcH27i8
	rio89qQdRjjTKcJXdMoLDFPZWbLrNy191oA8xIEenBrjao2J62Tunq31MdGRAJtYMZfSikfOquL5F
	8ENTLjsp+1aq5h4htrojqA7TXBxbg8RR8t1yqzKabf0ikf5kAx7kp7Ni0mshNtA9aAyCtzqYxnQ6E
	Z0MVwfaVokggIjW5t5Wvt0/4z8UI+ElQKNSOznl9i9+gfUIzs7hgeiLvSx+9+JXZyMTlRkr7gyI9B
	8jXitYR+QgfpFAJdrzBosoKuieIYNKivgs3snTiDRygd8nQylmhNxzNGMGuqXZriazz207PLEvB6R
	+QKn4Bbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUw7C-00000000gwJ-3W7K;
	Tue, 30 Jan 2024 21:57:58 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUw77-00000000guS-39ZA;
	Tue, 30 Jan 2024 21:57:56 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a3122b70439so607259466b.3;
        Tue, 30 Jan 2024 13:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706651871; x=1707256671; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wdh/VQpoX951eaSBCyP28Nr1FHihNafI7p4+z0vryQs=;
        b=fdc1BmqtVvMjivYAQiXMprtLXWEqkNCMf7VbXiWyaRtUUPswAgKDMbJcJVHQTP8g42
         RYfqyfdl1ICRwk0XFrGLZwKiH4+MWqlv1/kd/d61FHF6YX/ras2SwjNu3qURPTdk7/Gz
         hdX8BJ349wiHZgOHoj/8bJrH3madhQOk7vkxKy6/qP7yRaFidm6+KhzziNOqs7o99KCs
         EU/HPZPkhjkX0uQRIsDhmPqi38S7yGLphHsej1R4cb0Eou01qA1yS8MiW+BIpTGrxjcg
         6DH5eCmeu72umd1qra/hzCMAAaTzFyrA17FGgRSBlO1eOXYQGoEe1gIPpu/9GBfxedDY
         JeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706651871; x=1707256671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdh/VQpoX951eaSBCyP28Nr1FHihNafI7p4+z0vryQs=;
        b=ocIvnm8DpTIWIdlhwf5g56xDFdxjJxWId6zyeN3UJDRQL4Y+kVX1OkqYZ8Efgl1vQp
         L18qD7trP1pWNw5tal0HwrDe31LkLioDP3ypemnGyjUTh6xyyDCqKTka4wUwTpnI5WNy
         ckN938MowIzc0bPhP7Ro9rT0SB2Ec7iKwa6xjt8e53u1O1GlaxGHw73jFpaO9NcJZPa0
         ttmLHGKczvaRnySlif24HoCSrLXFslnfHXgo9k6bHuNBKNb96JM2ygvgkHDbpCkG8RGy
         torfWBxAUPQD7Fwr3oDPfI/ihtBzKRzxh9VBVmdy/lC1aLIH7CqwGksSWL3F2qZKdrDP
         PPXg==
X-Gm-Message-State: AOJu0Yx4aKbSBJRTytagF3xH68Pu4RDvqxvUERBlxVkN03boVEkrBZCY
	vPtTxZXJeKVkaxuKEDaw8pDPjMt6BxLJl1AyMXOxq84TtQ8NN52y
X-Google-Smtp-Source: AGHT+IEQSbMTrpr0DCCyf4rAOMtntZKl6TLmVGMeQghYBiFGqw3C3cfdFBUahwQOq31kv6SqyZh6xQ==
X-Received: by 2002:a17:906:4ad2:b0:a35:fbc4:4c20 with SMTP id u18-20020a1709064ad200b00a35fbc44c20mr3161908ejt.6.1706651870454;
        Tue, 30 Jan 2024 13:57:50 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id x10-20020a170906298a00b00a34a20b247fsm5519809eje.84.2024.01.30.13.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 13:57:49 -0800 (PST)
Message-ID: <c2adae73-9f1b-467e-880d-3e87eaeb10ea@gmail.com>
Date: Tue, 30 Jan 2024 22:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: arm: mediatek: convert PCIESYS to the
 json-schema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20240123082100.7334-1-zajec5@gmail.com>
 <20240123082100.7334-3-zajec5@gmail.com>
 <e17b85b1-7f1f-4b60-89b7-43f560466cc2@collabora.com>
 <20240130203413.GA2290196-robh@kernel.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20240130203413.GA2290196-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_135753_838697_298563E6 
X-CRM114-Status: GOOD (  23.44  )
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

On 30.01.2024 21:34, Rob Herring wrote:
> On Tue, Jan 23, 2024 at 12:20:29PM +0100, AngeloGioacchino Del Regno wrote:
>> Il 23/01/24 09:20, Rafał Miłecki ha scritto:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> This helps validating DTS files. Introduced changes:
>>> 1. Documented "reg" property
>>> 2. Adjusted "reg" in example
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>>    .../arm/mediatek/mediatek,mt7622-pciesys.yaml | 47 +++++++++++++++++++
>>>    .../arm/mediatek/mediatek,pciesys.txt         | 25 ----------
>>>    2 files changed, 47 insertions(+), 25 deletions(-)
>>>    create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
>>>    delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
>>> new file mode 100644
>>> index 000000000000..7340a2512402
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
>>
>> I think that we should really move all those clock controller yaml files to their
>> proper directory, which would be
>>
>> Documentation/devicetree/bindings/clock/
>>
>> ...because those are clock controllers anyway and the fact that they do also
>> provide a reset controller doesn't really justify having them in arm/mediatek.
>>
>> Besides, I would appreciate if you could also move mt8186/92/95 and eventual
>> others that are there to clock/.
> 
> Yes, please move it.
> 
>>
>>> @@ -0,0 +1,47 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-pciesys.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek PCIESYS controller
>>> +
>>> +description:
>>> +  The MediaTek PCIESYS controller provides various clocks to the system.
>>> +
>>> +maintainers:
>>> +  - Matthias Brugger <matthias.bgg@gmail.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - mediatek,mt7622-pciesys
>>> +          - mediatek,mt7629-pciesys
>>> +      - const: syscon
>>
>> I know that there's syscon all over the place and, even if I admit I didn't check,
>> I am fairly sure that there's absolutely no reason to have syscon there, and that
>> the syscon compatible never did anything for (most of, or all of) those clock
>> controllers, at all.
>>
>> I'm not sure - though - if removing syscon during the txt->yaml conversion is
>> acceptable (yeah we'd be cheating a bit), but something makes me say it is, because
>> the bindings couldn't validate before that one as well.
> 
> As long as you state why you are removing it in the commit msg.
> 
>>
>> Of course you'd have to remove the syscon compatible from the affected device trees
>> as well as omitting it here.
> 
> You could also do 'minItems: 1' and 'deprecated' in the 2nd item.

I expected this to be quite straightforward but I can't get it to work.

Can you tell me if I'm making some mistake or is that some meta schema
limitation?

properties:
   compatible:
     oneOf:
       - minItems: 1
         items:
           - enum:
               - mediatek,mt2701-hifsys
               - mediatek,mt7622-hifsys
           - const: syscon
             deprecated: true
       - minItems: 2
         items:
           - enum:
               - mediatek,mt7623-hifsys
           - const: mediatek,mt2701-hifsys
           - const: syscon
             deprecated: true

Gives me:

Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml: properties:compatible:oneOf:0:items: 'oneOf' conditional failed, one must be fixed:
         [{'enum': ['mediatek,mt2701-hifsys', 'mediatek,mt7622-hifsys']}, {'const': 'syscon', 'deprecated': True}] is not of type 'object'
         Additional properties are not allowed ('deprecated' was unexpected)
         from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml: properties:compatible:oneOf:1:items: 'oneOf' conditional failed, one must be fixed:
         [{'enum': ['mediatek,mt7623-hifsys']}, {'const': 'mediatek,mt2701-hifsys'}, {'const': 'syscon', 'deprecated': True}] is not of type 'object'
         Additional properties are not allowed ('deprecated' was unexpected)
         from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#

