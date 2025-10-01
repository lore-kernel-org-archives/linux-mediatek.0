Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D72CAC5BB
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Oct 2025 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVLbt0f/TXq2Uht/+ijfscIBJVJwNvqTz+0eoXtChrE=; b=CaFGEav26Ffa0OI2465OSLSONP
	TllvQc9otMwIvyOcPVW3NAcvP89gFkB+xbccNzy+n7866KyO1ras8Ta5BfqmPUheXul3bINmwVAss
	WeYO2Kp9SgijKk71fwMHHMv60QXCeyZ9Z+4q07qIu7dEMUwnKGaI3VdWXQEZGql66RXFOX96v83UD
	WW4W7Enyv4RZgQkfWi22PEfSmHszCkySXtPxNTH9ixcTIpxN1qDUcr63FA/RZxj+oVrbG3GXkBRvs
	R90Oa55plY7we6vN09bNvVmITcbF6fD39APRq8jc0ueT0KzRmc9iFc7ShCN4oT1O4yeSqDM0nRFkr
	WcDA8lAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3z1S-00000008RMf-0Z0h;
	Wed, 01 Oct 2025 15:45:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3z1Q-00000008RM0-0k3z;
	Wed, 01 Oct 2025 15:45:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 686E561E89;
	Wed,  1 Oct 2025 15:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033A8C4CEF5;
	Wed,  1 Oct 2025 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759333539;
	bh=C+zDEytAGVJtHdXPlshDYcbrYHV+WvMLrd6CmfU3n5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hio8FR4kA5VN0FqaJFABg54URHc3ZtZuM2f5hhr38F2OCEbCbmhoEZ6QG5FCD4ocJ
	 EvC9bBZRwtO/2jBalZ4176+ioSAAq4L3+b8rU0F3rGlWX5WwXvPDCXj4cCn/dnmvX3
	 gwlwrjZHhF0+T72rQjf5/J+2NH420hRW8/BWwkEFl7QwN+7XYrzi0qU3Tfnkkx1Z9k
	 PAZWAItoLXvAFQqByBxlBDJ+ubch8hb/WqWoADG2gBt7UEgIi5k58QY3p9Jm/1xtQ3
	 k0fokyljbqM1s/G534QTz0i0aILhAFGQnQveVCZRIcuOqTLbm3as6orHe27mmqUpZB
	 SyPdfb8kw2yTg==
Date: Wed, 1 Oct 2025 10:45:37 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v6 1/9] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
Message-ID: <20251001154537.GA1833526-robh@kernel.org>
References: <20251001111316.31828-1-angelogioacchino.delregno@collabora.com>
 <20251001111316.31828-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001111316.31828-2-angelogioacchino.delregno@collabora.com>
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

On Wed, Oct 01, 2025 at 01:13:08PM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks.
> 
> This chip is fully controlled by SPMI and has multiple variants
> providing different phase configurations.
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Link: https://lore.kernel.org/r/20250715140224.206329-2-angelogioacchino.delregno@collabora.com

Why do we want a link to v5 here in the git history forever? You've seen 
Linus' recent comments on Link usage?

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6316b-regulator.yaml | 46 +++++++++++++++++++
>  .../regulator/mediatek,mt6316c-regulator.yaml | 46 +++++++++++++++++++
>  .../regulator/mediatek,mt6316d-regulator.yaml | 41 +++++++++++++++++
>  3 files changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
> new file mode 100644
> index 000000000000..e7a6b70cdab2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6316b-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6316 BP/VP SPMI PMIC Regulators
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek MT6316BP/VP PMICs are fully controlled by SPMI interface, both
> +  feature four step-down DC/DC (buck) converters, and provides 2+2 Phases,
> +  joining Buck 1+2 for the first phase, and Buck 3+4 for the second phase.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6316b-regulator
> +
> +  vbuck12:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +  vbuck34:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmic {
> +      regulators {
> +        compatible = "mediatek,mt6316b-regulator";
> +
> +        vbuck12 {
> +          regulator-min-microvolt = <450000>;
> +          regulator-max-microvolt = <965000>;
> +          regulator-always-on;
> +        };
> +      };
> +    };

One complete example for the pmic please rather than incomplete child 
node examples.

Rob

