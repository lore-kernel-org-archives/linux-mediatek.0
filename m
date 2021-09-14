Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAA2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 18:19:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32EFD60FA0
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 18:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32EFD60FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8karBph0JJPIPc0jbpeKDMQry9K8weunZKtiicRCd4=; b=k+qusO/3l3x0CZ
	d4OuHsAdzFbCY4Q/oK5yqNeEyt+RHLJH0XO/nD5nwygLr4dvpq7aLe9DVh5EL7838L4bwrvzlZ3qs
	GrUZv7dQignCmd8yALd3lhaEEtZE5d9e6XKKV8P24QR0anndqeFx9xIkovgNH2tIClM0gs1AuEPO8
	RxrS9Zp+B0uBKBDS1vjQCTTUe5hbtGbAX6UcEUaZuCeGi5M74w59FxVbCbaNNYoOm4GcY0IfH8wvb
	S01ZWVOaQJEiOp9SOQXSc7puUyZQLUYkUwkktUt+VERT+VqbkR3+MhF+B8skQih49X69Y6uwI33vj
	cWf38EpGkkZeAo56UIFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQD19-006iyi-N6; Tue, 14 Sep 2021 18:18:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQCea-006dvu-AO; Tue, 14 Sep 2021 17:55:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 140so235180wma.0;
 Tue, 14 Sep 2021 10:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=o4N33InZazxjk2fm8q6vK8YiuSMIHI0rSm1Fto78HVY=;
 b=Kq6HIns1wxIDQW7wVZGqtPs8Lakk8I2+OcNr4+nPCS8f/mzDXYIWAZxRV8SyM5sUl7
 KThkCXKwt+hQ2dt63JusPyHaXkRQd/hdG4E/7waUU3CQ460zJKlwL3YYywxYlkQSRipj
 eG2H/DFdMmgjEnu0ITT0qTmWNjC1TP+FcblWcm4/CiJFBebBVfahFriCoBHSbFSzGGpp
 r60UtLtehM2QgVDXIgJQAsaNl1kpDPQVKHEzz5aPcMNQXZFOFRb3y3urst5VCx1aRF0k
 xPfk6JJjY1uTSynF5d8puaV6rOVlAbsQrnhbUZJe+Dh5ke4Fj9YQTYDCZwnlEX32XaFZ
 YnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o4N33InZazxjk2fm8q6vK8YiuSMIHI0rSm1Fto78HVY=;
 b=b5Vt3Abd7zm9eU+L5jnxK2K+7marLSPAdOLMiyKUAIUpmDZy9f735yhtjTk0sH100k
 Wt+48YudX/YIyTK4e8R/ov6o1zr4Alv54uV0CYxUlUYHlGCh9Bcw/qainjOj/ZXug+Bc
 rKx0N4f4mm06WNCBwSadGFhQlgVHisr2X0oKgkGPwnNvtmssFmycZW9+lGeBSTAg2lIW
 ypLZXayad+H4RlGbeokTSPvcLZWfeHBNCv5iYoWq09S6uB9Jj94nTFAnco6w+4RCvFEc
 a3UNCyc6UsFUxO17hWGvHBkd8IX2pd9Ak1C01yWsgMmJHKLtoGtEZOI2HEzkA4ivOFib
 nIDg==
X-Gm-Message-State: AOAM532EUr86n/k1GUFj2w2JI+0ISHwsNjfWtnbKyUL0yUnXwqLe5aEx
 GSvPkXxxRB1xfAnfiYxTbt4=
X-Google-Smtp-Source: ABdhPJzUGxuis/ruDJdd5qDR8TPtVsMGxpsuKrk+eTnAx/luvB3WM899gSd766IT/oCv1KftVjMfMQ==
X-Received: by 2002:a05:600c:3203:: with SMTP id
 r3mr371006wmp.175.1631642126910; 
 Tue, 14 Sep 2021 10:55:26 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.140.66])
 by smtp.gmail.com with ESMTPSA id u16sm1982308wmc.41.2021.09.14.10.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:55:26 -0700 (PDT)
Message-ID: <016b501b-a4bf-c74d-9f7f-8145800ca6e0@gmail.com>
Date: Tue, 14 Sep 2021 19:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [RESEND,v2,8/9] arm64: dts: mediatek: add mt7986a support
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org
Cc: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
References: <20210914085137.31761-1-sam.shih@mediatek.com>
 <20210914085137.31761-9-sam.shih@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210914085137.31761-9-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_105532_459623_A171B7E4 
X-CRM114-Status: GOOD (  20.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/09/2021 10:51, Sam Shih wrote:
> Add basic chip support for Mediatek mt7986a, include
> uart nodes with correct clocks, rng node with correct clock,
> and watchdog node and mt7986a pinctrl node.
> 
> Add cpu node, timer node, gic node, psci and reserved-memory node
> for ARM Trusted Firmware,
> 
> Add clock controller nodes, include 40M clock source, topckgen, infracfg,
> apmixedsys and ethernet subsystem.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v2: modified clock and uart node due to clock driver updated
> ---
>   arch/arm64/boot/dts/mediatek/Makefile        |   1 +
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts |  49 ++++
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 227 +++++++++++++++++++
>   3 files changed, 277 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 4f68ebed2e31..e6c3a73b9e4a 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> new file mode 100644
> index 000000000000..a58347c09ab2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Sam.Shih <sam.shih@mediatek.com>
> + */
> +
> +/dts-v1/;
> +#include "mt7986a.dtsi"
> +
> +/ {
> +	model = "MediaTek MT7986a RFB";
> +	compatible = "mediatek,mt7986a-rfb";
> +	chosen {
> +		bootargs = "console=ttyS0,115200n1 loglevel=8  \
> +				earlycon=uart8250,mmio32,0x11002000";

We should be able to achieve this by using the stdout-path instead.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
