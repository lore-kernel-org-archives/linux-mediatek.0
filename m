Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228F2C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 20:15:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE45A23976
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 20:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE45A23976
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UZW3kGmofZAJffJiQdJCMMn6zGM3+oRlsOIIyKkiu4M=; b=nCMW3P1c16o0hdrdkO/5gSVD2
	Wq8BetCQmg8zfvBhdrFluraeFm88mtLInQOvco0QKYPpznBx9BUlWMPL26enJGmCzIWOX+trmYk2d
	25xqK8ZH5B2UlCBibxgbmEBk3YSDfkkN1ch5SYK0RuxHwTQd9bNWgAtN9/zwShQ270zlfJP2shcZO
	2TEcXJNiUYmh8wLAn8xwKrqZ5cCld/mV3a/6DHckW286bf8SHnH1FlF614Cbg65gMVSAb4irZ/i+I
	wZGwbn8XIDaLfKt/CFGn9idYyzGOYYGOunqx+tS2TdR1gpQn2JQPuEXJN1nGHntVNtIVKnRd7Z6WO
	nGHCYhjTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0915-00048I-NG; Thu, 14 Jan 2021 20:14:47 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0912-00047L-Al; Thu, 14 Jan 2021 20:14:45 +0000
Received: by mail-ot1-f50.google.com with SMTP id j20so6391843otq.5;
 Thu, 14 Jan 2021 12:14:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mhouMjNkCaF9CWhf0l9RnVYSQE5T0c+RJ3SWWCrRIT8=;
 b=kOtyM5qBpAGoyvhNqYiJAL3ct1fpLPWbi2Z0KOXDPe6kfxYnru/xLV3h7pOrfAGKxO
 MbxhjBYdprhLiDHXjWeqbaulb61NVIQV4niIyCQAiGbdbuZkOTx4zPO1SAdb3jmEzWYp
 4RD5eu2E2gQKbmZo4fKoOrFE+P02ExbSecuq3RBFS4Ex4udFIkfh+LV68dPnNf5dq8Vr
 OrwV3iGX0Hrb6BaFqf9Oa1baGFkUj/ToDX+FyCJ3uxOhrFTF6vpfxwwvDK6dNaaMQ1XP
 TQJX+l5ZCg37YNJoSWywCmHRNG2OZAOyxTvWvwJl3hsIKhDxb4hp4GopkPCbYTKi1mHH
 FiUg==
X-Gm-Message-State: AOAM5327zJQxQ/JxwTU41tHMQWGeQpPWZURZPO0l5I/Y2sRe0OY8akeb
 mXb/C3xAYzcyp9z7PcfeJf284Kb3Fw==
X-Google-Smtp-Source: ABdhPJzq6mF+Q3lGzEPm5wH++9BNibn6XXQls/kyl3A1COzRB3pAeuey66JxeInPzKqltEFrCUXK8w==
X-Received: by 2002:a9d:2021:: with SMTP id n30mr5850280ota.350.1610655283208; 
 Thu, 14 Jan 2021 12:14:43 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v17sm1260325ott.7.2021.01.14.12.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 12:14:42 -0800 (PST)
Received: (nullmailer pid 3515403 invoked by uid 1000);
 Thu, 14 Jan 2021 20:14:41 -0000
Date: Thu, 14 Jan 2021 14:14:41 -0600
From: Rob Herring <robh@kernel.org>
To: Nick Fan <Nick.Fan@mediatek.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: Add DT schema for Arm Mali Valhall GPU
Message-ID: <20210114201441.GA3509434@robh.at.kernel.org>
References: <20210112064933.12951-1-Nick.Fan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112064933.12951-1-Nick.Fan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_151444_420064_28D0C3EA 
X-CRM114-Status: GOOD (  19.71  )
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

