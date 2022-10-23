Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107AAC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 12:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtMX72KLBH/oqLRTjw6ZoQ9HphAQ86EWlsGtUM1biLY=; b=qSzq8+kJlf0yOWYIsRaDRxeGKr
	/Io7EhF2Ms/T89/ElgVRzMO7/EQ2jNAtN85XBOmWaXEg1O//WyZcVQfI3H31Ynfusv+6zd4hcMDEI
	UvfJAjo282m0DnAL+GDIRWto89Ts7er4rRoje95a+qSBqx6x8vfdry+/UDb0miwtGsIzrKQO1lXBO
	sgJo/UQeiflAajHUn9z7Ecmom4Xm4U/SnzLeTUYgzdYSSAEaUTEA5UellWaapAPZWrIR5P1/QM3ne
	1tiKkJH8qwFACtkSYzpL5Q0suFIkfBm31EAh1OJEOLRZY4otA5uV5fPqXYOEYGuf/li6W10jTMnth
	gsCS0Whw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omaGU-00FA12-L5; Sun, 23 Oct 2022 12:39:42 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omaGR-00F9zM-Nb
	for linux-mediatek@lists.infradead.org; Sun, 23 Oct 2022 12:39:41 +0000
Received: by mail-qt1-x832.google.com with SMTP id c23so4312714qtw.8
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Oct 2022 05:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WtMX72KLBH/oqLRTjw6ZoQ9HphAQ86EWlsGtUM1biLY=;
        b=rR/rt3NVFszMvYLvpbh47uWTrABK35J57rG52zoILjoYOQHkbtYIQh00iQYClie0y3
         sCYb3qtKGZKKMRBPmgZo7I11CTY9vQzNiVCsddF+NJZOCexBdZTDuaF8C6m6MeDWGz2O
         84EyKhN+R+tiDg6ry5Zdvs1k+t+MXLVaym1rOFvDqXWrcWGnmUJq66oAo/+lFVTGDDMF
         spjhWPgr0OSF5/bsWCOb6rye4DPS2NfoUmaAx1gMD9nI4erOCP2ngTq0bCkfJk765ytn
         Iewy/sCoyf6ANJUcQL/6zxpYlfx24FeRknl5AUVm3MfO92mZ/01G0gFEuI71TSFYPAqw
         rVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WtMX72KLBH/oqLRTjw6ZoQ9HphAQ86EWlsGtUM1biLY=;
        b=LsTalkTUqZWw3biGuW4Zf+4RjY/zb2359tCTakKB0RCMb1aNbtCwfCoDIwZG/rVUpb
         ZPNaKsV0nOBZvVRzOEQ8j/zp7ocbHQKpKquejnuGiaB5jwNQm2uO9Ktb1+VjqV6k/N4z
         h0bA77GpBd3U3Y8EWSBJG7hrj4CUJeJQsoUy7dB0aQAJnNEEUCdJCfuCqFt/alsBdC1W
         UJzm3OSAX4KJpSnC7DzTXzH8yJmxmI8zsaFLG+yvgzq95W79MobgG1OVx9XBlEaTp84H
         DB+vNyZ3YHlk+HJQUVaQfflRxqFkyUJ146maRpWy2edWSvf2RST1SAZDfdZIT9XfSh+T
         8Dbg==
X-Gm-Message-State: ACrzQf2pl4DhP51ZKdJLCQv2ZXjnrTJOjFCZKXsk0hcEvTRQHKbCpV39
	mqrM79TJZm2NIw+7C/9TWAt+og==
X-Google-Smtp-Source: AMsMyM5ARqNAYBYplnOqSjtUrbcf4MWsV3uP/gieV6dYA025Qv5ID/SBR6x37ttDQse4hV7lX8FXIg==
X-Received: by 2002:a05:622a:138b:b0:39c:eb5a:5c33 with SMTP id o11-20020a05622a138b00b0039ceb5a5c33mr24003935qtk.412.1666528776446;
        Sun, 23 Oct 2022 05:39:36 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id u30-20020a37ab1e000000b006ef0350db8asm7299556qke.128.2022.10.23.05.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 05:39:35 -0700 (PDT)
Message-ID: <eab019f7-f801-848e-80a3-5bb526d95d53@linaro.org>
Date: Sun, 23 Oct 2022 08:39:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/2] dt-bindings: pwm: mediatek: Add compatible string for
 MT7986
To: Daniel Golle <daniel@makrotopia.org>
Cc: Rob Herring <robh@kernel.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <Y1K53n7LnjoMoIfj@makrotopia.org>
 <20221021222338.GA565200-robh@kernel.org> <Y1MkIdFXrBrrv958@makrotopia.org>
 <5182e3c4-9e5e-2c36-408b-9029c65c8803@linaro.org>
 <Y1UycU0JvwyAv0x2@makrotopia.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y1UycU0JvwyAv0x2@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_053939_874077_6314D7F7 
X-CRM114-Status: GOOD (  22.30  )
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

On 23/10/2022 08:24, Daniel Golle wrote:
> Hi Krzysztof,
> 
> On Sat, Oct 22, 2022 at 12:35:25PM -0400, Krzysztof Kozlowski wrote:
>> On 21/10/2022 18:58, Daniel Golle wrote:
>>> On Fri, Oct 21, 2022 at 05:23:38PM -0500, Rob Herring wrote:
>>>> On Fri, Oct 21, 2022 at 04:25:18PM +0100, Daniel Golle wrote:
>>>>> Add new compatible string for MT7986 PWM.
>>>>>
>>>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>>>>> index 554c96b6d0c3e0..6f4e60c9e18b81 100644
>>>>> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>>>>> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>>>>> @@ -8,6 +8,7 @@ Required properties:
>>>>>     - "mediatek,mt7623-pwm": found on mt7623 SoC.
>>>>>     - "mediatek,mt7628-pwm": found on mt7628 SoC.
>>>>>     - "mediatek,mt7629-pwm": found on mt7629 SoC.
>>>>> +   - "mediatek,mt7986-pwm": found on mt7986 SoC.
>>>>
>>>> This version of the PWM h/w is not compatible with any of the existing 
>>>> chips? If it is, it should have a fallback compatible.
>>>
>>> No, it is unique because it comes with just 2 PWM channels.
>>> Otherwise the driver behaves just like for MT8183 (4 channels) or
>>> MT8365 (3 channels) which also got distinct compatible strings.
>>
>> Then something would be here compatible. E.g. If you bound MT8183 with
>> mt7986-pwm compatible, would you get working device with two channels?
> 
> Yes, but I'd see another 2 channels which do not work, accessing them
> may even cause problems (I haven't tried that) as it means accessing
> an undocumented memory range of the SoC which we in general we
> shouldn't be messing around with.

Why on MT8183 there would be undocumented memory? Where is undocumented
memory?

> 
> Also note that this case is the same as MT8183 vs. MT8365, they got
> distinct compatible strings and also for those two the only difference
> is the number of channels.

So why they are not made compatible?

> 
>>
>> If so, they are compatible.
> 
> By that definition you should remove the additional compatible for
> MT8365 or rather, it should have been rejected for the same argument.
> 
> I'm talking about
> commit fe00faee8060402a3d85aed95775e16838a6dad2
> commit 394b517585da9fbb2eea2f2103ff47d37321e976

This is a pattern spreading in several Mediatek bindings and we already
commented on new patches. I don't know why people working on Mediatek do
not mark pieces compatible.

Best regards,
Krzysztof


