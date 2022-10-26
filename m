Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86553C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 17:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZ+i/SF4l9FMWNRr/cPA8I6Wy/mpZ+a7Vqb6QMxr248=; b=3KcXU5l2ONuuYvlPrAX2fv0i+M
	3OfiKZEloALw28WfcR8a9w5n4ldGNfPmVhpQZUTumx3ZjM14OdkVDD3hFQW9W0+CBuVkT4APUL7/z
	V904sO1NUH+yPqdmD8t/jojfOy/LdLXNZcApBKLyrMXJa+jYE1DH2tZN+KVCbKOil1BpMtHzxjUC2
	cDU0hncuQWahVNgOpSv7KhxVxGVYjw6UstBhbRMh/TnHAyZSW7n6srXWZvsi74mbYyhu8IcXSoYF5
	iJxi2zSfOJKdqtTasKGEGvO/Qm7/HoIX9kXARRs3PCBsC6XKLvd+QtrdfmkD0ll6YirYoA0qMKIrY
	iNiWgOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onkS2-00AQ7j-S1; Wed, 26 Oct 2022 17:44:26 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onkRz-00AQ6b-22; Wed, 26 Oct 2022 17:44:24 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1322d768ba7so21092428fac.5;
        Wed, 26 Oct 2022 10:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZ+i/SF4l9FMWNRr/cPA8I6Wy/mpZ+a7Vqb6QMxr248=;
        b=5wstAZSPiMv64WT1CWU6skclrcX3B7/RUktuWcJslG1QQRGFWrCcngN/4YqjNMkN0c
         86UrpodVB1gEG4FpHxem+3rdJT93D+C6AEjrLSg+V2I8AN4msb80ywQYv//Gvxwn4nQK
         ItKoEE5YAdMvXJZadnbvz2sZD+JfU9m53bgH+PZ5pzc5xbpIU3mpUFQVw9A+je8UFgFv
         r9c/5KvXQ9n5gTzIrF1EAcB9WpBBeMVRVGkNC/h9LTqbT4/qFunP6aOiqjr5rZ2TOzdC
         lJaAuU902PFbvMutLSq17IPfiSITFcHHhE73t5bT5Z1kcr4PPqKSEUfPUgeSZ5/AscxI
         pL+Q==
X-Gm-Message-State: ACrzQf2hzUfLHx5RCzbnKd+ngMFn11ytBWu96ABoXWmBs0zrIq2Ytstn
	73nAfHf1VKLRuB2JzdC1zg==
X-Google-Smtp-Source: AMsMyM67Pw/bp++Kwpi4bAgdItQrAnVSBhLzRwXb2hhebp/wuZMaR60Sn/XNDJMCXdMpka6OF32FZw==
X-Received: by 2002:a05:6870:e98e:b0:12b:8d8d:1116 with SMTP id r14-20020a056870e98e00b0012b8d8d1116mr2981248oao.165.1666806260917;
        Wed, 26 Oct 2022 10:44:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b6-20020a4ae206000000b0044b125e5dabsm2360665oot.35.2022.10.26.10.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 10:44:20 -0700 (PDT)
Received: (nullmailer pid 808914 invoked by uid 1000);
	Wed, 26 Oct 2022 17:44:21 -0000
Date: Wed, 26 Oct 2022 12:44:21 -0500
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, =?iso-8859-1?Q?n=E7_=DCNAL?= <arinc.unal@arinc9.com>, Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v1 net-next 6/7] dt-bindings: net: add generic
 ethernet-switch-port binding
Message-ID: <20221026174421.GA794561-robh@kernel.org>
References: <20221025050355.3979380-1-colin.foster@in-advantage.com>
 <20221025050355.3979380-7-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025050355.3979380-7-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_104423_126989_B0473957 
X-CRM114-Status: GOOD (  23.67  )
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

On Mon, Oct 24, 2022 at 10:03:54PM -0700, Colin Foster wrote:
> The dsa-port.yaml binding had several references that can be common to all
> ethernet ports, not just dsa-specific ones. Break out the generic bindings
> to ethernet-switch-port.yaml they can be used by non-dsa drivers.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> ---
>  .../devicetree/bindings/net/dsa/dsa-port.yaml | 26 +----------
>  .../bindings/net/ethernet-switch-port.yaml    | 44 +++++++++++++++++++
>  .../bindings/net/ethernet-switch.yaml         |  4 +-
>  MAINTAINERS                                   |  1 +
>  4 files changed, 50 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-switch-port.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> index 10ad7e71097b..c5144e733511 100644
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
> @@ -15,12 +15,9 @@ description:
>    Ethernet switch port Description
>  
>  allOf:
> -  - $ref: /schemas/net/ethernet-controller.yaml#
> +  - $ref: /schemas/net/ethernet-switch-port.yaml#
>  
>  properties:
> -  reg:
> -    description: Port number
> -
>    label:
>      description:
>        Describes the label associated with this port, which will become
> @@ -57,25 +54,6 @@ properties:
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
> +
> +required:
> +  - reg
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/net/ethernet-switch.yaml b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
> index fbaac536673d..f698857619da 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
> @@ -36,7 +36,9 @@ patternProperties:
>          type: object
>          description: Ethernet switch ports
>  
> -        $ref: /schemas/net/dsa/dsa-port.yaml#
> +        allOf:
> +          - $ref: /schemas/net/dsa/dsa-port.yaml#
> +          - $ref: ethernet-switch-port.yaml#

dsa-port.yaml references ethernet-switch-port.yaml, so you shouldn't 
need both here.

I imagine what you were trying to do here was say it is either one of 
these, not both. I don't think this is going work for the same reasons I 
mentioned with unevaluatedProperties.

Rob

