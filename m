Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73138C4453C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2D+aH8WuHklyK0noK4NoQdLqwMi37J+55Pzl8huO7f8=; b=E8DQcuAzc8jsR5CrP+9iekejXN
	S7E3SUCwn75JcwqDIK75s6P/mcvY6xrpede+mDhkvUUJh2xN2iiud1MZI690r9AG8gREa2ZgNWegi
	S72yfKACwUqLmtuZwI+/n4I7YlFHhH2xfSX7620NFnBc44q875GlQ5E8cFh0R81/9VlcLT8zaCCut
	qBHen2R1C2C7+XfHRvP63u5MxYrmG1o/A0WgGUo4Ht3x6pLBuDtY3qLw3nf0YHYPBktuD7XeHFzMC
	q6Nbsz6JRnTRFYJoXAsja0TlSEXM4jxkkXZ5zcTcqMyg7htYXxjUVFTcN0a2WrI1T6Q9Tc9wWfVQw
	G6K4nx2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wma4x-0000000CNrL-0qjH;
	Wed, 22 Jul 2026 16:45:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wma4v-0000000CNqh-3foF;
	Wed, 22 Jul 2026 16:45:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E68340C52;
	Wed, 22 Jul 2026 16:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C95B1F000E9;
	Wed, 22 Jul 2026 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738753;
	bh=2D+aH8WuHklyK0noK4NoQdLqwMi37J+55Pzl8huO7f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fhOjfDnEANtN4cA7JZRnGj6Ny3KPd0RQnhcaM3BFHt/Q0OGYZdbjYJ2ooAAyfpE2Y
	 mXXl+Ur6e738u5fFX7IAbVXlEjDSa07/7OD2byumLtEEq3a+2TkLbLJvQQO6yVukgq
	 KFIJiwhJjazkUHT8PT8KXQRZTPP+4ixr+vElC5s19MFbh4wmi4J68i9Zy9nJwh3P4T
	 q0WTb0e353E2uM1ewNzU8UdKRRFY+N4DEecY3SApW1nVl/u12Nn7HPKrmmeHlEJxj3
	 R4XbVw5zKGh2VtORI4CKw/CQEtMZ4FQSCA2FPaIl4/9APzwnkZR1cEjTz79hA5uXrx
	 oafSQ8cvtYpBg==
Date: Wed, 22 Jul 2026 11:45:51 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH v2 34/46] dt-bindings: display: mediatek: Introduce
 MT8196 Output Processor
Message-ID: <20260722164551.GA1079705-robh@kernel.org>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-35-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714114414.184512-35-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 14, 2026 at 01:44:02PM +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the Overlay Output Processor IP found in
> the newer Generation SoCs like MT8196, MT8894, MT6991, and their
> variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8196-outproc.yaml     | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml
> new file mode 100644
> index 000000000000..7deffba46404
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-outproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Overlay Output Processor
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek Display Overlay Output Processor hardware handles the
> +  post-stage of pixel processing in the layer overlaying process and
> +  is also capable of performing gamma correction, ensuring that the
> +  per-pixel values are within the expected luma range.
> +  If an instance of this hardware is configured as last stage, it is
> +  also capable of generating VBlank (Frame Done) events which can be
> +  then dispatched either via an interrupt (to the CPU) or through a
> +  Global Command Engine (GCE) Event, internally sent to programmable
> +  Command Queue (CMDQ) Engine(s) for offloading purposes.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-disp-outproc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: Optional VBlank event interrupt
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  trigger-sources:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

Not a defined property. You should have gotten a schema warning on the 
example.

Same problems as the other patches that I raised.

Rob

