Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6217C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 14:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Bnc98wbgCB157XtXlJ5NroBNxycOACeQVxm/1SPVs4=; b=rgOomSBxxz+BDo45emn2yvVJwC
	cTbcALTF4l35pCJBf2HKkXR+UzasaPF3wKaI6jywv3B3Kf+ByYJtLy9bM9hNqnLOWWFZNBbTJEyQD
	H3qnAjnB5Qv1gr7c6z0Te++GHDOErTaGtfZPEnj0UcPOkRqFgWOp4Z7Pd97hwc0MkaGmFyM6LSlwJ
	mNHe2IPEXWE2DVMjq2ewyrNki4ZnbaXkjkprQIfehOFJsJKIILD5NyzD+jRQqhm0jmcF8a9Qx510d
	Dm7TWWOGQ4NxORbFThcuH1rZr0lPagQrwGOscuwDcaa4oeCuX7L6iFOUcFNHxEhk03Vqkto9a99jx
	iDNun/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot8Jv-006IE6-1g; Thu, 10 Nov 2022 14:14:19 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot8Jj-006I69-A1
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 14:14:08 +0000
Received: by mail-lf1-x131.google.com with SMTP id be13so3496884lfb.4
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Nov 2022 06:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Bnc98wbgCB157XtXlJ5NroBNxycOACeQVxm/1SPVs4=;
        b=Rc8RZYG1UdjHBqHXSpcw7c7Fl3OJIs+mgExR8ZEe+5iDezQTN7XCfKOzGLV02/GFzS
         f/trH0orM0q51kSUF73Jh+5teXTHMGgop3zKei6pVMxbmjbWjTYs9lq2vQs2RnjphnQ3
         LgSP8Bc4k/E3y8YRK+/mnx8OBi+H+tM54YOVRgKfdccfzllR8qzxjpbYGQH0mCZgOhUe
         UhMDSyIlPoNcKmkFND1CIVA6MF+tt9bS735B5d2iMMgsDtOchwiUlt5TpwtcsjOobjzs
         HDfDXm+QzsaftiReSvZqrCYSwatcVOQ01Beaep3NFZlgzJJJpUKFonaZqqpxfM3s9B+V
         yfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Bnc98wbgCB157XtXlJ5NroBNxycOACeQVxm/1SPVs4=;
        b=7A5ERHgnxmz/NlW6Glqcai6Udo2x/gLqM2tBUxbiTBDU21RMItl4sT7JjpEMybG1MN
         ObxylYlegQQWhwB0w91/VGxnqKnbXw41w0KtoqjOHwSdwnTvQZTNRfdmCDjVe3YA0741
         twXqIWf/ugdKLnrFm7MsmhwjNULu+iNDf0rEA/wlrUx42qgmNpuRpft1x15uHB8juFrz
         kxb4cfB7dCh3zi8xuK9htIUpYLonItPZdCv24oQcrNUXWEj+p7eBPbBiimBbrcXLKiCG
         pNv2hYRpomvSfXLMoOA8ktiZPLzg4l+YoKfOuL73y6p6kq80MNxBef6BhJ7HXKafwZxp
         rrQg==
X-Gm-Message-State: ACrzQf1r91Hao1D4pMLUgVhgBB2xwziiPXTF8nRSF13P0QzAsJVGpfEi
	dbeNm3ZQ2iM7QRJMcCytmOfqEg==
X-Google-Smtp-Source: AMsMyM4Zc2mDjlY+RRgIUEdLQhsv+UxcTsSgJuQjuIQHS1FrmkKKXs/oNCb5HFgDi7jqXQw2KQ4odg==
X-Received: by 2002:a05:6512:32b7:b0:4aa:8d5a:2f53 with SMTP id q23-20020a05651232b700b004aa8d5a2f53mr21028085lfe.362.1668089643827;
        Thu, 10 Nov 2022 06:14:03 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id r26-20020ac25c1a000000b00499aefcf68esm2746842lfp.292.2022.11.10.06.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 06:14:02 -0800 (PST)
Message-ID: <adf8bc44-4cbc-af2a-4ec8-1859a98146d7@linaro.org>
Date: Thu, 10 Nov 2022 15:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-rtc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
 <20221109222916.GA2985917-robh@kernel.org> <Y2wwUOJ0KZdt1tZ6@mail.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y2wwUOJ0KZdt1tZ6@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_061407_399596_29CAFFD9 
X-CRM114-Status: GOOD (  16.91  )
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

On 09/11/2022 23:57, Alexandre Belloni wrote:
> On 09/11/2022 16:29:16-0600, Rob Herring wrote:
>> On Tue, Nov 08, 2022 at 07:43:37PM +0100, Alexandre Mergnat wrote:
>>> - Convert rtc/rtc-mt6397.txt to rtc/mt6397-rtc.yaml
>>> - Add mediatek,mt6357-rtc compatible.
>>> - Add maintainer
>>> - Remove the .txt binding file
>>>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>> ---
>>>  Documentation/devicetree/bindings/mfd/mt6397.txt   |  2 +-
>>>  .../bindings/rtc/mediatek,mt6397-rtc.yaml          | 40 ++++++++++++++++++++++
>>>  .../devicetree/bindings/rtc/rtc-mt6397.txt         | 31 -----------------
>>>  3 files changed, 41 insertions(+), 32 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
>>> index 0088442efca1..79aaf21af8e9 100644
>>> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
>>> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
>>> @@ -33,7 +33,7 @@ Optional subnodes:
>>>  		- compatible: "mediatek,mt6331-rtc"
>>>  		- compatible: "mediatek,mt6358-rtc"
>>>  		- compatible: "mediatek,mt6397-rtc"
>>> -	For details, see ../rtc/rtc-mt6397.txt
>>> +	For details, see ../rtc/mediatek,mt6397-rtc.yaml
>>>  - regulators
>>>  	Required properties:
>>>  		- compatible: "mediatek,mt6323-regulator"
>>> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
>>> new file mode 100644
>>> index 000000000000..bb48c0150f95
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
>>> @@ -0,0 +1,40 @@
>>> + # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/rtc/mediatek,mt6397-rtc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek MT6397/MT6366/MT6358/MT6357/MT6323 RTC
>>> +
>>> +maintainers:
>>> +  - Alexandre Mergnat <amergnat@baylibre.com>
>>> +
>>> +description: |
>>> +  MediaTek PMIC based RTC is an independent function of MediaTek PMIC that works
>>> +  as a type of multi-function device (MFD). The RTC can be configured and set up
>>> +  with PMIC wrapper bus which is a common resource shared with the other
>>> +  functions found on the same PMIC.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - mediatek,mt6323-rtc
>>> +      - mediatek,mt6357-rtc
>>> +      - mediatek,mt6358-rtc
>>> +      - mediatek,mt6366-rtc
>>> +      - mediatek,mt6397-rtc
>>
>> As this is only a compatible string, just fold this into the MFD schema 
>> doc.
> 
> Actually, it probably also supports the start-year property

What about rest of rtc.yaml schema?

Best regards,
Krzysztof


