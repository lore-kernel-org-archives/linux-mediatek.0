Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE07C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Feb 2022 02:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xKN/tIw/y5CKKs1rHFIA4NIAMypvfRNGx7HG8VhQg0=; b=1DYBJbDRxCZYeg
	4X0s+ddkTDJC71LdDGquSmIFJQtuqkpVV+lw+Ji+SqndYH4nbzT0sO4a8whAOjK6hrYc4KCRcPtk3
	Zrmqn0b0Ypvly+WQ/qQ8qlCii5uGZBXTfjpW3hS/5iYSrCcyHwxBgGJtMNUFwfApY2F/cB7VYpuQo
	Oumn6HBzrTkDVVpnU2Jp7TLcm2bQvpdAfdoeAsTwHNCntYdbz3P0Q6Fkr1883VodWtJIoy9wJ7WRC
	+onExYMfkUb0gx9XVZcb7hfU7QTGgTM/AQMWXAiHLm3C/ClMjfid7V2PgC9lOuUO/XL6FH12qD8Ee
	JkVvqIXYDxxM1TfBkPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGAVs-005xGx-6Y; Sat, 05 Feb 2022 02:09:20 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGAVp-005xGO-Ls
 for linux-mediatek@lists.infradead.org; Sat, 05 Feb 2022 02:09:19 +0000
Received: by mail-oi1-f181.google.com with SMTP id t199so10581582oie.10
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Feb 2022 18:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nlm/DoIWX/vryslRDMyLqsOKh1vDr7UP4z3/6RoNcP0=;
 b=bR65+uX8CQGRd90rJIvnLsrVkaQTiI8U5KhkMOWDxBONxoVI5tvZPm77seffb9pSya
 6wqGaWJZW7mzcCVSIaEMREWdFKBON52Lb8fTR5XGNMygsLwS8hRbqk8cksm7q2qzKUqf
 3T1Um/LkX143ExviMm52x20EBHAvYXg2nOFk2OqSeGWk+ng14WyaB/4becos54IWtpoD
 Crvg8ePAtLd5v9Sf6Im2KT++dz4t1TVeLFIPHLgW2NusFQn5cRvD4jVlGfl3Obp29yOI
 fPZWkVx41keW7ZME9ItbrF57FeegutM/2vsdRqFpqgTyHUXWr/mdL9X8PTJf8cGNlFMD
 1vcw==
X-Gm-Message-State: AOAM531rxGYloEsV/0wyKHvRKx8eo78UKZSP8Ku4hDf3VMxeleDsMwgn
 sJi8muKLTvByLA7aywhWHQ==
X-Google-Smtp-Source: ABdhPJyVS0PG5yTiDBcZK/QCZ0tOeDl6uPjDN421zx47NmuJYe9hhhMoFBleBbSxq0pBVid0d/dinw==
X-Received: by 2002:a05:6808:14c1:: with SMTP id
 f1mr865934oiw.12.1644026956758; 
 Fri, 04 Feb 2022 18:09:16 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g4sm1365784otl.1.2022.02.04.18.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 18:09:16 -0800 (PST)
Received: (nullmailer pid 3610125 invoked by uid 1000);
 Sat, 05 Feb 2022 02:09:15 -0000
Date: Fri, 4 Feb 2022 20:09:15 -0600
From: Rob Herring <robh@kernel.org>
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: net: wireless: mt76: document
 bindings for MT7986
Message-ID: <Yf3cSyKJz9ymj+Fq@robh.at.kernel.org>
References: <cover.1642128031.git.Bo.Jiao@mediatek.com>
 <c6a6ddd797269ea92698f612d6b7c66c9ec03765.1642128031.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6a6ddd797269ea92698f612d6b7c66c9ec03765.1642128031.git.Bo.Jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_180917_748699_DAFAE15F 
X-CRM114-Status: GOOD (  19.28  )
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

On Fri, Jan 14, 2022 at 10:53:20AM +0800, Bo Jiao wrote:
> From: Peter Chiu <chui-hao.chiu@mediatek.com>
> 
> Add an entry for MT7986 SoC.
> 
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Cc: devicetree@vger.kernel.org
> ---
> v3:
>  - fix yamllint warnings and errors
>  - add 'minItems: 1' to keep 1 reg entry being valid
> ---
>  .../bindings/net/wireless/mediatek,mt76.yaml  | 31 +++++++++++++++++--
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> index 1489d3c..d630a7e 100644
> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> @@ -18,7 +18,7 @@ description: |
>    wireless device. The node is expected to be specified as a child
>    node of the PCI controller to which the wireless chip is connected.
>    Alternatively, it can specify the wireless part of the MT7628/MT7688
> -  or MT7622 SoC.
> +  or MT7622/MT7986 SoC.
>  
>  allOf:
>    - $ref: ieee80211.yaml#
> @@ -29,9 +29,11 @@ properties:
>        - mediatek,mt76
>        - mediatek,mt7628-wmac
>        - mediatek,mt7622-wmac
> +      - mediatek,mt7986-wmac
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3

With more than 1, you need to define what each one is.

>  
>    interrupts:
>      maxItems: 1
> @@ -39,6 +41,17 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  memory-region:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +    description:
> +      Specify the consys reset for mt7986.
> +
> +  reset-name:
> +    const: consys
> +
>    mediatek,infracfg:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -165,7 +178,7 @@ required:
>    - compatible
>    - reg
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> @@ -231,3 +244,15 @@ examples:
>  
>        power-domains = <&scpsys 3>;
>      };
> +
> +  - |
> +    wifi@18000000 {
> +        compatible = "mediatek,mt7986-wmac";
> +        resets = <&watchdog 23>;
> +        reset-names = "consys";
> +        reg = <0x18000000 0x1000000>,
> +              <0x10003000 0x1000>,
> +              <0x11d10000 0x1000>;
> +        interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>;
> +        memory-region = <&wmcpu_emi>;
> +    };
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
