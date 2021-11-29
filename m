Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDACC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 00:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6O3Rd1k5gpkADH0PCtylsX693dHseKaNjh+C4CpY6hI=; b=b0eRAXsfrvIKky
	Hy4xPa0epnGMDKpi2JTcnmY2L/Qwm2km5iy/6j+yPtDZ8dOJ6JeCRrgMP8wVpX9pv7veM7qmzf98O
	RvJHc3eCDjZO/hsQysfpoB+h59fG8sZ8DZj78ZhHdzMHB/rVspVX3VPXNxaMgFcvuAd09CAonHTWL
	GlwLZKcmUYMIEEaSwzwoi3pFdLlBTtRcTpzGES6is/HIHVhbplb7i4nbAuMeQIYGxtAMDyRmPo3eq
	nNhztmw46jYo2V+RlrMc/PFat3hDj2EHY2n6m/ieRTYQkkPgMyIn+WbRe722QFkreJVmXzzDxjqLz
	tWBoN4/mfHb5sy+P/FYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrUAn-00Gugs-6H; Mon, 29 Nov 2021 00:05:33 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrUAY-00Guec-Gj; Mon, 29 Nov 2021 00:05:20 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so23051250otl.3; 
 Sun, 28 Nov 2021 16:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iwSIflfW61r4qMMe5AGMgQ3tkWLIXXhLm1LxJgz7nQY=;
 b=GlMFQFIAjBp652luEnzXPk9rjm4mEZFK7OA6/fjIaqbNbI1DFjrrjSeEEQos+1b/GT
 9kK+MWLDPmpYxWmyzGVnwC80bHrN7lEZ3PCM4TEf3wMKoM4Gl5VCbI/HRUUvlvekn0eR
 vm+55y3anH/z04VxwtohSvBDPt+2I77WF0oOp3IZcn54nujZqcBQbbbDWLi/oMvsZXH0
 i4oZne+O8QIde7Il2hoEw8hLhi7NufZjd5psXGF4Men00s+2gZBLdIi1JId33rYhAc/J
 Qs4nrwF8BF3W8TjgrUfIoTKxMEHJDjtD0cu65MrdLirQ+iMQDm2GOYPPZOFXBfrfFMat
 AjqQ==
X-Gm-Message-State: AOAM5334ayxqnuo4SAZ6fpJAX66sefM5wQdHTl2zp1UIRkpbeqCOEClc
 WPveFNFD97nco2wAQ3cXuw==
X-Google-Smtp-Source: ABdhPJyAFWt39rMuurc002tPJegnuR2ShMHjadX/k8wY8gGlpo0V3+AB6mJ1nMYec4g9/fhbKE478A==
X-Received: by 2002:a9d:2002:: with SMTP id n2mr41519471ota.95.1638144317562; 
 Sun, 28 Nov 2021 16:05:17 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.242])
 by smtp.gmail.com with ESMTPSA id w22sm2050772ooc.47.2021.11.28.16.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 16:05:17 -0800 (PST)
Received: (nullmailer pid 2854097 invoked by uid 1000);
 Mon, 29 Nov 2021 00:05:13 -0000
Date: Sun, 28 Nov 2021 18:05:13 -0600
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 srv_heupstream@mediatek.com, macpaul.lin@mediatek.com,
 angelogioacchino.delregno@collabora.com, dkirjanov@suse.de
Subject: Re: [PATCH v3 7/7] net-next: dt-bindings: dwmac: add support for
 mt8195
Message-ID: <YaQZOS54BawtWkGO@robh.at.kernel.org>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-8-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112093918.11061-8-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_160518_593285_DB8FA302 
X-CRM114-Status: GOOD (  18.67  )
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

On Fri, Nov 12, 2021 at 05:39:18PM +0800, Biao Huang wrote:
> Add binding document for the ethernet on mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.yaml          | 86 +++++++++++++++----
>  1 file changed, 70 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 2eb4781536f7..b27566ed01c6 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -19,12 +19,68 @@ select:
>        contains:
>          enum:
>            - mediatek,mt2712-gmac
> +          - mediatek,mt8195-gmac
>    required:
>      - compatible
>  
>  allOf:
>    - $ref: "snps,dwmac.yaml#"
>    - $ref: "ethernet-controller.yaml#"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt2712-gmac
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          items:
> +            - description: AXI clock
> +            - description: APB clock
> +            - description: MAC Main clock
> +            - description: PTP clock
> +            - description: RMII reference clock provided by MAC
> +
> +        clock-names:
> +          minItems: 5
> +          items:
> +            - const: axi
> +            - const: apb
> +            - const: mac_main
> +            - const: ptp_ref
> +            - const: rmii_internal
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-gmac
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +          items:
> +            - description: AXI clock
> +            - description: APB clock
> +            - description: MAC clock gate
> +            - description: MAC Main clock
> +            - description: PTP clock
> +            - description: RMII reference clock provided by MAC

Put mac_cg at the end and then the difference is just 5 or 6 clocks and 
you don't have to duplicate everything.


> +
> +        clock-names:
> +          minItems: 6
> +          items:
> +            - const: axi
> +            - const: apb
> +            - const: mac_cg
> +            - const: mac_main
> +            - const: ptp_ref
> +            - const: rmii_internal
>  
>  properties:
>    compatible:
> @@ -33,22 +89,10 @@ properties:
>            - enum:
>                - mediatek,mt2712-gmac
>            - const: snps,dwmac-4.20a
> -
> -  clocks:
> -    items:
> -      - description: AXI clock
> -      - description: APB clock
> -      - description: MAC Main clock
> -      - description: PTP clock
> -      - description: RMII reference clock provided by MAC
> -
> -  clock-names:
> -    items:
> -      - const: axi
> -      - const: apb
> -      - const: mac_main
> -      - const: ptp_ref
> -      - const: rmii_internal
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-gmac
> +          - const: snps,dwmac-5.10a
>  
>    mediatek,pericfg:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -63,6 +107,8 @@ properties:
>        or will round down. Range 0~31*170.
>        For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>        or will round down. Range 0~31*550.
> +      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
> +      or will round down. Range 0~31*290.
>  
>    mediatek,rx-delay-ps:
>      description:
> @@ -71,6 +117,8 @@ properties:
>        or will round down. Range 0~31*170.
>        For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>        or will round down. Range 0~31*550.
> +      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple
> +      of 290, or will round down. Range 0~31*290.
>  
>    mediatek,rmii-rxc:
>      type: boolean
> @@ -104,6 +152,12 @@ properties:
>        3. the inside clock, which be sent to MAC, will be inversed in RMII case when
>           the reference clock is from MAC.
>  
> +  mediatek,mac-wol:
> +    type: boolean
> +    description:
> +      If present, indicates that MAC supports WOL(Wake-On-LAN), and MAC WOL will be enabled.
> +      Otherwise, PHY WOL is perferred.
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
