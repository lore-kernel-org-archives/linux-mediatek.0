Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAC0CEACFF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 19:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ih7lobXrGPw+BK+mUS9VHquogHuORyAeQ0zQ8TqxTeg=; b=jl3fxpRquBgjyf
	5VKVR5yEycUTiXUhimyH1U2N0zngWBl5ir0lunrrORANYG83CuOldkqu9SNYSHpcO2gReOrBdM7rJ
	kWsIvztms1Mcunq4VnfKN0MIGvPtJZ3QDBRVyYSmOEz5k8qgh1vAcCkxbdD1STR+PDQ5YpdRWrGQl
	/QrXCvFFOy0DK8q0c9qFxtfUi275PCjJ/RJPDKRtFkjK/iPJ/rjqgZelW+M2fFpiozTL3KW0vkDeC
	hAVDepI6BDcpwX2HTwzEpzSwCpEyfEC9tAdpkmu9LXlpyJZOMb0Mr8k+PbEC8byjNqf3f0IkgUjtJ
	FCtPm2peDLRi5/oRiDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svixL-00000003vuq-2jIY;
	Tue, 01 Oct 2024 19:54:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sviw6-00000003vk6-0GMV;
	Tue, 01 Oct 2024 19:53:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E73A95C5550;
	Tue,  1 Oct 2024 19:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6217FC4CEC6;
	Tue,  1 Oct 2024 19:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727812407;
	bh=NFLRv70GcTrBbDEnGdZ7KPaDTsv4dzfmExIxAvDu74s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=b8JllB+FwCHpvRqMibjOaQLSYeg2RtfTiASOqUg1Kue7A1En1PAwde9qglggZjnQi
	 2u2dp3lhAbJL0EF9fKOJz235EukjTume/uFNB2Me8Wnc0kksuPUUY1ZNT8IgJl0qEu
	 XySROYY5RSRQiSwv6vFyucgNHgPnIplRBYXOfaTyIIXWumEULmBS9KF4LjBXFIMR/x
	 ew0h74wXowKXbO1Zh6kxViXZjlpsyIKUx9avnCfhI5hOEJltX1xkFGV1SodyWzBzEb
	 xYb8p8ZehcbO7QavsMzWIv/qIQ6PdwB90WBtXW13t4Sc8a0XJnd72JLXMmx7e6SwZf
	 kUTokuBrQoj5A==
Date: Tue, 1 Oct 2024 14:53:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: PCI: mediatek-gen3: Allow exact number
 of clocks only
Message-ID: <20241001195325.GA222000@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925110044.3678055-3-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_125330_256359_CF536E54 
X-CRM114-Status: GOOD (  20.01  )
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

On Wed, Sep 25, 2024 at 06:57:46PM +0800, Fei Shao wrote:
> In MediaTek PCIe gen3 bindings, "clocks" accepts a range of 1-6 clocks
> across all SoCs. But in practice, each SoC requires a particular number
> of clocks as defined in "clock-names", and the length of "clocks" and
> "clock-names" can be inconsistent with current bindings.
> 
> For example:
> - MT8188, MT8192 and MT8195 all require 6 clocks, while the bindings
>   accept 4-6 clocks.
> - MT7986 requires 4 clocks, while the bindings accept 4-6 clocks.
> 
> Update minItems and maxItems properties for individual SoCs as needed to
> only accept the correct number of clocks.
> 
> Fixes: c6abd0eadec6 ("dt-bindings: PCI: mediatek-gen3: Add support for Airoha EN7581")
> Signed-off-by: Fei Shao <fshao@chromium.org>

It looks like most changes to this file have been merged via the PCI
tree.  I don't see dependencies on this in the rest of the series, so
I'm happy to take this via PCI if it makes sense.  Or if you prefer
that this be merged with the rest of the series, that's fine and you
can add my:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Let me know if I should pick this one up.

> ---
> 
>  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml          | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 898c1be2d6a4..f05aab2b1add 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -149,7 +149,7 @@ allOf:
>      then:
>        properties:
>          clocks:
> -          minItems: 4
> +          minItems: 6
>  
>          clock-names:
>            items:
> @@ -178,7 +178,7 @@ allOf:
>      then:
>        properties:
>          clocks:
> -          minItems: 4
> +          minItems: 6
>  
>          clock-names:
>            items:
> @@ -207,6 +207,7 @@ allOf:
>        properties:
>          clocks:
>            minItems: 4
> +          maxItems: 4
>  
>          clock-names:
>            items:
> -- 
> 2.46.0.792.g87dc391469-goog
> 

