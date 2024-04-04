Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8ACCD1292
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 09:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RddDiGdvjhhZyEX7BicAsFxkLqT6/XIDSocM2Q7RQuc=; b=aF/IKc5SgohGrBNDEejNdraziD
	h92INtOuGYfw1rhaWGYkJJMTDFPZt/LjziRfF3U5FBIh+xG825x/4lfBg5jjSbGniPsVcsfkozapz
	prW15GIZPJzw2hn9ibw9ZJuVXkHIgJUL7rv7LR5GC0Nu0DtkRq0pF2hakcSKkrGWHNQ8gd1iugLUL
	T3Zs3lPgtdIgUfeHtTfeccjavcFj5oJdqDxabOzyuxeeQ3QRclWAP/264yKMargnugqgGQJYdSnY5
	SpivXTRETrECjeNzPenmRfUrMlhq/hsGBeOseHlonbJNx+lH/oxK3ZpyvXOpc0va6EJHHkO4MCP4/
	oHPPWeRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsJML-000000020BA-023d;
	Thu, 04 Apr 2024 09:26:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsJMH-000000020AY-3MOm;
	Thu, 04 Apr 2024 09:26:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1099C6152A;
	Thu,  4 Apr 2024 09:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799A2C433C7;
	Thu,  4 Apr 2024 09:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712222768;
	bh=LQHPeCxsTClRiQFklZkM7OeAADhg7xB3paGeP09fuNI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ccof+V0eEDquGLB7ROWgkSuWRHrYjTBY/0h345S8VTXnPbHvM/M0douzbdfJSnRPk
	 qHCwLS5haZtliW6qAVMI3aNB5nz/DPmhoOAvnd2wgmhUX2vkFo4JTuMg2URnq58CsC
	 VA+RZyLMGk3NUeYB8b8wqjgEG28bi1INAaazGIZ6FvmFcjYpeENlOP+u+R6ikKMFY+
	 aVwkX3SVcwmuE6JCd3dNSQDEV4tqjJQv/KZTxZBfLj/nzuqAcFNwLzxJjzPHOxlOMb
	 JQfjiZMJTpp/tY/Q2GdV3HJQMg8Zyl3tKaWDk4uYaynFUXI43i33hzOsM60SdjKJhN
	 i/uwGLI+moLyA==
Date: Thu, 04 Apr 2024 04:26:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: shawn.sung@mediatek.com, ck.hu@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, 
 chunkuang.hu@kernel.org, daniel@ffwll.ch, p.zabel@pengutronix.de, 
 wenst@chromium.org, matthias.bgg@gmail.com, airlied@gmail.com, 
 tzimmermann@suse.de, kernel@collabora.com, 
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, yu-chang.lee@mediatek.com, 
 jitao.shi@mediatek.com, conor+dt@kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 mripard@kernel.org
In-Reply-To: <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
References: <20240404081635.91412-1-angelogioacchino.delregno@collabora.com>
 <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
Message-Id: <171222276632.1805081.13595219837975408757.robh@kernel.org>
Subject: Re: [PATCH v1 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_022610_029639_9EF565BF 
X-CRM114-Status: GOOD (  13.31  )
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


On Thu, 04 Apr 2024 10:16:34 +0200, AngeloGioacchino Del Regno wrote:
> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
> per HW instance (so potentially up to six displays for multi-vdo SoCs).
> 
> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
> so it only supports an output port with multiple endpoints - where each
> endpoint defines the starting point for one of the (currently three)
> possible hardware paths.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml: properties:port:properties:required: ['endpoint@0'] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml: properties:port:properties: 'required' should not be valid under {'$ref': '#/definitions/json-schema-prop-names'}
	hint: A json-schema keyword was found instead of a DT property name.
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml: properties:port:properties:required: ['endpoint@0'] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml: ignoring, error in schema: properties: port: properties: required
Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.example.dtb: /example-0/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8173-mmsys', 'syscon']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240404081635.91412-3-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


