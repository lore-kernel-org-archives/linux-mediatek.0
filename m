Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09547C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 15:25:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B65F60FDA
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 15:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B65F60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LRe4AKaI0jqPXkGoPbI29VDRX9dsJbtVomJJFipG1lk=; b=WpY2833MZCJb4PIwYeoEAudD+
	CprpUXQkoWapKmiYlq4u7E4+F8e2dUJNkGoGQz+n7D4x8/KJART9SuvuteK+6U/NYQh7OyhcfKJTj
	3f/fbrfocfDtBJ/3tm3I4LwFLY3cnIrluBOO1KHJWLkIRznMCygj1KfII4+3f/MCs2xU96FpHx2Fh
	u8CSKEo+VL5eyKJ3qTn3hDUKk1PeYM7+q4OXlBYnnZKKyPYYasrw0ux9+hf1qwf1CqVRIRtahuys5
	VhqrYLj+u7UgAOR2AkD496Y9CduccElhwhmNf5U0KEk7rCecmGA2EMNsp6qpoBiTAkF8zmgHHTX0Q
	VOVaPGhlA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX3s1-00Gblq-R3; Thu, 15 Apr 2021 15:25:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX3rj-00GbgW-GX; Thu, 15 Apr 2021 15:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WqLtDa2Y+Z0BtnNMwL32ANtrJ2QU3EanfS3R24oxCVk=; b=Yb1hgP0EWuGHUVO7gRF/sczc/f
 8xd/KBlJrSeUUYU5X0aZPwYnOB6B4VjxqBmEf8JyIjj27548wpvf0Uae5t5XGL6bCTERsnYDUYvwK
 u1KM82pxwBOkXlsshroDOiwtIbFZoCMbW3dormowhceNHhx6OcrO/aQLrA7C/Z7wzrrX9sUFsOY0A
 2oRO6aj1p9Nj5xxFwex2XziOruxvHGp4D2Uvl9mXk/2lt7x9X56dde1H0SpDfSvkb5tiDyTXT03x2
 wUHaItgig7/iJ8t5ye3+WDFYC0PXjZxR96DvEW6inaeCn4zUslDYsJ+INEUzsXQamNioqcHFaUli5
 AV8hKPuw==;
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX3rf-008hpY-Jo; Thu, 15 Apr 2021 15:25:09 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 c6-20020a4aacc60000b02901e6260b12e2so2959863oon.3; 
 Thu, 15 Apr 2021 08:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WqLtDa2Y+Z0BtnNMwL32ANtrJ2QU3EanfS3R24oxCVk=;
 b=dIU3y7fqhJt/JeV5n/cMDMAT9xONKPjFH5zNzgeNcuLHrPKBFzncbT8NgunzQFdqXu
 42mz5jDV/9YtU5cUJXUSMikkA+g6T7Epav/RiLztHBihuXQJrit0d1YDxA1rnwj4s1/u
 WYa8Xh7t64WPm0BQWlnNAz9XczpSWk7sBWATefEx4Wij586YeaJulD+Vc0B5ig/UpjJu
 187V390pLP8SnGZ4/dSOKW493OnUjkJhqJnrzYiRGQOjxtKNbBamud//PLPi/PbGoTnt
 LBbxs1oLLlvAwOS7HYpCytcFfnK5dd0NMpDP50TpXSXYRd24RfWU8zyDfzAl8j+kayCY
 6Wvw==
X-Gm-Message-State: AOAM532Je+JfzQXW2pGbN7htwvTYLQC/Tv3PgM3gT453ClbaEjdCkFU3
 cXgKCmfIcPRnZkR6suPLBA==
X-Google-Smtp-Source: ABdhPJxCoyKRyGYHhBgzkRX/+OPVCS+l9Tx1bKIAWsB0NIPEPcPYA5s0210m+OawWB6cF2WOrkVoAw==
X-Received: by 2002:a4a:9c46:: with SMTP id c6mr2131118ook.31.1618500303771;
 Thu, 15 Apr 2021 08:25:03 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y13sm726979oti.79.2021.04.15.08.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 08:25:02 -0700 (PDT)
Received: (nullmailer pid 1431769 invoked by uid 1000);
 Thu, 15 Apr 2021 15:25:00 -0000
Date: Thu, 15 Apr 2021 10:25:00 -0500
From: Rob Herring <robh@kernel.org>
To: Flora Fu <flora.fu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pi-Cheng Chen <pi-cheng.chen@mediatek.com>,
 Chiawen Lee <chiawen.lee@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 srv_heupstream@mediatek.com
