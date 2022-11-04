Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1697EC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgjU+OEEvQPZ01qzgjb2MKqqHyMalDRUVvIv26QXzls=; b=v5FmBKAepqRVn7AN5Xv4UibxNt
	Mb/FrD/qNzXlpLihrVhzcaRyMU8h6NwVTlrTsc8U9U3hPC4xf500M8fsihpv12gFLvz82O7IisE5A
	fZGrLHXYO27TEWs4Mol/IDq0IV6I3rkpwqSSzL+TXuABxKtr8YBVXHjez48HLY9uD/W+h1avw1Z5m
	RX0Q0koNcPGD59UAjd5hZ7w6xqw7acSbdog0w5HXy/N8qHaZl11wJYNDghP44lTz1oCe3mNUNW6SC
	9l4K316tGoVWT+UI2lBYhUICcr0kc3Ut9Dgeg3UAPzC70SezJBxuIqjNl5bY0l1JAcJF7ZfcJCVXJ
	MALed8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqy3k-0045PC-0D; Fri, 04 Nov 2022 14:52:40 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqy3Z-0045Mk-1I
	for linux-mediatek@lists.infradead.org; Fri, 04 Nov 2022 14:52:30 +0000
Received: by mail-qt1-x82e.google.com with SMTP id fz10so3164543qtb.3
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Nov 2022 07:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgjU+OEEvQPZ01qzgjb2MKqqHyMalDRUVvIv26QXzls=;
        b=EEn0//VkZ+RccjlE/pD9lTHfQMk2wzl3pr5N8iZf+IhhfMGJ0ZrQE24okgkcanNyb4
         i+FS7LZpo3vxhzn4guBMal5KihP9v276yMLOr/KaZmCa+swk6orhWJhPfIhOji3edgxk
         OwYAbSCYeaF4IH8iqaBANSAgAQ5hdlVgdbPiTKMUmFSMo8ZnFCbplOk3PpfJO8e21SIq
         bTXd6bTUTllJHlRaU0n3BHCDyTHblxDIw6oYd/Esv4RtvaK5dq+W93e/dLk7rF8yYFMg
         62ZxAHiWZlBcs+EMikh1Cl0gDC9ul062+RvTpYLTj7cnKgXoAfcDZjxnUwwUP26xPlTk
         UGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QgjU+OEEvQPZ01qzgjb2MKqqHyMalDRUVvIv26QXzls=;
        b=Owre0guK7TRJzPp98BBo31MDvGy8avD4rcqbhgnr38JrjwbyIsDDU1EnrVmrX3uIxs
         Lhp2RQXNUXSL3caPDxhFXFkXQDgOT3jtbkQAUr9M8IGnN3drSYIZDyCmxjwZpL60Jhbx
         tp7THXSRcc+Tx72AvYTa5m+S0k26wki0utbwyV5u7L3czWnBTJ/pwsCBoLfePCdP9AsJ
         xpEryfVEN1v4cwQA4EEGBv0XFxylildFEyRXWcvIybChtDWdgdUEZ2+/a8LBSpnHV8hp
         6/qr+YSmxsJDS8VAnFtPt3/VSWdSbcdIyN7N0+dToXG4VIIo/7mJJvXpekWAFLSSUvo/
         4aEA==
X-Gm-Message-State: ACrzQf1hifNHHIBkcG9+Bgzg1H38ec/Z/AYWSwwqiWF5wJtYolWNcTnS
	uK2Wjc5QcZPgc2tw/wmyvWgYTWmuark4iA==
X-Google-Smtp-Source: AMsMyM4YO7l4BmWs/QUGSvV1jS0dywSrAlj7aR/rV7nTudHC1ZtuLQY2KyT2tKW0cGiHGsyP4lLurQ==
X-Received: by 2002:ac8:7fc7:0:b0:3a5:71f2:c89a with SMTP id b7-20020ac87fc7000000b003a571f2c89amr1179362qtk.636.1667573543826;
        Fri, 04 Nov 2022 07:52:23 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id u5-20020a05620a0c4500b006fa22f0494bsm3020401qki.117.2022.11.04.07.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 07:52:23 -0700 (PDT)
