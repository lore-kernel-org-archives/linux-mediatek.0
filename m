Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9CCCD4F39
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 05:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1PKQ5DuLabRgXs5aBH0oyMDrnaX9KYBxCAGdBV70jE=; b=HVm2UCYE9SX0gFhExdgdCFtWns
	T9MAMAAh11Yc86u2yWG6HsTb5IFj8HkHNc6Sc4ykemuf9jvxoFTcJVoSO5LmzJBWJroHo+30LdbyJ
	o98J8GR9sU/zWIusE+SoAksBguU1hgIx6d0trVXpu+Q8zpDmxlWaQRHnaVEJsJQG3jFu5q6apGdog
	YFkmWvwNCrQDoUctJqSlG6HGwfSeOuGD3tnM0goJ6jO9jOztidfO83my6IMF+csdeE9/rqPI5uFgH
	H6kLZ9d7XgUdCC90M++DwV8QG2Thbbu/suM1TM+S4bFVqddKSUWN6vWrZxX+SD0EfVgUh1sAd+O1V
	ljgRmxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNOXo-00000004cUv-2jCn;
	Thu, 14 May 2026 05:23:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNOXl-00000004cUB-48Jc
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 05:23:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF9FE4444A;
	Thu, 14 May 2026 05:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229D3C2BCB7;
	Thu, 14 May 2026 05:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778736212;
	bh=xLYXugCJEOfKmxl4cJu885NVF0HVggIfq0+loLNHOCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixL0scZde5Jrz04rNuIMCd9Zq4ai5a1PnIEkiy+eyoq5WheG+C40QoP4UZ5DJ1Bfs
	 1se/oUbJTgDpKfIrQ+5sPqNk8EWfoUsLzXL6JMw/UdWSuobcRjWcjLjdpzTc+MBf+0
	 1gyqvEJdKjHzULPY9aPJRw9mToDriVMuBTgR58dQpBSIMrQlDQQN7c5Hfhe4z1i6Oq
	 Oinzg0QtS8T+i3GGywtHegNisgGT0sHqfOu2phoEp+9h3rdCiy8sq+Nib9Tc+4DydL
	 0zICvJ5b2hMjAIu28g5rxvw/uUbNKdXs4z700elDg3zAz5XTg38nXpYg2JvaH9dDUU
	 pS0HYg2H7p8Lg==
Date: Thu, 14 May 2026 10:53:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
Message-ID: <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
References: <20260508063633.3894348-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508063633.3894348-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_222334_038534_9CC4A2DC 
X-CRM114-Status: GOOD (  11.01  )
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

So this means, the PCIe devices can only access a specific carveout memory
configured by MPU for DMA? If so, you should use 'dma-ranges' as suggested by
Rob.

'memory-region' also serves the purpose, but for PCI, we have the dedicated
'dma-ranges' property.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

