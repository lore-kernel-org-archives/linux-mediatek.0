Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB68BC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9j8GQrtbHhtegURmxB3PLCY1oXF2JoBLNnpXVqbpVM=; b=s+Q0JwoSUpbz8xxy2MhMlH3iIx
	vJmZdfXAAaS1UOLs2clHoyNmmtl69lb7E+PQTysubz8TJhu4BONkTmvWpHgNJ+VkHfJAiIJ92ZYSh
	rezLmSHq6HHUofkccK1yn9y4tTpsvUaFbLoVaH5CWnuagJtfVIBfuJEPwhcrWFutw5oq8ZWmtdbtX
	EkvzcQ1j0YIgdZZjxTMo4lR1EfrechgcAeupJEQPInZg/pXndw6LkqEmLwpYCqls6W84nNn3KSCAz
	fz5tYrDt8HSZRhpWrACQeMu5u2eHVbOic3E6rfrSV7HI0lUEg1RkbBry7PwZn9wmv6BpHd66aMOQ1
	mVhNS+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pch8w-00FMkW-2M;
	Thu, 16 Mar 2023 06:31:18 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pch8t-00FMif-1J
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Mar 2023 06:31:16 +0000
Received: by mail-ed1-x52f.google.com with SMTP id r11so3452707edd.5
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Mar 2023 23:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678948273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r9j8GQrtbHhtegURmxB3PLCY1oXF2JoBLNnpXVqbpVM=;
        b=DOE9hQAN6fOzn+o/ztsM5Jcw8cu/mQ/ARao0w4j1eT+bb2zW1Xf1pXHcKozM34BjwH
         iKpgLf9MjQWOBtBd7/9zvdrkX/O35KFOZH85Z4gemDZnNQwPlBAK515ba3PRctbm/MP5
         2w4qPBdmYjd1M9ZcrKkGxQE2VBsQ46hedHLo0AEol6nOoPcn7QmYTaZrnQ9SSIAzlJTo
         zc0M3tsia2kxJnZCJfV6893dKtPlRMCgQ/Eq8fl351N5NBuZgN825b/9mPvKOskwKuci
         Pl1rHnJFP+3SIZEXJ2KeWnkucKJnEnWEJfJrco2K3ltS/H3ifTat5/wpXrhYStl05lA7
         UHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678948273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9j8GQrtbHhtegURmxB3PLCY1oXF2JoBLNnpXVqbpVM=;
        b=JieAuVs2XeLMhsZFAE7tP/DVrzFvi4uGmfrg2PS3RB1KQw3MFDAnl927Twicwv0ApQ
         Z5d95/YoodneKU8TtxlnTVzlkKxowxR93zM0Y8H6ItSAlY2j5yKdH9L5vzCvsBOyLpb5
         ssKgYEuYOPwhmWLncGkPqivU/YLt7s0mLKYmMglUwPr6C1WvB36LdRNMSpop+AAkiYsd
         5up8Gy0IZimjb+LHrbbRoqibIj0sDlw+rIRReRBsMjOAtZVYET5jgOuBKZL2WdAOiQ2R
         gzok6QL5w/eDMYYFCoekiCLjzAq8D8Um44HVSRclqTKAJmTtoN7QUtO0OQBoxA6tlGUq
         UQ8A==
X-Gm-Message-State: AO0yUKWLRNypmC+w1yyMIKH9td6ao6r+R4LqR/qkGdJ8qrCIM7Wpolwb
	Io47MsxGHyWy3odN+6o1z8k0vg==
X-Google-Smtp-Source: AK7set//6drX8/WV32h0Hq7ln8wNthIukaVT2fKbs7oH3weuhTKlatV+vwcvLqfs8GyzHamupsNjug==
X-Received: by 2002:a17:906:14c9:b0:8ab:4c4:d0f6 with SMTP id y9-20020a17090614c900b008ab04c4d0f6mr8694921ejc.56.1678948273080;
        Wed, 15 Mar 2023 23:31:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id oy17-20020a170907105100b008e385438c76sm3427088ejb.55.2023.03.15.23.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 23:31:12 -0700 (PDT)
