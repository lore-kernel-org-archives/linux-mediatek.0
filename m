Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E5BC27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 15:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhZutRH62J+/FRWi2pPQOnLif3nNehoGYOCj0XwfrU0=; b=QiFmqbR9+zUhSeJDsiD+/iKNob
	O9960Jbz6GY5FJPEZ4ISBzQ5ifgXgeaeKYAYnOJEK56mTvFT9ZIbWrbaNBwmLVo3P6GmewwQibV8z
	k7FECIcBCSDKLT49cplLtLrYKsUhkFjoLnoCfFidFsQG1VgjyIB6THXcgX5keXgFb8+YLxMte+lCv
	P3RpvEamG01+kaiAeviX/aGY1HnWnDMeyZo73MEmfzazgnUlcMKmUj8/eUjqgg5Zfh69dCNm8eQ+4
	R9mcoBF5woHrzXXAY8B6EqAvSms6uqPf7cbhudLzzKFJdkixjpKN+afq5dLLk5RHtyL/BC3MKbV49
	jgMotw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUDf-00000007KAC-3FK8;
	Wed, 26 Jun 2024 15:05:59 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUDX-00000007K8f-11Dn;
	Wed, 26 Jun 2024 15:05:52 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52cdf579dd2so4376693e87.3;
        Wed, 26 Jun 2024 08:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719414349; x=1720019149; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhZutRH62J+/FRWi2pPQOnLif3nNehoGYOCj0XwfrU0=;
        b=Yr+6gsPSaykJ/jFH/8tF/rlf7XGyHnhq/7aQSl3lZOHpafVZWglWrKxfSClJOX1Crz
         IskYFPvfDD5w3s5SwLP3DvNd6Q4p3JNIMgVd7uIsQIR3jy/YN3nm3/Lq9M5ra8xhppmR
         9TLccJMY4vBOtzaZo2Lgkh7fiMvGZ1s3ysJqdzLqWEYVIXL2kru4XoU0v+Y8Z6mVK/h7
         b5CPtwmZHe6LBjZuBsUtRJl4fBfHowIKvaS6Ey6iK15sNyhM5S6gghqq6NFOWTTDU7NI
         b17Im/ywmzFw7NirfbgjItP4JoR43UfCidR8YS85QOmCfj/bfj7T7XuQ1YHw7uWydvV1
         YUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719414349; x=1720019149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhZutRH62J+/FRWi2pPQOnLif3nNehoGYOCj0XwfrU0=;
        b=dRtJt42HWIIH1F/eCIeES6RHupEOCevqE/gkcXxDreqFZ6Tu5C0TSeMtnOsRANc3HB
         6qHJ+A9Ojw6uX6HbTqyO3WYNjHtvBDYiRRjBuodLE+P5/Yyuq8mUthT8axJN8y1+MeZH
         y/gLvAbjM4HqixLe2WjX6gOPK6cc2/cyLwSS1LXbrnHL+XMExZIiHFd9rUyEDfm/uZmm
         wgMg/nbHHm5OLbxiBz6hPqY7qLzXlYDCr8kNOYnlKGANCOiF/0QXgr0d+xSyKO+QJJCr
         TGMSWCc2G8BA92m3adQgH39f2mw9Ij9FLXPHZxnQAOT7GU13B2L24JEUkc1oyp+PEZ5P
         KPUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA1ht3ynRvG9aJus9Av7pwqiTAjsTtydu4xO1FFtQeTWG5ja31UC4tXUq2rSXJNZlOBFdNL/p1EpoGbjvk3Zj42W1HZ/akogiyxhutlkkyyTFsUU0v8sXSSG7rwthvCRsN34gNm6RDLCHZWAdhd7vg3GJMv1vBrxU=
X-Gm-Message-State: AOJu0YxFRMHzZu9T/9ARIfpeD/75xrG1EJBiSPDFi3M0oPJaR6MKUmGV
	3VCkxIo4EtPidyCKI/MvikCuezRWX/lzxyRRiaPrIFNBgJBd9HS0
X-Google-Smtp-Source: AGHT+IFfvQuvbFtUymfS+v+q1U8+HqmXwVg3jhbZkUkyGIolFmwzG7d9zEm7xC7zyYhb9iSQcMXKDQ==
X-Received: by 2002:a05:6512:32a4:b0:52c:d647:1375 with SMTP id 2adb3069b0e04-52cdf826725mr7522240e87.66.1719414348270;
        Wed, 26 Jun 2024 08:05:48 -0700 (PDT)
