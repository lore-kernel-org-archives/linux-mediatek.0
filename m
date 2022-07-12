Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8CDC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 19:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0aNyxP21GZCBEkZVZT8NoRqTZzqSF9erFDxLkI8OCE=; b=3Bo+K37ag0VEV7ZPQHE2wK6OtB
	ZAqLoOQ019fjpxUgraLQn1fOrOPUDhVggxwX5myBbYf2GCJHFtZycCSf42zcJqkDGWUSPxrTXFbbi
	l1QcsvYP6Wm6Wm83TDRb5ZabXluRwFDibiQukPOWhfCKfogHl8dDcmxsWqmwYVCGhw3i4uY3CTiMO
	GpMVN4vClq99V/c2BMoKqeiBrz0jo4wcERcxGcQFpIIpmsbeG137CciSjWw9nrZSRwSxxLnFLsdun
	+Q2oNbTaBPGc+SuPz5q3c05x5MXF0LlPSK6mlZ0m1OOjf/KfbdNE1CZFLwECjZd6wgcVkT10f/Fts
	vbZhpRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBLRm-00E8ZD-8A; Tue, 12 Jul 2022 19:21:26 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBLRj-00E8Xx-3U; Tue, 12 Jul 2022 19:21:25 +0000
Received: by mail-il1-f175.google.com with SMTP id u13so5438383iln.6;
        Tue, 12 Jul 2022 12:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t0aNyxP21GZCBEkZVZT8NoRqTZzqSF9erFDxLkI8OCE=;
        b=jqZiLi9HX86PGiAWPD+cOCFdF7V+NMg0bogVkw0hcShYsF3S/9TuZViN6ZL4NoeS7Z
         7pOv1P8x9fz7FKROw3iT7/oSWgz6T4xpsn+0eUMJFO3urGfDKE0LNimekHPGk/0tQU+l
         001ozMb+dezelfht0sWHTVva6QvyTy++KqXwqCQ+eA6ecksp/YpAuefVTaXZXHfH6fRn
         HnZO43MNjjS3rwKuiOfPWUuxmSlgTRqYMx0W8yj7WQMQ+iFbSrITovFczAC+P+6AlGDx
         CrjUK/lcjMH0z4qmuwiowiswIveLlZPBNfty6aXXGLUrIURdpVu758B3OmFMwYMvli4C
         PN0w==
X-Gm-Message-State: AJIora+aH2PmZjgoJFAPydDjAtTW2cA/wNnX2SozvINnZkMHr/qgb/SA
	7876p+pVHALGCuox8HotCw==
X-Google-Smtp-Source: AGRyM1s5cpn8A2ors+BY93VkqJFWZPkOCrE2BaSZNJ/3lIe92TyVMWqAp3du+VuHapI0beHPSumJuQ==
X-Received: by 2002:a05:6e02:1c42:b0:2dc:11b4:4fca with SMTP id d2-20020a056e021c4200b002dc11b44fcamr13712769ilg.307.1657653681737;
        Tue, 12 Jul 2022 12:21:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f24-20020a056638113800b0033f3ab94271sm4421144jar.139.2022.07.12.12.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 12:21:21 -0700 (PDT)
Received: (nullmailer pid 2216514 invoked by uid 1000);
	Tue, 12 Jul 2022 19:21:19 -0000
Date: Tue, 12 Jul 2022 13:21:19 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 03/16] dt-bindings: power: mediatek: Refine multiple
 level power domain nodes
Message-ID: <20220712192119.GK1823936-robh@kernel.org>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-4-tinghan.shen@mediatek.com>
 <20220705205739.GA2599256-robh@kernel.org>
 <b5667c052447d1b3c3498131af98d80a07ed4767.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5667c052447d1b3c3498131af98d80a07ed4767.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_122123_171629_C6D7AA18 
X-CRM114-Status: GOOD (  31.30  )
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

