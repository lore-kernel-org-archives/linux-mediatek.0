Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9118C25B06
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 02:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxupfsVphqPVa0RY6efwWYlYVX+cYj7uOfUMBxITsNM=; b=hiYvq4vxCX9L0mQormr0hvCxGq
	i9nVAPv9GDeH+AUnkoYT3t+n0dkcazfHRAkB1bUvlQxOhCztXSUsTvDimObMYVQjvXRX32i8X9zTO
	3ry1rGWjQwI/pMO8hOBxSpWfv2WFQpLt2Q8XoOL/qlA5hSxPsGdbRf5x08ei4YNEvzgMmCcMlQVaE
	LmD1FXW7auJFdtxR+IQUTlQeGoar3yK2HcAdoBZaUJ607mSMvuThYLVWF1lzO+4R1V9KinEBJAg59
	clyrrYADZsTRYHtrrI9mJGETMkrFMq1D4bx/PawnpsLfw06c9EkcH7z2WvO/sd4GOpgVtfSsL0mmz
	BTfK5NFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMKNm-008SQW-MW; Fri, 12 Aug 2022 02:26:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMKNW-008S9R-NI; Fri, 12 Aug 2022 02:26:29 +0000
X-UUID: 348fafe5d4154ae6a8f67d38e3eb3b80-20220811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:757ab9ba-4d49-424e-9a10-260c6667e931,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:3d8acc9,CLOUDID:3a986f9c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 348fafe5d4154ae6a8f67d38e3eb3b80-20220811
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1497254983; Thu, 11 Aug 2022 19:26:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 12 Aug 2022 09:35:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 12 Aug 2022 09:35:37 +0800
Message-ID: <fd8927ad972a0cde4899adf9ccafabdb4c7852d9.camel@mediatek.com>
Subject: Re: [PATCH 01/18] dt-bindings: ARM: MediaTek: Add new document
 bindings of MT8188 clock
From: Garmin Chang <garmin.chang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 12 Aug 2022 09:35:37 +0800
In-Reply-To: <e982588a-12bd-7ce6-91f4-e354ac5bec60@linaro.org>
References: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
	 <20220729082457.22253-2-Garmin.Chang@mediatek.com>
	 <e982588a-12bd-7ce6-91f4-e354ac5bec60@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_192627_000246_161CA5D7 
X-CRM114-Status: GOOD (  24.96  )
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

Dear Krzysztof


Thank you for your comments, I will revise it in the next edition.


Thanks,
Best regards,
Garmin

