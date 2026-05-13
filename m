Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8127ACD4F21
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 23:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2kZdZohKkyTy6oElm52xyxB3bZY0O/NoPUvgt7T3/w=; b=aKo11vxDD+fyaVPpNh25YD+XFE
	sNDg9LD08B9KTA6A9KKwV/m16neyWgdlMqyf3rISiADaVDlS8McFPfT7GdeQ3ajpjPC2Z3J+u8fN4
	pAUXWJO41aauMMGsEwYVRh9ksBiK2Dqt4BGhkv7T/ug9rHgbYVsy2dtys3/ao85ly2AuuhX3VLMZw
	sXhfftpkVUWsYdffKrGC4lMWyL7lGkM04fdYhS6adOaKXcOcbpBryUlc2fXZm3R9t420k+//ZkQIT
	Q1IN67MXIoEyIY30IlBrKVI3RgMUZZGO0gzuYq+fK7ndzd2fCCeWsp5WwVMQX6UcK2pRzfkjTn5Wx
	QUCwbhHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIo6-000000040n3-1gIi;
	Wed, 13 May 2026 23:16:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIo4-000000040me-1OlU
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 23:16:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DA1460129;
	Wed, 13 May 2026 23:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B443C19425;
	Wed, 13 May 2026 23:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714158;
	bh=MVk6jb5+GkT5DVuM/HR3gjPwoz3JXsYZFjvxYAUvIYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOC64afIrDERd2fOrXgXfbN4m/Xur81K87ISHnIHzR0TlMceY1eoGi2GrQRGiLZdg
	 pleJb6E3c9C8oX69vcVnoPK+kpjn9q8hJzWrf6hjQqYE+eL0hKcZspbUcAPNEUDsJU
	 6qJ110qgu6axlR3qRYuODw7eCVWxTYUhV3cVLCQG1jemBxC+pwxEr3jBP15aTATfUR
	 dnO4UjPqLFjJrVNhheiAqBX1X2qWZ4eQ+S7keDWowaCH8Xx27QstBlBIqeK7juguAV
	 dBPK9V9uwnUqtmu00mo0gyjPRj74woaTLrAhW4WmIdzTvXolxbIpc4/G+4lnZuX7Kf
	 squxFvozDUqAg==
Date: Wed, 13 May 2026 18:15:50 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
Message-ID: <20260513231550.GA2280946-robh@kernel.org>
References: <20260508063633.3894348-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508063633.3894348-1-wenst@chromium.org>
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

On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> controller memory access could be limited to a small region by the
> firmware configuring a memory protection unit. This memory region
> must be assigned to the PCIe controller so that the OS knows to
> use that region. Otherwise PCIe devices would not work properly.
> 

What you are describing is dma-ranges. Why not use that?


> Allow the memory-region property with one item pointing to a
> restricted DMA buffer.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> This patch compliments another patch that moved the memory-region from
> the PCIe device to the PCIe controller [1].
> 
> [1] https://lore.kernel.org/all/20260430120725.241779-1-wenst@chromium.org/
> 
>  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 4db700fc36ba..4a9e41d01628 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -115,6 +115,10 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  memory-region:
> +    maxItems: 1
> +    description: phandle to restricted DMA buffer
> +
>    mediatek,pbus-csr:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
> -- 
> 2.54.0.563.g4f69b47b94-goog
> 

