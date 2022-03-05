Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B322C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Mar 2022 18:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=981Q0xo1OP+dx6yLxoCY31f4veEvSF35c8Dbn+2lNaE=; b=CVPGuu9ML+q73O
	1SD83d38A12cLbtPxu8kMjWp76HnD83thykgS6B3K6Lgd4PTeKzEFxdkPziHpAqG3a2Y6QQ2awl5Y
	BwoeCd05kJVgxTl+6reT5N4RD5cdd32ZkFXpZuqFdRv4ISibAnfGk1z5DAx2r5+iFbqdjeY7H+8iV
	o6JMRMKmXn+/Npc/keXd90AJ5PF+NxgCROV9f2JnMksFWb2YZgYVc3svrnKl0J2AX3baCv1u4D0E0
	mplMcPxXybg62nwHFUcwrQMrn2TcEqXgcmUm/TMqWFFWZoxyFcCwh0JVWnihbPIh4bEij0XWDBNVS
	V8yncMIwZGe61qlR9UJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQZOx-00DeSb-Lu; Sat, 05 Mar 2022 18:45:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQZOt-00DeRy-4y; Sat, 05 Mar 2022 18:45:10 +0000
X-UUID: d45b90e0c7094c3391f5191fefa1e52e-20220305
X-UUID: d45b90e0c7094c3391f5191fefa1e52e-20220305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2026177066; Sat, 05 Mar 2022 11:45:00 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Mar 2022 10:34:58 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Mar 2022 02:34:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 6 Mar 2022 02:34:57 +0800
Message-ID: <84e2bb5d7047fc1291d765131ce3f6b265a5304e.camel@mediatek.com>
Subject: Re: [PATCH 3/3] dt-bindings: display: mediatek: Fix examples on new
 bindings
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
CC: <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski@canonical.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <matthias.bgg@gmail.com>, <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Sun, 6 Mar 2022 02:34:57 +0800
In-Reply-To: <20220304095458.12409-4-angelogioacchino.delregno@collabora.com>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-4-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220305_104507_216357_37A57DAB 
X-CRM114-Status: GOOD (  17.31  )
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

Hi Angelo,

Thanks you very much for fixing them all.
I really appreciate it :-)

I tested these patches and found some small problem.


On Fri, 2022-03-04 at 10:54 +0100, AngeloGioacchino Del Regno wrote:
> To avoid failure of dt_binding_check perform a slight refactoring
> of the examples: the main block is kept, but that required fixing
> the address and size cells, plus the inclusion of missing dt-bindings
> headers, required to parse some of the values assigned to various
> properties.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split
> each block to individual yaml")
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,aal.yaml        | 24 +++--
>  .../display/mediatek/mediatek,ccorr.yaml      | 23 +++--
>  .../display/mediatek/mediatek,color.yaml      | 23 +++--
>  .../display/mediatek/mediatek,dither.yaml     | 23 +++--
>  .../display/mediatek/mediatek,dpi.yaml        |  3 +-
>  .../display/mediatek/mediatek,dsc.yaml        | 23 +++--
>  .../display/mediatek/mediatek,ethdr.yaml      | 99 ++++++++++-------
> --
>  .../display/mediatek/mediatek,gamma.yaml      | 23 +++--
>  .../display/mediatek/mediatek,merge.yaml      | 49 +++++----
>  .../display/mediatek/mediatek,mutex.yaml      | 25 +++--
>  .../display/mediatek/mediatek,od.yaml         | 14 ++-
>  .../display/mediatek/mediatek,ovl-2l.yaml     | 26 +++--
>  .../display/mediatek/mediatek,ovl.yaml        | 26 +++--
>  .../display/mediatek/mediatek,postmask.yaml   | 23 +++--
>  .../display/mediatek/mediatek,rdma.yaml       | 28 ++++--
>  .../display/mediatek/mediatek,split.yaml      | 17 +++-
>  .../display/mediatek/mediatek,ufoe.yaml       | 19 ++--
>  .../display/mediatek/mediatek,wdma.yaml       | 26 +++--
>  18 files changed, 316 insertions(+), 178 deletions(-)

[snip]

> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y
> aml
> index 131eed5eeeb7..e16deca0dc2b 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y
> aml
> @@ -97,51 +97,62 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +    #include <dt-bindings/memory/mt8195-memory-port.h>

This header file should base on [1].
[1] dt-bindings: mediatek: mt8195: Add binding for MM IOMMU

https://patchwork.kernel.org/project/linux-mediatek/patch/20220217113453.13658-2-yong.wu@mediatek.com/

