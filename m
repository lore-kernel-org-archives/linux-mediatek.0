Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0A0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l921OzWrKWAkvgffalKJcegxOLa36ztSxqMp8PQLuKE=; b=AsdGeYIx/cKrCFVuV56rpvDw0T
	d5xQX1nslvIIQ+qDP2m670NSZPxKWpSMAMURixn0WZXFxeFlVpfxF+CSd1W9L6KuUuudSPZMhvhAr
	LhNCIvUdXZ0FblPAm0pTIVX9UOdEG+XDtcLNLNVo9zC0nYEjotCIcM62T2LxTRFlIVFK2jPpOZ65E
	PEB2ffwX/7BuleW01wT15ZCyEKs4nGbU9b4vIkgWm7f+sTHwjLQjkOit/KytxdKZGA+awbXIFi2xl
	udQ8ESrhQKCmv7SLLhXO+3juOTZsP+KinGcctZv9OgK+rRXVnVVZ34k9yGujTI2D5miB7oWy43TgO
	sc7Ky1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3D7i-00H0DS-Ki; Mon, 20 Jun 2022 08:51:06 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3D7f-00H0A8-Ai
	for linux-mediatek@lists.infradead.org; Mon, 20 Jun 2022 08:51:04 +0000
Received: by mail-ej1-x629.google.com with SMTP id v1so19647315ejg.13
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jun 2022 01:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=l921OzWrKWAkvgffalKJcegxOLa36ztSxqMp8PQLuKE=;
        b=K8YhUSw2j90oN35WVE7NTJrtHV0dTZB20ol4mTQLyuO94nvyW83AU6qr2lg51vXODD
         o9R3B4RVANHBRkwyy5TbfSI5mdDhNLzseI0fobTy4UBH7yf9wD34/VB0ukydEmAnDfEM
         r6RAuE4N+pbS9G/7F5TcxO3zeAPrHW3QK7tL8XYJ1N5qLb5Z4l5makzcW+3y4rT+aUMZ
         5ZICp0zJ7tQCeNGS4S2hCy54OrzCp0unX7VKSKximXDZomJApbztoGxg0RIc7KDgsDsy
         m9yTbwwjbzu1OkI5yydxa1OjRCcqzZsnk2F0p2yKA+eyL3eUr1/iWAjbNiwlkdLcj0jT
         6N1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l921OzWrKWAkvgffalKJcegxOLa36ztSxqMp8PQLuKE=;
        b=7RYmFa9ezPW9nUEAACBDHUzj86KSjrnKPv4wS5ng0Q2nu6P3wwcvxpp0clS+56prf3
         hClOSZGV7hAxPwZbOuokPdvipyF3n1mdDu/wgPAIXI2Pgz0kWMJTfMG61yqaI7NLgwKy
         YoKDz5w8HC1Dg88ZpehvCAFor6Uabpe05KiobYbQeQx4GdvbV9Is4d+YQdmUn/RupG+D
         uQecKDxsloSKSWgP0dsuxhUvT4EFPWh19rSjvKYKTc9R+kPXC6mSs2nLQdSOkeqCxeii
         9+/GCMnrVkod52uz+CJYMhfeQ844tavL3+by3jYMJgk43ybjPHYbecOK7YaW346xuyW+
         Mhzg==
X-Gm-Message-State: AJIora9QVwLcHxrO1lZNDyy6GzEkcXuxy3a5zBkr05WFlzxYzr4c45cs
	B6ve+jzdVa4ZVTNYR60V+HTKZQ==
X-Google-Smtp-Source: AGRyM1vg839TPzO9Llk78TgzhogRHGaP18+CEPGCz+ZqKqNWO6QJy5rQo9Fs6ITkPjHkEQ3FwxwpLw==
X-Received: by 2002:a17:907:16a2:b0:711:d048:7d41 with SMTP id hc34-20020a17090716a200b00711d0487d41mr20355368ejc.126.1655715059676;
        Mon, 20 Jun 2022 01:50:59 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ff10-20020a1709069c0a00b006fec69696a0sm5512140ejc.220.2022.06.20.01.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:50:59 -0700 (PDT)
Message-ID: <a24c24e6-fdee-df79-fd2f-6a71540bd9b3@linaro.org>
Date: Mon, 20 Jun 2022 10:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <af50210b95d0cd8b2e3103b3d4a9702aeeba9452.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_015103_428261_FA134F1D 
X-CRM114-Status: GOOD (  15.58  )
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

On 20/06/2022 08:59, Chunfeng Yun wrote:
> On Sun, 2022-06-19 at 14:05 +0200, Krzysztof Kozlowski wrote:
>> On 19/06/2022 09:46, Chunfeng Yun wrote:
>>> On Fri, 2022-06-17 at 18:25 -0700, Krzysztof Kozlowski wrote:
>>>> On 17/06/2022 15:29, Nícolas F. R. A. Prado wrote:
>>>>> The current clock list in the binding doesn't allow for one of
>>>>> the
>>>>> optional clocks to be missing and a subsequent clock to be
>>>>> present.
>>>>> An
>>>>> example where this is an issue is in mt8192.dtsi, which has
>>>>> "sys_ck",
>>>>> "ref_ck", "xhci_ck" and would cause dtbs_check warnings.
>>>>>
>>>>> Change the clock list in a way that allows the middle optional
>>>>> clocks to
>>>>> be missing, while still guaranteeing a fixed order. The
>>>>> "ref_ck" is
>>>>> kept
>>>>> as a const even though it is optional for simplicity, since it
>>>>> is
>>>>> present in all current dts files.
>>>>>
>>>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>>> ---
>>>>>
>>>>>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml       | 9
>>>>> +++++++--
>>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/usb/mediatek,mtk-
>>>>> xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-
>>>>> xhci.yaml
>>>>> index 63cbc2b62d18..99a1b233ec90 100644
>>>>> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-
>>>>> xhci.yaml
>>>>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-
>>>>> xhci.yaml
>>>>> @@ -80,8 +80,13 @@ properties:
>>>>>      items:
>>>>>        - const: sys_ck  # required, the following ones are
>>>>> optional
>>>>>        - const: ref_ck
>>>>> -      - const: mcu_ck
>>>>> -      - const: dma_ck
>>>>> +      - enum:
>>>>> +          - mcu_ck
>>>>> +          - dma_ck
>>>>> +          - xhci_ck
>>>>> +      - enum:
>>>>> +          - dma_ck
>>>>> +          - xhci_ck
>>>>>        - const: xhci_ck
>>>>
>>>> You allow now almost any order here, including incorrect like
>>>> sys,ref,xhci,xhci,xhci.
>>>>
>>>> The order of clocks has to be fixed and we cannot allow
>>>> flexibility.
>>>> Are
>>>> you sure that these clocks are actually optional (not wired to
>>>> the
>>>> device)?
>>>
>>> In fact, these optional clocks are fixed, due to no gates are
>>> provided,
>>> SW can't control them by CCF;
>>> In this case, I usually use a fixed clock, or ignore it.
>>
>> But in some versions these clocks are controllable or not?
> Some SoCs are controllable, some ones are not (fixed clock).

Thanks for confirming. Then I would prefer to make these clocks required
(not optional) and always provide them - via common clock framework or
fixed-clock.

Best regards,
Krzysztof

