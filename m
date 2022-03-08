Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A21C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZVaNchi6cBYQLXk6z/uiRCZ6NBdX1NLrFFkRnUMyNA=; b=fOLZKciMHVMeUG
	tLBHhYwDbWxSh29l0tOLIkvEU+DjeE8p1Q++Yw+FZMwR5n6NF7QXWgUtR3uzmC8Y0gWwpbvYAxliI
	QsH6HOEgnVFKLYJtZH0HzfN0PrylpPH5m5vAogGU2zJ2SXGIvEXUVS5iFunwdguUaiYn7Tvv9mv4L
	fAxmhcv36gEdGMePR6eMI7eiyvlKaFuE+tQBEVnvom5L50Md9tH6PFDj9MKYoAxSHA32CEark3fEe
	FWEftH4qcom83MwV5W3VVlmXptMUpyowEhTs8pHcHifsvalEeCVEq/Si7Uq+hhGmiQ9VlwuPW6qlM
	rznfcOOhjKQtYWEPy3BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWkn-003j2l-9t; Tue, 08 Mar 2022 10:07:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWb2-003fB4-H1; Tue, 08 Mar 2022 09:57:39 +0000
X-UUID: 4ee83fb031204e418b91c1af3f8863b4-20220308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dtlagHUn7D9//4toY/dfzlzPVkrVa4Yz9PjFxXFFhnE=; 
 b=Okbk1ODXOhySFmOguLwyD59VUKOIkpKKTglhDFflQDtRTobJOs2ZStUYz3zdLayBIcZURaLwJRbZfmBLS1ohDrzH1ZgWDkl5fmdi/2Vl5nvzMdLus28QxQ237xrL12jmSdnP6Q46GuJlOq1t+LWWTsY3lUOdtNQasaXXreKJYJk=;
X-UUID: 4ee83fb031204e418b91c1af3f8863b4-20220308
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1474018927; Tue, 08 Mar 2022 02:57:31 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 01:57:29 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Mar 2022 17:57:22 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Mar 2022 17:57:21 +0800
Message-ID: <e410a1916d8dad431822c811ab50e837f90c5654.camel@mediatek.com>
Subject: Re: [PATCH v2, 1/3] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <jitao.shi@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <rex-bc.chen@mediatek.com>
Date: Tue, 8 Mar 2022 17:57:36 +0800
In-Reply-To: <386e5a59-8b06-58f5-90d0-2c5a5eaa614f@collabora.com>
References: <1645178869-18048-1-git-send-email-xinlei.lee@mediatek.com>
 <1645178869-18048-2-git-send-email-xinlei.lee@mediatek.com>
 <386e5a59-8b06-58f5-90d0-2c5a5eaa614f@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_015736_632106_9C9E57AE 
X-CRM114-Status: GOOD (  25.41  )
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

