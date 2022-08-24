Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5268FC00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 13:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TfRFZdPPa8B51MYvjdd539ePUr6kSsCQn61FGO4GdE=; b=KMNUri33xqzrmVsgYfBCFRDI9H
	s4am+ARIr7czWX1ZkfYKyFzeZKrERObCOhIe5cDDr7xSjSbYANtuRoHwDidyW86fmI0Vvh66kbbLl
	hQzUksXvs94ICYTpfFXmvOqCzYuv0cMms8W22BjJcjK7KzBBzPtzmw3Vj1d5Ee3JEsQMD7iyuJA89
	prUk5CP4MycrbdS5GRxphK5SXO+4Rjo6Xzje7j1YooLWGJZps6G4Lu8C84lkAawzVN0Ml12TqS7jT
	3FBWk2u069APWMCzyxEWtixU3C/rTD4y4Q5dzPNYW3PwfAQix5JOskagVCRumhrVlx3yNmBDyKiTf
	6hs0yuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqqo-00DQCD-80; Wed, 24 Aug 2022 13:55:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqqb-00DQ5X-Bo; Wed, 24 Aug 2022 13:55:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id v7-20020a1cac07000000b003a6062a4f81so976907wme.1;
        Wed, 24 Aug 2022 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=+TfRFZdPPa8B51MYvjdd539ePUr6kSsCQn61FGO4GdE=;
        b=aFe6EZILPi4mhBimcUcflE/kKSW5k3aY0tETzNxA0P11eSF6STOEpvtzCCW9Uev2fN
         a4UwvQyI6/h/IQRuU+qk0IqsnJFOJuEQTq7YJ5rHOy705kyLy0xPDgWkpQ3XYPXGmq36
         OdzQseeK+dwILujmlW5M4npWAjrq14G+FAQLsUTCSZI9ESeTJauVjnLHvifH9ACzQ/tw
         dXUXYPGoKk2V8GjCwEGS1qFRrcAACizGai+V8ZzWm5nXSdl6dC9JnqmswFJni9lLyejj
         4CzvrgCrCoRPO2AZlMPi8Rzl4MXUfeJD2Pob9EIzJ7g1u4dUfw/Mqo3tPETtxZ9Zn9Y+
         IQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=+TfRFZdPPa8B51MYvjdd539ePUr6kSsCQn61FGO4GdE=;
        b=NnmK+5n7pBdnXkmxZgrYv0PIO7pgEJxQ5zbRq5RxGgnqWlbR94oHt+1jssVdzQuSej
         vWVXO7LnhyW9EfT8AJL2NLoMvwNKsnyTSpLzzIJrKw8/KJvpyTCupR79Y78zUz/gF92H
         rg0eqm8r8KnTKFtWA7wvFyuttpR880YcxwBrl6Z1CmGbtsy0h+YNEN4vOTTo3YwsbYk0
         cQMfY40tpmU2us4hAB3rbBjuPeGKbrtsLHhkpwrnHmMV7qwauy3qtmOcPyaH/zTDP0I4
         jfjRQlYf0gE4vQMD4nJgom4LwQijAJq22f+7Yh/PSNWDh6WnnforaQGDRVs/5digrgFr
         5Syw==
X-Gm-Message-State: ACgBeo0/jovzoXl7AlOo2kUNvjwyEywAr7RQ9TKA5T+Xz1XOKelBHOH7
	gnf6N4ATFnfbNbMN2ptUaag=
X-Google-Smtp-Source: AA6agR4QxBBWMr++j4x5qmO1sVOahCNUuQT962B+1Govc61YXOhMi0sKq2jcvX6UFcV/97fPHKtdPQ==
X-Received: by 2002:a7b:cd0f:0:b0:3a5:ec59:daf0 with SMTP id f15-20020a7bcd0f000000b003a5ec59daf0mr5305484wmj.13.1661349305735;
        Wed, 24 Aug 2022 06:55:05 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c214800b003a540fef440sm2239530wml.1.2022.08.24.06.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 06:55:04 -0700 (PDT)
Message-ID: <0557c9fa-1ec4-5413-78f6-f5d78f3f9ffb@gmail.com>
Date: Wed, 24 Aug 2022 15:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 0/7] Input: mt6779-keypad - double keys support
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
 <YvQ3A2/Pop4YzzQ8@google.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <YvQ3A2/Pop4YzzQ8@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_065509_449331_0AED1CDC 
X-CRM114-Status: GOOD (  16.65  )
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



On 11/08/2022 00:53, Dmitry Torokhov wrote:
> On Tue, Jul 26, 2022 at 02:56:05PM +0200, Mattijs Korpershoek wrote:
>> The MediaTek keypad controller has multiple operating modes:
>> * single key detection (currently implemented)
>> * double key detection
>>
>> With double key detection, each (row,column) is a group that can detect
>> two keys in the key matrix.
>> This minimizes the overall pin counts for cost reduction.
>> However, pressing multiple keys in the same group will not be
>> detected properly.
>>
>> On some boards, like mt8183-pumpkin, double key detection is used.
>>
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> 
> Applied patches 1 through 5 (leaving dts patches out), thank you.
> 

Applied 6 and 7 now. Thanks!

>>
>> ---
>> Changes in v2:
>> - bindings: add matrix-keymap justification in commit message (Krzysztof)
>> - bindings: switch from double-keys(boolean) to keys-per-group(uint32) (Krzysztof)
>> - driver: add a function pointer for row/column calculation (Angelo)
>> - Link to v1: https://lore.kernel.org/r/20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com
>>
>> ---
>> Fabien Parent (2):
>>        arm64: dts: mediatek: mt8183: add keyboard node
>>        arm64: dts: mediatek: mt8183-pumpkin: add keypad support
>>
>> Mattijs Korpershoek (5):
>>        MAINTAINERS: input: add mattijs for mt6779-keypad
>>        dt-bindings: mediatek,mt6779-keypad: use unevaluatedProperties
>>        dt-bindings: mediatek,mt6779-keypad: add mediatek,keys-per-group
>>        Input: mt6779-keypad - prepare double keys support with calc_row_col
>>        Input: mt6779-keypad - support double keys matrix
>>
>>   .../bindings/input/mediatek,mt6779-keypad.yaml     |  8 ++++-
>>   MAINTAINERS                                        |  6 ++++
>>   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    | 21 +++++++++++
>>   arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  9 +++++
>>   drivers/input/keyboard/mt6779-keypad.c             | 41 ++++++++++++++++++++--
>>   5 files changed, 82 insertions(+), 3 deletions(-)
>> ---
>> base-commit: 668af1b6548837b44a2bfe65dcbae6b250adbf63
>> change-id: 20220720-mt8183-keypad-20aa77106ff0
>>
>> Best regards,
>> -- 
>> Mattijs Korpershoek <mkorpershoek@baylibre.com>
> 

