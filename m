Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFDCC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptYxFOhxTT3yZkc62YyyBtv/7CHGfDh3eyA9MGBOQZ0=; b=M6iomPh9tGUoHK
	xt7hypsvij+6T5l1YiIB+c+9RpDSO7n+zXl+aBpwB2jdbptjG6tna1k3ip2ymcAjTtiwoT5HbuBac
	7Nb7OfZJB5KZsGG+qDM1205Q51QeyIylt39t0fzEykoiUDuIl5c/9foJzrfDoq4v2Rfcu3+Nk7vew
	YG8pov26I3G8rzxV1o/njj3261/tVGfoR+fRhEWrIiNZ9jqgaPYs8HxZWqD5PwfK0+IHYT2YnvROs
	nMQaS6GlFu2EFjlhY23NHDOq8ewTm9LgdEmJOpLL24wN2hrNkVbZtzZQuQvS4PAPdi6uFA+D0q3mV
	d29o+7O2DQC0NapY6uPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEUHf-008wu4-Lc; Mon, 31 Jan 2022 10:51:43 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEUHZ-008wsZ-4q
 for linux-mediatek@lists.infradead.org; Mon, 31 Jan 2022 10:51:42 +0000
Received: by mail-vk1-xa33.google.com with SMTP id l196so7981275vki.5
 for <linux-mediatek@lists.infradead.org>; Mon, 31 Jan 2022 02:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sartura-hr.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gEcbCZ9SEuNkvQk4iO7pOygvmUwF0b4ShU4kSdHzgQw=;
 b=Z0FQyy8QzQeNs6M6D5Ez9Z9bglKj7NfFxafbHoo2HfMSSRtdravbMERO5RyFW4Ydp/
 2Q/QcebOTqkrpJ/IeXbMarLWVb6sqr0Cxh6LGbSKzKrMQple0D8iEyPiZK/z8PMsTIrO
 6DtCRMFvVp1rge7cJ1/l9ndxP6nf5Eis+yOyJHE693AdTG8tpreDHURj6gG0FyVQVgHK
 4YJCnJuqsrDKOVKgWL4Zt0sAGGouuiTpwkQCkU6lwXw/VtYlqFjd6jSIT2Wmp6vniIkR
 lV3y3wQssjYlpJhSmnxSNdcHo4q/urCm3AwXlQgLA4qQSYq4DNFnoubrI/RXFoPGraDh
 rq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gEcbCZ9SEuNkvQk4iO7pOygvmUwF0b4ShU4kSdHzgQw=;
 b=KUJT3hBcUk930XtTsokCx8aljapVrFP4R7q+CHXqO3yL3NVl46/XnB/CqgQ+Eb+N+D
 Z9/j+/3SlFfoN2G2LJGPkS5Pp12YZhXF4IodNja+wQ/0O7+XFJXjFmzNWLkRDB4YfZ4M
 +tRgBSJjjE5NB0OLCQGXl+EgcIoC2BPnRgmUl1Y7Z1MiANf+DniN469qMjASh8x8j/Oe
 EAmXl4SgV8N1MfFtNiGrb+wU8zXcOGEFp+fVruCY4ir8lPKjpIuDQ6AurLAqpVgq7B8d
 QD6y9Xt6aG6AZj1O9v73KajTogJ7fbtwPKhYXtn/2KOlSzmYYj1LAOrCBFI5Kt/K2ga3
 VSSA==
X-Gm-Message-State: AOAM531gOr3n/zS9yAglFSYAm2vWXAUoTBewjMkvTxNor7wEQO9rSE8a
 2pA6+OW49rnLCt9RmgkDNGe33mK/Hvah+ll52NttVA==
X-Google-Smtp-Source: ABdhPJzC4Z4Er06h5iO9SCQTPBPGNbJtYRJou/tRxvXYSKc6zDTFybmNra3FrflcYNtTMn5/domt3a1xtmX3VpESLGQ=
X-Received: by 2002:a05:6122:990:: with SMTP id
 g16mr7923498vkd.3.1643626294771; 
 Mon, 31 Jan 2022 02:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20220130145116.88406-1-nbd@nbd.name>
 <20220130145116.88406-4-nbd@nbd.name>
