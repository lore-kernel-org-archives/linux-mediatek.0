Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F49C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 19:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u//F2flc7JgPw/Oj317XMwisasa2g8y7QVVufgmVThI=; b=rNas8Mww5coBNK
	nZ0WzUAdk27CiKSq4a4dSZZzSviOxOODDvxekV39vqSNiWre8ErUdIa7NR1J7b+Yk/qqxFaQDHkMs
	t7h4zhDY6wN+TnLcrqjCwi6riS0x2YvdpqqFL5sXcS5n9pk3VjyLAl16t33qSQdRmtb5pGlIsODJ2
	T+rBeAcCfHLLjLsFOyfFEUTM3SS19a/GMrDjLvnlQtjACrwmwlZo2iSDBeXuw9hYLi3NDjLp7PWAW
	zi2Q2xmPIxfCC6W4hcY9ZPh9Vw6bJDpumq/HU+SBCCgrHAbxZvLMyhIED2WrScYrt25pKrxsWPltV
	sx9+OdZBnvJFFXCAyaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlRM-003UJU-Kk; Fri, 10 Dec 2021 19:20:20 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvl0H-003IwF-M3; Fri, 10 Dec 2021 18:52:23 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 n104-20020a9d2071000000b005799790cf0bso10548736ota.5; 
 Fri, 10 Dec 2021 10:52:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y7NmFP1p6Qd1b0fL9f5rRq9R2qqG2ejfV+/bfCnpsio=;
 b=agG1cKYv974hjvcUSJgYPZ0OOzH3wh4e1s9AeoNQiPTbYhzpk643XWS+PfnbZW9Lgw
 UBssnDE5JP0WA5eoazBrysIX8ukMxMAd5QETRL+HJBZX1SW/JeFAlGA+MTUuqEppQDz6
 OBhrZ6TIiTt8h/EzqGO0o8Ne2EKufWhDA0/iUAEH90uVedfHlIRoOGB1gRVXtA7WYKkI
 OCZ4XQMto9a//FRxDXHql6CPGLxjdJUhFA8WagJsRLOuCDteNAhIo3gdlzGXXRRT7TOo
 6CR0kTgCc/6hcnZwSa18bV4IgEcDVfaNrNJ3uB6d8R6Whly4LCxPVgS2N5XQiR21vQL9
 qhhQ==
X-Gm-Message-State: AOAM530wtXfpZ6Z+fGbQuC2m/rO67Ptm1rxZkTuazANUJQw2zIUrE7V7
 QeF2lB5wAHe4U6jVHOWUXmJRKWhDCw==
X-Google-Smtp-Source: ABdhPJxJINpWT9IGxH/gECmIc454mQcQqjJ6lflDgb0psgutHeLk4C87tidil+dvRTPlkQbusGCZJQ==
X-Received: by 2002:a9d:6190:: with SMTP id g16mr12460797otk.54.1639162340148; 
 Fri, 10 Dec 2021 10:52:20 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z12sm686907oor.45.2021.12.10.10.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 10:52:19 -0800 (PST)
Received: (nullmailer pid 1694615 invoked by uid 1000);
 Fri, 10 Dec 2021 18:52:18 -0000
Date: Fri, 10 Dec 2021 12:52:18 -0600
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
Subject: Re: [PATCH net-next v8 6/6] net: dt-bindings: dwmac: add support for
 mt8195
Message-ID: <YbOh4hZfc+QKA/hO@robh.at.kernel.org>
References: <20211210013129.811-1-biao.huang@mediatek.com>
 <20211210013129.811-7-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211210013129.811-7-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_105221_782365_988DDABF 
X-CRM114-Status: GOOD (  18.22  )
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

On Fri, Dec 10, 2021 at 09:31:29AM +0800, Biao Huang wrote:
> Add binding document for the ethernet on mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.yaml          | 86 +++++++++++++++----
>  1 file changed, 70 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 9207266a6e69..fb04166404d8 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -19,11 +19,67 @@ select:
>        contains:
>          enum:
>            - mediatek,mt2712-gmac
> +          - mediatek,mt8195-gmac
>    required:
>      - compatible
>  
>  allOf:
>    - $ref: "snps,dwmac.yaml#"
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

Add new clocks on to the end of existing clocks. That will simplify the 
binding as here you will just need 'minItems: 6'.

> +            - description: MAC Main clock
> +            - description: PTP clock
> +            - description: RMII reference clock provided by MAC
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
> @@ -32,22 +88,10 @@ properties:
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
> @@ -62,6 +106,8 @@ properties:
>        or will round down. Range 0~31*170.
>        For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>        or will round down. Range 0~31*550.
> +      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
> +      or will round down. Range 0~31*290.
>  
>    mediatek,rx-delay-ps:
>      description:
> @@ -70,6 +116,8 @@ properties:
>        or will round down. Range 0~31*170.
>        For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>        or will round down. Range 0~31*550.
> +      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple
> +      of 290, or will round down. Range 0~31*290.
>  
>    mediatek,rmii-rxc:
>      type: boolean
> @@ -103,6 +151,12 @@ properties:
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
