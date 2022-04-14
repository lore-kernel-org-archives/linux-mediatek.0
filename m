Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48828C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 02:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/Vk7GcjkyYliq8zVln5vjz9+CXV4Aq2cGQ+lsmVedY=; b=BlmZCqJb63N4Qu
	YJxzLoR1IWhU315kgl/nm0hSC7+fkeN6CC5nqQTTJFWOJfQ/HKDvG1AgERfUlKwcZDVvJ62XF1HIH
	Gc6tJLkXjDRaE1vpYVbZ4/hmvcqXXWLRqtQSi7GSNcDj1CNRZHRRAZPyaliYMmO2afEkAEY+yu6Pn
	33J0zNPEDumHi56gBHKXTJ4v3f2XIFupFn90E7T3gkqaJDxuUMYGM9HsIO4CnsjEpSqzZwkNcGEwW
	hW5nttv68AHVYLWqf+Cl3G4eLbu3KzhonIzIeF3IEkJa5PtmeM/0bzGubrRGMc9A/fWQDU0AZeabI
	xmxkPMWDsPvyogKx3Hhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neosP-003Ohn-W3; Thu, 14 Apr 2022 02:06:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neosM-003Oh9-VQ; Thu, 14 Apr 2022 02:06:29 +0000
X-UUID: 95fc6b38a8a9463d9a89c6a33f56ec3d-20220413
X-UUID: 95fc6b38a8a9463d9a89c6a33f56ec3d-20220413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nick.fan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 849422442; Wed, 13 Apr 2022 19:06:21 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 19:06:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 14 Apr 2022 10:06:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Apr 2022 10:06:18 +0800
Message-ID: <a3ac398a3a0b815c5404af783ef62363664d15d0.camel@mediatek.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: Add DT schema for Arm Mali Valhall GPU
From: Nick Fan <nick.fan@mediatek.com>
To: Rob Herring <robh@kernel.org>, Nick Fan
 =?UTF-8?Q?=28=E8=8C=83=E5=93=B2=E7=B6=AD=29?= <Nick.Fan@mediatek.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Date: Thu, 14 Apr 2022 10:06:17 +0800
In-Reply-To: <20210205220402.GA3824042@robh.at.kernel.org>
References: <20210128022342.6445-1-Nick.Fan@mediatek.com>
 <20210205220402.GA3824042@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_190627_071684_2F1258BC 
X-CRM114-Status: GOOD (  23.25  )
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

