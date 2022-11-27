Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8D6C4321E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsGPEbguNLyXyXtQzAB2wJ4fId8JLFhyfl8o2yashtI=; b=EVdiywJihICk8337Ack39nFy5u
	UqzlenHwVlxGRZ4etkCX1OADCgNrzXukhsvPHfmigs75qL4WZXgF2dFRZMvgKDJCf3Fl5i1NzDsOx
	fkktITfKErEQ5A8RYCegRYPu+bes6ugm5+qZCNv6tlXsuibe80CG01ewK3yMqhTyBlZWQgwYnv/8q
	8hrZfLDUbp/66RzQ+0Bd6N7+en9bGLttxt6Z/boR9sxlLAUENGNHXFs9HZn9vQVl8xWlLaHA4C5vM
	5pJcGj/qfttpihXJ7LE2/DD4jN+ORINe3cXqwCd0zoxF3OAO3Dg/CGL3NUB0z0FxWx3Q+3kWIhdou
	OQfDuawg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHRu-00BLlD-2y; Sun, 27 Nov 2022 13:11:58 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHRp-00BLjj-MD
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 13:11:57 +0000
Received: by mail-lj1-x229.google.com with SMTP id b9so10227447ljr.5
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Nov 2022 05:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsGPEbguNLyXyXtQzAB2wJ4fId8JLFhyfl8o2yashtI=;
        b=Li8wQ2MQpsuNmifYz+kZPILDr2YWOgtE++hH3wSz9Z+uybeOrU6yyv7gDgyYRvZAao
         K/WQQAGYKTxeFyp2lJ6yr4rGmA62AyzdTDQm4qkyyfLXDGDhXUZkuiX1Y5upwCOru6Qp
         e/7iO2LdF0Yj03tAP9XKjVFAXFUeBkBP3MZZldlKmCRIha4elFm2h1HNfzjZFodGmwrH
         O3ValvaUQYKgnFAfzlfh59v2zqUkzcWEqXo5b2BkbyPRrhfXKtsHbgMNk17fZ96rkNd+
         E4UUeYlbXU/owMrUuyd9fQ4Ly34fFLgYlskbnO5pey4cLlYW7Uyy5ugOkbR8jX7VNbpc
         ReHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lsGPEbguNLyXyXtQzAB2wJ4fId8JLFhyfl8o2yashtI=;
        b=0mWjiMH0K2/jsmX5Aki/UJhOY9sjOs6Ayy6mxJCqdpyhTgJLl7DVWPPz1U1e0eDw3l
         vCiLQ/llot/z819gMtgpL3lAIDwd3DvN5QpsD0FVG8Qi7HF99QDFEz5fOD3/bVhRh2vU
         fzcXf5D5oG9hFtOo0X40ARvOz2Aq/04uAbVGNuvyYU+U+t2/BVuNB45ayNlL2NlH8opI
         E7npkXI3+sepSl+9aMe5iyhSyYmJ06Au1yi6nIpfR49uEkpKCHBZmUYyBAEKDzLZ+jIu
         jpc00i9o3kECqjFixyCM53e7HtXw3z0vemR/rLxrgpcJznRXXZ2LgUMKrV5M7O++PYCw
         Z5Pg==
X-Gm-Message-State: ANoB5pnkUaWfiXihog3kU+6Wl/bZoYTdBbAFr7ebfiCjucKuVG2MPFoy
	3re5rDBGEkPXxR04wgb4o+G1AA==
X-Google-Smtp-Source: AA0mqf7D55Zimr5WD3Ta5W+Zbl1zFVFSuDEI4UZ2hLZvj32iV1yJ3DkH5cOJNK3LtUi7drUUjwEUdA==
X-Received: by 2002:a05:651c:198a:b0:277:6c67:1a7f with SMTP id bx10-20020a05651c198a00b002776c671a7fmr15712660ljb.133.1669554710421;
        Sun, 27 Nov 2022 05:11:50 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bp29-20020a056512159d00b0048aee825e2esm1298537lfb.282.2022.11.27.05.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 05:11:49 -0800 (PST)
Message-ID: <c94d15bf-c5ed-b400-abdf-8cca4102b078@linaro.org>
Date: Sun, 27 Nov 2022 14:11:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 05/10] dt-bindings: soc: mediatek: convert pwrap
 documentation
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Flora Fu <flora.fu@mediatek.com>, Tianping Fang
 <tianping.fang@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org
References: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
 <20221005-mt6357-support-v6-5-4f589756befa@baylibre.com>
 <a9a47e08-1a08-abe5-1dbe-1537d3414af6@linaro.org>
In-Reply-To: <a9a47e08-1a08-abe5-1dbe-1537d3414af6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_051153_786491_353EBBBE 
X-CRM114-Status: GOOD (  13.97  )
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

On 27/11/2022 14:04, Krzysztof Kozlowski wrote:
> On 25/11/2022 16:10, Alexandre Mergnat wrote:
>> - Convert soc/mediatek/pwrap.txt to soc/mediatek/mediatek,pwrap.yaml
>> - Add syscon compatible const for mt8186 and mt8195 to match the DTS needs.
>>
>> +  resets:
>> +    minItems: 1
>> +    items:
>> +      - description: PMIC wrapper reset
>> +      - description: IP pairing reset
>> +
>> +  reset-names:
>> +    minItems: 1
>> +    items:
>> +      - const: pwrap
>> +      - const: pwrap-bridge
>> +
>> +  pmic:
>> +    type: object
> 
> What's here? Other schema? If not then maybe compatible? What about
> description?

I guess this was comment from Rob, so it's fine.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +
>> +dependentRequired:
>> +  resets: [reset-names]
> 
> Drop.
> 
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: mediatek,mt8365-pwrap
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 4
>> +
>> +        clock-names:
>> +          minItems: 4
> 
> else:
> ???

Actually this looks less complete than your previous patch.

else:
  clocks:
    maxItems: 2
same for clock-names

> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/reset/mt8135-resets.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        pwrap@1000d000 {
>> +            compatible = "mediatek,mt8135-pwrap";
>> +            reg = <0 0x1000f000 0 0x1000>,
> 
> This does not match your unit address. No warnings when compile testing?
> 
>> +                  <0 0x11017000 0 0x1000>;
>> +            reg-names = "pwrap", "pwrap-bridge";
>> +            interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk26m>, <&clk26m>;
>> +            clock-names = "spi", "wrap";
>> +            resets = <&infracfg MT8135_INFRA_PMIC_WRAP_RST>,
>> +                     <&pericfg MT8135_PERI_PWRAP_BRIDGE_SW_RST>;
>> +            reset-names = "pwrap", "pwrap-bridge";
> 
> Missing pmic. Make your example complete.

Probably pmic should be skipped, I understand it is described in MFD
binding.

Best regards,
Krzysztof


