Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5975AC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 08:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgloWXFLaFs9lmJG0fPOaTpoYd54+C3xSVgrFaunkT0=; b=3DkIOzNBtZcs/GwbGk4suFB5wB
	9NxY6uODI5oep4h5EUBtZcqE4NXFZ+5/haS7vDylz6OzI7CslCqMxXGsiEpPjqFMiif1euz8BzVmc
	uckeC0xMy07kSbhxtgWsep4Lw7GjjOAO391ldhkV0VFDYmR2YKhETKcwLtvwmz7numS/TYMMcJGyZ
	dhXDb3Ghe93mHURGuHRoEK/CwBRghCp4Qt5fysU0f7gzSyeeHGkgtGiONa9Sx4t8xjxtN1sCPJC/X
	OtrOMCrQFXmt0rGQGlnWhwBefkYPbFMOUIG48a/GXV1+DfMy0ELcCv0tMfuvZfq2gy8B974ZygJtq
	9bRbrtkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImgy-0091VN-6V; Fri, 20 Jan 2023 08:24:08 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImgn-0091Sg-Mb
	for linux-mediatek@lists.infradead.org; Fri, 20 Jan 2023 08:23:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so5272032wml.3
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Jan 2023 00:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FgloWXFLaFs9lmJG0fPOaTpoYd54+C3xSVgrFaunkT0=;
        b=MHCGfgilU6ydlCFAZY5JatZkaD2pp/zBsnjj10yE611kJslbTuldF2Ay27aBDL9Wyx
         A0alK4w+msJgKduZqXDeuSLDUFetGDQIsrJ9KC49tzY9DyJJpGPytDhxbQ4vSZPsN+Lb
         EGle3WyRPf4lG39x9nGSf9yjOlEJeQXAnZvXApuMwdEurDEIPtpb66uqcajWVfWErmWl
         0wzy4li7yElaB6e08Loqd/Hle7PBAU4htngF4xusf3TKT8NByPEvLB3NNGds5+kiHu45
         kG5wx9e1oJhcCOEbjSDBxX+JE/joyng7hUmGriz6Q1LEE+BGC8YCQriTXmu9zvbKYX9a
         CRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgloWXFLaFs9lmJG0fPOaTpoYd54+C3xSVgrFaunkT0=;
        b=dk63T4yec2IIJvEdgfJ7toUulsoiqHnzBjFAT8USRpX5rTghe8I+WdrRK7vLu4euMO
         rmyiXtYlB1BZiQlyFJqwuIQtXWUgSfScA0jhwISY3BUHNr2iIlXcEmPGEclFdvADReAh
         Syg7M19rlHrpwFlIU2IY8+LFVV8T54+I+n6pIkIl3bWAgoGFj610dp2t8c5+KGEL7USE
         Soi6GIleWlhYs1Dx/mzykfyusl09vBw5V5/8N5HJNvWMUcEVcVL6ifjAtfG24J5nAqZZ
         pCrcC7DaDyGuZHKXO06uvyQa73pbH+Oxu++mJ5euOcyFeJKmCqWSaKe/gvM3sXPTKqX8
         8zPg==
X-Gm-Message-State: AFqh2ko2JXtdgdE0h8X+jqOKlyEHgduknD5lDUElju55L+ryerdb47rN
	EGD5Ry9IkIiD0Xg87vB0Xr5EzQ==
X-Google-Smtp-Source: AMrXdXtzKTRjLx4Z1Jr2/H8s3PWQANcY3pEfPSsg7PLeLmP7E+lFoP4RTADLwa6KxNEDcah3ADdPoQ==
X-Received: by 2002:a05:600c:3b82:b0:3d2:392b:3165 with SMTP id n2-20020a05600c3b8200b003d2392b3165mr13346564wms.12.1674203035433;
        Fri, 20 Jan 2023 00:23:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o28-20020a05600c511c00b003dab40f9eafsm1608605wms.35.2023.01.20.00.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 00:23:55 -0800 (PST)
Message-ID: <a6fda8b6-c714-e66d-af74-0ce773e6cfe9@linaro.org>
Date: Fri, 20 Jan 2023 09:23:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/2] spi: spidev: add new mediatek support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org
References: <20230118-mt8365-spi-support-v2-0-be3ac97a28c6@baylibre.com>
 <20230118-mt8365-spi-support-v2-2-be3ac97a28c6@baylibre.com>
 <Y8l/mQjjgKJiE1/F@sirena.org.uk>
 <CAFGrd9pZ0Lso6LMKkN=ErujGgRi6t5_C3FvbMYHaV5V_DD0BnA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFGrd9pZ0Lso6LMKkN=ErujGgRi6t5_C3FvbMYHaV5V_DD0BnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_002357_797661_A4BE704D 
X-CRM114-Status: GOOD (  18.75  )
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

On 19/01/2023 20:30, Alexandre Mergnat wrote:
> Le jeu. 19 janv. 2023 à 18:36, Mark Brown <broonie@kernel.org> a écrit :
>>
>> On Thu, Jan 19, 2023 at 06:28:20PM +0100, Alexandre Mergnat wrote:
>>> Add the "mediatek,genio" compatible string to support Mediatek
>>> SPI controller on the genio boards.
>>
>> All my previous review comments stand, please don't ignore review
>> feedback.
> 
> Hi Mark,
> 
> Yes sorry about that, I wasn't aware that I've some feedback when I
> sent V2 for a quickfix.
> 
> I will take care about your comment:
> 
>> We need a matching update to the binding document.
>>
>> This does also seem like a terribly generic name - Google
>> suggests that this is actually a series of numbered products (eg,
>> Genio 700), perhaps we should be using the specific numbers here?
>> I guess users would care which they're talking to.  It really
>> parses as being "generic I/O" which would be an end run around
>> describing the actual product though it's not actually that.
> 
> Is there a binding documentation for spidev ? I didn't find it.
> 
> My understanding is to have something more specific like:
> compatible = "mediatek,genio350"
> Or maybe use the SoC name, to be aligned with the DTS ?
> compatible = "mediatek,spi-mt8365"

This should be specific compatible for your device attached over SPI. If
you have there "Genio 350", then the first.

Compatible can be documented in its own binding or in trivial-devices (I
sent a patch for existing ones).

Best regards,
Krzysztof


