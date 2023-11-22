Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2923C61D92
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 08:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWZXWR10yN3RjItd4uVERoZZUJiKuZqt9/puLFdDo8c=; b=u21NeZhmhnEtfFOnQgLCwVB9y5
	UGp0HPYL6xzqnkm7eBIGUwctUNomSv1Uaxdmm3DKbvCRFM5QUpdbJAsrW3leNWb9DqHS7gpSCAy9f
	bCvLT7xYIZVRg+PQJvUEpF+eUKX5F5Wx/IpzPwoWESAC2AI6O99giNYye/Yw4spNLMOT3q3sXhW6t
	e77Czu3qymdltcy2SPlrbBjb4pBFxea9AM5nlzskCMNb36JnyqO1PSLzX8y4tFLb2TpNhuiqWvK9J
	M/Oy73+n0ZfDg1fcnx5Wyk8KBZTIC8W8rxZMGrVZwl0qlNH67PQzXwVEpZJ96VL1KnN2XKFAP4Xij
	fvBaKw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5iUJ-0012UL-25;
	Wed, 22 Nov 2023 08:21:35 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5iUG-0012Sq-1z
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Nov 2023 08:21:34 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a00cbb83c82so321593666b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Nov 2023 00:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700641291; x=1701246091; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dWZXWR10yN3RjItd4uVERoZZUJiKuZqt9/puLFdDo8c=;
        b=P5SSImFGAyBerz0OMEjBJW504S1kgbgCmb9jAdDebZagMtUAYwcs/m8o5Q1QLTAXlg
         EVmAGmpgI+U2s36YIG9xK1cSS4qeNr3QJTNRuOwUJSmgKnKrdyaoirno0oUfuPholU7C
         NyguEfPHGSsZ590s8+PksccylET/RdlVUOnJIMX6xw6P8/UCf/cXMaJjV3+4UvcYIUK6
         8t3GP6pThQjRKakzCe647JU5gXODF/gGBjkv3YhrJM3XfhOUpdYxca4Zg/VH0woEYO4w
         8F3x4g/rhP1R7AUjSVM7LHGWrUXQzbmgT9gXTejBcOd++yix/gYNR8qt4khtE62o++LR
         XM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700641291; x=1701246091;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWZXWR10yN3RjItd4uVERoZZUJiKuZqt9/puLFdDo8c=;
        b=R5DXE5KtVteewnhDmkk/KWE6QCRYJUpq1yX24DTtnJXRBZfTvU8TvZt0JeBI8ZEZ9+
         +R+HuvYRD8V+/ATXol8Vc3qXSMreCHcA0ktxvQqwas2bXdPv4rLXbqUMjOV16VF8h25d
         jZyQOrfs32dtf2PERW2jOOapCHkFr6RootFNW65tUkwav7sHcjnGkKU45ZgUCXZNld/x
         b4QW8w6sW6++ljS+FzMRyIx7tXlv8SJt9gh998RtiuVrMYYH/C/HCcywb/4rizvghqKb
         JzFDlDG6N58wyrCFs5zC+yp4D/2wrZE55nrYrWZHwRjf1fc4JVjUWs3CBGXHClUc4tR2
         OoaQ==
X-Gm-Message-State: AOJu0YypjKkXxCrjh2C+ZITFWn/jscgJs74Fa9EcoqskNzZpt5NM3cmI
	HrIOPJrWDG5mRreV0bNPEvuF7Q==
X-Google-Smtp-Source: AGHT+IGimlEAf2nqN7DdSTRsvU00zMY71afscJi/CVlHORRd9wbC6UZk2rO3GUlFA+T+gwzhBkLv6A==
X-Received: by 2002:a17:907:cbc9:b0:a00:1c9a:a472 with SMTP id vk9-20020a170907cbc900b00a001c9aa472mr1438483ejc.7.1700641291154;
        Wed, 22 Nov 2023 00:21:31 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id g1-20020a170906538100b009fef7d22c98sm3269289ejo.35.2023.11.22.00.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 00:21:30 -0800 (PST)
Message-ID: <7232a48b-b9ad-44b5-ae6a-d12dad70b3c4@linaro.org>
Date: Wed, 22 Nov 2023 09:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: wens@kernel.org
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Davis <afd@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com>
 <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
 <CAGb2v64Vf5dDwq=KTrxwc=+w+0KUD2KVPMjmHg68Y_yukES5dQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAGb2v64Vf5dDwq=KTrxwc=+w+0KUD2KVPMjmHg68Y_yukES5dQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_002132_660356_40FDB175 
