Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009A8C02181
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2025 20:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pm08M0duZG4a+ZLa4zK8PxczLpdU4JAEAYPjQRflnMk=; b=SKvFWgOfRAccCPwypcgYJscoo2
	d3+0Ck/zKlrTur9vOo4y6GqESjtfaXNMPVko+5v6upDMyZrZprmpRcJKaljtMIEIUtFiYSg5uozON
	SGLQtwweBUAIaxa1XJo7LmvEXOneEeQmtqz591xbJePgo/FkmWtA7I0O4vrV+bXTE4SQrPJd8Lmyh
	P/gmnDFGRpHr9pJt0pPl5JqCkfxxBu1PqK8Mma2U3tfWFoV396pq8DWSgHy9VcK6xVpEKoPT69R+2
	ljiDk0hqZHIj4+tYmCRXYUV0t2cCdYKJpEUQezeVSD3IdB0MP3hSMTh6ZjXiMfyQpxL6wQWvW+mJH
	fI8w88Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZyQA-00000006P3D-32cl;
	Mon, 20 Jan 2025 20:30:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZyOs-00000006OuX-081E;
	Mon, 20 Jan 2025 20:29:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC8C9A40234;
	Mon, 20 Jan 2025 20:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D0CC4CEDD;
	Mon, 20 Jan 2025 20:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737404972;
	bh=WDoCCA3w5eEl8wS9Gz8iLhDSYRHG+YTayG/JhkEBJGc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bv9KogGjcVzMKThShlLVPH5bcRAthWi7voKuzUEu9kqWn7lLzjXhryTk0BqcA/Ez/
	 nq+4DHUN7cf1LExDN2+tfvEKmt+gaZUxSJpbfYFNKLrCi7R6EDWHzIFBa027H6Z84n
	 rSPXd191pPpIWvXVCME8S9xMY109URyY6+ie6X9jdkfXCPK8e3AEGAiZ8cna48xnYA
	 Gas3i4kt9YuhwZ3LZGUgfQDq0atH4FU3c+zdjvqSIphmXTAQor/z4A/kgx4QEdUpMP
	 6jsVGaxOLq880rmSRQ2geYQRYnRs9Uff7M1Pw58Cc2xgcz/Pwohs3QBofd1ippPaiA
	 zfI91BacpRp7Q==
Date: Mon, 20 Jan 2025 14:29:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 upstream@airoha.com, linux-arm-kernel@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250120184728.18325-1-ansuelsmth@gmail.com>
References: <20250120184728.18325-1-ansuelsmth@gmail.com>
Message-Id: <173740497060.601130.3509016769870545640.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add eMMC for AN7581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_122934_136691_7D2EC982 
X-CRM114-Status: GOOD (  15.28  )
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


On Mon, 20 Jan 2025 19:47:01 +0100, Christian Marangi wrote:
> Document eMMC compatible for AN7581. This eMMC controller doesn't have
> regulator exposed to the system and have a single clock only for source
> clock and only default pintctrl.
> 
> Rework the schema to permit these new requirements and make supply
> optional only for airoha,an7581-mmc compatible.
> 
> Also provide an example for airoha,an7581-mmc.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> Changes v2:
> - Drop else condition
> - Move Required and pinctrl property to dedicated if condition
> 
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 116 +++++++++++++++++-
>  1 file changed, 110 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/mmc/mtk-sd.example.dts:104.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/mmc/mtk-sd.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250120184728.18325-1-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


