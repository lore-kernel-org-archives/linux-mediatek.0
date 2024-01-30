Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFE5C47DA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 16:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xx5LK5cIWTZjcQaikGkUtTQL7dv+9ckkh97t67Efamk=; b=Lcb8J1Jt39yP/X49n20odzvvX/
	ZRVzPeWuUnSWyKg1JgHWKW4i2UATqKvs3nVu9qxlWGZ+zJoWzFUOsbajRSzQKkTcNAUZCxvMwjJBW
	L6xrJMwinaoP+N6uq/1gDu+dCRHfeEOjRGl+o5sr5LIDd88AT8Bu8+PleT8HQd+SYu+KgeOMdTqjP
	6T7uZvu/NMItNecMtKIg8p1dCG5GhCPNv6E9pirguAkEr23E70wcgrPJ58gCcw7q0HXxF22TGJcfa
	hnuwN878SMiBCHlAqtQbeyFAs1oAHd1IAP7uyqAFgxLaQWjn/Fc5xTu15vrhc37+b7swVL3ef01GU
	dL6NY4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqvh-0000000HLXm-1IAf;
	Tue, 30 Jan 2024 16:25:45 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqvf-0000000HLWr-16zG
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jan 2024 16:25:44 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5111c9e48e8so988903e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jan 2024 08:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706631940; x=1707236740; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xx5LK5cIWTZjcQaikGkUtTQL7dv+9ckkh97t67Efamk=;
        b=Cx6PkmNvy4YgsAmnRkXI0cB5YeEpnMLftKpCgO595AD/wzaQgk/8z1vu62u91FfrUw
         Anbkfm5WkIhxAVsgCpSb9I3eHSIorbeL16MBLtMn/5my4qZftrjzrIU1jNkfzd9NUgET
         HY9qygTB1D+CBtj3kWKzUBXy4PC+Ml8EzCNSVxumvKyq451aaGz4zwi9OoYEk+5RtfqH
         Lomi0kPgC3Acg9MnqjIPYVhHF/iuYt6vxr99mgHKwp51isHJKtUwtQNrYT9z4Ffvq8gQ
         z8JVS1lLrMxVRG1mE8q5nb6Pb3qVdMHygls/3vvsgT+6xuPghiHDQSM90Hl4Lt/gnwXP
         kJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706631940; x=1707236740;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xx5LK5cIWTZjcQaikGkUtTQL7dv+9ckkh97t67Efamk=;
        b=f9V0/71TRK3UidBLq3xpqfMJRnHPaGUWAx3sPKgd0h3tMWpEZGNP3EwBb6BQPuOIPM
         mInssf8y/LT+iQEF1lnRmX1q4x3YtbC1sDmpSZyysarxA/qaNxeWM5oRVZ/iWu/qZKB6
         5hd4vkjwg8+Ny8/9fTgs4hwAGT1cSltrQxz94t8AR7Iha6VfU/Us+K3TJsJlX3fqO3ld
         WkC/Es46S7j2PCa5VMOKLaZc1gKFQAKQg3f1RF0DyacYhewoEkATbaypZC36Khl8NjDK
         NW6IipkLRJ4yVv/DnMZlQW3VPrnmLdDwzGhl3WUheE8kjldeIYDXEqRIMeQRQOG10tqF
         kyyg==
X-Gm-Message-State: AOJu0YzAUq3opolUJcVbtnWvkJwBQXMyKYS9H9/eGv5pEyr4/swfaVoB
	ShomJ1Y0WKaP+wtbmHRoNn99hct2vPsEzI0BQhyVa+l5d5KGjbWXIZpe5XRLXK4=
