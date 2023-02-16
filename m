Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874B1C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0R1ajwKOseY9LqTp2vMJbt3K/TQRkQ1RyCqkaLnpBE=; b=BbuaHePPXJrWjVYprIaJv74eIl
	v0mWkchbnBm5ncjsx5RlkurAD47uSIXs66dUYr1NRXHGi0+80aaJCXHcvPKqSc/GNshg7IQZQJhQT
	U43m4WS3QVn4afTdoxv2iHijiy19O9wX39cFQ6R20MFGWT6RoesIppA17hVrfzrnQ1b/BZ5ktmG7u
	QzKgKmkttUT6dQBVr3LzcUmYVUZ+H6pc4qPp/19zU965RTBr82B2YED89zsYm8suJRXrFU5gtlH/X
	sZ59E7sOeUkqeI6I/tLonOxQcpmtpUk4K/qAJahSIo92Q+uwa/2XafBnbMcEj1SK9jEMjZcfD/G7k
	1tbxsrsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScUq-009wye-HX; Thu, 16 Feb 2023 11:32:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScUn-009wxR-Pb; Thu, 16 Feb 2023 11:32:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id by3so1507618wrb.10;
        Thu, 16 Feb 2023 03:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0R1ajwKOseY9LqTp2vMJbt3K/TQRkQ1RyCqkaLnpBE=;
        b=W6+5MP3XyfzuiWGTEuMw2frBxOlOcXJaorYYgKunq6tC6bbnjolXaWI1W1ER8VPUhQ
         ncO76D2Bkh5x9BytDvuq4t4oDQKet024tvfBsmBP54sfT/cJncUh8IjHQJT5hmYnST3a
         CZ+gswGo9MFYpAzc5Jb5mytDiYNNjYPWPXiIsrxSypd6s6cgPpvK3OhbDnga5rxXmaOe
         zR7+qBpD+hjlsSi+fnq88zwvIHD3TX2iA1xEEMuufe5sII9aLwqg/AfBuYIeYld/4IcL
         OzOvmGAd8GYczRywggqKEYkvdUlNjLVNFKlhHoPHItBY9mc0XXMzXhpe50UyengZjDzg
         nx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0R1ajwKOseY9LqTp2vMJbt3K/TQRkQ1RyCqkaLnpBE=;
        b=1DDlg9sOOJ5wq2KQZ0l04Lz9aPay/Yo0Z2vcT8cs3C+PJRBUdWF5nPf1pu8hOlH2uw
         tewKI6ykN/yMbEgAjpynNhgOtMLvcutsyj+CIfqv5tPZM+5G4ipSXK2yj2zvcPiRCQEy
         uFXKlKI6QKHlXV0bJrsIpiJCxxREIHWldGTuOcNZimpGYv2tWa0wFrWqTU33/Bm68Jl0
         MGtV03C111LGCN4tEJ7Nbz0FEcBcllnzd6haXfUyYA7BuhrW5tZF1wQCOGHLfVmsmlMD
         8uSKQQIiq0IAir/h04PtkW6G2Jnyf3K2fO2MbQU+icHEQTF3W2LoDKpv1E/AwXaA51NW
         HtsQ==
X-Gm-Message-State: AO0yUKV4XAYP2Z3LlQVTo2MAH4ZPUlJ4Q0GHWOAJY1PiHK32eoxducky
	kKAxHk3y6Jq1rJVmsuXijXrrBbr6YCxgZw==
X-Google-Smtp-Source: AK7set8ATgy0Dqd1n+/wZ03Pw/JgZf/gi75CTBpsr9fRq6GVo1wXIUuA3THcAydCTWCJ2CAJyiicZA==
X-Received: by 2002:adf:e19c:0:b0:2c5:617f:e348 with SMTP id az28-20020adfe19c000000b002c5617fe348mr1441741wrb.25.1676547132034;
        Thu, 16 Feb 2023 03:32:12 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z12-20020a056000110c00b002c563b124basm1225873wrw.103.2023.02.16.03.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 03:32:11 -0800 (PST)
Message-ID: <0d5d5d00-8569-a642-cca7-798c8d24a986@gmail.com>
Date: Thu, 16 Feb 2023 12:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] hwrng: add driver for MediaTek TRNG SMC
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Conor Dooley <conor.dooley@microchip.com>,
 Mingming Su <Mingming.Su@mediatek.com>, linux-crypto@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <89865515728cb937b6591160ad9c30b4bcc8dd41.1676467500.git.daniel@makrotopia.org>
 <84de90f5-da77-d3f2-c14a-d2e5c53bbf1c@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <84de90f5-da77-d3f2-c14a-d2e5c53bbf1c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_033213_870988_556B9117 
X-CRM114-Status: GOOD (  27.15  )
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



On 16/02/2023 11:03, AngeloGioacchino Del Regno wrote:
> Il 15/02/23 14:27, Daniel Golle ha scritto:
>> Add driver providing kernel-side support for the Random Number
>> Generator hardware found on Mediatek SoCs which have a driver in ARM
>> TrustedFirmware-A allowing Linux to read random numbers using a
>> non-standard vendor-defined Secure Monitor Call.
>>
>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> Hello Daniel,
> 
> incidentally, I've also done some research on this one some months ago, when
> I was deep in adding support for the Helio X10 SoC (MT6795) on Xperia M5.
> 
> The rng-v2 is simply the same rng but hypervised by the TF-A... and the only
> difference is, well, as you're also pointing out, that we're using secure
> monitor calls instead of direct MMIO handling.
> 
> There's also not much more than what you've implemented here and the only kind
> of addition that we will ever see on this one will be about changing the SIP
> command (as some older SoCs use a different one)... so...
> 
> ...I don't think that adding an entirely new driver is worth the noise, hence
> I propose to simply add handling for the Secure RNG to mtk-rng.c instead: it's
> shorter and we would only need to address one if branch on that probe function
> to set a different callback.
> 
> The clock should then be optional for *some* of those "v2 handling" devices,
> as if I recall correctly, some do need the clock to be handled from Linux
> anyway... otherwise this v2 driver will be "soon" looking bloody similar to
> the "v1", adding a bit of code duplication around.
> 
> What do you think?
> 

That was exactly what I was thinking as well when I had a look at the driver. I 
propose to add it to mtk-rng.c. I don't see any value having a second driver for 
this.

Regards,
Matthias

> Regards,
> Angelo
> 
>> ---
>>   MAINTAINERS                         |  1 +
>>   drivers/char/hw_random/Kconfig      | 16 +++++++
>>   drivers/char/hw_random/Makefile     |  1 +
>>   drivers/char/hw_random/mtk-rng-v2.c | 74 +++++++++++++++++++++++++++++
>>   4 files changed, 92 insertions(+)
>>   create mode 100644 drivers/char/hw_random/mtk-rng-v2.c
>>
> 

