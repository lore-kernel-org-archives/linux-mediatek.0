Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B734606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 09:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=waogteed;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dgdGEb57
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eiF/jOGcMBS3RJrUa5NmDvvMwz7m35WAnkbAKQDIzuM=; b=waogteed40u2/j
	RRxk77UgDmpGIC8cY9Uy0V1FBgOZH6v6u2nQUMRDmuX69Uynqd0MYkojTq3zHxGcrSKgZJSUWWILv
	2/xJ6/4Z+DboHndEbZZY5gJ5Hd83o85LoptYg7SjaYNmHx0ygVjJaVQJyvH8pXvy6rKCrvZW/MLA8
	KYLTg0ExMsHy/rs+MxIlryeJw1EEmm54vvFFV3wDl7zJaitmX/4jWrxSD74IdaH2Pv1PFGgbcEt97
	V7eDd7u3kR4eIVY14fy4yS2fgYUPYXIPYh0gvHt/fnzz8VOur1jYrX61A2K76YPZjBoCYTdogFBKl
	mqlglVPAHawOLL/Fbeew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQh4-00000002pnB-0XRo;
	Mon, 23 Nov 2026 09:50:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQgT-00000002pHi-3ngA;
	Mon, 23 Nov 2026 09:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427400;
	bh=3gj4la20Ij/aoTkrjPe4zjbBNz3w57jb6pogEbON12I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dgdGEb575kHihZtWdp5CYVQe4oQAWhbcPM8QECisA1bwX4qys8KzAcTLJCr3CD4xQ
	 C9/G/Y+5wuHck2q8RUwpSSOFQQX1euA20THs71u61cALH4TE3mKLpGHO4LmjhwH0UH
	 b4sjwqtLbo5mwtPKKNKPDcgDDG2QjJe+kbkbPUz9+D/1020eZAaSBbQt+xeo5SCNCB
	 Mbe5GvovL18CmH9K+T2w3lh2D/uuCCx94cbHuHg9j7DefiiF1oI0XIe0NSEGt8lLTN
	 z1T1esF+jJqEKSFFCq+5HhzsH5PwP47e6VkCkRpcMnmyrUE6ebSa/SB0UNKvjyP0nT
	 kkCPMSaKx/CfQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D65F17E0DE8;
	Mon, 23 Nov 2026 10:49:59 +0100 (CET)
Message-ID: <91bdc31f-a3bd-4838-9e2a-4e06adbbea1f@collabora.com>
Date: Mon, 23 Nov 2026 10:49:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
To: Alexander Letuchiy <asalde.le1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
 <20261113-initial-mt6895-v2-9-4ab0aa9fa391@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261113-initial-mt6895-v2-9-4ab0aa9fa391@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_015002_204889_4ACE2765 
X-CRM114-Status: GOOD (  23.81  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 20:05, Alexander Letuchiy wrote:
> Add a device tree for the Xiaomi xaga board, which is sold as Xiaomi
> Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i. It enables a serial
> console on UART0 and the volume down key on the SoC keypad. The power
> and volume up keys are connected to the MT6363 PMIC, which isn't
> supported yet.
> 
> The DT only describes the memory that Linux itself uses, which is the
> ramoops region. The bootloader updates the /memory node and adds the
> firmware carveouts to /reserved-memory, so their addresses are not
> hardcoded here. This DT must not be booted with a bootloader that does
> not do this, as Linux would then use memory owned by the firmware.
> 
> The ramoops zone sizes place the console zone at the offset where the
> bootloader expects to find it.
> 
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile              |  1 +
>   .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts | 87 ++++++++++++++++++++++
>   2 files changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index a86fb313b1a9..d73489149ab5 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-sony-xperia-m5.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt6895-xiaomi-xaga.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-cudy-wr3000-v1.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
> new file mode 100644
> index 000000000000..8d529062eea1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/input/input.h>
> +
> +#include "mt6895.dtsi"
> +
> +/ {
> +	model = "Xiaomi Poco X4 GT";
> +	compatible = "xiaomi,xaga", "mediatek,mt6895";
> +	chassis-type = "handset";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:921600n8";
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		/* The size is updated by the bootloader. */
> +		reg = <0x0 0x40000000 0x2 0x0>;
> +	};
> +
> +	reserved-memory {

                 #address-cells = <2>;
                 #size-cells = <2>;
                 ranges;


> +		ranges;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		/* The firmware carveouts are added by the bootloader. */
> +
> +		ramoops@48090000 {
> +			compatible = "ramoops";
> +			reg = <0 0x48090000 0 0xe0000>;
> +			no-map;

For those ones...

> +			record-size = <0x10000>;
> +			console-size = <0x40000>;
> +			ftrace-size = <0x10000>;
> +			pmsg-size = <0x10000>;

...please, alphabetical order.

console
ftrace
pmsg
record


> +		};
> +	};
> +};
> +
> +&keypad {
> +	pinctrl-0 = <&keypad_pins>;
> +	pinctrl-names = "default";
> +	debounce-delay-ms = <32>;
> +	keypad,num-columns = <1>;
> +	keypad,num-rows = <1>;
> +	linux,keymap = <MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)>;

debounce
keypad,xxxx
linux,xxxx
pinctrl-0
pinctrl-names

status

> +
> +	status = "okay";
> +};
> +
After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

