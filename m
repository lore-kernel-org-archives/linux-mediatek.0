Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF600C352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkGehtIKQE8uxV5Z4uBASA+aiRLMN5paI1hFstSLrgQ=; b=al4cc8qQOJGjK4WWx5q1vEoidt
	XQaNSu+p6/6kBMXj73AeGoM2V19Ur2kzTfx1LX+ibH2YPN1C02EQbccVUU48vvsg7sFUvoIHt7iXU
	JnUfnvKJTUL1XR3LAZobMJ+tgpMjk4UXWttXYXiBkroi8Ejl24hjOnwLGnXsdmqS38Ye92xJYRdFC
	4nJJne8w+2+RO2BQrLH7+UU8hdVHHP7PTltEqOYY8HB9BSdMKrl3T2QbiFdEP6ItKcChMFmcAMQeT
	Npn/25Vua59SQZajCf7VBGQvKMql30VQ8BK4ZX150IzJ63iXIEbWUbO3iO0yRmRi2Z6QqfXGR8zBd
	cOgl16tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2aDl-00DSwP-2E; Tue, 06 Dec 2022 15:51:01 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2aDg-00DSgo-PQ; Tue, 06 Dec 2022 15:50:58 +0000
Received: by mail-ej1-x62e.google.com with SMTP id x22so7185689ejs.11;
        Tue, 06 Dec 2022 07:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkGehtIKQE8uxV5Z4uBASA+aiRLMN5paI1hFstSLrgQ=;
        b=TBDwZnBz/4Mon2JP6L6swPkQ7sf+kwIkSX9SwD/IvkprcGQ3pY00vHLqpU4ArVNyVC
         jONmDwZrzN4cHba3tNIgepcthUaSI1APAhhO1WRrV00Yqcn+DdR9sRD1XTCGumiAkhRK
         9tfLjxyuYLHcvEAM8e83zZ4L0MwwR83xLAUR9zyYHx8amYYuBjasy2SAJ1a/Pw5CPaRn
         RjurCkOZxdvKAKkziPcIyXaPjDj5mMuUR7WF1QG3DEtFz7BGsQ7/34cl5mg3mP5VYeq1
         fRTCNEdLhW+JJ7Zzq9RzMTNUHbBT2OCt+VJNLi0Yu+TEkenTNM5A0gdPuzIA6DN0jzjT
         uabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkGehtIKQE8uxV5Z4uBASA+aiRLMN5paI1hFstSLrgQ=;
        b=waNsYCW6E7xFpMp0cvZ5kLtyGRt1DLXvcA3IXutDUH2dXWpBBIaFAJr0eqXfAwtaV2
         Wg8F0okrrn5QznusQxC4IAANZoYC0GXtDQF/61VY7zsTGnY2lvZ4qKrg/AyIQFQXCPVH
         Wr0pxqyLOckgGBLfZu1+t4V5DhLxwI+ZzcO+pI4wOhbc7N296AoS3Rr9PJcsMtMn99lW
         pMxwMwPCZI/3UpzZMJFa825+dCqc1iOijOPt+uSz9HUTEWu9vjjcySPaLm/9yn6nIzEV
         q9IODfee2OdnbSKTbFSHYjVnFhpCeMMG6C/zs3oPboQ/I/7+/alA4oZgjxPmodCPPnWJ
         JFwQ==
X-Gm-Message-State: ANoB5pmBOR6+0/TCWxndnBIGZR6HKqIZReuiL19c5hwoCy5B2P1puKJi
	rhB3uL0MQZLDm/YrlJir7Qw=
X-Google-Smtp-Source: AA0mqf5Wotg5UVEAMIiAbOYNAEvmOAnCLhajHTyN0396nlcqXTN6Vv3F2TQlD45B7NeIHFHOS1FltQ==
X-Received: by 2002:a17:906:5649:b0:7ad:a2ef:c62 with SMTP id v9-20020a170906564900b007ada2ef0c62mr12075176ejr.126.1670341852933;
        Tue, 06 Dec 2022 07:50:52 -0800 (PST)
Received: from skbuf ([188.26.184.215])
        by smtp.gmail.com with ESMTPSA id du1-20020a17090772c100b007c07909eb9asm7523498ejc.1.2022.12.06.07.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 07:50:52 -0800 (PST)
Date: Tue, 6 Dec 2022 17:50:49 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Marek Vasut <marex@denx.de>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Linus Walleij <linus.walleij@linaro.org>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	George McCollister <george.mccollister@gmail.com>
Subject: Re: [PATCH v4 net-next 8/9] dt-bindings: net: add generic
 ethernet-switch-port binding
Message-ID: <20221206155049.erpgwrvt5gzdf2e6@skbuf>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-9-colin.foster@in-advantage.com>
 <20221202204559.162619-9-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202204559.162619-9-colin.foster@in-advantage.com>
 <20221202204559.162619-9-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_075056_892212_EDCBF108 
