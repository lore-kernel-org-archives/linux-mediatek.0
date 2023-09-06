Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67E0EB8FA5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 09:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mosQA1Z8AMW4TgZ1FXhqGU5ILwvCqddYrUv5k/pOamA=; b=fGxsEoWG8nYCZ1bV09SJfZWIr6
	Hya4F1/4W1GxQ+++V7qJjWgZvPQTlKzfP1uyC9q9krgShJAL/O38EjD5TbBxiplgHirfqSHv6ggW/
	TVH8cYGodaIQjDVYPhsOQ+5z6k3Fpi9uPW+bbMOyJ3yl1QfYlcPiBUUJ2Jhjht72yjJxSrKVx8wHj
	j5BrBTiPUM0qduCVd2Me0xFhAwF7NF8YL+x5RDb4nPStR5GgLj5Rafu65SSxf+Ryv3YuMtIVWXg8q
	BPhhHKvAX9FTDXVrNJFYQdfWKUHjVs7fP93kxd/2GIqYXvPh8JmIFh0ZqkgAx0GW758+yNJypSmn1
	s/WKlakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdojI-007tWy-1V;
	Wed, 06 Sep 2023 09:21:44 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdojD-007tTb-37
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Sep 2023 09:21:41 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bcfe28909so493202466b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Sep 2023 02:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693992093; x=1694596893; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mosQA1Z8AMW4TgZ1FXhqGU5ILwvCqddYrUv5k/pOamA=;
        b=BKxb4VdZAiOatmWR4ylA7Qcu72BSa5xYaXYUUeDHQxt7caI180+JFb47dEGBRghZGD
         ClodAMn9rpYjVjab8nW6aQHsECYRYTOZjyGHlAKqysgWmnnlQnBkgPH6dCOgpmm8I6Ed
         3X74xfX5hkvPTGfLs6jzRMq1Nbv0D6KDJgp9t+jogTYzA9crJ8NAh+Rc/dNuLg48nvFl
         xHJl7Wed0loeVDO21Iye2mfqQfB+ZTClgkdC6f4RoUmIHN5ot6QhbAfGk3O7V4KNy7za
         fr4leZsfpeThKtb6B9VfxyVvPsj9xfJo7FxS8Eir9S59th7ZGB0EtN9VLbJtrozVb6ht
         iv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992093; x=1694596893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mosQA1Z8AMW4TgZ1FXhqGU5ILwvCqddYrUv5k/pOamA=;
        b=NEzIvhfCyorC9Q0pMY0xkn1HX7zWSca3IFe40SyZpp0lCZjnQjesea9N0l8YO1O0yr
         ufpNZ2C1XQANRqfX8yikTsYdCKQgaxftW2iSWa9VF3ZDJ8Sa8DAy3ONsEvrc/BSyqG40
         D14UF/gBiwpgYM98ndFqR7/zGvl/KPr1JA/z4jf8Q9CdU/oaZkMWKsvUvmYlGlxWHFuP
         RhqnazhL2EEBgtqB4rrPgBku5n1dvvk2kWa4rxpOWo6tmv0W3v13qKsqr0wijpkuL4kz
         Alq4Sid72j4hvBmDaQ/kw6qYCgW68llvBWljpo/Co/tj4LRrDP3xhg2EVvYy4ReNdq/Y
         ZgxA==
X-Gm-Message-State: AOJu0YxtpoDdFAa9meaUW+Uup5QL8Y/VliR2WXXPqnpulp4EZfY8iAMo
	mAkn6pD0lAHM587aoNRO9/BZsQ==
X-Google-Smtp-Source: AGHT+IEqN8yumUMQ6iPTk72w0/+TSYnLcyYvOBAXXX38lgfTKbtqWsQSEHcxbrabVrpvOooKpQNTig==
X-Received: by 2002:a17:906:846a:b0:99c:fb44:d4a9 with SMTP id hx10-20020a170906846a00b0099cfb44d4a9mr1493075ejc.77.1693992093387;
        Wed, 06 Sep 2023 02:21:33 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709060ac700b0098d2d219649sm8882459ejf.174.2023.09.06.02.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 02:21:32 -0700 (PDT)
Message-ID: <59e07c6a-6f1b-0cc7-dddc-96d2a4050843@linaro.org>
Date: Wed, 6 Sep 2023 11:21:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8365-pumpkin: Add overlays
 for thp7312 cameras
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230905233118.183140-1-paul.elder@ideasonboard.com>
 <20230905233118.183140-4-paul.elder@ideasonboard.com>
 <502fc7b1-a32d-6901-3a45-d2aa0e0c3849@linaro.org>
 <20230906083237.GL7971@pendragon.ideasonboard.com>
 <a3ed9856-a87b-5cf6-26b5-ff2b19234a8a@linaro.org>
 <20230906090058.GB17308@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230906090058.GB17308@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_022140_012236_DCD7D9FA 
X-CRM114-Status: GOOD (  28.01  )
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

On 06/09/2023 11:00, Laurent Pinchart wrote:
>>> has a regulator@0. There are similar instances for clocks.
>>>
>>> I understand why it may not be a good idea, and how the root node is
>>> indeed not a bus. In some cases, those regulators and clocks are grouped
>>> in a regulators or clocks node that has a "simple-bus" compatible. I'm
>>> not sure if that's a good idea, but at least it should validate.
>>>
>>> What's the best practice for discrete board-level clocks and regulators
>>> in overlays ? How do we ensure that their node name will not conflict
>>> with the board to which the overlay is attached ?
>>
>> Top-level nodes (so under /) do not have unit addresses. If they have -
>> it's an error, because it is not a bus. Also, unit address requires reg.
>> No reg? No unit address. DTC reports this as warnings as well.
> 
> I agree with all that, but what's the recommended practice to add
> top-level clocks and regulators in overlays, in a way that avoids
> namespace clashes with the base board ?

Whether you use regulator@0 or regulator-0, you have the same chances of
clash.

> 
>>>>> +		orientation = <0>;
>>>>> +		rotation = <0>;
>>>>> +
>>>>> +		thine,rx,data-lanes = <4 1 3 2>;
>>>>
>>>> NAK for this property.
>>>
>>> Please explain why. You commented very briefly in the bindings review,
>>> and it wasn't clear to me if you were happy or not with the property,
>>> and if not, why.
>>
>> Because it is duplicating endpoint. At least from the description.
> 
> The THP7312 is an external ISP. At the hardware level, it has an input
> side, with a CSI-2 receiver and an I2C master controller, and an output
> side, with a CSI-2 transmitter and an I2C slave controller. A raw camera
> sensor is connected on the input side, transmitting image data to the
> THP7312, and being controlled over I2C by the firmware running on the
> THP7312. From a Linux point of view, only the output side of the THP7312
> is visible, and the combination of the raw camera sensor and the THP7312
> acts as a smart camera sensor, producing YUV images.

None of this was explained in the device description or property field.
I probably judged to fast but it just looked like duplicated property.
Then shouldn't it have two ports, even if camera side is not visible for
the Linux?

> 
> As there are two CSI-2 buses, the data lanes configuration needs to be
> specified for both sides. On the output side, connected to the SoC and
> visible to Linux, the bindings use a port node with an endpoint and the
> standard data-lanes property. On the input side, which is invisible to
> Linux, the bindings use the vendor-specific thine,rx,data-lanes
> property. Its semantics is identical to the standard data-lanes
> property, but it's not located in an endpoint as there's no port for the
> input side.

And how does the property support multiple sensors? What if they data
lanes are also different between each other?

Best regards,
Krzysztof


