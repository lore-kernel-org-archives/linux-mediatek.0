Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4626C98302
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 21:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzksdNKE6zFNjKkRtgxoYFjKiQIY4jM1ByvFS9VthaE=; b=vpFix48fcaxRY+LC3qmqbB9IEc
	0UT/bJ/+LjrZNUKDd8hWtHHcLYz7G86mwzeWpds4sgPHx2K2wTxrBvHZR97RDskslBmaJoJkz3Gds
	8Giu+M+9d47NCbCZcLr6fIVoAOPk8Ux5n0ZhRmDyytrNC4gMR/5Qz9rFWqnn+KCQoL64oSjUSUQlf
	CK788whDzTNHv9TnQGl4kynQ3V5xFjPGFRLpc/qL7hwOiDkIuffG3A5EigjJP/5l1c/kLcBUIRC1J
	iDQhfcIlKoPMV0VbdqagTcG3RvjCpU4HjZJZnP4gue4AXRDiefng9QkEvquuv4VBZTDaHSK539mPq
	NIbEWHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrNm-0000000EuRu-0JKZ;
	Fri, 16 Jan 2026 21:29:26 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrNg-0000000EuLp-2fbm
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 21:29:24 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7cfd7d33b88so878180a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Jan 2026 13:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768598959; x=1769203759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzksdNKE6zFNjKkRtgxoYFjKiQIY4jM1ByvFS9VthaE=;
        b=V8Rr5dGVR/1Wf5/1WQsXRZYcJY/0vT0xbP+mq0KLf0b7NEGf6E3Y4e8PI/GYebaeF6
         PHCn8RtOsuAfzR38ppEd9qXFsMa+qSsCQNsqL5YMZaZzJopvkGphwDNSSG/0QAmVelfF
         ZmJjtU/H6UGunhHG/2CzZ2SiEr0UvVyAt+i1+PCFzMbNBFt7BlwmmPgt9eblIxzptB7Y
         P2A79zPVJnF5WUtUMR4HqcxYX/6lI27IizCla9fsp5bNtNwIJyRi/aupovVDHFmdGBia
         aC08bNj8Awj+TGDiZD2y5a3NL1x6mhOEP+enWK42TPwp4B/+Kojs3BLXhNtonMCp71M7
         V6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768598959; x=1769203759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzksdNKE6zFNjKkRtgxoYFjKiQIY4jM1ByvFS9VthaE=;
        b=FFMGJmf7aYNT2tW1bLi7ZF1EFzpK4h1HI4dkCdM1brcIuTszHVdniPMwdUDqv+osRg
         dRCq8yUfwKt8Q5Tv8YHd6YS4s1BrOiqVaTYJAs2yMJk0l/sTNhZOZSo5G5tmtSkDwqUZ
         4Ybgmirf4fvMDDKC4TGkJyulENZW43M5GAO8JOg1nhl3NXHl3kGVm8s92TxpMTZE2Fmz
         H936EujhZEUDuB0ll6AYL8GIQqDYmluKjMMEPpW1sabC5ImHCb+l9MWERi0vZmkDN0GP
         +YBE4nu1Z3WDEhPsWxWbkFF0QXWkdOXxIVVfYpzhAmtYveWB1qSGfkfIcwarjhBNg/Q0
         0c3g==
X-Forwarded-Encrypted: i=1; AJvYcCWZTngWOZ+irOMchSM+EtgBNUZvvC+XGUEjg76OsjgmO4TvCP9rc6X6ZHD8ujhtw8iecFI+39NVG9jbs+TjNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzfGeSZS3GDlG+Cnn5RUqzHkatVw5Sq7pQ+rzfnsh741AfVU24
	QPayZr7iW7vCDVbcjGk121+WtzHWtg3GKLC0UtVNqMUHz5LjFoNFYSV8add4qvYv9IA=
