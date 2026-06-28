Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871E3C43458
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jun 2026 20:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnAKkvp3tjg0tQG+8c9vd7fLfC+BW+vCdDsM8cjhipw=; b=oEIQPf2t6cRnMMyvXvZGv2oNfB
	38h0rbBU4bNA41XVXjur3sNdNFTEJEd2Ee6Q+m4SoWZL8ISQImBTx+ImdpinX2Gi+CFxD1Jq+ZT1p
	kNLO5RjO2D14j4qvrB739vJeRpzXrAa34IDuOdWfxwCS0s6eYfxhI+JedD4say/+oBu1+wJShs3h/
	FisfIoTYe2ahdZ8lcH/wgNxAUczNxJo9DGnM1DtBuAWyEDVaD4RQrLcqkZ9iMogxC/NheogQKLKIk
	/rxhabjFqosj/qWQ2Edicdje8zCoVJew8gEpq8Q0o3CPFRwFPMOPCxUJQOoJv8mXLm5ixYhJ6nZI4
	reHZv+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwTT-0000000DNGm-2rDI;
	Sun, 28 Jun 2026 20:51:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwTS-0000000DNGW-0shh
	for linux-mediatek@lists.infradead.org;
	Sun, 28 Jun 2026 20:51:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 58CB76001D;
	Sun, 28 Jun 2026 20:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C852F1F000E9;
	Sun, 28 Jun 2026 20:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782679889;
	bh=RnAKkvp3tjg0tQG+8c9vd7fLfC+BW+vCdDsM8cjhipw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Rt5qoxJUbZhSdIBOWkSkrlQNxi/j6+hZdwXs+zCnBI9k/yplflXEzLFAk1ZrVAt4b
	 VonK3qFQaM2VAqVGi7n7RwQROmWV5zZcWvPTUp+dwfiTNyKMqT6IKDVC9UZv+nc45b
	 vgHAj7K3bZbDlBigGEW9QYKJTV1v7cmHqii5gEBT81VX64vHte+KdFx+eRszUFxNT3
	 qyeTzKCThUGySt0UooEIX9eVRr0FQ7j0ARp8WuxS4jShw5ueT14y5c7K3/vg0QaKww
	 uTtzVV9sz/ItBnLfQRsaI99B5qmfvhzH+OngjK8LkmWY5zORlQEQdXi4IIvYItULgL
	 nv2rLXDhwOOsg==
Date: Sun, 28 Jun 2026 15:51:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Markus Gothe <markus.gothe@genexis.eu>, Linus Walleij <linusw@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260628143733.273651-18-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-18-mikhail.kshevetskiy@iopsys.eu>
Message-Id: <178267988674.4168191.17911240000077972868.robh@kernel.org>
Subject: Re: [PATCH v6 17/17] pinctrl: airoha: add support of an7563 SoC
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


On Sun, 28 Jun 2026 17:37:33 +0300, Mikhail Kshevetskiy wrote:
> This patch adds support of Airoha an7563 SoC pin controller.
> Also it adds corresponding device tree binding schema.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,an7563-pinctrl.yaml        |  348 +++++
>  drivers/pinctrl/airoha/Kconfig                |    6 +
>  drivers/pinctrl/airoha/Makefile               |    1 +
>  drivers/pinctrl/airoha/pinctrl-an7563.c       | 1115 +++++++++++++++++
>  4 files changed, 1470 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
>  create mode 100644 drivers/pinctrl/airoha/pinctrl-an7563.c
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.example.dtb: /example-0/pinctrl: failed to match any schema with compatible: ['airoha,en7521-pinctrl']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260628143733.273651-18-mikhail.kshevetskiy@iopsys.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


