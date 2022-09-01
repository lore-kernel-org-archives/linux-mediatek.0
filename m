Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0456EECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 09:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyGoLGFYlRzNkjYzyQzXdAYg9tduOqgaIixq4gRNrZI=; b=nwdaZOCnoCB09WjYsssGULeAFM
	6pyLRgIR2FJw4j5/DnsEV7lkfZwf3B6Gmqa3VeD5vd1V2ykSfD794n6LQO5FLErkGs4YnZCw8HgCX
	QbPHp2hN8LyAQDYjsfw/fNhyOlaSNm1JMN9Ohja/bDJgglivOBFd81PLK8XEQGsoyZ0nYcTPdM1ZC
	POf44Bevs52FqxjeDavCwLAExYFnsyYGOZLvh9X+xQLG31nxxnChC5yQychgDk+kljesRWgOtq6lW
	UnM8FpEH09pVzkdY23QAeOokhHjZi3pIE38Ec2Y/7uMyCmNfYg719IrtU8t+ZFwd7ZWnTuVAfCPWy
	J1a9CNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTgiU-00ArRU-Kx; Thu, 01 Sep 2022 09:42:30 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTgiK-00ArQI-1l
	for linux-mediatek@lists.infradead.org; Thu, 01 Sep 2022 09:42:21 +0000
Received: by mail-lj1-x235.google.com with SMTP id k18so10883716lji.13
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Sep 2022 02:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=cyGoLGFYlRzNkjYzyQzXdAYg9tduOqgaIixq4gRNrZI=;
        b=TJM+qgmP78WPN0RndE/VLYhAoBjYJOv6Rag8VK3jR+6uYbzVVFP7H4fE8lYtddG60v
         +FuxG9+2oHabfVV2pV0BUo4GYP1hjrkAHTazM9MblE1gyYGCP3WbXNxkucKTjecG5Xh/
         t8ppcXv6JkrVF8PdMAw6yp8BfQW9+eyYqh/SyuoVqGNNmvXDyEDdAXmceliP3aOs0Bbj
         Xom2MXL96es2KYOZLpX590vsc1P2VsZyuO1WYTu8YRIeqyaargB4vTtwu3rk0u9fQpub
         f484fVUj4Hj3x5AMjyEp89YJpKWY5H9Kxt5y+tOU4G9zgjdrlnUVOQ+ZsEFtN0enJL4x
         83ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=cyGoLGFYlRzNkjYzyQzXdAYg9tduOqgaIixq4gRNrZI=;
        b=JXpANjI6tzH6vRy7RJ1Z4qUe2qeY3Ufh38S7JFusfdPGTLOauwNZc5r1Egb+h74DMZ
         5MFXYcz5HyIofzt82U7LpMkFjsmVPOefDpH3FJ9ry2nuVJLgSX1Fp5Jf3+42IWPn+beN
         e9cplhQFTbs4ZX/LA4a7VeRR2WbTMub2roGU3CClfvy74sQZKIXemTeReHNSmV7ouXNf
         J3+U8BNo0frJZdBrflnwJeuWRaCHErRCc2nn0NAyHptIU3ppr9V6oOnjiviSbeKCbAn4
         Ir9anV9j/99BfxpPDcjyMbzZp4QhzwRmqU9ul5EjEw0+7eSl6/o9314reMjIyoZ2WL0Y
         PAoQ==
X-Gm-Message-State: ACgBeo3uXO04BiPTuQW4XrAwDnpu3Psqh+PPvvEENygzr0c7cum49/7t
	KXz+afsZedISsqswvGtNTBRWqQ==
X-Google-Smtp-Source: AA6agR41jeZpevY4b5EMQDTYDrqO8wPCUCqUani6cv6z6SYnfuyTde+XLqs0U9nLZQgJVkuXdjSAVA==
X-Received: by 2002:a2e:3317:0:b0:264:6516:93ce with SMTP id d23-20020a2e3317000000b00264651693cemr5716037ljc.212.1662025337680;
        Thu, 01 Sep 2022 02:42:17 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id h18-20020a056512221200b00492f294f06bsm993545lfu.110.2022.09.01.02.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 02:42:16 -0700 (PDT)
Message-ID: <38910de5-89ad-e7a1-261f-18b51c8e7877@linaro.org>
Date: Thu, 1 Sep 2022 12:42:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20220831124850.7748-1-johnson.wang@mediatek.com>
 <20220831124850.7748-3-johnson.wang@mediatek.com>
 <b1296c37-5283-81f7-1939-7ea20e1f4d0d@linaro.org>
 <1fae0c47-fff9-89e9-c849-536d167d741d@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1fae0c47-fff9-89e9-c849-536d167d741d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_024220_099850_25E8ECF1 
X-CRM114-Status: GOOD (  22.64  )
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

On 01/09/2022 11:04, AngeloGioacchino Del Regno wrote:
> Il 31/08/22 15:19, Krzysztof Kozlowski ha scritto:
>> On 31/08/2022 15:48, Johnson Wang wrote:
>>> Add the new binding documentation for MediaTek frequency hopping
>>> and spread spectrum clocking control.
>>>
>>> Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
>>> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
>>> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
>>> ---
>>>   .../bindings/arm/mediatek/mediatek,fhctl.yaml | 49 +++++++++++++++++++
>>>   1 file changed, 49 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
>>> new file mode 100644
>>> index 000000000000..c5d76410538b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
>>> @@ -0,0 +1,49 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,fhctl.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek frequency hopping and spread spectrum clocking control
>>> +
>>> +maintainers:
>>> +  - Edward-JW Yang <edward-jw.yang@mediatek.com>
>>> +
>>> +description: |
>>> +  Frequency hopping control (FHCTL) is a piece of hardware that control
>>> +  some PLLs to adopt "hopping" mechanism to adjust their frequency.
>>> +  Spread spectrum clocking (SSC) is another function provided by this hardware.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,fhctl
>>
>> You need SoC/device specific compatibles. Preferably only SoC specific,
>> without generic fallback, unless you can guarantee (while representing
>> MediaTek), that generic fallback will cover all of their SoCs?
>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  mediatek,hopping-ssc-percents:
>>> +    description: |
>>> +      Determine the enablement of frequency hopping feature and the percentage
>>> +      of spread spectrum clocking for PLLs.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>> +    items:
>>> +      items:
>>> +        - description: PLL id that is expected to enable frequency hopping.
>>
>> So the clocks are indices from some specific, yet unnamed
>> clock-controller? This feels hacky. You should rather take here clock
>> phandles (1) or integrate it into specific clock controller (2). The
>> reason is that either your device does something on top of existing
>> clocks (option 1, thus it takes clock as inputs) or it modifies existing
>> clocks (option 2, thus it is integral part of clock-controller).
>>
> 
> FHCTL is a MCU that handles (some, or all, depending on what's supported on the
> SoC and what's needed by the board) PLL frequency setting, doing it in steps and
> avoiding overshooting and other issues.
> 
> We had a pretty big conversation about this a while ago and the indices instead
> of phandles is actually my fault, that happened because I initially proposed your
> option 2 but then for a number of reasons we went with this kind of solution.
> 
> I know it's going to be a long read, but the entire conversation is on the list [1]
> 

Sorry, but it's a hacky architecture where one device (which is a clock
provider) and second device have no relationship in hardware description
but both play with each other resources. That's simply not a proper
hardware description, so again:

1. If this is separate device (as you indicated), then it needs
expressing the dependencies and uses of other device resources.

2. If this is not a separate device, but integral part of clock
controller, then it would be fine but then probably should be child of
that device.

Best regards,
Krzysztof