In-Reply-To: <20220130145116.88406-4-nbd@nbd.name>
From: Luka Perkov <luka.perkov@sartura.hr>
Date: Mon, 31 Jan 2022 11:51:23 +0100
Message-ID: <CAKQ-crhDHXZptWr5rO5Rb9JttQREoPqE4YO-6nzC2OWc-z06_g@mail.gmail.com>
Subject: Re: [PATCH v9 03/13] ARM: Add basic support for Airoha EN7523 SoC
To: Felix Fietkau <nbd@nbd.name>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 John Crispin <john@phrozen.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Robert Marko <robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_025138_093318_7D90F7BF 
X-CRM114-Status: GOOD (  25.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Felix,

On Sun, Jan 30, 2022 at 3:56 PM Felix Fietkau <nbd@nbd.name> wrote:
>
> From: John Crispin <john@phrozen.org>
>
> EN7523 is an armv8 based silicon used inside broadband access type devices
> such as xPON and xDSL. It shares various silicon blocks with MediaTek
> silicon such as the MT7622.
>
> Add basic support for Airoha EN7523, enough for booting to console.
>
> The UART is basically 8250-compatible, except for the clock selection.
> A clock-frequency value is synthesized to get this to run at 115200 bps.
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Bert Vermeulen <bert@biot.com>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  arch/arm/Kconfig                 |  12 ++++
>  arch/arm/Makefile                |   1 +
>  arch/arm/boot/dts/Makefile       |   2 +
>  arch/arm/boot/dts/en7523-evb.dts |  27 +++++++
>  arch/arm/boot/dts/en7523.dtsi    | 117 +++++++++++++++++++++++++++++++
>  arch/arm/mach-airoha/Makefile    |   2 +
>  arch/arm/mach-airoha/airoha.c    |  16 +++++
>  7 files changed, 177 insertions(+)
>  create mode 100644 arch/arm/boot/dts/en7523-evb.dts
>  create mode 100644 arch/arm/boot/dts/en7523.dtsi
>  create mode 100644 arch/arm/mach-airoha/Makefile
>  create mode 100644 arch/arm/mach-airoha/airoha.c
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 796fc8017f5d..57ef390d3146 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -572,6 +572,18 @@ config ARCH_VIRT
>         select HAVE_ARM_ARCH_TIMER
>         select ARCH_SUPPORTS_BIG_ENDIAN
>
> +config ARCH_AIROHA
> +       bool "Airoha SoC Support"
> +       depends on ARCH_MULTI_V7
> +       select ARM_AMBA
> +       select ARM_GIC
> +       select ARM_GIC_V3
> +       select ARM_PSCI
> +       select HAVE_ARM_ARCH_TIMER
> +       select COMMON_CLK
> +       help
> +         Support for Airoha EN7523 SoCs
> +
>  #
>  # This is sorted alphabetically by mach-* pathname.  However, plat-*
>  # Kconfigs may be included either alphabetically (according to the
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 77172d555c7e..34baf885573a 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -160,6 +160,7 @@ textofs-$(CONFIG_ARCH_AXXIA) := 0x00308000
>  # Machine directory name.  This list is sorted alphanumerically
>  # by CONFIG_* macro name.
>  machine-$(CONFIG_ARCH_ACTIONS)         += actions
> +machine-$(CONFIG_ARCH_AIROHA)          += airoha
>  machine-$(CONFIG_ARCH_ALPINE)          += alpine
>  machine-$(CONFIG_ARCH_ARTPEC)          += artpec
>  machine-$(CONFIG_ARCH_ASPEED)           += aspeed
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index e41eca79c950..5c2dd47b58b0 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -187,6 +187,8 @@ dtb-$(CONFIG_ARCH_DAVINCI) += \
>         da850-lego-ev3.dtb
>  dtb-$(CONFIG_ARCH_DIGICOLOR) += \
>         cx92755_equinox.dtb
> +dtb-$(CONFIG_ARCH_AIROHA) += \
> +       en7523-evb.dtb
>  dtb-$(CONFIG_ARCH_EXYNOS3) += \
>         exynos3250-artik5-eval.dtb \
>         exynos3250-monk.dtb \
> diff --git a/arch/arm/boot/dts/en7523-evb.dts b/arch/arm/boot/dts/en7523-evb.dts
> new file mode 100644
> index 000000000000..69754ef9a628
> --- /dev/null
> +++ b/arch/arm/boot/dts/en7523-evb.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/dts-v1/;
> +
> +/* Bootloader installs ATF here */
> +/memreserve/ 0x80000000 0x200000;
> +
> +#include "en7523.dtsi"
> +
> +/ {
> +       model = "Airoha EN7523 Evaluation Board";
> +       compatible = "airoha,en7523-evb", "airoha,en7523";
> +
> +       aliases {
> +               serial0 = &uart1;
> +       };
> +
> +       chosen {
> +               bootargs = "console=ttyS0,115200 earlycon";
> +               stdout-path = "serial0:115200n8";
> +               linux,usable-memory-range = <0x80200000 0x1fe00000>;
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x80000000 0x20000000>;
> +       };
> +};
> diff --git a/arch/arm/boot/dts/en7523.dtsi b/arch/arm/boot/dts/en7523.dtsi
> new file mode 100644
> index 000000000000..f1d4c03aad89
> --- /dev/null
> +++ b/arch/arm/boot/dts/en7523.dtsi
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       interrupt-parent = <&gic>;
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               npu_binary@84000000 {
> +                       no-map;
> +                       reg = <0x84000000 0xA00000>;
> +               };
> +
> +               npu_flag@84B0000 {
> +                       no-map;
> +                       reg = <0x84B00000 0x100000>;
> +               };
> +
> +               npu_pkt@85000000 {
> +                       no-map;
> +                       reg = <0x85000000 0x1A00000>;
> +               };
> +
> +               npu_phyaddr@86B00000 {
> +                       no-map;
> +                       reg = <0x86B00000 0x100000>;
> +               };
> +
> +               npu_rxdesc@86D00000 {
> +                       no-map;
> +                       reg = <0x86D00000 0x100000>;
> +               };
> +       };
> +
> +       psci {
> +               compatible = "arm,psci-0.2";
> +               method = "smc";
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu = <&cpu0>;
> +                               };
> +                               core1 {
> +                                       cpu = <&cpu1>;
> +                               };
> +                       };
> +               };
> +
> +               cpu0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a53";
> +                       reg = <0x0>;
> +                       enable-method = "psci";
> +                       clock-frequency = <80000000>;
> +                       next-level-cache = <&L2_0>;
> +               };
> +
> +               cpu1: cpu@1 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a53";
> +                       reg = <0x1>;
> +                       enable-method = "psci";
> +                       clock-frequency = <80000000>;
> +                       next-level-cache = <&L2_0>;
> +               };
> +
> +               L2_0: l2-cache0 {
> +                       compatible = "cache";
> +               };
> +       };
> +
> +       gic: interrupt-controller@9000000 {
> +               compatible = "arm,gic-v3";
> +               interrupt-controller;
> +               #interrupt-cells = <3>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               reg = <0x09000000 0x20000>,
> +                     <0x09080000 0x80000>,
> +                     <0x09400000 0x2000>,
> +                     <0x09500000 0x2000>,
> +                     <0x09600000 0x20000>;
> +               interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +       };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +                            <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +                            <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +                            <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +       };
> +
> +       uart1: serial@1fbf0000 {
> +               compatible = "ns16550";
> +               reg = <0x1fbf0000 0x30>;
> +               reg-io-width = <4>;
> +               reg-shift = <2>;
> +               interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +               clock-frequency = <1843200>;
> +               status = "okay";
> +       };
> +};
> diff --git a/arch/arm/mach-airoha/Makefile b/arch/arm/mach-airoha/Makefile
> new file mode 100644
> index 000000000000..a5857d0d02eb
> --- /dev/null
> +++ b/arch/arm/mach-airoha/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-y                  += airoha.o
> diff --git a/arch/arm/mach-airoha/airoha.c b/arch/arm/mach-airoha/airoha.c
> new file mode 100644
> index 000000000000..ea23b5abb478
> --- /dev/null
> +++ b/arch/arm/mach-airoha/airoha.c
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Device Tree support for Airoha SoCs
> + *
> + * Copyright (c) 2022 Felix Fietkau <nbd@nbd.name>
> + */
> +#include <asm/mach/arch.h>
> +
> +static const char * const airoha_board_dt_compat[] = {
> +       "airoha,en7523",
> +       NULL,
> +};
> +
> +DT_MACHINE_START(MEDIATEK_DT, "Airoha Cortex-A53 (Device Tree)")

Since this is Cortex-A53 core is there a reason why this is not placed
within arm64 directory?

Thanks,

Luka

> +       .dt_compat      = airoha_board_dt_compat,
> +MACHINE_END
> --
> 2.32.0 (Apple Git-132)
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
