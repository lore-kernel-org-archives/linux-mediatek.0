Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7B6C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 02:44:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E68E64DCE
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 02:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E68E64DCE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9CKb0Gwdh2IEjzfSCJEx0mQre+VOjDK6kkCpa7HwoFs=; b=CtwRsd+WUM3PDR0jE40VEobuy
	8HT2jHxtk0kJkPF+KCbGdDGfoHbgv0ZWaNqixeYuz6E/1lneUJBDr2GtbmeHpv/f9HwdTPRd9n7tA
	JEEF55s4zFby+swmy41jcJyK3CGhjRU6upM7XflA0zWS+UEy3/fUEZlLnTp9F64KRH3ZmQYGZGAL3
	1rP56p7pon6lb+zPzb5VNfo3/ZszBgiQhp3XSEx/2QWw6TFMoQ7F+vlAMCGx6F7Lb5WophJGdAPnf
	5sgX6AGchlmP+0L/ImWwmytCzZtDftMNjwUPZCNwSL4W7f6OdkDiATD8g/j6RLAkPAS2Hws7J2VaS
	bkptXsSvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4xII-0003MW-Jy; Thu, 28 Jan 2021 02:44:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4xIF-0003M6-1S; Thu, 28 Jan 2021 02:44:24 +0000
X-UUID: a5b7128da6a447ad95dbbbf22ecf5141-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Hrx/nCYJR5WH3Pl6k+3Q+wORPFTkAO5RTq4P99NgrxA=; 
 b=lbvhmfrrFtQKFmlept3aAnauUE4S4gw7dCapQBDBkvUU6dl95Ki/2T2oUvCC+YA2q8TrTRkjSEV3qSHLO1EtK8jQq8qJ3w6kiYiTW1iBQlxv0DWYpZ/P5d5Iwv0hRD+Lh9JeJOWXuQeq3LZiHF/+2jgXoFeE4IBbdULCsAO2w/I=;
X-UUID: a5b7128da6a447ad95dbbbf22ecf5141-20210127
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <nick.fan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1293957535; Wed, 27 Jan 2021 18:44:18 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 18:44:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 10:44:15 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 10:44:15 +0800
Message-ID: <1611801855.30880.2.camel@mtksdaap41>
Subject: Re: [PATCH v4 1/2] dt-bindings: Add DT schema for Arm Mali Valhall GPU
From: Nick Fan <nick.fan@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 28 Jan 2021 10:44:15 +0800
In-Reply-To: <20210114201441.GA3509434@robh.at.kernel.org>
References: <20210112064933.12951-1-Nick.Fan@mediatek.com>
 <20210114201441.GA3509434@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_214423_381336_5E771B1F 
