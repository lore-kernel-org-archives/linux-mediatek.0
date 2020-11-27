Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1414CC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 08:56:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59CFD22210
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 08:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2kYWxjyV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59CFD22210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aU6WNYfap9jfbr3QAujFubuXwk/ApURv3Bs5jYOF/4I=; b=2kYWxjyVqtTP4D7S+nKJSubKD
	z7hKpheYgEogiI6yepWFGq1vYsOIPNslKb78j+4kPYrL5CoP0a8Y6VmK0Vhrova95odw8HEAhgiT9
	p2MRqcM5Tx++ZVntJh4zYtK1vTDyAqNQr3GP49G+inWXDjmf/ueoKXZoOjfhRBIh3EGOY4J1FSv43
	EA7jCu4DYRmNVJyHtBklkylAAtArYnrFM9gm9pit0zLMxaP4W3191lUaMRi6r4Id24w6vo6y5sS/7
	UU8eO3d/mQFXFe5AJ9lMDF/vcrc5KeNhraH3opXLf21ssaVnK3AEi/RSTeM9Nk9BpGCanP366176L
	xMlUpqNng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiZYL-0008T2-Dy; Fri, 27 Nov 2020 08:56:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiZYC-0008RD-G0; Fri, 27 Nov 2020 08:56:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 2ADB21F46101
Subject: Re: [PATCH v4 01/16] dt-bindings: power: Add bindings for the
 Mediatek SCPSYS power domains controller
To: Weiyi Lu <weiyi.lu@mediatek.com>, Matthias Brugger <mbrugger@suse.com>
References: <20201030113622.201188-1-enric.balletbo@collabora.com>
 <20201030113622.201188-2-enric.balletbo@collabora.com>
 <1606443891.10511.3.camel@mtksdaap41>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <24cd5076-39c8-827a-5932-1e178f2628fd@collabora.com>
Date: Fri, 27 Nov 2020 09:56:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1606443891.10511.3.camel@mtksdaap41>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_035620_859870_910DDB44 
X-CRM114-Status: GOOD (  24.49  )
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, fparent@baylibre.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Weiyi,

