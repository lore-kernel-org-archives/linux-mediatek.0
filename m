Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EEBC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 06:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCyzEZlMvj4qyhqI/jfIrKZtL0IJNJXLMhIAaxEBXII=; b=SskzkRTFgMLc/U
	WUUEwgnscVO5k0QA32xmUQcBeNgjn4voFkYvbIdKvz79zzu4MVeRn3gCholDbNH+N4wO9fvjD+v0/
	g3ZQC9jXoEmOdYBIouL3LP+DkUlLrzm+zzAFb6+N3SCT4LBFpOuWxKbedaNATefPhBq6PUa6d5foh
	pFldnH0JSC24G5nscSGXGbnpszxxZgit333XddZL1JatnanLxvnjFH+lahAjZriH8AD845iwJd8sn
	KOqcFLFxFgFOMsSMT3s5ejMTdutCp5YN8Yip/Fz9Zpj9eQSsDgy7G50nijGUrX/9VkUFM6ydLtQIR
	zr5p0W/kKx0ke5+TNJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh492-007d0F-VU; Wed, 20 Apr 2022 06:48:57 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh48y-007cy8-KD
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 06:48:54 +0000
Received: by mail-ej1-x62c.google.com with SMTP id y20so1468340eju.7
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 23:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=9uzVgdbnNBXZaj+xly+bx359WI4zRoQI5FjtgADEBW0=;
 b=S1hEIoiDmJQ5F60K6iW2OrVRkegrcBBnOiVG/QccBRbUzlvLB7dozEncz0TnysxDv2
 FNqn0DTAOA4Q2I7V8GVKaw1i2NPEeQXKphyrqggpzxaDYUSClbIhcQp0+9i6iYSFu7bS
 3izRWeFlXNNCXQssXVTHnL4FoKkdgGPoQ2vQMrWlaKAobfQmVkpSXD8j7qGeGRSANGYD
 qSiNfQSnN7UgnguVZfXmP7KljNKkZ8YHOB98cA5LtbxLKR3AUqxhR2xNu8ZcjoeWHIOB
 keopxTJEGVgV6/z+1eDrgrEgVnXYMJyKfXrVB7Uyf5nlhLCH30oUjauesWLm7jKti+aS
 VafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=9uzVgdbnNBXZaj+xly+bx359WI4zRoQI5FjtgADEBW0=;
 b=vUvuLf61tuzJiRajIHyFKnLLaMiCbsA1wEc2wzfm1oFuO1BFQkD8y+BpAb9B/FF2OZ
 h+iz0bq3dhzXJZBVFEEdNMpZycNGP5nAwXx9f22NeCvWUfanQjofcgOgtBm2neNSUTn5
 KiIPSHVSUOqzmshQ5quxIgmV7XjflRMQOaHrWzwEZb+1pLrwUh1J5VJpljABROQu5rol
 U9zB9200AsCbaOfsc5bXM0/lvulh9DmqYOZdb6WraIP/RJF0R1/pdVZbwu/QhyilVL7B
 7sHRHKfXinBdUzTK4In75qPGk3H/1a2Kc05gS2na8gko+YZZohPdSNc1+wrkyTftxzQK
 EYxg==
X-Gm-Message-State: AOAM530onCUhr+ZCZjYRpwc2eA8PbtTHUGFQxUw8lEoIiDNx5ZZqe38g
 fVIb/pqi1k3IKV1ed21EWerWKQ==
X-Google-Smtp-Source: ABdhPJwWVmNshJAW0tGWYuRLU9jbNedM/km5ShG0Ei7YXEVHAQ+JyhA9HCOy1DRMF98ygrtJdvPgvg==
X-Received: by 2002:a17:907:d16:b0:6d6:e3b6:9cd8 with SMTP id
 gn22-20020a1709070d1600b006d6e3b69cd8mr16733035ejc.94.1650437331372; 
 Tue, 19 Apr 2022 23:48:51 -0700 (PDT)
Received: from [192.168.0.222] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 d6-20020a170906304600b006ef5da1b1besm5171288ejd.221.2022.04.19.23.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 23:48:50 -0700 (PDT)
Message-ID: <df786c5c-f522-1b24-dc3e-b4dcf3049cbe@linaro.org>
Date: Wed, 20 Apr 2022 08:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: topckgen: Convert to DT
 schema
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryder Lee <ryder.lee@kernel.org>, Yassine Oudjana
 <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220419180938.19397-1-y.oudjana@protonmail.com>
 <20220419180938.19397-2-y.oudjana@protonmail.com>
 <efc6d3ee-b060-b070-1471-af940428964a@linaro.org>
In-Reply-To: <efc6d3ee-b060-b070-1471-af940428964a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_234852_689762_A60B6199 
X-CRM114-Status: GOOD (  16.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20/04/2022 08:47, Krzysztof Kozlowski wrote:
> On 19/04/2022 20:09, Yassine Oudjana wrote:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> Convert topckgen bindings to DT schema format. MT2701, MT7623 and
>> MT7629 device trees currently have the syscon compatible without
>> it being mentioned in the old DT bindings file which introduces
>> dtbs_check errors when converting to DT schema as-is, so
>> mediatek,mt2701-topckgen and mediatek,mt7629-topckgen are placed
>> in the last items list with the syscon compatible, and syscon is
>> added to the mediatek,mt7623-topckgen list.
>>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.yaml
>> new file mode 100644
>> index 000000000000..9ce9cf673cbc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.yaml
>> @@ -0,0 +1,60 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,topckgen.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: MediaTek Top Clock Generator Controller
>> +
>> +maintainers:
>> +  - Matthias Brugger <matthias.bgg@gmail.com>
>> +
>> +description:
>> +  The Mediatek topckgen controller provides various clocks to the system.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
> 
> These are not a list, so skip items. Just enum. Rest looks good.

Actually one more through - this looks like clock-controller, so please
move the binding to ../bindings/clock/ directory.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