X-CRM114-Status: GOOD (  22.51  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Thanks for your review.
These are fixed in v5 as following link.
https://lore.kernel.org/patchwork/patch/1372271/

Nick Fan

On Thu, 2021-01-14 at 14:14 -0600, Rob Herring wrote:
> On Tue, Jan 12, 2021 at 02:49:32PM +0800, Nick Fan wrote:
> > Add devicetree schema for Arm Mali Valhall GPU
> > 
> > Define a compatible string for the Mali Valhall GPU
> > for Mediatek's SoC platform.
> > 
> > Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
> > ---
> >  .../bindings/gpu/arm,mali-valhall.yaml        | 252 ++++++++++++++++++
> >  1 file changed, 252 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> > new file mode 100644
> > index 000000000000..ecf249a58435
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> > @@ -0,0 +1,252 @@
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
> > +        sram-supply: true
> > +        power-domains:
> > +          description:
> > +            List of phandle and PM domain specifier as documented in
> > +            Documentation/devicetree/bindings/power/power_domain.txt
> > +          minItems: 5
> > +          maxItems: 5
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
> > +           compatible = "mediatek,mt8192-mali", "arm,mali-valhall";
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
> > +    };
> > +
> > +    gpu_opp_table: opp_table0 {
> 
> Make this a child node of the gpu node.
> 
> > +      compatible = "operating-points-v2";
> > +      opp-shared;
> > +
> > +      opp-358000000 {
> > +              opp-hz = /bits/ 64 <358000000>;
> > +              opp-hz-real = /bits/ 64 <358000000>,
> > +                            /bits/ 64 <358000000>;
> 
> This is not part of the OPP binding. It's not clear what it's purpose 
> would be given the values are always the same as opp-hz.
> 
> 
> > +              opp-microvolt = <606250>,
> > +                              <750000>;
> > +      };
> > +
> > +      opp-399000000 {
> > +              opp-hz = /bits/ 64 <399000000>;
> > +              opp-hz-real = /bits/ 64 <399000000>,
> > +                            /bits/ 64 <399000000>;
> > +              opp-microvolt = <618750>,
> > +                              <750000>;
> > +      };
> > +
> > +      opp-440000000 {
> > +              opp-hz = /bits/ 64 <440000000>;
> > +              opp-hz-real = /bits/ 64 <440000000>,
> > +                            /bits/ 64 <440000000>;
> > +              opp-microvolt = <631250>,
> > +                              <750000>;
> > +      };
> > +
> > +      opp-482000000 {
> > +              opp-hz = /bits/ 64 <482000000>;
> > +              opp-hz-real = /bits/ 64 <482000000>,
> > +                            /bits/ 64 <482000000>;
> > +              opp-microvolt = <643750>,
> > +                              <750000>;
> > +      };
> > +
> > +      opp-523000000 {
> > +              opp-hz = /bits/ 64 <523000000>;
> > +              opp-hz-real = /bits/ 64 <523000000>,
> > +                            /bits/ 64 <523000000>;
> > +              opp-microvolt = <656250>,
> > +                              <750000>;
> > +      };
> > +
> > +      opp-564000000 {
> > +              opp-hz = /bits/ 64 <564000000>;
> > +              opp-hz-real = /bits/ 64 <564000000>,
> > +                            /bits/ 64 <564000000>;
> > +              opp-microvolt = <668750>,
> > +                              <750000>;
> > +      };
> > +
> > +      opp-605000000 {
> > +              opp-hz = /bits/ 64 <605000000>;
> > +              opp-hz-real = /bits/ 64 <605000000>,
> > +                            /bits/ 64 <605000000>;
> > +              opp-microvolt = <681250>,
> > +                              <750000>;
> > +      };
> > +
> > +      opp-647000000 {
> > +              opp-hz = /bits/ 64 <647000000>;
> > +              opp-hz-real = /bits/ 64 <647000000>,
> > +                            /bits/ 64 <647000000>;
> > +              opp-microvolt = <693750>,
> > +                              <750000>;
> > +      };
> > +
> > +      opp-688000000 {
> > +              opp-hz = /bits/ 64 <688000000>;
> > +              opp-hz-real = /bits/ 64 <688000000>,
> > +                            /bits/ 64 <688000000>;
> > +              opp-microvolt = <706250>,
> > +                              <750000>;
> > +      };
> > +
> > +      opp-724000000 {
> > +              opp-hz = /bits/ 64 <724000000>;
> > +              opp-hz-real = /bits/ 64 <724000000>,
> > +                            /bits/ 64 <724000000>;
> > +              opp-microvolt = <725000>,
> > +                              <750000>;
> > +      };
> > +
> > +      opp-760000000 {
> > +              opp-hz = /bits/ 64 <760000000>;
> > +              opp-hz-real = /bits/ 64 <760000000>,
> > +                            /bits/ 64 <760000000>;
> > +              opp-microvolt = <743750>,
> > +                              <750000>;
> > +      };
> > +
> > +      opp-795000000 {
> > +              opp-hz = /bits/ 64 <795000000>;
> > +              opp-hz-real = /bits/ 64 <795000000>,
> > +                            /bits/ 64 <795000000>;
> > +              opp-microvolt = <762500>,
> > +                              <762500>;
> > +      };
> > +
> > +      opp-831000000 {
> > +              opp-hz = /bits/ 64 <831000000>;
> > +              opp-hz-real = /bits/ 64 <831000000>,
> > +                            /bits/ 64 <831000000>;
> > +              opp-microvolt = <781250>,
> > +                              <781250>;
> > +      };
> > +
> > +      opp-855000000 {
> > +              opp-hz = /bits/ 64 <855000000>;
> > +              opp-hz-real = /bits/ 64 <855000000>,
> > +                            /bits/ 64 <855000000>;
> > +              opp-microvolt = <793750>,
> > +                              <793750>;
> > +      };
> > +
> > +      opp-902000000 {
> > +              opp-hz = /bits/ 64 <902000000>;
> > +              opp-hz-real = /bits/ 64 <902000000>,
> > +                            /bits/ 64 <902000000>;
> > +              opp-microvolt = <818750>,
> > +                              <818750>;
> > +      };
> > +
> > +      opp-950000000 {
> > +              opp-hz = /bits/ 64 <950000000>;
> > +              opp-hz-real = /bits/ 64 <950000000>,
> > +                            /bits/ 64 <950000000>;
> > +              opp-microvolt = <843750>,
> > +                              <843750>;
> > +      };
> > +    };
> > +...
> > -- 
> > 2.18.0
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
