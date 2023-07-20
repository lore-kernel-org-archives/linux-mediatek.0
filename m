Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C396EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 11:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZX2qQaPDTKSbIhZ2peO1OSAFFzclWID1kilVn5rcUw=; b=tFVaJkbRSxiAjBypG3Yym9UXqz
	esZA/p+e/+38mccneAx0lcEfoBLAbFMOxhUDqmpnqRotvl7J1TcD269ryebr91hX6/DUnWe7eunJ2
	jxsAycfrCRXznIlTHeGHSQyuc5iydtXt/Pllrd+xb3Tj7WQrkAlJP4sCrmTCzznaRe/QYCtYiCtq3
	yBucldUntI90VUPV3dxRQA8/LmWUakOpcjONGHk+3Vybw5Ip1lm4el5n/Vz/oaX2ZDGfgGjYrjmVB
	YEx9nzw/FKISJ37rDGV1Ky/I7/oJlMf9E9p6izlZnp3Rq06VXplVU/gYzmgyIU1UhyFnUtAw3P4L7
	mC06zMqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMRwK-00Azff-0H;
	Thu, 20 Jul 2023 11:35:24 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMRwC-00AzcO-0o
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 11:35:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso5867975e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 04:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689852912; x=1690457712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZX2qQaPDTKSbIhZ2peO1OSAFFzclWID1kilVn5rcUw=;
        b=iHp48fDnRCi/fteE1S/gsi8Wj8utM6G5r5ZDgJgKbAXQ/539Tg2v61yYe6aiI6zdVy
         1omBI8UG+lV/kYqAj1yD7sEycRD6zrDxCe6BOLGxa1ILQ55CYo+yFVR4vj/dE9gwVtBc
         h3joQ0P8tvzBpCtSASSGKlIoqii7sRlv8YXOvl/UyAFAqPTYjjMDrKh+FxzYvy5H8AHm
         IsaQZfOfpfV/XNLXFUqgoqM6kSBAktmhUePAA1SLnGZKcXD4eIv4+1y44Bgh0liFmQwu
         YFLZkZGNVhAMIBr3rMbdcIK7E3p1Pl26k5mNdOx/E4scyT+fFUeRGa7r/C8aGziyW5vM
         rsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689852912; x=1690457712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZX2qQaPDTKSbIhZ2peO1OSAFFzclWID1kilVn5rcUw=;
        b=C9yNMvGW4fYojSQqVjBVMR2jBLD/pD2752m35MkV+eA7W486q5/Rea/XIyRPcipsDm
         YTNnIJ1fdmkMHkyJmx0BCcGsCDmQjTyhv6yLoPxYpIEd9sADYGy9yFnSA6YV8AIME7Rk
         Wx10weKIvTTpmLZ04wj0oGRX480+Fw024CKurQqhAYc0pCSRcFKHlZhEH2qBiLuV0JsO
         6ptb/CmZMXXAr3tQDPVKKfFYP/b+QxjsAlPh9R3/5cpIk6Jl0D5xzVuj9EtlzTtRb35l
         m69jdiWXA9MrIWcZVmLwXvv8oNHomm3vLSQrXcDPkHeGtX7zYYm2Hb1PUdgV2tsXJwQI
         spAQ==
X-Gm-Message-State: ABy/qLZPs32Z0AluyAdGLWUR6/ReAx8KT5ZiwMuX7HIpV/SV5vdrfPhD
	DIr5Jz9K7aC8HKIAQ/SF/t7hRw==
X-Google-Smtp-Source: APBJJlHfu8Z0Ppf6BL4dpWBbsbKT9JtD7Ngr+queCn3d/VwuRMm2MU64nU5uhw+7TEjtQfhCXXNg4g==
X-Received: by 2002:a1c:7206:0:b0:3fb:feb0:6f40 with SMTP id n6-20020a1c7206000000b003fbfeb06f40mr7201833wmc.11.1689852911359;
        Thu, 20 Jul 2023 04:35:11 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q3-20020a05600c46c300b003fc3b03caa5sm3996574wmo.1.2023.07.20.04.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 04:35:10 -0700 (PDT)
Message-ID: <0809ac02-b8bf-ed63-9e2e-e77cd7e93464@baylibre.com>
Date: Thu, 20 Jul 2023 13:35:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt6795: Add support for display
 blocks and DPI/DSI
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, kernel@collabora.com
References: <20230720091559.86406-1-angelogioacchino.delregno@collabora.com>
 <20230720091559.86406-2-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230720091559.86406-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_043516_295980_882C14C9 
X-CRM114-Status: GOOD (  16.28  )
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



