Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E05C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 07:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsiycKeSmvcnoJAe+kYcU5wAQg8YUTRMCAWTbJ7c74c=; b=gaWiuqhLpTuaS9fI0GMdaB0ZIv
	TuzGQsjT2wJs58y33BmpDLPbQpa42m/vc+cT8I8bf6kqhxBXLuB3nesB/jahGdP4fMx5ZHtEuOPvf
	i4KFMD2v968b1jvl7RmWjrYFhF11GY4hTbNXoiBGjdZTdZEzX1Q7R7+e3Vcg/zmD4tYwh5bn8BtTg
	k+wcG4Ig67Ej5uvuRfMVPzqlqkyrnpKkq51JYJFIhBDzjAfVerol2GTM2ylsuY1Olr82hlvTPu5lx
	pxm7+rm9r8LugfyxyZq5xQVai6NB1p+rzznmRXFsvScTulfhZ2xHNEx1BZVoN6fR8MKlP/NFXf+2n
	F8db6Bkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyTYH-00EHEG-BR; Fri, 25 Nov 2022 07:55:13 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyTYD-00EHAH-TB
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 07:55:11 +0000
Received: by mail-lf1-x12c.google.com with SMTP id f13so5671284lfa.6
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Nov 2022 23:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rsiycKeSmvcnoJAe+kYcU5wAQg8YUTRMCAWTbJ7c74c=;
        b=zhZN1lS1gQOW3HSo8t3vDaCBYcU4oaH/Ilcys8xi6Llh1QDXau713rkNlNUa0pXlt0
         7QVi8zglr33K8ysYoZu/i38b6CldNy8ybuk9RoWI6D86HvJniff6XvUmI4/em8cBk7nr
         3tTBwiU6zPq+vIAWf1a5tXwO4y3/LOc4Wfb0QCR7VbDiC2lpu5JS+fgoDLWpbEfoxI+8
         BHUd+mMiYurY0tOw8lFx7xf2HpxNYynSs33DKU+hjn62PqGKPL2eFiqtiiOEMQy7l57N
         OuoOZSkS+PAZUYvbHKum+topP76CKxp/icN5wbJbELxJ2cNr++gsqFUHg3fFeuUMO4yH
         w2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rsiycKeSmvcnoJAe+kYcU5wAQg8YUTRMCAWTbJ7c74c=;
        b=geHxT/42UMcVG9pEAtxgWVz+TcVSdz43/1ODpIJqZW+C0nijb0nB/MK7P4RKHyjoRb
         tRfmD0p9ho4Et6iEet98sYNJ0897JKGmaF3xn9MNP6Lc7LIu5adVND+2UGtNkNDof3ld
         vhLEIalkED+qS/QNAZstH3yoYb892SJfntb6J8kZEMLuvyVvoznRalzv+vim0UXRpB0N
         D8rS6pLfVq33hnsWeBckPT2dWPaLhwsKBGyn2K8o4KgBIPEQZEtbJKks9ldQUBdShxtY
         au93Rb2j2nMu3w/S2GMKi+Q9jh98T2hpJvPnyNO5IFTPnwl5jIyZDAH15oYYEI7+sjdu
         /DHA==
X-Gm-Message-State: ANoB5plBoOk9/XAig4fIs76ymvcOSQpyeFdkoilXaQG6A4eVTa5BlvM2
	lKHrqTyd8Fh5ZmQnap7JtGpsEg==
X-Google-Smtp-Source: AA0mqf6Lro0NwHNKX3e0q8Qj/JIhc57lKqxVMiiyGmoA9sP15U/Iajy9e3TDhiiXGwJcwodW7AQ7iQ==
X-Received: by 2002:a05:6512:12ca:b0:4aa:e519:a065 with SMTP id p10-20020a05651212ca00b004aae519a065mr7592406lfg.455.1669362905467;
        Thu, 24 Nov 2022 23:55:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r30-20020ac25c1e000000b004ac088fdfd2sm429697lfp.85.2022.11.24.23.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 23:55:04 -0800 (PST)
Message-ID: <0ce922e3-33d4-3df6-1def-a4e44742f215@linaro.org>
Date: Fri, 25 Nov 2022 08:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH RESEND v2] dt-bindings: pwm: mediatek: Add compatible for
 MT7986
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.or, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Fabien Parent <fparent@baylibre.com>, Zhi Mao <zhi.mao@mediatek.com>,
 Sam Shih <sam.shih@mediatek.com>
References: <Y39PjU1BqBB8tZ98@makrotopia.org>
 <e5e87795-12d7-699e-1539-2e60b8b51957@linaro.org>
 <Y39fe3oHgMTyAHBm@makrotopia.org>
 <add5675c-b7a9-7f6e-e977-ac79c5c4086a@linaro.org>
 <Y3/NQBzU/R6XubBf@makrotopia.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3/NQBzU/R6XubBf@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_235510_045160_3E1EAE38 
X-CRM114-Status: GOOD (  29.19  )
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

