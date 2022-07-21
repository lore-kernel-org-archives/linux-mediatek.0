Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAA6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GDU2IRydfXQkfqrUDMU1D/n3Z3JpQ7CUV8m7kZHOXo=; b=icrejJqsj0ZKi5Dhn1MnIPSv3O
	fH6th+v28pBLdcM56wyKr+/LC0FdsGu7CER6B+SJ3WTAumdL58aCuDFgL+T51PA9p0xnUyC+8QQxx
	1j8hJS90NeRdo9LklMgPDU3LmGZXFDVjPsQneJSm820Kw3kbvgSmYvyt5Ou8Waukhu1dUAC13+JWx
	W3YtYAqtUzayvu/xftZJbNB2qUYjmxHDAzO/lzGEVzcTkSyh+dp+Wy3wVQREgfN62q2iKXZoaqX6C
	Wy5c2NdMM9g+KUv9V9trISuYwjf+wcEmjbtRZtYV0xFoqfQM9+hfTShI4/x/gWxdp0Xc68WD6gKU2
	TRngaNKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWE8-0071wJ-Bi; Thu, 21 Jul 2022 13:28:28 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEVxd-006oNJ-DN
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 13:11:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id m17so1917705wrw.7
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Jul 2022 06:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=2GDU2IRydfXQkfqrUDMU1D/n3Z3JpQ7CUV8m7kZHOXo=;
        b=zM6uqqJD0zUpxrXvqvUJTtgzK7C8wI0w7+NobGNxJFW/oU2rftvyIufnMzzsksbQfo
         UPL6bIwDPZSX2erGUifThY2H1sG1qGDQM31W5Umj8L55JPcbgUJ+cO+aXCfAaeSJxRc3
         myUrxdjxtk9d5svXSSZra335QyPA3OCo5I+I3Hnp+g+6il7yE8imHH9KCq0lfrM3YMEg
         HRzpljYsgy8TtyJV8zSBIpAxN9W5F+b4p9vLrSp75U1Jufzo1WbGPolvsp4cUx6Pn5cD
         DsCs0sYDiem6ZuqbEt1ZrQFRxc5RhdUk5wrtjJo5b9rf5hw4s7m0p7UieJO7pPFlbwCz
         wHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=2GDU2IRydfXQkfqrUDMU1D/n3Z3JpQ7CUV8m7kZHOXo=;
        b=KDugQnEMDYKpyMCcrc7o+RFhV+LrvABKLTs4DgsdbdojdhqyBuzpnHQCT+Sox/Q6IB
         8E/ksS3xyorcF1i/QKpv1Q8aEgrnwIdYe5jYAV64NXuVGWn3sUYnqJlzGOa7t2xbPriI
         OWGzqf/39R6AQitTdn++A2wGYaIBXURRIMjcDvl/hlPzmLh6/3iidUCWSg40temBj7gp
         AyP2ttmgyso8r0A3pc2QpGbG5mSmRxowOI2xAoTwUzspG7snuHIKNCG3MSGSgHKoU7EX
         xl2BnTUfHhMBA63JTcbsIiHTR4MTI716BoukfS5lkLbwEPruxXX2cdJDhDlsUccsMmuF
         jLaQ==
X-Gm-Message-State: AJIora/2RRcdsjmY5y4Xel3LrM3A5ONodGMJRBoO4x6Fdaap5g+O18jY
	LUAlORVIo+8WOJ9gQ7sXufXxOQ==
X-Google-Smtp-Source: AGRyM1vMWJglV7kWdNrjYZOUhLc5gsJSA6p5P1/egh9annTDsloDA+h8irZ0fOR8tFshFQMxXCNoOQ==
X-Received: by 2002:a05:6000:1d9c:b0:21e:4a6d:664d with SMTP id bk28-20020a0560001d9c00b0021e4a6d664dmr6415826wrb.673.1658409082764;
        Thu, 21 Jul 2022 06:11:22 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id l37-20020a05600c1d2500b003a33227e49bsm1635651wms.4.2022.07.21.06.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 06:11:22 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/6] dt-bindings: mediatek,mt6779-keypad: use
 unevaluatedProperties