On 20/07/2023 11:15, AngeloGioacchino Del Regno wrote:
> Introduce all nodes for all of the display blocks in the MediaTek Helio
> X10 MT6795 SoC, including the DSI PHY and DSI/DPI interfaces: those are
> left disabled as usage is board specific.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 252 +++++++++++++++++++++++
>   1 file changed, 252 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 597bce2fed72..d805d7a63024 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -2,6 +2,9 @@
>   /*
>    * Copyright (c) 2015 MediaTek Inc.
>    * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + * Copyright (C) 2023 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Shouldn't be like this ?

  * Copyright (c) 2015 MediaTek Inc.
  * Copyright (C) 2023 Collabora Ltd.
  * Authors: Mars.C <mars.cheng@mediatek.com>
  *          AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com>


>    */
>   
>   #include <dt-bindings/interrupt-controller/irq.h>
> @@ -19,6 +22,23 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> +	aliases {
> +		ovl0 = &ovl0;
> +		ovl1 = &ovl1;
> +		rdma0 = &rdma0;
> +		rdma1 = &rdma1;
> +		rdma2 = &rdma2;
> +		wdma0 = &wdma0;
> +		wdma1 = &wdma1;
> +		color0 = &color0;
> +		color1 = &color1;
> +		split0 = &split0;
> +		split1 = &split1;
> +		dpi0 = &dpi0;
> +		dsi0 = &dsi0;
> +		dsi1 = &dsi1;
> +	};
> +
>   	psci {
>   		compatible = "arm,psci-0.2";
>   		method = "smc";
> @@ -434,6 +454,26 @@ gce: mailbox@10212000 {
>   			#mbox-cells = <2>;
>   		};
>   
> +		mipi_tx0: dsi-phy@10215000 {
> +			compatible = "mediatek,mt8173-mipi-tx";
> +			reg = <0 0x10215000 0 0x1000>;
> +			clocks = <&clk26m>;
> +			clock-output-names = "mipi_tx0_pll";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		mipi_tx1: dsi-phy@10216000 {
> +			compatible = "mediatek,mt8173-mipi-tx";
> +			reg = <0 0x10216000 0 0x1000>;
> +			clocks = <&clk26m>;
> +			clock-output-names = "mipi_tx1_pll";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>   		gic: interrupt-controller@10221000 {
>   			compatible = "arm,gic-400";
>   			#interrupt-cells = <3>;
> @@ -690,6 +730,211 @@ mmsys: syscon@14000000 {
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>   		};
>   
> +		ovl0: ovl@1400c000 {
> +			compatible = "mediatek,mt6795-disp-ovl", "mediatek,mt8173-disp-ovl";
> +			reg = <0 0x1400c000 0 0x1000>;
> +			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +			iommus = <&iommu M4U_PORT_DISP_OVL0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
> +		};
> +
> +		ovl1: ovl@1400d000 {
> +			compatible = "mediatek,mt6795-disp-ovl", "mediatek,mt8173-disp-ovl";
> +			reg = <0 0x1400d000 0 0x1000>;
> +			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL1>;
> +			iommus = <&iommu M4U_PORT_DISP_OVL1>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
> +		};
> +
> +		rdma0: rdma@1400e000 {
> +			compatible = "mediatek,mt6795-disp-rdma", "mediatek,mt8173-disp-rdma";
> +			reg = <0 0x1400e000 0 0x1000>;
> +			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
> +			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
> +		};
> +
> +		rdma1: rdma@1400f000 {
> +			compatible = "mediatek,mt6795-disp-rdma", "mediatek,mt8173-disp-rdma";
> +			reg = <0 0x1400f000 0 0x1000>;
> +			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> +			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
> +		};
> +
> +		rdma2: rdma@14010000 {
> +			compatible = "mediatek,mt6795-disp-rdma", "mediatek,mt8173-disp-rdma";
> +			reg = <0 0x14010000 0 0x1000>;
> +			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_RDMA2>;
> +			iommus = <&iommu M4U_PORT_DISP_RDMA2>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
> +		};
> +
> +		wdma0: wdma@14011000 {
> +			compatible = "mediatek,mt6795-disp-wdma", "mediatek,mt8173-disp-wdma";
> +			reg = <0 0x14011000 0 0x1000>;
> +			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_WDMA0>;
> +			iommus = <&iommu M4U_PORT_DISP_WDMA0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
> +		};
> +
> +		wdma1: wdma@14012000 {
> +			compatible = "mediatek,mt6795-disp-wdma", "mediatek,mt8173-disp-wdma";
> +			reg = <0 0x14012000 0 0x1000>;
> +			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_WDMA1>;
> +			iommus = <&iommu M4U_PORT_DISP_WDMA1>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
> +		};
> +
> +		color0: color@14013000 {
> +			compatible = "mediatek,mt6795-disp-color", "mediatek,mt8173-disp-color";
> +			reg = <0 0x14013000 0 0x1000>;
> +			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
> +		};
> +
> +		color1: color@14014000 {
> +			compatible = "mediatek,mt6795-disp-color", "mediatek,mt8173-disp-color";
> +			reg = <0 0x14014000 0 0x1000>;
> +			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_COLOR1>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
> +		};
> +
> +		aal@14015000 {
> +			compatible = "mediatek,mt6795-disp-aal", "mediatek,mt8173-disp-aal";
> +			reg = <0 0x14015000 0 0x1000>;
> +			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_AAL>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
> +		};
> +
> +		gamma@14016000 {
> +			compatible = "mediatek,mt6795-disp-gamma", "mediatek,mt8173-disp-gamma";
> +			reg = <0 0x14016000 0 0x1000>;
> +			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_GAMMA>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
> +		};
> +
> +		merge@14017000 {
> +			compatible = "mediatek,mt6795-disp-merge", "mediatek,mt8173-disp-merge";
> +			reg = <0 0x14017000 0 0x1000>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_MERGE>;
> +		};
> +
> +		split0: split@14018000 {
> +			compatible = "mediatek,mt6795-disp-split", "mediatek,mt8173-disp-split";
> +			reg = <0 0x14018000 0 0x1000>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_SPLIT0>;
> +		};
> +
> +		split1: split@14019000 {
> +			compatible = "mediatek,mt6795-disp-split", "mediatek,mt8173-disp-split";
> +			reg = <0 0x14019000 0 0x1000>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_SPLIT1>;
> +		};
> +
> +		ufoe@1401a000 {
> +			compatible = "mediatek,mt6795-disp-ufoe", "mediatek,mt8173-disp-ufoe";
> +			reg = <0 0x1401a000 0 0x1000>;
> +			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_UFOE>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xa000 0x1000>;
> +		};
> +
> +		dsi0: dsi@1401b000 {
> +			compatible = "mediatek,mt6795-dsi", "mediatek,mt8173-dsi";
> +			reg = <0 0x1401b000 0 0x1000>;
> +			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DSI0_ENGINE>,
> +				 <&mmsys CLK_MM_DSI0_DIGITAL>,
> +				 <&mipi_tx0>;
> +			clock-names = "engine", "digital", "hs";
> +			phys = <&mipi_tx0>;
> +			phy-names = "dphy";
> +			status = "disabled";
> +		};
> +
> +		dsi1: dsi@1401c000 {
> +			compatible = "mediatek,mt6795-dsi", "mediatek,mt8173-dsi";
> +			reg = <0 0x1401c000 0 0x1000>;
> +			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DSI1_ENGINE>,
> +				 <&mmsys CLK_MM_DSI1_DIGITAL>,
> +				 <&mipi_tx1>;
> +			clock-names = "engine", "digital", "hs";
> +			phys = <&mipi_tx1>;
> +			phy-names = "dphy";
> +			status = "disabled";
> +		};
> +
> +		dpi0: dpi@1401d000 {
> +			compatible = "mediatek,mt6795-dpi", "mediatek,mt8183-dpi";
> +			reg = <0 0x1401d000 0 0x1000>;
> +			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DPI_PIXEL>,
> +				 <&mmsys CLK_MM_DPI_ENGINE>,
> +				 <&apmixedsys CLK_APMIXED_TVDPLL>;
> +			clock-names = "pixel", "engine", "pll";
> +			status = "disabled";
> +		};
> +
> +		pwm0: pwm@1401e000 {
> +			compatible = "mediatek,mt6795-disp-pwm", "mediatek,mt8173-disp-pwm";
> +			reg = <0 0x1401e000 0 0x1000>;
> +			#pwm-cells = <2>;
> +			clocks = <&mmsys CLK_MM_DISP_PWM026M>, <&mmsys CLK_MM_DISP_PWM0MM>;
> +			clock-names = "main", "mm";
> +			status = "disabled";
> +		};
> +
> +		pwm1: pwm@1401f000 {
> +			compatible = "mediatek,mt6795-disp-pwm", "mediatek,mt8173-disp-pwm";
> +			reg = <0 0x1401f000 0 0x1000>;
> +			#pwm-cells = <2>;
> +			clocks = <&mmsys CLK_MM_DISP_PWM126M>, <&mmsys CLK_MM_DISP_PWM1MM>;
> +			clock-names = "main", "mm";
> +			status = "disabled";
> +		};
> +
> +		mutex: mutex@14020000 {
> +			compatible = "mediatek,mt8173-disp-mutex";
> +			reg = <0 0x14020000 0 0x1000>;
> +			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_MUTEX_32K>;
> +			mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
> +					      <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0 0x1000>;
> +		};
> +
>   		larb0: larb@14021000 {
>   			compatible = "mediatek,mt6795-smi-larb";
>   			reg = <0 0x14021000 0 0x1000>;
> @@ -708,6 +953,13 @@ smi_common: smi@14022000 {
>   			clock-names = "apb", "smi";
>   		};
>   
> +		od@14023000 {
> +			compatible = "mediatek,mt6795-disp-od", "mediatek,mt8173-disp-od";
> +			reg = <0 0x14023000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_DISP_OD>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0x3000 0x1000>;
> +		};
> +
>   		larb2: larb@15001000 {
>   			compatible = "mediatek,mt6795-smi-larb";
>   			reg = <0 0x15001000 0 0x1000>;

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