On Sat, 2021-02-06 at 06:04 +0800, Rob Herring wrote:
> On Thu, Jan 28, 2021 at 10:23:41AM +0800, Nick Fan wrote:
> > Add devicetree schema for Arm Mali Valhall GPU
> > 
> > Define a compatible string for the Mali Valhall GPU
> > for Mediatek's SoC platform.
> > 
> > Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
> > ---
> >  .../bindings/gpu/arm,mali-valhall.yaml        | 217
> > ++++++++++++++++++
> >  1 file changed, 217 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-
> > valhall.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-
> > valhall.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-
> > valhall.yaml
> > new file mode 100644
> > index 000000000000..275c14ad173a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> > @@ -0,0 +1,217 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpu/arm,mali-valhall.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM Mali Valhall GPU
> > +
> > +maintainers:
> > +  - Rob Herring <robh@kernel.org>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^gpu@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8192-mali
> > +      - const: arm,mali-valhall
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: GPU interrupt
> > +      - description: MMU interrupt
> > +      - description: Job interrupt
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: gpu
> > +      - const: mmu
> > +      - const: job
> 
> Please use the same order as midgard and bifrost.
This will fix in the next version v6.
With the same order as midgard and bifrost.
> 
> > +
> > +  clocks:
> > +    minItems: 1
> > +
> > +  power-domains:
> > +    minItems: 1
> > +    maxItems: 5
> > +
> > +  mali-supply: true
> > +  sram-supply: true
> > +
> > +  operating-points-v2: true
> > +  opp_table: true
> 
> opp-table
This will fix in the next version v6.
> 
> > +
> > +  "#cooling-cells":
> > +    const: 2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8192-mali
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          minItems: 5
> > +          maxItems: 5
> > +
> > +        power-domain-names:
> > +          items:
> > +            - const: core0
> > +            - const: core1
> > +            - const: core2
> > +            - const: core3
> > +            - const: core4
> > +
> > +      required:
> > +        - sram-supply
> > +        - power-domains
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    gpu@13000000 {
> > +           compatible = "mediatek,mt8192-mali", "arm,mali-
> > valhall";
> 
> Do 4 space indent.
This will fix in the next version v6.
> 
> > +           reg = <0x13000000 0x4000>;
> > +           interrupts =
> > +                   <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
> > +                   <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
> > +                   <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>;
> > +           interrupt-names =
> > +                   "gpu",
> > +                   "mmu",
> > +                   "job";
> > +
> > +           clocks = <&mfgcfg 0>;
> > +
> > +           power-domains =
> > +                   <&spm 4>,
> > +                   <&spm 5>,
> > +                   <&spm 6>,
> > +                   <&spm 7>,
> > +                   <&spm 8>;
> > +
> > +           operating-points-v2 = <&gpu_opp_table>;
> > +           mali-supply = <&mt6315_7_vbuck1>;
> > +           sram-supply = <&mt6359_vsram_others_ldo_reg>;
> > +           gpu_opp_table: opp_table {
> > +             compatible = "operating-points-v2";
> 
> And then the same here.
This will fix in the next version v6.
> 
> > +             opp-shared;
> > +
> > +             opp-358000000 {
> > +                   opp-hz = /bits/ 64 <358000000>;
> > +                   opp-microvolt = <606250>,
> > +                                   <750000>;
> 
> Isn't this supposed to be either a single value or <min max nominal>?
I use single value.
It required two regulators for this platform.
So I separate them by angular brackets <>.
> 
> > +             };
> > +
> > +             opp-399000000 {
> > +                   opp-hz = /bits/ 64 <399000000>;
> > +                   opp-microvolt = <618750>,
> > +                                   <750000>;
> > +             };
> > +
> > +             opp-440000000 {
> > +                   opp-hz = /bits/ 64 <440000000>;
> > +                   opp-microvolt = <631250>,
> > +                                   <750000>;
> > +             };
> > +
> > +             opp-482000000 {
> > +                   opp-hz = /bits/ 64 <482000000>;
> > +                   opp-microvolt = <643750>,
> > +                                   <750000>;
> > +             };
> > +
> > +             opp-523000000 {
> > +                   opp-hz = /bits/ 64 <523000000>;
> > +                   opp-microvolt = <656250>,
> > +                                   <750000>;
> > +             };
> > +
> > +             opp-564000000 {
> > +                   opp-hz = /bits/ 64 <564000000>;
> > +                   opp-microvolt = <668750>,
> > +                                   <750000>;
> > +             };
> > +
> > +             opp-605000000 {
> > +                   opp-hz = /bits/ 64 <605000000>;
> > +                   opp-microvolt = <681250>,
> > +                                   <750000>;
> > +             };
> > +
> > +             opp-647000000 {
> > +                   opp-hz = /bits/ 64 <647000000>;
> > +                   opp-microvolt = <693750>,
> > +                                   <750000>;
> > +             };
> > +
> > +             opp-688000000 {
> > +                   opp-hz = /bits/ 64 <688000000>;
> > +                   opp-microvolt = <706250>,
> > +                                   <750000>;
> > +             };
> > +
> > +             opp-724000000 {
> > +                   opp-hz = /bits/ 64 <724000000>;
> > +                   opp-microvolt = <725000>,
> > +                                   <750000>;
> > +             };
> > +
> > +             opp-760000000 {
> > +                   opp-hz = /bits/ 64 <760000000>;
> > +                   opp-microvolt = <743750>,
> > +                                   <750000>;
> > +             };
> > +
> > +             opp-795000000 {
> > +                   opp-hz = /bits/ 64 <795000000>;
> > +                   opp-microvolt = <762500>,
> > +                                   <762500>;
> > +             };
> > +
> > +             opp-831000000 {
> > +                   opp-hz = /bits/ 64 <831000000>;
> > +                   opp-microvolt = <781250>,
> > +                                   <781250>;
> > +             };
> > +
> > +             opp-855000000 {
> > +                   opp-hz = /bits/ 64 <855000000>;
> > +                   opp-microvolt = <793750>,
> > +                                   <793750>;
> > +             };
> > +
> > +             opp-902000000 {
> > +                   opp-hz = /bits/ 64 <902000000>;
> > +                   opp-microvolt = <818750>,
> > +                                   <818750>;
> > +             };
> > +
> > +             opp-950000000 {
> > +                   opp-hz = /bits/ 64 <950000000>;
> > +                   opp-microvolt = <843750>,
> > +                                   <843750>;
> > +             };
> > +          };
> > +    };
> > +...
> > --
> > 2.18.0
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
