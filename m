Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09F5C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 07:09:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BEE42313E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 07:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BEE42313E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JF3QWiqlkjUdJu9FhlQv1yCVn9PtbRmokJfX8hGziM8=; b=M4yM9Bu9UU4P6JaWEYRhZjbe4
	s212EQ6a7N/jNab1PR0mfWJ35o5NicuwRkn41mAJczD/GMLa+m+glcgaRb1bPVaDLHGpV9vC78pdW
	UckOmJqhuLp6863QbaHVIZpWG9+rlbq8tGUeTvc9JmQ4hzp/IplAmSwOYitt0beJ1JM7n4lMNM+vh
	Xg2JMD/ATDhRAEZHQFRPCLQCm7M2lU4whEQrbHfpCoXOavXG+caAWvDBnXX/LASzr91XSjVImDsui
	6JpHOEJQeEjpSMmPC8TD4nd/u8O/iTeQia+VpJAfkqH91cN1X1utT3GhPvRFLrmaRSnl6p4kW8WT3
	pNJT0YcpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knG58-0005O4-KD; Thu, 10 Dec 2020 07:09:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knG52-0005NQ-6b; Thu, 10 Dec 2020 07:09:39 +0000
X-UUID: 914ebfef78674e708498b5695fb3dc6d-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=f8Y5QsexQYDNx3bkp5Erfl/DN3ya8EDVRWIVJ5qRIv4=; 
 b=LRCcpjYAqzTmr8K59/qoHsdHLeaivur0n1BG8MvMx2FTMAo9As+lRBHJwjkonaylNvlYyFa4QdejfoQaYhnOB/dq0eAkaRMXzUq7NWdd9Mu92PuWzgdIESQERmH8Y3Jjz0KJ1O7xAy6VC28er3T2UNzZWXNU4Z/rQyg11bVQt9I=;
X-UUID: 914ebfef78674e708498b5695fb3dc6d-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1665400939; Wed, 09 Dec 2020 23:09:28 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 23:01:10 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 15:01:09 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Dec 2020 15:01:09 +0800
Message-ID: <1607583669.2269.2.camel@mtksdaap41>
Subject: Re: [PATCH 3/3] arm64: dts: mt8183: Add display nodes for MT8183
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Thu, 10 Dec 2020 15:01:09 +0800
In-Reply-To: <20201127104930.1981497-4-enric.balletbo@collabora.com>
References: <20201127104930.1981497-1-enric.balletbo@collabora.com>
 <20201127104930.1981497-4-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_020938_105967_8170325F 
X-CRM114-Status: GOOD (  14.08  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Enric:

On Fri, 2020-11-27 at 11:49 +0100, Enric Balletbo i Serra wrote:
> Add display subsystem device nodes to allow video output.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 114 +++++++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index ba9ff192cda3..34d83f517b07 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <dt-bindings/clock/mt8183-clk.h>
> +#include <dt-bindings/gce/mt8173-gce.h>

This should be

#include <dt-bindings/gce/mt8183-gce.h>

Regards,
CK

>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/memory/mt8183-larb-port.h>
> @@ -33,6 +34,11 @@ aliases {
>  		i2c9 = &i2c9;
>  		i2c10 = &i2c10;
>  		i2c11 = &i2c11;
> +		ovl0 = &ovl0;
> +		ovl-2l0 = &ovl_2l0;
> +		ovl-2l1 = &ovl_2l1;
> +		rdma0 = &rdma0;
> +		rdma1 = &rdma1;
>  	};
>  
>  	cpus {
> @@ -964,6 +970,107 @@ mmsys: syscon@14000000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		ovl0: ovl@14008000 {
> +			compatible = "mediatek,mt8183-disp-ovl";
> +			reg = <0 0x14008000 0 0x1000>;
> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +			iommus = <&iommu M4U_PORT_DISP_OVL0>;
> +			mediatek,larb = <&larb0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
> +		};
> +
> +		ovl_2l0: ovl@14009000 {
> +			compatible = "mediatek,mt8183-disp-ovl-2l";
> +			reg = <0 0x14009000 0 0x1000>;
> +			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> +			iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
> +			mediatek,larb = <&larb0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
> +		};
> +
> +		ovl_2l1: ovl@1400a000 {
> +			compatible = "mediatek,mt8183-disp-ovl-2l";
> +			reg = <0 0x1400a000 0 0x1000>;
> +			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
> +			iommus = <&iommu M4U_PORT_DISP_2L_OVL1_LARB0>;
> +			mediatek,larb = <&larb0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
> +		};
> +
> +		rdma0: rdma@1400b000 {
> +			compatible = "mediatek,mt8183-disp-rdma";
> +			reg = <0 0x1400b000 0 0x1000>;
> +			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
> +			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
> +			mediatek,larb = <&larb0>;
> +			mediatek,rdma_fifo_size = <5120>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
> +		};
> +
> +		rdma1: rdma@1400c000 {
> +			compatible = "mediatek,mt8183-disp-rdma";
> +			reg = <0 0x1400c000 0 0x1000>;
> +			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> +			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
> +			mediatek,larb = <&larb0>;
> +			mediatek,rdma_fifo_size = <2048>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
> +		};
> +
> +		color0: color@1400e000 {
> +			compatible = "mediatek,mt8183-disp-color",
> +				     "mediatek,mt8173-disp-color";
> +			reg = <0 0x1400e000 0 0x1000>;
> +			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
> +		};
> +
> +		ccorr0: ccorr@1400f000 {
> +			compatible = "mediatek,mt8183-disp-ccorr";
> +			reg = <0 0x1400f000 0 0x1000>;
> +			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> +		};
> +
> +		aal0: aal@14010000 {
> +			compatible = "mediatek,mt8183-disp-aal",
> +				     "mediatek,mt8173-disp-aal";
> +			reg = <0 0x14010000 0 0x1000>;
> +			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_AAL0>;
> +		};
> +
> +		gamma0: gamma@14011000 {
> +			compatible = "mediatek,mt8183-disp-gamma",
> +				     "mediatek,mt8173-disp-gamma";
> +			reg = <0 0x14011000 0 0x1000>;
> +			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> +		};
> +
> +		dither0: dither@14012000 {
> +			compatible = "mediatek,mt8183-disp-dither";
> +			reg = <0 0x14012000 0 0x1000>;
> +			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> +		};
> +
>  		dsi0: dsi@14014000 {
>  			compatible = "mediatek,mt8183-dsi";
>  			reg = <0 0x14014000 0 0x1000>;
> @@ -978,6 +1085,13 @@ dsi0: dsi@14014000 {
>  			phy-names = "dphy";
>  		};
>  
> +		mutex: mutex@14016000 {
> +			compatible = "mediatek,mt8183-disp-mutex";
> +			reg = <0 0x14016000 0 0x1000>;
> +			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +		};
> +
>  		larb0: larb@14017000 {
>  			compatible = "mediatek,mt8183-smi-larb";
>  			reg = <0 0x14017000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
