Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD29CC3065C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 07:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MC//Jt155OtPzEJgjMqdaEMtRJLJr6GW0gLkD4HSAFU=; b=cfSzGzyvLmAPmL+ntsizLAA5f0
	Db8sGtKSphong/2uU6Wms/Z4cYr6tJB8n0H8pCn6/yFJIja3yZu0FW202g3VxfH8oE7VxhF0xQaBo
	gWzDHdZ2Zw7e+PZciYabIMzlhAw/6J3qusuxKBQBOWYtX56CsjYuXdKyH6Pl2qD/YoArxHHqNAe9d
	K3JNFH8QWuGuuWpIHB5ZaCYm9VZIrRdkVEjtiaTqB45Lauqm+t5b20wHgG80kEs3AdB0v+YoJMoQL
	pxDQ3z4bYMfN3HdC64bejMgs60EAz4jIFf48HLLhYA8Us/ZsXLyakzlIiQ5/qBLnbElSAAMN/Mvj7
	GVOXHmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPHKz-0000000CW1b-24j0;
	Thu, 04 Jul 2024 07:57:05 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPHKk-0000000CVvA-3YbF;
	Thu, 04 Jul 2024 07:56:52 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ee794ec046so3424781fa.2;
        Thu, 04 Jul 2024 00:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720079809; x=1720684609; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MC//Jt155OtPzEJgjMqdaEMtRJLJr6GW0gLkD4HSAFU=;
        b=kh9cGTTJ6c8EPp8FRNmKhLRpj1YMJdkQO1bBJDD2PwFKdaqNI1eq/lH+V6yfENv7wl
         EcW9AqqYpNbo2UZmyl9ZoaRi4+UmLc1A1ItDNesb2Hos8BIjTG5uLSQONAr/+PkOUZvz
         cmkJLJtUQ6UXonJMmpovJvGPxQZN7ATItBMGA4xxhrXlLKnk2BGWLeyffWSVg9Bnttql
         YF6gbCfpLp2g8+f+5Skwb6pVMsDvSQ4ExjkKwTcJXYG7UNttmLC/8fg8CcEz+THY5VIM
         g9vth3hql+5OzMyGZVKwMp3T9rbFbjSFGnkOjkrXeatHY4f2cSaJF0QLIOgTv0LqAHvO
         vitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720079809; x=1720684609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MC//Jt155OtPzEJgjMqdaEMtRJLJr6GW0gLkD4HSAFU=;
        b=xTyY0ImAf41DrLu4CB6p/KWZYGCI2h3X5BXQscdoyKvWa9gqvFGSKGOxcAabjDrTG0
         5dZYbxR6/sCxkrIVHuDhsAVuN/jcdMCKpv3HgSoFSCXF/m24l8Nhr59qj4+bjaJXe6UB
         yP4yoK5vzbNpqeYpnzUnTML+ImrOfSpLTN6SrCIYU4byyD/6dccSZqZRnHRRQ/jXI5QL
         QIkjslJcXDRx1zEZENCe8eL5l5V5I+TFZSkkKcdeA9JuBCsFNbXDagE4DxfYmBuocw3J
         NyH70t+bvyNhM/6VTQZIvR1RxmKRt3rbxV3J1rKRJgY8ghnzu3bFdy9RzQU2K1fZ1392
         YZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCW/C/DqeVlpt5THq1uAP+tQDsjOLez0KfoDtDuiNO6wC4N/jFlsnp63KlwGXiKSQbbIuzHnaB4d2XapfJIkwTk+29na4papjzOSZ3XotN5LPSfrcWQtgHu0upJy9JGId9eloLadpTJO1EwTUFqL4Ff6iBiA23cCVhw=
X-Gm-Message-State: AOJu0YwVrO/eFsBlOOtMKi6SDvPdbH37jd4THU8gGS1g/6LWGOi3ge5O
	8uatvgwxfU0Gophs2llZ+0zw63R+HXpk5YSDo8hXVC3nz2L9HpIj
X-Google-Smtp-Source: AGHT+IH8vHXEt7rohBJbbN7OKP60OIDN216n0d2ah1Y2BHFfUgWWLvZXMIjfXlFhDQmaAcBu5FuhJw==
X-Received: by 2002:a05:651c:990:b0:2ec:5172:dbc4 with SMTP id 38308e7fff4ca-2ee8ed8b7efmr6265731fa.12.1720079808427;
        Thu, 04 Jul 2024 00:56:48 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee81c79a73sm4026811fa.45.2024.07.04.00.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:56:47 -0700 (PDT)
Date: Thu, 4 Jul 2024 10:56:45 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Felix Fietkau <nbd@nbd.name>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: net: Define properties at top-level
Message-ID: <c7oamspfai2zd347vbvmwg4lyqw32hfkwwcl2u5trg55apijew@hskr6tm5mfjy>
References: <20240703195827.1670594-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703195827.1670594-2-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_005651_154641_A2385192 
X-CRM114-Status: GOOD (  18.52  )
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

