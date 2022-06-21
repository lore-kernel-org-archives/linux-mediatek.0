Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590B6C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 07:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BU3K6SinExvEocmmVPaQvW019Wdd8765AUfADvWsjq8=; b=URYTu4pW82Db+quX6rn2SivqwT
	nmDguiqpUpU5dcqHysGdCKY4Fb6yKJfRtKmcLttQl9781k7sHTbahseZ9r/luifTJSYhjb7RbbpCH
	KkHvoAJikYMqZ03tLAi4IrfLzaDF3433MQkHTEnjR/9l1i9NVQXOz708Ou2VX8mto3eG1BPDM/MUk
	n5DfNA+F2V7kv6POU7mLMSrv3kzneC5qmNksYp4rJVIBMAqQHigWuWea2y2Ns8HfQI/EcNGCG2d+o
	Zrx0tvNk+Os7j4VcEy1Yi0cXhsVEG+AjvLT7mAzmD/SRw002x6BTFDwwL10H0VQSJQPIGysbrSPhN
	1QTAoIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Y6E-003zMv-WA; Tue, 21 Jun 2022 07:14:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Y6C-003zLW-66
	for linux-mediatek@lists.infradead.org; Tue, 21 Jun 2022 07:14:57 +0000
Received: by mail-ed1-x532.google.com with SMTP id o9so8838684edt.12
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jun 2022 00:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BU3K6SinExvEocmmVPaQvW019Wdd8765AUfADvWsjq8=;
        b=xY9S8gGdlJGQCO07Q+2Nif+7F+wUWZSqeaYzI+/xN6CmLvdv63g6mOmni/9E1yYxsH
         uI17z96Mml3ciYVyMDtRAlm37PSTXF1ZXBMWwVC/H3aNKs/PqaMNj5s+Oq+4xwRSZkAL
         hyuy0YvZNQpHxLeZeekbD9Fyam83qoBdOx+oBcmiY9pJgEO9ihqbzw6r2Cgpbrw88YP+
         UWNYbY2jtasa9G0901v8zzrDRzj4gxPBd2l4G2bx86qq9KrEjL2+dV7PtHXNeX/ZBmpI
         FaUR68G7DhK+GMBVKiSV9moScQmiMhX1rXykJOSd47zhVMR9x7OX23a0VbJse16ZIdod
         XskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BU3K6SinExvEocmmVPaQvW019Wdd8765AUfADvWsjq8=;
        b=ezxAdRF6PtAH38wdzYfe5FODudRrWy+o1+N2VE9o0AUnuUYr797/6uEsjw8RvauoxX
         xmzEuyDGO1fWmnTJM6TcuF7rMh5qVmmApjTwvFFHicwvsnileDV00SzkbYozFLpaZRF4
         4ugP8u8QZvWBd8Tj5o+7KZQ1aK617Xkso933Mfsof+LzAFb4KHOKscZk83ilA1GiWQPR
         9CLCRNI8feM5JqWtexUQ+yBHsH3jMjw1YajupiqFr5W6KLUyeGUOZllGZUjyaKEVTITN
         ajQZeZ9YfV1LtqVV6FtyAd7SKaE/+q1+JOr3/+RXggMuAbCrUwEhN8ngGU7W2p+A8Zkp
         cRzw==
X-Gm-Message-State: AJIora/t3GaqOE6UkuYfQgceTZAj7oFk2VYv8D6b+4iiG7M8bN9h5UZn
	/Elt/ugCgtLYryBgNXO7CMOVXkVKnm58HA==
X-Google-Smtp-Source: AGRyM1tBku4dOhxRZ+tsBWaShFdZdDXQbIGVuRg++IW5L6zuGtkFMc1YBVszGNTf/5dmlH8pwRuK4w==
X-Received: by 2002:a05:6402:2554:b0:42d:ee79:559d with SMTP id l20-20020a056402255400b0042dee79559dmr33858014edb.175.1655795692479;
        Tue, 21 Jun 2022 00:14:52 -0700 (PDT)
Received: from [192.168.0.216] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q12-20020a5085cc000000b0042ab87ea713sm11952447edh.22.2022.06.21.00.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 00:14:52 -0700 (PDT)
Message-ID: <afae6179-3681-f5c6-4615-3228f16f1271@linaro.org>
Date: Tue, 21 Jun 2022 09:14:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-usb@vger.kernel.org
References: <20220617222916.2435618-1-nfraprado@collabora.com>
 <20220617222916.2435618-3-nfraprado@collabora.com>
 <8639e64d-c659-7090-2d0a-078fd96cfbd4@linaro.org>
 <bb460aa483cc888ffa36709d9e9c1f2e3be0e000.camel@mediatek.com>
 <bc5458fe-083c-d679-9fcb-95810a290da8@linaro.org>
 <af50210b95d0cd8b2e3103b3d4a9702aeeba9452.camel@mediatek.com>
 <a24c24e6-fdee-df79-fd2f-6a71540bd9b3@linaro.org>
 <20220620155057.a6qilnhm7snzhapa@notapiano>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220620155057.a6qilnhm7snzhapa@notapiano>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_001456_291598_EF54FAD8 