Message-ID: <b04eb48e-c9aa-0404-33ec-bef623b8282f@linaro.org>
Date: Thu, 16 Mar 2023 07:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v29 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
To: =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
 <ck.hu@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
 <20221227081011.6426-2-nancy.lin@mediatek.com>
 <4aff6a7a3b606f26ec793192d9c75774276935e0.camel@mediatek.com>
 <2700bd6c-f00d-fa99-b730-2fcdf89089fa@linaro.org>
 <1d65e8b2de708db18b5f7a0faaa53834e1002d9f.camel@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1d65e8b2de708db18b5f7a0faaa53834e1002d9f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_233115_493123_8FFE2571 
X-CRM114-Status: GOOD (  21.13  )
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

On 16/03/2023 07:19, Nancy Lin (林欣螢) wrote:
> On Wed, 2023-03-15 at 08:16 +0100, Krzysztof Kozlowski wrote:
>> On 15/03/2023 04:45, Nancy Lin (林欣螢) wrote:
>>
>> Trim the replies and remove unneeded context. You want to get the
>> attention of other people, not force them to read entire email.
>>
>>>> +  mediatek,gce-client-reg:>> +    $ref:
>>>> /schemas/types.yaml#/definitions/phandle-array
>>>> +    description: The register of display function block to be
>>>> set by
>>>> gce.
>>>> +      There are 4 arguments in this property, gce node, subsys
>>>> id,
>>>> offset and
>>>> +      register size. The subsys id is defined in the gce header
>>>> of
>>>> each chips
>>>> +      include/dt-bindings/gce/<chip>-gce.h, mapping to the
>>>> register
>>>> of display
>>>> +      function block.
>>>> +    items:
>>>> +      items:
>>>> +        - description: phandle of GCE
>>>> +        - description: GCE subsys id
>>>> +        - description: register offset
>>>> +        - description: register size
>>>> +    minItems: 7
>>>> +    maxItems: 7
>>>> +
>>>
>>> Hi Rob and krzysztof,
>>>
>>> I got the two messages when running dt_binding_check [1]. This
>>> binding
>>> patch was sent previously in [2]. 
>>>
>>> If I remove the following items/minItems/maxItems in the
>>> mediatek,gce-
>>> client property, the two message disappear. I don't know what's
>>> wrong
>>> with the original syntax. Do you have any suggestions for this?
>>>
>>> -    items:
>>> -      items:
>>> -        - description: phandle of GCE
>>> -        - description: GCE subsys id
>>> -        - description: register offset
>>> -        - description: register size
>>> -    minItems: 7
>>> -    maxItems: 7
>>>
>>>
>>> [1].
>>> Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.e
>>> xamp
>>> le.dtb
>>> /proj/mtk19347/cros/src/third_party/kernel/v5.10/Documentation/devi
>>> cetr
>>> ee/bindings/display/mediatek/mediatek,ethdr.example.dtb: 
>>> hdr-engine@1c114000: mediatek,gce-client-reg:0: [4294967295, 7,
>>> 16384,
>>> 4096, 4294967295, 7, 20480, 4096, 4294967295, 7, 28672, 4096,
>>> 4294967295, 7, 36864, 4096, 4294967295, 7, 40960, 4096, 4294967295,
>>> 7,
>>> 45056, 4096, 4294967295, 7, 49152, 4096] is too long
>>>         From schema:
>>
>> This looks like known issue with phandles with variable number of
>> arguments. Either we add it to the exceptions or just define it in
>> reduced way like in other cases - only maxItems: 1 without describing
>> items.
>>
>>
>> Best regards,
>> Krzysztof
> 
> 
> Hi Krzysztof,
> 
> Thanks for the comment.
> 
> But I have several items for this vendor property in the binding
> example.

Do you? I thought you have one phandle?

> Can I remove maxItems? Change the mediatek,gce-client-reg as [1].
> 
> [1]
>   mediatek,gce-client-reg:
>     $ref: /schemas/types.yaml#/definitions/phandle-array
>     description: The register of display function block to be set by
> gce.
>       There are 4 arguments in this property, gce node, subsys id,
> offset and
>       register size. The subsys id is defined in the gce header of each
> chips
>       include/dt-bindings/gce/<chip>-gce.h, mapping to the register of
> display
>       function block.

No, this needs some constraints.

Best regards,
Krzysztof