X-CRM114-Status: GOOD (  24.24  )
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

On Fri, Dec 02, 2022 at 12:45:58PM -0800, Colin Foster wrote:
> The dsa-port.yaml binding had several references that can be common to all
> ethernet ports, not just dsa-specific ones. Break out the generic bindings
> to ethernet-switch-port.yaml they can be used by non-dsa drivers.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> 
> v3 -> v4
>   * Add Florian Reviewed tag
> 
> v2 -> v3
>   * Change dsa-port title from "DSA Switch port Device Tree Bindings"
>     to "Generic DSA Switch port"
>   * Add reference to ethernet-switch-port.yaml# in dsa-port.yaml
>   * Change title of ethernet-switch-port.yaml from "Ethernet Switch
>     port Device Tree Bindings" to "Generic Ethernet Switch port"
>   * Remove most properties from ethernet-switch-port.yaml. They're
>     all in ethernet-controller, and are all allowed.
>   * ethernet-switch.yaml now only references ethernet-switch-port.yaml#
>     under the port node.
> 
> v1 -> v2
>   * Remove accidental addition of
>     "$ref: /schemas/net/ethernet-switch-port.yaml" which should be kept
>     out of dsa-port so that it doesn't get referenced multiple times
>     through both ethernet-switch and dsa-port.
> 
> ---
>  .../devicetree/bindings/net/dsa/dsa-port.yaml | 24 ++----------------
>  .../bindings/net/ethernet-switch-port.yaml    | 25 +++++++++++++++++++
>  .../bindings/net/ethernet-switch.yaml         |  6 +----
>  MAINTAINERS                                   |  1 +
>  4 files changed, 29 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-switch-port.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> index 9abb8eba5fad..5b457f41273a 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/dsa/dsa-port.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Ethernet Switch port Device Tree Bindings
> +title: Generic DSA Switch port

What are the capitalization rules in titles? Looks odd that "port" is
lowercase but "switch" isn't.

>  
>  maintainers:
>    - Andrew Lunn <andrew@lunn.ch>
> @@ -14,8 +14,7 @@ maintainers:
>  description:
>    Ethernet switch port Description
>  
> -allOf:
> -  - $ref: /schemas/net/ethernet-controller.yaml#
> +$ref: /schemas/net/ethernet-switch-port.yaml#
>  
>  properties:
>    reg:
> @@ -58,25 +57,6 @@ properties:
>        - rtl8_4t
>        - seville
>  
> -  phy-handle: true
> -
> -  phy-mode: true
> -
> -  fixed-link: true
> -
> -  mac-address: true
> -
> -  sfp: true
> -
> -  managed: true
> -
> -  rx-internal-delay-ps: true
> -
> -  tx-internal-delay-ps: true
> -
> -required:
> -  - reg
> -
>  # CPU and DSA ports must have phylink-compatible link descriptions
>  if:
>    oneOf:
> diff --git a/Documentation/devicetree/bindings/net/ethernet-switch-port.yaml b/Documentation/devicetree/bindings/net/ethernet-switch-port.yaml
> new file mode 100644
> index 000000000000..3d7da6916fb8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-switch-port.yaml
> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ethernet-switch-port.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Ethernet Switch port
> +
> +maintainers:
> +  - Andrew Lunn <andrew@lunn.ch>
> +  - Florian Fainelli <f.fainelli@gmail.com>
> +  - Vivien Didelot <vivien.didelot@gmail.com>
> +
> +description:
> +  Ethernet switch port Description

Sounds a bit too "lorem ipsum dolor sit amet". You can say that a port
is a component of a switch which manages one MAC, and can pass Ethernet
frames.

> +
> +$ref: ethernet-controller.yaml#
> +
> +properties:
> +  reg:
> +    description: Port number
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/net/ethernet-switch.yaml b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
> index afeb9ffd84c8..1e8b7649a9b2 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
> @@ -40,10 +40,6 @@ patternProperties:
>          type: object
>          description: Ethernet switch ports
>  
> -        $ref: ethernet-controller.yaml#
> -
> -        additionalProperties: true
> -
>  oneOf:
>    - required:
>        - ports
> @@ -60,7 +56,7 @@ $defs:
>      patternProperties:
>        "^(ethernet-)?port@[0-9]+$":
>          description: Ethernet switch ports
> -        $ref: ethernet-controller.yaml#
> +        $ref: ethernet-switch-port.yaml#
>          unevaluatedProperties: false
>  
>  ...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d574cae901b3..fe5f52c9864a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14337,6 +14337,7 @@ M:	Florian Fainelli <f.fainelli@gmail.com>
>  M:	Vladimir Oltean <olteanv@gmail.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/net/dsa/
> +F:	Documentation/devicetree/bindings/net/ethernet-switch-port.yaml
>  F:	Documentation/devicetree/bindings/net/ethernet-switch.yaml
>  F:	drivers/net/dsa/
>  F:	include/linux/dsa/
> -- 
> 2.25.1
> 


