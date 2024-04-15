Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC263C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03NGKAN2hp4YHj9E+hwkfJZhTFlTNFOcvj11ODehMwY=; b=XsXHliBHiJy78cTk2UwjRDLLiq
	wGDO2wYFvo/Vp+Kq4wWqj43djhvamsitHzyWoE2o1topVxsKwvKwZIrR/UtbUNLyQgEKEYBMxhsn8
	a3DJbP+QElrWzj/QjEEg+iWA7xYzMaUymQelfzWGLdVvVKmrIkucQ2h6G/2pH0i5VEUO3TYlpg29Q
	fxk6UwKWgb7kKV0y9sGWzoMbdbx4ZHUG1GWeThn6JFx2fQxRXTSErFenLAfwu6uT7GlipaNvleJsv
	rBm6wVtZMcdzfODjHjp7KiO1o/HXIrO68Miz+NWLQGJtxEJ97wB/8bzXY7Oc5QmBV9owOg3IiAo7H
	WjtMKanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIw3-00000007l1e-0n0f;
	Mon, 15 Apr 2024 09:47:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIvu-00000007kwP-1ulM;
	Mon, 15 Apr 2024 09:47:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D4C560C37;
	Mon, 15 Apr 2024 09:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41666C113CC;
	Mon, 15 Apr 2024 09:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713174442;
	bh=b0FQxsbCgCzCZdXSzRBeyPJvArlWcYQJsyXBEM3fAlA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=SLM/wjQII2paCS4pC4cBhfQNGEVDFdfURyHeUayFWaiE2+D6NvavEMcojDphgrkHn
	 E6Fez1ZR68P+OBVzgULD1VJ+aNw5xV36f4N/ZZsY/b3WYEJM7j2gGpz6ejb8QBROqv
	 D+KpKj1Rew3XOWNWVjpBKYN5xtYYqQqWC1BQV/S0w5Sdna3qNc9h2RMaJVtBkMBVwC
	 RVkUWQoVKLWxW0OhMoKsOJ8JeRKgA35eMYNbRpVV9KCSiKqRwuesFRTP/cpTlSr5HP
	 6kBkoAN15EAb/nigY/CUAWWBHsSSUIdolmjdL91diuZLeJ1EAEfKkIZVYobV50NkA/
	 WLmT/Z5lrDejQ==
Date: Mon, 15 Apr 2024 04:47:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, broonie@kernel.org, 
 linux-mediatek@lists.infradead.org, jejb@linux.ibm.com, 
 linux-arm-kernel@lists.infradead.org, alim.akhtar@samsung.com, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, peter.wang@mediatek.com, lgirdwood@gmail.com, 
 bvanassche@acm.org, Conor Dooley <conor.dooley@microchip.com>, 
 martin.petersen@oracle.com, avri.altman@wdc.com, stanley.chu@mediatek.com, 
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chu.stanley@gmail.com
In-Reply-To: <20240415075406.47543-7-angelogioacchino.delregno@collabora.com>
References: <20240415075406.47543-1-angelogioacchino.delregno@collabora.com>
 <20240415075406.47543-7-angelogioacchino.delregno@collabora.com>
Message-Id: <171317443759.1944979.15878384209932309700.robh@kernel.org>
Subject: Re: [PATCH v3 6/8] dt-bindings: ufs: mediatek,ufs: Document MT8195
 compatible
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_024726_617593_05E37041 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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


On Mon, 15 Apr 2024 09:54:04 +0200, AngeloGioacchino Del Regno wrote:
> Add the new mediatek,mt8195-ufshci string.
> This SoC's UFSHCI controller is compatible with MT8183.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/mediatek,ufs.example.dtb: ufs@ff3c0000: compatible:0: 'mediatek,mt8183-ufshci' is not one of ['mediatek,mt8192-ufshci', 'mediatek,mt8195-ufshci']
	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240415075406.47543-7-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


