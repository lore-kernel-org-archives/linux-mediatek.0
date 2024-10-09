Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0395CEE34F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 21:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+y49hqUyMV4id48JXXFVhOXmA8GbadnR8vmhZR7+IGc=; b=f/OjTU/29B99hROFiaKcpLreEc
	znl4RMWG61MExRbyQIhnD1ToQUfSXuE6sr8TPTwTmbHgU6FqKdDTXv1TGKFwyUTzibOdmdjtvGUfC
	SW/SnqoIyfzTsIw9KITCPAzVtS0VG3YOMQlUXD/SazlVW5e/JaebyWd0FGQmiHjF3rand1tW03mxV
	BnDFZ4PO7aDAISM8Ad2rOoP+zLm/BwoB0TA7+6ouqPAsKwo+CQmDn5ITKthggwqU/GwXQKdY65jnO
	jLHrGRLZd7mCf3p4PKMWpFLFk4H0PGmNU9uCW9TDkJHh193ssmvpBjuA1qyrhNComDEgLScU+b6Er
	ssMgsYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syeBS-0000000AmTJ-2gdq;
	Wed, 09 Oct 2024 21:25:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syeA6-0000000AmIW-3MCQ;
	Wed, 09 Oct 2024 21:24:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2255CA445D7;
	Wed,  9 Oct 2024 21:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1E5C4CEC3;
	Wed,  9 Oct 2024 21:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728509041;
	bh=BjEvB7skkEeR6d+4kVsgommqWcL5Ch3q5u9TPLPNrVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqrAB98leIdj82zuYYUEUn+3JmIzM8kOG1niL8LYQxL1P8up1LKWsv25+F2mTPaMt
	 F1lqhqogyrlVqBDReczONoUt/GCXcetIUCLRqe1Bsx2WR860+jfxcPkgqiynGV7LUq
	 8uM7NUK0eaHIvbR4M+uDmmdsGU1aM0yo9o087NYG/B/+BBwSWDkDyOXYoQR+AnktEa
	 /8ITYjZTYcMh0/mCLuuZriL8zfXHa7cjwUMNh5ykhfk7/kf5mK94QiNyAipzuQpnzr
	 jsLiVy++8UETOmfboawJBPJPGdJ6sQB1HajdxptNbCqH9aa2OEiuIgRYPsrX78Ie4E
	 JScIBdRUDWdtA==
Date: Wed, 9 Oct 2024 16:24:00 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard van Schagen <vschagen@icloud.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: crypto: Add Mediatek EIP-93 crypto
 engine
Message-ID: <20241009212400.GA735586-robh@kernel.org>
References: <20241009171223.12695-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009171223.12695-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_142402_927490_CFA905D4 
X-CRM114-Status: GOOD (  16.64  )
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

On Wed, Oct 09, 2024 at 07:12:20PM +0200, Christian Marangi wrote:
> Add bindings for the Mediatek EIP-93 crypto engine. The same IP is also
> present on Airoha SoC.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/crypto/mediatek,mtk-eip93.yaml   | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/mediatek,mtk-eip93.yaml
> 
> diff --git a/Documentation/devicetree/bindings/crypto/mediatek,mtk-eip93.yaml b/Documentation/devicetree/bindings/crypto/mediatek,mtk-eip93.yaml
> new file mode 100644
> index 000000000000..b0173b4da42d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/mediatek,mtk-eip93.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/mediatek,mtk-eip93.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek EIP93 crypto engine
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek, mtk-eip93

space?

Why mediatek and mtk? Is eip93 an SoC? 

> +      - airoha,mtk-eip93
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    crypto@1e004000 {
> +      compatible = "airoha,mtk-eip93";
> +      reg = <0x1fb70000 0x1000>;
> +
> +      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> -- 
> 2.45.2
> 