X-CRM114-Status: GOOD (  20.35  )
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

On 22/11/2023 09:09, Chen-Yu Tsai wrote:
> On Wed, Nov 22, 2023 at 4:05 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 21/11/2023 14:50, Rafał Miłecki wrote:
>>>> +Order of Nodes
>>>> +--------------
>>>> +
>>>> +1. Nodes within any bus, thus using unit addresses for children, shall be
>>>> +   ordered incrementally by unit address.
>>>> +   Alternatively for some sub-architectures, nodes of the same type can be
>>>> +   grouped together (e.g. all I2C controllers one after another even if this
>>>> +   breaks unit address ordering).
>>>> +
>>>> +2. Nodes without unit addresses should be ordered alpha-numerically by the node
>>>> +   name.  For a few types of nodes, they can be ordered by the main property
>>>> +   (e.g. pin configuration states ordered by value of "pins" property).
>>>> +
>>>> +3. When extending nodes in the board DTS via &label, the entries should be
>>>> +   ordered alpha-numerically.
>>>
>>> Just an idea. Would that make (more) sense to make &label-like entries
>>> match order of nodes in included .dts(i)?
>>>
>>> Adventages:
>>> 1. We keep unit address incremental order that is unlikely to change
>>>
>>> Disadventages:
>>> 1. More difficult to verify
>>
>> Rob also proposed this and I believe above disadvantage here is crucial.
>> If you add new SoC with board DTS you are fine. But if you add only new
>> board, the order of entries look random in the diff hunk. Reviewer must
>> open SoC DTSI to be able to review the patch with board DTS.
>>
>> If review is tricky and we do not have tool to perform it automatically,
>> I am sure submissions will have disordered board DTS.
>>
>>>
>>>
>>>> +Example::
>>>> +
>>>> +    // SoC DTSI
>>>> +
>>>> +    / {
>>>> +            cpus {
>>>> +                    // ...
>>>> +            };
>>>> +
>>>> +            psci {
>>>> +                    // ...
>>>> +            };
>>>> +
>>>> +            soc@ {
>>>> +                    dma: dma-controller@10000 {
>>>> +                            // ...
>>>> +                    };
>>>> +
>>>> +                    clk: clock-controller@80000 {
>>>> +                            // ...
>>>> +                    };
>>>> +            };
>>>> +    };
>>>> +
>>>> +    // Board DTS
>>>> +
>>>> +    &clk {
>>>> +            // ...
>>>> +    };
>>>> +
>>>> +    &dma {
>>>> +            // ...
>>>> +    };
>>>> +
>>>> +
>>>> +Order of Properties in Device Node
>>>> +----------------------------------
>>>> +
>>>> +Following order of properties in device nodes is preferred:
>>>> +
>>>> +1. compatible
>>>> +2. reg
>>>> +3. ranges
>>>> +4. Standard/common properties (defined by common bindings, e.g. without
>>>> +   vendor-prefixes)
>>>> +5. Vendor-specific properties
>>>> +6. status (if applicable)
>>>> +7. Child nodes, where each node is preceded with a blank line
>>>> +
>>>> +The "status" property is by default "okay", thus it can be omitted.
>>>
>>> I think it would really help to include position of #address-cells and
>>> #size-cells here. In some files I saw them above "compatible" that seems
>>> unintuitive. Some prefer putting them at end which I think makes sense
>>> as they affect children nodes.
>>>
>>> Whatever you choose it'd be just nice to have things consistent.
>>
>> This is a standard/common property, thus it goes to (4) above.
> 
> It's probably a mix, but AFAIK a lot of the device trees in tree have
> #*-cells after "status". In some cases they are added in the board
> .dts files, not the chip/module .dtsi files.

Existing DTS is not a good example :)

> 
> +1 that it makes sense at the end as they affect child nodes.

I still insist that status must be the last, because:
1. Many SoC nodes have address/size cells but do not have any children
(I2C, SPI), so we put useless information at the end.
2. Status should be the final information to say whether the node is
ready or is not. I read the node, check properties and then look at the end:
a. Lack of status means it is ready.
b. status=disabled means device still needs board resources/customization


Best regards,
Krzysztof