On 27/11/20 3:24, Weiyi Lu wrote:
> On Fri, 2020-10-30 at 12:36 +0100, Enric Balletbo i Serra wrote:
>> The System Control Processor System (SCPSYS) has several power management
>> related tasks in the system. Add the bindings to define the power
>> domains for the SCPSYS power controller.
>>
>> Co-developed-by: Matthias Brugger <mbrugger@suse.com>
>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>
>> Changes in v4:
>> - Fix indentation warnings reported by yamllint
>>
>> Changes in v3:
>> - Use hex for unit-addresses.
>> - Define child nodes for nested power domains even are duplicated, but
>>   more clear than adding a regex scaped to be a valid URI.
>>
>> Changes in v2:
>> - Use generic node names (power-domain).
>> - Define valid values for common properties like #power-domain-cells.
>>
>>  .../power/mediatek,power-controller.yaml      | 289 ++++++++++++++++++
>>  1 file changed, 289 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> new file mode 100644
>> index 000000000000..73b8988bd063
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> @@ -0,0 +1,289 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Mediatek Power Domains Controller
>> +
>> +maintainers:
>> +  - Weiyi Lu <weiyi.lu@mediatek.com>
>> +  - Matthias Brugger <mbrugger@suse.com>
>> +
>> +description: |
>> +  Mediatek processors include support for multiple power domains which can be
>> +  powered up/down by software based on different application scenes to save power.
>> +
>> +  IP cores belonging to a power domain should contain a 'power-domains'
>> +  property that is a phandle for SCPSYS node representing the domain.
>> +
>> +properties:
>> +  $nodename:
>> +    const: power-controller
>> +
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt8173-power-controller
>> +
>> +  '#power-domain-cells':
>> +    const: 1
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^power-domain@[0-9a-f]+$":
>> +    type: object
>> +    description: |
>> +      Represents the power domains within the power controller node as documented
>> +      in Documentation/devicetree/bindings/power/power-domain.yaml.
>> +
>> +    properties:
>> +
>> +      '#power-domain-cells':
>> +        description:
>> +          Must be 0 for nodes representing a single PM domain and 1 for nodes
>> +          providing multiple PM domains.
>> +
>> +      '#address-cells':
>> +        const: 1
>> +
>> +      '#size-cells':
>> +        const: 0
>> +
>> +      reg:
>> +        description: |
>> +          Power domain index. Valid values are defined in:
>> +              "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
>> +        maxItems: 1
>> +
>> +      clocks:
>> +        description: |
>> +          A number of phandles to clocks that need to be enabled during domain
>> +          power-up sequencing.
>> +
>> +      clock-names:
>> +        description: |
>> +          List of names of clocks, in order to match the power-up sequencing
>> +          for each power domain we need to group the clocks by name. BASIC
>> +          clocks need to be enabled before enabling the corresponding power
>> +          domain, and should not have a '-' in their name (i.e mm, mfg, venc).
>> +          SUSBYS clocks need to be enabled before releasing the bus protection,
>> +          and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
>> +
>> +          In order to follow properly the power-up sequencing, the clocks must
>> +          be specified by order, adding first the BASIC clocks followed by the
>> +          SUSBSYS clocks.
>> +
>> +      mediatek,infracfg:
>> +        $ref: /schemas/types.yaml#definitions/phandle
>> +        description: phandle to the device containing the INFRACFG register range.
>> +
>> +      mediatek,smi:
>> +        $ref: /schemas/types.yaml#definitions/phandle
>> +        description: phandle to the device containing the SMI register range.
>> +
>> +    patternProperties:
>> +      "^power-domain@[0-9a-f]+$":
>> +        type: object
>> +        description: |
>> +          Represents a power domain child within a power domain parent node.
>> +
>> +        properties:
>> +
>> +          '#power-domain-cells':
>> +            description:
>> +              Must be 0 for nodes representing a single PM domain and 1 for nodes
>> +              providing multiple PM domains.
>> +
>> +          '#address-cells':
>> +            const: 1
>> +
>> +          '#size-cells':
>> +            const: 0
>> +
>> +          reg:
>> +            maxItems: 1
>> +
>> +          clocks:
>> +            description: |
>> +              A number of phandles to clocks that need to be enabled during domain
>> +              power-up sequencing.
>> +
>> +          clock-names:
>> +            description: |
>> +              List of names of clocks, in order to match the power-up sequencing
>> +              for each power domain we need to group the clocks by name. BASIC
>> +              clocks need to be enabled before enabling the corresponding power
>> +              domain, and should not have a '-' in their name (i.e mm, mfg, venc).
>> +              SUSBYS clocks need to be enabled before releasing the bus protection,
>> +              and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
>> +
>> +              In order to follow properly the power-up sequencing, the clocks must
>> +              be specified by order, adding first the BASIC clocks followed by the
>> +              SUSBSYS clocks.
>> +
>> +          mediatek,infracfg:
>> +            $ref: /schemas/types.yaml#definitions/phandle
>> +            description: phandle to the device containing the INFRACFG register range.
>> +
>> +          mediatek,smi:
>> +            $ref: /schemas/types.yaml#definitions/phandle
>> +            description: phandle to the device containing the SMI register range.
>> +
>> +        patternProperties:
>> +          "^power-domain@[0-9a-f]+$":
>> +            type: object
>> +            description: |
>> +              Represents a power domain child within a power domain parent node.
>> +
>> +            properties:
>> +
>> +              '#power-domain-cells':
>> +                description:
>> +                  Must be 0 for nodes representing a single PM domain and 1 for nodes
>> +                  providing multiple PM domains.
>> +
>> +              '#address-cells':
>> +                const: 1
>> +
>> +              '#size-cells':
>> +                const: 0
>> +
>> +              reg:
>> +                maxItems: 1
>> +
>> +              clocks:
>> +                description: |
>> +                  A number of phandles to clocks that need to be enabled during domain
>> +                  power-up sequencing.
>> +
>> +              clock-names:
>> +                description: |
>> +                  List of names of clocks, in order to match the power-up sequencing
>> +                  for each power domain we need to group the clocks by name. BASIC
>> +                  clocks need to be enabled before enabling the corresponding power
>> +                  domain, and should not have a '-' in their name (i.e mm, mfg, venc).
>> +                  SUSBYS clocks need to be enabled before releasing the bus protection,
>> +                  and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
>> +
>> +                  In order to follow properly the power-up sequencing, the clocks must
>> +                  be specified by order, adding first the BASIC clocks followed by the
>> +                  SUSBSYS clocks.
>> +
>> +              mediatek,infracfg:
>> +                $ref: /schemas/types.yaml#definitions/phandle
>> +                description: phandle to the device containing the INFRACFG register range.
>> +
>> +              mediatek,smi:
>> +                $ref: /schemas/types.yaml#definitions/phandle
>> +                description: phandle to the device containing the SMI register range.
>> +
>> +            required:
>> +              - reg
>> +
>> +            additionalProperties: false
>> +
>> +        required:
>> +          - reg
>> +
>> +        additionalProperties: false
>> +
>> +    required:
>> +      - reg
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/mt8173-clk.h>
>> +    #include <dt-bindings/power/mt8173-power.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        scpsys: syscon@10006000 {
>> +            compatible = "syscon", "simple-mfd";
>> +            reg = <0 0x10006000 0 0x1000>;
>> +
>> +            spm: power-controller {
>> +                compatible = "mediatek,mt8173-power-controller";
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +                #power-domain-cells = <1>;
> 
> Hi Enric and Matthias,
> 
> I'd like to know whether we could only keep this power-domain-cells
> property here and make others optional, which can more directly point
> out who is the real power domain provider?
> 

This is enforced by the generic power-domain binding
(Documentation/devicetree/bindings/power/power-domain.yaml) as a required
property. So, if needs to be changed, should be changed there. My understanding,
though, is that (like the binding is) this property should be required to
properly define a power-domain.

Cheers,
 Enric

>> +
>> +                /* power domains of the SoC */
>> +                power-domain@MT8173_POWER_DOMAIN_VDEC {
>> +                    reg = <MT8173_POWER_DOMAIN_VDEC>;
>> +                    clocks = <&topckgen CLK_TOP_MM_SEL>;
>> +                    clock-names = "mm";
>> +                    #power-domain-cells = <0>;
>> +                };
>> +                power-domain@MT8173_POWER_DOMAIN_VENC {
>> +                    reg = <MT8173_POWER_DOMAIN_VENC>;
>> +                    clocks = <&topckgen CLK_TOP_MM_SEL>,
>> +                             <&topckgen CLK_TOP_VENC_SEL>;
>> +                    clock-names = "mm", "venc";
>> +                    #power-domain-cells = <0>;
>> +                };
>> +                power-domain@MT8173_POWER_DOMAIN_ISP {
>> +                    reg = <MT8173_POWER_DOMAIN_ISP>;
>> +                    clocks = <&topckgen CLK_TOP_MM_SEL>;
>> +                    clock-names = "mm";
>> +                    #power-domain-cells = <0>;
>> +                };
>> +                power-domain@MT8173_POWER_DOMAIN_MM {
>> +                    reg = <MT8173_POWER_DOMAIN_MM>;
>> +                    clocks = <&topckgen CLK_TOP_MM_SEL>;
>> +                    clock-names = "mm";
>> +                    #power-domain-cells = <0>;
>> +                    mediatek,infracfg = <&infracfg>;
>> +                };
>> +                power-domain@MT8173_POWER_DOMAIN_VENC_LT {
>> +                    reg = <MT8173_POWER_DOMAIN_VENC_LT>;
>> +                    clocks = <&topckgen CLK_TOP_MM_SEL>,
>> +                             <&topckgen CLK_TOP_VENC_LT_SEL>;
>> +                    clock-names = "mm", "venclt";
>> +                    #power-domain-cells = <0>;
>> +                };
>> +                power-domain@MT8173_POWER_DOMAIN_AUDIO {
>> +                    reg = <MT8173_POWER_DOMAIN_AUDIO>;
>> +                    #power-domain-cells = <0>;
>> +                };
>> +                power-domain@MT8173_POWER_DOMAIN_USB {
>> +                    reg = <MT8173_POWER_DOMAIN_USB>;
>> +                    #power-domain-cells = <0>;
>> +                };
>> +                power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
>> +                    reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
>> +                    clocks = <&clk26m>;
>> +                    clock-names = "mfg";
>> +                    #address-cells = <1>;
>> +                    #size-cells = <0>;
>> +                    #power-domain-cells = <1>;
>> +
>> +                    power-domain@MT8173_POWER_DOMAIN_MFG_2D {
>> +                        reg = <MT8173_POWER_DOMAIN_MFG_2D>;
>> +                        #address-cells = <1>;
>> +                        #size-cells = <0>;
>> +                        #power-domain-cells = <1>;
>> +
>> +                        power-domain@MT8173_POWER_DOMAIN_MFG {
>> +                            reg = <MT8173_POWER_DOMAIN_MFG>;
>> +                            #power-domain-cells = <0>;
>> +                            mediatek,infracfg = <&infracfg>;
>> +                        };
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