X-CRM114-Status: GOOD (  31.81  )
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

On 20/06/2022 17:50, Nícolas F. R. A. Prado wrote:
> On Mon, Jun 20, 2022 at 10:50:57AM +0200, Krzysztof Kozlowski wrote:
>> On 20/06/2022 08:59, Chunfeng Yun wrote:
>>> On Sun, 2022-06-19 at 14:05 +0200, Krzysztof Kozlowski wrote:
>>>> On 19/06/2022 09:46, Chunfeng Yun wrote:
>>>>> On Fri, 2022-06-17 at 18:25 -0700, Krzysztof Kozlowski wrote:
>>>>>> On 17/06/2022 15:29, Nícolas F. R. A. Prado wrote:
>>>>>>> The current clock list in the binding doesn't allow for one of
>>>>>>> the
>>>>>>> optional clocks to be missing and a subsequent clock to be
>>>>>>> present.
>>>>>>> An
>>>>>>> example where this is an issue is in mt8192.dtsi, which has
>>>>>>> "sys_ck",
>>>>>>> "ref_ck", "xhci_ck" and would cause dtbs_check warnings.
>>>>>>>
>>>>>>> Change the clock list in a way that allows the middle optional
>>>>>>> clocks to
>>>>>>> be missing, while still guaranteeing a fixed order. The
>>>>>>> "ref_ck" is
>>>>>>> kept
>>>>>>> as a const even though it is optional for simplicity, since it
>>>>>>> is
>>>>>>> present in all current dts files.
>>>>>>>
>>>>>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>>>>> ---
>>>>>>>
>>>>>>>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml       | 9
>>>>>>> +++++++--
>>>>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/Documentation/devicetree/bindings/usb/mediatek,mtk-
>>>>>>> xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-
>>>>>>> xhci.yaml
>>>>>>> index 63cbc2b62d18..99a1b233ec90 100644
>>>>>>> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-
>>>>>>> xhci.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-
>>>>>>> xhci.yaml
>>>>>>> @@ -80,8 +80,13 @@ properties:
>>>>>>>      items:
>>>>>>>        - const: sys_ck  # required, the following ones are
>>>>>>> optional
>>>>>>>        - const: ref_ck
>>>>>>> -      - const: mcu_ck
>>>>>>> -      - const: dma_ck
>>>>>>> +      - enum:
>>>>>>> +          - mcu_ck
>>>>>>> +          - dma_ck
>>>>>>> +          - xhci_ck
>>>>>>> +      - enum:
>>>>>>> +          - dma_ck
>>>>>>> +          - xhci_ck
>>>>>>>        - const: xhci_ck
>>>>>>
>>>>>> You allow now almost any order here, including incorrect like
>>>>>> sys,ref,xhci,xhci,xhci.
>>>>>>
>>>>>> The order of clocks has to be fixed and we cannot allow
>>>>>> flexibility.
>>>>>> Are
>>>>>> you sure that these clocks are actually optional (not wired to
>>>>>> the
>>>>>> device)?
>>>>>
>>>>> In fact, these optional clocks are fixed, due to no gates are
>>>>> provided,
>>>>> SW can't control them by CCF;
>>>>> In this case, I usually use a fixed clock, or ignore it.
>>>>
>>>> But in some versions these clocks are controllable or not?
>>> Some SoCs are controllable, some ones are not (fixed clock).
>>
>> Thanks for confirming. Then I would prefer to make these clocks required
>> (not optional) and always provide them - via common clock framework or
>> fixed-clock.
> 
> Hi Krzysztof and Chunfeng,
> 
> thank you both for the feedback.
> 
> Since the solution I proposed in this patch is not acceptable I see two options:
> 1. Split the clocks in several if blocks matched by compatibles
> 2. Make the clocks required and use fixed-clock nodes for the missing clocks in
>    the DT
> 
> My understanding is that 1 is the desirable solution if the clock is really
> missing in some hardware variants, while 2 is desirable if all hardware variants
> really receive all the clocks, only that on some variants they're fixed and not
> controlable by SW.
> 
> From what I'm reading of this discussion it seems that the latter is the case
> here and thus we should go for 2. Is this correct?

This is how I understood it as well, so correct from my side.

> 
> Also Chunfeng, do you have information on whether the same is true for the MMC
> HW block? I recently submitted some changes to that binding [1] but I followed
> approach 1 there instead. However if all the clocks are present in the HW level
> there as well it would make more sense for me to change it to follow approach 2.
> 
> Thanks,
> Nícolas
> 
> [1] https://lore.kernel.org/all/20220617230114.2438875-1-nfraprado@collabora.com


Best regards,
Krzysztof

