Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11204C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 22:04:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEFD564F92
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 22:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEFD564F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5XPtGz1ta2M8j2wfopL06rTGNmD9aAKAm+HyAbN9PE4=; b=ueE6kleEX2Cak920Rp8MtWnxg
	+8r6lEQ1shYLScJsb/RLag0UYp2jpPdJBq5JZED6KUINoct7WLJW2TJg8RiuFTJLGhrO0pbygYS/3
	Acw3rV7oeLXmv6btU1kFOLpSuLh3XVp7fpBXLm7M2oxv9vN1h+b/MZ/t32AjqTWQj/yEyJ9AVJPmo
	DH52Me/nNgf/Nlm6qY+1Jqr3qb6RMpiHLr6OsVmz5CSGypuH9wJH8Rr+Z2rPvGsrMGpSscODj0oyx
	rfQv+vOEIzx6KMSQmSJv76KjYBqnfjHLlVsDA6ZmKkSWTuInJmQEbFLO+RI7NR7iu6d3tf95t/V/m
	BGEzCvuww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l89Cz-00032V-Ro; Fri, 05 Feb 2021 22:04:09 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l89Cx-000326-Sl; Fri, 05 Feb 2021 22:04:09 +0000
Received: by mail-ot1-f53.google.com with SMTP id k10so6014167otl.2;
 Fri, 05 Feb 2021 14:04:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h67k2LCgLLyuT0KAHJEqShKOh80gdx1RxrPR6qsQQUs=;
 b=TGlm8SQHbCK5KvXIkWIO8s7iupqW9yCnL0E4xvvrVEBkqJ2uC18RNZ9NUmhC1mzmIV
 JwrjSO3I72BVbD9SknLLWFs6G5ymWxVpuVzAhe7rk8nERabMUHQS0mY1K/D7g2IUpxNf
 KlMOd6CUmm5J/GVj9m4Lx10gNliUzd/ScvflXL/hQD1BQN46giTE5no+feuiw6QWBxmc
 i69d6WoiycPjEqM1uRJ9/es6EM7KYxgUbbNpD+x/AK9i0DjaU147jgCxxrsVxfH3EFul
 DEdRS3ohWMxtZ1/qfFTYKH+4xNJXkGdAoeofnQGGylbj0M1HBoqxeespk1x9hNdEyzuL
 rMaQ==
X-Gm-Message-State: AOAM533cyWHTJDzuhhqYgpKa6gBSXHbvPIFpgO4WlQNFN9HdQBwLocyX
 ogCCESU7zdPnY7BXfgehMA==
X-Google-Smtp-Source: ABdhPJzNt1N5iC6rEdfBFptrxE+q7qbqWAfZnrcFhVtG/g2E/+rv2wMIB1fKhaOhfYwbEOCXVRwbsg==
X-Received: by 2002:a9d:3462:: with SMTP id v89mr4755037otb.51.1612562646149; 
 Fri, 05 Feb 2021 14:04:06 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 62sm468431oii.23.2021.02.05.14.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:04:04 -0800 (PST)
Received: (nullmailer pid 3832610 invoked by uid 1000);
 Fri, 05 Feb 2021 22:04:02 -0000
Date: Fri, 5 Feb 2021 16:04:02 -0600
From: Rob Herring <robh@kernel.org>
To: Nick Fan <Nick.Fan@mediatek.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: Add DT schema for Arm Mali Valhall GPU
Message-ID: <20210205220402.GA3824042@robh.at.kernel.org>
References: <20210128022342.6445-1-Nick.Fan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128022342.6445-1-Nick.Fan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_170408_050499_1E653E07 
X-CRM114-Status: GOOD (  20.02  )
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

On Thu, Jan 28, 2021 at 10:23:41AM +0800, Nick Fan wrote:
> Add devicetree schema for Arm Mali Valhall GPU
> 
> Define a compatible string for the Mali Valhall GPU
> for Mediatek's SoC platform.
> 
> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
> ---
>  .../bindings/gpu/arm,mali-valhall.yaml        | 217 ++++++++++++++++++
>  1 file changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> new file mode 100644
> index 000000000000..275c14ad173a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> @@ -0,0 +1,217 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/arm,mali-valhall.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali Valhall GPU
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'
> +
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8192-mali
> +      - const: arm,mali-valhall
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: GPU interrupt
> +      - description: MMU interrupt
> +      - description: Job interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: gpu
> +      - const: mmu
> +      - const: job

Please use the same order as midgard and bifrost.

