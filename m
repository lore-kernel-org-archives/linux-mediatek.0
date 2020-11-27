Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEADC63777
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 02:25:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF2C922202
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 02:25:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lw5akp79";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DCQVQX0T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF2C922202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lkE8Zta9vwl57ibIQVrZVSrDunMBS/Dr0h5WqYdrc9Q=; b=lw5akp79rrSvFMhmiXZUINfSG
	G1H7Ltn1oal36e3N/l5ADdwC2Di5f+HP56kbuZBvmGTatLF6tBJnFlV2SpUxZDrAaGvz25lAL9i3y
	gnefnjiy/9YVOcG5xJ0IEx3MBIzwxI8O/X1y41ehhICeBVmLi8HIxqwY/K+YLAqW+2PH2OZqdNM43
	6xai2BhOtUSxqfNyA4qDh4ir81oQ/P825mTebNn+CrRoLYgCn126HUR0QzxXssR4MBnvW2U36SlX/
	gfgQYvxZXAqad8tZeogbsBXCFPLfvRYVmw7Gb7y7J7LrdDaGpaXKXsxq6jGc+RNJy54U/oJqDFfAt
	xybQtOk/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiTRp-0000UJ-MT; Fri, 27 Nov 2020 02:25:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiTRl-0000PZ-8I; Fri, 27 Nov 2020 02:25:19 +0000
X-UUID: b8937735fd5c4c8abf2407b2cc365e30-20201126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YCQQOBhhCki8Z3+PNPFAYNOY5FT1zYL+6qrILKAKwbo=; 
 b=DCQVQX0TTWDhVrir4Qkbn/cFDlhWn1tH4AmBXaAzK0G+WyluuOOSfBGxscoLCoZOD4+tGu2knEtcJ3poV0tYvsGZgLdAQSR27nCKwNpl8mPyEbaDoQfLckvuluTvSa7NqnpviqaSgWY2HzYBCC+ZfwWBCC+g18hr+KN6gTztHQY=;
X-UUID: b8937735fd5c4c8abf2407b2cc365e30-20201126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2147025152; Thu, 26 Nov 2020 18:25:01 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Nov 2020 18:25:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Nov 2020 10:24:52 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Nov 2020 10:24:51 +0800
Message-ID: <1606443891.10511.3.camel@mtksdaap41>
Subject: Re: [PATCH v4 01/16] dt-bindings: power: Add bindings for the
 Mediatek SCPSYS power domains controller
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Matthias Brugger
 <mbrugger@suse.com>
Date: Fri, 27 Nov 2020 10:24:51 +0800
In-Reply-To: <20201030113622.201188-2-enric.balletbo@collabora.com>
References: <20201030113622.201188-1-enric.balletbo@collabora.com>
 <20201030113622.201188-2-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B08643B3FD0F7A84B3BAE10F735C634DC0527C867A451D1B2B3C44FD4C881E972000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_212517_699709_B1B819CE 
