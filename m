From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: mediatek: add mt6580 basic support
Date: Tue, 23 Jun 2015 21:45:08 +0200
Message-ID: <3799922.TWv12CPu81@ubix>
References: <1433319533-24803-1-git-send-email-mars.cheng@mediatek.com> <1433319533-24803-3-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433319533-24803-3-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.or, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, MY Chuang <my.chuang@mediatek.com>, Scott Shu <scott.shu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Wednesday, June 03, 2015 04:18:53 PM Mars Cheng wrote:
> This enables mt6580 basic support: interrupt, timer & uart.
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> ---
>  arch/arm/boot/dts/Makefile         |   1 +
>  arch/arm/boot/dts/mt6580-evbp1.dts |  34 ++++++++++
>  arch/arm/boot/dts/mt6580.dtsi      | 130
> +++++++++++++++++++++++++++++++++++++ 3 files changed, 165 insertions(+)
>  create mode 100644 arch/arm/boot/dts/mt6580-evbp1.dts
>  create mode 100644 arch/arm/boot/dts/mt6580.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 86217db..9298531 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -656,6 +656,7 @@ dtb-$(CONFIG_MACH_DOVE) += \
>  	dove-d3plug.dtb \
>  	dove-dove-db.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += \
> +	mt6580-evbp1.dtb \
>  	mt6589-aquaris5.dtb \
>  	mt6592-evb.dtb \
>  	mt8127-moose.dtb \
> diff --git a/arch/arm/boot/dts/mt6580-evbp1.dts
> b/arch/arm/boot/dts/mt6580-evbp1.dts new file mode 100644
> index 0000000..fbc0e10
> --- /dev/null
> +++ b/arch/arm/boot/dts/mt6580-evbp1.dts
> @@ -0,0 +1,34 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +/dts-v1/;
> +#include "mt6580.dtsi"
> +
> +/ {
> +	model = "MediaTek MT6580 evaluation board";
> +	compatible = "mediatek,mt6580-evbp1", "mediatek,mt6580";
> +
> +	chosen {
> +		bootargs = "console=ttyS0,921600n8 root=/dev/ram
> initrd=0x88000000,0x400000 earlyprintk"; +	};
> +
> +	memory {
> +		reg = <0x80000000 0x20000000>;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> diff --git a/arch/arm/boot/dts/mt6580.dtsi b/arch/arm/boot/dts/mt6580.dtsi
> new file mode 100644
> index 0000000..de669e2
> --- /dev/null
> +++ b/arch/arm/boot/dts/mt6580.dtsi
> @@ -0,0 +1,130 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "skeleton.dtsi"
> +
> +/ {
> +	compatible = "mediatek,mt6580";
> +	interrupt-parent = <&sysirq>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +		};
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x1>;
> +		};
> +		cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x2>;
> +		};
> +		cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x3>;
> +		};
> +
> +	};
> +
> +	clocks {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		system_clk: dummy13m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <13000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		rtc_clk: dummy32k {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		uart_clk: dummy26m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <26000000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	soc {

Please drop the soc node as well and just add the components directly.

Thanks,
Matthias