Subject: Re: [PATCH v2 4/7] dt-bindings: soc: mediatek: apusys: Add new
 document for APU power domain
Message-ID: <20210415152500.GA1424680@robh.at.kernel.org>
References: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
 <1618465960-3013-5-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1618465960-3013-5-git-send-email-flora.fu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_082507_680319_440CC8DE 
X-CRM114-Status: GOOD (  22.55  )
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

On Thu, Apr 15, 2021 at 01:52:37PM +0800, Flora Fu wrote:
> Document the bindings for APU power domain on MediaTek SoC.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
> Note:
> This patch depends on MT8192 clock[1] patches which haven't yet been accepted.
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210324104110.13383-7-chun-jie.chen@mediatek.com/
> ---
>  .../soc/mediatek/mediatek,apu-pm.yaml         | 145 ++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
> new file mode 100644
> index 000000000000..6ff966920917
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,apu-pm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek APU Power Domains
> +
> +maintainers:
> +  - Flora Fu <flora.fu@mediatek.com>
> +
> +description: |
> +  Mediatek AI Process Unit (APU) include support for power domains which can be
> +  powered up/down by software.
> +  APU subsys belonging to a power domain should contain a 'power-domains'
> +  property that is a phandle for apuspm node representing the domain.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8192-apu-pm
> +      - const: syscon
> +
> +  reg:
> +    description: Address range of the APU power domain controller.
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  vsram-supply:
> +    description: apu sram regulator supply.
> +
> +  mediatek,scpsys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      phandle to the device containing the scpsys register range.
> +
> +  mediatek,apu-conn:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      phandle to the device containing the scpsys apu conn register range.
> +
> +  mediatek,apu-conn1:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      phandle to the device containing the scpsys apu conn1 register range.
> +
> +  mediatek,apu-vcore:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      phandle to the device containing the scpsys apu vcore register range.
> +
> +patternProperties:
> +  "^power-domain@[0-9a-f]+$":
> +    type: object
> +    description: |
> +      Represents the power domains within the power controller node as
> +      documented in Documentation/devicetree/bindings/power/power-domain.yaml.
> +
> +    properties:
> +      reg:
> +        description: |
> +          Power domain index. Valid values are defined in:
> +          "include/dt-bindings/power/mt8182-apu-power.h"
> +        maxItems: 1
> +
> +      '#power-domain-cells':
> +        description: |
> +          Must be 0 for nodes representing a single PM domain and 1 for nodes
> +          providing multiple PM.
> +
> +      clocks:
> +        description: |
> +          List of phandles of clocks list. Specify by order according to
> +          power-up sequence.
> +
> +      clock-names:
> +        description: |
> +          List of names of clocks. Specify by order according to power-up
> +          sequence.
> +
> +      assigned-clocks:
> +        maxItems: 2
> +
> +      assigned-clock-parents:
> +        maxItems: 2
> +
> +      domain-supply:
> +        description: domain regulator supply.
> +
> +    required:
> +      - reg
> +      - '#power-domain-cells'
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#power-domain-cells'
> +  - vsram-supply
> +  - mediatek,scpsys
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +    apuspm: power-domain@190f0000 {
> +        compatible = "mediatek,mt8192-apu-pm", "syscon";
> +        reg = <0x190f0000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #power-domain-cells = <1>;

So you have domains provided by this node and then...

> +        vsram-supply = <&mt6359_vsram_md_ldo_reg>;
> +        mediatek,scpsys = <&scpsys>;
> +        mediatek,apu-conn = <&apu_conn>;
> +        mediatek,apu-vcore = <&apu_vcore>;
> +
> +        apu_top: power-domain@0 {
> +            reg = <0>;
> +            #power-domain-cells = <0>;

...each child node provides a domain. What's the difference?

> +            clocks = <&topckgen CLK_TOP_DSP_SEL>,
> +                     <&topckgen CLK_TOP_IPU_IF_SEL>,
> +                     <&clk26m>,
> +                     <&topckgen CLK_TOP_UNIVPLL_D6_D2>;
> +            clock-names = "clk_top_conn",
> +                          "clk_top_ipu_if",
> +                          "clk_off",
> +                          "clk_on_default";
> +            assigned-clocks = <&topckgen CLK_TOP_DSP_SEL>,
> +                              <&topckgen CLK_TOP_IPU_IF_SEL>;
> +            assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
> +                                     <&topckgen CLK_TOP_UNIVPLL_D6_D2>;
> +            domain-supply = <&mt6359_vproc1_buck_reg>;
> +        };
> +    };
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
