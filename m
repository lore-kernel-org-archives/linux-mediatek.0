Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0041C87FC5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEVQRsxn0zXT4aqVHn8hzN1KQtVrCridlfiw5MJNtD8=; b=d3uJ0WZTr9IEKLB/joN8U6yVq8
	SZOMuHnn3iFtpAP0Xcrk7ffEc5LAUf9MUBd7hTTdK7bPprBk8y2xLT2W/94AHYX7TkBejOPWhU6+E
	KbZyFh2HaXmWm4V1ZRfO7FbQpls6MvU6TEzbZ3asXAwhacGQNQ0CbHoqJQzSeS4FWYsqV+1tWvF9Q
	7C+QaaGQCoorp/Zx4+mhOoU1yQK1pCKtpIGTklQYUonC3hqiii6j1EQUytasbEN3wsPqic6lzbYIF
	M9X8p2/wu/LkXR56OcN5kxhs2FbQLsAfwyXA6G35tkMbepJRUmG1aMj0aEFI7Mgbeby1dzogTQdu2
	pIzIJOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOD-00000007bFP-11tb;
	Thu, 24 Jul 2025 13:53:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetz5-00000007KAS-3h6s;
	Thu, 24 Jul 2025 11:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1139D613F7;
	Thu, 24 Jul 2025 11:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBABC4AF0B;
	Thu, 24 Jul 2025 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753355974;
	bh=xr9UfPrtsc/ykSfE3EhQN0BAiqLo6Aci+RNDYoh3hig=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=gtcIHEg+ph2IJp1WJwEVEk3R4hb7SfpYBo9kg5zwfeF9fN/WnQ/3g4N5KdsEraUxJ
	 a4kPxnUb6bid5gAmKGKCF0eNsTLWvajd+kYVB4502wn7qiMsf11sjF4R9lpE6mCSR+
	 P67vfBvqBl1xbYZsCu2vX1bxZGrZ52K4QMWbuo9F9vjdiw2jK+i6++M5BfJ5MP73Hc
	 6kOllnuqTh9sjsC7d3K1OIsNLehSe8QcLzIASlA5D65JUPFShxhMhZJ0esq5Y2XylZ
	 Kw+y5W5Hc6gxWxuEybtqyQNpcVHYHK+xTxB5pnUfeY2DDLHt8hF0/MdFi4v5IQxVVo
	 BR6VL794/V8cg==
Date: Thu, 24 Jul 2025 06:19:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-14-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-14-angelogioacchino.delregno@collabora.com>
Message-Id: <175335597061.1587930.6517956701582557579.robh@kernel.org>
Subject: Re: [PATCH 13/38] dt-bindings: remoteproc: mediatek: Remove l1tcm
 MMIO from MT8188 dual
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
Cc: jassisinghbrar@gmail.com, daniel.lezcano@linaro.org, mwalle@kernel.org, chunkuang.hu@kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, olivia.wen@mediatek.com, fparent@baylibre.com, kishon@kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, chunfeng.yun@mediatek.com, sam.shih@mediatek.com, ck.hu@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, tzimmermann@suse.de, arnd@arndb.de, andy.teng@mediatek.com, maarten.lankhorst@linux.intel.com, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org, eugen.hristev@linaro.org, mripard@kernel.org, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, mathieu.poirier@linaro.org, shane.chien@mediatek.com, atenart@kernel.org, sean.wang@kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, houlong.wei@mediatek.com, vkoul@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, linux-crypto@vger.kernel.org, p.zabel@pengutronix.de, linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, jieyy.yang@mediatek.com, andersson@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 24 Jul 2025 10:38:49 +0200, AngeloGioacchino Del Regno wrote:
> Even though the MT8188 SoC's Dual-Core SCP IP is practically the
> same as the one found on MT8195, it doesn't have a dedicated L1
> TCM and relies only on SRAM.
> 
> Set reg/reg-names minItems to 1 globally and override it in all of
> the conditionals for the SoCs that require more, and then split
> the mt8195/8188 conditionals to allow specifying only the cfg MMIO
> on MT8188.
> 
> Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 23 ++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml: allOf:1:then:properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'sram'}, {'const': 'cfg'}] is too long
	[{'const': 'sram'}, {'const': 'cfg'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml: allOf:3:then:properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'cfg'}] is too short
	False schema does not allow 1
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml: allOf:4:then:properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'cfg'}, {'const': 'l1tcm'}] is too long
	[{'const': 'cfg'}, {'const': 'l1tcm'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250724083914.61351-14-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


