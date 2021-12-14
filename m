Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2CCC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 22:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7COpOD+QlVY+n0bkQ9uv0taacZvim3oR3DRRkTOqPBY=; b=fdTfiJQBPZAmKf
	wYoZqxUMv+rFJ9wwbrFD1Ftn9bwDhQpdOV+S6CxiQBGXS+H9rg82ArVaVUiFDmbB1IMAAz8B9AeiC
	K3zb932bSiJ+YQVViKQCvhjJhjb7eK9Mzb3DpgkzUSkI8HDINh43vEeQpsDtwFWR+Gurjk3fnkudE
	ozYttVVmakySA7dC7fBB+wnlYNnlu05dkAZ8S2H6TolmSEgtOHLoCfmqkbg8RRqshWAyQS0oQDdyn
	zYmSLXmzowWo1nnWUB++6LPSYtNsElJ9npWAzkEVWFyFj7LfMFZNiuU1rv+2PaDQ9dcQJiqZRHgRz
	EKtDqp+hRaL1gMS1oq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxG5j-00FusT-DC; Tue, 14 Dec 2021 22:16:11 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxG5g-00Fuqy-Np; Tue, 14 Dec 2021 22:16:10 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso22505233otf.12; 
 Tue, 14 Dec 2021 14:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SX/9YrUtplncL5wWQZap08LTDJOW0Q9uZQc36gCy2Uw=;
 b=UBDLYCvRXFF0EHaNllWUy94r7T2UJ80DqDM9Lu+qxwyLDb5QDImOYFFRHyL0S6veWc
 lAEuOaTF3GFjBZ63LAE9WtyMMZ4TbVP7VIpSAAd7TqRUYCCzoJJPvh2/PMAOBOtXg9of
 EWpMj5ggxTdtA0puph8YiChAy1lL1Fa94SboN1odaARz3xIoNoF6A+RsJ3gQ3Xb3mzU9
 vgIPYFXNwZcbVF8TtOMix7MKniSjDA8SUWvcccjn/vOnIoAzzbztt8IqvZ4M65sG0iAD
 nIpEO18l/ScN0v6lxjf1UMNaWcv+PH/D12+dAg3cCTGlOLntWZhQC/FMUlQiKFj8wpCL
 9cPA==
X-Gm-Message-State: AOAM531dtKICPzJJ2DsaMRBqZdVV5cvF7EgxpxfMaJDLi4ySGj2naalG
 s9MN+qtEH4WgBuBGrkmObQ==
X-Google-Smtp-Source: ABdhPJzbjxO0Xl93R1cCScNoNZllcabCBzDCPy+fKLXaQ6Ybf6LBpMdoCbxJyE/cwv4O1OzllFTbIg==
X-Received: by 2002:a05:6830:442a:: with SMTP id
 q42mr6534523otv.385.1639520167393; 
 Tue, 14 Dec 2021 14:16:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 109sm16294otv.30.2021.12.14.14.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 14:16:06 -0800 (PST)
Received: (nullmailer pid 4052260 invoked by uid 1000);
 Tue, 14 Dec 2021 22:16:05 -0000
Date: Tue, 14 Dec 2021 16:16:05 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jianjun Wang <jianjun.wang@mediatek.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] dt-bindings: PCI: Fix 'unevaluatedProperties' warnings
Message-ID: <YbkXpXFFPjmRmpXk@robh.at.kernel.org>
References: <20211206194406.2469361-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206194406.2469361-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_141608_807378_B69F45C6 
X-CRM114-Status: GOOD (  12.10  )
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

On Mon, 06 Dec 2021 13:44:05 -0600, Rob Herring wrote:
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
>  .../bindings/pci/mediatek-pcie-gen3.yaml       |  4 ++++
>  .../bindings/pci/microchip,pcie-host.yaml      | 18 ++++++++++++++++++
>  .../bindings/pci/ti,am65-pci-ep.yaml           |  2 --
>  .../bindings/pci/ti,am65-pci-host.yaml         |  4 +++-
>  .../bindings/pci/ti,j721e-pci-host.yaml        |  2 ++
>  6 files changed, 30 insertions(+), 3 deletions(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
