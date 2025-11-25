Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BB9D0EE00
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Nov 2025 16:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSWJkC14D263EaCk7olh/4x9IvEymCiNm9Dm8xKZmcc=; b=3fPXC7/lUoB2kpKzi20htkk1o1
	Ju7ziCim1u90BM4pZJlThgSN1iE2sHAadI/h2tN16rtWPrT1i9CxHJ2/hEpyiOlP4r4/lpa9Y06/K
	VnFDNsyTzzY4bMtfEZKlIKQ+JlQh/7rA7pPhKONL1mdhA6ofDDDX0rc7RbfBO1Ht5pZlWFHBeh4cX
	pr2QiTmC+zyXxxiBVbz4UcTUFWrQgexDYUuI8wPsUkW/NztT3IzNecxRV8+K4i8iCX2rO2Rxg1PFz
	jGPdCcUU3/jHUOYpUb4Sleoiy8PiLq+UhuEPtOiNQelVTFlQdm52Lh4x8zmJKh+uAPGe2EjkE7o+O
	C818fInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNw2k-0000000DbbS-1jhH;
	Tue, 25 Nov 2025 16:37:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNw2h-0000000Dba1-3kZe
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Nov 2025 16:37:29 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-29812589890so67474895ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Nov 2025 08:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764088647; x=1764693447; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BSWJkC14D263EaCk7olh/4x9IvEymCiNm9Dm8xKZmcc=;
        b=P0mTJa2biM7+ldEJoRilydR+zF+ucFslaqnAoWeULLj5rTBBFBnmvTkpX3zt8LL0rF
         FytjYh9zez0tUbkOpTYxnjrQEN47iLD7VZW3L4ZQqMYzdXGpkNVx7UOVs0diRmKuoaPH
         e0k7OFVo9IUGsnl9M/woRy9s71z266iK2J8UTk2S044gD+xj3LnkyhKIZEoV+Jeaz5EY
         tUbkpEGwS2VuGsSHj9SBTNsgiBH1s5FT2CRP3CWAgKopfereWzP3X7XbkZ4GpYzCzH1/
         CfHoWuta4/BwpZ4oCWwAolxQbaA7nlgaOOciUgV6yA4hV25uE/ill8oSHx5vWYuNBRra
         bHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764088647; x=1764693447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSWJkC14D263EaCk7olh/4x9IvEymCiNm9Dm8xKZmcc=;
        b=QoMAcGE7VJjYgjRcGAyeSs9Lv7ghx6UkCuvv2ACkFvKzJmDDG7eSM9r06HS9Ffzvep
         O+x6SlGK4yX22oF6kxvJw69um2VSeqIn21atW7qx265fST1PW2IRATC6n/pF2zEMnVQ9
         P5muNcwJWEfkzPfDQfSKR01t3iDqEXvidlCzZTXr8RDGI6Zf/nFMeiJ3KOPJ9keHjE2K
         JevcAz6yEXY8q+A7IhMlpOTjuFdqk8rqba/ijjVROx8M5CYB7EB+THAYSf2iZQ5Cqkd1
         DaaZMdXdZ+iwdWB/I+yI8C72kbwSzQiKwcwtm3UGe+bU4ZawG3IlvV72zPkkl9SgE8BS
         X5yQ==
X-Forwarded-Encrypted: i=1; AJvYcCULBXg4xc2GnEhwvxCyp4wEImk39JLtSX/iDb3oGP3VfS9qwqhY02Wl/6Ei+KSUndNbWhSZMxNsefwpOyIuUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNq466doPKSW5dw7q5dhDPDLMNuK4OTjwryGzoHBfgp5QFRY1y
	mDJl6t4ruU85+QFGERDHR1DgRExUcJVZOMJkINqBLJhLLiyki7+rDy3j
X-Gm-Gg: ASbGncsXXHgrRaQa/3e60VlCcP8rtrOj2izhT2vW/oQ1XlUMnU40gCYr9qGsrSkWzKD
	ei7aQ+MlGpFw7Q6SA/nmt4pe8GceyplmCo/SXII3fkOYWYRlRzikyjdDQ/1mqB/0Nqb3P8bzmLN
	oY4N18q2NrML1MCg5/vBkHnLP77qQYgYjzqHJCllwNvD23N1K0DIHkMd/3rpSgMgts4Fmur1Ub6
	U6wpXksfKVcYDvUJBMb46M8Kgp/8NuzD4a8hpMjnn/9oeXNmPFv5mDUKHwQk0TtL9pPoWlfiKaM
	3jlFlY3S57rFgbcM9KS5CSDX5GrF7Qon6gLesXFBYRzQftbWh9DpIIHkC5+XrKRrhTxjjSdQSBx
	NiGSAeNNxz8uqIZDXwUJ45fcv78KK493m/F94esKVL0DCFYD614NBib2OwQ0FDB1QSjggmhRDNh
	H8ap2ZyHq7q3vztuDYsYx54D9wpyERk60BokN7a8rXLNUW
X-Google-Smtp-Source: AGHT+IFHy57b+hpQflAZiQVaoxIk86czwU51KAJ0ICKXYmkBowPOIfdH8aTLY+SWpNInrUa/0Wei8g==
X-Received: by 2002:a17:90b:3c01:b0:340:cb39:74cd with SMTP id 98e67ed59e1d1-34733f589e8mr14550720a91.32.1764088646710;
        Tue, 25 Nov 2025 08:37:26 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475ff34831sm1342209a91.5.2025.11.25.08.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 08:37:25 -0800 (PST)
Message-ID: <9b43da0b-61e1-49bb-acc2-392de3817db7@roeck-us.net>
Date: Tue, 25 Nov 2025 08:37:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Add support for the LTM8054 voltage regulator
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Romain Gantois <romain.gantois@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Peter Rosin <peda@axentia.se>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kevin Tsai <ktsai@capellamicro.com>, Linus Walleij
 <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Paul Cercueil <paul@crapouillou.net>, Iskren Chernev <me@iskren.info>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Casey Connolly <casey.connolly@linaro.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Dixit Parmar <dixitparmar19@gmail.com>, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20251124-ltm8054-driver-v4-0-107a8a814abe@bootlin.com>
 <4053840.MHq7AAxBmi@fw-rgant>
 <732D3F12-0361-4800-8981-EF629B4C491F@goldelico.com>
 <3021060.e9J7NaK4W3@fw-rgant>
 <0E900830-E248-4F0F-A048-075EAF1D2440@goldelico.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <0E900830-E248-4F0F-A048-075EAF1D2440@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_083727_945711_D703EEFF 
X-CRM114-Status: GOOD (  15.25  )
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

On 11/25/25 02:25, H. Nikolaus Schaller wrote:
...
> Another suggestion: what extending the "regulator-fixed", "regulator-gpio",
> "regulator-fixed-clock" pattern by some "regulator-gpio-iio-dac-current-limiter"
> driver to make it independent of your specific chip?
> 
The name is terrible ;-), but that is what I would have suggested as well.
I don't see anything chip specific in this code. If there is a need for
a regulator driver which uses gpio to enable it and a DAC for current limiting,
it should be made generic.

> By the way, are you aware of this feature of the regulator-gpio driver?
> 
> https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/regulator/gpio-regulator.c#L97
> 
> Just to note: I am neither maintainer nor doing any decisions on this, just asking
> questions for curiosity and from experience and giving hints for alternative approaches,
> where I hope they help to find the really best solution.
> 
Same here.

Thanks,
Guenter


