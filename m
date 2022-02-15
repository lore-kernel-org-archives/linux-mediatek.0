Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2720C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 10:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0d9L3xTe4zNEUKauBkF4eSAgF1c9oiOB8vLwT4yozM=; b=EwQhajwOKlWhMi
	nwWJ1pQvfy6tWPDT5w1sI2Eb8SKxxfPVIiVwBpyqCwm42FtEv/+nTrZHChtT+xB7uDu079vm9u5kN
	VkKQY6yIQgcTRd9pAN4IZxHpuRCE9QBiqcftZNpvIFo5RDC5iwL78WS96TANPWKqiEU3hgKr6hwAV
	Q6UZMrhw40clur7eJVyrhWNOo7xUikR6NCBtFd/EiBxke8LB5B/D+G1RsMFkjC7tr37lTQUGurgwm
	V2joyp3SlGjlkEeyECKcXQPTYoQtr3WSOWTOaEVj5xiavIvJD+9wzX4tCEwRmhWp8W22JFyoVMgtY
	i3ECpVec2a19oMnkQ7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJv0O-002ILz-Cu; Tue, 15 Feb 2022 10:24:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJv0B-002IHF-3X; Tue, 15 Feb 2022 10:24:09 +0000
X-UUID: 1d047d68dc694322ac75d810b0cc4d56-20220215
X-UUID: 1d047d68dc694322ac75d810b0cc4d56-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1273765640; Tue, 15 Feb 2022 03:24:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 02:23:59 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 15 Feb 2022 18:23:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 18:23:57 +0800
Message-ID: <52212d3177dd6609129388f95c0c5b415b9918a8.camel@mediatek.com>
Subject: Re: [v1 01/16] dt-bindings: ARM: Mediatek: Add new document
 bindings of MT8186 clock
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 15 Feb 2022 18:23:57 +0800
In-Reply-To: <0900d6de780557023c676431173bfc4493fe03b0.camel@mediatek.com>
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-2-chun-jie.chen@mediatek.com>
 <YetPCgSSRiWpDtcc@robh.at.kernel.org>
 <0900d6de780557023c676431173bfc4493fe03b0.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_022407_192184_2A4796CC 
X-CRM114-Status: GOOD (  24.34  )
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