On Wed, Jul 03, 2024 at 01:58:27PM -0600, Rob Herring (Arm) wrote:
> Convention is DT schemas should define all properties at the top-level
> and not inside of if/then schemas. That minimizes the if/then schemas
> and is more future proof.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Drop the parts already applied from Serge
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 28 +++++---

>  .../devicetree/bindings/net/snps,dwmac.yaml   | 67 ++++++++++---------

For the DW *MAC bindings.
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

>  2 files changed, 52 insertions(+), 43 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index 3202dc7967c5..686b5c2fae40 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -68,6 +68,17 @@ properties:
>        Phandle to the syscon node that handles the path from GMAC to
>        PHY variants.
>  
> +  mediatek,pcie-mirror:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the mediatek pcie-mirror controller.
> +
> +  mediatek,pctl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon node that handles the ports slew rate and
> +      driver current.
> +
>    mediatek,sgmiisys:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      minItems: 1
> @@ -131,15 +142,12 @@ allOf:
>  
>          mediatek,infracfg: false
>  
> -        mediatek,pctl:
> -          $ref: /schemas/types.yaml#/definitions/phandle
> -          description:
> -            Phandle to the syscon node that handles the ports slew rate and
> -            driver current.
> -
>          mediatek,wed: false
>  
>          mediatek,wed-pcie: false
> +    else:
> +      properties:
> +        mediatek,pctl: false
>  
>    - if:
>        properties:
> @@ -201,12 +209,10 @@ allOf:
>            minItems: 1
>            maxItems: 1
>  
> -        mediatek,pcie-mirror:
> -          $ref: /schemas/types.yaml#/definitions/phandle
> -          description:
> -            Phandle to the mediatek pcie-mirror controller.
> -
>          mediatek,wed-pcie: false
> +    else:
> +      properties:
> +        mediatek,pcie-mirror: false
>  
>    - if:
>        properties:
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 0ab124324eec..3eb65e63fdae 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -512,6 +512,12 @@ properties:
>      description:
>        Frequency division factor for MDC clock.
>  
> +  snps,tso:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Enables the TSO feature otherwise it will be managed by MAC HW capability
> +      register.
> +
>    mdio:
>      $ref: mdio.yaml#
>      unevaluatedProperties: false
> @@ -595,41 +601,38 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          contains:
> -            enum:
> -              - allwinner,sun7i-a20-gmac
> -              - allwinner,sun8i-a83t-emac
> -              - allwinner,sun8i-h3-emac
> -              - allwinner,sun8i-r40-gmac
> -              - allwinner,sun8i-v3s-emac
> -              - allwinner,sun50i-a64-emac
> -              - loongson,ls2k-dwmac
> -              - loongson,ls7a-dwmac
> -              - ingenic,jz4775-mac
> -              - ingenic,x1000-mac
> -              - ingenic,x1600-mac
> -              - ingenic,x1830-mac
> -              - ingenic,x2000-mac
> -              - qcom,qcs404-ethqos
> -              - qcom,sa8775p-ethqos
> -              - qcom,sc8280xp-ethqos
> -              - qcom,sm8150-ethqos
> -              - snps,dwmac-4.00
> -              - snps,dwmac-4.10a
> -              - snps,dwmac-4.20a
> -              - snps,dwmac-5.10a
> -              - snps,dwmac-5.20
> -              - snps,dwxgmac
> -              - snps,dwxgmac-2.10
> -              - st,spear600-gmac
> +          not:
> +            contains:
> +              enum:
> +                - allwinner,sun7i-a20-gmac
> +                - allwinner,sun8i-a83t-emac
> +                - allwinner,sun8i-h3-emac
> +                - allwinner,sun8i-r40-gmac
> +                - allwinner,sun8i-v3s-emac
> +                - allwinner,sun50i-a64-emac
> +                - loongson,ls2k-dwmac
> +                - loongson,ls7a-dwmac
> +                - ingenic,jz4775-mac
> +                - ingenic,x1000-mac
> +                - ingenic,x1600-mac
> +                - ingenic,x1830-mac
> +                - ingenic,x2000-mac
> +                - qcom,qcs404-ethqos
> +                - qcom,sa8775p-ethqos
> +                - qcom,sc8280xp-ethqos
> +                - qcom,sm8150-ethqos
> +                - snps,dwmac-4.00
> +                - snps,dwmac-4.10a
> +                - snps,dwmac-4.20a
> +                - snps,dwmac-5.10a
> +                - snps,dwmac-5.20
> +                - snps,dwxgmac
> +                - snps,dwxgmac-2.10
> +                - st,spear600-gmac
>  
>      then:
>        properties:
> -        snps,tso:
> -          $ref: /schemas/types.yaml#/definitions/flag
> -          description:
> -            Enables the TSO feature otherwise it will be managed by
> -            MAC HW capability register.
> +        snps,tso: false
>  
>  additionalProperties: true
>  
> -- 
> 2.43.0
> 

