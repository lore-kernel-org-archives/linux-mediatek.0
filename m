Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8BEC77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 15:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtvEF7ctih6jlBUmz6x/cmRorGRIdeQUmzhDbFqzUMQ=; b=PucOqhbXCqpOQWBry/ShMdguPH
	pIeC2UCPAgGgXOwdoptSpLsogHeY13rfDT+9I7F8MBc712NSmwPWl3OaEV+dP6iiq/TB2iBFh6KgY
	doLOweCgrYGloxMMFj3yV+MfwcNAttpu6TlrjSgqn4l0mOjfJsRpt35ZBYr5XkD5skAa4e65LHy/B
	nAv8vrHU+0xleV4NLNezA1xs5V08higC2ZzAfNBxbIMZZcyH9kexOSQBjbvn8SCs97V5CsFHzSDlM
	5u+3DjZJ4fYZ/qNQno3D99UKw2spaKrMoOvJbOvZQ/IQ3ky+MtDHlH5nob5mlvMFZUHenbAYL6a98
	4Q3ahc/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLMm-009yAH-32;
	Fri, 14 Apr 2023 15:29:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLMk-009y8U-0j;
	Fri, 14 Apr 2023 15:29:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id hg25-20020a05600c539900b003f05a99a841so17937696wmb.3;
        Fri, 14 Apr 2023 08:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681486169; x=1684078169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtvEF7ctih6jlBUmz6x/cmRorGRIdeQUmzhDbFqzUMQ=;
        b=qGZQxhLElmhzJf9nLKo4r6pq51rc+4IyPDfzuvQ3gAUsJ6/Y65MzYa6I9BK0cz9KNF
         stVUm/P2RdtVbOU1aGZISu5RMETCa/RffUliJ/MLHAEFLdSbyckAoXSVsH6b9egMRFIX
         TgVSJX6L1Sg9SQ1eoWC/gn+tM235APmaoraCI2vruVNVLxcPKdTNrq841NStrTlE2/p1
         wn7pTiP/S1Sy9RZ3VuwaDcRD92ap89W6450zE890yMDyXbzlcfczRj1CUBKYWmwMA9la
         OHvDTRrPJPEIwLRPvasejlfJEFC2FhHQ95rmoy2cI6HgM8WEm8kENox7BXc2E+oOIXVK
         BoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681486169; x=1684078169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HtvEF7ctih6jlBUmz6x/cmRorGRIdeQUmzhDbFqzUMQ=;
        b=ioXKnPp4fg47QOrWOiVtnEooh/t2Xs+7HzCVR4FewmT6VpBhxg6J6LOqnNB0JMJc+9
         SDRjZgLRadzBgYfRD3w8hghv5WEWQfHhiewuaF+T9ta1TCeF1Gop6OJ0SGPiJ+N5lpbQ
         2nNcW2ZIAGqJQZD8q5BV1V8MAIKsE74u/47GjTe9JO0tLWKhVo4VCjsBiJa6IqbwrIAk
         yIQ+q+cmQ5p3Q97aPG+xBX57OvJgOSOigFZq/+oo6lvFC/luA0ubxRTA1RO/5cLhdWKB
         LBWD538EFVjEi4GIIukrrY6MCzWRLlewM2/BNZzldeZl6vDfjzDp79rqK5avI8LTDlR+
         jrjw==
X-Gm-Message-State: AAQBX9eNJug/tApkFtGCIrGydJiMrg4XYyBj7tMdwz1IyUpsHBkVQOSX
	5Q4bGA07B+opO6X9tJeYItY=
X-Google-Smtp-Source: AKy350baTmaodBGZvLaW/t3L808sxui2s3mXy0yd4/BPSh2Or7HSibikk/nbTxRns3ESdPZBy2bm3g==
X-Received: by 2002:a05:600c:2904:b0:3ee:3df6:e411 with SMTP id i4-20020a05600c290400b003ee3df6e411mr4750042wmd.28.1681486168723;
        Fri, 14 Apr 2023 08:29:28 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i8-20020a05600c354800b003f15e5a16b1sm880791wmq.30.2023.04.14.08.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 08:29:27 -0700 (PDT)
Message-ID: <a2dcebee-7a2a-08b1-a35a-45a4a08c9d26@gmail.com>
Date: Fri, 14 Apr 2023 17:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 2/6] dt-bindings: hypervisor: Add binding for MediaTek
 GenieZone hypervisor