On Wed, Jul 06, 2022 at 02:19:08PM +0800, Tinghan Shen wrote:
> On Tue, 2022-07-05 at 14:57 -0600, Rob Herring wrote:
> > On Mon, Jul 04, 2022 at 06:00:15PM +0800, Tinghan Shen wrote:
> > > Extract duplicated properties and support more levels of power
> > > domain nodes.
> > > 
> > > This change fix following error when do dtbs_check,
> > >     arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: power-controller: power-domain@15:
> > > power-domain@16:power-domain@18: 'power-domain@19', 'power-domain@20', 'power-domain@21' do not
> > > match any of the regexes: 'pinctrl-[0-9]+'
> > > 	 From schema: Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > > 
> > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > > ---
> > >  .../power/mediatek,power-controller.yaml      | 132 ++----------------
> > >  1 file changed, 12 insertions(+), 120 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > > b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > > index 135c6f722091..09a537a802b8 100644
> > > --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > > @@ -39,8 +39,17 @@ properties:
> > >    '#size-cells':
> > >      const: 0
> > >  
> > > +required:
> > > +  - compatible
> > > +
> > > +additionalProperties: false
> > > +
> > >  patternProperties:
> > >    "^power-domain@[0-9a-f]+$":
> > > +    $ref: "#/$defs/power-domain-node"
> > > +
> > > +$defs:
> > > +  power-domain-node:
> > >      type: object
> > >      description: |
> > >        Represents the power domains within the power controller node as documented
> > > @@ -98,127 +107,10 @@ patternProperties:
> > >          $ref: /schemas/types.yaml#/definitions/phandle
> > >          description: phandle to the device containing the SMI register range.
> > >  
> > > -    patternProperties:
> > > -      "^power-domain@[0-9a-f]+$":
> > > -        type: object
> > > -        description: |
> > > -          Represents a power domain child within a power domain parent node.
> > > -
> > > -        properties:
> > > -
> > > -          '#power-domain-cells':
> > > -            description:
> > > -              Must be 0 for nodes representing a single PM domain and 1 for nodes
> > > -              providing multiple PM domains.
> > > -
> > > -          '#address-cells':
> > > -            const: 1
> > > -
> > > -          '#size-cells':
> > > -            const: 0
> > > -
> > > -          reg:
> > > -            maxItems: 1
> > > -
> > > -          clocks:
> > > -            description: |
> > > -              A number of phandles to clocks that need to be enabled during domain
> > > -              power-up sequencing.
> > > -
> > > -          clock-names:
> > > -            description: |
> > > -              List of names of clocks, in order to match the power-up sequencing
> > > -              for each power domain we need to group the clocks by name. BASIC
> > > -              clocks need to be enabled before enabling the corresponding power
> > > -              domain, and should not have a '-' in their name (i.e mm, mfg, venc).
> > > -              SUSBYS clocks need to be enabled before releasing the bus protection,
> > > -              and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
> > > -
> > > -              In order to follow properly the power-up sequencing, the clocks must
> > > -              be specified by order, adding first the BASIC clocks followed by the
> > > -              SUSBSYS clocks.
> > > -
> > > -          domain-supply:
> > > -            description: domain regulator supply.
> > > -
> > > -          mediatek,infracfg:
> > > -            $ref: /schemas/types.yaml#/definitions/phandle
> > > -            description: phandle to the device containing the INFRACFG register range.
> > > -
> > > -          mediatek,smi:
> > > -            $ref: /schemas/types.yaml#/definitions/phandle
> > > -            description: phandle to the device containing the SMI register range.
> > > -
> > > -        patternProperties:
> > > -          "^power-domain@[0-9a-f]+$":
> > > -            type: object
> > > -            description: |
> > > -              Represents a power domain child within a power domain parent node.
> > > -
> > > -            properties:
> > > +      required:
> > > +        - reg
> > >  
> > > -              '#power-domain-cells':
> > > -                description:
> > > -                  Must be 0 for nodes representing a single PM domain and 1 for nodes
> > > -                  providing multiple PM domains.
> > > -
> > > -              '#address-cells':
> > > -                const: 1
> > > -
> > > -              '#size-cells':
> > > -                const: 0
> > > -
> > > -              reg:
> > > -                maxItems: 1
> > > -
> > > -              clocks:
> > > -                description: |
> > > -                  A number of phandles to clocks that need to be enabled during domain
> > > -                  power-up sequencing.
> > > -
> > > -              clock-names:
> > > -                description: |
> > > -                  List of names of clocks, in order to match the power-up sequencing
> > > -                  for each power domain we need to group the clocks by name. BASIC
> > > -                  clocks need to be enabled before enabling the corresponding power
> > > -                  domain, and should not have a '-' in their name (i.e mm, mfg, venc).
> > > -                  SUSBYS clocks need to be enabled before releasing the bus protection,
> > > -                  and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
> > > -
> > > -                  In order to follow properly the power-up sequencing, the clocks must
> > > -                  be specified by order, adding first the BASIC clocks followed by the
> > > -                  SUSBSYS clocks.
> > > -
> > > -              domain-supply:
> > > -                description: domain regulator supply.
> > > -
> > > -              mediatek,infracfg:
> > > -                $ref: /schemas/types.yaml#/definitions/phandle
> > > -                description: phandle to the device containing the INFRACFG register range.
> > > -
> > > -              mediatek,smi:
> > > -                $ref: /schemas/types.yaml#/definitions/phandle
> > > -                description: phandle to the device containing the SMI register range.
> > > -
> > > -            required:
> > > -              - reg
> > > -
> > > -            additionalProperties: false
> > > -
> > > -        required:
> > > -          - reg
> > > -
> > > -        additionalProperties: false
> > > -
> > > -    required:
> > > -      - reg
> > > -
> > > -    additionalProperties: false
> > > -
> > > -required:
> > > -  - compatible
> > > -
> > > -additionalProperties: false
> > > +      additionalProperties: false
> > You now aren't checking more than 1 level because you have defined 
> > 'additionalProperties' to be a DT property. Check the indentation.
> > 
> > You need this in $defs/power-domain-node to recurse:
> > 
> >     additionalProperties:
> >       $ref: #/$defs/power-domain-node
> Hi Rob,
> 
> I get the following error after adding the 'additionalProperties' to $defs/power-domain-node.
> The same error occurs when I run dt_binding_check on power/renesas,sysc-rmobile.yaml, which has the
> similar property.
> 
> $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/power/mediatek,power-
> controller.yaml O=out
> make[1]: Entering directory '/test/upstream-cros/src/third_party/kernel/v5.10/out'
>   LINT    Documentation/devicetree/bindings
>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> /test/upstream-
> cros/src/third_party/kernel/v5.10/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
> : ignoring, error in schema: patternProperties: ^thermistor@: properties: adi,excitation-current-
> nanoamp
> /test/upstream-
> cros/src/third_party/kernel/v5.10/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-
> sor.yaml: ignoring, error in schema: allOf: 1: if: not: properties
> /test/upstream-
> cros/src/third_party/kernel/v5.10/Documentation/devicetree/bindings/mfd/mps,mp2629.yaml: ignoring,
> error parsing file
>   DTEX    Documentation/devicetree/bindings/power/mediatek,power-controller.example.dts
>   DTC     Documentation/devicetree/bindings/power/mediatek,power-controller.example.dtb
>   CHECK   Documentation/devicetree/bindings/power/mediatek,power-controller.example.dtb
> Traceback (most recent call last):
>   File "/test/.venv/py3.9/bin/dt-validate", line 173, in <module>
>     testtree = dtschema.load(filename, line_number=args.line_number)
>   File "/test/.venv/py3.9/lib/python3.9/site-packages/dtschema/lib.py", line 913, in load
>     return [ dtschema.dtb.fdt_unflatten(f.read()) ]
>   File "/test/.venv/py3.9/lib/python3.9/site-packages/dtschema/dtb.py", line 463, in fdt_unflatten
>     p = dtschema.get_prop_types()
>   File "/test/.venv/py3.9/lib/python3.9/site-packages/dtschema/lib.py", line 892, in get_prop_types
>     props = dtschema.extract_types(schema_cache)
>   File "/test/.venv/py3.9/lib/python3.9/site-packages/dtschema/lib.py", line 883, in extract_types
>     _extract_subschema_types(props, sch, sch)
>   File "/test/.venv/py3.9/lib/python3.9/site-packages/dtschema/lib.py", line 874, in
> _extract_subschema_types
> 
> [...snip...]
> 
>   File "/test/.venv/py3.9/lib/python3.9/site-packages/dtschema/lib.py", line 803, in
> _extract_prop_type
>     _extract_prop_type(props, schema, propname, subschema)
>   File "/test/.venv/py3.9/lib/python3.9/site-packages/dtschema/lib.py", line 794, in
> _extract_prop_type
>     _extract_subschema_types(props, schema, subschema)
>   File "/test/.venv/py3.9/lib/python3.9/site-packages/dtschema/lib.py", line 874, in
> _extract_subschema_types
>     _extract_prop_type(props, schema, p, v)
>   File "/test/.venv/py3.9/lib/python3.9/site-packages/dtschema/lib.py", line 790, in
> _extract_prop_type
>     if not isinstance(subschema, dict):
> RecursionError: maximum recursion depth exceeded while calling a Python object
> make[1]: Leaving directory '/test/upstream-cros/src/third_party/kernel/v5.10/out'

Okay, I think you need something more like this that doesn't recurse 
infinitely:

patternProperties:
  "^power-domain@[0-9a-f]+$":
    $ref: #/$defs/power-domain-node

    unevaluatedProperties:
      $ref: #/$defs/power-domain-node

If you need a 3rd level of nodes:
      unevaluatedProperties:
        $ref: #/$defs/power-domain-node


Rob

