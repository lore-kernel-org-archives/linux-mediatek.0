Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E04C55822
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 18:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLWdgoj72X7gYA+zfXeLMZVYaknsrJZqnd69HBm6HNk=; b=SB6NaIK+fqvwvGRxrcMxgyQJrw
	kZfIKw25o57VW4GquXx6VUQ9ckplhzkVuJP3f2eCb2j1NQEoydjJoswZIBlJgaBeOiC4Vp4FIW0lf
	M6sChscyN5Z3ZS588CEdn3y0Y1+6NRtg1hglCLF9XZiBhQOgbrOXZeM3+INhGmoAhC0mpiUavpH+2
	s/CTFjbiMqEY6jHoV+zij5JWRIOYjDebiFlm/aZ927sncXZk7vpzO3jBH2J/BUif7hbigac7GT/n/
	ZzCuaLd7HtXJIviBq4kG0tVusg2TpQeNpErcXRopqP3Pfojql8w9Sb1QNJqAbR3OsE7Sj6lr9WQcS
	awvr/OIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJjQ-00000002bHM-1EO8;
	Tue, 04 Aug 2026 18:19:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJjO-00000002bGi-2nGl
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 18:19:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36CE643E58;
	Tue,  4 Aug 2026 18:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9601F00A3D;
	Tue,  4 Aug 2026 18:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785867554;
	bh=KLWdgoj72X7gYA+zfXeLMZVYaknsrJZqnd69HBm6HNk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=FrmPXysUCZEt8mNYBDx1sY1oyp8ARekQX+9LKmuw7LLRlZrfPtbXbYi4nQG3bs/eF
	 HBbp4HRFXnUNpKxzpNHkt4I41TzrbkjZUXEpQNJ/iKgruEw7qJyGpsi6oReMa31QYW
	 TLIEIt0bF5N28uIr3Rhk2eku+u4ZgSxOEyds56GW5FENal6BTeVCFDA/TQWGrU4U/m
	 RdbGv8iAgTx77UJEWzH9t5afbJbHU/3kBk9/FZwDFctmk/4nGarsUQgrkYEX0X57Bi
	 wwOZyOEW+XVqBzoV5s7tLDChuPwMkvBLbfmKYzsMR/V/jPMOBAZ5qyNr3jMRceWR+z
	 eY6uQy0+Mc2/Q==
Date: Tue, 04 Aug 2026 13:19:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 Christian Marangi <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, 
 devicetree@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-mediatek@lists.infradead.org, 
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>, 
 Linus Walleij <linusw@kernel.org>, Markus Gothe <markus.gothe@genexis.eu>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260804160419.3592327-37-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-37-mikhail.kshevetskiy@iopsys.eu>
Message-Id: <178586755228.1262850.17111662755765518608.robh@kernel.org>
Subject: Re: [PATCH v9 36/36] dt-bindings: pinctrl: airoha: add support of
 an7563 pin controller
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


On Tue, 04 Aug 2026 19:04:19 +0300, Mikhail Kshevetskiy wrote:
> This patch adds device tree binding schema for Airoha AN7563 SoC pin
> controller.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,an7563-pinctrl.yaml        | 348 ++++++++++++++++++
>  1 file changed, 348 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260804160419.3592327-37-mikhail.kshevetskiy@iopsys.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


