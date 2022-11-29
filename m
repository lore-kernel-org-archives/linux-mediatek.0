Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB75CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 08:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3Xm8CTKI5pFBGHRduIfFpNiMz/YnZAtfkESDIfrZHU=; b=rnru/Rzb/PagWdMOAB8Ib1shC9
	2aWf4XVMyAXrlE4TQQk4p4uUuEBDPqXkqjpWApPgAq8QoT5TkGOSgt8C4oD+qxBDqVXF91CkwiBkJ
	6bOYziiNhfcc1TFkPN2ZTUQL8JtfBTgI1KWhZvkp8ZKoO2Zz+IUhH45Dlabmysoll42pv9OKvlRVh
	3FvF1DXFnYIjPRwipOKEf8vFPzXlS3CPJ/m+qPYGDzd6kI5UkkZb/Vi1/EMhMkKCDGkZ6/5NB/23Z
	tWUmnVvDzNWlJnGLF4rY8gMgbYQVMgDRoSudTFFbL/w1svqKBk3qdgsvxI58WSxrKEVJTxymCMxsx
	6Tm5kVzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwRL-007blt-Pb; Tue, 29 Nov 2022 08:58:07 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwRG-007bgT-7i
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 08:58:03 +0000
Received: by mail-lf1-x130.google.com with SMTP id bp15so21367312lfb.13
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 00:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y3Xm8CTKI5pFBGHRduIfFpNiMz/YnZAtfkESDIfrZHU=;
        b=yAEQ0f7iiBFFT3zCiQNjmihHx5xLZxE6k/IeeXvqExp+xO+DPBKaqaxdKRPjwqjvfm
         LGiE/88+2dA8GBPDfU5fAaQ3Z/xIyM/1Q2wHRirgQvn4TyBIra65cSP5Se2/qbjCoKGc
         1Hq557jg8voTc6j/UzZluOPwaXmy4GBopEX26WAIH5FqPhTqu9nz80AjXLac3MJp2C5g
         10UfdNS/tnkujmQa2TuxvMMrc4swPsf08zlfgj/5oJCSrM8Yrtf/hnZWZFPGy9NRTOg/
         5H+ub/cqzstKJ9vwyX2QUwyFk6bzIK3YPyrSpYuCCEjZonNp91Y4cV2sIkrx4I/gpKTj
         /OMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3Xm8CTKI5pFBGHRduIfFpNiMz/YnZAtfkESDIfrZHU=;
        b=frI+1wkRTaD78mZW71wCP323ejjhs7I8E5j+t0hfM//qc5XHdBN8un6PPL7UjoSqQj
         96F02n5hor704xSMWGYhVAQLsJQ1TjBPkURygpq0FwZa5TnnKvYxxsVsop9A4wyPLGbX
         AF3qOEIm8jnR0N3blO/PHk9m1OjZVPPzDsXD5b7gVCOnVYCDIV1kKm2oVaPmV45w7HOV
         B9tqvEIfTH5EiHmNFdnGJBXse/uY4NIvYsVoq43B2w1c0tM/WFY8JaCMtD1lw1dIFh+P
         XKTF6hm7dCBbfhuIaJDIqg2dIXsnWGqwPt6EXnWsKRA8Q3X573lxhHnDs9eKQgrXIvIa
         aMcQ==
X-Gm-Message-State: ANoB5pmz9Qe7HOlmULiJAk3gXHBcfOzb/YMjQ+cMkSx9VWTKBD24C+1/
	M5xxZ0k/X6E3ttR8+WV2e2xpzw==
X-Google-Smtp-Source: AA0mqf4sCi5zsBb8QGQDZbosFwGoYJsQ5RMSlu7aY+oTQbrbtNWy43Z7xsQZ8C1sktxc1yAoujDyww==
X-Received: by 2002:ac2:4919:0:b0:4b5:33d:1215 with SMTP id n25-20020ac24919000000b004b5033d1215mr6449072lfi.419.1669712278173;
        Tue, 29 Nov 2022 00:57:58 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c13-20020a056512238d00b0049ebc44994fsm2140144lfv.128.2022.11.29.00.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 00:57:57 -0800 (PST)
Message-ID: <79651cf2-7efd-b54c-65a0-8986cea071d5@linaro.org>
Date: Tue, 29 Nov 2022 09:57:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 05/10] dt-bindings: soc: mediatek: convert pwrap
 documentation
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Flora Fu <flora.fu@mediatek.com>, Tianping Fang
 <tianping.fang@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org
References: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
 <20221005-mt6357-support-v6-5-4f589756befa@baylibre.com>
 <a9a47e08-1a08-abe5-1dbe-1537d3414af6@linaro.org>
 <c94d15bf-c5ed-b400-abdf-8cca4102b078@linaro.org>
 <CAFGrd9pueans7Z_GHassY7ouGOwDmj4oJHAXS4ZtbYK4KH58Bw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFGrd9pueans7Z_GHassY7ouGOwDmj4oJHAXS4ZtbYK4KH58Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_005802_345635_158FDC16 
X-CRM114-Status: GOOD (  21.36  )
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

On 28/11/2022 15:03, Alexandre Mergnat wrote:
> 
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: mediatek,mt8365-pwrap
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 4
>>>> +
>>>> +        clock-names:
>>>> +          minItems: 4
>>>
>>> else:
>>> ???
>>
>> Actually this looks less complete than your previous patch.
>>
>> else:
>>   clocks:
>>     maxItems: 2
>> same for clock-names
>>
> 
> I think I’ve followed the feedback done here [1]
> I’ve declared `minItems: 2` globally and override it to 4 if
> mediatek,mt8365-pwrap is used. Isn’t it the right way to implement it
> ?

Yes, just the other part of comment is missing:
"If you really want to force a validation error when using
mediatek,mt8365-pwrap
and not providing `sys` and `tmr` clocks, you can just override minItems."

but that's fine if this was your intention.

> 
>>>> +            compatible = "mediatek,mt8135-pwrap";
>>>> +            reg = <0 0x1000f000 0 0x1000>,
>>>
>>> This does not match your unit address. No warnings when compile testing?
>>>
> 
> There are no warnings when compile testing. I will fix the unit
> address anyway, sorry.
> 
>>>> +                  <0 0x11017000 0 0x1000>;
>>>> +            reg-names = "pwrap", "pwrap-bridge";
>>>> +            interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
>>>> +            clocks = <&clk26m>, <&clk26m>;
>>>> +            clock-names = "spi", "wrap";
>>>> +            resets = <&infracfg MT8135_INFRA_PMIC_WRAP_RST>,
>>>> +                     <&pericfg MT8135_PERI_PWRAP_BRIDGE_SW_RST>;
>>>> +            reset-names = "pwrap", "pwrap-bridge";
>>>
>>> Missing pmic. Make your example complete.
>>
>> Probably pmic should be skipped, I understand it is described in MFD
>> binding.
>>
> 
> Put the pmic in the example have 2 constraints:
> - The original pmic "mediatek,mt6397" isn’t supported by a yaml
> schema, so I’ve a dt_binding_check fail: `failed to match any schema
> with compatible: ['mediatek,mt6397']`
> - If I put another pmic that supports a yaml schema, I need to put all
> required properties for the pmic, which I thought was unnecessary
> since it’s already done in its own schema and can change for another
> pmic, so less consistent.
> 
> Then yes, IMHO, PMIC should be skipped in the example.


Yes, you're right.

Best regards,
Krzysztof


