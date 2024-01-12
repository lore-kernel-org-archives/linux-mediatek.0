Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62B6C4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 11:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuiIEoPFa4jNwhIr0eG9Xd6oT1aWRW2K4po/r7eTyRM=; b=IdyvXaac8nw2vgNAiZ+38oLTEU
	kkFtsJU1vjI026fgwQzU/RwHAnDn0ZEIDe4Cz3wn0+orEazBjYI5rqiiZWsabbfYSr8hPFw5x+7PB
	btvdOFAurn+PYJ/6pJ884Ma5MbG7irtg+M8G+//k+9ATxX80eGu2/1Ig5eE4hiYZz7cqfprRHqtcj
	KIiELMaUcP42bGamuvkb5p2sVk3y93bqDHIJZ5i4/qM/MhuqNfmeIWeTJRW7x2o5czRqUUareV5Gm
	8fGzBVsyUK82fqDOI41a9VLnDF0UkAlk6zZFiy+VT4m2IrJgA05MD7pFChpSbx4EblVWkeQVGufHS
	HHbRo5qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOFVQ-002Ysj-24;
	Fri, 12 Jan 2024 11:15:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOFVN-002YrR-1A;
	Fri, 12 Jan 2024 11:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EFD37CE1E57;
	Fri, 12 Jan 2024 11:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6902BC433C7;
	Fri, 12 Jan 2024 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705058106;
	bh=eDP68AxPwKFZxVK+hqHIw7GIyQdIy4JXRj3huwM1kIM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=fdGNKmTse8tw0KRJfFiYEux1Fgi/qCsXBGhsmdNt72paaKb/GGGPaPdLkIwXTsXz3
	 U1knuRqfh1gCPK3AIlRFYJ1MAj3F4KtbrWKeMvV9je2PgxU0F+A6tBwflQXu+Y3t+B
	 D3IOB5Jn2JyDTYwrzVvxPJvI5XudYHZj2w97mclY68+PIq8F6XTRnU0Y1/0AkUK6lf
	 C1onrq9NTbv7QEpsn6a4QNNhBV3oOUNAMYu7OFAtFnvilg3Srd4eLHhbBGLlaMe0hA
	 sr9m34Iqg+/80OeCsqLApKhXFGcQRDJJFdtw9BelIvMfISRPJfqtinfTrZKz8C6tVl
	 FfOWEqKh0f+2A==
Date: Fri, 12 Jan 2024 05:15:05 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux@roeck-us.net, 
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 kernel@collabora.com, matthias.bgg@gmail.com, gregkh@linuxfoundation.org, 
 heikki.krogerus@linux.intel.com, robh+dt@kernel.org, cy_huang@richtek.com, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, chunfeng.yun@mediatek.com, 
 devicetree@vger.kernel.org
In-Reply-To: <20240112094538.65639-1-angelogioacchino.delregno@collabora.com>
References: <20240112094538.65639-1-angelogioacchino.delregno@collabora.com>
Message-Id: <170505810426.2663263.815471300666938167.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: mt6360-tcpc: Rename IRQ to
 PD-IRQB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_031517_594962_9B16B8B9 
X-CRM114-Status: GOOD (  11.37  )
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


On Fri, 12 Jan 2024 10:45:37 +0100, AngeloGioacchino Del Regno wrote:
> Since there is no user yet, rename the only interrupt of this device
> to "PD-IRQB", avoiding underscores.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6360.example.dtb: pmic@34: tcpc:interrupt-names:0: 'PD-IRQB' was expected
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6360.example.dtb: tcpc: interrupt-names:0: 'PD-IRQB' was expected
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mt6360-tcpc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240112094538.65639-1-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