Content-Language: en-US
To: =?UTF-8?B?WWktRGUgV3UgKOWQs+S4gOW+tyk=?= <Yi-De.Wu@mediatek.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?WWluZ3NoaXVhbiBQYW4gKOa9mOepjui7kik=?=
 <Yingshiuan.Pan@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "will@kernel.org"
 <will@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TVkgQ2h1YW5nICjojormmI7ouo0p?= <MY.Chuang@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?UGVpTHVuIFN1ZWkgKOmai+WfueWAqyk=?= <PeiLun.Suei@mediatek.com>,
 =?UTF-8?B?TGlqdS1jbHIgQ2hlbiAo6Zmz6bqX5aaCKQ==?=
 <Liju-clr.Chen@mediatek.com>, =?UTF-8?B?SmFkZXMgU2hpaCAo5pa95ZCR546oKQ==?=
 <jades.shih@mediatek.com>, "dbrazdil@google.com" <dbrazdil@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?U2hhd24gSHNpYW8gKOiVreW/l+elpSk=?= <shawn.hsiao@mediatek.com>,
 =?UTF-8?B?TWlsZXMgQ2hlbiAo6Zmz5rCR5qi6KQ==?= <Miles.Chen@mediatek.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 =?UTF-8?B?SXZhbiBUc2VuZyAo5pu+5b+X6LuSKQ==?= <ivan.tseng@mediatek.com>,
 =?UTF-8?B?WmUteXUgV2FuZyAo546L5r6k5a6HKQ==?= <Ze-yu.Wang@mediatek.com>
References: <20230413090735.4182-1-yi-de.wu@mediatek.com>
 <20230413090735.4182-3-yi-de.wu@mediatek.com>
 <8ace9b0f-742a-7ebc-555f-1f8be04a5955@linaro.org>
 <7b4492efa4a1becbdfb79d23a0a0c0fe11dba5f4.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <7b4492efa4a1becbdfb79d23a0a0c0fe11dba5f4.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_082934_267443_8120F8F0 
X-CRM114-Status: GOOD (  22.13  )
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



On 14/04/2023 10:35, Yi-De Wu (吳一德) wrote:
> On Thu, 2023-04-13 at 15:05 +0200, Krzysztof Kozlowski wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On 13/04/2023 11:07, Yi-De Wu wrote:
>>> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
>>>
>>> Add documentation for GenieZone(gzvm) node. This node informs gzvm
>>> driver to start probing if geniezone hypervisor is available and
>>
>> Subject: drop second/last, redundant "binding for". The "dt-bindings"
>> prefix is already stating that these are bindings.
>>
> Thank you for the review comments. We would remove the "binding for"
> wording in the subject on the next version.
> 
>>> able to do virtual machine operations.
>>>
>>> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
>>> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
>>> ---
>>>   .../bindings/hypervisor/mediatek,gzvm.yaml    | 30
>>> +++++++++++++++++++
>>>   1 file changed, 30 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/hypervisor/mediatek,gzvm.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/hypervisor/mediatek,gzvm.yaml
>>> b/Documentation/devicetree/bindings/hypervisor/mediatek,gzvm.yaml
>>> new file mode 100644
>>> index 000000000000..35e1e5b18e47
>>> --- /dev/null
>>> +++
>>> b/Documentation/devicetree/bindings/hypervisor/mediatek,gzvm.yaml
>>> @@ -0,0 +1,30 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id:
>>> https://urldefense.com/v3/__http://devicetree.org/schemas/hypervisor/mediatek,gzvm.yaml*__;Iw!!CTRNKA9wMg0ARbw!lp4d4WBp26cpOeEGcKn_aHcNGfyl1Y--BYzfR8oR_0Xzr9TLvUELfOQAAdqHlLIOra1W_QdjVSJv0-HMpLesJmA3TPJSag$
>>> +$schema:
>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!lp4d4WBp26cpOeEGcKn_aHcNGfyl1Y--BYzfR8oR_0Xzr9TLvUELfOQAAdqHlLIOra1W_QdjVSJv0-HMpLesJmDSXil_Qw$
>>> +
>>> +title: MediaTek GenieZone hypervisor
>>> +
>>> +maintainers:
>>> +  - Yingshiuan Pan <yingshiuan.pan@mediatek.com>
>>> +
>>> +description:
>>> +  GenieZone is MediaTek proprietary hypervisor. This device node
>>> informs its
>>> +  driver, gzvm, to probe if platform supports running virtual
>>> machines.
>>
>> Do not describe Linux, we all know how driver binding works, but
>> hardware/firmware/hypervisor.
>>
> Noted. We would enhance the description on next version.
> 
>> I don't know if we actually want to support proprietary hypervisors.
>> There can be hundreds of them, one per each SoC manufacturer, and
>> they
>> can come with many ridiculous ideas.
>>
> MediaTek, as a partner of Android, our GenieZone hypervisor has been
> one of the backend options under Android Virtualization Framework(AVF)
> now.
> Thus, we'd like to donate these patches for better supporting the
> Linux/Android ecosystem.
> 
> Reference link: https://crosvm.dev/book/hypervisors.html#geniezone
> 

What is the difference between geniezone and gunyah? Why will we need both of 
them? Couldn't we just get one hypervisor implementation merged that includes 
all the needed features. In the end it will be used with the same VMM.

Regards,
Matthias

>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,gzvm
>>> +
>>> +required:
>>> +  - compatible
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    hypervisor {
>>> +        compatible = "mediatek,gzvm";
>>> +        status = "okay";
>>
>> Drop status.
>>
>> Best regards,
>> Krzysztof
>>

