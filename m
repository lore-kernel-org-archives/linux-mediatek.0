Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB71C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 16:42:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58EF861AAD
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 16:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58EF861AAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQyfK8bPRGc0JTCXNC+QvMAX1SbarOS4dmWGr6UmUmY=; b=rrAD8UXgTgvlRJ
	VqFPvMGVLMwc602dk5TS6lL0cbcIKN8CX9gDVhT8MBvwLb+STpbUZCQcwwHnZBmrxYD7ZOkAWHu2i
	HhTgU6alAIe4bKvxNiEvpHovNg+G7lGYhVSLP15hmnaO/iI5oaWVKyWKQU97CgCA29lcTHzCtQIR3
	6GGpOyEnLgNttE9I7l8SDLW4ETVd5LFGpRw4zox0bQemFl31uFg9XrmAkCX7tTectbr6CntlUimdR
	CPa2GCwmR9+Z6RjQ2RX3ffb7jNS0xqI/DyHccP7rn7VcbNlOaampCiIO/G7wXpoEUePCBpigF4921
	loBr8RKJrN6lXcAhp3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmf3r-00GNDV-S6; Mon, 15 Nov 2021 16:42:27 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmf3o-00GNCM-50; Mon, 15 Nov 2021 16:42:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso283174wme.3; 
 Mon, 15 Nov 2021 08:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JuqPZpJkmVPxr1XEd2xmER6X+Ym/lgTGuP07ml9bU0g=;
 b=GJUKEGDKs7KpQ/B8MSIsEkzPmGD9HaDBMQ/7KfepUnjJ4QIuJ2U4i5lEKz2HLUwjIF
 49iPrAkz1V7h60hhJ0uSWSuS2utkMm1n8Tx7HrijpwI4oJwvYg5HcF7F/AGoDIv+hyPe
 XE9LDsTth53plL96TWa6QRbA63N0tJ0RIBsghoDuPprc9XYvGjCNi4qmckFaQvoW6+lF
 LQtGZWmW/xTfoKBXq3WVZ7DPptprQvRKQWYQnOApM8xZQ6H0SFyuA1DBokbdWvjZ8WDV
 713hzutv++iddTkcWPejXBCK2u4v7IECLNl9sTHyDpa/zlE1SbZbZjmUWgmmpwd6VUEt
 0Vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JuqPZpJkmVPxr1XEd2xmER6X+Ym/lgTGuP07ml9bU0g=;
 b=WTsnkTXmWRUX/7jM5usk/xz95yrheNzX9um0xZ+2pTAlCe26r4ABOOa1HMSaU5bnkF
 JJrVCCFn3xtgHvh6fhg/k+BSs7/aUQKEzyTXcE1Hqk5c1czLgWb0f1QvYGaeFcJTSckd
 M10lLU5Vp085W/qE3Of/iAWfVg+h5UjjXFpQhBes8w2/F3iLUyP6d5a12bXNfss7mWOY
 JurZoeFbR4LTPCLaXa+Izk7/4dQUOkrPqHMxk/DF7fNC73v6SaggfM/kPiSel8ON/Ip3
 K9stWlgA4hbdOIwDcbiHgTOTQ9sAXgFpmdKX2l/Aymnb/jWEOaRHdE9BY/nkpVw7VpTs
 KSsg==
X-Gm-Message-State: AOAM530ufhIwHPO3NW1RCENYBbHkottq4Q3ckH4v3/ujvWvRj2OLbzvk
 cNq2NfS1g7gvTl3jK/jBO5jJCW6ybfo=
X-Google-Smtp-Source: ABdhPJwok9H8xlFto8+eTwjCwgKcKtmnfgk3TO4CGlesnBQIwE8v1bZMANd9k7yeOeUrVOnuk1RzJg==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr59313728wmj.55.1636994542287; 
 Mon, 15 Nov 2021 08:42:22 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net.
 [188.86.219.160])
 by smtp.gmail.com with ESMTPSA id j11sm14944511wrt.3.2021.11.15.08.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 08:42:21 -0800 (PST)
Message-ID: <62e52ffc-09e5-6b83-540f-f6347fca7adf@gmail.com>
Date: Mon, 15 Nov 2021 17:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] arm: dts: mt6589: Add device tree for Fairphone 1
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, linux-mediatek@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211024084535.30959-1-luca@z3ntu.xyz>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211024084535.30959-1-luca@z3ntu.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_084224_228531_7392009B 
X-CRM114-Status: GOOD (  23.19  )
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



On 24/10/2021 10:45, Luca Weiss wrote:
> Add rudimentary support for the Fairphone 1, based on MT6589 to boot to
> UART console.
> 
> The recently added SMP support needs to be disabled for this board as
> the kernel panics executing /init with it, even though the CPUs seem to
> start up fine - maybe a stability issue.
> 
> [    0.072010] smp: Bringing up secondary CPUs ...
> [    0.131888] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> [    0.191889] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
> [    0.251890] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
> [    0.251982] smp: Brought up 1 node, 4 CPUs
> [    0.254745] SMP: Total of 4 processors activated (7982.28 BogoMIPS).
> [    0.255582] CPU: All CPU(s) started in SVC mode.
> 
> [    0.472039] Run /init as init process
> [    0.473317] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Now part of v5.16-next/dts32

Thanks

> ---
>   arch/arm/boot/dts/Makefile                 |  1 +
>   arch/arm/boot/dts/mt6589-fairphone-fp1.dts | 30 ++++++++++++++++++++++
>   arch/arm/boot/dts/mt6589.dtsi              |  2 +-
>   3 files changed, 32 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/mt6589-fairphone-fp1.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7e0934180724..24f402db2613 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1437,6 +1437,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
>   	mt2701-evb.dtb \
>   	mt6580-evbp1.dtb \
>   	mt6589-aquaris5.dtb \
> +	mt6589-fairphone-fp1.dtb \
>   	mt6592-evb.dtb \
>   	mt7623a-rfb-emmc.dtb \
>   	mt7623a-rfb-nand.dtb \
> diff --git a/arch/arm/boot/dts/mt6589-fairphone-fp1.dts b/arch/arm/boot/dts/mt6589-fairphone-fp1.dts
> new file mode 100644
> index 000000000000..c952347981de
> --- /dev/null
> +++ b/arch/arm/boot/dts/mt6589-fairphone-fp1.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Luca Weiss <luca@z3ntu.xyz>
> + */
> +
> +/dts-v1/;
> +#include "mt6589.dtsi"
> +
> +/ {
> +	model = "Fairphone 1";
> +	compatible = "fairphone,fp1", "mediatek,mt6589";
> +
> +	chosen {
> +		stdout-path = &uart3;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};
> +};
> +
> +&cpus {
> +	/* SMP is not stable on this board, makes the kernel panic */
> +	/delete-property/ enable-method;
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/mt6589.dtsi b/arch/arm/boot/dts/mt6589.dtsi
> index 70df00a7bb26..c6babc8ad2ba 100644
> --- a/arch/arm/boot/dts/mt6589.dtsi
> +++ b/arch/arm/boot/dts/mt6589.dtsi
> @@ -14,7 +14,7 @@ / {
>   	compatible = "mediatek,mt6589";
>   	interrupt-parent = <&sysirq>;
>   
> -	cpus {
> +	cpus: cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		enable-method = "mediatek,mt6589-smp";
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
