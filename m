Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875EAC44532
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GL2pSyfUqjuPmverPU2rNkWROn+3SQ8dGrBCAoNYays=; b=OabAV3VkBFZF11KY9GSE6kChGS
	yrThPohMTjKL7X9kbo1drtE6I3ihvbHlqt6kMsRXK3qLeN8MPEscejLSKbrGGgvb0UJD+iwabb43h
	NTejeha6hdBb8gEvkj1gWJIq8VowpnYJUSDsym9r0Pz3KaW5qm1+PuzlW+q1dMEeKs7FRZ6DxgrFT
	S9Emd/s0MbFR0Hc9B0bQWZxFtLFCghyA/ZnQwhjZEQVwhD79vQIwgTmZ7HF1/Y3CiLfNKSQ0sov0+
	WwBXxvqREPPuMIjr3aYRMOp9/n8iSv3wMHVvwWXeEhJ+tWbSM0i0c1ag3u/RCKd+HHhy67H5ydwp6
	1TqttEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaBE-0000000COSc-0UDH;
	Wed, 22 Jul 2026 16:52:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaBD-0000000COSC-0bnU;
	Wed, 22 Jul 2026 16:52:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BF0A600C3;
	Wed, 22 Jul 2026 16:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D851F000E9;
	Wed, 22 Jul 2026 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784739141;
	bh=GL2pSyfUqjuPmverPU2rNkWROn+3SQ8dGrBCAoNYays=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DpFHoyV0VFzABFLUPR7icr9hWT7ghJ6g3aNli0e/diFud0wL7Cm3kFotmEPSNYqHj
	 4WmkKbR8kP0jQFRPjeO5JmcDEGYx08WsaNe55rJZ/lx/OlHO/4TAIH32OMch3eu0+r
	 hEBY031rVJByEP4q9/pdc9MbqGiWu2j0dCeHvz7d1G6W76sT4KNnywdZUSc/kHDvRi
	 IRmUVnCUp6x1vGfZv71ZPpQjS9FRzGlNsbOCwUAvmMs0urk3vjTxkoz6Umm1NG9EAI
	 bS2umLIzRe5jJQx0+q784VYxhZON5JEwdkrw4Y4CE9ERy9LT+tZkN6uZfW4KAi/IpD
	 I9OoC79v7RBZw==
Date: Wed, 22 Jul 2026 11:52:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-pci@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: PCI: mediatek-gen3: Split Airoha
 schema and document 2-lanes
Message-ID: <178473913929.1097113.176772633054348550.robh@kernel.org>
References: <20260714115848.8537-1-ansuelsmth@gmail.com>
 <20260714115848.8537-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714115848.8537-4-ansuelsmth@gmail.com>
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


On Tue, 14 Jul 2026 13:58:45 +0200, Christian Marangi wrote:
> To permit proper documentation of required property to support PCIe
> configured for 2-lanes mode, split the Airoha schema part from the
> mediatek-gen3 schema to a dedicated schema.
> 
> A PCIe configured for 2-lanes mode require an additional reg for the
> secondary PCIe to be configured and the airoha,scu phandle to correctly
> configure the PCIe MUX.
> 
> Rework the mediatek-gen3 schema to drop any redundant constraint previsouly
> introduced for Airoha PCIe properties.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/pci/airoha,en7581-pcie.yaml      | 244 ++++++++++++++++++
>  .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
>  2 files changed, 249 insertions(+), 72 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


