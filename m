Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4BAC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Nov 2023 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKwkP963gOr3zzH+sOtigbWk+LV0roLBXICZMNqn3/c=; b=yjPqdD7y5bfxxfuIXKAgbX5sUw
	1j6GVG20dZAJju+quGsb3VxuIuQFpBFp4jGHmdj6npdWgLNexM4MvZMfIG++djfI4Q3cgZX3Ppx1T
	bMq0Q5uyzWpuWMYOtNegNDo0Gvh9/3RWjH3rxxi+6uxK4+8oj5VgcXVUJv23xuV7/VnjegC0L01MV
	tReu2A9AT0omPvJnfLCTMM0jPPLOrjYw8Va7/yw9uInsuT2rSeRGaX+KXX9T1LOdxJ3Bx9nROWeCE
	8g/48NIas8moiLWYVwPnz6xKaxO5TvA9MNP34MWZ3mrIf+5Q4l8x8r1/ASrmZVtFcUJMZb0t+yAmU
	mxu8m8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2thN-00G4Yr-03;
	Tue, 14 Nov 2023 13:43:25 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2thH-00G4XA-39;
	Tue, 14 Nov 2023 13:43:21 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1f060e059a3so3546374fac.1;
        Tue, 14 Nov 2023 05:43:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699969397; x=1700574197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKwkP963gOr3zzH+sOtigbWk+LV0roLBXICZMNqn3/c=;
        b=UI033IcbCVMi1/yjsiAO5nzeLNECJU2xCLWHtYZTVCXoACSQIZdv8koboJj8gDpzws
         AFsNNionE1ERZy+8PFmFo92G7tLT33jEaBVjzXfzAnJ7GT8hW43F1+HdfrsRinlG0mHn
         gwInawZ8kMeMnWaimK2Pao5d1uBBIS4PW4XDksK9Dn6/3JS9WnRYGrXli1BWWslCPSOV
         B95/qvcuhzjDoeC7LSppvtmp7OD6KIrifPsy7Ef9a0SMZht50CowoCvSzQmvLyCBvNOV
         hD5xm1PHN332FQF5wY9ShBglM3M9bfEmlpS0tCfzpPLH8k5lzbMdHkyE7HpSjfvbxMaL
         JZAw==
X-Gm-Message-State: AOJu0Yyd+QbwjLbPQ9jTDUaR+cjzgAfv4sFMFFHG0aCvQIxyAQkNTAIq
	nrUnDdadwmaM+TMEedV7sQ==
X-Google-Smtp-Source: AGHT+IEewtgCzuIB1eQL3luUwxLZaGnVSFEKF90crdWiR8BoDUsAFfrvOT5VpkzrnZyuSj/5tJismw==
X-Received: by 2002:a05:6870:c1d1:b0:1e9:c18b:b2da with SMTP id i17-20020a056870c1d100b001e9c18bb2damr13151127oad.18.1699969397286;
        Tue, 14 Nov 2023 05:43:17 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o7-20020a9d7647000000b006bf0f95f702sm199993otl.64.2023.11.14.05.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 05:43:16 -0800 (PST)
Received: (nullmailer pid 1650336 invoked by uid 1000);
	Tue, 14 Nov 2023 13:43:15 -0000
Date: Tue, 14 Nov 2023 07:43:15 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, 
	Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexander Couzens <lynxis@fe80.eu>, Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH 1/8] dt-bindings: phy: mediatek,xfi-pextp: add new
 bindings
Message-ID: <20231114134315.GA1645963-robh@kernel.org>
References: <cover.1699565880.git.daniel@makrotopia.org>
 <924c2c6316e6d51a17423eded3a2c5c5bbf349d2.1699565880.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <924c2c6316e6d51a17423eded3a2c5c5bbf349d2.1699565880.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_054320_018466_A2C62E5A 
X-CRM114-Status: GOOD (  20.29  )
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

On Thu, Nov 09, 2023 at 09:50:55PM +0000, Daniel Golle wrote:
> Add bindings for the MediaTek PEXTP Ethernet SerDes PHY found in the
> MediaTek MT7988 SoC which can operate at various interfaces modes:
> 
>  * USXGMII
>  * 10GBase-R
>  * 5GBase-R
>  * 2500Base-X
>  * 1000Base-X
>  * Cisco SGMII (MAC side)
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/phy/mediatek,xfi-pextp.yaml      | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.yaml b/Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.yaml
> new file mode 100644
> index 0000000000000..948d5031af1e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,xfi-pextp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek XFI PEXTP SerDes PHY
> +
> +maintainers:
> +  - Daniel Golle <daniel@makrotopia.org>
> +
> +description: |

Don't need '|' here.

> +  The MediaTek XFI PEXTP SerDes PHY provides the physical SerDes lanes
> +  used by the MediaTek USXGMII PCS.
> +
> +properties:
> +  $nodename:
> +    pattern: "^phy@[0-9a-f]+$"
> +
> +  compatible:
> +    const: mediatek,mt7988-xfi-pextp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XFI PHY clock
> +
> +  resets:
> +    items:
> +      - description: PEXTP reset
> +
> +  mediatek,usxgmii-performance-errata:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      USXGMII0 on MT7988 suffers from a performance problem in 10GBase-R
> +      mode which needs a work-around in the driver. The work-around is
> +      enabled using this flag.
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mediatek,mt7988-clk.h>
> +    #include <dt-bindings/reset/mediatek,mt7988-resets.h>
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      xfi_pextp0: phy@11f20000 {

Drop unused labels.

> +        compatible = "mediatek,mt7988-xfi-pextp";
> +        reg = <0 0x11f20000 0 0x10000>;
> +        clocks = <&topckgen CLK_TOP_XFI_PHY_0_XTAL_SEL>;
> +        resets = <&watchdog MT7988_TOPRGU_XFI_PEXTP0_GRST>;
> +        mediatek,usxgmii-performance-errata;
> +        #phy-cells = <0>;
> +      };
> +    };
> +
> +...
> -- 
> 2.42.1