Received: from mobilestation ([213.79.110.82])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b48c1sm1592588e87.29.2024.06.26.08.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 08:05:47 -0700 (PDT)
Date: Wed, 26 Jun 2024 18:05:45 +0300
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
Subject: Re: [PATCH net-next] dt-bindings: net: Define properties at top-level
Message-ID: <gr7rgy7cptnpj2rkeufhgqkve4ytqddpts6gdekeszoq7znwf2@ivyjpaiyxruk>
References: <20240625215442.190557-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="v3mh3gbsjgv5bejq"
Content-Disposition: inline
In-Reply-To: <20240625215442.190557-2-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_080551_334924_E9A1F872 
X-CRM114-Status: GOOD (  27.14  )
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


--v3mh3gbsjgv5bejq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob

On Tue, Jun 25, 2024 at 03:54:41PM -0600, Rob Herring (Arm) wrote:
> Convention is DT schemas should define all properties at the top-level
> and not inside of if/then schemas. That minimizes the if/then schemas
> and is more future proof.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml |  28 +--

>  .../devicetree/bindings/net/snps,dwmac.yaml   | 167 +++++++++---------

For Synopsys DW MACs you can just move the PBL-properties constraints to
the top-level schema part with no compatible-based conditional
validation left. It's because the DMA PBL settings are available on all the
DW MAC IP-cores (DW MAC, DW GMAC, DW QoS Eth, DW XGMAC, DW XLGMAC).
Moreover the STMMAC driver responsible for the DW MAC device handling
parses the pbl* properties for all IP-cores irrespective from the
device compatible string.

Alternatively you can just merge in the attached patch, which BTW you
have already reviewed sometime ago.

-Serge(y)

>  2 files changed, 105 insertions(+), 90 deletions(-)
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
> index 21cc27e75f50..023865b6f497 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -485,6 +485,38 @@ properties:
>      description:
>        Frequency division factor for MDC clock.
>  
> +  snps,pbl:
> +    description:
> +      Programmable Burst Length (tx and rx)
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8, 16, 32]
> +
> +  snps,txpbl:
> +    description:
> +      Tx Programmable Burst Length. If set, DMA tx will use this value rather
> +      than snps,pbl.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8, 16, 32]
> +
> +  snps,rxpbl:
> +    description:
> +      Rx Programmable Burst Length. If set, DMA rx will use this value rather
> +      than snps,pbl.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8, 16, 32]
> +
> +  snps,no-pbl-x8:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Don\'t multiply the pbl/txpbl/rxpbl values by 8. For core rev < 3.50,
> +      don\'t multiply the values by 4.
> +
> +  snps,tso:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Enables the TSO feature otherwise it will be managed by MAC HW capability
> +      register.
> +
>    mdio:
>      $ref: mdio.yaml#
>      unevaluatedProperties: false
> @@ -568,95 +600,72 @@ allOf:
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
> -              - ingenic,jz4775-mac
> -              - ingenic,x1000-mac
> -              - ingenic,x1600-mac
> -              - ingenic,x1830-mac
> -              - ingenic,x2000-mac
> -              - qcom,sa8775p-ethqos
> -              - qcom,sc8280xp-ethqos
> -              - snps,dwmac-3.50a
> -              - snps,dwmac-4.10a
> -              - snps,dwmac-4.20a
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
> +                - ingenic,jz4775-mac
> +                - ingenic,x1000-mac
> +                - ingenic,x1600-mac
> +                - ingenic,x1830-mac
> +                - ingenic,x2000-mac
> +                - qcom,sa8775p-ethqos
> +                - qcom,sc8280xp-ethqos
> +                - snps,dwmac-3.50a
> +                - snps,dwmac-4.10a
> +                - snps,dwmac-4.20a
> +                - snps,dwmac-5.20
> +                - snps,dwxgmac
> +                - snps,dwxgmac-2.10
> +                - st,spear600-gmac
>  
>      then:
>        properties:
> -        snps,pbl:
> -          description:
> -            Programmable Burst Length (tx and rx)
> -          $ref: /schemas/types.yaml#/definitions/uint32
> -          enum: [1, 2, 4, 8, 16, 32]
> -
> -        snps,txpbl:
> -          description:
> -            Tx Programmable Burst Length. If set, DMA tx will use this
> -            value rather than snps,pbl.
> -          $ref: /schemas/types.yaml#/definitions/uint32
> -          enum: [1, 2, 4, 8, 16, 32]
> -
> -        snps,rxpbl:
> -          description:
> -            Rx Programmable Burst Length. If set, DMA rx will use this
> -            value rather than snps,pbl.
> -          $ref: /schemas/types.yaml#/definitions/uint32
> -          enum: [1, 2, 4, 8, 16, 32]
> -
> -        snps,no-pbl-x8:
> -          $ref: /schemas/types.yaml#/definitions/flag
> -          description:
> -            Don\'t multiply the pbl/txpbl/rxpbl values by 8. For core
> -            rev < 3.50, don\'t multiply the values by 4.
> +        snps,pbl: false
> +        snps,txpbl: false
> +        snps,rxpbl: false
> +        snps,no-pbl-x8: false
>  
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
> 