> +    #include <dt-bindings/power/mt8195-power.h>
> +    #include <dt-bindings/reset/mt8195-resets.h>
>  
> -    disp_ethdr@1c114000 {
> -            compatible = "mediatek,mt8195-disp-ethdr";
> -            reg = <0 0x1c114000 0 0x1000>,
> -                  <0 0x1c115000 0 0x1000>,
> -                  <0 0x1c117000 0 0x1000>,
> -                  <0 0x1c119000 0 0x1000>,
> -                  <0 0x1c11A000 0 0x1000>,
> -                  <0 0x1c11B000 0 0x1000>,
> -                  <0 0x1c11C000 0 0x1000>;
> -            reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0",
> "gfx_fe1",
> -                        "vdo_be", "adl_ds";
> -            mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000
> 0x1000>,
> -                                      <&gce0 SUBSYS_1c11XXXX 0x5000
> 0x1000>,
> -                                      <&gce0 SUBSYS_1c11XXXX 0x7000
> 0x1000>,
> -                                      <&gce0 SUBSYS_1c11XXXX 0x9000
> 0x1000>,
> -                                      <&gce0 SUBSYS_1c11XXXX 0xA000
> 0x1000>,
> -                                      <&gce0 SUBSYS_1c11XXXX 0xB000
> 0x1000>,
> -                                      <&gce0 SUBSYS_1c11XXXX 0xC000
> 0x1000>;
> -            clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
> -                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> -                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> -                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> -                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> -                     <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> -                     <&vdosys1 CLK_VDO1_26M_SLOW>,
> -                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> -                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> -                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> -                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> -                     <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> -                     <&topckgen CLK_TOP_ETHDR_SEL>;
> -            clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0",
> "gfx_fe1",
> -                          "vdo_be", "adl_ds", "vdo_fe0_async",
> "vdo_fe1_async",
> -                          "gfx_fe0_async",
> "gfx_fe1_async","vdo_be_async",
> -                          "ethdr_top";
> -            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> -            iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> -                     <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> -            interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /*
> disp mixer */
> -            resets = <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
> -                     <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
> -                     <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
> -                     <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
> -                     <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        disp_ethdr@1c114000 {
> +                compatible = "mediatek,mt8195-disp-ethdr";
> +                reg = <0 0x1c114000 0 0x1000>,
> +                      <0 0x1c115000 0 0x1000>,
> +                      <0 0x1c117000 0 0x1000>,
> +                      <0 0x1c119000 0 0x1000>,
> +                      <0 0x1c11A000 0 0x1000>,
> +                      <0 0x1c11B000 0 0x1000>,
> +                      <0 0x1c11C000 0 0x1000>;
> +                reg-names = "mixer", "vdo_fe0", "vdo_fe1",
> "gfx_fe0", "gfx_fe1",
> +                            "vdo_be", "adl_ds";
> +                mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX
> 0x4000 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX
> 0x5000 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX
> 0x7000 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX
> 0x9000 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX
> 0xA000 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX
> 0xB000 0x1000>,
> +                                          <&gce0 SUBSYS_1c11XXXX
> 0xC000 0x1000>;
> +                clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> +                         <&vdosys1 CLK_VDO1_26M_SLOW>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> +                         <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> +                         <&topckgen CLK_TOP_ETHDR>;
> +                clock-names = "mixer", "vdo_fe0", "vdo_fe1",
> "gfx_fe0", "gfx_fe1",
> +                              "vdo_be", "adl_ds", "vdo_fe0_async",
> "vdo_fe1_async",
> +                              "gfx_fe0_async",
> "gfx_fe1_async","vdo_be_async",
> +                              "ethdr_top";
> +                power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +                iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> +                         <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> +                interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /*
> disp mixer */
> +                resets = <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
> +                         <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
> +                         <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
> +                         <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
> +                         <&vdosys1
> MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;

These define should base on [2].
[2] dt-bindings: reset: mt8195: add vdosys1 reset control bit

https://patchwork.kernel.org/project/linux-mediatek/patch/20220222100741.30138-5-nancy.lin@mediatek.com/

+        };
>      };
>  

[snip]

> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> index e3cef99d0f98..25d2ac2a4f05 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> @@ -66,13 +66,23 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/power/mt8173-power.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +    #include <dt-bindings/memory/mt8173-larb-port.h>

These should be mt8183 header files.

#include <dt-bindings/clock/mt8183-clk.h>
#include <dt-bindings/power/mt8183-power.h>
#include <dt-bindings/gce/mt8183-gce.h>
#include <dt-bindings/memory/mt8183-larb-port.h>

> -    ovl_2l0: ovl@14009000 {
> -        compatible = "mediatek,mt8183-disp-ovl-2l";
> -        reg = <0 0x14009000 0 0x1000>;
> -        interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
> -        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> -        clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> -        iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
> -        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000
> 0x1000>;
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        ovl_2l0: ovl@14009000 {
> +            compatible = "mediatek,mt8183-disp-ovl-2l";
> +            reg = <0 0x14009000 0 0x1000>;
> +            interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
> +            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +            clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> +            iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
> +            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000
> 0x1000>;
> +        };
>      };

[snip]

Thanks again! 
Tested-by: Jason-JH.Lin <jason-jh.lin@medaitek.com>

Regards,
Jason-JH.Lin

-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
