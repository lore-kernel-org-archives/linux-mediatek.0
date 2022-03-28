Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5C9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 06:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6clBZ2MnlGwF8eLqKN/z9Vw+NR9xz3WMk+fuX4/rJxI=; b=NnlmrmBhE/6n8z
	uHGWdY0jn+HiX2ie444mKySEKqHBH7835YH2RzxBwyeYH4Bagny/lXhtPn4T5sijej3UCEc+6zrPf
	yoRo7/LYQV7dh2byL1OpcHAeV5unh30wxhcrIsP+y9lsP8oRD8d0gchbZwhAX2Kvg8c8SFV/ZXcpY
	2U21b0MNLM1lJbs3xk6Z1tBt4jtnUNmCMgdKzFk5zCME7YOzSLkrsXkWF8WyxiFl1T9zR9RXIqB/+
	blVxxB/pI/TnQvk+idkuFMPL7d6jALF56UUxvXJkw6ZKM2MUxBAHLiHMaHMdFHrocbFDGkBx+Ii9q
	WPeXW4N7y/vS787EO2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYj4O-007Vvp-BH; Mon, 28 Mar 2022 06:41:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYj4B-007VvF-8B; Mon, 28 Mar 2022 06:41:30 +0000
X-UUID: bdfb07ad50e64f09a3cc13639fc3320e-20220327
X-UUID: bdfb07ad50e64f09a3cc13639fc3320e-20220327
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 724989986; Sun, 27 Mar 2022 23:39:53 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Mar 2022 23:29:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 28 Mar 2022 14:29:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Mar 2022 14:29:50 +0800
Message-ID: <a652c60eb2af85add4e69045f133aadb741a37d3.camel@mediatek.com>
Subject: Re: [PATCH v4 18/22] arm64: dts: mt8192: Add display nodes
From: CK Hu <ck.hu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, <jason-jh.lin@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>
Date: Mon, 28 Mar 2022 14:29:49 +0800
In-Reply-To: <09b8c4d2-6cdd-b41b-4913-f9f2f7f4d7c7@gmail.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-19-allen-kh.cheng@mediatek.com>
 <09b8c4d2-6cdd-b41b-4913-f9f2f7f4d7c7@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_234127_357201_53A445DA 
X-CRM114-Status: GOOD (  22.28  )
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

Hi, Allen and Jason:

