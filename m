Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5541C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMDnLfBMBpAnvkfwUu1kUcciuPfA0gd/jLIRz34KC2Q=; b=IrixARcCoNxe2gjOtqr/kA6nsk
	0oY/OyueKQ6X4j3tH0DXWbXmmS/6/wpm5H1X6bEzQ+S46EJwbkSU80zrU3WbtJm2FCarEe4Z5wFJx
	4wuWD8AjcGIf3gvEDoJtOgx8/XAzefIRBvl0kc5DmAKDj97pLfYx6VZpcOOnfuvxxN5efPIFlVzt3
	pzjUgsbso16CYnJXLyV8qU4vS7h+3Un3FRbM6x+xEEq9YW0zSNwyQOp3ewctU/njMxNrNt+O1HEKH
	o9dQpsyZ2MVR7hSILtXdnzSGi5JLiAkW3MRKp7EY9megEuDBRx0GbG/gLsxf3FGUffPkwVtZ8vAhR
	jNPKQUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGNE-005Mqq-AC; Fri, 15 Jul 2022 08:08:32 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGMz-005MRF-TH
	for linux-mediatek@lists.infradead.org; Fri, 15 Jul 2022 08:08:19 +0000
Received: by mail-lf1-x12f.google.com with SMTP id e28so6629357lfj.4
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Jul 2022 01:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HMDnLfBMBpAnvkfwUu1kUcciuPfA0gd/jLIRz34KC2Q=;
        b=QR/A/hgSlUZte4asSWtLqDuxQmnKzibCYCIbMKxSECKlou7MyhHtzssTjq2Cn4Xbal
         aD3L8t39u6mc9+oPXUQSfvD+PP4nSMb2LQA2W0rbI71cLc+BTwovvZFmt0zHNDDrUu5I
         2L8aIGMmQVLjQmxt5hnkkFaZdbD71unxxwBocmt7CEAySVuMrF39pMUamvqvVkbdJD0g
         ebFs9dF2iV6izMqIB4odycxP6QsuQrsrQycsSmcJgyP+vvZ/TFAK5/NjcJQacmoKqPeq
         ZK4ktXuFyA89spS1KOG/mNPTzuzSt2IVJ5KBHfKjlmHrHoB7kJT1XqSXF0ou668qyMGi
         j9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HMDnLfBMBpAnvkfwUu1kUcciuPfA0gd/jLIRz34KC2Q=;
        b=S5J8GiKDbwC7WF0Koxq7j/sw+O8ctq0d81fWaq0/nCrBYsERHqqd2qaZwVCR6M3JZw
         +altLDXCERnRSZJZblXqqVU0qEkPViFPMC69nITXbAPH6Ouqq64flAxtqsgDwM/y3VWU
         3IiEVW8HT7TgEx3WMJu2wlB/YqXT6Sy4nLetP2O+VgjvIfLhiL9pYSTmmJ1wznLunSgG
         q2i7d92H4oy+8/wI3WnBSMzmrMyNyV20WQFyB3J3zNUcg+exwzKuXxUV28rckaPZEdcm
         KlG3nf5/EXSh1ftwwn7dul4/j+Kr7K1AZHjybv06K1yGI3LbE4R568eqlJoR4Ybm4jwC
         GEAQ==
X-Gm-Message-State: AJIora8ytOTxpOWl5MWURO3MwQfnHb4HQFfDWerxs3WmJNAa/zV6Da0A
	mKnGLuxK6nsF1AriVAK/xRYITg==
X-Google-Smtp-Source: AGRyM1seZOIBtoRiwdKNcrQKrAEd4sfpxeEoh9duO4f8VVv0gWScXXeRrwqk1ZeqbkII0kyUy0tv8g==
X-Received: by 2002:a05:6512:acd:b0:489:f4ce:70a2 with SMTP id n13-20020a0565120acd00b00489f4ce70a2mr7571532lfu.322.1657872463261;
        Fri, 15 Jul 2022 01:07:43 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id c36-20020a05651223a400b0047f79487758sm777934lfv.133.2022.07.15.01.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 01:07:42 -0700 (PDT)
Message-ID: <c2e9f890-98c2-8f09-952d-495f2b57a254@linaro.org>
Date: Fri, 15 Jul 2022 10:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 05/19] dt-bindings: power: mediatek: Refine multiple
 level power domain nodes
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220714122837.20094-1-tinghan.shen@mediatek.com>
 <20220714122837.20094-6-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220714122837.20094-6-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_010817_971601_544B6DBB 
X-CRM114-Status: GOOD (  21.12  )
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

