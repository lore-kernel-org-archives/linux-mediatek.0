Return-Path: <SRS0=xNtl=OL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE17C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 18:43:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 846F661186
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 18:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 846F661186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=piQKAUXK0dA6UDb4asoQAAbBrfvRZThpPguRpyNIeZs=; b=SEleG/QHNDmG0h
	NvJY756sNVJYWVDPuiuOZ4/cQxChKNyEHgNfThgethYIZQpSivKgqPJBKViKdTxIZcKoCAH655XMx
	5NbiHNQ3ka7MbHWfPn+CaCwcBih4QBux8Ma/EthG3QZBRtDJLi0mQr2SQtI1gokGzHlL61HYz7f9M
	PK+yfGYx+h60+6YPDiGf5xfD4byd8NwpPVPEfS5IezJy9xUT1dm2bL0ZMk7Yt50S7JusW4Uir/HS4
	p6WGGh6Tc8SyE3WFBFBtp69xPitd9NL131iVnL2fDJQdVnYyfsiMcFNmROULYSfxZmIKozVg1nnCz
	eMhE3PU32GFVDQKxDIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSkjn-005WZB-UM; Tue, 21 Sep 2021 18:43:27 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSkjl-005WXy-4m; Tue, 21 Sep 2021 18:43:26 +0000
Received: by mail-wr1-x431.google.com with SMTP id u18so40339438wrg.5;
 Tue, 21 Sep 2021 11:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+nNwxsrWkkZM1Q7j4xiYXfVwik3HxWJhPWErYuxDNL8=;
 b=KVijfRbheCFAVHD+6sxpz5ZqeCPzjL5esDnit3xq/M3lffKC95FXBeFJHwJWmOlqu0
 HYOFbanSyhzT8tlxw7jokY0nX2BVpqNBGjIMW3e76nYZcarGbTs0kE2am05cB98Kync5
 NrNVv9bezaCu4a8MdEkL7Fp6/BsxExy98dmCmm3r0CZEQnY/SIP76aL2gCx2WLeTbEfW
 E2zO99Eyza/Dv21qWKIYFmtr5DCWlZbOXxJav136QtHBleDzJJrsEK2/BG+DSJ1/Ut+Q
 6qK17DlM1e6lZGiW/0JOpI87O5angq5EgME7DH7GeMVtMhYeHukvMew/9/IFAPQJCZg8
 zqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+nNwxsrWkkZM1Q7j4xiYXfVwik3HxWJhPWErYuxDNL8=;
 b=oJtPyhNQfBZgnveHMLxyfag+rKgMA4+RryUQ2JHffyfyplR4oFTCXD0l5XcZZXB8ez
 t0IC8O1bMTREbQJejXmJiv0DS1O1/6OSpUjhmNuv8vAhV/TZaLFrZTszrf0E2MJgjkz3
 Xj31O3BjR+TwTkqY1l71tYx3QL4RmHzPEdPiBOojT55i+xf1/ZWNscsnhwT+uohXBda8
 nWEnCgXmmdNJh6AwHwubJBlhcGpMMa2bDriMjOEY7voTyqwYlq/p35wVaVBi0wHSaNMY
 SQYfFmR23l+BSCuP7dsBjDiFfifm+mVrZu6iAEYYExnINGxWK3qMcCflIHoPd9pmTCQu
 rCXQ==
X-Gm-Message-State: AOAM532E340syb292jVnrgosFFq/831gR6sygYbfi3W/5QAJXK41aUFE
 UIsfyEm8YNl+xODOJ1zyHjsvWsIEN1M=
X-Google-Smtp-Source: ABdhPJw2zB8WQitbfLyA/Jxx9uaI72qYktUHvYwvYouADLVdA1FcBLnoYrYCnW+dwbr7VYx6+i0ktA==
X-Received: by 2002:adf:f207:: with SMTP id p7mr37096138wro.166.1632249803588; 
 Tue, 21 Sep 2021 11:43:23 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id y1sm4041318wmq.43.2021.09.21.11.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 11:43:23 -0700 (PDT)
Message-ID: <9f8a40b8-f544-5792-03d3-3570da86cd01@gmail.com>
Date: Tue, 21 Sep 2021 20:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH v12 6/6] ARM: dts: mediatek: Update MT7629 PCIe node for
 new format
