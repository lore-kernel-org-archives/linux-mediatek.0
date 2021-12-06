Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E1CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 19:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sbdgLkp6OHhk+cfL5nUfUgWc4UClVCcqPdwUIlRsw/c=; b=yrw/Y8JymW4Hul
	XNNiMzJHKY6U1JXWLN6++pBfxSQX5Si/TiHMBiMP7npFyAipxvTYQnZR9FCxssjGLQ0dWlWYNLjjd
	FpACRyKu4Knq7NYfHlR774fw9zTWob+KrGKSK/OqM0M89RrNka5zodbrefvc1sRrIvatbVAD68CCP
	c2meWx4ngntL6tAKF5OeiMlvOqIGApstdxkwUVng0Y3yjm/9dc+2TIhKieSQ8PQ6mCZ/8ZfGYjMHr
	87WX1G70UK9IydLwOtuCr5++fd6784G1cHVrC1uCPkbEYWKf+KnRV+1V8JjP9Biu17DZEfZ/nKCVa
	SK3BXcnJIXb/yyVxOtMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muK2k-005ZLo-T3; Mon, 06 Dec 2021 19:52:58 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muK2h-005ZK5-Pd; Mon, 06 Dec 2021 19:52:57 +0000
Received: by mail-ua1-x92b.google.com with SMTP id ay21so21928120uab.12;
 Mon, 06 Dec 2021 11:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vrXin/HXbXG1mkAXUdU3bzqqz9eX4d3rYtsLa4pucxw=;
 b=nDmVgYJ/PlSvCUzukGDeqqONJGyo38g6dxHIqMAz4ZhdMKFNYWO8zW6qPw+60MscTd
 ZkTRH2cgDr0KgoxzSbE4ybGjEmuRqdpG0TUAPpspaIkKlURBd+JO1aqhCIegCgtZGnUe
 ibnld6zq3UQCac7G8cBceBd4nd9tvhYkyGYe7s/tku2hvBJ3wZVAcM6Wd1bubAS0peNV
 ptgFa90xBpPPDM/8lrdwKbM4GKithKGd+VZjV7wBHt5Dp50BoiBF/9gpB0QONTytYwA1
 PPP5MO3zsGHhPXrGmQrnW/fcrLaC32XO/+3ua24iPnvWciTVURe9m7aCL9R40g2QLyp5
 tpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vrXin/HXbXG1mkAXUdU3bzqqz9eX4d3rYtsLa4pucxw=;
 b=bsMYs5PoE9SeN54lFvExWUyzBttkP9rgdL5dVsxj8rwUO9wbU0zL/AGOPQo9Ns1tif
 hk6nQyPsQ7qiuSLSudpLCdxXy7xgMV5jWHRSYgs2RhNSc4eVto2B4K07+040P7/L1JNV
 2n11ebm1In7xEz0yFMcsy5Ulyr0H0EzEki879Yc0yveI70E3nXMECq8y187WGWR6DRIT
 Au+8vY6PIkCGeCIU3rpCKfk7SpvSGYWOB6speASghT/+5h7QUKHGMLHN/Gr92sijMcve
 tZ5ZhLHirnXhUmdu/UR+NFSUcm0VWzJyO5vHxfFlGfF1Cjj2qoMRr9yOIYz3g1p4Hns3
 j/qg==
X-Gm-Message-State: AOAM533tRUiceGaNNqmxTTOwOnxMInoaRL7p18rQgIaIQJ8It7SIHxvW
 4R/GmrHuXxn6RkmcUveEOEolLZDU6mfjEJZ/aEQ=
X-Google-Smtp-Source: ABdhPJyUiGZbBBY7MWqrYEkfviMec8HXucbIt3f+AkAmjHcK7OnVQWqUWU5Xu/hUs3bHmfranmVtMbYS0JLk30bQKwk=
X-Received: by 2002:ab0:2a8b:: with SMTP id h11mr43242829uar.98.1638820374257; 
 Mon, 06 Dec 2021 11:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20211206194406.2469361-1-robh@kernel.org>
In-Reply-To: <20211206194406.2469361-1-robh@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 6 Dec 2021 20:52:42 +0100
Message-ID: <CAMhs-H888q9FihfXkn=wdV8j2iRTnaXiXf=9onRxab8qHvFwcQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: Fix 'unevaluatedProperties' warnings
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Abraham I <kishon@ti.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_115255_876536_AC8006CB 
X-CRM114-Status: GOOD (  17.31  )
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

