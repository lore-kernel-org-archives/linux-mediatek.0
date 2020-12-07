Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0A0C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 21:19:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D6522202
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 21:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06D6522202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h2rDMAR4/szgHvY5CRc2GDx1PJeIVdfGOlU+mzDwG4s=; b=g4UppI2b7Ij605O+94L3+j9kD
	vWMoOpYokdSkNyAwkTZFDnYA3NYL8NFuVqKEWNrCHiide8vNYHXtIyRIRbqgtjsoAH8y43QfB+jV6
	+XtzT2q/qBF/bDHRl0543vTTD3/g3AXXouhfCZr0mE3dtNjY1qACGl6VjNm6zODLBtoLHcMVYdlaL
	3MBTFEInDPNoBzv6vzPMy4DKH2WajLGGRi8VBFt2MhrMfb8YsgGztalcfpYSE80J3CwU5ZgEbJ20e
	cUFirgfvFESgWijPEEMONBWf6d4yRQ7dRbEGeO8GFfCuNLsSyxrcUDJkJ5DNO4a2nlC4J7DZns/2W
	qT04u4SzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmNuv-0005LH-3Q; Mon, 07 Dec 2020 21:19:33 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmNuq-0005JV-O3; Mon, 07 Dec 2020 21:19:29 +0000
Received: by mail-ot1-f65.google.com with SMTP id h18so9933989otq.12;
 Mon, 07 Dec 2020 13:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SbwIEIDsfJusH7q4FbfrkA5Ki4JFFsWymqArfWeiFAM=;
 b=uS2CGhqQVBq0hUao/jzuB7ZyqVzuNX9lpXUCL28B9MmqLZxQ5Y/8+dxJdJCc7sL7Bw
 URNDTb/PTXj9CHhomx1Pxq8zW7HC90z3c2rfsL0SRPOOUMGeb58v5Y+3Kgw+swf0j7BC
 AaBb6sez3aHvVmXahx9/qI7DOLCwdiJtAt7E6pkNgxURfsOjLwM32igi+iUk2THmMP0n
 N2Y3yAT8okajKhD4bVwcj7cY+7IrIwRVvm3l76QbnsH7uupu7XAQSc3tuZEiWzk1XEZ/
 MGv3WV88xrWRfUk+d+0Fll2Jc1dGT8pfyXB4vtFgcGTZHq+F8D7P2LzRkOLn+1oot93F
 605A==
X-Gm-Message-State: AOAM530jk3NHaBTF/xUtMckG/xMMtX2r/ganssUo7ut4aWUgmQOdcd6C
 gOwL/kZonMmkZqcwn87csw==
X-Google-Smtp-Source: ABdhPJyj0ImAtzWmZceRBxwogeoYsfCN+hwQgb4OhgF3vgwB2VPPj52jUJoBYD6yl9PpYyS5uR48/g==
X-Received: by 2002:a05:6830:1501:: with SMTP id
 k1mr9393799otp.12.1607375963123; 
 Mon, 07 Dec 2020 13:19:23 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k5sm2863341oot.30.2020.12.07.13.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 13:19:22 -0800 (PST)
Received: (nullmailer pid 844274 invoked by uid 1000);
 Mon, 07 Dec 2020 21:19:20 -0000
Date: Mon, 7 Dec 2020 15:19:20 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3 07/11] dt-bindings: phy: convert MIP DSI PHY binding
 to YAML schema
Message-ID: <20201207211920.GA841059@robh.at.kernel.org>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
 <20201118082126.42701-7-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118082126.42701-7-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_161928_818238_FA09802E 
X-CRM114-Status: GOOD (  23.17  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 04:21:22PM +0800, Chunfeng Yun wrote:
> Convert MIPI DSI PHY binding to YAML schema mediatek,dsi-phy.yaml
> 
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: new patch
> ---
>  .../display/mediatek/mediatek,dsi.txt         | 18 +---
>  .../bindings/phy/mediatek,dsi-phy.yaml        | 83 +++++++++++++++++++
>  2 files changed, 84 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> index f06f24d405a5..8238a86686be 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> @@ -22,23 +22,7 @@ Required properties:
>  MIPI TX Configuration Module
>  ============================
>  
> -The MIPI TX configuration module controls the MIPI D-PHY.
> -
> -Required properties:
> -- compatible: "mediatek,<chip>-mipi-tx"
> -- the supported chips are mt2701, 7623, mt8173 and mt8183.
> -- reg: Physical base address and length of the controller's registers
> -- clocks: PLL reference clock
> -- clock-output-names: name of the output clock line to the DSI encoder
> -- #clock-cells: must be <0>;
> -- #phy-cells: must be <0>.
> -
> -Optional properties:
> -- drive-strength-microamp: adjust driving current, should be 3000 ~ 6000. And
> -						   the step is 200.
> -- nvmem-cells: A phandle to the calibration data provided by a nvmem device. If
> -               unspecified default values shall be used.
> -- nvmem-cell-names: Should be "calibration-data"
> +See phy/mediatek,dsi-phy.yaml
>  
>  Example:
>  
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> new file mode 100644
> index 000000000000..87f8df251ab0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MIPI Display Serial Interface (DSI) PHY binding
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> +
> +description: The MIPI DSI PHY supports up to 4-lane output.
> +
> +properties:
> +  $nodename:
> +    pattern: "^dsi-phy@[0-9a-f]+$"
> +
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-mipi-tx
> +      - mediatek,mt7623-mipi-tx
> +      - mediatek,mt8173-mipi-tx
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PLL reference clock
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  nvmem-cells:
> +    maxItems: 1
> +    description: A phandle to the calibration data provided by a nvmem device,
> +      if unspecified, default values shall be used.
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: calibration-data
> +
> +  drive-strength-microamp:
> +    description: adjust driving current, the step is 200.

multipleOf: 200

> +    $ref: /schemas/types.yaml#/definitions/uint32

Can drop. Standard unit suffixes have a type already.

> +    minimum: 2000
> +    maximum: 6000
> +    default: 4600
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-output-names
> +  - "#phy-cells"
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    dsi-phy@10215000 {
> +        compatible = "mediatek,mt8173-mipi-tx";
> +        reg = <0x10215000 0x1000>;
> +        clocks = <&clk26m>;
> +        clock-output-names = "mipi_tx0_pll";
> +        drive-strength-microamp = <4000>;
> +        nvmem-cells= <&mipi_tx_calibration>;
> +        nvmem-cell-names = "calibration-data";
> +        #clock-cells = <0>;
> +        #phy-cells = <0>;
> +    };
> +
> +...
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
