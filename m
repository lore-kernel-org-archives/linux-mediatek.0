Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BEEC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XEf29Y0EUHYVr7FcYdmMEkUOKTN1BsYxkJrQHi765T4=; b=uVUAUfFUXbHN4L
	BOZFvst/2fTgmQfhkcDZ7NaJX/gBTlH7E5g00gaSXwo5QzFv1GoUw8TneMZVZwH1Cpo+lKX8e3jOD
	vC+msEa6IeuRWWLVbkNRWtGNAPGHDD9Cx95ZYe9LgI0YvypqWGJzQ+annwzF5yfKCKpeSi5CcI+e0
	LAIDbrs+MLtbu5cvmbB6Gt7DTi7GiSHzNn6mj833/oSI/GZ8gG2xNYq2Zl2DluI5IWrnHItYt/MV/
	IkLpj20u8432+hmQaisgYt5ovStyVwmx4JH57714gzY3V3r+QP14bPWhWWjfDRtOo4aCouQNKlwa0
	eUaxCDjjoi1AzFJY8lNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPLwH-002F1q-AJ; Wed, 02 Mar 2022 10:10:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPLw4-002Exa-3T; Wed, 02 Mar 2022 10:10:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D7F451F44C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646215818;
 bh=WFRGvM2onPrpRbSVW3Tlrnw+GTSdK1+cHvhQ/RLh3po=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KTcGsziFN1GPPrywAiosxNCeo7jT742wZduVckgWindv4Hs7v1jWkYxwj+1ySjXqU
 nS3kxPuEqM1U21iSIoIdeRlrs62Q6DXvkOFuXH8oztwcSInJGT7GTszcyNM6Z1hUFq
 JJR1mhrPBM7MJCf2Yun0g8xYyfN6tSziOjdVLU8zWoI+GIThmpk9WI+pveHW3wGObQ
 LlsUgXI6LuWoLnwPJUyQEHz28NpWmPbXHdAZQcDAd0oCgFgsd0KBgsSEOWkLN8FMQ9
 OpjE9b3H5ASB/rKPI0cfDgMCrjD/+LEtJgOlT27ou85NpugwdIEPhJQ86IIuVQSEoF
 9ilFvAY/wwGqQ==
Message-ID: <2f79204f-073b-aac3-88b6-1f9868c97f70@collabora.com>
Date: Wed, 2 Mar 2022 11:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v12 23/23] arm64: dts: mt8195: add display node for vdosys1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com, srv_heupstream@mediatek.com
References: <20220222100741.30138-1-nancy.lin@mediatek.com>
 <20220222100741.30138-24-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220222100741.30138-24-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_021020_498991_BCC4ED2A 
X-CRM114-Status: GOOD (  16.37  )
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

