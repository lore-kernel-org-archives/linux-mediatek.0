Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82E4CD3445
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2026 17:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=mOAxWxpUPy9FBXgfzjnGjbAnA9h9XMEoNIzyTeOB6zM=; b=vg3FVN6QYC/LIC
	1mrPi1qc3IEfXCoZ9yV/tD8MWYGdPMMM9Ab+bcwk8RH0ZzJmZ3iuMrmxsdhKdNlsEyRtREiYGwtMJ
	45cPK2d3KUOt1rjb9PWR9XyESpbXBahmjc9L3CWRVEGSORAeiNYl9hBhx3zhWnLcfRMbffZKcJAFK
	BT5r3oJYixSpDDepAU4nlDlQ19NULaOJ/XXq4xNd9R7f3a/gWrxWQ+4hmi01ta3y0asZe7EEXZ2DG
	BpTJ6nhNAbdnMvsm29zE0cG48ZsnjRuPktvteEHwgcwhlTBiPNWErt3TTR/KXUTnBbkg07WlqI1D5
	xXiEnZjLW8JF3Fi+acHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPP3-00000007CUO-49gw;
	Fri, 08 May 2026 17:54:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPP3-00000007CU9-0HEo
	for linux-mediatek@lists.infradead.org;
	Fri, 08 May 2026 17:54:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E6F160052;
	Fri,  8 May 2026 17:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9552C2BCB0;
	Fri,  8 May 2026 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778262860;
	bh=kixTyVjo/edOBEApZc+Tf9KkN7fI8m9XCJYuC6DL0gY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fKmrLQ16eK05i/QO1VXuWsPYdtSj6bzom61rpm59pP+9WOgE7TX9jD9bCjBLqjpsW
	 m1ud7CTnsuFwjZNdTwj+AOEzwngPrhIui1Sj5Gq6odROxCDgmPiiDfHf2IG6EYN6dU
	 kS4N6Vn8A0wkPJeWPpJU6TLz5ztJpx1vb9azRtJ3nPBuioJmQc1pNiaDfkqKIPmy8r
	 I+A+Y6Q/hPIXZYxe6RqWnJGnWGVyz1ay5XzMYixL/fQEdOIdnS3YegpX1aSa01jOQU
	 gyXOM3rPVrAhjbGVaonlUeQu5VNAcyFxtR3f7bUC0tuoEwF7zlOhBjeGF6UYUm5S8A
	 SP3gmi5aHiC7A==
Date: Fri, 8 May 2026 12:54:18 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
Message-ID: <20260508175418.GA97653@bhelgaas>
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

I guess this is similar to
https://lore.kernel.org/linux-pci/20250716053950.199079-1-huaqian.li@siemens.com/
and uses
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/reserved-memory/shared-dma-pool.yaml?

Looks like those keystone changes were never merged; I don't know what
happened to them.  But it will be good if everybody does it the same
way.

I wish there were a simple way to grep for this restricted DMA
concept.  Maybe there is and I just haven't found it :)

>    mediatek,pbus-csr:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
> -- 
> 2.54.0.563.g4f69b47b94-goog
> 