X-Google-Smtp-Source: AGHT+IGKmoGuj0MSsy/jyZO/UQZpGItSPG3/U4Kws6CIORIhy1+vliz1pR0tRfJaLsxxA8skGzJcqQ==
X-Received: by 2002:a2e:8552:0:b0:2cd:9f2a:1450 with SMTP id u18-20020a2e8552000000b002cd9f2a1450mr5579437ljj.17.1706631940254;
        Tue, 30 Jan 2024 08:25:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVbt3+Bvs+rMDJrQfc4XovjpQSFvjOLVIDYT453/Fk87t14svX038oR2EttdIorcfJ3ZC+KXpajNm0Ln1Ptslbi7/6y1s5rew+bPKD84ODVNjOERPT1mX8BoWp+PBMHPGT9rNhMSO43orpcII3IBTQnBsn5R5h2r+D954t/SRDMUnTXrmpsE3ven9TfvFmFvZGZoeDKGX8Ze1pltFBYVj6ZQDQnaA7quAuYnssQ1Mv1eiac0Zviyql8BaXSBavqDJvd4OVotHGswsuGcY9dpYli3MGfIGmAQJieddCAcIHyEOgPyTV683RMedCmN+7PVnTTUCW5JmojHoeNnLLJzhMgZ9HsF+vmye91n2pmjipffUe9r6QhFyF7D1IWhxj5mtTaOUhq76jcTEuyia29cvKTan9+nCO7uPEBKGy3CZwh2iIRLiEraeQRYqHgOG5lAjwqKOb5/Tq5THKfXpcOlDv2goJwNYOiOzUJ0bZg80CEkZzjl/Wzl/oaj0jnjX7iNWAZ6EKwhEGB+8ak1Iz/GupL1fsbK5fSUGU/3qStMNAorAolyZNCHg==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id c8-20020a509f88000000b0055f43384da2sm763543edf.56.2024.01.30.08.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 08:25:39 -0800 (PST)
Message-ID: <78241d63-3b9d-4c04-9ea5-11b45eac6f00@linaro.org>
Date: Tue, 30 Jan 2024 17:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240126063500.2684087-1-wenst@chromium.org>
 <20240126063500.2684087-2-wenst@chromium.org>
 <74b9f249-fcb4-4338-bf7b-8477de6c935c@linaro.org>
 <CAGXv+5Hu+KsTBd1JtnKcaE3qUzPhHbunoVaH2++yfNopHtFf4g@mail.gmail.com>
 <21568334-b21f-429e-81cd-5ce77accaf3c@linaro.org>
 <CAGXv+5HxXzjigN3Bp96vkv71WfTJ1S2b7Wgafc4GxLmhu6+jMg@mail.gmail.com>
 <a4324473-e0c6-4d53-8de0-03b69480e40b@linaro.org>
 <CAGXv+5HAqmUizXztMH_nY6e+6oQh01hCtxEJXKtCn3_74-sOsQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAGXv+5HAqmUizXztMH_nY6e+6oQh01hCtxEJXKtCn3_74-sOsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_082543_366946_6F57DDCA 
X-CRM114-Status: GOOD (  17.70  )
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

On 30/01/2024 08:47, Chen-Yu Tsai wrote:
> On Tue, Jan 30, 2024 at 3:37 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 30/01/2024 04:32, Chen-Yu Tsai wrote:
>>> On Mon, Jan 29, 2024 at 3:34 PM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>> On 29/01/2024 04:38, Chen-Yu Tsai wrote:
>>>>
>>>>>>> +allOf:
>>>>>>> +  - $ref: bluetooth-controller.yaml#
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    enum:
>>>>>>> +      - mediatek,mt7921s-bluetooth
>>>>>>
>>>>>> Can it be also WiFi on separate bus? How many device nodes do you need
>>>>>> for this device?
>>>>>
>>>>> For the "S" variant, WiFi is also on SDIO. For the other two variants,
>>>>> "U" and "E", WiFi goes over USB and PCIe respectively. On both those
>>>>> variants, Bluetooth can either go over USB or UART. That is what I
>>>>> gathered from the pinouts. There are a dozen GPIO pins which don't
>>>>> have detailed descriptions though. If you want a comprehensive
>>>>> binding of the whole chip and all its variants, I suggest we ask
>>>>> MediaTek to provide it instead. My goal with the binding is to document
>>>>> existing usage and allow me to upstream new device trees.
>>>>>
>>>>> For now we only need the Bluetooth node. The WiFi part is perfectly
>>>>> detectable, and the driver doesn't seem to need the WiFi reset pin.
>>>>> The Bluetooth driver only uses its reset pin to reset a hung controller.
>>>>
>>>> Then suffix "bluetooth" seems redundant.
>>>
>>> I think keeping the suffix makes more sense though. The chip is a two
>>> function piece, and this only targets one of the functions. Also, the
>>
>> That's why I asked and you said there is only one interface: SDIO.
> 
> There's only one interface, SDIO, but two SDIO functions. The two
> functions, if both were to be described in the device tree, would
> be two separate nodes. We just don't have any use for the WiFi one
> right now. Does that make sense to keep the suffix?

Number of functions does not really matter. Number of interfaces on the
bus would matter. Why would you have two separate nodes for the same
SDIO interface? Or do you want to say there are two interfaces?



Best regards,
Krzysztof


