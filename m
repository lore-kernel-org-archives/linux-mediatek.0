Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8017AC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 13:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yNMGdQC/Xw2IM5J0z39LrXI/wVpt74oZIMsD87S200=; b=Xs29UQan6NjyOb1V8aHAojgznY
	5zSFYIMfjkdpemauposcXVO7g6uVT8XyOv6RXtclACiUasHUoN6yvpPYJzo/XQCllPRP7D6xvr1a+
	8zCiW1TNLZuUtGIO5Ct7dDz2yG01+F127K8OPFgO2NHEyf2zCjS/IQ5b++32BmNGg2s+ynWLKGK1Q
	fyuXBzx8BWVWkVjiN2Yb9sPViyelR6ebKsNEWBsfS09zwUVdBEZWCXFSb4dxkKZaBvUu8dpzJsCdy
	EwhKUYIsIMuNc6gqS8e7YOgZepQ6aTmmrw/N8N/u9tVxd068kMhd4D85TuXm9Wd2EvqveP3RozTq6
	+00uJz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGkY-00AFnQ-Nw; Thu, 09 Mar 2023 13:56:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGj5-00AEvP-2W
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 13:54:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso3647902wmi.4
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 05:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678370071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+yNMGdQC/Xw2IM5J0z39LrXI/wVpt74oZIMsD87S200=;
        b=K7sXdAFy2z4bNQssKxVGN0CKWVjncTXW3VNw27sxQUhZ4toVTMpMfoKgamejk4M//3
         UYw0C5S0MB14uALgQJ0MU8mkL13/HcmZ58Ma2NprweXhZTT+MTN3cHCmCO16cWEhFmZJ
         S8lUWOV7zXulkBDx0mS9OPGDVaswJ7Gc+2PdVKtM9mU9HeiXSM2LfUJwlMFTMxPn8zes
         jpWki0+2dgBR/u25caK3XxHeVY8jtubTX3/H8MOv8IZDVt54A5Ng9/ASlgnTKnHn5gmi
         JpIVvIG86rQCG+AIHULWfhPK1DJuMzARFYBcFu+kR3CeJroS3LoxfCYLwGcEgKE/phNn
         nfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678370071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+yNMGdQC/Xw2IM5J0z39LrXI/wVpt74oZIMsD87S200=;
        b=O1kPF2UWsXvA9NgtzblnvaU8YML+oXgTh22SEIqNXk790Dif2PbJkkKPuyn1O7j19q
         uJAnbmYV+IWW017sdS1XQFRPjNiwx5xpfxdmPj/hckaPS0jmjN2qxM5CuTxltmdai1Sr
         sEe04iezbekgha3ojEbhb2sAafvl7/A9lRNdPqRRVx03+MoptGydVvR/8iuzLK+Tnf+L
         lj4CZ5sOwG4q1o60jhDS3CuTA4jWDG7SOkVVKvSCY8YDOuASekTBneML3VNnIC2QzMVW
         W3BuPSYIYe+Vksq2qCwMxg1RqcQQ+9Y0mU7HTNZg6ZEMl3iz8u9dwC+MPVB8nYCzPIa3
         duXg==
X-Gm-Message-State: AO0yUKU5iNvajjKCT5UIP0yyCRCTpON1Bffatc3BDVm3X2aDMTI5EzPN
	xajNhurTkfG3pJbJzLg3p/0iRQ==
X-Google-Smtp-Source: AK7set9BC1aUcCmXpoGmNq+F0KtxUnHtaWTpYlQDUbfH+9jnFAvfgT6oTZA+trXsjWT36mi++mzKeg==
X-Received: by 2002:a05:600c:2199:b0:3eb:f59f:6daf with SMTP id e25-20020a05600c219900b003ebf59f6dafmr7949883wme.34.1678370071103;
        Thu, 09 Mar 2023 05:54:31 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id v15-20020a05600c444f00b003e2232d0960sm2757515wmn.23.2023.03.09.05.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 05:54:28 -0800 (PST)
Message-ID: <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
Date: Thu, 9 Mar 2023 15:54:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Serge Semin <fancer.lancer@gmail.com>, Sergiu.Moga@microchip.com,
 Mark Brown <broonie@kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 Claudiu.Beznea@microchip.com, chin-ting_kuo@aspeedtech.com, clg@kaod.org,
 joel@jms.id.au, andrew@aj.id.au, kdasu.kdev@gmail.com, han.xu@nxp.com,
 john.garry@huawei.com, matthias.bgg@gmail.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, haibo.chen@nxp.com,
 yogeshgaur.83@gmail.com, heiko@sntech.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, michal.simek@xilinx.com,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
 <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
 <03a9f117316ab81f1b5a18100f771e65@walle.cc>
 <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
 <460ef5ff3846b409b322ca53559e2476@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <460ef5ff3846b409b322ca53559e2476@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_055435_169759_2D568B5E 
X-CRM114-Status: GOOD (  19.25  )
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



On 09.03.2023 15:33, Michael Walle wrote:
>>>> The controllers that can talk in dummy ncycles don't need the
>>>> dummy.{buswidth, dtr} fields.
>>>>
>>>> The controllers that can't talk in dummy cycles, but only on a "byte"
>>>> boundary need both buswidth and dtr fields. Assume a flash needs 32
>>>> dummy cycles for an op on 8D-8D-8D mode. If the controller does not 
>>>> have
>>>> the buswidth and dtr info, it can't convert the dummy ncycles to 
>>>> nbytes.
>>>> If he knows only that buswidth is 8, it will convert ncycles to 4 
>>>> bytes.
>>>> If dtr is also specified it converts ncycles to 2 bytes.
>>>
>>> No they don't need it. Lets take your semper flash and assume it needs
>>> 12 latency cycles. SPI-NOR will set ncycles to 12 *regardless of the 
>>> mode
>>> or dtr setting*. The controller then knows we need 12 clock cycles. 
>>> It has
>>> then to figure out how that can be achieved. E.g. if it can only do the
>>> "old" byte programming and is in quad mode, good for it. It will send 6
>>> dummy bytes, which will result in 12 dummy clock cycles, because 1 byte
>>> takes two clock cycles in quad SDR mode. If its in octal mode, send 12
>>> bytes. If its in dual mode, send 3 bytes. Obiously, it cannot be in
>>> single bit mode, because it cannot send 1.5 bytes..
>>>
>>
>> You miss the fact that you can have 1-1-4. What buswidth do you use
>> for dummy, the address buswidth or the data buswidth?
> 
> Doesn't matter, does it? The driver is free to chose, 1, 4, or anything
> else. You don't sample any data during the dummy phase.
> To answer your question: single for instruction, single for address,
> whatever you choose for dummy as long as there are ncycles space between
> address and data, and quad for data.

Huh? How does the controller chose, based on what?

> 
> Depending on the capabilites of the hardware it will likely be 1 or 4.
> 
>> What happens if crazy protocols like 1S-1S-8D appear? What buswidth
>> and transfer mode are you going to use for dummy?
> 
> Also doesn't matter. What matters is how many dummy clock cycles you
> do. Again, they don't depent on the mode. You just have to count
> the clock cycles between the address and the data phase (and that is
> what your ncycle parameter will tell the controller).
> 
>> And please don't tell me that "we're going to assume that
>> dummy.buswidth = address.buswidth because that's what we currently do
>> in SPI NOR", because I'm not convinced that the assumption is correct.
> 
> No, it doesn't matter :)
> 
> -michael

