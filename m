Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E321EC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZto2aI8Bptli2OzTKbCF8aaAGorStB0N8MSB1xDDtE=; b=d7clWSNER2OOkp6bXaQYnZj6eK
	A4KmHzmEB/873OWpwqSPoEs59u07yOswypw5Smpa7pwQSPU6LFFA/VXz5ESriXZy+pBi55nE1fFdX
	gQyP6NcDuSC1ff6js65F9mrq1+bfV7yOv4lZlGu1qJJlLFcmpqml9hm9EtCCP4M0UJkW5CWDTWPkP
	04vAxwfeX9rRhUipgEVT7gQiDdEwqw7UmaOSezF/JqMBhEnSmwX7tsXHO6QJZrnQLmqrbwCJslaUb
	y16V69F8IGu3jRYj63vgrgsxVg9IysKi3wLs2mbtk9aaxFvnNwbDTBEtCW4jAi3cLVXqVG99Xj3mh
	h+u5YGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6yQ-00HDLW-BF; Mon, 07 Nov 2022 18:35:54 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6yG-00HDJQ-CH
	for linux-mediatek@lists.infradead.org; Mon, 07 Nov 2022 18:35:45 +0000
Received: by mail-lf1-x129.google.com with SMTP id d6so17961754lfs.10
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Nov 2022 10:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZto2aI8Bptli2OzTKbCF8aaAGorStB0N8MSB1xDDtE=;
        b=vo5nLgHJwfnXEhjUBrU1bPOwdaFEjM909+M2qoa53AjbBjcM3hNZqMa4pZzsuCQRn0
         lpPDAJnxdGAijHfUaO4MdbZe4RjB65J7KstdKxwI6d0f8BLN822lpu8f8Wc8TuJClkKN
         ZM9eJuggIQbYxLVe77V7d3dGfkJih4Yo4HoeUA5JtntxU5R0KyJbIJnhQ5nOBYCh0Mnr
         eQcH3mcm+IGiCba6xHn9au9243J9KLjzFhg9TBAUT76iv1KbLNYW+yMMrjdHST1AD7NQ
         LSJFvlneJpLNT3t2mc0UA85cSd1YTHdFuOg2ZYtRlHQ/kkiQOWjtN+E6UePW9qbg/ZXZ
         RCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZto2aI8Bptli2OzTKbCF8aaAGorStB0N8MSB1xDDtE=;
        b=NGswaH7mPw5rHlN+2mFxFOhKl6Ljq24L+TQ99G20ybl7JfUP6pSDKuhdsclIK8xyak
         jfDErVwIYGXLNJXYI9HdaSKdBWW3vRcXLZNFxGsiqCC5zIVG4dUM/3PmwaOd1VopxCyI
         RnfCPnoTu5PPKYkRxA3Z1jZbXnMGLcrL0Mwwg8FcteTzsj9QUBzUA+nuROYYgLsupnpS
         6U2pseogMKB//fOGLBblalQ1loBuKmNj3Vgs6VcAzG3vRm8hZBHAxnCXbxeuhNKOxMGF
         qOsKYh8Aj1t5w1UrSP637zRIfMWnwrjjpLMPN7BrD5ydY1eff4s0lggdcETo1rn7I5NG
         XUgg==
X-Gm-Message-State: ACrzQf2XhFBUmT51NzyPwg2OaxxIxNdbybBPRNGN3zB2gNKtlyp0Yxw8
	fzZV1uFIkS9xaPeUgojZQw6mvQ==
X-Google-Smtp-Source: AMsMyM6ioglBiZGtDLKRsAr68YwkWzhXxrEcAKOa49F6LtuCSk/ZFcxVyr3OS6Jtu4/aUqvZZJBsLQ==
X-Received: by 2002:ac2:5221:0:b0:4a4:5af7:8ad5 with SMTP id i1-20020ac25221000000b004a45af78ad5mr17457353lfl.388.1667846139899;
        Mon, 07 Nov 2022 10:35:39 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id j23-20020a056512345700b00492d064e8f8sm1371621lfr.263.2022.11.07.10.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 10:35:39 -0800 (PST)
Message-ID: <c8ad788b-5934-8dee-e122-3450a19dd08f@linaro.org>
Date: Mon, 7 Nov 2022 19:35:38 +0100
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
 <34f40c1c-f933-cee6-f022-14c37650dc3a@linaro.org>
 <20221104214744.GA2878314-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104214744.GA2878314-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_103544_424838_5A33F77F 
X-CRM114-Status: GOOD (  15.55  )
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

On 04/11/2022 22:47, Rob Herring wrote:
>>>> +7. Phandle to syscon with offset:
>>>> +   Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>>>> +   Line: 42
>>>> +
>>>> +8. Variable length of array (e.g. clocks and clock-names) but narrowed to
>>>> +   specific variant:
>>>> +   Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>>>> +   Lines: 33 and 71
>>>
>>> It seems like some of these that are just a single property we could add 
>>> to example-schema.yaml.
>>
>> I am afraid the example-schema will grow too big for folks to look into.
>> It's already quite complicated, with explanations of the dtschema
>> behavior itself.
> 
> How about splitting up the top-level descriptions and property examples?

You mean splitting up to separate YAML files? I guess this could work
and still be concise - few examples showing different concepts.

> 
>> How about then RST file with small code snippets?
> 
> Then they don't validate.
> 
>>
>>> Also, perhaps a reference to this from writing-schema.rst.
>>
>> I can do this as well.
>>
>> The problem with my approach above (and adding these to writing-schema)
>> is that examples above can change, lines can be inadequate.
> 
> I just meant a link in writing-schema.rst to this doc. We already have 
> that for example-schema.yaml.


Best regards,
Krzysztof


