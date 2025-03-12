Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FBBC28B2E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 08:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIpMfdW1NjO2vBxzwArs2MGMsF9fvHasi0kvz7CQvzA=; b=iaqoDDq2f2Ae4BQinvcdz7v8KF
	3ReOQ0RaQw+3GQgtsVmqiD7anKcm1ogtNzmWBrm2auFSyjr/ZtuDY064Gkxhc3VkrA6mk7A2nupDW
	P2Vy6GR6pzOXhDF6HGSNi40ueBBQCt0ZQYsNpooQZhH6TNpKDKe8ZxdoFN/nGS1dB5hmbKB/96C8d
	9MHWYbv0KoUkO+Wr0NTvZS/sh1D9wJpVpvyu17z1JsKjjkvpuDwmb7KwUSJuUQQcG3PVKPQREsy/U
	M5upRMsIuMGSWHYI5FlK1t6baF/gYuZJzZIPG0z8q28qQAgya/hko1RvsoN+QfPL9AOjzUgoZftsj
	AKfhX3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsHBf-00000007nd1-1LnL;
	Wed, 12 Mar 2025 08:11:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsHBT-00000007naG-2sXZ
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 08:11:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0CE35C541D;
	Wed, 12 Mar 2025 08:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E1EC4CEE3;
	Wed, 12 Mar 2025 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741767082;
	bh=d0Luv00eOwF4pCo4R9zwkFMKjuOCPFsKc/aV56dU+Xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c88TynugszjyEah7y9kRUh37Hp8q+bLLG4Hx2s3DZPttwUO1xAWa/D3CJposk+jae
	 017WnxgNy6ddLxZ+AvcRXsjwVq97Cztj0jKuMhSQrftlwcQVB3JV/Q+PaVzQywf1c5
	 JumnebaCky8RX6N5rB5//GyyI3G0/1AXvQLzXbo4Otk8Qh6OOhWPdhiKgiJT4g7geO
	 BNN8sfY3sVk30qDU+jQ2eOjhE0Ke7oOOP2kHqyKzF55YhWpGag58aSNUWpUbRIAD6k
	 II/44ArIFOIVmi9jQ7QUo31QuxuqYy1JKFGUDxaUqFVlcZxvOAiCo7ENtdLFPQz06m
	 8KxE78JGI+43Q==
Date: Wed, 12 Mar 2025 08:11:17 +0000
From: Lee Jones <lee@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: soc: airoha: Add the pbus-csr node for
 EN7581 SoC
Message-ID: <20250312081117.GJ8350@google.com>
References: <20250311-en7581-pbus_csr-binding-v2-1-1fc5b5e482e3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311-en7581-pbus_csr-binding-v2-1-1fc5b5e482e3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_011123_763770_7479F116 
X-CRM114-Status: GOOD (  14.03  )
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

dt-bindings: mfd: syscon: Add the pbus-csr node for Airoha EN7581 SoC

> Introduce pbus-csr document bindings in syscon.yaml for EN7581 SoC.
> The airoha pbus-csr block provides a configuration interface for the PBUS
> controller used to detect if a given address is accessible on PCIe
> controller.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Move EN7581 pbus-csr binding in syscon.yaml
> - Link to v1: https://lore.kernel.org/r/20250308-en7581-pbus_csr-binding-v1-1-999bdc0e0e74@kernel.org
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 4d67ff26d445050cab2ca2fd8b49f734a93b8766..7639350e7ede40c8934f41f854ff219354fb3e5b 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -27,6 +27,7 @@ select:
>      compatible:
>        contains:
>          enum:
> +          - airoha,en7581-pbus-csr
>            - al,alpine-sysfabric-service
>            - allwinner,sun8i-a83t-system-controller
>            - allwinner,sun8i-h3-system-controller
> @@ -126,6 +127,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - airoha,en7581-pbus-csr
>            - al,alpine-sysfabric-service
>            - allwinner,sun8i-a83t-system-controller
>            - allwinner,sun8i-h3-system-controller
> 
> ---
> base-commit: d71fc910c58ed85a2ad5143502030bff73fc2088
> change-id: 20250308-en7581-pbus_csr-binding-974e1b40fb36
> 
> Best regards,
> -- 
> Lorenzo Bianconi <lorenzo@kernel.org>
> 

-- 
Lee Jones [李琼斯]

