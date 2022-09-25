Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECBDC6FA82
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Sep 2022 08:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3f7xryob0fjp6E4pNLcCzs6IRZqkpNTpwM4Ki3mJWfc=; b=AUmOyLcl/PwS/uZgL0OF6N50FD
	G2yLEHIlUG3CpASe8NVdCeo/dyMHDVRQpaP0ZEHqfI0MMZU6/wI8MnCwLw/DZOaf9H7sY4RYtWEFT
	H0Cjvzdu8lgM+wr9r5hs++a3Sgm6xaC/h6qvVkuhIfrY1CK/uEwwGzX1OGviIhl9y6ZY39krdGAuD
	uuwVvm6jGdipJGan5t6hO/FaQiHD7CD34rVK4OcrZwxqD45HwO5oFc7P+OKiBAK4Qc0yAwbc0FMy9
	r2p5yFk70Etidvy9p8NIIliHni/U2VxtUO1HGco9LwyVXWWjtruZ+n6AxbDTYJTwsCylptJ0oTKVy
	YCcx+pzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocMsg-00C5Xt-4Y; Sun, 25 Sep 2022 08:20:54 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocMsb-00C5U5-FD
	for linux-mediatek@lists.infradead.org; Sun, 25 Sep 2022 08:20:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id e18so2630771wmq.3
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 01:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=3f7xryob0fjp6E4pNLcCzs6IRZqkpNTpwM4Ki3mJWfc=;
        b=tKILDON0dYSkuS1KXcE9usQK+2lgvJ4U5Vi7MJ7mSJ1DGm0pKT/ZESeve4LOnEK8pz
         szirFAU0vYZBagmvdZ0t53biGOBPwzcYEqFr6BsOkqpB4J3fnuV1avWQwkXWMYRBUtY+
         LAHXwtr6FldJ9igXbF48vr5wDo48XC1mvOm/ELILJBxkWeauPkrKCaNfTdtVDEBDpGAH
         oKbxQnaYZvuwKvqTcVvmDMoVYWZ8HIsDYiP/TMlMmb0KjcJo8kPhagrKqYInZFsb8Pxz
         PJaLoDeoUJYmgq4LiqELDdZHPiBQZSl5tTY9hQYBC/PfyjIo7hHqBogF07l7vrrYHFaq
         cfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3f7xryob0fjp6E4pNLcCzs6IRZqkpNTpwM4Ki3mJWfc=;
        b=C8qwU2nMurJA05/9EWsFarrSjyAutnGPYry4Fw9vDwfQP4ZbKPreRFhYCglerZnYy5
         e5ZPWD757a52sqMqbSu/nRIGoR5lv11jtmqgg0Ac4EQ6nm6zyDayayDO8t2dXFNqSKeH
         hws7D4xIFaeDhnpHoa8iDR59uPqun66ZwABtJNbUi0VhO932gVXHuNJ3ZGMsAohxxyUw
         ojey1QmOoQUs9QVyT8GQ4/qW9fQ1Z0+z5+GOOsTgX9L+taA+bLxeUBSX8hiLO9rST5So
         3M+Sum7D5L8/AtjctO338qbD9lknOL52JimXsRTxIajO7yiiNTp/SxeMvyqzbudlPIWU
         oX/A==
X-Gm-Message-State: ACrzQf2SC0j/B5+q+EXCZuaYnhWvCPoJrhDW+Vgyv5AYPHQ3y9iQJAzc
	jEEp4T48M53F19S3na9o3N3xow==
X-Google-Smtp-Source: AMsMyM4cqxu5WJGMnD/9bR1PxxPIazd9fL7WS6iN33LiqEvKrjfIVowpwiRISp5yWEonAQq1k5kbug==
X-Received: by 2002:a05:600c:4e8b:b0:3b4:c8ce:be87 with SMTP id f11-20020a05600c4e8b00b003b4c8cebe87mr19206401wmq.157.1664094044671;
        Sun, 25 Sep 2022 01:20:44 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id x12-20020adfffcc000000b0022ac672654dsm11225689wrs.58.2022.09.25.01.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 01:20:43 -0700 (PDT)
Message-ID: <9db42de1-50c4-8738-6d8b-774cc6d5756e@baylibre.com>
Date: Sun, 25 Sep 2022 10:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 1/1] arm64: dts: mediatek: mt8183: disable thermal
 zones without trips.
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 daniel.lezcano@linaro.org
References: <20220921-mt8183-disables-thermal-zones-up-v2-0-4a31a0b19e1e@baylibre.com>
 <20220921-mt8183-disables-thermal-zones-up-v2-1-4a31a0b19e1e@baylibre.com>
 <a5838d66-21dc-4905-03c5-ea049e3bd055@linaro.org>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <a5838d66-21dc-4905-03c5-ea049e3bd055@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_012049_844175_32CC86E4 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

Hi Krzysztof,

On 9/25/22 09:57, Krzysztof Kozlowski wrote:
> On 21/09/2022 11:05, Amjad Ouled-Ameur wrote:
>> Thermal zones without trip point are not registered by thermal core.
>>
>> tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
>> only.
>>
>> Disable the zones above and keep only cpu_thermal enabled.
> Please test your patches before sending upstream. :(
My apologies for the inconvenience, I mistakenly missed the error,

will send a proper V3.


Regards,

Amjad

> Best regards,
> Krzysztof
>

