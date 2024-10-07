Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213C1CED240
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 21:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfJYWDESz/KwU5pAiDkV8IZRp2c9IvNPSKfBLuSkXpU=; b=aGrDuCtv1c6l469cMoYJZ24Fja
	XCIw8i1q+psEmN8bCCgcWouucthFjagFDg01zk5f1lAhL5NdjCPFShiwX9Kp8P78+eNQ1ci+TVNF8
	LK+WbLKjLn4P4FMgIcjRH4JOA8ejp248QEZ+mFeOatfi0USFxXTlkl4LXZUS2O3iG5SQK+JuyKwhu
	5VUn0OQrqrZuhg5X9/0HmU5zLLYnaWAl3Cw5Q3LO9DsFJPhBebD5iwV+R9hUxMePvZaNUdIJw0I1O
	OMeVcSPuE6RltFEGJ/+IMwbTpIG3RgjvokjnRLUQKDXUhyt9g1GTVCpWMoPrOXPYrgwh41pwSy8dG
	q7XpFozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxv8y-00000003oyq-2HvZ;
	Mon, 07 Oct 2024 21:19:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxv7f-00000003orh-3Wn0;
	Mon, 07 Oct 2024 21:18:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 223B5A42668;
	Mon,  7 Oct 2024 21:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B25CC4CEC6;
	Mon,  7 Oct 2024 21:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728335910;
	bh=HrN67y6Cy1Pyc/S6hivHO4mRSYQ/s+XYFkTpBAfO33A=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=pTFWnH27DhMY9xXoJsniYDjNAAEsXRaLBHmDDr8Ic5uzQ/sccd2e7YNNFSygEeOOB
	 +C6XDOwwBVzzfOJdo1Gmy7Sn9wr8b2+Xbr7+gZl4d+2cOGhr3mElQOtViRPsz7p+J3
	 3I+URejXY5DpbxBL1yIyojaRpdKOVoHP8NHZF38t1WLz/6N2C8G4xVvsj4sxVmaWgC
	 5ovAQi4n4+vmPpNKHUsPdVY9D9wA4EMzywqhF2qoPdd4RRWmdpcdAAfa4BiLHiNW59
	 MdvALtquDMghJLamdHBOwmNa/yslJBfr3eNyhwnZiNXQL/vEhygu3QFfY5rCJABezk
	 I8DzbN6tfVv6A==
Date: Mon, 07 Oct 2024 16:18:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20241007203053.72862-4-linux@fw-web.de>
References: <20241007203053.72862-1-linux@fw-web.de>
 <20241007203053.72862-4-linux@fw-web.de>
Message-Id: <172833590964.2590037.11713747544689826039.robh@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: pinctrl: add binding for MT7988
 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_141831_968527_EC394E42 
X-CRM114-Status: GOOD (  13.57  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, daniel@makrotopia.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Mon, 07 Oct 2024 22:30:44 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This adds bindings for MT7988 pinctrl driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes in v3:
> - limit conf subnode name with optional suffix like mmc on mt7986
> - match mux subnode without wildcards
> 
> changes in v2:
> - drop gpio-cells description
> - move ref in mux subnode up
> - order uart-functions alphanumeric and fix typo
> ---
>  .../pinctrl/mediatek,mt7988-pinctrl.yaml      | 569 ++++++++++++++++++
>  1 file changed, 569 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml: patternProperties:-pins$:patternProperties: '^mux$' should not be valid under {'pattern': '^\\^[a-zA-Z0-9,\\-._#@]+\\$$'}
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241007203053.72862-4-linux@fw-web.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


