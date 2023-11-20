Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFD1C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSW3E3xtPlVB/b2ss56BvmwvXcGMmo75cWYtJjq8ld8=; b=oRcx87FjsAqdQFdKEVGJkCWniJ
	Fw6dFClDb1THfZ3abWEtgLWYaVDoacL2uszrmeMTzagywGs9acWgzVZSLJPvOlyfJRPTcuyzLcraH
	NHuFSQjNA/47LqkcJ879IP5FwdmGGAtmwInyoxPL9tp6+1J+CLC7TMn80C8IHpFIsfCTblNvjU/tu
	COXkoCkn0XpDaZbdXzo/7XX0OgPhBFHOpKts6zrUELYasUKHJb5WBK+lazKTmhHiCQGhyvVKB8ypU
	pmHySW4jT/bhHZ/c6QXO664G7+e5aBUjSnDbBI2zGSQPd1+YTXhj0s7S5+2s8sKqeeWbQbaHDl8E6
	QQeHtceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5870-00Dpke-09;
	Mon, 20 Nov 2023 17:31:06 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r586v-00Dpcx-00;
	Mon, 20 Nov 2023 17:31:03 +0000
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7a94c5538aeso147299939f.3;
        Mon, 20 Nov 2023 09:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501453; x=1701106253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSW3E3xtPlVB/b2ss56BvmwvXcGMmo75cWYtJjq8ld8=;
        b=xMaWstPh7E+P4Te5C4Uln14lRMOdz27HPssyu9Qr98ziqR7l8feiXmE0hx5cS+yc4R
         emforndDZGbnFHgPh0J6MQuEKrIN+OXeVEsKL1Bvu/sW8Ss2h3rfu4YwGa1g2AKO2dZJ
         3iUiRpOGNTODL43rO8CUAQfN6gsQAihbdE9LG6M+35bzhjT/26mHY5mgji+JhTyjszCX
         jfGXFn17YyhcZWRNydzqFfBOje0HxfNrh+bl+jv6k3E+WurF3g+DT/ENLK2+YWbmdrF3
         us19fb0qccFhSEuBWgTw0ykOgU2aN18TRpwaAmDoXErC4NLKTwg5B9X7L6uDfm/lXNaf
         LKDw==
X-Gm-Message-State: AOJu0Yx9RS13CfAuFyr8HEV6Ydf8VgPiINb5wmq2txXKh22EfBg2F2G8
	EQa274uylWRyrycoNLodCQ==
X-Google-Smtp-Source: AGHT+IEqf3gdWs75Wxke7gxzZzNuRkHoVMvLJ/fF9+7hFDSkhKvpLh/DRcbrtvhjf3YBRL53EDCZ8w==
X-Received: by 2002:a5d:8199:0:b0:798:2415:1189 with SMTP id u25-20020a5d8199000000b0079824151189mr10731727ion.12.1700501453017;
        Mon, 20 Nov 2023 09:30:53 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u13-20020a056638134d00b00466593d380fsm751194jad.53.2023.11.20.09.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 09:30:52 -0800 (PST)
Received: (nullmailer pid 2441844 invoked by uid 1000);
	Mon, 20 Nov 2023 17:30:49 -0000
Date: Mon, 20 Nov 2023 10:30:49 -0700
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	David Epping <david.epping@missinglinkelectronics.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Harini Katakam <harini.katakam@amd.com>, Simon Horman <horms@kernel.org>, 
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 02/14] dt-bindings: net: move PHY modes to
 common PHY mode types definition
Message-ID: <20231120173049.GA2378814-robh@kernel.org>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120135041.15259-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_093101_519096_324C0945 
X-CRM114-Status: GOOD (  27.66  )
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

On Mon, Nov 20, 2023 at 02:50:29PM +0100, Christian Marangi wrote:
> Move PHY modes from ethernet-controller schema to dedicated common PHY
> mode types definition. This is needed to have a centralized place to
> define PHY interface mode and permit usage and reference of these modes
> in other schemas.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/ethernet-controller.yaml     |  47 +------
>  .../bindings/net/ethernet-phy-mode-types.yaml | 132 ++++++++++++++++++
>  2 files changed, 133 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 9f6a5ccbcefe..40c1daff2a48 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -55,55 +55,10 @@ properties:
>      const: mac-address
>  
>    phy-connection-type:
> +    $ref: /schemas/net/ethernet-phy-mode-types.yaml#definitions/phy-connection-type

You need a '/' after '#' or it is not a JSON pointer.

