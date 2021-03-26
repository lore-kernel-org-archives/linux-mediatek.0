Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854E8C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 19:58:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257F4619C7
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 19:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 257F4619C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Od0cDmsdXONXxHwpDhGUWLrPx8G67k7WEE2X3KJStXs=; b=IaV/zRtwhtLWFEk1M8Qip/Bib
	VcT9wZ5CD9nTKvFlKzwAQm2MC7/gLn4CEu15GQ6xQeIDUjVGX0mrhPTOTI3qn+4gV7AnfGuZaGURG
	XxbqWKLY9Iw85C/NMALZRpAQqm3xlC3/3E/nXTufM7IT8OtdZTfUzYntRTiwBMIV3LdgTb3y8vg3k
	0RQHgiD4haSlcQf3Pyl0RGtR25hN8F6QPBTcyMp8TeJRoRqyovQqOr1gcN+8N4EZOIEZCjJxezepG
	fH/VuLhYVgJ6hioCuhHJx9ZXQioS18ULP5W01z9lWV1/Y0AhKzFcdcP+ylYAnBXOpZ5e0W47qyn+E
	ERxcDvgXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPsb5-004Fkc-3q; Fri, 26 Mar 2021 19:58:19 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPsat-004FjA-Pc; Fri, 26 Mar 2021 19:58:09 +0000
Received: by mail-io1-f46.google.com with SMTP id r193so6593122ior.9;
 Fri, 26 Mar 2021 12:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tJ6yYkB8BxpQIVI/MgIQdvEwTp9s8g0HFbgujThHtvI=;
 b=QJ5Fhe97BAnscKG7yoOnkNYrhTa5Aq4GGTbATuZoan/Z1ZG5p1+W3WbAzzhLkaFH/L
 u9K7ocugRNeFFz8l/cHnz8hveeb12ITxCgKhG0CMtgCnv/u3rmwg5KVLLVv/e4hekNeO
 ZRncBreH3EWQ28FBct3+NmwfnTJyK2LC5R6FksUVqgQ2at73l86MDOG0zH2pS4HbmuVW
 em6Of+XVVOjdEz7bFwugXUW5QM1t7+yA/cTXMTXy8MVoBtKDob5vaxdIg6O6HXxEhf7y
 nsWyYzfSNgen97cfVknvw7KFZucKfaYcaeOPBfSHvm3tCu4xmvZSNe4pVLT6gspuVl04
 NM9Q==
X-Gm-Message-State: AOAM533iFqcqtkjh1zsJEHnYAG309bre18FZjSAKstGX6whQ6jBIjIP1
 N1O3/VIYRkWQHKZGcJAHpRxsg6LU5w==
X-Google-Smtp-Source: ABdhPJzoPGekUw69MEfjx/t0Uxf+AmBWsQx/rdpQFEmNh+AM5RTSSKpEuYh9fsWBvUQEF2YKhLS0fA==
X-Received: by 2002:a6b:c881:: with SMTP id
 y123mr11110588iof.152.1616788685731; 
 Fri, 26 Mar 2021 12:58:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id o19sm4829061ioh.47.2021.03.26.12.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 12:58:04 -0700 (PDT)
Received: (nullmailer pid 3767758 invoked by uid 1000);
 Fri, 26 Mar 2021 19:58:02 -0000
Date: Fri, 26 Mar 2021 13:58:02 -0600
From: Rob Herring <robh@kernel.org>
To: Nina Wu <nina-cm.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Zhen Lei <thunder.leizhen@huawei.com>, Neal Liu <neal.liu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Jackson-kt.Chang@mediatek.com
Subject: Re: [PATCH 1/2] dt-bindings: devapc: Update bindings
Message-ID: <20210326195802.GA3761703@robh.at.kernel.org>
References: <1616743871-8087-1-git-send-email-nina-cm.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616743871-8087-1-git-send-email-nina-cm.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_195807_951469_BB7F0A9A 
X-CRM114-Status: GOOD (  21.70  )
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

On Fri, Mar 26, 2021 at 03:31:10PM +0800, Nina Wu wrote:
> From: Nina Wu <Nina-CM.Wu@mediatek.com>
> 
> To support newer hardware architecture of devapc,
> update device tree bindings.
> 
> Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/devapc.yaml   | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> index 31e4d3c..489f6a9 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> @@ -20,9 +20,27 @@ properties:
>    compatible:
>      enum:
>        - mediatek,mt6779-devapc
> +      - mediatek,mt8192-devapc
> +
> +  version:
> +    description: The version of the hardware architecture

This should be implied by the compatible string.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2]
> +    maxItems: 1
> +
> +  slave_type_num:

vendor prefix needed and s/_/-/

> +    description: The number of the devapc set

What?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 4]
> +    maxItems: 1
>  
>    reg:
>      description: The base address of devapc register bank
> +    maxItems: 4

Need to define what each region is.

> +
> +  vio_idx_num:

vendor prefix needed and s/_/-/

> +    description: The number of the devices controlled by devapc

No need to know which devices?

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>      maxItems: 1

uint32-array with 'maxItems: 1' is just 'uint32'

>  
>    interrupts:
> @@ -39,7 +57,10 @@ properties:
>  
>  required:
>    - compatible
> +  - version
> +  - slave_type_num
>    - reg
> +  - vio_idx_num
>    - interrupts
>    - clocks
>    - clock-names
> @@ -53,8 +74,28 @@ examples:
>  
>      devapc: devapc@10207000 {
>        compatible = "mediatek,mt6779-devapc";
> +      version = <1>;
> +      slave_type_num = <1>;
>        reg = <0x10207000 0x1000>;
> +      vio_idx_num = <511>;
>        interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
>        clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
>        clock-names = "devapc-infra-clock";
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +
> +    devapc: devapc@10207000 {
> +        compatible = "mediatek,mt8192-devapc";
> +        version = <2>;
> +        slave_type_num = <4>;
> +        reg = <0 0x10207000 0 0x1000>,
> +            <0 0x10274000 0 0x1000>,
> +            <0 0x10275000 0 0x1000>,
> +            <0 0x11020000 0 0x1000>;
> +        vio_idx_num = <367 292 242 58>;

Is the length of this the same as the value of slave_type_num? If so, 
don't need both.

> +        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
> +        clock-names = "devapc-infra-clock";
> +    };
> -- 
> 2.6.4
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
