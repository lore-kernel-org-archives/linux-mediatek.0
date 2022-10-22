Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D8AFA373F
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBm0P3FPX2F4B7EXDqIEp1ZB1xk9MTQmB4rl3mZnXIY=; b=kdKJ8TKL4cknWrBG9aN89gVYVH
	DuZHm8CPvPjMls1BaZ9J4LCeSbdbP4ee48X2bXDrBn0b2APfK99tUe9cPgcvdFlxuic4Af7h8Ex9T
	9uYXmrPLDZH4y4X8yNHCX9zilL+I9c4VxYsEKR9yyPinFF+/KtDzttMetWDD71apQW3m8x9xdMEVU
	b08vGOSyBkQ9qLAnG8FRoxqd/mtikdyyZMYrKYVJfP7liKFjjoBuH3xVNrq5vLd3ZQ9SZaKH/KHAX
	Azjb+1qUY58vGfT7KJvOeOh/gywArebwmNyyUVbX9tkNaVYaZUmE3LXR5XAINdhc8bJS/k49PmYhO
	MVvXTSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omHTK-00DGh0-F4; Sat, 22 Oct 2022 16:35:42 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omHT8-00DGdw-MG
	for linux-mediatek@lists.infradead.org; Sat, 22 Oct 2022 16:35:32 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-131dda37dddso7324383fac.0
        for <linux-mediatek@lists.infradead.org>; Sat, 22 Oct 2022 09:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GBm0P3FPX2F4B7EXDqIEp1ZB1xk9MTQmB4rl3mZnXIY=;
        b=f8pvx7q1zwdMngBbP7ZEUPfZkrFHxQxA48Ai3+mygs/GLpdKI7VUvGM9oYNvRDbn7Z
         wN6FxU3NQy5sPMsOsv9WTOWxhSIjy/2yUBxTdnSvOGLlcC0e13wS4G9ESzgnU4eiawhs
         GIZSfDlMmqkgJB/SeIPZ00hAXb0qbYUtM8jzuEb0oUrzg1e6Bt0vZOgCMd40Puy9dPDq
         k4bSgofMU1/EBkgKSo8CboheihaEoNiSe6lAQYuvJOBq50v+aFqQHJL51JL/7VqabJj1
         dTXTdzZ4/eSOnTVpQHuqjFafZ+aruePF6z/neyN5p/quTJuiJTeaHzsHiXMdyqzxA7eH
         CNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBm0P3FPX2F4B7EXDqIEp1ZB1xk9MTQmB4rl3mZnXIY=;
        b=oR17MsL8IlxK7d7jgmsnc64R+L3FrW40D9G33rAPxnXlQg2lXszWOddrkxHwu9xjW3
         7cjBMegHjAe7Mi2b9Wo6A2TLhH9quOPwDKF7rmE0adGLYOJ1YIGKWy1lX48hqHPpOaD6
         OCih/+K4zDaYoXMxnjzG64j63/1RM3TvBmGgO8dc8hTN+hzwPk0RMGJLWz4YfcXwEPuA
         eugLW5v8KisgMFISgyRrGYYFWH2cZUweZaB6n0JVoZr/1V8uofCNUfWj3rsqLK7NsOcZ
         tnk5ZskUhBOSnWo1tf73Lue/kGoKe6yBLlnvn7vOBaMwNZO2TMj00DGClDCa2jyjUf40
         k65w==
X-Gm-Message-State: ACrzQf26n3AQh/OC+GcgQKqNDU8ITbKu1uWTVRl1Sfz18qie4EpnHDBt
	3bQEQUWpmqX55Gz6hpZqKlD/h8mxdz58IA==
X-Google-Smtp-Source: AMsMyM76MhMoHP1Wv+m5Kd8A1kqDnYPXtPFcM3+UoKXjBStkyLbBUXCXUx5uQ9P3gSSkMeyo69lA6g==
X-Received: by 2002:a05:6870:8193:b0:13a:e465:ad18 with SMTP id k19-20020a056870819300b0013ae465ad18mr9607934oae.30.1666456528592;
        Sat, 22 Oct 2022 09:35:28 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id k14-20020a9d7dce000000b0066210467fb1sm2443640otn.41.2022.10.22.09.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 09:35:27 -0700 (PDT)
Message-ID: <5182e3c4-9e5e-2c36-408b-9029c65c8803@linaro.org>
Date: Sat, 22 Oct 2022 12:35:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/2] dt-bindings: pwm: mediatek: Add compatible string for
 MT7986
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh@kernel.org>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <Y1K53n7LnjoMoIfj@makrotopia.org>
 <20221021222338.GA565200-robh@kernel.org> <Y1MkIdFXrBrrv958@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y1MkIdFXrBrrv958@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_093530_734412_7CC93633 
X-CRM114-Status: GOOD (  15.22  )
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

On 21/10/2022 18:58, Daniel Golle wrote:
> On Fri, Oct 21, 2022 at 05:23:38PM -0500, Rob Herring wrote:
>> On Fri, Oct 21, 2022 at 04:25:18PM +0100, Daniel Golle wrote:
>>> Add new compatible string for MT7986 PWM.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>>> index 554c96b6d0c3e0..6f4e60c9e18b81 100644
>>> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>>> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>>> @@ -8,6 +8,7 @@ Required properties:
>>>     - "mediatek,mt7623-pwm": found on mt7623 SoC.
>>>     - "mediatek,mt7628-pwm": found on mt7628 SoC.
>>>     - "mediatek,mt7629-pwm": found on mt7629 SoC.
>>> +   - "mediatek,mt7986-pwm": found on mt7986 SoC.
>>
>> This version of the PWM h/w is not compatible with any of the existing 
>> chips? If it is, it should have a fallback compatible.
> 
> No, it is unique because it comes with just 2 PWM channels.
> Otherwise the driver behaves just like for MT8183 (4 channels) or
> MT8365 (3 channels) which also got distinct compatible strings.

Then something would be here compatible. E.g. If you bound MT8183 with
mt7986-pwm compatible, would you get working device with two channels?

If so, they are compatible.

Best regards,
Krzysztof