Il 22/02/22 11:07, Nancy.Lin ha scritto:
> Add display node for vdosys1.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 222 +++++++++++++++++++++++
>   1 file changed, 222 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index e136761345db..a69a7b57e070 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -10,6 +10,7 @@
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/power/mt8195-power.h>
> +#include <dt-bindings/reset/mt8195-resets.h>
>   
>   / {
>   	compatible = "mediatek,mt8195";
> @@ -20,6 +21,22 @@
>   	aliases {
>   		gce0 = &gce0;
>   		gce1 = &gce1;
> +		ethdr0 = &ethdr0;
> +		mutex0 = &mutex;
> +		mutex1 = &mutex1;
> +		merge1 = &merge1;
> +		merge2 = &merge2;
> +		merge3 = &merge3;
> +		merge4 = &merge4;
> +		merge5 = &merge5;
> +		vdo1_rdma0 = &vdo1_rdma0;

If you really need these aliases, then they should not have underscores.

vdo1-rdma0 = &vdo1_rdma0;

> +		vdo1_rdma1 = &vdo1_rdma1;
> +		vdo1_rdma2 = &vdo1_rdma2;
> +		vdo1_rdma3 = &vdo1_rdma3;
> +		vdo1_rdma4 = &vdo1_rdma4;
> +		vdo1_rdma5 = &vdo1_rdma5;
> +		vdo1_rdma6 = &vdo1_rdma6;
> +		vdo1_rdma7 = &vdo1_rdma7;
>   	};
>   
>   	clocks {
> @@ -1235,7 +1252,212 @@
>   		vdosys1: syscon@1c100000 {
>   			compatible = "mediatek,mt8195-vdosys1", "syscon";
>   			reg = <0 0x1c100000 0 0x1000>;
> +			mboxes = <&gce0 1 CMDQ_THR_PRIO_4>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x0000 0x1000>;
>   			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		mutex1: disp_mutex0@1c101000 {

Please, no underscores.

This should be either mutex@1c101000 or disp-mutex@1c101000.
I prefer the first one, without "disp-" prefix.

> +			compatible = "mediatek,mt8195-disp-mutex";
> +			reg = <0 0x1c101000 0 0x1000>;
> +			reg-names = "vdo1_mutex";
> +			interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			clocks = <&vdosys1 CLK_VDO1_DISP_MUTEX>;
> +			clock-names = "vdo1_mutex";
> +			mediatek,gce-events = <CMDQ_EVENT_VDO1_STREAM_DONE_ENG_0>;
> +		};
> +
> +		vdo1_rdma0: vdo1_rdma@1c104000 {

vdo1_rdma0: disp-rdma@1c104000 or, simply, vdo1_rdma0: rdma@1c104000

... Same for the others.

> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c104000 0 0x1000>;
> +			interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x4000 0x1000>;
> +		};
> +
> +		vdo1_rdma1: vdo1_rdma@1c105000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c105000 0 0x1000>;
> +			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA1>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA1>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x5000 0x1000>;
> +		};
> +
> +		vdo1_rdma2: vdo1_rdma@1c106000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c106000 0 0x1000>;
> +			interrupts = <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA2>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA2>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x6000 0x1000>;
> +		};
> +
> +		vdo1_rdma3: vdo1_rdma@1c107000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c107000 0 0x1000>;
> +			interrupts = <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA3>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA3>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x7000 0x1000>;
> +		};
> +
> +		vdo1_rdma4: vdo1_rdma@1c108000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c108000 0 0x1000>;
> +			interrupts = <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA4>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA4>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x8000 0x1000>;
> +		};
> +
> +		vdo1_rdma5: vdo1_rdma@1c109000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c109000 0 0x1000>;
> +			interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA5>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA5>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x9000 0x1000>;
> +		};
> +
> +		vdo1_rdma6: vdo1_rdma@1c10a000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c10a000 0 0x1000>;
> +			interrupts = <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA6>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA6>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xa000 0x1000>;
> +		};
> +
> +		vdo1_rdma7: vdo1_rdma@1c10b000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c10b000 0 0x1000>;
> +			interrupts = <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA7>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA7>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xb000 0x1000>;
> +		};
> +
> +		merge1: disp_vpp_merge@1c10c000 {

vpp-merge@1c10c000 (etc)

> +			compatible = "mediatek,mt8195-disp-merge";
> +			reg = <0 0x1c10c000 0 0x1000>;
> +			interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE0>,
> +				 <&vdosys1 CLK_VDO1_MERGE0_DL_ASYNC>;
> +			clock-names = "merge","merge_async";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xc000 0x1000>;
> +			mediatek,merge-mute = <1>;
> +			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC>;
> +		};
> +
> +		merge2: disp_vpp_merge@1c10d000 {
> +			compatible = "mediatek,mt8195-disp-merge";
> +			reg = <0 0x1c10d000 0 0x1000>;
> +			interrupts = <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE1>,
> +				 <&vdosys1 CLK_VDO1_MERGE1_DL_ASYNC>;
> +			clock-names = "merge","merge_async";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xd000 0x1000>;
> +			mediatek,merge-mute = <1>;
> +			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC>;
> +		};
> +
> +		merge3: disp_vpp_merge@1c10e000 {
> +			compatible = "mediatek,mt8195-disp-merge";
> +			reg = <0 0x1c10e000 0 0x1000>;
> +			interrupts = <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE2>,
> +				 <&vdosys1 CLK_VDO1_MERGE2_DL_ASYNC>;
> +			clock-names = "merge","merge_async";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xe000 0x1000>;
> +			mediatek,merge-mute = <1>;
> +			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC>;
> +		};
> +
> +		merge4: disp_vpp_merge@1c10f000 {
> +			compatible = "mediatek,mt8195-disp-merge";
> +			reg = <0 0x1c10f000 0 0x1000>;
> +			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE3>,
> +				 <&vdosys1 CLK_VDO1_MERGE3_DL_ASYNC>;
> +			clock-names = "merge","merge_async";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xf000 0x1000>;
> +			mediatek,merge-mute = <1>;
> +			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC>;
> +		};
> +
> +		merge5: disp_vpp_merge@1c110000 {
> +			compatible = "mediatek,mt8195-disp-merge";
> +			reg = <0 0x1c110000 0 0x1000>;
> +			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
> +				 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
> +			clock-names = "merge","merge_async";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x0000 0x1000>;
> +			mediatek,merge-fifo-en = <1>;
> +			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
> +		};
> +
> +		ethdr0: disp_ethdr@1c114000 {

ethdr@1c114000

> +			compatible = "mediatek,mt8195-disp-ethdr";
> +			reg = <0 0x1c114000 0 0x1000>,
> +			      <0 0x1c115000 0 0x1000>,
> +			      <0 0x1c117000 0 0x1000>,
> +			      <0 0x1c119000 0 0x1000>,
> +			      <0 0x1c11A000 0 0x1000>,
> +			      <0 0x1c11B000 0 0x1000>,
> +			      <0 0x1c11C000 0 0x1000>;
> +			reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
> +				    "vdo_be", "adl_ds";
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0xA000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0xB000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0xC000 0x1000>;
> +			clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> +				 <&vdosys1 CLK_VDO1_26M_SLOW>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> +				 <&topckgen CLK_TOP_ETHDR>;
> +			clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
> +				      "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
> +				      "gfx_fe0_async", "gfx_fe1_async","vdo_be_async",
> +				      "ethdr_top";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> +				 <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> +			interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp mixer */
> +			resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
> +				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
> +				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
> +				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
> +				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
>   		};
>   	};
>   
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