Message-ID: <34f40c1c-f933-cee6-f022-14c37650dc3a@linaro.org>
Date: Fri, 4 Nov 2022 10:52:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: examples: add a list of templates and
 solutions
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221028233701.572280-1-krzysztof.kozlowski@linaro.org>
 <20221101130720.GA963805-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221101130720.GA963805-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_075229_141627_D2F49D73 
X-CRM114-Status: GOOD (  24.55  )
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

On 01/11/2022 09:07, Rob Herring wrote:
> On Fri, Oct 28, 2022 at 07:37:01PM -0400, Krzysztof Kozlowski wrote:
>> It is useful to start from existing bindings when writing new ones,
>> especially when one does not know that much DT schema.  However we have
>> several bindings which are not the best examples, so people tend to copy
>> their issues into new bindings.
>>
>> Beginners also might not know how to achieve some more complex solutions
>> in DT schema, e.g. how one of two properties should be required by the
>> bindings.  Some of such solutions are already in example-schema.yaml,
>> but several other are missing.  Add reference with such re-usable
>> design-patterns.
> 
> My main concern here is what's a good example today is not tomorrow... 

Yes, I agree. The problem I want to solve is some folks copy-paste some
existing schema as starting point and then are surprised when receive
basic style feedback.

Of course the optimal solution would be to make all schemas in same
(proper) style, but this is going take some time...

How to solve this problem other way? I don't know.

> 
> 
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/examples.rst          | 63 +++++++++++++++++++
>>  Documentation/devicetree/bindings/index.rst   |  1 +
>>  2 files changed, 64 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/examples.rst
>>
>> diff --git a/Documentation/devicetree/bindings/examples.rst b/Documentation/devicetree/bindings/examples.rst
>> new file mode 100644
>> index 000000000000..710eea81d8b7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/examples.rst
>> @@ -0,0 +1,63 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +Examples of Devicetree Bindings to use a base
>> +=============================================
>> +
>> +Following Devicetree Bindings in DT Schema are a known good starting point when
>> +writing new bindings:
>> +
>> +1. Simple SPI device:
>> +   Documentation/devicetree/bindings/iio/adc/maxim,max11205.yaml
>> +
>> +2. PMIC (MFD) with several sub-devices:
>> +   Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>> +
>> +3. Battery charger (power supply):
>> +   Documentation/devicetree/bindings/power/supply/bq256xx.yaml
>> +   (but use vendor prefix in filename)
>> +
>> +4. Clock controller for several devices with different clock inputs:
>> +   Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>> +
>> +5. GPIO controller:
>> +   Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
>> +
>> +
>> +Re-usable design patterns when writing your own bindings
>> +========================================================
>> +
>> +Following bindings show how to use common pattern of writing bindings:
>> +
>> +1. Property required and present only for one variant.  Property cannot appear
>> +   on other variants:
>> +   Documentation/devicetree/bindings/example-schema.yaml
>> +   Line: 212
>> +
>> +2. Excluding properties, but none are required:
>> +   Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
>> +   Line: 155
>> +
>> +3. Excluding required properties, but one is required:
>> +   Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
>> +   Line: 91
>> +
>> +4. Array with numbers (items) from given range - min/max:
>> +   Documentation/devicetree/bindings/arm/l2c2x0.yaml
>> +   Line: 74
>> +
>> +5. Array with numbers (items) from given range - enum:
>> +   Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +   Line: 101
>> +
>> +6. Uint32 matrix, variable length of two-items:
>> +   Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
>> +   Line: 278
>> +
>> +7. Phandle to syscon with offset:
>> +   Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>> +   Line: 42
>> +
>> +8. Variable length of array (e.g. clocks and clock-names) but narrowed to
>> +   specific variant:
>> +   Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>> +   Lines: 33 and 71
> 
> It seems like some of these that are just a single property we could add 
> to example-schema.yaml.

I am afraid the example-schema will grow too big for folks to look into.
It's already quite complicated, with explanations of the dtschema
behavior itself.

How about then RST file with small code snippets?

> Also, perhaps a reference to this from writing-schema.rst.

I can do this as well.

The problem with my approach above (and adding these to writing-schema)
is that examples above can change, lines can be inadequate.

Best regards,
Krzysztof