On Fri, 2022-03-25 at 16:47 +0100, Matthias Brugger wrote:
> 
> On 18/03/2022 15:45, Allen-KH Cheng wrote:
> > Add display nodes for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 111
> > +++++++++++++++++++++++
> >   1 file changed, 111 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index a77d405dd508..59183fb6c80b 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1205,6 +1205,13 @@
> >   			#clock-cells = <1>;
> >   		};
> >   
> > +		mutex: mutex@14001000 {
> > +			compatible = "mediatek,mt8192-disp-mutex";
> > +			reg = <0 0x14001000 0 0x1000>;
> > +			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
> 
> We are missing power-domains property.
> 
> > +		};
> > +
> >   		smi_common: smi@14002000 {
> >   			compatible = "mediatek,mt8192-smi-common";
> >   			reg = <0 0x14002000 0 0x1000>;
> > @@ -1236,6 +1243,110 @@
> >   			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> >   		};
> >   
> > +		ovl0: ovl@14005000 {
> > +			compatible = "mediatek,mt8192-disp-ovl";
> > +			reg = <0 0x14005000 0 0x1000>;
> > +			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&mmsys CLK_MM_DISP_OVL0>;
> > +			iommus = <&iommu0 M4U_PORT_L0_OVL_RDMA0>,
> > +				 <&iommu0 M4U_PORT_L0_OVL_RDMA0_HDR>;
> > +			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> > +		};
> > +
> > +		ovl_2l0: ovl@14006000 {
> > +			compatible = "mediatek,mt8192-disp-ovl-2l";
> > +			reg = <0 0x14006000 0 0x1000>;
> > +			interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> > +			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> > +			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>,
> > +				 <&iommu0
> > M4U_PORT_L1_OVL_2L_RDMA0_HDR>;
> 
> olv and ovl-2l binding mention that the node should be a sibling of
> mmsys, but 
> this does not hold anymore, correct? Chun-Kuang can you help to fix
> the binding 
> description?

The sibling problem since the first version binding document. Would you
help to fix this problem? But now the binding patch are in chaos, so
you may send patch base on mediatek-drm-fixes [1].

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-fixes

Regards,
CK

> 
> > +		};
> > +
> > +		rdma0: rdma@14007000 {
> > +			compatible = "mediatek,mt8192-disp-rdma";
> > +			reg = <0 0x14007000 0 0x1000>;
> > +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
> > +			iommus = <&iommu0 M4U_PORT_L0_DISP_RDMA0>;
> > +			mediatek,larb = <&larb0>;
> > +			mediatek,rdma-fifo-size = <5120>;
> > +			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> 
> Same here, bindings says it should be a sibling of mmsys. Apart from
> that the 
> maximal rdma-fifo-size isn't specified for all SoCs including mt1892.
> 
> > +		};
> > +
> > +		color0: color@14009000 {
> > +			compatible = "mediatek,mt8192-disp-color",
> > +				     "mediatek,mt8173-disp-color";
> > +			reg = <0 0x14009000 0 0x1000>;
> > +			interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> > +			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> > +		};
> 
> Same here, binding description needs fixed, please check for other
> bindings as 
> well. The node here looks good.
> 
> > +
> > +		ccorr0: ccorr@1400a000 {
> > +			compatible = "mediatek,mt8192-disp-ccorr";
> > +			reg = <0 0x1400a000 0 0x1000>;
> > +			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> > +			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> > +		};
> > +
> > +		aal0: aal@1400b000 {
> > +			compatible = "mediatek,mt8192-disp-aal",
> > +				     "mediatek,mt8193-disp-aal";
> > +			reg = <0 0x1400b000 0 0x1000>;
> > +			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> > +			clocks = <&mmsys CLK_MM_DISP_AAL0>;
> > +		};
> > +
> > +		gamma0: gamma@1400c000 {
> > +			compatible = "mediatek,mt8192-disp-gamma",
> > +				     "mediatek,mt8183-disp-gamma";
> > +			reg = <0 0x1400c000 0 0x1000>;
> > +			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> > +			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> > +		};
> > +
> > +		postmask0: postmask@1400d000 {
> > +			compatible = "mediatek,mt8192-disp-postmask";
> > +			reg = <0 0x1400d000 0 0x1000>;
> > +			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> > +			clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
> > +			iommus = <&iommu0 M4U_PORT_L0_DISP_POSTMASK0>;
> 
> No iommus mentioned in binding description.
> 
> Regards,
> Matthias
> 
> > +		};
> > +
> > +		dither0: dither@1400e000 {
> > +			compatible = "mediatek,mt8192-disp-dither",
> > +				     "mediatek,mt8183-disp-dither";
> > +			reg = <0 0x1400e000 0 0x1000>;
> > +			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> > +			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> > +		};
> > +
> > +		ovl_2l2: ovl@14014000 {
> > +			compatible = "mediatek,mt8192-disp-ovl-2l";
> > +			reg = <0 0x14014000 0 0x1000>;
> > +			interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> > +			clocks = <&mmsys CLK_MM_DISP_OVL2_2L>;
> > +			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2>,
> > +				 <&iommu0
> > M4U_PORT_L1_OVL_2L_RDMA2_HDR>;
> > +		};
> > +
> > +		rdma4: rdma@14015000 {
> > +			compatible = "mediatek,mt8192-disp-rdma";
> > +			reg = <0 0x14015000 0 0x1000>;
> > +			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> > +			clocks = <&mmsys CLK_MM_DISP_RDMA4>;
> > +			iommus = <&iommu0 M4U_PORT_L1_DISP_RDMA4>;
> > +			mediatek,rdma-fifo-size = <2048>;
> > +		};
> > +
> >   		dpi0: dpi@14016000 {
> >   			compatible = "mediatek,mt8192-dpi";
> >   			reg = <0 0x14016000 0 0x1000>;
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!zVqvfzFDPNKR4JTcN1lwwRDeyBfZrFrweEkoyESipag84FOR5IyZTU7FxVTR5w$
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
