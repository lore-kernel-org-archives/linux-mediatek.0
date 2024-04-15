Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D175C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 09:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcYon+bsi2rv75RZmXupzw7A7IxgZpAqc9+iMJGdTsY=; b=kB1AnecQdmXAdL0d8sjJo57BFH
	Dx3e/8wPhHVJmEHeISaCJYl88joqU9aAwfEGmmWHhq3dJ/xaN2KV3Zt7pLWaAumVXnId9XIez0y+b
	8WlETJDudxdz6oNcP7efIMpPtmZkbQViNQF0BrSuDjLfyCGNErlkv4XOBhZ+J7PJ0yr6IEPX756rZ
	/+piHQsnwp0ak5K6mtyKgtYHOfqXACfALcq1GVHonclIxCQqJg+/Zgb9NOlrvHyLOn4IAa0s9mVf5
	RX8W9h8o32a50piiVs7M82FbLc+5xY6i0IO+HzKX/ydCMpzxfBVcnc35jPfGpI+MiJRq70qLjpqEd
	4/ZT05dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIvw-00000007kxy-0zBo;
	Mon, 15 Apr 2024 09:47:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIvs-00000007kwM-02pg;
	Mon, 15 Apr 2024 09:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BA1CCCE0AF9;
	Mon, 15 Apr 2024 09:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B9EC113CC;
	Mon, 15 Apr 2024 09:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713174440;
	bh=1/IM4SD6RQjMA7f0keRrx2D+uJepsW1+KqOkX5Hx4qM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Syr37wLU2whncM8An2JhKAUTx3aGf/KU3btiPMYO3UcFq6l1XJm+Uk39ezKCvLhwh
	 xKn9BN/BrJ5+o9DbpMnOm0xsKz9F6mRJEqf3hL6kkYp2fFfKVblDQCbyNcxD9RjebT
	 +PORt+an85D9ovE0k0axBBF4M/B+u1e8B7bnMCcDhwfmhVjFBQsXWNbMbmW8LPaUIl
	 dQYAzphX91g2OHw/LSvgWsXdCM5e6lmW1LzOATB9iFd/AcYnpgfNzn3XG+kIYUNk6V
	 audGB83kKKy+MNtFvIHmVx+EohA2o/P4CepycjnxDJku6RKmo2937w8HAWP3O7FOmH
	 pK1wF1lUnt+Fw==
Date: Mon, 15 Apr 2024 04:47:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, alim.akhtar@samsung.com, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 peter.wang@mediatek.com, conor+dt@kernel.org, avri.altman@wdc.com, 
 matthias.bgg@gmail.com, stanley.chu@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org, 
 bvanassche@acm.org, martin.petersen@oracle.com, lgirdwood@gmail.com, 
 chu.stanley@gmail.com, devicetree@vger.kernel.org, jejb@linux.ibm.com, 
 krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <20240415075406.47543-6-angelogioacchino.delregno@collabora.com>
References: <20240415075406.47543-1-angelogioacchino.delregno@collabora.com>
 <20240415075406.47543-6-angelogioacchino.delregno@collabora.com>
Message-Id: <171317443702.1944933.10779110163028215758.robh@kernel.org>
Subject: Re: [PATCH v3 5/8] dt-bindings: ufs: mediatek,ufs: Document MT8192
 compatible with MT8183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_024724_435109_272EFD9F 
X-CRM114-Status: GOOD (  12.64  )
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


On Mon, 15 Apr 2024 09:54:03 +0200, AngeloGioacchino Del Regno wrote:
> The MT8192 UFS controller is compatible with the MT8183 one:
> document this by allowing to assign both compatible strings
> "mediatek,mt8192-ufshci", "mediatek,mt8183-ufshci" to the UFSHCI node.
> 
> Moreover, since no MT8192 devicetree ever declared any UFSHCI node,
> disallow specifying only the MT8192 compatible.
> 
> In preparation for adding MT8195 to the mix, the MT8192 compatible
> was added as enum instead of const.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/mediatek,ufs.example.dtb: ufs@ff3c0000: compatible:0: 'mediatek,mt8183-ufshci' is not one of ['mediatek,mt8192-ufshci']
	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/mediatek,ufs.example.dtb: ufs@ff3c0000: compatible: ['mediatek,mt8183-ufshci'] is too short
	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/mediatek,ufs.example.dtb: ufs@ff3c0000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240415075406.47543-6-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


