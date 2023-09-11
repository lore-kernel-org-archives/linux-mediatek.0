Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B76FEE801F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 15:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Uh7tNMW2wosKzOXuyOvGLfnSDq2kd2kas9vBadhsFQ=; b=jGUBG4ct4GzJDPNg3tJpLdFuji
	PXfNXauokcnw+82xXlXy4P4szTqtiVlap3StUNZqMdCMRLVSe6ca8xKgHgc3++JHtNFCPOys7Vs3J
	F45ALfbQQ3EJngKQcQMnQOgUT5+UVnHOwr/73FstyHyfpp9IPEuBqIAnLIh+YQNgS2tcYdGQ/QOX3
	pVyXz98b/2T6+HKk9ArP5nRC9iZz5XO1jSF6j4L7QxoyRpVvMmFs1ylGjbBC/2+cz2hDEN8UZhgvP
	i/0+V3dISGhwDSP0LwGeX0zUzF3upJlP4u0h0BD9MJrNXY8evyPPH8uJH+nJr0YWJ1n2UktYqGphq
	qiXzMhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj5v-000vRt-1W;
	Mon, 11 Sep 2023 15:44:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj5r-000vQg-2F;
	Mon, 11 Sep 2023 15:44:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 93CADCE10DB;
	Mon, 11 Sep 2023 15:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208B9C433C8;
	Mon, 11 Sep 2023 15:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694447091;
	bh=UypZKzekW0Fnyf/smilvBj2pL+glSdtZ2s73jeqIa1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KeFuPBsx5eG593nKlIqcbZckZNxJOEEWxbPFIgnX1pqMeBsyDlT0J4/elUxqs8uGw
	 319DNMooXPc1YxiFXes6YWrgimtBwvCdbQDSWraDVqjIduYr+yItGP2o/Bk6LCtUBG
	 9c7wAGtZBSZ7lS3tYpdRGX1XV6EW8hKIyadGhk+8XrqQX/qJA3i3pB3MbDCN+pLjkN
	 ANBdfpsd6v+pbUezujnXqEKfaWEBk07zeD8PCfFa+IZJe3x8ZGlrC8wnyckx7HH3vT
	 XSu3biW8py3ETqCF6rMlRW764U5RTVQDmHb0ajfh7qG2B/2kb5JHmmxx/lczXeeMDy
	 OoW5AY0nLzs8Q==
Received: (nullmailer pid 1295173 invoked by uid 1000);
	Mon, 11 Sep 2023 15:44:48 -0000
Date: Mon, 11 Sep 2023 10:44:48 -0500
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, tjmercier@google.com, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Message-ID: <20230911154448.GA1279317-robh@kernel.org>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-9-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911023038.30649-9-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_084456_093382_AEB43352 
X-CRM114-Status: GOOD (  18.88  )
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

On Mon, Sep 11, 2023 at 10:30:37AM +0800, Yong Wu wrote:
> This adds the binding for describing a CMA memory for MediaTek SVP(Secure
> Video Path).

CMA is a Linux thing. How is this related to CMA?

> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../mediatek,secure_cma_chunkmem.yaml         | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,secure_cma_chunkmem.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,secure_cma_chunkmem.yaml b/Documentation/devicetree/bindings/reserved-memory/mediatek,secure_cma_chunkmem.yaml
> new file mode 100644
> index 000000000000..cc10e00d35c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,secure_cma_chunkmem.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/mediatek,secure_cma_chunkmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Secure Video Path Reserved Memory

What makes this specific to Mediatek? Secure video path is fairly 
common, right?

> +
> +description:
> +  This binding describes the reserved memory for secure video path.
> +
> +maintainers:
> +  - Yong Wu <yong.wu@mediatek.com>
> +
> +allOf:
> +  - $ref: reserved-memory.yaml
> +
> +properties:
> +  compatible:
> +    const: mediatek,secure_cma_chunkmem
> +
> +required:
> +  - compatible
> +  - reg
> +  - reusable
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +
> +    reserved-memory {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        reserved-memory@80000000 {
> +            compatible = "mediatek,secure_cma_chunkmem";
> +            reusable;
> +            reg = <0x80000000 0x18000000>;
> +        };
> +    };
> -- 
> 2.25.1
> 

