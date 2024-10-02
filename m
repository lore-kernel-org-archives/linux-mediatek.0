Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ED1CF31BA
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 20:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=AUm2fIpD7gR5XAPkikmx/jZW6/ebK76EYeZaAXIl9Tg=; b=BxDC3pm+VH1qwI
	j2TQ8l0t2y4YKVQb6e7vVOWB6Ba37MDec8qwBnwT3zOa2VkyLIt7YWLtEWL6fN2gOw/LwSauTdRTN
	zhPULkPuQTl3GJTZmoxNMt+bsT9VlYiO2nr1RMveBE5b9NtmQl29xY7nCCzJys5SPN19IEvgOvnHn
	nBjf9t8EqSd360NizsQ0uaKkyKEH2Vs1luoQA2z+2TONGh4Yx2DunaH/RlKbGK/qvNrX8huDMc79I
	pOiXOsVe48tRB0M/9TRKm+ZwlXt45UFwoO5mNXYO8sv/Vl29AB7aqmF0jjuGMRVeLNTAma9q75bK0
	mb/5QzBswlkx/jdG+NtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw61O-00000007PLf-35hM;
	Wed, 02 Oct 2024 20:32:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw608-00000007PCE-1Kqs;
	Wed, 02 Oct 2024 20:31:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7BDC5C271D;
	Wed,  2 Oct 2024 20:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E57C4CEC2;
	Wed,  2 Oct 2024 20:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727901070;
	bh=crEUxguLyR8AxI8M3uc/7Ka3HwunEDmQE3TgZ3H+zT4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NuKfeoFJedXgQUO3OI7kIvcObLYRqOR3loCgKn1xH3ELmkN3DEREbyHepZjdEc/b5
	 jpEv70VMhCuNxk8OegQfRgznzFDGWy7Z56FxwHz2i6chk53/UJyStYU2+SVRjhlkhJ
	 BA7+XaKhT5SQfkhPHLnbcQG33K1ck0bYtDfMGaOZgeo9c37RY5QOy2OmtvXg3Nn6M+
	 V9syNYBbl6G+aRvCNPsaZuIf1r174ZVTf1WVM/MjIUocQFNUqGKqI3C1YOwiHAUCMq
	 JxyZ5w6RdTfAZVTU3EuWLPEodR6hD4Tvnflb2u+1FljQs2lXb4SO/pjcQVWWlrcqPF
	 I9UcoOw0P37sQ==
Date: Wed, 2 Oct 2024 15:31:08 -0500
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
Message-ID: <20241002203108.GA269428@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925110044.3678055-3-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_133112_428665_A29798AE 
X-CRM114-Status: GOOD (  17.18  )
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

This patch only applied to pci/dt-bindings with Krzysztof K's
reviewed-by for v6.13, thank you!

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

