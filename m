Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38303C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRDVyPPXF1WI10i9RJCHPuWc/F3jFHZVmbY8FquwWRI=; b=rUvx5LKtuAQ3P/IG2cOdgxw+7g
	FCWtwl3ZTASarSrDwqB3Ozsoz0zUMoUT4n1k9ArUBhMKxeFK8THHi0i4vU+N/9fiMAwDHkqu6W/x7
	H6UydI1M2V39HAbX/hdZjIgN618yMz/8K3cm8duoVPDilkS3pGRHs4cV1d4yGW2iuGbkb9FL3L71U
	tqzc0yCwrePYnPv9VKFd7J0nn+LCoqtrLQbmaFXe0ruhe8/WY8fWa57l0x8MfCPR6zxXE6KKiGNHK
	dtAEx6RuJLPtMC/vvdB+Gr4q5biedEboGEKLJjJnp5Ooiy4ytKRu9dl/C4JVJkMXmrhyuCqefGWtF
	HJaMVOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlkK-0000000D2BI-3HrY;
	Tue, 16 Apr 2024 16:33:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlk7-0000000D23M-413x;
	Tue, 16 Apr 2024 16:33:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DC7561262;
	Tue, 16 Apr 2024 16:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCFFC4AF07;
	Tue, 16 Apr 2024 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713285189;
	bh=csn7plls86qJ8MjwV9+WAk2lo/ZQ8CZ8NeCgBsin5as=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=rQyW1gQ2aTwQ7NA6zNzj3giMhcljJKR2udqs3R+6U1Y9gwNOi/Q+0MpydxT1cAKlf
	 nCsXhvblkJWA1eyEG2mi71RSPas1rDhw/uxo3djlYSPy/PMp24Yc2o+iFXM5UhtO4C
	 6O7bNVJF8pNPBeHWz1qTI/Q0W8gVUj9lldcz+7YpBCL93cC3s88HjS9EU2KqUXXml4
	 AWT9nFQ2G389P91LjRAEwEicsExFOwrxLDVP5C6WA1ildYRX/FxkBEepWt1rpXZQmZ
	 D2Dhs0aa8uR2qfqzWrNYYm8joFv5+omdUh3NnLk3elEeVl7BdutrzkFZAgoG+ks2gg
	 JahbvMbvfN9eg==
Date: Tue, 16 Apr 2024 11:33:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: amergnat@baylibre.com, keescook@chromium.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
 lgirdwood@gmail.com, conor+dt@kernel.org, linux-pm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 henryc.chen@mediatek.com, gustavoars@kernel.org, wenst@chromium.org, 
 djakov@kernel.org, matthias.bgg@gmail.com
In-Reply-To: <20240416153805.431118-4-angelogioacchino.delregno@collabora.com>
References: <20240416153805.431118-1-angelogioacchino.delregno@collabora.com>
 <20240416153805.431118-4-angelogioacchino.delregno@collabora.com>
Message-Id: <171328518502.2611010.15541241533158451489.robh@kernel.org>
Subject: Re: [PATCH v1 3/6] dt-bindings: regulator: Add bindings for
 MediaTek DVFSRC Regulators
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_093312_273295_D337BF13 
X-CRM114-Status: GOOD (  12.33  )
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


On Tue, 16 Apr 2024 17:38:02 +0200, AngeloGioacchino Del Regno wrote:
> The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
> are controlled with votes to the DVFSRC hardware.
> 
> This adds support for the regulators found in MT6873, MT8183, MT8192
> and MT8195 SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek,mt6873-dvfsrc-regulator.yaml     | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml:5:10: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt6873-dvfsrc-regulator.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.example.dtb: dvfsrc@10012000: '#address-cells', '#size-cells' do not match any of the regexes: '@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8183-dvfsrc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.example.dtb: regulators@0: dvfsrc-vcore: False schema does not allow {'regulator-name': ['dvfsrc-vcore'], 'regulator-min-microvolt': [[550000]], 'regulator-max-microvolt': [[750000]], 'regulator-always-on': True}
	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt6873-dvfsrc-regulator.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.example.dtb: regulators@0: dvfsrc-vscp: False schema does not allow {'regulator-name': ['dvfsrc-vscp'], 'regulator-min-microvolt': [[550000]], 'regulator-max-microvolt': [[750000]], 'regulator-always-on': True}
	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt6873-dvfsrc-regulator.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240416153805.431118-4-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


