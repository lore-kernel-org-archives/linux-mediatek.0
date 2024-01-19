Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E05C4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 11:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0/Fv78WG7XJiVhXhX9T3JDAK0wt6HmAfM8vHLPCWCQ=; b=sLiannDbvZrptpEAKnUKL/ZH/s
	sA9Pm7vd85ROvd8ZEUABX+7JZLgkTYXfcNdmarrn2kP74ZQcKJrft3RxxnTZS+ynYPuLPGMxVvUBG
	KWJs0DzNaLLrIXuH6himstdh9epREUDktNQDF24k8C2LdoF+nMNA3xy0tumry6KeRmmGfmr2XEvJe
	LjjQiICd8ESpbHCTxUJQkoDwZIGZ2uYGV+idLR4/uBtycU3Bpl+L5s5JgdFTx9zD6lHtxJuxITtLZ
	29fFCinIg2mUWkbVxFWwEDHiQr0SGMCK0yDtl5N4aA3PPaQoVVRAIFW0ZxMs3rWNew0lCwotbTS/0
	SVe+k8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQnN8-005Hgj-0A;
	Fri, 19 Jan 2024 11:49:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQnN4-005Heo-2h;
	Fri, 19 Jan 2024 11:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A6224B81B9F;
	Fri, 19 Jan 2024 11:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C39C433F1;
	Fri, 19 Jan 2024 11:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705664952;
	bh=LnEgDAcwP4asiG6e18d2KxL1mA9Y9YwIw9Zsoo4csx0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=gDQge1Su6vAyXza69IzAcqZ0y7pQHMlk7gzoYq76/S1tHrU3fFroBDheye9q8br7L
	 SHq6zycveQwIHdwCrGQ+MQYIKUgVBZehA1S/st+WH1daX7eeB9IN86ozTyY2d5qdA4
	 lvSBFWc5Fom1EELluxPybs1k2bVYDJv6Dq8KbK87JO9/vDp6DhzgSlOwI1haVws1fF
	 qkqZzgwuj9zXB3j+jRb9WzNeIQpCbjjGdwUFMrmMbUrdiM0sYsAAnBJ+qiaNDjK0Ap
	 aBweExTuOs/2+bDg35CFb6uppZ0XqtthXnpyh2uLOxmBvp9qIDkkj2MAG5Vj14h9Cl
	 jMq0/DN+u95cg==
Date: Fri, 19 Jan 2024 05:49:10 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregkh@linuxfoundation.org, conor+dt@kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, 
 matthias.bgg@gmail.com, linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
 cy_huang@richtek.com, linux-arm-kernel@lists.infradead.org, 
 chunfeng.yun@mediatek.com, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
References: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
Message-Id: <170566494967.3600611.15278394895468454608.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mt6360-tcpc: Drop
 interrupt-names
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_034915_185333_021DD325 
X-CRM114-Status: GOOD (  11.46  )
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


On Fri, 19 Jan 2024 10:41:04 +0100, AngeloGioacchino Del Regno wrote:
> This IP has only one interrupt, hence interrupt-names is not necessary
> to have.
> Since there is no user yet, simply remove interrupt-names.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml        | 5 -----
>  1 file changed, 5 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.example.dtb: mt6360@34: tcpc: 'interrupt-names' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.example.dtb: tcpc: 'interrupt-names' is a required property
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mt6360-tcpc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6360.example.dtb: pmic@34: tcpc: 'interrupt-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6360.example.dtb: tcpc: 'interrupt-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mt6360-tcpc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240119094105.98312-1-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


