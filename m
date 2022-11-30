Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76219C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 08:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bInR2egbUtB2hdBJUO3XKA2gh33pftK8BC1pboCK4Cw=; b=GCMjS2dx3QsuqoToGV9t1OuDJ+
	0m5PtJfKaZpLxk23YE2S32/67NfAR94dxK8t/DqrPrOjfZguieCKW2sqHaScRNBpAAm0JLl4gyekl
	fCXtgGX8bVLHJfvHDRSw2WqW9q8BQss3wQUUswid5bo0RuE6aRVMsLgNvzMiOWsn/SYD63gzoaLor
	ArjjK7YQyw2w6AKwnG7V2G9C05oUJ/WoXZDm53wtgoy1ZHZqWfR5+044Inbh5DaZ5f4AQTfMXX9nR
	V2reCw/M70+eYFkjyAlFmuvniquoEISUcD6Y3q4duHbcWDXyPMrXSUhz09ztcCkc/S8DhWa2Pc3OP
	0E5Agd9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IXo-00EZeZ-CG; Wed, 30 Nov 2022 08:34:16 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IXY-00EZWa-16
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 08:34:02 +0000
Received: by mail-lf1-x131.google.com with SMTP id j4so25843459lfk.0
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Nov 2022 00:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bInR2egbUtB2hdBJUO3XKA2gh33pftK8BC1pboCK4Cw=;
        b=zcjMf5MiAzYT57sPm6IN9blQQbOHLzrtaEsAe7mOQqNQvADeYMPI6oVtT7tEITeYcV
         DagPXMaBFptf7ab5MlLq3GvjTGyfkxJym+RiU8PnSWHwog0c7q/EAgdXvIGj5hBB7Yuc
         CBUcKNqdu1JTahD0Eym6DaDoPS/zGPNtZqbIBLtsrQWEMz+adpWWlKy2qMfXmb9j7KWi
         amSs0oAAQRlsisUu7q0gT75bG2xBY8l5S3FMwNTVJt0GgdLHoprXxlaD6asuPtqDu0QG
         FvvxlX4k8VOxiqiOVj0w0KO5kcAt1yb1ChuyULvXbQMzPNaesCIpu9ZnuTN4cEN8dW+n
         dUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bInR2egbUtB2hdBJUO3XKA2gh33pftK8BC1pboCK4Cw=;
        b=5laC929qqe95+mGKi0SskwlPVq/DsilXYTK3pGvXIwOTyCDbbIEoy3kM9sZ9g4gfnF
         wcLw0G2dbD+vSKJH40Ep9uC/k/AHR5iQJdPe4HLtDdWZsEUb9TkH6aDNtVm7Ogu2W67S
         LXlvyC5+PUIjNwZI80QD19BOC4pyuC9nJvPmH98waIQhNxhpHOctT5lwN7GZTiHzRp4z
         OCpjOj/Ifhb610VgL4lNoSY29P3EOPk1xD8eZpeFEhURyVM93MZAmHUvOKLj9qbEbtqE
         fL2kjtzV/93DG4gbTldV5TrHhtf7sZL03+X3JeUbn0DAOBev/ASNf5qK6PbpnQQdTCxY
         zdUA==
X-Gm-Message-State: ANoB5pl6hYO/uwSbZcjiNuuXUAshCmppWXkPHul3CcfFKqu7ynMa8W0B
	mo5AhxRvxWf02RJ/xDh/sFhujw==
X-Google-Smtp-Source: AA0mqf5ij2hVTbkErt4ghcZygMlO+KN57N0P9UqggTllmp6/9wSbhnOoztToCTHGNxgcaruT7tXxuA==
X-Received: by 2002:a05:6512:5d4:b0:4b0:8622:662f with SMTP id o20-20020a05651205d400b004b08622662fmr21180119lfo.316.1669797235649;
        Wed, 30 Nov 2022 00:33:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m2-20020a195202000000b004a47e7b91c4sm163429lfb.195.2022.11.30.00.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 00:33:55 -0800 (PST)
Message-ID: <cc2f8ded-f88b-66d0-3ec1-9e1cd74b493f@linaro.org>
Date: Wed, 30 Nov 2022 09:33:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/9] dt-bindings: spi: mtk-snfi: add mt7986 IC snfi
 bindings
Content-Language: en-US
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-6-xiangsheng.hou@mediatek.com>
 <8b8e4b23-a3bc-7e3d-199a-e8f591d05d71@linaro.org>
 <5f76482d33933c19e191ea618f8622cd0660597f.camel@mediatek.com>
 <e512b7fd-3404-3c2d-dbf6-dc66ee662a06@linaro.org>
 <36d71d033f6926dfaefed7010bced94b4cd4b339.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <36d71d033f6926dfaefed7010bced94b4cd4b339.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_003400_116028_B6CA858E 
X-CRM114-Status: GOOD (  13.57  )
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

On 30/11/2022 09:18, Xiangsheng Hou (侯祥胜) wrote:
> Hi Krzysztof,
> 
> On Tue, 2022-11-29 at 08:47 +0100, Krzysztof Kozlowski wrote:
>> On 29/11/2022 03:50, Xiangsheng Hou (侯祥胜) wrote:
>>>
>>>>>    clocks:
>>>>> +    minItems: 2
>>>>>      items:
>>>>>        - description: clock used for the controller
>>>>>        - description: clock used for the SPI bus
>>>>> +      - description: clock used for the AHB bus dma bus, this
>>>>> depends on
>>>>> +                     hardware design, so this is optional.
>>>>
>>>> Optional for which variants? For all of them?
>>>
>>> It`s only needed for the item 3 nfi_hclk. Is it proper with this
>>> description or any other suggestion.
>>
>> I understand third clock is optional. For which variants/compatibles
>> it
>> is optional? Add allOf:if:then restricting it.
> 
> The MediaTek SPI NAND controller IP used by MT7986 is the newest.
> In the future, there will have other SoCs.
> If add restricting on this, may not easy to maintain.
> Does this acceptable?

I don't think it is not easy to maintain. We have it in many, many
bindings...

Best regards,
Krzysztof


