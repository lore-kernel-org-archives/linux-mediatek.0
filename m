Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B3AC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fjl1nyklvmbUWAqy2NCYV73rfZ4GVtAe9RZ6ef7L2Y0=; b=GLaiw3E05rGKn3hF4ptnG96ypu
	M9AmUaiW8PQTJMIyifwcgp7/CXdouM7DTV8FGdpx5kPwZCjizBXBwnUJm+NAP0IeWs+p3tDSqGk+/
	muhdtw/FO5i198EZdd5r77fliwWCZNfZcDxd6/jIK5xlccDYQ+9JM3WgRVvnSfA1C3T7gP/C/FV0Q
	OOttRm3zp4GrTLTWhnYppU5IdozfUh8mqt/2Bk8KPNJZC91RrHy6t64gjmrTYzC0ADepEPi4iWTAE
	W6b+FuMtyTgtmMP02G8sS4xBZunge/ZjFvYEDmYrL2jv4taxlHZmB//3tmNiv5vEMJ5yvN/iZoo7x
	t9Q2kDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwld-00BpS6-Db; Tue, 15 Nov 2022 14:18:25 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwlL-00BpLC-UD
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 14:18:13 +0000
Received: by mail-lf1-x133.google.com with SMTP id c1so24622045lfi.7
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 06:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fjl1nyklvmbUWAqy2NCYV73rfZ4GVtAe9RZ6ef7L2Y0=;
        b=kktnKZbk/wYqI1XXAvaLTfAGHnue0EYLsoCc4n10GlO+qbBrqglGT0Zu/vESOvx0ew
         iMpg22+o0WdTD1coyylUUIsTezFd7/3h5mVoI8e8xhNF1bwnt9ZbB8rbltbLQet4iRvu
         DQjXbUA3jh8FTrpfbBUTnxDzOY+O3y9xV9RY2CfHKPMHjHK+kWSt1crMFNb80JVmsb1w
         WrmExEmJ7zve9/ucCN2xeRB43XI7Mi7I2QzXKUa093H2zVzvtfpBGeMRvq3hTqbkLA/F
         Hw3jPA/eD/hexsuk9a5hONbJOXi289XagRzVJN8sgTcPYovqmq9hvSz4s1kHrCdgpXGJ
         8o+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fjl1nyklvmbUWAqy2NCYV73rfZ4GVtAe9RZ6ef7L2Y0=;
        b=6yeY/UgUMpIfH4itZxiJ0XNw2GS0IlRfGP9zfa61MxYtX48RNOvGERvitksSm3M9Q0
         uCpCOQ4bRttjNVtOt/k6lXv6Z1AKat3FpIugOflDt9u+GoLptqgMxohj8ueIu9q6MazL
         IKqBvNgj7vKX4B90mUchwffcHsfWgfYusXgo0Xc4GYuFZnIImQzJSQOU9BL5E//6wzzN
         ZgjZHcoo3R6qae1q4nTxsFsC9JKbxf8/hXyL6EVBlWL419Y+S9n4VyCclZNHV6asDsQK
         ILQU8zZGdX7BRxbySxIyI/DSaqe32iywC0tAcxHJmviWZmArA3MEoeazrsBwfp6mFRFA
         /e2Q==
X-Gm-Message-State: ANoB5pkIFHZpugc6OXb+MGCJjwI21aARnvmw15BAHsU6R/QyJRbt15TH
	0fG3ARQaeKC/W/3qy1BAjxg+9A==
X-Google-Smtp-Source: AA0mqf5N00F5rAhEqY0apB6eFiFRPswarOnAVSPpRwwKMxwKjHmpmNxqwDSJHMbz3HdSxA2K7w+B5g==
X-Received: by 2002:ac2:4bd5:0:b0:4a2:776f:f3c6 with SMTP id o21-20020ac24bd5000000b004a2776ff3c6mr5425071lfq.302.1668521885588;
        Tue, 15 Nov 2022 06:18:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x11-20020a056512130b00b004a608ec6d8csm2230929lfu.27.2022.11.15.06.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 06:18:05 -0800 (PST)
Message-ID: <c426918a-8d63-5c40-4340-6c918296814f@linaro.org>
Date: Tue, 15 Nov 2022 15:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 5/9] dt-bindings: soc: mediatek: convert pwrap
 documentation
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fabien Parent <fabien.parent@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-5-5d2bb58e6087@baylibre.com>
 <fe898d24-54fa-56bb-8067-b422a3a52ff5@collabora.com>
 <CAFGrd9r70XRd=4Ogei+U2QXQny7LhWr9bDCRNYco+Bsy+2XqrA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFGrd9r70XRd=4Ogei+U2QXQny7LhWr9bDCRNYco+Bsy+2XqrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_061807_987203_50A5C572 
X-CRM114-Status: GOOD (  14.47  )
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

On 15/11/2022 14:54, Alexandre Mergnat wrote:
> Hi Angelo,
> 
> Le mer. 9 nov. 2022 à 10:55, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> a écrit :
>>
>> Il 08/11/22 19:43, Alexandre Mergnat ha scritto:
>>> +maintainers:
>>> +  - Alexandre Mergnat <amergnat@baylibre.com>
>>
>> I say that the maintainer for pwrap is Flora Fu <flora.fu@mediatek.com>....
> 
> Flora Fu is the driver maintainer. As described in
> Documentation/devicetree/bindings/writing-schema.rst:
> maintainers
>   A DT specific property. Contains a list of email address(es)
>   for maintainers of this binding.
> 
> My  understanding is this field is only for binding maintainers, but
> not related driver maintainers. Are we aligned ?

Usually driver maintainer should be also binding maintainer. You can
have more binding maintainers than drivers (and vice versa), but it's
less usual to maintain driver and do not care about its Devicetree
binding (unless driver is also for ACPI etc. but that's not the case here?).

Best regards,
Krzysztof


