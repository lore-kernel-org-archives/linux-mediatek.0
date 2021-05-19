Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D4DC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 22:05:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BBDD611BD
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 22:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BBDD611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SavkYGLDimVPduf9EbljdCElTek7hByx16t63aKBzms=; b=d9wU4SoVMDRoxSfXkRhN0dbw5
	/ohe49Ercj0frC4nrglhqR+mb35fUmRITdwuOeGyn/4Y/tOZJreGTJDAXXhlQP4r9ggR3VyHdXOmF
	hD+PzpKyuJBGoXV/n9lE8j6NrUL8uzC3rOeN1oh1HQkmS3tMRSWlqmtTsWVfXAXZn/XbQdIrtr/GY
	QfJtnzSNsMdKopjGcKkqy/uSA7W34q6CzFX4O8s+Pz2LUBhB6rAa5IfjXn51R79zLOqQlw8E8YZpr
	+Km0niZ/pXOnn5EUakW9yT+V2WH5e/v1F3kXBwGLwhW7DKc9rl6on7dL1kS7Xtfq/6O9WIvnW0FJE
	9bdknle+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljUJ1-005CiS-5A; Wed, 19 May 2021 22:04:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljUIm-005Ch6-SX; Wed, 19 May 2021 22:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4Qxjx7gPKuv7WGl/fdRuh5TjzSYI1WNwx1W5A71DrYw=; b=ES7CwUTch69LQlRqSAHvCnPEd2
 9JIWODTyMOiRWtYABWanrvb0Q00OT5uonBhv5fD5yKcl2o9P9TGIUuv2DDVSY83fm8kZWA3hdKXLx
 KikzeWvkNdFfY9Rav7UiWCnxklZhAFH7OqyfuJYmUFtaUru+SXe23so/cvSCOr/QPrbcFstleh5ym
 VVzb9Zc8lHzgdabbZH3lPlbLjNs0rXV8fC75RqqDJ5lxSb+WMGn+PFJo+Olcz1m6rA8043LBRaBEx
 nXXxzD6UnnlJwp9VEM00j5B1taNcsaYfTDfYKPkNDSZsxPsSm46Fi5tzRiW2eLl6ofVknJ7qfkcFc
 KCdWYguQ==;
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljUIk-00FoY2-1l; Wed, 19 May 2021 22:04:27 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so13127454otg.2; 
 Wed, 19 May 2021 15:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4Qxjx7gPKuv7WGl/fdRuh5TjzSYI1WNwx1W5A71DrYw=;
 b=elBf3SFYtSmJRDNsFRAqTOLXq8qSde0i9kRKpKgh7KX6b2P5DrnFqf5vY97KZ10wSP
 c4xYaUvCzTv5Qshld58LIRDHVUTVh69+AG/Pfnnmde/jzjcmtTZ5q72BYNMC1FQFwSf+
 kKAkIxm/1kFNrB4hI2cEiKqGr4/YxGbvdw/dPZqb/sjRwz5Shl8oX6GLOuvmo0qqYsHk
 hJv5GHa5J55UdMaGFkuB1myTiMbguR0na/CQT0jhmLeqsZVIl+uD8qjdIErXgFB9cQJd
 1XO99LiqeoAPPRmROgWcBMOnQMK17n6KI1+W8Jd0XrtV0YPzSqWjjOA/thzgvFZmTIL5
 YxCA==
X-Gm-Message-State: AOAM533kCYhCiyQyQQ8SjlrYYvysaHjvOTS11Hxwb4kJQANZYfyrrM3u
 LYKQ49Y4xwBp/1WRE6LGaA==
X-Google-Smtp-Source: ABdhPJxNQG8BfqDgptett9J/WmF6f63g6IaewjwZ5C5UO1H0AxgNr1cBxWbDBUOwYk8H8qTcx7FSGg==
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr1384580oti.23.1621461863492; 
 Wed, 19 May 2021 15:04:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x31sm228279ota.24.2021.05.19.15.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 15:04:22 -0700 (PDT)
Received: (nullmailer pid 3741422 invoked by uid 1000);
 Wed, 19 May 2021 22:04:21 -0000
Date: Wed, 19 May 2021 17:04:21 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 mkorpershoek@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: rng: mediatek: convert to yaml schema
Message-ID: <20210519220421.GA3738290@robh.at.kernel.org>
References: <20210518112250.2146819-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518112250.2146819-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_150426_122751_82DF3ADF 
X-CRM114-Status: GOOD (  20.01  )
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

On Tue, May 18, 2021 at 01:22:49PM +0200, Fabien Parent wrote:
> Convert the RNG binding for MediaTek to use YAML schema.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../devicetree/bindings/rng/mtk-rng.txt       | 22 --------
>  .../devicetree/bindings/rng/mtk-rng.yaml      | 53 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rng/mtk-rng.txt
>  create mode 100644 Documentation/devicetree/bindings/rng/mtk-rng.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.txt b/Documentation/devicetree/bindings/rng/mtk-rng.txt
> deleted file mode 100644
> index dfdcb5cd2ea8..000000000000
> --- a/Documentation/devicetree/bindings/rng/mtk-rng.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Device-Tree bindings for Mediatek random number generator
> -found in MediaTek SoC family
> -
> -Required properties:
> -- compatible	    : Should be
> -			"mediatek,mt7622-rng", 	"mediatek,mt7623-rng" : for MT7622
> -			"mediatek,mt7629-rng",  "mediatek,mt7623-rng" : for MT7629
> -			"mediatek,mt7623-rng" : for MT7623
> -			"mediatek,mt8516-rng", "mediatek,mt7623-rng" : for MT8516
> -- clocks	    : list of clock specifiers, corresponding to
> -		      entries in clock-names property;
> -- clock-names	    : Should contain "rng" entries;
> -- reg 		    : Specifies base physical address and size of the registers
> -
> -Example:
> -
> -rng: rng@1020f000 {
> -	compatible = "mediatek,mt7623-rng";
> -	reg = <0 0x1020f000 0 0x1000>;
> -	clocks = <&infracfg CLK_INFRA_TRNG>;
> -	clock-names = "rng";
> -};
> diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
> new file mode 100644
> index 000000000000..d9731f0ae47d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/rng/mtk-rng.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Random number generator
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt7623-rng
> +      - items:
> +          - const: mediatek,mt7622-rng
> +          - const: mediatek,mt7623-rng
> +      - items:
> +          - const: mediatek,mt7629-rng
> +          - const: mediatek,mt7623-rng
> +      - items:
> +          - const: mediatek,mt8516-rng
> +          - const: mediatek,mt7623-rng

The last 3 can be:

- items:
    - enum:
        - mediatek,mt7622-rng
        - mediatek,mt7629-rng
        - mediatek,mt8516-rng
    - const: mediatek,mt7623-rng

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: rng
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt2701-clk.h>
> +    rng: rng@1020f000 {
> +            compatible = "mediatek,mt7623-rng";
> +            reg = <0x1020f000 0x1000>;
> +            clocks = <&infracfg CLK_INFRA_TRNG>;
> +            clock-names = "rng";
> +    };
> -- 
> 2.31.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
