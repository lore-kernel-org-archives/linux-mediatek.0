Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C493C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 16:05:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 621A761BE1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 16:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 621A761BE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTzz3U+oINy9XtoBr1KvwOSOGmeYVAdNP53rJbxTmLo=; b=QvE2P5eb3kvCwC
	z/49GrLIjIqCSiS1A7g2sx9MzdXMbe+fr/GWqb4zw9td35zsFegmVJEz7JxxN8+rsF3asUn7kdggk
	JHiEW069U9P2iPYMXb6peLduqUlcEU2gdZ6MmyN6iW6VcZNKBJKrYAmVKo7jTRpUZXufvlZUQVNC/
	9a6infAuNGpfeRLGl6Le0msxzDrCwf/wBjuE+j37Pa4qaUnuSBomIshN0wERlj1rFD96NnhQu85nn
	qlxXG9HN87Gmx65lU32HGwkk8qqfR8IeU64m5zUhEaDEQz0I2Agqjn8ZIDJkmAUcTcn6ejJAMvDJk
	QkCAkmQjTBJDkv0CnNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnNRU-005dUi-Pi; Wed, 17 Nov 2021 16:05:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnN2i-005RGl-B5; Wed, 17 Nov 2021 15:40:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso5153342wms.3; 
 Wed, 17 Nov 2021 07:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1e4r35yakqYJ2n3GquiIT5LlL4bu2sXRURIH3oUS4mQ=;
 b=WVAAwuveo4V2/T3wWMSlA3KMi800D62/2hhAHe7apfG3JlSpCrDIQfQvIzqbLpozAi
 n2rHwra/qYW+XsqtwO9ta9/JLGi8EsI+uXlfIKcZ5MW/BU4itgWQ5c5GE+8OJRmW1mQX
 7ANMrdC/wX5UNcG0/nBzBa9uC1WCExVs88ieSatLFNJgVNbatW9miYhqdRJhufmTpwIM
 jx+GxW6b/t1IzGPoY6gefZ62gmuEFzLxPzbmIHJcCL4MagTsqxVXYzwCjtpVO7EV2EJv
 JRv8PriNhvCud7egvn0EsovqWaj+RoorvAcGrmLrXa0B2N9UoEbFzFDumYyvxZnKPSJ/
 s5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1e4r35yakqYJ2n3GquiIT5LlL4bu2sXRURIH3oUS4mQ=;
 b=cgZYC1L2irXwP14obPlscw9JHoQOFpFfkR9dqRTsreSDJKehefgeUNFEgRuVikws7u
 XZJXH93DAG3OgOafVuNzrAkmZKwIQSbCOO9yu2XVA8nifdit/WTn9BgZBYlJt9mvebqL
 V9DNx+5Ty7zmpV6c4BP+CJN+X2scpwYcB0u5eGhUX3eV/AZO6rxq+k580ryjn0AVzFkO
 yjJwA+leRCTWSYx62uuXZ9kpYnS02U16e55X6zlEHJdnAeZF/G5fjcplN7DYNkK6OmS0
 fMFiNjq0ySs4yhPdf0tP4tR3pxTrrJ++GoUL0nvy5qVtwI+Zlhk5bp0RpdwsbsHtftAb
 n2IA==
X-Gm-Message-State: AOAM532bTZ2Cx99AxvwDjI7OKxHMu+4+DsyJh4ViNA0Jf6Ilkguw/xr+
 4gvh79ChZMblN8Kwrzp7c8M=
X-Google-Smtp-Source: ABdhPJytjeCYk7JW3WTLZmWodsJn1KrCwCciuY8wezt5sSJT+X/FdsjwSIunHmifRcndZq8qpZU73w==
X-Received: by 2002:a05:600c:500a:: with SMTP id
 n10mr763185wmr.136.1637163610353; 
 Wed, 17 Nov 2021 07:40:10 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net.
 [188.86.219.160])
 by smtp.gmail.com with ESMTPSA id i17sm41888wmq.48.2021.11.17.07.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 07:40:09 -0800 (PST)
Message-ID: <9d969ccd-1713-acb5-73ac-655c11086738@gmail.com>
Date: Wed, 17 Nov 2021 16:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: Add USB xHCI controller for
 mt8195
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211102060049.1843-1-chunfeng.yun@mediatek.com>
 <20211102060049.1843-3-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211102060049.1843-3-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_074012_453205_98D3FFC4 
