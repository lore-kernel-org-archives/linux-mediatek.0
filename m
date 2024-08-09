Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589CDC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Aug 2024 06:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3S0qr9/Jv03AD+fUOeSyuNhsSFPzVg2JMztEACb1ujM=; b=e0/Tix3XFUUXR0maxfQwQRymUE
	7MkIvPTLejFRaUBAgYDCybdJWHMBzLY2I/ZdaOywgeaQLrEK+zq4dGFndvdFoRSjDgn3EB04wXGqj
	OzRM6cBmFScVTSJ9DDbPCl3dSP/VvscNeJQpjXlXWAJr3KDtMsllp81UtQDnW+4zniySuUBnNgUQK
	mocmn/8TRwky3MjN6Aj0+kwyhep8OCWuXsol0bpNfd/FWvRIfP9ZV7Q6+jf6K7wfTQSeJoZwfiAss
	ZvYtQY3Fo+9FUObGkvZdKZVBSU+CKk4rGklNLhc1SVcp+ld2A7ybNHm8qCbpYsB7lYSOoc2gpbC3t
	Jk2vyPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scJ3I-0000000AQbU-3NYH;
	Fri, 09 Aug 2024 06:24:40 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scJ3F-0000000AQZz-1XRp
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Aug 2024 06:24:38 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so3632283e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Aug 2024 23:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1723184675; x=1723789475; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3S0qr9/Jv03AD+fUOeSyuNhsSFPzVg2JMztEACb1ujM=;
        b=Dr2G1yLDiEfcNdvHCc/zN+vaXk/ZBHqECk5fK41+xA3Nse7LIX0TvoAB5wLJjyV0gq
         ixbou8CIPhKNp/S6CgWjOAnBHvSbyM++dtariAtVRtSldYlQS151pcnuMjYypr/t88Ow
         JNN0UEg+czipPL3WW8ugxy2V5vGM+755BTkoUlgwKXukhwn9bb6sUJLpkbBxz310Evxb
         PKW2wNvjT8qwNpf8emXNb0V8Eedb/AVWs6IGD8WLla6OvlLMdNkNlzDhP0a8n1LFRShr
         +IQF7Cj4Lne6jYMv3mFO7Hkm+YZSIfGFeydRmIBz6wGAmriw4v2i6ZHNmUWnVPj0yhCF
         WCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723184675; x=1723789475;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3S0qr9/Jv03AD+fUOeSyuNhsSFPzVg2JMztEACb1ujM=;
        b=OnkaxxeSwr4fXbSJzde77fG2LnoMQlsPlwtWfDHR/xEZ5wSAM7XLkQS7cKST0TDQlM
         2rrpH3uThjQm8IiK/rL1fwYLJhEt+6I6Gm2xKvAesZOXnWWgXfmyrMrR6J3QqdowJDgF
         INYXq07xXgREKf9eG8zJvXIu6fZ1z4KSGTseyMHgD8L8Z6mnFyjPMPafjWriOIli/3wQ
         Tq7apWi9P9GuZgbGUmYaofAsz5UnL5IaXEH/UpUC0iRGD+vtaxttgJVue/9rfBUdVlB7
         stI7VuxkfUo8n4dcPfL4FeRAGhYmZsTVwNx0pokNjC8Gl1YkDDc61Wk0pWieaL+TuCz8
         cBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS+Vz21DvNN1qbIGm2LZrJ+Om8CVLRK5qyibgLslBlrKZ5p2mYVTNPifKI9j4Y5Eo1qYgRDagoz+7ZlEk1I6BvyIizT/smJq6BYzs9+yByNNxb
X-Gm-Message-State: AOJu0Yyjql4R50giKVRCJ9ludkbmqipkN3ft/csoujKRLQAEsH+Wu+RU
	bP0yXWOeM8GtN/5kvOLtEfkcj3skF2RfxEFRV8M5PiJMjvVwCfxJ8VgRoC0h/0c=
X-Google-Smtp-Source: AGHT+IFtRJSAy81Ovy9X/JT0lVaScHSB+oACg+nIrM17DzL37eBwuT4MrcU43b5nLMl8P8skePBRZg==
X-Received: by 2002:a05:6512:1392:b0:52c:dd94:bda9 with SMTP id 2adb3069b0e04-530eea1cf6cmr498847e87.56.1723184674977;
        Thu, 08 Aug 2024 23:24:34 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c61575sm811830366b.92.2024.08.08.23.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 23:24:34 -0700 (PDT)
Message-ID: <efcb1b43-2098-4490-8d10-b4f887ae862e@tuxon.dev>
Date: Fri, 9 Aug 2024 09:24:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/27] Add support for sam9x7 SoC family
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 tglx@linutronix.de, lee@kernel.org, sre@kernel.org, p.zabel@pengutronix.de,
 richard.genoud@bootlin.com, radu_nicolae.pirea@upb.ro,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, linux@armlinux.org.uk,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ychuang3@nuvoton.com, schung@nuvoton.com, mihai.sain@microchip.com,
 andrei.simion@microchip.com, arnd@arndb.de, Jason@zx2c4.com,
 dharma.b@microchip.com, rdunlap@infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240729065603.1986074-1-varshini.rajendran@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240729065603.1986074-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_232437_448671_5A3F5D87 
X-CRM114-Status: GOOD (  15.73  )
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



On 29.07.2024 09:56, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added

[ ... ]

> 
>  Changes in v6:
>  --------------
> 
>  - Addressed all the review comments in the patches
>  - Picked up all Acked-by and Reviewed-by tags
>  - Reverted the IRQ patch to that of version 3 of the same series
>  - All the specific changes are captured in the corresponding patches
> 

[ ... ]

> 
> Varshini Rajendran (26):
>   dt-bindings: atmel-sysreg: add sam9x7
>   ARM: at91: pm: add support for sam9x7 SoC family
>   ARM: at91: pm: add sam9x7 SoC init config
>   ARM: at91: add support in SoC driver for new sam9x7

Applied to at91-soc, thanks!

>   dt-bindings: clocks: atmel,at91sam9x5-sckc: add sam9x7
>   dt-bindings: clocks: atmel,at91rm9200-pmc: add sam9x7 clock controller
>   clk: at91: clk-sam9x60-pll: re-factor to support individual core freq
>     outputs
>   clk: at91: sam9x7: add support for HW PLL freq dividers
>   clk: at91: sama7g5: move mux table macros to header file
>   dt-bindings: clock: at91: Allow PLLs to be exported and referenced in
>     DT
>   clk: at91: sam9x7: add sam9x7 pmc driver

Applied to clk-microchip, thanks!

>   ARM: at91: Kconfig: add config flag for SAM9X7 SoC

Applied to at91-soc, thanks!

>   ARM: configs: at91: enable config flags for sam9x7 SoC family

Applied to at91-defconfig, thanks!