X-CRM114-Status: GOOD (  25.44  )
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
Cc: Rob Herring <robh@kernel.org>, drinkcat@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-30 at 12:36 +0100, Enric Balletbo i Serra wrote:
> The System Control Processor System (SCPSYS) has several power management
> related tasks in the system. Add the bindings to define the power
> domains for the SCPSYS power controller.
> 
> Co-developed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changes in v4:
> - Fix indentation warnings reported by yamllint
> 
> Changes in v3:
> - Use hex for unit-addresses.
> - Define child nodes for nested power domains even are duplicated, but
>   more clear than adding a regex scaped to be a valid URI.
> 
> Changes in v2:
> - Use generic node names (power-domain).
> - Define valid values for common properties like #power-domain-cells.
> 
>  .../power/mediatek,power-controller.yaml      | 289 ++++++++++++++++++
>  1 file changed, 289 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> new file mode 100644
> index 000000000000..73b8988bd063
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -0,0 +1,289 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Power Domains Controller
> +
> +maintainers:
> +  - Weiyi Lu <weiyi.lu@mediatek.com>
> +  - Matthias Brugger <mbrugger@suse.com>
> +
> +description: |
> +  Mediatek processors include support for multiple power domains which can be
> +  powered up/down by software based on different application scenes to save power.
> +
> +  IP cores belonging to a power domain should contain a 'power-domains'
> +  property that is a phandle for SCPSYS node representing the domain.
> +
> +properties:
> +  $nodename:
> +    const: power-controller
> +
> +  compatible:
> +    enum:
> +      - mediatek,mt8173-power-controller
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^power-domain@[0-9a-f]+$":
> +    type: object
> +    description: |
> +      Represents the power domains within the power controller node as documented
> +      in Documentation/devicetree/bindings/power/power-domain.yaml.
> +
> +    properties:
> +
> +      '#power-domain-cells':
> +        description:
> +          Must be 0 for nodes representing a single PM domain and 1 for nodes
> +          providing multiple PM domains.
> +
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      reg:
> +        description: |
> +          Power domain index. Valid values are defined in:
> +              "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
> +        maxItems: 1
> +
> +      clocks:
> +        description: |
> +          A number of phandles to clocks that need to be enabled during domain
> +          power-up sequencing.
> +
> +      clock-names:
> +        description: |
> +          List of names of clocks, in order to match the power-up sequencing
> +          for each power domain we need to group the clocks by name. BASIC
> +          clocks need to be enabled before enabling the corresponding power
> +          domain, and should not have a '-' in their name (i.e mm, mfg, venc).
> +          SUSBYS clocks need to be enabled before releasing the bus protection,
> +          and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
> +
> +          In order to follow properly the power-up sequencing, the clocks must
> +          be specified by order, adding first the BASIC clocks followed by the
> +          SUSBSYS clocks.
> +
> +      mediatek,infracfg:
> +        $ref: /schemas/types.yaml#definitions/phandle
> +        description: phandle to the device containing the INFRACFG register range.
> +
> +      mediatek,smi:
> +        $ref: /schemas/types.yaml#definitions/phandle
> +        description: phandle to the device containing the SMI register range.
> +
> +    patternProperties:
> +      "^power-domain@[0-9a-f]+$":
> +        type: object
> +        description: |
> +          Represents a power domain child within a power domain parent node.
> +
> +        properties:
> +
> +          '#power-domain-cells':
> +            description:
> +              Must be 0 for nodes representing a single PM domain and 1 for nodes
> +              providing multiple PM domains.
> +
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +          reg:
> +            maxItems: 1
> +
> +          clocks:
> +            description: |
> +              A number of phandles to clocks that need to be enabled during domain
> +              power-up sequencing.
> +
> +          clock-names:
> +            description: |
> +              List of names of clocks, in order to match the power-up sequencing
> +              for each power domain we need to group the clocks by name. BASIC
> +              clocks need to be enabled before enabling the corresponding power
> +              domain, and should not have a '-' in their name (i.e mm, mfg, venc).
> +              SUSBYS clocks need to be enabled before releasing the bus protection,
> +              and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
> +
> +              In order to follow properly the power-up sequencing, the clocks must
> +              be specified by order, adding first the BASIC clocks followed by the
> +              SUSBSYS clocks.
> +
> +          mediatek,infracfg:
> +            $ref: /schemas/types.yaml#definitions/phandle
> +            description: phandle to the device containing the INFRACFG register range.
> +
> +          mediatek,smi:
> +            $ref: /schemas/types.yaml#definitions/phandle
> +            description: phandle to the device containing the SMI register range.
> +
> +        patternProperties:
> +          "^power-domain@[0-9a-f]+$":
> +            type: object
> +            description: |
> +              Represents a power domain child within a power domain parent node.
> +
> +            properties:
> +
> +              '#power-domain-cells':
> +                description:
> +                  Must be 0 for nodes representing a single PM domain and 1 for nodes
> +                  providing multiple PM domains.
> +
> +              '#address-cells':
> +                const: 1
> +
> +              '#size-cells':
> +                const: 0
> +
> +              reg:
> +                maxItems: 1
> +
> +              clocks:
> +                description: |
> +                  A number of phandles to clocks that need to be enabled during domain
> +                  power-up sequencing.
> +
> +              clock-names:
> +                description: |
> +                  List of names of clocks, in order to match the power-up sequencing
> +                  for each power domain we need to group the clocks by name. BASIC
> +                  clocks need to be enabled before enabling the corresponding power
> +                  domain, and should not have a '-' in their name (i.e mm, mfg, venc).
> +                  SUSBYS clocks need to be enabled before releasing the bus protection,
> +                  and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
> +
> +                  In order to follow properly the power-up sequencing, the clocks must
> +                  be specified by order, adding first the BASIC clocks followed by the
> +                  SUSBSYS clocks.
> +
> +              mediatek,infracfg:
> +                $ref: /schemas/types.yaml#definitions/phandle
> +                description: phandle to the device containing the INFRACFG register range.
> +
> +              mediatek,smi:
> +                $ref: /schemas/types.yaml#definitions/phandle
> +                description: phandle to the device containing the SMI register range.
> +
> +            required:
> +              - reg
> +
> +            additionalProperties: false
> +
> +        required:
> +          - reg
> +
> +        additionalProperties: false
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/power/mt8173-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        scpsys: syscon@10006000 {
> +            compatible = "syscon", "simple-mfd";
> +            reg = <0 0x10006000 0 0x1000>;
> +
> +            spm: power-controller {
> +                compatible = "mediatek,mt8173-power-controller";
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                #power-domain-cells = <1>;

Hi Enric and Matthias,

I'd like to know whether we could only keep this power-domain-cells
property here and make others optional, which can more directly point
out who is the real power domain provider?

> +
> +                /* power domains of the SoC */
> +                power-domain@MT8173_POWER_DOMAIN_VDEC {
> +                    reg = <MT8173_POWER_DOMAIN_VDEC>;
> +                    clocks = <&topckgen CLK_TOP_MM_SEL>;
> +                    clock-names = "mm";
> +                    #power-domain-cells = <0>;
> +                };
> +                power-domain@MT8173_POWER_DOMAIN_VENC {
> +                    reg = <MT8173_POWER_DOMAIN_VENC>;
> +                    clocks = <&topckgen CLK_TOP_MM_SEL>,
> +                             <&topckgen CLK_TOP_VENC_SEL>;
> +                    clock-names = "mm", "venc";
> +                    #power-domain-cells = <0>;
> +                };
> +                power-domain@MT8173_POWER_DOMAIN_ISP {
> +                    reg = <MT8173_POWER_DOMAIN_ISP>;
> +                    clocks = <&topckgen CLK_TOP_MM_SEL>;
> +                    clock-names = "mm";
> +                    #power-domain-cells = <0>;
> +                };
> +                power-domain@MT8173_POWER_DOMAIN_MM {
> +                    reg = <MT8173_POWER_DOMAIN_MM>;
> +                    clocks = <&topckgen CLK_TOP_MM_SEL>;
> +                    clock-names = "mm";
> +                    #power-domain-cells = <0>;
> +                    mediatek,infracfg = <&infracfg>;
> +                };
> +                power-domain@MT8173_POWER_DOMAIN_VENC_LT {
> +                    reg = <MT8173_POWER_DOMAIN_VENC_LT>;
> +                    clocks = <&topckgen CLK_TOP_MM_SEL>,
> +                             <&topckgen CLK_TOP_VENC_LT_SEL>;
> +                    clock-names = "mm", "venclt";
> +                    #power-domain-cells = <0>;
> +                };
> +                power-domain@MT8173_POWER_DOMAIN_AUDIO {
> +                    reg = <MT8173_POWER_DOMAIN_AUDIO>;
> +                    #power-domain-cells = <0>;
> +                };
> +                power-domain@MT8173_POWER_DOMAIN_USB {
> +                    reg = <MT8173_POWER_DOMAIN_USB>;
> +                    #power-domain-cells = <0>;
> +                };
> +                power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
> +                    reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
> +                    clocks = <&clk26m>;
> +                    clock-names = "mfg";
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    #power-domain-cells = <1>;
> +
> +                    power-domain@MT8173_POWER_DOMAIN_MFG_2D {
> +                        reg = <MT8173_POWER_DOMAIN_MFG_2D>;
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                        #power-domain-cells = <1>;
> +
> +                        power-domain@MT8173_POWER_DOMAIN_MFG {
> +                            reg = <MT8173_POWER_DOMAIN_MFG>;
> +                            #power-domain-cells = <0>;
> +                            mediatek,infracfg = <&infracfg>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