On Tue, 2022-08-02 at 09:31 +0200, Krzysztof Kozlowski wrote:
> On 29/07/2022 10:24, Garmin.Chang wrote:
> > Add the new binding documentation for system clock
> > and functional clock on MediaTek MT8188.
> > 
> > Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> > ---
> >  .../arm/mediatek/mediatek,mt8188-clock.yaml   | 230 ++++++
> >  .../mediatek/mediatek,mt8188-sys-clock.yaml   |  75 ++
> >  include/dt-bindings/clock/mt8188-clk.h        | 759
> > ++++++++++++++++++
> >  3 files changed, 1064 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-
> > clock.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-
> > clock.yaml
> >  create mode 100644 include/dt-bindings/clock/mt8188-clk.h
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-
> > clock.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-
> > clock.yaml
> > new file mode 100644
> > index 000000000000..b03745fe971a
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-
> > clock.yaml
> > @@ -0,0 +1,230 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "
> > https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,mt8188-clock.yaml*__;Iw!!CTRNKA9wMg0ARbw!ydPMfABiSHOE2O88pjxcZhMrkJ-Scd1BPzPWaC6BmRz3-mjqJZxOOr8G8cl2alHGbUg$
> >  "
> > +$schema: "
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!ydPMfABiSHOE2O88pjxcZhMrkJ-Scd1BPzPWaC6BmRz3-mjqJZxOOr8G8cl2tjHoC30$
> >  "
> 
> No need for quotes.
> 
> > +
> > +title: MediaTek Functional Clock Controller for MT8188
> > +
> > +maintainers:
> > +  - Garmin Chang <garmin.chang@mediatek.com>
> > +
> > +description: |
> > +  The clock architecture in MediaTek like below
> > +  PLLs -->
> > +          dividers -->
> > +                      muxes
> > +                           -->
> > +                              clock gate
> > +
> > +  The devices provide clock gate control in different IP blocks.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> 
> You have just one item, so no "items".
> 
> > +      - enum:
> > +          - mediatek,mt8188-imp_iic_wrap_c
> > +          - mediatek,mt8188-imp_iic_wrap_en
> > +          - mediatek,mt8188-imp_iic_wrap_w
> > +          - mediatek,mt8188-mfgcfg
> > +          - mediatek,mt8188-vppsys0
> > +          - mediatek,mt8188-wpesys
> > +          - mediatek,mt8188-wpesys_vpp0
> > +          - mediatek,mt8188-vppsys1
> > +          - mediatek,mt8188-imgsys
> > +          - mediatek,mt8188-imgsys_wpe1
> > +          - mediatek,mt8188-imgsys_wpe2
> > +          - mediatek,mt8188-imgsys_wpe3
> > +          - mediatek,mt8188-imgsys1_dip_top
> > +          - mediatek,mt8188-imgsys1_dip_nr
> > +          - mediatek,mt8188-ipesys
> > +          - mediatek,mt8188-camsys
> > +          - mediatek,mt8188-camsys_rawa
> > +          - mediatek,mt8188-camsys_yuva
> > +          - mediatek,mt8188-camsys_rawb
> > +          - mediatek,mt8188-camsys_yuvb
> > +          - mediatek,mt8188-ccusys
> > +          - mediatek,mt8188-vdecsys_soc
> > +          - mediatek,mt8188-vdecsys
> > +          - mediatek,mt8188-vencsys
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> 
> clock-cells should be required as well.
> 
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    imp_iic_wrap_c: clock-controller@11283000 {
> > +        compatible = "mediatek,mt8188-imp_iic_wrap_c";
> > +        reg = <0x11283000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> 
> 
> Only one example is enough. All others are exactly the same.
> 
> > +
> > +  - |
> > +    imp_iic_wrap_en: clock-controller@11ec2000 {
> > +        compatible = "mediatek,mt8188-imp_iic_wrap_en";
> > +        reg = <0x11ec2000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> 
> 
> > +
> > +  - |
> > +    imp_iic_wrap_w: clock-controller@11e02000 {
> > +        compatible = "mediatek,mt8188-imp_iic_wrap_w";
> > +        reg = <0x11e02000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    mfgcfg: clock-controller@13fbf000 {
> > +        compatible = "mediatek,mt8188-mfgcfg";
> > +        reg = <0x13fbf000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    vppsys0: clock-controller@14000000 {
> > +        compatible = "mediatek,mt8188-vppsys0";
> > +        reg = <0x14000000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    wpesys: clock-controller@14e00000 {
> > +        compatible = "mediatek,mt8188-wpesys";
> > +        reg = <0x14e00000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    wpesys_vpp0: clock-controller@14e02000 {
> > +        compatible = "mediatek,mt8188-wpesys_vpp0";
> > +        reg = <0x14e02000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    vppsys1: clock-controller@14f00000 {
> > +        compatible = "mediatek,mt8188-vppsys1";
> > +        reg = <0x14f00000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    imgsys: clock-controller@15000000 {
> > +        compatible = "mediatek,mt8188-imgsys";
> > +        reg = <0x15000000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    imgsys_wpe1: clock-controller@15220000 {
> > +        compatible = "mediatek,mt8188-imgsys_wpe1";
> > +        reg = <0x15220000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    imgsys_wpe2: clock-controller@15520000 {
> > +        compatible = "mediatek,mt8188-imgsys_wpe2";
> > +        reg = <0x15520000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    imgsys_wpe3: clock-controller@15620000 {
> > +        compatible = "mediatek,mt8188-imgsys_wpe3";
> > +        reg = <0x15620000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    imgsys1_dip_top: clock-controller@15110000 {
> > +        compatible = "mediatek,mt8188-imgsys1_dip_top";
> > +        reg = <0x15110000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    imgsys1_dip_nr: clock-controller@15130000 {
> > +        compatible = "mediatek,mt8188-imgsys1_dip_nr";
> > +        reg = <0x15130000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    ipesys: clock-controller@15330000 {
> > +        compatible = "mediatek,mt8188-ipesys";
> > +        reg = <0x15330000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    camsys: clock-controller@16000000 {
> > +        compatible = "mediatek,mt8188-camsys";
> > +        reg = <0x16000000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    camsys_rawa: clock-controller@1604f000 {
> > +        compatible = "mediatek,mt8188-camsys_rawa";
> > +        reg = <0x1604f000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    camsys_yuva: clock-controller@1606f000 {
> > +        compatible = "mediatek,mt8188-camsys_yuva";
> > +        reg = <0x1606f000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    camsys_rawb: clock-controller@1608f000 {
> > +        compatible = "mediatek,mt8188-camsys_rawb";
> > +        reg = <0x1608f000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    camsys_yuvb: clock-controller@160af000 {
> > +        compatible = "mediatek,mt8188-camsys_yuvb";
> > +        reg = <0x160af000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    ccusys: clock-controller@17200000 {
> > +        compatible = "mediatek,mt8188-ccusys";
> > +        reg = <0x17200000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    vdecsys_soc: clock-controller@1800f000 {
> > +        compatible = "mediatek,mt8188-vdecsys_soc";
> > +        reg = <0x1800f000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    vdecsys: clock-controller@1802f000 {
> > +        compatible = "mediatek,mt8188-vdecsys";
> > +        reg = <0x1802f000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    vencsys: clock-controller@1a000000 {
> > +        compatible = "mediatek,mt8188-vencsys";
> > +        reg = <0x1a000000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-
> > sys-clock.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-
> > sys-clock.yaml
> > new file mode 100644
> > index 000000000000..b97cad03241c
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-
> > sys-clock.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "
> > https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,mt8188-sys-clock.yaml*__;Iw!!CTRNKA9wMg0ARbw!ydPMfABiSHOE2O88pjxcZhMrkJ-Scd1BPzPWaC6BmRz3-mjqJZxOOr8G8cl21roH3SU$
> >  "
> > +$schema: "
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!ydPMfABiSHOE2O88pjxcZhMrkJ-Scd1BPzPWaC6BmRz3-mjqJZxOOr8G8cl2tjHoC30$
> >  "
> 
> All previous comments apply here and further as well.
> 
> (...)
> 
> > diff --git a/include/dt-bindings/clock/mt8188-clk.h b/include/dt-
> > bindings/clock/mt8188-clk.h
> > new file mode 100644
> > index 000000000000..bd1f21bd6584
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/mt8188-clk.h
> 
> Filename with vendor prefix, so "mediatek,mt8188-clk.h"
> 
> 
> Best regards,
> Krzysztof