In-Reply-To: <734ed3cf-1461-6067-e718-663ca4be47a6@linaro.org>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-2-ef9fc29dbff4@baylibre.com>
 <e1ec8511-d1dd-faa5-031f-50c4e55062cd@linaro.org>
 <874jzaj0m5.fsf@baylibre.com>
 <734ed3cf-1461-6067-e718-663ca4be47a6@linaro.org>
Date: Thu, 21 Jul 2022 15:11:21 +0200
Message-ID: <87tu7ahapy.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_061125_723621_2F3EE36E 
X-CRM114-Status: GOOD (  17.90  )
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

On Thu, Jul 21, 2022 at 11:16, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 21/07/2022 11:06, Mattijs Korpershoek wrote:
>> On Wed, Jul 20, 2022 at 19:14, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> 
>>> On 20/07/2022 16:48, Mattijs Korpershoek wrote:
>>>> writing-bindings.rst states:
>>>>> - If schema includes other schema (e.g. /schemas/i2c/i2c-controller.yaml) use
>>>>>   "unevaluatedProperties:false". In other cases, usually use
>>>>>   "additionalProperties:false".
>>>>
>>>> mt6779-keypad includes matrix-keymap.yaml so replace additionalProperties:false
>>>> by unevaluatedProperties:false.
>>>
>>> This is not sufficient explanation. You now allow all properties from
>>> matrix-keymap.yaml, which might be desired or might be not (e.g. they
>>> are not valid for this device). Please investigate it and mention the
>>> outcome.
>> 
>> Hi Krzysztof,
>> 
>> Thank you for your prompt review.
>> 
>> In mt6779_keypad_pdrv_probe(), we call
>> * matrix_keypad_parse_properties() which requires keypad,num-rows and keypad,num-cols.
>> * matrix_keypad_build_keymap() which uses linux,keymap
>> 
>> Therefore, all properties from matrix-keymap.yaml are
>> required by the mt6779-keypad 
> Better to mention the device, not driver.

I mixed up driver versus device (hardware). Sorry about that.

For successful key detection, the hardware (called MediaTek keypad) 
requires that we program rows/columns via the KP_SEL register.
So num-rows and num-cols are valid properties for this device.

The MediaTek keypad has a set of bits representing keys, from KEY0 to KEY77. 
These keys are organized in a 8x8 hardware matrix.
Therefore, linux,keymap is also a valid property for this device.
>
>> 
>> In v2, I will add the above justification and also add all 3 properties
>> in the "required" list.
>> 
>> Initially, I did not do this because from a dts/code perspective it seemed
>> interesting to split out SoC specific keyboard node vs board specific key configuration:
>> * [PATCH v1 5/6] arm64: dts: mediatek: mt8183: add keyboard node # SoC specific
>> * [PATCH v1 6/6] arm64: dts: mediatek: mt8183-pumpkin: add keypad support # board specific
>> 
>> What would be the recommend approach for above?
>> I see at least 2:
>> * "move the whole keyboard node into the board file (mt8183-pumpkin.dts)" even if it generates
>>   duplication between boards using the same SoC.
>> * "add a "dummy keymap,row,cols" properties in the soc node which can be overriden in board file.
>>   For example, use rows and cols = 0 which would have the driver early exit.
>> 
> SoC DTSI should have only SoC properties. The keyboard module is part of
> SoC. The keys and how it is wired to them - not.

Indeed. So the split I send in v1 is "valid", from a device(hardware)
point of view.
In that case i'll not make the properties from matrix-keymap.yaml
*required* in v2.

Thanks again for your feedback.

Mattijs

>
> Best regards,
> Krzysztof