X-Gm-Gg: AY/fxX7LEqL9RmjgLYHnxUw99aD5yD2mV8Zrc9GW9lCWM375nVOr3u69YR1XxiPKoeF
	T54w9zd9viuFqVO5+GE4xioeswlHbESm2wHsFhYDBugViWvc5wSszWAF/8xEJsgupt1jQfZqu9m
	9wpyV0POQaYv8WSus9acifkCui6aK7BBCwrJrpAuePGCmonz+0kLttQkFqBX/htfCLk9upl3PCx
	3tya3X1IZmAJWhEV/bciOr0cJ7hN1LDFl8nUF711F+hpWC6IX+QXdzULTj2w1WWTLS0UcYUNb6V
	7T2ZVwjCoe5te7htCGhQ+DG+xLxHZKLJfP/hjWECcSMo0FzR1TCdGwnvxJSWYL1kovAOgYVT7Pm
	cuIzu4TD4Gh4cmSmcQJz+GPUhU410M68hRUsSY634DZzkqWau+/jx0XPjD8PmyegXuXwCkohukt
	FaWNw3PLpUi6L4ZAaFUm4YbVaPMEfLghuleak3RGQUAWHdrIfYA1n5Qzhr7DQd
X-Received: by 2002:a05:6830:67d4:b0:7c7:827f:872e with SMTP id 46e09a7af769-7cfe028fa47mr2364292a34.38.1768598958732;
        Fri, 16 Jan 2026 13:29:18 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:bd39:740e:f70f:5f7d? ([2600:8803:e7e4:500:bd39:740e:f70f:5f7d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf2b593csm2229799a34.26.2026.01.16.13.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 13:29:18 -0800 (PST)
Message-ID: <108c951c-6124-48f2-9d8b-cac113b24402@baylibre.com>
Date: Fri, 16 Jan 2026 15:29:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm: dts: mediatek: fix pinctl node names
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com>
 <176772122105.2350532.2584006959358435109.robh@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <176772122105.2350532.2584006959358435109.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_132920_967954_CA13C058 
X-CRM114-Status: GOOD (  25.86  )
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

On 1/6/26 11:43 AM, Rob Herring wrote:
> 
> On Tue, 06 Jan 2026 09:20:54 -0600, David Lechner wrote:
>> While passing by, I noticed that the pinctrl nodes in a couple of dtsi
>> files did not match the addresses in their reg properties. Here are some
>> patches to fix that.
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
>> David Lechner (2):
>>       arm: dts: mediatek: mt7623: fix pinctrl node name
>>       arm: dts: mediatek: mt8135: fix pinctrl node name
>>
>>  arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
>>  arch/arm/boot/dts/mediatek/mt8135.dtsi | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>> ---
>> base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
>> change-id: 20260106-mtk-fix-mt7623-pinctl-name-f8593953bed7
>>
>> Best regards,
>> --
>> David Lechner <dlechner@baylibre.com>
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Base: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe (use --merge-base to override)
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/mediatek/' for 20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com:
> 
> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: pinctrl@1000b000 (mediatek,mt7623-pinctrl): 'cir-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
> 	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: pinctrl@1000b000 (mediatek,mt7623-pinctrl): 'cir-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
> 	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: pinctrl@1000b000 (mediatek,mt7623-pinctrl): 'cir-default', 'hdmi-default', 'hdmi_ddc-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
> 	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pinctrl@1000b000 (mediatek,mt7623-pinctrl): 'cir-default', 'hdmi-default', 'hdmi_ddc-default', 'i2c0-default', 'i2c1-alt', 'i2c1-default', 'i2c2-alt', 'i2c2-default', 'i2s0-default', 'i2s1-default', 'keys-alt', 'leds-alt', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'musb', 'nanddefault', 'pcie_pin_default', 'pwm-default', 'spi0-default', 'spi1-default', 'spi2-default', 'uart0-default', 'uart1-default', 'uart2-alt', 'uart2-default' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
> 	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
> 
> 
> 
> 
> 

It's a bit late for me to be replying but this came up on IRC...

I thought it was obvious that these were unrelated existing warnings, so
I didn't reply initially. But to save anyone else the trouble of figuring
it out, it should not block this series. I can send a separate patch later
to fix the existing warnings if we want to clean that up too.