> +
> +  clocks:
> +    minItems: 1
> +
> +  power-domains:
> +    minItems: 1
> +    maxItems: 5
> +
> +  mali-supply: true
> +  sram-supply: true
> +
> +  operating-points-v2: true
> +  opp_table: true

opp-table

> +
> +  "#cooling-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8192-mali
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 5
> +          maxItems: 5
> +
> +        power-domain-names:
> +          items:
> +            - const: core0
> +            - const: core1
> +            - const: core2
> +            - const: core3
> +            - const: core4
> +
> +      required:
> +        - sram-supply
> +        - power-domains
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpu@13000000 {
> +           compatible = "mediatek,mt8192-mali", "arm,mali-valhall";

Do 4 space indent.

> +           reg = <0x13000000 0x4000>;
> +           interrupts =
> +                   <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>;
> +           interrupt-names =
> +                   "gpu",
> +                   "mmu",
> +                   "job";
> +
> +           clocks = <&mfgcfg 0>;
> +
> +           power-domains =
> +                   <&spm 4>,
> +                   <&spm 5>,
> +                   <&spm 6>,
> +                   <&spm 7>,
> +                   <&spm 8>;
> +
> +           operating-points-v2 = <&gpu_opp_table>;
> +           mali-supply = <&mt6315_7_vbuck1>;
> +           sram-supply = <&mt6359_vsram_others_ldo_reg>;
> +           gpu_opp_table: opp_table {
> +             compatible = "operating-points-v2";

And then the same here.

> +             opp-shared;
> +
> +             opp-358000000 {
> +                   opp-hz = /bits/ 64 <358000000>;
> +                   opp-microvolt = <606250>,
> +                                   <750000>;

Isn't this supposed to be either a single value or <min max nominal>?

> +             };
> +
> +             opp-399000000 {
> +                   opp-hz = /bits/ 64 <399000000>;
> +                   opp-microvolt = <618750>,
> +                                   <750000>;
> +             };
> +
> +             opp-440000000 {
> +                   opp-hz = /bits/ 64 <440000000>;
> +                   opp-microvolt = <631250>,
> +                                   <750000>;
> +             };
> +
> +             opp-482000000 {
> +                   opp-hz = /bits/ 64 <482000000>;
> +                   opp-microvolt = <643750>,
> +                                   <750000>;
> +             };
> +
> +             opp-523000000 {
> +                   opp-hz = /bits/ 64 <523000000>;
> +                   opp-microvolt = <656250>,
> +                                   <750000>;
> +             };
> +
> +             opp-564000000 {
> +                   opp-hz = /bits/ 64 <564000000>;
> +                   opp-microvolt = <668750>,
> +                                   <750000>;
> +             };
> +
> +             opp-605000000 {
> +                   opp-hz = /bits/ 64 <605000000>;
> +                   opp-microvolt = <681250>,
> +                                   <750000>;
> +             };
> +
> +             opp-647000000 {
> +                   opp-hz = /bits/ 64 <647000000>;
> +                   opp-microvolt = <693750>,
> +                                   <750000>;
> +             };
> +
> +             opp-688000000 {
> +                   opp-hz = /bits/ 64 <688000000>;
> +                   opp-microvolt = <706250>,
> +                                   <750000>;
> +             };
> +
> +             opp-724000000 {
> +                   opp-hz = /bits/ 64 <724000000>;
> +                   opp-microvolt = <725000>,
> +                                   <750000>;
> +             };
> +
> +             opp-760000000 {
> +                   opp-hz = /bits/ 64 <760000000>;
> +                   opp-microvolt = <743750>,
> +                                   <750000>;
> +             };
> +
> +             opp-795000000 {
> +                   opp-hz = /bits/ 64 <795000000>;
> +                   opp-microvolt = <762500>,
> +                                   <762500>;
> +             };
> +
> +             opp-831000000 {
> +                   opp-hz = /bits/ 64 <831000000>;
> +                   opp-microvolt = <781250>,
> +                                   <781250>;
> +             };
> +
> +             opp-855000000 {
> +                   opp-hz = /bits/ 64 <855000000>;
> +                   opp-microvolt = <793750>,
> +                                   <793750>;
> +             };
> +
> +             opp-902000000 {
> +                   opp-hz = /bits/ 64 <902000000>;
> +                   opp-microvolt = <818750>,
> +                                   <818750>;
> +             };
> +
> +             opp-950000000 {
> +                   opp-hz = /bits/ 64 <950000000>;
> +                   opp-microvolt = <843750>,
> +                                   <843750>;
> +             };
> +          };
> +    };
> +...
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