On Mon, Dec 6, 2021 at 8:44 PM Rob Herring <robh@kernel.org> wrote:
>
> With 'unevaluatedProperties' support implemented, there's several
> warnings due to undocumented properties:
>
> Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.example.dt.yaml: pcie@1e140000: pcie@0,0: Unevaluated properties are not allowed ('phy-names' was unexpected)
> Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.example.dt.yaml: pcie@1e140000: pcie@1,0: Unevaluated properties are not allowed ('phy-names' was unexpected)
> Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.example.dt.yaml: pcie@1e140000: pcie@2,0: Unevaluated properties are not allowed ('phy-names' was unexpected)
> Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.example.dt.yaml: pcie@11230000: Unevaluated properties are not allowed ('phy-names' was unexpected)
> Documentation/devicetree/bindings/pci/microchip,pcie-host.example.dt.yaml: pcie@2030000000: Unevaluated properties are not allowed ('interrupt-controller' was unexpected)
> Documentation/devicetree/bindings/pci/ti,am65-pci-ep.example.dt.yaml: pcie-ep@5500000: Unevaluated properties are not allowed ('num-ib-windows', 'num-ob-windows' were unexpected)
> Documentation/devicetree/bindings/pci/ti,am65-pci-host.example.dt.yaml: pcie@5500000: Unevaluated properties are not allowed ('num-viewport', 'interrupts' were unexpected)
> Documentation/devicetree/bindings/pci/ti,j721e-pci-host.example.dt.yaml: pcie@2900000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
>
> Add the necessary property definitions or remove the properties from the
> examples to fix these warnings.
>
> Cc: Ryder Lee <ryder.lee@mediatek.com>
> Cc: Jianjun Wang <jianjun.wang@mediatek.com>
> Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Daire McNamara <daire.mcnamara@microchip.com>
> Cc: Abraham I <kishon@ti.com>
> Cc: linux-pci@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/pci/mediatek,mt7621-pcie.yaml     |  3 +++

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

>  .../bindings/pci/mediatek-pcie-gen3.yaml       |  4 ++++
>  .../bindings/pci/microchip,pcie-host.yaml      | 18 ++++++++++++++++++
>  .../bindings/pci/ti,am65-pci-ep.yaml           |  2 --
>  .../bindings/pci/ti,am65-pci-host.yaml         |  4 +++-
>  .../bindings/pci/ti,j721e-pci-host.yaml        |  2 ++
>  6 files changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> index 044fa967bc8b..d60f43fd9c5a 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> @@ -45,6 +45,9 @@ patternProperties:
>        phys:
>          maxItems: 1
>
> +      phy-names:
> +        pattern: '^pcie-phy[0-2]$'
> +
>      required:
>        - "#interrupt-cells"
>        - interrupt-map-mask
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 742206dbd965..0499b94627ae 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -95,6 +95,10 @@ properties:
>    phys:
>      maxItems: 1
>
> +  phy-names:
> +    items:
> +      - const: pcie-phy
> +
>    '#interrupt-cells':
>      const: 1
>
> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> index 7b0776457178..edb4f81253c8 100644
> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> @@ -46,6 +46,24 @@ properties:
>    msi-parent:
>      description: MSI controller the device is capable of using.
>
> +  interrupt-controller:
> +    type: object
> +    properties:
> +      '#address-cells':
> +        const: 0
> +
> +      '#interrupt-cells':
> +        const: 1
> +
> +      interrupt-controller: true
> +
> +    required:
> +      - '#address-cells'
> +      - '#interrupt-cells'
> +      - interrupt-controller
> +
> +    additionalProperties: false
> +
>  required:
>    - reg
>    - reg-names
> diff --git a/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml b/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml
> index 78c217d362a7..a6896cb40e83 100644
> --- a/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml
> @@ -66,8 +66,6 @@ examples:
>          reg-names = "app", "dbics", "addr_space", "atu";
>          power-domains = <&k3_pds 120 TI_SCI_PD_EXCLUSIVE>;
>          ti,syscon-pcie-mode = <&pcie0_mode>;
> -        num-ib-windows = <16>;
> -        num-ob-windows = <16>;
>          max-link-speed = <2>;
>          dma-coherent;
>          interrupts = <GIC_SPI 340 IRQ_TYPE_EDGE_RISING>;
> diff --git a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
> index 834dc1c1743c..eabe1635e336 100644
> --- a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
> @@ -29,6 +29,9 @@ properties:
>        - const: config
>        - const: atu
>
> +  interrupts:
> +    maxItems: 1
> +
>    power-domains:
>      maxItems: 1
>
> @@ -87,7 +90,6 @@ examples:
>          ti,syscon-pcie-id = <&pcie_devid>;
>          ti,syscon-pcie-mode = <&pcie0_mode>;
>          bus-range = <0x0 0xff>;
> -        num-viewport = <16>;
>          max-link-speed = <2>;
>          dma-coherent;
>          interrupts = <GIC_SPI 340 IRQ_TYPE_EDGE_RISING>;
> diff --git a/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml b/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
> index cc900202df29..2115d5a3f0e1 100644
> --- a/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
> @@ -60,6 +60,8 @@ properties:
>        - const: fck
>        - const: pcie_refclk
>
> +  dma-coherent: true
> +
>    vendor-id:
>      const: 0x104c
>
> --
> 2.32.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
