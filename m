Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F47CD8CA8
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaU+1rvSR/F7XjgGlqq7A+8Ufs+EKuf/XXOYBHAMljo=; b=ligRL8kFFaXk1fRb1pbN0gc0q4
	cD5bbyybKvfWFsV+uezG5JH/PdVQzJIvhi2Z6HEG55H0PXTRxxc9XTL1i++rECM9uRplTfZTCHkEQ
	4BfLeLAvkwDDJESFm6CtRoA3kgEZ4viyaIphUiRRmYBeG3NgNUpRfxgxGmh4bSttFY/scxzZdxcM2
	WYRXhNq/7G96XiFDSCJLI9NpDEyVZrGZc0XfGkUfdpac3h+2B/M6XDKyvlZqcIYOEWnDwfwgBpQRy
	ojrxunvr/8Z6iQEmF+dAVM0LSSzgyQK2cLZhZ4zF7Rf9Do1BoIp/8jpwt505VkCppMkMq+cog5m46
	8C0d2DbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2vi-0000000B4sE-0z8h;
	Fri, 12 Jun 2026 14:32:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2vh-0000000B4s3-08XV
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 14:32:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66156439BE;
	Fri, 12 Jun 2026 14:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AED51F000E9;
	Fri, 12 Jun 2026 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781274736;
	bh=XaU+1rvSR/F7XjgGlqq7A+8Ufs+EKuf/XXOYBHAMljo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i1ZdFsrmgYwZOab0f2Gh48s1gQfEsI4qP59TxS8eY5OYXT05tC3YH2MahwLJErBYJ
	 019KX3MiiokOAHxoNFCd+xgrShlxZ5knZD1Vkca2q4Zc0CJ0svo9kSd3pTTpEM0k/w
	 mzyWNul0TUMMXRhvwuN1dAOtTbC9PDKxVXl8fsZM862vsvt9GioiH3cz7q86oj0TpT
	 V9MopHdEujJ2kcBnEdh9aoxFYYll1PhENJuqQysSvJHU1WnPZiqcVtGApbm19sckwX
	 qgz6Obs3rnAEMin43ark8FL3KrQEBou85wytKJ52Y29lN0+hxovxseG4S6lkZZqQZb
	 iP/sV0DoKmt0Q==
Date: Fri, 12 Jun 2026 09:32:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pci@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
Message-ID: <178127473464.974137.12177454800671069501.robh@kernel.org>
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


On Fri, 08 May 2026 14:36:32 +0800, Chen-Yu Tsai wrote:
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>


