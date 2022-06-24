Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA01C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 10:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2t+7HTFw4Am9k5wfnt+zpTYwsim5TZ2i9yEsItPpeso=; b=fS08qsoDHVunaR+dnV/EZOXGjg
	u3ugYG/EfN+aBb9ewjWRpyRmAPryv5cy/y8hCT3IRgwzzXuKz2kz1D/5jbStXG2LoQPxyIeSXmevp
	4veZJIeZPViBbgHhXgNqABvx0TyFaU8Wh0/bNejv9c1ILxPpmaF0DzxGcVKxu2B54nVXp6oKL0sfM
	RooAXo/7eU2l6wEGypHVNqQuaaPxBjw8Q162QYgu1CTLBiZiBMw8bYz2MeTuPVPv4cF9MvUhb5CWP
	l4jRcnwOHTLUgtR+Z15mPWjCDa67trNSSEDR2fL+ZtKtYWpJ0rFubbcNo7JIq26tZ0/ozGP3fGAjF
	EZlv9xGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4goW-001qpT-Nl; Fri, 24 Jun 2022 10:45:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4goJ-001ql1-Ej
	for linux-mediatek@lists.infradead.org; Fri, 24 Jun 2022 10:45:14 +0000
Received: by mail-ej1-x62e.google.com with SMTP id cw10so3898666ejb.3
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jun 2022 03:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=2t+7HTFw4Am9k5wfnt+zpTYwsim5TZ2i9yEsItPpeso=;
        b=xcoXh7yCPrSwwOXsVEte8S9NR0zXlkpvvmSX4mcTWFeTdYGxCOjXXMGpaIaqsIAE1K
         bp0d/k4GmQ8d8KFLm3LHJNOZx0WMiu4WZUX7HLNDAsZEJN1sptGsrLYyPxjY9ktKrSY+
         anicQhYWBm83eN/+nf24xt/88s2e96BqLLMqqV5kNG1Cun51WNovucO46nd97ihvrKZF
         dnLW7i1sNcOp3Mp4GU7oElU9RGuLLHZTaYOd/EiSoahcaoQ1ovR0ARSV/9WojV7BCFK1
         Svcita+pSItq8jdZ6ZzrgytfqP0wj21BQU9Nqu6VjwpUbWuvEYZFpH+8A2yDStdJm384
         PEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=2t+7HTFw4Am9k5wfnt+zpTYwsim5TZ2i9yEsItPpeso=;
        b=s00ewji0q2dHatPiULMHXUFo0YC6X2lqOPMlDI5nS4oAj5umm678FMJJCJmOvu4csX
         eA9lWia4MORQsurV1IelK+UBCCk9yKq91r72UBmsuWERYSpQSJl0XRwZXft1vvsTL8mV
         zkuka/4jrdfg+XdHl+quXxMIcdFCQqP9yFdu3XpGU/G+EC15eU7WRm3Cy/oFnWlbBmUC
         gynaqByZ2baHhQdSgK9d4huVdCe6b2nn6WACl6tljIwDredDnkC0klSHQ3sG1qMYdBSU
         /Gv4s84E6yxH6/Gprx+BFT4DzZ8d5CI+IZILUJd+qvfmGCiXxmSDJr8hux5c7svnZcFv
         6fVQ==
X-Gm-Message-State: AJIora8zR9ytXjnUXatZXMUnTmFthWl2MRZa6n1O/rcdOwOwKJaodqFk
	zQrEd9Vj1T0LgNfZBLHJ4e38YA==
X-Google-Smtp-Source: AGRyM1tk6j4mNtQk9qRRyVUy6ecFx8pKAt3xM74yrIfZScw1NM4v+j/hr8GYVIcM+2p5oRpQfs7mBA==
X-Received: by 2002:a17:906:2dd:b0:712:1293:3dd8 with SMTP id 29-20020a17090602dd00b0071212933dd8mr12766549ejk.448.1656067509878;
        Fri, 24 Jun 2022 03:45:09 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ci25-20020a170906c35900b006fe921fcb2dsm906732ejb.49.2022.06.24.03.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 03:45:09 -0700 (PDT)
Message-ID: <237b1ecc-9a87-b37f-46fd-4612a7ae56f6@linaro.org>
Date: Fri, 24 Jun 2022 12:45:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 03/14] dt-bindings: leds: mt6370: Add Mediatek mt6370
 current sink type LED indicator
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-4-peterwu.pub@gmail.com>
 <aec8ecdb-7c76-1261-216b-b40e450d1bf8@linaro.org>
In-Reply-To: <aec8ecdb-7c76-1261-216b-b40e450d1bf8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_034511_539530_EDA8CF99 
X-CRM114-Status: GOOD (  12.10  )
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

On 24/06/2022 12:35, Krzysztof Kozlowski wrote:
> On 23/06/2022 13:56, ChiaEn Wu wrote:
>> From: ChiYuan Huang <cy_huang@richtek.com>
>>
>> Add Mediatek mt6370 current sink type LED indicator binding documentation.
>>
>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
>> ---
>>
>> v3
>> - Use leds-class-multicolor.yaml instead of common.yaml.
>> - Split multi-led and led node.
>> - Add subdevice "led" in "multi-led".
>> ---
>>  .../bindings/leds/mediatek,mt6370-indicator.yaml   | 77 ++++++++++++++++++++++
>>  1 file changed, 77 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
>> new file mode 100644
>> index 0000000..45030f3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
>> @@ -0,0 +1,77 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: LED driver for MT6370 PMIC from MediaTek Integrated.
>> +
>> +maintainers:
>> +  - Alice Chen <alice_chen@richtek.com>
>> +
>> +description: |
>> +  This module is part of the MT6370 MFD device.
>> +  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
>> +
>> +allOf:
>> +  - $ref: leds-class-multicolor.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt6370-indicator
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^multi-led@[0-3]$":
>> +    type: object
> 
> Here as well unevaluatedProperties:false (on the type level)

Ah, no, it does not work currently. Your code looks good.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

