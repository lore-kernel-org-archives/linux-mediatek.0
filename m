Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B8DC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 18:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFZemGAiz+864ig6tHEwR4+zzxKN7GhJUHozYh5QjjI=; b=LxmuEMzXMpX1Aob4uIQGrDYjDe
	Bpq/4ZSa44CidrDXgqjt/5f/CVLcM/o2eY8xI2WzykqzzPznUOdjcFzNOTq7RlLC612M9rhhl26MV
	nqjxw2uscp65ZllEeA97OY8EmDSMwdVMlBea4mLPRP4GyA+skZtcgPwXihpyn8DiC61q1OxW//M55
	tNVYD/bgKf9fzg5A7HlmjqfAsJA2eEMPd6DMc8t7GRB3zQc9SShCV3QmXEuQBViLG9fq55VTWuNzS
	5WSY/olh2A0JY6S0bdTfQ7DWSoOr8x1BNKxL56nuKBAuDMbP3Po4OjGzK6mK59/g7Bq8LeZNW4KSC
	xElF+4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or1lx-004oow-8I; Fri, 04 Nov 2022 18:50:33 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or1lt-004ooJ-BT; Fri, 04 Nov 2022 18:50:32 +0000
Received: by mail-oi1-f176.google.com with SMTP id p127so6065090oih.9;
        Fri, 04 Nov 2022 11:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFZemGAiz+864ig6tHEwR4+zzxKN7GhJUHozYh5QjjI=;
        b=yfXBTM1DNBi0vs4lCic02L3pgq5Hl082gsGJc0wW5a5AUhB54uB6N6Dc+fMiI030uH
         n30veJH1QjIFHUjEKes0KX+gkbe+7WxHnq+97dA62Jnt9UO9zuawKF//dR9rJtMusb+R
         r++Yhf6s13q9xxq2K/+gNqy03xslYLsRhUnoqm0rEGmbz5Zs+WwzeT1ng1KVcs78G4Vz
         0S5vQvBlr43XPqW53Cf0EnadE1FrriJx7qFNH7GiX8nR3CSy+cy0ivl8Sdndn0XZEJZ8
         hX5UeVifvY+BRUwk33BIEoA8VnMKqc5bKpbMECxXvfSMAjP4vwCGLsSd+mosIRLTWLwO
         4xuA==
X-Gm-Message-State: ACrzQf2FK8NQRaGr+CZPE509wbtHoWIM4QNnTHx3HhhauWJolkr5rg0F
	Kdk9BKOGLiz03Zyn+B8FmLpurNowsg==
X-Google-Smtp-Source: AMsMyM4NoyUsswYjaKUMH0fuD+Uj0sffbrFfd4AIvYQU1cWGLEOTRHBHp8TuRNKoTVHgwGqgdiwtkw==
X-Received: by 2002:a54:4016:0:b0:35a:3878:f22a with SMTP id x22-20020a544016000000b0035a3878f22amr9656904oie.47.1667587827748;
        Fri, 04 Nov 2022 11:50:27 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 2-20020aca2102000000b0035173c2fddasm1726258oiz.51.2022.11.04.11.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 11:50:27 -0700 (PDT)
Received: (nullmailer pid 2243197 invoked by uid 1000);
	Fri, 04 Nov 2022 18:50:28 -0000
Date: Fri, 4 Nov 2022 13:50:28 -0500
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, =?iso-8859-1?Q?n=E7_=DCNAL?= <arinc.unal@arinc9.com>, Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 net-next 5/6] dt-bindings: net: add generic
 ethernet-switch-port binding
Message-ID: <20221104185028.GB2133300-robh@kernel.org>
References: <20221104045204.746124-1-colin.foster@in-advantage.com>
 <20221104045204.746124-6-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104045204.746124-6-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_115029_433094_71CC5390 
X-CRM114-Status: GOOD (  24.41  )
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

On Thu, Nov 03, 2022 at 09:52:03PM -0700, Colin Foster wrote:
> The dsa-port.yaml binding had several references that can be common to all
> ethernet ports, not just dsa-specific ones. Break out the generic bindings
> to ethernet-switch-port.yaml they can be used by non-dsa drivers.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> ---
> 
> v1 -> v2
>   * Remove accidental addition of
>     "$ref: /schemas/net/ethernet-switch-port.yaml" which should be kept
>     out of dsa-port so that it doesn't get referenced multiple times
>     through both ethernet-switch and dsa-port.
> 
> ---
>  .../devicetree/bindings/net/dsa/dsa-port.yaml | 27 +-----------
>  .../bindings/net/ethernet-switch-port.yaml    | 44 +++++++++++++++++++
>  .../bindings/net/ethernet-switch.yaml         |  4 +-
>  MAINTAINERS                                   |  1 +
>  4 files changed, 49 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-switch-port.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> index 10ad7e71097b..d97fb87cccb0 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/dsa/dsa-port.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Ethernet Switch port Device Tree Bindings
> +title: DSA Switch port Device Tree Bindings
>  
>  maintainers:
>    - Andrew Lunn <andrew@lunn.ch>
> @@ -14,13 +14,7 @@ maintainers:
>  description:
>    Ethernet switch port Description
>  
> -allOf:
> -  - $ref: /schemas/net/ethernet-controller.yaml#
> -
>  properties:
> -  reg:
> -    description: Port number
> -
>    label:
>      description:
>        Describes the label associated with this port, which will become
> @@ -57,25 +51,6 @@ properties:
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
> index 000000000000..cb1e5e12bf0a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-switch-port.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ethernet-switch-port.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ethernet Switch port Device Tree Bindings
> +
> +maintainers:
> +  - Andrew Lunn <andrew@lunn.ch>
> +  - Florian Fainelli <f.fainelli@gmail.com>
> +  - Vivien Didelot <vivien.didelot@gmail.com>
> +
> +description:
> +  Ethernet switch port Description
> +
> +$ref: ethernet-controller.yaml#
> +
> +properties:
> +  reg:
> +    description: Port number
> +
> +  phy-handle: true
> +
> +  phy-mode: true
> +
> +  fixed-link: true
> +
> +  mac-address: true
> +
> +  sfp: true
> +
> +  managed: true
> +
> +  rx-internal-delay-ps: true
> +
> +  tx-internal-delay-ps: true

I know this is just copied, but these have no effect on validation. I 
assume what they are meant to be is these are the subset of 
ethernet-controller.yaml which are allowed, but that would only work 
with 'additionalProperties: false'. That wouldn't work because we also 
want to users to extend this with custom properties. What's needed here 
is a list of properties not allowed:

disallowed-prop: false

Or we can just allow anything from ethernet-controller.yaml and drop 
this list.

> +
> +required:
> +  - reg
> +
> +additionalProperties: true
> +
> +...