>      description:
>        Specifies interface type between the Ethernet device and a physical
>        layer (PHY) device.
> -    enum:
> -      # There is not a standard bus between the MAC and the PHY,
> -      # something proprietary is being used to embed the PHY in the
> -      # MAC.
> -      - internal
> -      - mii
> -      - gmii
> -      - sgmii
> -      - psgmii
> -      - qsgmii
> -      - qusgmii
> -      - tbi
> -      - rev-mii
> -      - rmii
> -      - rev-rmii
> -      - moca
> -
> -      # RX and TX delays are added by the MAC when required
> -      - rgmii
> -
> -      # RGMII with internal RX and TX delays provided by the PHY,
> -      # the MAC should not add the RX or TX delays in this case
> -      - rgmii-id
> -
> -      # RGMII with internal RX delay provided by the PHY, the MAC
> -      # should not add an RX delay in this case
> -      - rgmii-rxid
> -
> -      # RGMII with internal TX delay provided by the PHY, the MAC
> -      # should not add an TX delay in this case
> -      - rgmii-txid
> -      - rtbi
> -      - smii
> -      - xgmii
> -      - trgmii
> -      - 1000base-x
> -      - 2500base-x
> -      - 5gbase-r
> -      - rxaui
> -      - xaui
> -
> -      # 10GBASE-KR, XFI, SFI
> -      - 10gbase-kr
> -      - usxgmii
> -      - 10gbase-r
> -      - 25gbase-r
>  
>    phy-mode:
>      $ref: "#/properties/phy-connection-type"
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml
> new file mode 100644
> index 000000000000..6d15743b4ffa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ethernet-phy-mode-types.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ethernet PHY Common Mode Types
> +
> +maintainers:
> +  - David S. Miller <davem@davemloft.net>
> +
> +definitions:

Use '$defs'

'definitions' is special in that we don't process it at all. That's 
probably why you ended up with this overly complicated schema below.

But really, there's no need to use $defs or definitions at all here. 
Just put it under 'properties' And move the references up a level (i.e. 
to the node, not a property).

> +  phy-connection-type:
> +    # const: "internal"
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string
> +      - oneOf:
> +        # There is not a standard bus between the MAC and the PHY,
> +        # something proprietary is being used to embed the PHY in the
> +        # MAC.
> +        - items:

'items' is for arrays, but you just said this is a 'string', not 
'string-array'. 

> +            - type: string

Already covered by the type $ref.

This can all be expressed with just 1 'enum' as it was before.

> +              const: internal
> +        - items:
> +            - type: string
> +              const: mii
> +        - items:
> +            - type: string
> +              const: gmii
> +        - items:
> +            - type: string
> +              const: sgmii
> +        - items:
> +            - type: string
> +              const: psgmii
> +        - items:
> +            - type: string
> +              const: qsgmii
> +        - items:
> +            - type: string
> +              const: qusgmii
> +        - items:
> +            - type: string
> +              const: tbi
> +        - items:
> +            - type: string
> +              const: rev-mii
> +        - items:
> +            - type: string
> +              const: rmii
> +        - items:
> +            - type: string
> +              const: rev-rmii
> +        - items:
> +            - type: string
> +              const: moca
> +
> +        # RX and TX delays are added by the MAC when required
> +        - items:
> +            - type: string
> +              const: rgmii
> +
> +        # RGMII with internal RX and TX delays provided by the PHY,
> +        # the MAC should not add the RX or TX delays in this case
> +        - items:
> +            - type: string
> +              const: rgmii-id
> +
> +        # RGMII with internal RX delay provided by the PHY, the MAC
> +        # should not add an RX delay in this case
> +        - items:
> +            - type: string
> +              const: rgmii-rxid
> +
> +        # RGMII with internal TX delay provided by the PHY, the MAC
> +        # should not add an TX delay in this case
> +        - items:
> +            - type: string
> +              const: rgmii-txid
> +
> +        - items:
> +            - type: string
> +              const: rtbi
> +
> +        - items:
> +            - type: string
> +              const: smii
> +
> +        - items:
> +            - type: string
> +              const: xgmii
> +
> +        - items:
> +            - type: string
> +              const: trgmii
> +
> +        - items:
> +            - type: string
> +              const: 1000base-x
> +
> +        - items:
> +            - type: string
> +              const: 2500base-x
> +
> +        - items:
> +            - type: string
> +              const: 5gbase-r
> +
> +        - items:
> +            - type: string
> +              const: rxaui
> +
> +        - items:
> +            - type: string
> +              const: xaui
> +
> +        # 10GBASE-KR, XFI, SFI
> +        - items:
> +            - type: string
> +              const: 10gbase-kr
> +
> +        - items:
> +            - type: string
> +              const: usxgmii
> +
> +        - items:
> +            - type: string
> +              const: 10gbase-r
> +
> +        - items:
> +            - type: string
> +              const: 25gbase-r
> -- 
> 2.40.1
> 