On Wed, 2022-02-09 at 09:40 +0800, Chun-Jie Chen wrote:
> On Fri, 2022-01-21 at 18:25 -0600, Rob Herring wrote:
> > On Mon, Jan 10, 2022 at 09:44:01PM +0800, Chun-Jie Chen wrote:
> > > This patch adds the new binding documentation for system clock
> > > and functional clock on Mediatek MT8186.
> > > 
> > > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > > ---
> > >  .../arm/mediatek/mediatek,mt8186-clock.yaml   | 133
> > > ++++++++++++++++++
> > >  .../mediatek/mediatek,mt8186-sys-clock.yaml   |  74 ++++++++++
> > >  2 files changed, 207 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > > clock.yaml
> > >  create mode 100644
> > > Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > > sys-
> > > clock.yaml
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > > clock.yaml
> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > > clock.yaml
> > > new file mode 100644
> > > index 000000000000..fc39101bc9b0
> > > --- /dev/null
> > > +++
> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > > clock.yaml
> > > @@ -0,0 +1,133 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "
> > > 
https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml*__;Iw!!CTRNKA9wMg0ARbw!3pIyNVU0grMb7zKVQZoRO2z-eKrg6FnGcieEON8cCw84G6_W7Tt4GEFwytcYEXyrcj6e$
> > >  "
> > > +$schema: "
> > > 
https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!3pIyNVU0grMb7zKVQZoRO2z-eKrg6FnGcieEON8cCw84G6_W7Tt4GEFwytcYEUOCCW1i$
> > >  "
> > > +
> > > +title: Mediatek Functional Clock Controller for MT8186
> > > +
> > > +maintainers:
> > > +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > > +
> > > +description:
> > > +  The clock architecture in Mediatek like below
> > > +  PLLs -->
> > > +          dividers -->
> > > +                      muxes
> > > +                           -->
> > > +                              clock gate
> > > +
> > > +  The devices provide clock gate control in different IP blocks.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - mediatek,mt8186-imp_iic_wrap
> > > +          - mediatek,mt8186-mfgsys
> > > +          - mediatek,mt8186-wpesys
> > > +          - mediatek,mt8186-imgsys1
> > > +          - mediatek,mt8186-imgsys2
> > > +          - mediatek,mt8186-vdecsys
> > > +          - mediatek,mt8186-vencsys
> > > +          - mediatek,mt8186-camsys
> > > +          - mediatek,mt8186-camsys_rawa
> > > +          - mediatek,mt8186-camsys_rawb
> > > +          - mediatek,mt8186-mdpsys
> > > +          - mediatek,mt8186-ipesys
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  '#clock-cells':
> > > +    const: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    imp_iic_wrap: clock-controller@11017000 {
> > > +        compatible = "mediatek,mt8186-imp_iic_wrap";
> > > +        reg = <0x11017000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    mfgsys: clock-controller@13000000 {
> > > +        compatible = "mediatek,mt8186-mfgsys";
> > > +        reg = <0x13000000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    wpesys: clock-controller@14020000 {
> > > +        compatible = "mediatek,mt8186-wpesys";
> > > +        reg = <0x14020000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    imgsys1: clock-controller@15020000 {
> > > +        compatible = "mediatek,mt8186-imgsys1";
> > > +        reg = <0x15020000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    imgsys2: clock-controller@15820000 {
> > > +        compatible = "mediatek,mt8186-imgsys2";
> > > +        reg = <0x15820000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    vdecsys: clock-controller@1602f000 {
> > > +        compatible = "mediatek,mt8186-vdecsys";
> > > +        reg = <0x1602f000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    vencsys: clock-controller@17000000 {
> > > +        compatible = "mediatek,mt8186-vencsys";
> > > +        reg = <0x17000000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    camsys: clock-controller@1a000000 {
> > > +        compatible = "mediatek,mt8186-camsys";
> > > +        reg = <0x1a000000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    camsys_rawa: clock-controller@1a04f000 {
> > > +        compatible = "mediatek,mt8186-camsys_rawa";
> > > +        reg = <0x1a04f000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    camsys_rawb: clock-controller@1a06f000 {
> > > +        compatible = "mediatek,mt8186-camsys_rawb";
> > > +        reg = <0x1a06f000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    mdpsys: clock-controller@1b000000 {
> > > +        compatible = "mediatek,mt8186-mdpsys";
> > > +        reg = <0x1b000000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    ipesys: clock-controller@1c000000 {
> > > +        compatible = "mediatek,mt8186-ipesys";
> > > +        reg = <0x1c000000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > 
> > There's little point in enumerating every possible compatible. 1
> > example 
> > is more than enough.
> > 
> > 
> 
> Ok, I will fix it in next patch.
> 
> > > diff --git
> > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > > sys-clock.yaml
> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > > sys-clock.yaml
> > > new file mode 100644
> > > index 000000000000..11473971a165
> > > --- /dev/null
> > > +++
> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > > sys-clock.yaml
> > > @@ -0,0 +1,74 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "
> > > 
https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-sys-clock.yaml*__;Iw!!CTRNKA9wMg0ARbw!3pIyNVU0grMb7zKVQZoRO2z-eKrg6FnGcieEON8cCw84G6_W7Tt4GEFwytcYERailYtq$
> > >  "
> > > +$schema: "
> > > 
https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!3pIyNVU0grMb7zKVQZoRO2z-eKrg6FnGcieEON8cCw84G6_W7Tt4GEFwytcYEUOCCW1i$
> > >  "
> > > +
> > > +title: Mediatek System Clock Controller for MT8186
> > > +
> > > +maintainers:
> > > +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > > +
> > > +description:
> > > +  The clock architecture in Mediatek like below
> > > +  PLLs -->
> > > +          dividers -->
> > > +                      muxes
> > > +                           -->
> > > +                              clock gate
> > > +
> > > +  The apmixedsys provides most of PLLs which generated from SoC
> > > 26m.
> > > +  The topckgen provides dividers and muxes which provide the
> > > clock
> > > source to other IP blocks.
> > > +  The infracfg_ao provides clock gate in peripheral and
> > > infrastructure IP blocks.
> > > +  The mcusys provides mux control to select the clock source in
> > > AP
> > > MCU.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - mediatek,mt8186-mcusys
> > > +          - mediatek,mt8186-topckgen
> > > +          - mediatek,mt8186-infracfg_ao
> > > +          - mediatek,mt8186-apmixedsys
> > > +      - const: syscon
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  '#clock-cells':
> > > +    const: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    mcusys: syscon@c53a000 {
> > 
> > clock-controller@...
> > 
> > Drop unused labels.
> > 
> 
> Ok, I will change to pure clock-controller
> 
> Thanks!
> Best Regards,
> Chun-Jie
> 

Please skip the reply above.

The devices in this binding document also support system configuration
not only pure clock provider, so make them as "syscon".

Thanks!
Best Regards,
Chun-Jie

> > > +        compatible = "mediatek,mt8186-mcusys", "syscon";
> > > +        reg = <0xc53a000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    topckgen: syscon@10000000 {
> > > +        compatible = "mediatek,mt8186-topckgen", "syscon";
> > > +        reg = <0x10000000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    infracfg_ao: syscon@10001000 {
> > > +        compatible = "mediatek,mt8186-infracfg_ao", "syscon";
> > > +        reg = <0x10001000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > > +
> > > +  - |
> > > +    apmixedsys: syscon@1000c000 {
> > > +        compatible = "mediatek,mt8186-apmixedsys", "syscon";
> > > +        reg = <0x1000c000 0x1000>;
> > > +        #clock-cells = <1>;
> > > +    };
> > 
> > Again, 1 example is enough.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