On Fri, 2022-03-04 at 13:03 +0100, AngeloGioacchino Del Regno wrote:
> Il 18/02/22 11:07, xinlei.lee@mediatek.com ha scritto:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >   .../display/mediatek/mediatek,dsi.txt         | 62 --------------
> >   .../display/mediatek/mediatek,dsi.yaml        | 85
> > +++++++++++++++++++
> >   2 files changed, 85 insertions(+), 62 deletions(-)
> >   delete mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> >   create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> > l
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > deleted file mode 100644
> > index 36b01458f45c..000000000000
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > +++ /dev/null
> > @@ -1,62 +0,0 @@
> > -Mediatek DSI Device
> > -===================
> > -
> > -The Mediatek DSI function block is a sink of the display subsystem
> > and can
> > -drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized
> > for dual-
> > -channel output.
> > -
> > -Required properties:
> > -- compatible: "mediatek,<chip>-dsi"
> > -- the supported chips are mt2701, mt7623, mt8167, mt8173 and
> > mt8183.
> > -- reg: Physical base address and length of the controller's
> > registers
> > -- interrupts: The interrupt signal from the function block.
> > -- clocks: device clocks
> > -  See Documentation/devicetree/bindings/clock/clock-bindings.txt
> > for details.
> > -- clock-names: must contain "engine", "digital", and "hs"
> > -- phys: phandle link to the MIPI D-PHY controller.
> > -- phy-names: must contain "dphy"
> > -- port: Output port node with endpoint definitions as described in
> > -  Documentation/devicetree/bindings/graph.txt. This port should be
> > connected
> > -  to the input port of an attached DSI panel or DSI-to-eDP encoder
> > chip.
> > -
> > -Optional properties:
> > -- resets: list of phandle + reset specifier pair, as described in
> > [1].
> > -
> > -[1] Documentation/devicetree/bindings/reset/reset.txt
> > -
> > -MIPI TX Configuration Module
> > -============================
> > -
> > -See phy/mediatek,dsi-phy.yaml
> > -
> > -Example:
> > -
> > -mipi_tx0: mipi-dphy@10215000 {
> > -	compatible = "mediatek,mt8173-mipi-tx";
> > -	reg = <0 0x10215000 0 0x1000>;
> > -	clocks = <&clk26m>;
> > -	clock-output-names = "mipi_tx0_pll";
> > -	#clock-cells = <0>;
> > -	#phy-cells = <0>;
> > -	drive-strength-microamp = <4600>;
> > -	nvmem-cells= <&mipi_tx_calibration>;
> > -	nvmem-cell-names = "calibration-data";
> > -};
> > -
> > -dsi0: dsi@1401b000 {
> > -	compatible = "mediatek,mt8173-dsi";
> > -	reg = <0 0x1401b000 0 0x1000>;
> > -	interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_LOW>;
> > -	clocks = <&mmsys MM_DSI0_ENGINE>, <&mmsys MM_DSI0_DIGITAL>,
> > -		 <&mipi_tx0>;
> > -	clock-names = "engine", "digital", "hs";
> > -	resets = <&mmsys MT8173_MMSYS_SW0_RST_B_DISP_DSI0>;
> > -	phys = <&mipi_tx0>;
> > -	phy-names = "dphy";
> > -
> > -	port {
> > -		dsi0_out: endpoint {
> > -			remote-endpoint = <&panel_in>;
> > -		};
> > -	};
> > -};
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > aml
> > new file mode 100644
> > index 000000000000..552a013786fe
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > aml
> > @@ -0,0 +1,85 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: mediatek DSI Controller Device Tree Bindings
> 
> Shouldn't this be "MediaTek"?
> 
> > +
> > +maintainers:
> > +  - CK Hu <ck.hu@mediatek.com>
> > +  - Jitao Shi <jitao.shi@mediatek.com>
> > +  - Xinlei Lee <xinlei.lee@mediatek.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt2701-dsi
> > +      - mediatek,mt8173-dsi
> > +      - mediatek,mt8183-dsi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Engine Clock
> > +      - description: Digital Clock
> > +      - description: Hs Clock
> 
> HS should be all capital letters.
> 
> > +
> > +  clock-names:
> > +    items:
> > +      - const: engine
> > +      - const: digital
> > +      - const: hs
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  phys:
> > +    maxItems: 1
> > +
> > +  phy-names:
> > +    items:
> > +      - const: dphy
> 
> Add #address-cells, #size-cells with const 2
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - power-domains
> > +  - clocks
> > +  - clock-names
> > +  - phys
> > +  - phy-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/mt8183-power.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +    #include <dt-bindings/reset/mt8183-resets.h>
> > +
> 
> Since all users are using two address and size cells:
> 
>      soc {
>          #address-cells = <2>;
>          #size-cells = <2>;
> 
>          dsi0: dsi@14014000 {
>              compatible = "mediatek,mt8183-dsi";
>              reg = <0 0x14014000 0 0x1000>;
>                    .....etc.....
>          };
>      };
> 
> > +    dsi0: dsi@14014000 {
> > +        compatible = "mediatek,mt8183-dsi";
> > +        reg = <0x14014000 0x1000>;
> > +        interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
> > +        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > +        clocks = <&mmsys CLK_MM_DSI0_MM>,
> > +            <&mmsys CLK_MM_DSI0_IF>,
> > +            <&mipi_tx0>;
> > +        clock-names = "engine", "digital", "hs";
> > +        resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
> > +        phys = <&mipi_tx0>;
> > +        phy-names = "dphy";
> > +    };
> 
> 

Hi angelogioacchino:

Thank you for your review, I will revise it according to your
suggestion and send the next v3 in the near future.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
