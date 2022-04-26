Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EDCC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 10:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ujsvf8OHKoucW0NOl1u//K81DA7a+s2i/IXAGAjKEkE=; b=oIBAOJaEHIzgDy
	MhjtKPJJEP/pVPHoXcv518i51xPylhfmwwVhtvir9wYcIhBClnVjpsAgmGaC6xQjfBG9D3n0dyaGL
	I1PhrtAW+uX+LG2UVQs+piaFzZLnAoRFbsDtuyWH3K6FZzeavhcOOILO4yiXs+i7EptXamk2/49Lo
	f8G5XO2RNHPJUEU54P9AZrB4aNgXNHREDSQZzODm2FGDtRyanAGcxKu5IbgOqu2Gl+wnOAbaBrb0Q
	cRjWaj0pjqTMDnBaxVEcQ3TLONxRpk9vR1o8I1YyWywrxIpqLdW2cXuqeZxxZdPI1qfH9xrW8V9rC
	PJLCMWrhNY2l+tjyLQWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njIDL-00DmRQ-2C; Tue, 26 Apr 2022 10:14:35 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njID7-00DmOO-E3
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 10:14:25 +0000
Received: by mail-ed1-x529.google.com with SMTP id g20so21714125edw.6
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 03:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WEXN1t7ubH+gtw/X1CNNy7ELjLR2i3reCZLd9O1FBYk=;
 b=XkTZzcP1NA8r6J39I3IH3gxgg3mWq9+TMIJ0gnwlBPmWM73klA1urefWKXfbVTTLsA
 FxP14gZWooR+oVmq/KiFlcrBwRLqZ1kRBTcAjrULKbu6U3KluMAjslZJEOM9+C+XQUS4
 k2JLYHxXamHAJe86WQwruBnkKVv9loxOeIsB7POlDlr5aLDR/R8ALDqxxu5TFFQ3yEvg
 mm02PlGtReJeNklDIYy15loxzVEFFSK+i+BpnmACvNW91X+c8lJ5qjlyhpQoUs43gMyX
 xrjT9PJfBSCb3/MF4bKnxt6xPfrrTI2PH/MIkdZUMfXZP3E1T2gMygkN3qaTfhVj+RfY
 8wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WEXN1t7ubH+gtw/X1CNNy7ELjLR2i3reCZLd9O1FBYk=;
 b=6pJjXKBfv3sTsdn9AjlThcU/z/K35Mvh20N+Y1mAGUml7/2BmV3QyoAT4RL4Te9nzs
 TQYq0MiIAah+Ski/xUTiXrTVWLe74VHqI1ErUsQ+sv37cwaVQJGyZDjA4NYAzhbdqg93
 KbJyPVLXr8noU7odIqxpteAyC/Mk1YWPofnk0Ng/0vG4/H9zKRqBOO5SsSYnsxhORkwD
 j1TplY0vnaXgwjoxeTiioo+TBPi2RlnucWVEp79QjGrc9KBFV4oEbZ7FybWjMY9TeYr4
 xB+NeRC4eZ41mqAYgs/ROcEq3EddPabqGBcA5qlwFoMVjj5IL4V/skElqLDyWJe8zzac
 egnw==
X-Gm-Message-State: AOAM531TLNCE7bHpphjBVMpCPSunQ9KP5l/eYxTvAIuhlO6V0We5KTcC
 WuHpeaFzskQayB+bs3W3Z1F+eqnf7bMDNQ==
X-Google-Smtp-Source: ABdhPJzBvEzoUy80duOGd6lmNz9QaRAZa27AAVAV5OcGkc0kR7km27bkSYWldPb0k7W8TuCvOw3IrQ==
X-Received: by 2002:a05:6402:458:b0:418:78a4:ac3f with SMTP id
 p24-20020a056402045800b0041878a4ac3fmr23497498edw.196.1650968059705; 
 Tue, 26 Apr 2022 03:14:19 -0700 (PDT)
Received: from [192.168.0.248] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 u4-20020a1709060b0400b006f391c5b37csm2363452ejg.82.2022.04.26.03.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 03:14:19 -0700 (PDT)
Message-ID: <89609af9-5feb-0553-5e39-c97c4750b5a1@linaro.org>
Date: Tue, 26 Apr 2022 12:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/1] dt-bindings: nvmem: mediatek: Convert mtk-efuse
 binding to YAML
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lala Lin <lala.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
References: <20220425084800.2021-1-allen-kh.cheng@mediatek.com>
 <20220425084800.2021-2-allen-kh.cheng@mediatek.com>
 <e64bdca8-7b18-b450-830c-ca07946a73fb@linaro.org>
 <9d65b713e3ffdd34dcca532c4c97fa98b124bde4.camel@mediatek.com>
 <0169c4ac-fdce-29b7-553a-14dc7df532d1@linaro.org>
 <a8e212a0e0449e015a33e76b320266376d4b9be6.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a8e212a0e0449e015a33e76b320266376d4b9be6.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_031423_840584_3EA9FFEF 
X-CRM114-Status: GOOD (  20.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26/04/2022 12:02, allen-kh.cheng wrote:
> Hi Krzysztof,
> 
> On Tue, 2022-04-26 at 08:31 +0200, Krzysztof Kozlowski wrote:
>> On 26/04/2022 08:23, allen-kh.cheng wrote:
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    oneOf:
>>>>> +      - enum:
>>>>> +          - mediatek,mt8173-efuse
>>>>> +          - mediatek,efuse
>>>>
>>>> Still no changes...
>>>>
>>>
>>> I just want to confirm again.
>>>
>>> "Generic compatibles should not be used standalone"
>>>
>>> It seems we should remove mediatek,efuse and keep "mediatek,mt8173-
>>> efuse"in binding. have I got that right?
>>
>> You should comment for which chipsets this compatible is and add a
>> deprecated:true. In such case it cannot be part of enum but separate
>> item in this oneOf.
>>
>>
>> Best regards,
>> Krzysztof
> 
> Thanks for your suggestions, I would plan to send PATCHs as below,
> 
> We have a PATCH 01 for current accepted dts
> 
> properties:
>   compatible:
>     oneOf:
>       - enum:
>         - mediatek,efuse
> 
>         - mediatek,mt8173-efuse
>         description: Only mt8173-efuse
> with generic fallback should be used
>       - items:
>           - enum:
>     
> - mediatek,mt7622-efuse
> 			  ...
>           - const: mediatek,efuse
> 
> Then add PATCH 02 to deprecate it
> 
> properties:
>   compatible:
>     oneOf:
>       - enum:
>         - mediatek,efuse
>         - mediatek,mt8173-efuse
>         deprecated: true
>         description: The mediatek,efuse is a generic fallback for other
> Chipset. Do not use the single compatible such as mediatek,efuse
> or mediatek,mt8173-efuse. It is deprecated.
>       - items:
>           - enum:
>               - mediatek,mt7622-efuse
>               ...
>           - const: mediatek,efuse
> 
> 
> PATCH 03 for 8173
> 
> update mt8173.dtsi 
> 
> change compatible from "mediatek,mt8173-efuse" to "mediatek,mt8173-
> efuse", "mediatek,efuse";
> 
> 
> Do you think it'd be okay ?

The idea is correct, but as I said it cannot be part of enum, but
separate item in oneOf. You should see an error when testing your patch.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
