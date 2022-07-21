Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3D2C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NX01PXec4oCp0RNFOcGC2D4osWkcf/OjSXNrxmif0H4=; b=NXG9ljceR4prZCzhwrmZ/3SUGk
	r+H1JI6Si6r8dGil0AGPlIw/xeYNhkJYUJdyrWfMi7oSFexvFwbDMFmCZ4p3EajX+w3JFx703WZTu
	zIcCDJbzFC98jYPipY/1/MWD99veWllbZeJEWs6H9dfbgfdwuSRNEZIvLu5qKZBzMaB+221t81j1t
	BxKUFuxLATuVwcJcTSnsXAgKk1HJ7ycWP0iGsw244Vxhr9eFtUW2gDJGmKHHBqNsUti+VKvkRq3J7
	V3WS689BX0J/3S2NN6W7uFNaP/Wvfak9SdeHv8lAUkVw7Avle3zmfk+3o21sM/7LZ6QgZBWq7U4mJ
	88McZeng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESI1-00374o-4N; Thu, 21 Jul 2022 09:16:13 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESHy-0036zH-D1
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 09:16:11 +0000
Received: by mail-lf1-x133.google.com with SMTP id t1so1781736lft.8
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Jul 2022 02:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NX01PXec4oCp0RNFOcGC2D4osWkcf/OjSXNrxmif0H4=;
        b=m5R8uFVK4YrCrVYE4rVc+jXXO2vKg46lp/urdVrQ8f2wGi+2ZdgHF6TxAk+Z1H1NL5
         s5eRagjcZrTKUvY8orKP+y3wIkuE/LB4brKZg2bUltf6tKqn942slGDC+InNt0FGfGdi
         +ObIujImekzOuhEK9oi8ajmUpgs8Yhlu93R3fluCYHIDeOy06dXMo8VhUh15wpjHymNc
         1avfgz0EYxZZGdYrIx1yMHVfpMar52gvGJN17PkyjYwqOoteMsff2wOlNGidyR8TReIB
         1QBrFPPJ8i7TxaXZlOuOuK9m2555n+BWH/vjXDNV6vNdhPpnqAqGFqpslYgyQHxrosGW
         JM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NX01PXec4oCp0RNFOcGC2D4osWkcf/OjSXNrxmif0H4=;
        b=kyBp+uR47v/BzeOFbmD2mwpOK0RChQ6WJdriulEsYkeR/UVUEP9XAVii1YaP99iL33
         rdSM6USdmdaoujbGZvhg8JLVO6AhxKuIKPRLENY8tc9D5bUbWfTQi7lt7Dr00ZtO4mlR
         50k+dzrhwqqh+RItAQLp4vkLvMMCPCiuKYA5druZD04gykNjl3cHJJwdQyWMfZYI6gKu
         qNznoR1eEyuqKDsgc3iirSKj17CRXacQNfU1g3avIi38OgWcymwAd5dIQU0kms43+fVu
         3+9zCof06NoRXxt9lweE326ddtODFFqqZTEu87/YLzfyOB7SsY5Xf3z6dzjuXY2Wgmnl
         s9mg==
X-Gm-Message-State: AJIora9hTbIt59R3PMt8smOYMtYTyuEtEwIrzz7MmqTR0VTyHOnKvpSi
	sT5Xm0yhgXvRp52KAx4h2E3JMg==
X-Google-Smtp-Source: AGRyM1tZG8v/X5Cvk5Swz75Z3HdFevHIeUTVvTwWLJIDvqUWpXwC4324umZdPzad973iHEQ3WAhL+w==
X-Received: by 2002:a05:6512:3c9f:b0:48a:2c32:e22c with SMTP id h31-20020a0565123c9f00b0048a2c32e22cmr14987643lfv.356.1658394968135;
        Thu, 21 Jul 2022 02:16:08 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id s1-20020a056512202100b0047fac0f34absm318272lfs.196.2022.07.21.02.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 02:16:06 -0700 (PDT)
Message-ID: <734ed3cf-1461-6067-e718-663ca4be47a6@linaro.org>
Date: Thu, 21 Jul 2022 11:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 2/6] dt-bindings: mediatek,mt6779-keypad: use
 unevaluatedProperties
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-2-ef9fc29dbff4@baylibre.com>
 <e1ec8511-d1dd-faa5-031f-50c4e55062cd@linaro.org>
 <874jzaj0m5.fsf@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <874jzaj0m5.fsf@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_021610_481566_77BC5AE7 
X-CRM114-Status: GOOD (  20.32  )
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

On 21/07/2022 11:06, Mattijs Korpershoek wrote:
> On Wed, Jul 20, 2022 at 19:14, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 20/07/2022 16:48, Mattijs Korpershoek wrote:
>>> writing-bindings.rst states:
>>>> - If schema includes other schema (e.g. /schemas/i2c/i2c-controller.yaml) use
>>>>   "unevaluatedProperties:false". In other cases, usually use
>>>>   "additionalProperties:false".
>>>
>>> mt6779-keypad includes matrix-keymap.yaml so replace additionalProperties:false
>>> by unevaluatedProperties:false.
>>
>> This is not sufficient explanation. You now allow all properties from
>> matrix-keymap.yaml, which might be desired or might be not (e.g. they
>> are not valid for this device). Please investigate it and mention the
>> outcome.
> 
> Hi Krzysztof,
> 
> Thank you for your prompt review.
> 
> In mt6779_keypad_pdrv_probe(), we call
> * matrix_keypad_parse_properties() which requires keypad,num-rows and keypad,num-cols.
> * matrix_keypad_build_keymap() which uses linux,keymap
> 
> Therefore, all properties from matrix-keymap.yaml are
> required by the mt6779-keypad 
Better to mention the device, not driver.

> 
> In v2, I will add the above justification and also add all 3 properties
> in the "required" list.
> 
> Initially, I did not do this because from a dts/code perspective it seemed
> interesting to split out SoC specific keyboard node vs board specific key configuration:
> * [PATCH v1 5/6] arm64: dts: mediatek: mt8183: add keyboard node # SoC specific
> * [PATCH v1 6/6] arm64: dts: mediatek: mt8183-pumpkin: add keypad support # board specific
> 
> What would be the recommend approach for above?
> I see at least 2:
> * "move the whole keyboard node into the board file (mt8183-pumpkin.dts)" even if it generates
>   duplication between boards using the same SoC.
> * "add a "dummy keymap,row,cols" properties in the soc node which can be overriden in board file.
>   For example, use rows and cols = 0 which would have the driver early exit.
> 
SoC DTSI should have only SoC properties. The keyboard module is part of
SoC. The keys and how it is wired to them - not.

Best regards,
Krzysztof