X-CRM114-Status: GOOD (  14.82  )
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



On 02/11/2021 07:00, Chunfeng Yun wrote:
> Add all four USB xHCI controllers for MT8195
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Patch lookes good, I'll take it as soon as 1/3 and 2/3 is accepted.

Regards,
Matthias

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 79 ++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index a59c0e9d1fc2..263eebfd2ea1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -8,6 +8,7 @@
>   #include <dt-bindings/clock/mt8195-clk.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/power/mt8195-power.h>
>   
>   / {
> @@ -823,6 +824,26 @@
>   			status = "disabled";
>   		};
>   
> +		xhci0: usb@11200000 {
> +			compatible = "mediatek,mt8195-xhci", "mediatek,mtk-xhci";
> +			reg = <0 0x11200000 0 0x1000>, <0 0x11203e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port0 PHY_TYPE_USB2>, <&u3port0 PHY_TYPE_USB3>;
> +			assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
> +					  <&topckgen CLK_TOP_SSUSB_XHCI>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>,
> +				 <&topckgen CLK_TOP_SSUSB_REF>,
> +				 <&apmixedsys CLK_APMIXED_USB1PLL>;
> +			clock-names = "sys_ck", "xhci_ck", "ref_ck", "mcu_ck";
> +			mediatek,syscon-wakeup = <&pericfg 0x400 103>;
> +			wakeup-source;
> +			status = "disabled";
> +		};
> +
>   		mmc0: mmc@11230000 {
>   			compatible = "mediatek,mt8195-mmc", "mediatek,mt8192-mmc";
>   			reg = <0 0x11230000 0 0x10000>,
> @@ -843,6 +864,64 @@
>   			status = "disabled";
>   		};
>   
> +		xhci1: usb@11290000 {
> +			compatible = "mediatek,mt8195-xhci", "mediatek,mtk-xhci";
> +			reg = <0 0x11290000 0 0x1000>, <0 0x11293e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port1 PHY_TYPE_USB2>;
> +			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_1P>,
> +					  <&topckgen CLK_TOP_SSUSB_XHCI_1P>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_1P_BUS>,
> +				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>,
> +				 <&topckgen CLK_TOP_SSUSB_P1_REF>,
> +				 <&apmixedsys CLK_APMIXED_USB1PLL>;
> +			clock-names = "sys_ck", "xhci_ck", "ref_ck", "mcu_ck";
> +			mediatek,syscon-wakeup = <&pericfg 0x400 104>;
> +			wakeup-source;
> +			status = "disabled";
> +		};
> +
> +		xhci2: usb@112a0000 {
> +			compatible = "mediatek,mt8195-xhci", "mediatek,mtk-xhci";
> +			reg = <0 0x112a0000 0 0x1000>, <0 0x112a3e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port2 PHY_TYPE_USB2>;
> +			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_2P>,
> +					  <&topckgen CLK_TOP_SSUSB_XHCI_2P>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
> +				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>,
> +				 <&topckgen CLK_TOP_SSUSB_P2_REF>;
> +			clock-names = "sys_ck", "xhci_ck", "ref_ck";
> +			mediatek,syscon-wakeup = <&pericfg 0x400 105>;
> +			status = "disabled";
> +		};
> +
> +		xhci3: usb@112b0000 {
> +			compatible = "mediatek,mt8195-xhci", "mediatek,mtk-xhci";
> +			reg = <0 0x112b0000 0 0x1000>, <0 0x112b3e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port3 PHY_TYPE_USB2>;
> +			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_3P>,
> +					  <&topckgen CLK_TOP_SSUSB_XHCI_3P>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
> +				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>,
> +				 <&topckgen CLK_TOP_SSUSB_P3_REF>;
> +			clock-names = "sys_ck", "xhci_ck", "ref_ck";
> +			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
> +			wakeup-source;
> +			usb2-lpm-disable;
> +			status = "disabled";
> +		};
> +
>   		nor_flash: nor@1132c000 {
>   			compatible = "mediatek,mt8195-nor", "mediatek,mt8173-nor";
>   			reg = <0 0x1132c000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