On 24/11/2022 21:00, Daniel Golle wrote:
> Hi Krzysztof,
> 
> On Thu, Nov 24, 2022 at 02:33:35PM +0100, Krzysztof Kozlowski wrote:
>> On 24/11/2022 13:11, Daniel Golle wrote:
>>> On Thu, Nov 24, 2022 at 12:30:44PM +0100, Krzysztof Kozlowski wrote:
>>>> On 24/11/2022 12:03, Daniel Golle wrote:
>>>>> Add new compatible string for MT7986 PWM and list compatible units for
>>>>> existing entries. Also make sure the number of pwm1-X clocks is listed
>>>>> for all supported units.
>>>>>
>>>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>>>> ---
>>>>> Changes since v1: list compatibles, fix pwm1-n clocks for all SoCs
>>>>>
>>>>> Rebased on linux-next and re-run scripts/get_maintainers.pl on patch to
>>>>> makes sure dt maintainers are included. This has been requested by
>>>>> Krzysztof Kozlowski.
>>>>>
>>>>>  .../devicetree/bindings/pwm/pwm-mediatek.txt  | 20 +++++++++++--------
>>>>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>>>>> index 554c96b6d0c3..952a338e06e7 100644
>>>>> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>>>>> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>>>>> @@ -2,14 +2,15 @@ MediaTek PWM controller
>>>>>  
>>>>>  Required properties:
>>>>>   - compatible: should be "mediatek,<name>-pwm":
>>>>> -   - "mediatek,mt2712-pwm": found on mt2712 SoC.
>>>>> +   - "mediatek,mt2712-pwm", "mediatek,mt6795-pwm": found on mt2712 SoC.
>>>>>     - "mediatek,mt6795-pwm": found on mt6795 SoC.
>>>>> -   - "mediatek,mt7622-pwm": found on mt7622 SoC.
>>>>> -   - "mediatek,mt7623-pwm": found on mt7623 SoC.
>>>>> +   - "mediatek,mt7622-pwm", "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt7622 SoC.
>>>>
>>>> This does not look right. What you are saying is mt7622 is compatible
>>>> with mt8195, which is compatible with mt8183, which is compatible with
>>>> mt7986. It could be true, but I feel you wanted to say something else -
>>>> mt7622 is compatible with one SoC which is generic and common to all
>>>> other implementations.
>>>
>>> MT7622 has 6 PWM channels, it does have CK_26M_SEL register and does
>>> not need pwm45_fixup. Hence, when using a driver made for MT8195, only
>>> 4 out of 6 channels woukd work. MT8183 PWM is identical to MT8195,
>>> hence also compatible. When using driver for MT7986, only 2 channels
>>> would work, but otherwise it is also compatible.
>>>
>>> So unfortunately, that one generic implementation ("common ancestor")
>>> does not exist and development of the PWM unit found in MediaTek SoCs
>>> did not necessarily increase features in more recent iterations, but
>>> rather just reduce or increase the number of PWM channels available.
>>> Ironically, the unit with least features (only 2 channels) is found in
>>> the most recent SoC (MT7986).
>>
>> None of these explain listing four compatibles.
> 
> So do I understand correctly that in this case only the newly
> introduced "mediatek,mt7986-pwm" should be listed as more generic
> compatible after the more specific "mediatek,mt7622-pwm", everything in
> between should be dropped? Or only drop "mediatek,mt8195-pwm" here?

I know nothing about Mediatek PWM and which one is more generic than
others. The patch submitter should rather know...

> 
> I'm asking because in your message from 23/10/2022 you were quoting
> Devicetree specification:
>> "The property value consists of a concatenated list of null terminated
>> strings, from most specific to most general. They allow a device to
>> express its compatibility with a family of similar devices, potentially
>> allowing a single device driver to match against several devices."
> 
> And we have discussed in great length (as I had misunderstood it) that
> this should mean that units with the lowest number of channels are to
> be considered the "most general" if otherwise identical.

Yes, but we do not discuss this part.

In most cases you have one generic device and several devices compatible
with it. You on the other hand created here one device compatible with
three other devices! And that raised all my questions.

> 
> 
>>
>>>
>>>>
>>>>> +   - "mediatek,mt7623-pwm", "mediatek,mt7628-pwm": found on mt7623 SoC.
>>>>>     - "mediatek,mt7628-pwm": found on mt7628 SoC.
>>>>>     - "mediatek,mt7629-pwm": found on mt7629 SoC.
>>>>> -   - "mediatek,mt8183-pwm": found on mt8183 SoC.
>>>>> -   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
>>>>> +   - "mediatek,mt7986-pwm": found on mt7986 SoC.
>>>>> +   - "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8183 SoC.
>>>>> +   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8195 SoC.
>>>>
>>>> This as well looks excessive.
>>>
>>> I agree. But it's difficult to say which one should be ommitted.
> 
> So are you suggesting to drop the "mediatek,mt8183-pwm" string here?


Yes. Why mt183 is even there? commit msg was not explaining it.

Best regards,
Krzysztof


