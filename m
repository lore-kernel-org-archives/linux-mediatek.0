Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECA5C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 09:43:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 675A621973
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 09:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K0GqL128";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPa0/9/r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 675A621973
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m6oo1+5LYqzE+01UbrD2g5pTMKOZ0FNPRk9B6SAn6no=; b=K0GqL1282aJD4KIzf5pl0uEK9
	CB5izpCQiPU4msszxN9JR1RY1ytXmtZptrnuXN/40G+wgFOJP0PA0YFbu5cXwty5iZvX3qngRUzel
	qFW4OX7pIj6KMJ2+5sCzuT/wm+cyKxNJw3yvYGaHBmdLZwz+boJGzweHy1/t8+me4pd6gMVusIUuI
	a4U1bDSYwenUcNpIVkYG0C8GAfJsg88I3Fh/kYz7b6nYkPdnGYRgtgG+2g8nV9LIpOfdkIAgaIWvB
	vIHfXHlD1HBg8Ea+dPIDpJ6rndSHodoCTkzvxoUAierds69agSPRH8Cf8gGapg4fn/7owK6gSSlLP
	x0oArgFTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFwcp-0001Ca-JW; Wed, 09 Sep 2020 09:42:47 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFwcb-000166-Px; Wed, 09 Sep 2020 09:42:39 +0000
Received: by mail-wm1-x344.google.com with SMTP id e11so1437509wme.0;
 Wed, 09 Sep 2020 02:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VBWrzLaWgvERfZXWdf1tz2E//xZoCgKLR1vFli6+1D4=;
 b=NPa0/9/rtOBNIPygOUbt7jEjhEJ1MOT3fMAAxxLUaebUFwJ9OiTT8L54e90WZDep2z
 545HcY3k++k0DtSg4soZTHcWoHPjIhkbfJO5mcqRNihjMHf4aw5uOd1NBSTDrCbBrinC
 6CjKyebg/3ry9njV9FCZg1OAN3JLXNxCMsFj1q2+2KSfwIj4s8bVda2Iurcass1z2iLg
 Y15Kkp5RLpoL1G+4kj00PH2RVOpeWMZX8B5EErkKQd5INmfEeiAL+Q6ySgmIUtY0aJlo
 e6BrakefxHhFPuuwRL44Ieb7Y5kLQ41a/2AUZhWKEcDLUibR9g/9PPo1s/l2FgSDaDdK
 f7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VBWrzLaWgvERfZXWdf1tz2E//xZoCgKLR1vFli6+1D4=;
 b=FXovF5yGQLELLXlZGkZvRFc/XLKNb9iu6QZmDaJKyVIcB4CCu3LhQhiIGU5q5Zok0V
 KhLx2bjzgP1mB7qm5nqqjF/nwynS2H7x99fyn4ItwOMiBa5GFrLeobHmAINBIsax6uEI
 JTP7obdMCU3eqhbsrB+aRbJoF4wpBzFpEIK42WrGSRXNYoBLrwR6cxIhCk7BeHMD5if6
 e/cPUH3l00gddmNK1Hz171wF9TeelCyh/XiVp0CGOnLRUcDOzdUFXxpZMQJwX/9b/vJa
 tRXCvWAYB7HRPFPcvxZJZ6LKdoL9fZNfxAMw3kEgFpojXtGbk/ZS/rasB9GCUrAHWE54
 J8EQ==
X-Gm-Message-State: AOAM533jBYSCKq1MBQG3w4YXNAFq8BM0IC+cUkN4M7NF0okODF1IAlEl
 RHDWC5j8V7DhaCJBqIUisrI=
X-Google-Smtp-Source: ABdhPJx8VLl38MJu9Ut6xnjEAJVot7X9zLqEMuBjpaRQwqDQrMPa7P8pAyW+Ex+EhE42W9PqDXDJ6A==
X-Received: by 2002:a1c:5a56:: with SMTP id o83mr2781596wmb.77.1599644552524; 
 Wed, 09 Sep 2020 02:42:32 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id a11sm3053430wmm.18.2020.09.09.02.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 02:42:32 -0700 (PDT)
Subject: Re: [PATCH v6 3/4] arm: dts: mt7623: add display subsystem related
 device nodes
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20200904110002.88966-1-linux@fw-web.de>
 <20200904110002.88966-4-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2d0248ea-2cb0-b8de-0c81-23160bd213c4@gmail.com>
