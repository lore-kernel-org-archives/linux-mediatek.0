Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3489EECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 07:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+BAz5TKARnaA7ePcUOXjPEFWuKXdNXQbdrTJXQiOA8=; b=qunhaAUmz7+BrYhV+AHymlO9Ev
	95krqRoFChF9sIP/ETYvE49XUfty83S1etLgqsHY4wxh4C8prymBTY36I/aUlqaA9rdoRWPZr5PEc
	f/1HdeoETeO2oDFQLy+v2a8On09zX8IHb8rx29AO2eXEkDF+5jOfV/TNncjT1pb/0Z3K2elptSNNB
	fOOA9HvKV3XCmuYcjpuZJpjm3Unj+cA69wLqhrVqb0YkVLqQEmZD996+bvHcBfBNPE2X8w3GpQmf/
	d1mUm79JmbCfQ+M2UczsCKZZUYreEo/TWCwa0UPNnqHInxCU/CLiTNDXm8Sw9OA0lmFv4intnpTRE
	SMS+CekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSw19-00Ev1e-QW; Tue, 30 Aug 2022 07:50:40 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvtM-00Er4R-RC
	for linux-mediatek@lists.infradead.org; Tue, 30 Aug 2022 07:42:38 +0000
Received: by mail-lf1-x12d.google.com with SMTP id q7so14348339lfu.5
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Aug 2022 00:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=c+BAz5TKARnaA7ePcUOXjPEFWuKXdNXQbdrTJXQiOA8=;
        b=cE6M+jIIm2JY5p5Gd+AJwb7gJD4EP8fNwBY5jsaBGDhUk5F47Jt1yWBILhG6/v01t9
         iPmhdwwrzBtw2x8aWbrqV+HzC2xg+2gh7HYHRgdMVVFmwVlzQ99Fm0baz8MI1lUb8qt3
         feihot3Aru7Q+6iAzlZo6vbOUk9At8lVccORWCmbwDzrqW4edMA5kmWyevdx4RhwEOse
         j2nkWQmsH5mFYVGNVninKWpd4zF8bX0AyOFpUcJTQkCpRidRU+wHEw2YrkiKp1EOy7/N
         MYYSS+KwJvlA2Z1fJAWGwWJKMEVN7VMuU3IXuwWy8k5VHpFEg0Mt4Bpdx+zIrmUUjzNd
         k8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=c+BAz5TKARnaA7ePcUOXjPEFWuKXdNXQbdrTJXQiOA8=;
        b=K4U+7K1Vwx0oZy565dBDm9bjC1st75rkzEoi6Jt4mdUCwMwIzPHzkzXpE90aSG1TtI
         zLuI1YskDCdjiQiw8LL3seudQNd7dT2LnZG84xLAGhzkUJ2M2wflL+u6KZTYnikl3TXW
         Hnod3xN6fhJAcrgtaf7cXKAS4x213HYVj2ywY/xaWb7KwYIEHZr3USMshOhp0XOGG21Q
         W2m6FHfTNsuaBY5Jy0G60aV0fFGk82U65GhZlCavZ/Zw8z8q36Jm727XKYwcN+zmHpLy
         nQJDj8LWGciGdeC/+qDtsLuqMakEuNmfuzPsNzEN+mrfyeoxuJyjF20coZjNcCnFEjWo
         4JSw==
X-Gm-Message-State: ACgBeo15/HbQqU69EbOEBnCpxo03AZ2jEVnWZHoMkFhERVbGZK+g05Dd
	uIO0jKdhCX9/1asRBNQ2haiA3Q==
X-Google-Smtp-Source: AA6agR5e7+jk6RNyxPoSGiPYTuNDPyAoTBhOV75Af0njmGE2v5/xj4Z02ryp1GDslTWJlAu/Y3EvVg==
X-Received: by 2002:a05:6512:1684:b0:47f:5f27:b006 with SMTP id bu4-20020a056512168400b0047f5f27b006mr7304537lfb.225.1661845352094;
        Tue, 30 Aug 2022 00:42:32 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id g6-20020a056512118600b00492d270db5esm1520758lfr.242.2022.08.30.00.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:42:31 -0700 (PDT)
Message-ID: <52336b1e-f0b3-c828-48ef-b6977fd90547@linaro.org>
Date: Tue, 30 Aug 2022 10:42:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4] regulator: dt-bindings: mediatek: add mt6366
Content-Language: en-US
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, eddie.huang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, fshao@chromium.org
Cc: sen.chu@mediatek.com, hui.liu@mediatek.com, allen-kh.cheng@mediatek.com,
 hsin-hsiung.wang@mediatek.com, sean.wang@mediatek.com,
 macpaul.lin@mediatek.com, wen.su@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220823123745.14061-1-zhiyong.tao@mediatek.com>
 <57d259cd-613b-a608-5b67-01aa72c2babb@linaro.org>
 <93bb8a3f7f5567cfe427ed067f68d5c8b6db776d.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <93bb8a3f7f5567cfe427ed067f68d5c8b6db776d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_004236_947119_559C8332 
X-CRM114-Status: GOOD (  13.59  )
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

On 29/08/2022 06:25, zhiyong.tao wrote:
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,mt6366-regulator
>>
>> This looks incomplete. How does it bind? Further pieces also suggest
>> you
>> send something incomplete.
> ==>
> 
> The project dts file(such as 8186-evb.dts) will add the compatible.
> The project dts file is examining.
> 

I don't understand this at all. I am not talking about DTS, but about
bindings which look incomplete. Although seeing entire DTS would
probably help understand the context.

(...)

>>
>>
>>> +        type: object
>>> +        $ref: regulator.yaml#
>>> +        unevaluatedProperties: false
>>> +
>>> +required:
>>> +  - compatible
>>> +  - regulators
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:

>>> +  - |
>>> +    pmic {
>>> +        compatible = "mediatek,mt6366-regulator";
>>> +
>>> +        regulators {
>>> +            mt6366_vdram1_reg: buck-vdram1 {
>>
>> Drop the labels here and further. Why you do not have here any
>> regular
>> constraints like min/max voltage?
> 
> we will add properties min/max voltag on project dts file.

Example should be complete. DTS does not matter here.

> 
>>
>>> +                regulator-ramp-delay = <12500>;
>>> +                regulator-enable-ramp-delay = <0>;
>>> +                regulator-allowed-modes = <0 1>;
>>
>> Where do you explain the meaning of modes?
> support pwm mode.

The question was "Where". Where did you explain them?

(...)

>>> +
>>> +            mt6366_vsim2_reg: ldo-vsim2 {
>>> +                regulator-enable-ramp-delay = <540>;
>>> +            };
>>> +
>>> +            mt6366_vcore_sshub_reg: buck-vcore-sshub {
>>
>> Empty node? What does it do?
> just define here, we will add properties on project dts file.

How is it related to bindings?

Best regards,
Krzysztof

