Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CDFC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 02:56:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35E32619AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 02:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35E32619AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wnY4YujFiTdXQiScfCX/be5McR5ML0OH8/My/j3eseo=; b=VcPs00RWZIgQ4xjOckPTIKp52
	Idv9Kyl9jyRxkaPyaOOgeY3LmPLREG2Moxz7yOFyYr7foNOaX6Hqo2PduRqxFsRU/m7g568jyuhRC
	vpJon+Gu23RKCDGZdJ8l4Jlf443vN1CMRTCUSCJjD2ydsMtxuTNnaBM913kLIuhXCObgkyhbSpgMq
	qR2wNIJVg7KMLh5s6XfIoYNf8L8EpHSpXvK0R/c7GY0LvucT2N9ba5smU2F/sfRytujIqxNXP+piv
	brn1KG3hHRtgkaj6Pu5Zcxrx2gYyPR7IebpohVN8lm+u5jLOwC28phdlcaVRUL9cudQoCsDpyU0gZ
	v9ZAl0Ifw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOXDW-00DTLF-5M; Tue, 23 Mar 2021 02:56:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOXDN-00DTJR-NJ; Tue, 23 Mar 2021 02:56:20 +0000
X-UUID: 5707bafc454048638ad9115c0298b4f9-20210322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VpNJ4ysNUi4mHpSUcx9y6Y6iigzBeZb1dOMLDF46zqY=; 
 b=KLwEhHkkFzeEoo1Brlonh5xBln4kYeS9gW4ILVSS+s+Bg1pH1a4fVm5b5Y37QEPNG65aNm9eWaBnelEecmNRXup27D4OvY7nYJgIBN7HMnf70tJ55tcoqwdtmLnOf/aj29mEUEtP6UvuuO46ScloSgzbhCknlpf2dMqTDJyVb90=;
X-UUID: 5707bafc454048638ad9115c0298b4f9-20210322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1271352441; Mon, 22 Mar 2021 18:56:12 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 19:46:10 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 23 Mar 2021 10:46:03 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 10:46:02 +0800
Message-ID: <1616467562.11286.6.camel@mhfsdcap03>
Subject: Re: [PATCH v2 8/8] arm64: dts: Add Mediatek SoC MT8195 and
 evaluation board dts and Makefile
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Seiya Wang <seiya.wang@mediatek.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jonathan Cameron <jic23@kernel.org>, "Lars-Peter
 Clausen" <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, "Enric Balletbo
 i Serra" <enric.balletbo@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Wenbin Mei <wenbin.mei@mediatek.com>, "Stanley
 Chu" <stanley.chu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <srv_heupstream@mediatek.com>
Date: Tue, 23 Mar 2021 10:46:02 +0800
In-Reply-To: <20210319023427.16711-10-seiya.wang@mediatek.com>
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-10-seiya.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 28F8593833E94E19A1F4D91ECB4810AD8FDC1801FD7F0C0BF75ACA0B515B35272000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_025618_260291_737E4677 
X-CRM114-Status: GOOD (  17.49  )
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

On Fri, 2021-03-19 at 10:34 +0800, Seiya Wang wrote:
> Add basic chip support for Mediatek MT8195
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>  arch/arm64/boot/dts/mediatek/mt8195-evb.dts |  29 ++
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 464 ++++++++++++++++++++++++++++
>  3 files changed, 494 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index deba27ab7657..aee4b9715d2f 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -16,4 +16,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> new file mode 100644
> index 000000000000..82bb10e9a531
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Seiya Wang <seiya.wang@mediatek.com>
> + */
> +/dts-v1/;
> +#include "mt8195.dtsi"
> +
[...]
> +		nor_flash: nor@1132c000 {
> +			compatible = "mediatek,mt8195-nor", "mediatek,mt8173-nor";
> +			reg = <0 0x1132c000 0 0x1000>;
> +			interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "spi", "sf";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		u3phy2: t-phy@11c40000 {
> +			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0 0x11c40000 0x700>;
> +			status = "disabled";
> +
> +			u2port2: usb-phy@0 {
> +				reg = <0x0 0x700>;
> +				clocks = <&clk26m>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +			};
> +		};
> +
> +		u3phy3: t-phy@11c50000 {
> +			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0 0x11c50000 0x700>;
> +			status = "disabled";
> +
> +			u2port3: usb-phy@0 {
> +				reg = <0x0 0x700>;
> +				clocks = <&clk26m>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +			};
> +		};
> +
> +		u3phy1: t-phy@11e30000 {
> +			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0 0x11e30000 0xe00>;
> +			status = "disabled";
> +
> +			u2port1: usb-phy@0 {
> +				reg = <0x0 0x700>;
> +				clocks = <&clk26m>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +			};
> +
> +			u3port1: usb-phy@700 {
> +				reg = <0x700 0x700>;
> +				clocks = <&clk26m>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +			};
> +		};
> +
> +		u3phy0: t-phy@11e40000 {
> +			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0 0x11e40000 0xe00>;
> +			status = "disabled";
> +
> +			u2port0: usb-phy@0 {
> +				reg = <0x0 0x700>;
> +				clocks = <&clk26m>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +			};
> +
> +			u3port0: usb-phy@700 {
> +				reg = <0x700 0x700>;
> +				clocks = <&clk26m>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +			};
> +		};
> +
> +		ufsphy: phy@11fa0000 {
> +			compatible = "mediatek,mt8195-ufsphy", "mediatek,mt8183-ufsphy";
> +			reg = <0 0x11fa0000 0 0xc000>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "unipro", "mp";
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +	};
> +};
phy part:

Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thank you


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
