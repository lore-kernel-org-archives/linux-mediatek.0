Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D5CC43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lo91ZwgekvEcgwX9umuOhAvofxzxBtnh8KTmzal9nHQ=; b=red8v+WFsBJkVo/VqYqbI+ipkf
	9Z+6kAK89owD67VINxhymqzrAVFLSDKEZrncNi/ui1raGKWqgq4T7eaLWdeA4u1DcpLKsNmNRhsl6
	RHxZ6xUYEwiZkH4vu1t+BPazGUhKtRHk1IqqOlma0CeBqV6ZDhSYR4Ua0mNiDkbI0rIcENNWbQni8
	FG67x/8lgntYeytnuJWMFkKEGDf2xyCV4IDvdpuZ7vq1fQK4UTt1LW07REuwtvt/7TO4o92/uwp6W
	XBiZhQWlA11L6HOC4rA+vzkYck0abfPx0Cve214ybRKT1QIVF6nFiokJh2Val4BudJTt0K0Ahd98w
	pQWQSOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyCNe-008pl5-NP; Thu, 24 Nov 2022 13:35:06 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyCMJ-008ozd-4K
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 13:33:48 +0000
Received: by mail-lf1-x133.google.com with SMTP id b3so2597816lfv.2
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Nov 2022 05:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lo91ZwgekvEcgwX9umuOhAvofxzxBtnh8KTmzal9nHQ=;
        b=Mb6FPnDIvbek63Nd+CcqS1F0xOLlWDMnqkFXJrI6nrXu+2Js9JEzs2s0+3F0zm5dw3
         XR4j15c8GntM2oOrodFwICp4ByCxmJ8eOg5DFtEMTMbFVaArj/COMCTRULFfh/oC8mUO
         usP6dOuuiFxq9tWsfAeB/yVDl2bVnm1RMXMebjf/eGV7mjz9qrDOKRBeWSXi39JByTfn
         KWKVUwM5Lv3gwHrvtdt78QsUzvAkrEwC5GASI/xrvgrdW49lY9xhnHmV+OS2/zE7zxo1
         TUYO7O5OUhkS3w89xX9KQXYTq3udePC0dsAPbE57cuxBYZ/tZKs+eWzTOzDSOrO3+keo
         HI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lo91ZwgekvEcgwX9umuOhAvofxzxBtnh8KTmzal9nHQ=;
        b=UdmWTvWdIQhePiD3WajJeBpBNQuEJfofOIKCe6VC1ItlrL7KNMwJzNGwo1Yy3MIFnn
         qghep60mrLMnWaIXrx+FHX+jVTQ1UmQ6KTZJA7cQ6+uGUsv5Fbb5ZA6vtCba0+TyIiPs
         XIQh2m5W3xCOMU1+8ixhKB/1pzIt0jZkKV3kVFeO9VVlTMvVS3bbJLWwvi7HVTGzpgpd
         BV3GXB0dIy18476Ogd+PCS0VQCl60vwEM/xT/kz90HSHdbOgBK8IKpUq3rmeIPPViPI6
         CKnJBGcyweLDvrgQDjboWNJvel+RQteSA5d+FJZbSR3dLx/S5IDWMCUPPLQGhlh8/g+k
         pDdQ==
X-Gm-Message-State: ANoB5pk34tGUZI5huxNXpO1LksTPmwaXFH/Yq3ADzZ/yId0mnItZzVwq
	sdL5nQ7uK7CWdfarVckNBCAysQ==
X-Google-Smtp-Source: AA0mqf7X5acPQJdwwtPXT37aCiD5Rp4TpRV8V9zQxbfPkbMUV5LabfgYVfja6NqzeSEodL0xZRLxNg==
X-Received: by 2002:a05:6512:3f19:b0:4ac:7d84:cb99 with SMTP id y25-20020a0565123f1900b004ac7d84cb99mr10549657lfa.412.1669296817483;
        Thu, 24 Nov 2022 05:33:37 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s11-20020a05651c048b00b00261ccf566e3sm96541ljc.65.2022.11.24.05.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 05:33:36 -0800 (PST)
Message-ID: <add5675c-b7a9-7f6e-e977-ac79c5c4086a@linaro.org>
Date: Thu, 24 Nov 2022 14:33:35 +0100
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y39fe3oHgMTyAHBm@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_053343_302073_1A2E5839 
X-CRM114-Status: GOOD (  22.97  )
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

On 24/11/2022 13:11, Daniel Golle wrote:
> On Thu, Nov 24, 2022 at 12:30:44PM +0100, Krzysztof Kozlowski wrote:
>> On 24/11/2022 12:03, Daniel Golle wrote:
>>> Add new compatible string for MT7986 PWM and list compatible units for
>>> existing entries. Also make sure the number of pwm1-X clocks is listed
>>> for all supported units.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>> Changes since v1: list compatibles, fix pwm1-n clocks for all SoCs
>>>
>>> Rebased on linux-next and re-run scripts/get_maintainers.pl on patch to
>>> makes sure dt maintainers are included. This has been requested by
>>> Krzysztof Kozlowski.
>>>
>>>  .../devicetree/bindings/pwm/pwm-mediatek.txt  | 20 +++++++++++--------
>>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>>> index 554c96b6d0c3..952a338e06e7 100644
>>> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>>> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>>> @@ -2,14 +2,15 @@ MediaTek PWM controller
>>>  
>>>  Required properties:
>>>   - compatible: should be "mediatek,<name>-pwm":
>>> -   - "mediatek,mt2712-pwm": found on mt2712 SoC.
>>> +   - "mediatek,mt2712-pwm", "mediatek,mt6795-pwm": found on mt2712 SoC.
>>>     - "mediatek,mt6795-pwm": found on mt6795 SoC.
>>> -   - "mediatek,mt7622-pwm": found on mt7622 SoC.
>>> -   - "mediatek,mt7623-pwm": found on mt7623 SoC.
>>> +   - "mediatek,mt7622-pwm", "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt7622 SoC.
>>
>> This does not look right. What you are saying is mt7622 is compatible
>> with mt8195, which is compatible with mt8183, which is compatible with
>> mt7986. It could be true, but I feel you wanted to say something else -
>> mt7622 is compatible with one SoC which is generic and common to all
>> other implementations.
> 
> MT7622 has 6 PWM channels, it does have CK_26M_SEL register and does
> not need pwm45_fixup. Hence, when using a driver made for MT8195, only
> 4 out of 6 channels woukd work. MT8183 PWM is identical to MT8195,
> hence also compatible. When using driver for MT7986, only 2 channels
> would work, but otherwise it is also compatible.
> 
> So unfortunately, that one generic implementation ("common ancestor")
> does not exist and development of the PWM unit found in MediaTek SoCs
> did not necessarily increase features in more recent iterations, but
> rather just reduce or increase the number of PWM channels available.
> Ironically, the unit with least features (only 2 channels) is found in
> the most recent SoC (MT7986).

None of these explain listing four compatibles.

> 
>>
>>> +   - "mediatek,mt7623-pwm", "mediatek,mt7628-pwm": found on mt7623 SoC.
>>>     - "mediatek,mt7628-pwm": found on mt7628 SoC.
>>>     - "mediatek,mt7629-pwm": found on mt7629 SoC.
>>> -   - "mediatek,mt8183-pwm": found on mt8183 SoC.
>>> -   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
>>> +   - "mediatek,mt7986-pwm": found on mt7986 SoC.
>>> +   - "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8183 SoC.
>>> +   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8195 SoC.
>>
>> This as well looks excessive.
> 
> I agree. But it's difficult to say which one should be ommitted.

Best regards,
Krzysztof