Date: Wed, 9 Sep 2020 11:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200904110002.88966-4-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_054233_999538_1C1F7AF6 
X-CRM114-Status: GOOD (  20.56  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 chunhui dai <chunhui.dai@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 04/09/2020 13:00, Frank Wunderlich wrote:
> From: Ryder Lee <ryder.lee@mediatek.com>
> 
> Add display subsystem related device nodes for MT7623.
> 
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>

Applied to v5.9-next/dts32

Thanks!

> ---
> changed
> v5->v6:
>    change compatible of hdmi-node because of changes in hdmi-phy
> v4->v5:
>    add nodes to new mt7623n.dtsi to avoid conflict with mt7623a
> v3->v4:
>    drop display_components which is duplicate of existing mmsys
> v2->v3:
>    drop bls to dpi routing
> 
> arm: dts: mt7623: use mt2701 compatible for hdmi node
> ---
>   arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  72 ++++++++
>   arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  72 ++++++++
>   arch/arm/boot/dts/mt7623n.dtsi                | 172 ++++++++++++++++++
>   3 files changed, 316 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> index 344f8c65c4aa..f41f221e56ca 100644
> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> @@ -21,6 +21,19 @@ chosen {
>   		stdout-path = "serial2:115200n8";
>   	};
>   
> +	connector {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "d";
> +		ddc-i2c-bus = <&hdmiddc0>;
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&hdmi0_out>;
> +			};
> +		};
> +	};
> +
>   	cpus {
>   		cpu@0 {
>   			proc-supply = <&mt6323_vproc_reg>;
> @@ -114,10 +127,18 @@ memory@80000000 {
>   	};
>   };
>   
> +&bls {
> +	status = "okay";
> +};
> +
>   &btif {
>   	status = "okay";
>   };
>   
> +&cec {
> +	status = "okay";
> +};
> +
>   &cir {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&cir_pins_a>;
> @@ -128,6 +149,21 @@ &crypto {
>   	status = "okay";
>   };
>   
> +&dpi0 {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		port@0 {
> +			reg = <0>;
> +			dpi0_out: endpoint {
> +				remote-endpoint = <&hdmi0_in>;
> +			};
> +		};
> +	};
> +};
> +
>   &eth {
>   	status = "okay";
>   
> @@ -199,6 +235,42 @@ fixed-link {
>   	};
>   };
>   
> +&hdmi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hdmi_pins_a>;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		port@0 {
> +			reg = <0>;
> +			hdmi0_in: endpoint {
> +				remote-endpoint = <&dpi0_out>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			hdmi0_out: endpoint {
> +				remote-endpoint = <&hdmi_connector_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&hdmiddc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hdmi_ddc_pins_a>;
> +	status = "okay";
> +};
> +
> +&hdmi_phy {
> +	mediatek,ibias = <0xa>;
> +	mediatek,ibias_up = <0x1c>;
> +	status = "okay";
> +};
> +
>   &i2c0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c0_pins_a>;
> diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
> index f8efcc364bc3..1b9b9a8145a7 100644
> --- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
> +++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
> @@ -24,6 +24,19 @@ chosen {
>   		stdout-path = "serial2:115200n8";
>   	};
>   
> +	connector {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "d";
> +		ddc-i2c-bus = <&hdmiddc0>;
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&hdmi0_out>;
> +			};
> +		};
> +	};
> +
>   	cpus {
>   		cpu@0 {
>   			proc-supply = <&mt6323_vproc_reg>;
> @@ -106,10 +119,18 @@ sound {
>   	};
>   };
>   
> +&bls {
> +	status = "okay";
> +};
> +
>   &btif {
>   	status = "okay";
>   };
>   
> +&cec {
> +	status = "okay";
> +};
> +
>   &cir {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&cir_pins_a>;
> @@ -120,6 +141,21 @@ &crypto {
>   	status = "okay";
>   };
>   
> +&dpi0 {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		port@0 {
> +			reg = <0>;
> +			dpi0_out: endpoint {
> +				remote-endpoint = <&hdmi0_in>;
> +			};
> +		};
> +	};
> +};
> +
>   &eth {
>   	status = "okay";
>   
> @@ -203,6 +239,42 @@ fixed-link {
>   	};
>   };
>   
> +&hdmi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hdmi_pins_a>;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		port@0 {
> +			reg = <0>;
> +			hdmi0_in: endpoint {
> +				remote-endpoint = <&dpi0_out>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			hdmi0_out: endpoint {
> +				remote-endpoint = <&hdmi_connector_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&hdmiddc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hdmi_ddc_pins_a>;
> +	status = "okay";
> +};
> +
> +&hdmi_phy {
> +	mediatek,ibias = <0xa>;
> +	mediatek,ibias_up = <0x1c>;
> +	status = "okay";
> +};
> +
>   &i2c0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c0_pins_a>;
> diff --git a/arch/arm/boot/dts/mt7623n.dtsi b/arch/arm/boot/dts/mt7623n.dtsi
> index a47e82468895..1880ac9e32cf 100644
> --- a/arch/arm/boot/dts/mt7623n.dtsi
> +++ b/arch/arm/boot/dts/mt7623n.dtsi
> @@ -10,6 +10,11 @@
>   #include <dt-bindings/memory/mt2701-larb-port.h>
>   
>   / {
> +	aliases {
> +		rdma0 = &rdma0;
> +		rdma1 = &rdma1;
> +	};
> +
>   	g3dsys: syscon@13000000 {
>   		compatible = "mediatek,mt7623-g3dsys",
>   			     "mediatek,mt2701-g3dsys",
> @@ -131,4 +136,171 @@ smi_common: smi@1000c000 {
>   		clock-names = "apb", "smi", "async";
>   		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
>   	};
> +
> +	ovl: ovl@14007000 {
> +		compatible = "mediatek,mt7623-disp-ovl",
> +			     "mediatek,mt2701-disp-ovl";
> +		reg = <0 0x14007000 0 0x1000>;
> +		interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&mmsys CLK_MM_DISP_OVL>;
> +		iommus = <&iommu MT2701_M4U_PORT_DISP_OVL_0>;
> +		mediatek,larb = <&larb0>;
> +	};
> +
> +	rdma0: rdma@14008000 {
> +		compatible = "mediatek,mt7623-disp-rdma",
> +			     "mediatek,mt2701-disp-rdma";
> +		reg = <0 0x14008000 0 0x1000>;
> +		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&mmsys CLK_MM_DISP_RDMA>;
> +		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA>;
> +		mediatek,larb = <&larb0>;
> +	};
> +
> +	wdma@14009000 {
> +		compatible = "mediatek,mt7623-disp-wdma",
> +			     "mediatek,mt2701-disp-wdma";
> +		reg = <0 0x14009000 0 0x1000>;
> +		interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&mmsys CLK_MM_DISP_WDMA>;
> +		iommus = <&iommu MT2701_M4U_PORT_DISP_WDMA>;
> +		mediatek,larb = <&larb0>;
> +	};
> +
> +	bls: pwm@1400a000 {
> +		compatible = "mediatek,mt7623-disp-pwm",
> +			     "mediatek,mt2701-disp-pwm";
> +		reg = <0 0x1400a000 0 0x1000>;
> +		#pwm-cells = <2>;
> +		clocks = <&mmsys CLK_MM_MDP_BLS_26M>,
> +			 <&mmsys CLK_MM_DISP_BLS>;
> +		clock-names = "main", "mm";
> +		status = "disabled";
> +	};
> +
> +	color: color@1400b000 {
> +		compatible = "mediatek,mt7623-disp-color",
> +			     "mediatek,mt2701-disp-color";
> +		reg = <0 0x1400b000 0 0x1000>;
> +		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&mmsys CLK_MM_DISP_COLOR>;
> +	};
> +
> +	dsi: dsi@1400c000 {
> +		compatible = "mediatek,mt7623-dsi",
> +			     "mediatek,mt2701-dsi";
> +		reg = <0 0x1400c000 0 0x1000>;
> +		interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&mmsys CLK_MM_DSI_ENGINE>,
> +			 <&mmsys CLK_MM_DSI_DIG>,
> +			 <&mipi_tx0>;
> +		clock-names = "engine", "digital", "hs";
> +		phys = <&mipi_tx0>;
> +		phy-names = "dphy";
> +		status = "disabled";
> +	};
> +
> +	mutex: mutex@1400e000 {
> +		compatible = "mediatek,mt7623-disp-mutex",
> +			     "mediatek,mt2701-disp-mutex";
> +		reg = <0 0x1400e000 0 0x1000>;
> +		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&mmsys CLK_MM_MUTEX_32K>;
> +	};
> +
> +	rdma1: rdma@14012000 {
> +		compatible = "mediatek,mt7623-disp-rdma",
> +			     "mediatek,mt2701-disp-rdma";
> +		reg = <0 0x14012000 0 0x1000>;
> +		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> +		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA1>;
> +		mediatek,larb = <&larb0>;
> +	};
> +
> +	dpi0: dpi@14014000 {
> +		compatible = "mediatek,mt7623-dpi",
> +			     "mediatek,mt2701-dpi";
> +		reg = <0 0x14014000 0 0x1000>;
> +		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&mmsys CLK_MM_DPI1_DIGL>,
> +			 <&mmsys CLK_MM_DPI1_ENGINE>,
> +			 <&apmixedsys CLK_APMIXED_TVDPLL>;
> +		clock-names = "pixel", "engine", "pll";
> +		status = "disabled";
> +	};
> +
> +	hdmi0: hdmi@14015000 {
> +		compatible = "mediatek,mt7623-hdmi",
> +			     "mediatek,mt2701-hdmi";
> +		reg = <0 0x14015000 0 0x400>;
> +		clocks = <&mmsys CLK_MM_HDMI_PIXEL>,
> +			 <&mmsys CLK_MM_HDMI_PLL>,
> +			 <&mmsys CLK_MM_HDMI_AUDIO>,
> +			 <&mmsys CLK_MM_HDMI_SPDIF>;
> +		clock-names = "pixel", "pll", "bclk", "spdif";
> +		phys = <&hdmi_phy>;
> +		phy-names = "hdmi";
> +		mediatek,syscon-hdmi = <&mmsys 0x900>;
> +		cec = <&cec>;
> +		status = "disabled";
> +	};
> +
> +	mipi_tx0: mipi-dphy@10010000 {
> +		compatible = "mediatek,mt7623-mipi-tx",
> +			     "mediatek,mt2701-mipi-tx";
> +		reg = <0 0x10010000 0 0x90>;
> +		clocks = <&clk26m>;
> +		clock-output-names = "mipi_tx0_pll";
> +		#clock-cells = <0>;
> +		#phy-cells = <0>;
> +	};
> +
> +	cec: cec@10012000 {
> +		compatible = "mediatek,mt7623-cec",
> +			     "mediatek,mt8173-cec";
> +		reg = <0 0x10012000 0 0xbc>;
> +		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&infracfg CLK_INFRA_CEC>;
> +		status = "disabled";
> +	};
> +
> +	hdmi_phy: phy@10209100 {
> +		compatible = "mediatek,mt7623-hdmi-phy",
> +			     "mediatek,mt2701-hdmi-phy";
> +		reg = <0 0x10209100 0 0x24>;
> +		clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
> +		clock-names = "pll_ref";
> +		clock-output-names = "hdmitx_dig_cts";
> +		#clock-cells = <0>;
> +		#phy-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	hdmiddc0: i2c@11013000 {
> +		compatible = "mediatek,mt7623-hdmi-ddc",
> +			     "mediatek,mt8173-hdmi-ddc";
> +		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
> +		reg = <0 0x11013000 0 0x1C>;
> +		clocks = <&pericfg CLK_PERI_I2C3>;
> +		clock-names = "ddc-i2c";
> +		status = "disabled";
> +	};
> +};
> +
> +&pio {
> +	hdmi_pins_a: hdmi-default {
> +		pins-hdmi {
> +			pinmux = <MT7623_PIN_123_HTPLG_FUNC_HTPLG>;
> +			input-enable;
> +			bias-pull-down;
> +		};
> +	};
> +
> +	hdmi_ddc_pins_a: hdmi_ddc-default {
> +		pins-hdmi-ddc {
> +			pinmux = <MT7623_PIN_124_GPIO124_FUNC_HDMISCK>,
> +				 <MT7623_PIN_125_GPIO125_FUNC_HDMISD>;
> +		};
> +	};
>   };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