Content-Language: en-US
To: Chuanjia Liu <chuanjia.liu@mediatek.com>, robh+dt@kernel.org,
 bhelgaas@google.com, lorenzo.pieralisi@arm.com
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com, yong.wu@mediatek.com,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210823032800.1660-1-chuanjia.liu@mediatek.com>
 <20210823032800.1660-7-chuanjia.liu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210823032800.1660-7-chuanjia.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_114325_268715_5E11D8A4 
X-CRM114-Status: GOOD (  16.19  )
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



On 23/08/2021 05:28, Chuanjia Liu wrote:
> To match the new dts binding. Remove "subsys",unused
> interrupt and slot node.Add "interrupt-names",
> "linux,pci-domain" and pciecfg node.
> 
> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>

Queued in v5.15-next/dts32

Thanks!

> ---
>   arch/arm/boot/dts/mt7629-rfb.dts |  3 ++-
>   arch/arm/boot/dts/mt7629.dtsi    | 45 +++++++++++++++-----------------
>   2 files changed, 23 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/mt7629-rfb.dts b/arch/arm/boot/dts/mt7629-rfb.dts
> index 9980c10c6e29..eb536cbebd9b 100644
> --- a/arch/arm/boot/dts/mt7629-rfb.dts
> +++ b/arch/arm/boot/dts/mt7629-rfb.dts
> @@ -140,9 +140,10 @@
>   	};
>   };
>   
> -&pcie {
> +&pcie1 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pcie_pins>;
> +	status = "okay";
>   };
>   
>   &pciephy1 {
> diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
> index 874043f0490d..46fc236e1b89 100644
> --- a/arch/arm/boot/dts/mt7629.dtsi
> +++ b/arch/arm/boot/dts/mt7629.dtsi
> @@ -361,16 +361,21 @@
>   			#reset-cells = <1>;
>   		};
>   
> -		pcie: pcie@1a140000 {
> +		pciecfg: pciecfg@1a140000 {
> +			compatible = "mediatek,generic-pciecfg", "syscon";
> +			reg = <0x1a140000 0x1000>;
> +		};
> +
> +		pcie1: pcie@1a145000 {
>   			compatible = "mediatek,mt7629-pcie";
>   			device_type = "pci";
> -			reg = <0x1a140000 0x1000>,
> -			      <0x1a145000 0x1000>;
> -			reg-names = "subsys","port1";
> +			reg = <0x1a145000 0x1000>;
> +			reg-names = "port1";
> +			linux,pci-domain = <1>;
>   			#address-cells = <3>;
>   			#size-cells = <2>;
> -			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_LOW>,
> -				     <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +			interrupt-names = "pcie_irq";
>   			clocks = <&pciesys CLK_PCIE_P1_MAC_EN>,
>   				 <&pciesys CLK_PCIE_P0_AHB_EN>,
>   				 <&pciesys CLK_PCIE_P1_AUX_EN>,
> @@ -391,26 +396,18 @@
>   			power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
>   			bus-range = <0x00 0xff>;
>   			ranges = <0x82000000 0 0x20000000 0x20000000 0 0x10000000>;
> +			status = "disabled";
>   
> -			pcie1: pcie@1,0 {
> -				device_type = "pci";
> -				reg = <0x0800 0 0 0 0>;
> -				#address-cells = <3>;
> -				#size-cells = <2>;
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
> +					<0 0 0 2 &pcie_intc1 1>,
> +					<0 0 0 3 &pcie_intc1 2>,
> +					<0 0 0 4 &pcie_intc1 3>;
> +			pcie_intc1: interrupt-controller {
> +				interrupt-controller;
> +				#address-cells = <0>;
>   				#interrupt-cells = <1>;
> -				ranges;
> -				num-lanes = <1>;
> -				interrupt-map-mask = <0 0 0 7>;
> -				interrupt-map = <0 0 0 1 &pcie_intc1 0>,
> -						<0 0 0 2 &pcie_intc1 1>,
> -						<0 0 0 3 &pcie_intc1 2>,
> -						<0 0 0 4 &pcie_intc1 3>;
> -
> -				pcie_intc1: interrupt-controller {
> -					interrupt-controller;
> -					#address-cells = <0>;
> -					#interrupt-cells = <1>;
> -				};
>   			};
>   		};
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