On Tue, Jan 12, 2021 at 02:49:32PM +0800, Nick Fan wrote:
> Add devicetree schema for Arm Mali Valhall GPU
> 
> Define a compatible string for the Mali Valhall GPU
> for Mediatek's SoC platform.
> 
> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
> ---
>  .../bindings/gpu/arm,mali-valhall.yaml        | 252 ++++++++++++++++++
>  1 file changed, 252 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> new file mode 100644
> index 000000000000..ecf249a58435
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> @@ -0,0 +1,252 @@
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
> +        sram-supply: true
> +        power-domains:
> +          description:
> +            List of phandle and PM domain specifier as documented in
> +            Documentation/devicetree/bindings/power/power_domain.txt
> +          minItems: 5
> +          maxItems: 5
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
> +    };
> +
> +    gpu_opp_table: opp_table0 {

Make this a child node of the gpu node.

> +      compatible = "operating-points-v2";
> +      opp-shared;
> +
> +      opp-358000000 {
> +              opp-hz = /bits/ 64 <358000000>;
> +              opp-hz-real = /bits/ 64 <358000000>,
> +                            /bits/ 64 <358000000>;

This is not part of the OPP binding. It's not clear what it's purpose 
would be given the values are always the same as opp-hz.


> +              opp-microvolt = <606250>,
> +                              <750000>;
> +      };
> +
> +      opp-399000000 {
> +              opp-hz = /bits/ 64 <399000000>;
> +              opp-hz-real = /bits/ 64 <399000000>,
> +                            /bits/ 64 <399000000>;
> +              opp-microvolt = <618750>,
> +                              <750000>;
> +      };
> +
> +      opp-440000000 {
> +              opp-hz = /bits/ 64 <440000000>;
> +              opp-hz-real = /bits/ 64 <440000000>,
> +                            /bits/ 64 <440000000>;
> +              opp-microvolt = <631250>,
> +                              <750000>;
> +      };
> +
> +      opp-482000000 {
> +              opp-hz = /bits/ 64 <482000000>;
> +              opp-hz-real = /bits/ 64 <482000000>,
> +                            /bits/ 64 <482000000>;
> +              opp-microvolt = <643750>,
> +                              <750000>;
> +      };
> +
> +      opp-523000000 {
> +              opp-hz = /bits/ 64 <523000000>;
> +              opp-hz-real = /bits/ 64 <523000000>,
> +                            /bits/ 64 <523000000>;
> +              opp-microvolt = <656250>,
> +                              <750000>;
> +      };
> +
> +      opp-564000000 {
> +              opp-hz = /bits/ 64 <564000000>;
> +              opp-hz-real = /bits/ 64 <564000000>,
> +                            /bits/ 64 <564000000>;
> +              opp-microvolt = <668750>,
> +                              <750000>;
> +      };
> +
> +      opp-605000000 {
> +              opp-hz = /bits/ 64 <605000000>;
> +              opp-hz-real = /bits/ 64 <605000000>,
> +                            /bits/ 64 <605000000>;
> +              opp-microvolt = <681250>,
> +                              <750000>;
> +      };
> +
> +      opp-647000000 {
> +              opp-hz = /bits/ 64 <647000000>;
> +              opp-hz-real = /bits/ 64 <647000000>,
> +                            /bits/ 64 <647000000>;
> +              opp-microvolt = <693750>,
> +                              <750000>;
> +      };
> +
> +      opp-688000000 {
> +              opp-hz = /bits/ 64 <688000000>;
> +              opp-hz-real = /bits/ 64 <688000000>,
> +                            /bits/ 64 <688000000>;
> +              opp-microvolt = <706250>,
> +                              <750000>;
> +      };
> +
> +      opp-724000000 {
> +              opp-hz = /bits/ 64 <724000000>;
> +              opp-hz-real = /bits/ 64 <724000000>,
> +                            /bits/ 64 <724000000>;
> +              opp-microvolt = <725000>,
> +                              <750000>;
> +      };
> +
> +      opp-760000000 {
> +              opp-hz = /bits/ 64 <760000000>;
> +              opp-hz-real = /bits/ 64 <760000000>,
> +                            /bits/ 64 <760000000>;
> +              opp-microvolt = <743750>,
> +                              <750000>;
> +      };
> +
> +      opp-795000000 {
> +              opp-hz = /bits/ 64 <795000000>;
> +              opp-hz-real = /bits/ 64 <795000000>,
> +                            /bits/ 64 <795000000>;
> +              opp-microvolt = <762500>,
> +                              <762500>;
> +      };
> +
> +      opp-831000000 {
> +              opp-hz = /bits/ 64 <831000000>;
> +              opp-hz-real = /bits/ 64 <831000000>,
> +                            /bits/ 64 <831000000>;
> +              opp-microvolt = <781250>,
> +                              <781250>;
> +      };
> +
> +      opp-855000000 {
> +              opp-hz = /bits/ 64 <855000000>;
> +              opp-hz-real = /bits/ 64 <855000000>,
> +                            /bits/ 64 <855000000>;
> +              opp-microvolt = <793750>,
> +                              <793750>;
> +      };
> +
> +      opp-902000000 {
> +              opp-hz = /bits/ 64 <902000000>;
> +              opp-hz-real = /bits/ 64 <902000000>,
> +                            /bits/ 64 <902000000>;
> +              opp-microvolt = <818750>,
> +                              <818750>;
> +      };
> +
> +      opp-950000000 {
> +              opp-hz = /bits/ 64 <950000000>;
> +              opp-hz-real = /bits/ 64 <950000000>,
> +                            /bits/ 64 <950000000>;
> +              opp-microvolt = <843750>,
> +                              <843750>;
> +      };
> +    };
> +...
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
