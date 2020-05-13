Return-Path: <SRS0=mrrP=63=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887F1C2D0F6
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 02:41:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DB16207BC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 02:41:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lUpp6Wzy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DB16207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ymCndH2iRDVbWZCfWFa40Czwc5ZpDxOCVdBdmM4Ty2I=; b=lUpp6WzyiksaZu
	NsqTAmG4bj3SJamr3Cs6NiPbAvfpAu4zRZ4bzJrA57XW0I2+R0noyKL6kBut7CSeM7he9WLBROnuG
	g5Ac3VMjSfku8pL0FX0dXMbrFCeUknaYZ2dMoMEP7C++e+81qeTmGNs8QDcKVN0fcdeG9Vg6dLVNI
	+6mYpG26aS6ugqYEYwb6CrJbw9CcRHdycLwc2B8nH6jOibBMt//PLcfll7VCPbcGYPzQk7vMihKyX
	zZE7VSCKHZj7Y5I6/foqUDsuPrVVwfkhU4Aai5S3wySIlNyjLgDSkLKmMYaOt8vffYikyCAr4z0Km
	odXqn/RPAIcNKBs6IrWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYhKo-00062w-1A; Wed, 13 May 2020 02:41:26 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYhKa-0005sg-4P; Wed, 13 May 2020 02:41:13 +0000
Received: by mail-oi1-f194.google.com with SMTP id x7so19259402oic.3;
 Tue, 12 May 2020 19:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Vk/gH8NIib/i4WfO/BNqo7XG45YgRMuUKBCFCVNn9K4=;
 b=lRXHB5FDa5XsiJAUKgb/PX5JNUCySdqZge1hV6sUZpNI3oiKIXvGNl9TXxoHKwsQNE
 Mt0OuwD0n435nF+8K2afzMWcsQ+ow9DA0DWX2VuFjJ/67EJzkiYWOOEYEIksgZZjUsnt
 21pB5FmFGLS4h9UR0b0CgkE0+dlUwVf+S5c2P+vz11R9aHNavIxN/gge581GjU0qItjE
 PvZclV3ShG1k7oUqzQqvn+i14oFsgSNSwMUO8GSxCyckupNwPsgXStmfNsAGJ70uuchh
 pQV6Bp/Z+AiCh3hrPn+evOP9FQOqrWzN/qHBasiGpalTueea5OhuXO3mPLYTIJftP5fS
 TKdA==
X-Gm-Message-State: AGi0PuY2kHQZK3a0IqzAuC5feCE7V4LCgNN0twQWTl1+jLJIocVDi7gM
 p5c7TXaLoRTDma97rI4SYA==
X-Google-Smtp-Source: APiQypLSWgq5+Oay+HnD2z30chqUL/969npxbmRPrn1Thwb26z2ngIk97YEqxzAvB6hlSpP74HHRRQ==
X-Received: by 2002:aca:2209:: with SMTP id b9mr15742070oic.117.1589337671421; 
 Tue, 12 May 2020 19:41:11 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j23sm58681otl.64.2020.05.12.19.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 19:41:10 -0700 (PDT)
Received: (nullmailer pid 2185 invoked by uid 1000);
 Wed, 13 May 2020 02:41:09 -0000
Date: Tue, 12 May 2020 21:41:09 -0500
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 02/11] dt-bindings: new: add yaml bindings for MediaTek
 Ethernet MAC
Message-ID: <20200513024109.GA29703@bogus>
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505140231.16600-3-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_194112_175493_455AAC85 
X-CRM114-Status: GOOD (  17.30  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@openwrt.org>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 05, 2020 at 04:02:22PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This adds yaml DT bindings for the MediaTek Ethernet MAC present on the
> mt8* family of SoCs.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../bindings/net/mediatek,eth-mac.yaml        | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml b/Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml
> new file mode 100644
> index 000000000000..7682fe9d8109
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/mediatek,eth-mac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Ethernet MAC Controller
> +
> +maintainers:
> +  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +
> +description:
> +  This Ethernet MAC is used on the MT8* family of SoCs from MediaTek.
> +  It's compliant with 802.3 standards and supports half- and full-duplex
> +  modes with flow-control as well as CRC offloading and VLAN tags.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8516-eth
> +      - mediatek,mt8518-eth
> +      - mediatek,mt8175-eth
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
> +  clock-names:
> +    additionalItems: false
> +    items:
> +      - const: core
> +      - const: reg
> +      - const: trans
> +
> +  mediatek,pericfg:
> +    $ref: /schemas/types.yaml#definitions/phandle
> +    description:
> +      Phandle to the device containing the PERICFG register range.

Perhaps say what it is used for?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - mediatek,pericfg
> +  - phy-handle
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8516-clk.h>
> +
> +    ethernet: ethernet@11180000 {
> +        compatible = "mediatek,mt8516-eth";
> +        reg = <0 0x11180000 0 0x1000>;

Default addr and size is 1 cell.

> +        mediatek,pericfg = <&pericfg>;
> +        interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_LOW>;
> +        clocks = <&topckgen CLK_TOP_RG_ETH>,
> +                 <&topckgen CLK_TOP_66M_ETH>,
> +                 <&topckgen CLK_TOP_133M_ETH>;
> +        clock-names = "core", "reg", "trans";
> +        phy-handle = <&eth_phy>;
> +        phy-mode = "rmii";
> +
> +        mdio {

Not documented.

> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            eth_phy: ethernet-phy@0 {
> +                reg = <0>;
> +            };
> +        };
> +    };
> -- 
> 2.25.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