On 14/07/2022 14:28, Tinghan Shen wrote:
> Extract duplicated properties and support more levels of power
> domain nodes.
> 
> This change fix following error when do dtbs_check,
>     arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: power-controller: power-domain@15:power-domain@16:power-domain@18: 'power-domain@19', 'power-domain@20', 'power-domain@21' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	 From schema: Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../power/mediatek,power-controller.yaml      | 119 +-----------------
>  1 file changed, 6 insertions(+), 113 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index be81cd97afa4..e5494a330716 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -42,6 +42,10 @@ properties:
>  
>  patternProperties:
>    "^power-domain@[0-9a-f]+$":
> +    $ref: "#/$defs/power-domain-node"
> +
> +$defs:
> +  power-domain-node:
>      type: object
>      description: |
>        Represents the power domains within the power controller node as documented
> @@ -100,122 +104,11 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/phandle
>          description: phandle to the device containing the SMI register range.
>  
> -    patternProperties:
> -      "^power-domain@[0-9a-f]+$":
> -        type: object
> -        description: |
> -          Represents a power domain child within a power domain parent node.
> -
> -        properties:
> -
> -          '#power-domain-cells':
> -            description:
> -              Must be 0 for nodes representing a single PM domain and 1 for nodes
> -              providing multiple PM domains.
> -
> -          '#address-cells':
> -            const: 1
> -
> -          '#size-cells':
> -            const: 0
> -
> -          reg:
> -            maxItems: 1
> -
> -          clocks:
> -            description: |
> -              A number of phandles to clocks that need to be enabled during domain
> -              power-up sequencing.
> -
> -          clock-names:
> -            description: |
> -              List of names of clocks, in order to match the power-up sequencing
> -              for each power domain we need to group the clocks by name. BASIC
> -              clocks need to be enabled before enabling the corresponding power
> -              domain, and should not have a '-' in their name (i.e mm, mfg, venc).
> -              SUSBYS clocks need to be enabled before releasing the bus protection,
> -              and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
> -
> -              In order to follow properly the power-up sequencing, the clocks must
> -              be specified by order, adding first the BASIC clocks followed by the
> -              SUSBSYS clocks.
> -
> -          domain-supply:
> -            description: domain regulator supply.
> -
> -          mediatek,infracfg:
> -            $ref: /schemas/types.yaml#/definitions/phandle
> -            description: phandle to the device containing the INFRACFG register range.
> -
> -          mediatek,smi:
> -            $ref: /schemas/types.yaml#/definitions/phandle
> -            description: phandle to the device containing the SMI register range.
> -
> -        patternProperties:
> -          "^power-domain@[0-9a-f]+$":
> -            type: object
> -            description: |
> -              Represents a power domain child within a power domain parent node.
> -
> -            properties:
> -
> -              '#power-domain-cells':
> -                description:
> -                  Must be 0 for nodes representing a single PM domain and 1 for nodes
> -                  providing multiple PM domains.
> -
> -              '#address-cells':
> -                const: 1
> -
> -              '#size-cells':
> -                const: 0
> -
> -              reg:
> -                maxItems: 1
> -
> -              clocks:
> -                description: |
> -                  A number of phandles to clocks that need to be enabled during domain
> -                  power-up sequencing.
> -
> -              clock-names:
> -                description: |
> -                  List of names of clocks, in order to match the power-up sequencing
> -                  for each power domain we need to group the clocks by name. BASIC
> -                  clocks need to be enabled before enabling the corresponding power
> -                  domain, and should not have a '-' in their name (i.e mm, mfg, venc).
> -                  SUSBYS clocks need to be enabled before releasing the bus protection,
> -                  and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
> -
> -                  In order to follow properly the power-up sequencing, the clocks must
> -                  be specified by order, adding first the BASIC clocks followed by the
> -                  SUSBSYS clocks.
> -
> -              domain-supply:
> -                description: domain regulator supply.
> -
> -              mediatek,infracfg:
> -                $ref: /schemas/types.yaml#/definitions/phandle
> -                description: phandle to the device containing the INFRACFG register range.
> -
> -              mediatek,smi:
> -                $ref: /schemas/types.yaml#/definitions/phandle
> -                description: phandle to the device containing the SMI register range.
> -
> -            required:
> -              - reg
> -
> -            additionalProperties: false
> -
> -        required:
> -          - reg
> -
> -        additionalProperties: false
> -
>      required:
>        - reg
>  
> -    additionalProperties: false
> +    additionalProperties:
> +      $ref: "#/$defs/power-domain-node"

That's an interesting construction - endless recurrence. I did not know
it works like that... How about making it a bit more specific? Defining
defs "power-domain-node" for just one child (without
additionalProperties piece) and (maybe with just one more level):

@@ -43,6 +43,12 @@ patternProperties:

   "^power-domain@[0-9a-f]+$":

     $ref: "#/$defs/power-domain-node"



+    patternProperties:

+      "^power-domain@[0-9a-f]+$":

+        $ref: "#/$defs/power-domain-node"

+        unevaluatedProperties: false

+    unevaluatedProperties: false

+

 $defs:

   power-domain-node:

     type: object

@@ -105,9 +111,6 @@ $defs:

     required:

       - reg



-    additionalProperties:

-      $ref: "#/$defs/power-domain-node"

-

 required:

   - compatible




Best regards,
Krzysztof