--v3mh3gbsjgv5bejq
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-dt-bindings-net-dwmac-Validate-PBL-for-all-IP-cores.patch"

From 7222d63947e61e6ef82eb72f2110d62d68222147 Mon Sep 17 00:00:00 2001
From: Serge Semin <fancer.lancer@gmail.com>
Date: Sun, 22 Nov 2020 22:17:40 +0300
Subject: [PATCH v2] dt-bindings: net: dwmac: Validate PBL for all IP-cores

Indeed the maximum DMA burst length can be programmed not only for DW
xGMACs, Allwinner EMACs and Spear SoC GMAC, but in accordance with [1, 2,
3] for Generic DW *MAC IP-cores. Moreover the STMMAC driver parses the
property and then apply the configuration for all supported DW MAC
devices. All of that makes the property being available for all IP-cores
the bindings supports. Let's make sure the PBL-related properties are
validated for all of them by the common DW MAC DT schema.

[1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
    October 2013, p.378.

[2] DesignWare Cores Ethernet Quality-of-Service Databook, Revision 5.10a,
    December 2017, p.1223.

[3] DesignWare Cores XGMAC - 10G Ethernet MAC Databook, Revision 2.11a,
    September 2015, p.469-473.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v1:
- Use correct syntax of the JSON pointers, so the later would begin
  with a '/' after the '#'.

Changelog v2:
- Fix invalid constraints defined after movement. (@DT-bot)
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 80 ++++++-------------
 1 file changed, 26 insertions(+), 54 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 5a39d931e429..509086b76211 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -447,6 +447,32 @@ properties:
     description:
       Use Address-Aligned Beats
 
+  snps,pbl:
+    description:
+      Programmable Burst Length (tx and rx)
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 16, 32]
+
+  snps,txpbl:
+    description:
+      Tx Programmable Burst Length. If set, DMA tx will use this
+      value rather than snps,pbl.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 16, 32]
+
+  snps,rxpbl:
+    description:
+      Rx Programmable Burst Length. If set, DMA rx will use this
+      value rather than snps,pbl.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 16, 32]
+
+  snps,no-pbl-x8:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Don\'t multiply the pbl/txpbl/rxpbl values by 8. For core
+      rev < 3.50, don\'t multiply the values by 4.
+
   snps,fixed-burst:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -577,60 +603,6 @@ dependencies:
 
 allOf:
   - $ref: ethernet-controller.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - allwinner,sun7i-a20-gmac
-              - allwinner,sun8i-a83t-emac
-              - allwinner,sun8i-h3-emac
-              - allwinner,sun8i-r40-gmac
-              - allwinner,sun8i-v3s-emac
-              - allwinner,sun50i-a64-emac
-              - ingenic,jz4775-mac
-              - ingenic,x1000-mac
-              - ingenic,x1600-mac
-              - ingenic,x1830-mac
-              - ingenic,x2000-mac
-              - qcom,sa8775p-ethqos
-              - qcom,sc8280xp-ethqos
-              - snps,dwmac-3.50a
-              - snps,dwmac-4.10a
-              - snps,dwmac-4.20a
-              - snps,dwmac-5.20
-              - snps,dwxgmac
-              - snps,dwxgmac-2.10
-              - st,spear600-gmac
-
-    then:
-      properties:
-        snps,pbl:
-          description:
-            Programmable Burst Length (tx and rx)
-          $ref: /schemas/types.yaml#/definitions/uint32
-          enum: [1, 2, 4, 8, 16, 32]
-
-        snps,txpbl:
-          description:
-            Tx Programmable Burst Length. If set, DMA tx will use this
-            value rather than snps,pbl.
-          $ref: /schemas/types.yaml#/definitions/uint32
-          enum: [1, 2, 4, 8, 16, 32]
-
-        snps,rxpbl:
-          description:
-            Rx Programmable Burst Length. If set, DMA rx will use this
-            value rather than snps,pbl.
-          $ref: /schemas/types.yaml#/definitions/uint32
-          enum: [1, 2, 4, 8, 16, 32]
-
-        snps,no-pbl-x8:
-          $ref: /schemas/types.yaml#/definitions/flag
-          description:
-            Don\'t multiply the pbl/txpbl/rxpbl values by 8. For core
-            rev < 3.50, don\'t multiply the values by 4.
-
   - if:
       properties:
         compatible:
-- 
2.43.0


--v3mh3gbsjgv5bejq--

