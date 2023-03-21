Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AACC74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 19:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fw4oA6sQFO3oz372kux+un0E6HQ5jc+wHkvkZJ9IwFU=; b=SGY45hG1INccQakR0M4asxjmqJ
	wEU/LgqjqLJcAR5mxE3o/x4CXC+fZeJ+IK+eWca8N3OAXeBVhx1iZBnu2dZSQtAvhYLzTCRTqza9q
	sNsFc14lryKrJ+q5TV4eyeOg1IVciJlXL5H1xU3QdOcdYVsTSYp/9Px7zUOhQBaK5dhi9x5eC1Lpl
	YyJTXJsBedbl934HuizVWIzp1HkgM1tdkdyQmAR+4cdP5NPBn/8zClc73NecfZ0pTk1+vQSZDW6aY
	EHWXOcO1iUqZg7LLQQKFRirxaFg45w1Q0RDEiRNDtkO2m5DTpeEtPytO3i0jCsjpu8C7m2FUqJXYf
	YRLRW0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pehjg-00DVGg-2Z;
	Tue, 21 Mar 2023 19:33:32 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pehj8-00DUsZ-0F
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Mar 2023 19:33:00 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-17ab3a48158so17358188fac.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Mar 2023 12:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679427176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw4oA6sQFO3oz372kux+un0E6HQ5jc+wHkvkZJ9IwFU=;
        b=IADXY28Zc8zPeJ3zzY/Pe0UhdMlvX/zQJrDshfgGbkosa/ghEHhmbsHMZgkGUr6qyE
         cbvHuKFWEUabgD13YoPSYEve2ToI7yym+JTYG5XL7ur41MMprn7axKCDA7KYdjSVYRIN
         AGXUvFAc1TcLvlqGrM9YoszYco/6fCKtcgM6z39TmoOOrn9Z/viJFuvgd2eColSuW+3x
         6rxexQOuPLNkc6ygZ9c8oVpXnxAdUyqC2Lx6iUeB6+yqB2DUuUkzCOD35WwXHE3DsYhP
         vMNn/MnXcAu2s+IkrbavAU8RxIHdbGnTsdZTuhl035b/H6hJXZlZ5I3MbioY8tVFBZgp
         Exbg==
X-Gm-Message-State: AO0yUKVvXkrRE7NiFQNjcHgR3jeVj1KhTU03g6YxOc9qGdFmYzvl5YMb
	R2lmlVvauVGdFB7fBZIGog==
X-Google-Smtp-Source: AK7set9APR5/PD9MttMR2PXhbEanCH39cNdf56FBKKwW28VU+BO3r98osWsOZpOBDMqCJvMFzQGayg==
X-Received: by 2002:a05:6870:b292:b0:17a:cc20:6d31 with SMTP id c18-20020a056870b29200b0017acc206d31mr64287oao.30.1679427176404;
        Tue, 21 Mar 2023 12:32:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w14-20020a056870b38e00b001723f29f6e2sm4575531oap.37.2023.03.21.12.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 12:32:55 -0700 (PDT)
Received: (nullmailer pid 1311802 invoked by uid 1000);
	Tue, 21 Mar 2023 19:32:54 -0000
Date: Tue, 21 Mar 2023 14:32:54 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, lorenzo.bianconi@redhat.com, daniel@makrotopia.org, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 06/10] dt-bindings: soc: mediatek: move ilm in a
 dedicated dts node
Message-ID: <20230321193254.GA1306908-robh@kernel.org>
References: <cover.1679330630.git.lorenzo@kernel.org>
 <c9b65ef3aeb28a50cec45d1f98aec72d8016c828.1679330630.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9b65ef3aeb28a50cec45d1f98aec72d8016c828.1679330630.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_123258_137457_3865EB6A 
X-CRM114-Status: GOOD (  20.06  )
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

On Mon, Mar 20, 2023 at 05:58:00PM +0100, Lorenzo Bianconi wrote:
> Since the cpuboot memory region is not part of the RAM SoC, move ilm in
> a deidicated syscon node.
> This patch helps to keep backward-compatibility with older version of
> uboot codebase where we have a limit of 8 reserved-memory dts child
> nodes.

Maybe, but breaks the ABI. It also looks like a step backwards. Fix your 
u-boot.

> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 14 +++---
>  .../soc/mediatek/mediatek,mt7986-wo-ilm.yaml  | 45 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ilm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> index 7f6638d43854..5d2397ec5891 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> @@ -32,14 +32,12 @@ properties:
>    memory-region:
>      items:
>        - description: firmware EMI region
> -      - description: firmware ILM region
>        - description: firmware DLM region
>        - description: firmware CPU DATA region
>  
>    memory-region-names:
>      items:
>        - const: wo-emi
> -      - const: wo-ilm
>        - const: wo-dlm
>        - const: wo-data
>  
> @@ -51,6 +49,10 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: mediatek wed-wo cpuboot controller interface.
>  
> +  mediatek,wo-ilm:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: mediatek wed-wo ilm interface.
> +
>  allOf:
>    - if:
>        properties:
> @@ -63,6 +65,7 @@ allOf:
>          memory-region: false
>          mediatek,wo-ccif: false
>          mediatek,wo-cpuboot: false
> +        mediatek,wo-ilm: false
>  
>  required:
>    - compatible
> @@ -97,11 +100,10 @@ examples:
>          reg = <0 0x15010000 0 0x1000>;
>          interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
>  
> -        memory-region = <&wo_emi>, <&wo_ilm>, <&wo_dlm>,
> -                        <&wo_data>;
> -        memory-region-names = "wo-emi", "wo-ilm", "wo-dlm",
> -                              "wo-data";
> +        memory-region = <&wo_emi>, <&wo_dlm>, &wo_data>;
> +        memory-region-names = "wo-emi", "wo-dlm", "wo-data";
>          mediatek,wo-ccif = <&wo_ccif0>;
>          mediatek,wo-cpuboot = <&wo_cpuboot>;
> +        mediatek,wo-ilm = <&wo_ilm>;
>        };
>      };
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ilm.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ilm.yaml
> new file mode 100644
> index 000000000000..2a3775cd941e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ilm.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt7986-wo-ilm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Wireless Ethernet Dispatch (WED) WO ILM firmware interface for MT7986

Either this region is some memory or it's a device. Sounds like the 
former and this is not a 'syscon'.

> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +  - Felix Fietkau <nbd@nbd.name>
> +
> +description:
> +  The MediaTek wo-ilm (Information Lifecycle Management) provides a configuration
> +  interface for WiFi critical data used by WED WO firmware. WED WO controller is
> +  used to perform offload rx packet processing (e.g. 802.11 aggregation packet
> +  reordering or rx header translation) on MT7986 soc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt7986-wo-ilm
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      syscon@151e0000 {
> +        compatible = "mediatek,mt7986-wo-ilm", "syscon";
> +        reg = <0 0x151e0000 0 0x8000>;
> +      };
> +    };
> -- 
> 2.39.2
> 

