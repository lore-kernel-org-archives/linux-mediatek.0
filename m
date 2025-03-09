Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5030C2BA1B
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Mar 2025 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeYHzb1+84ajRfEGoPrSPUe4QecpAJ6jaqWvqJsm7a8=; b=w/nNOM0dGO9pNlrGA9S/WigDsL
	n7QS1hRfnTYYcNYmyQO8XLWgJjGmxVpxwq6NCeQnHFx6Ol8US89n6/63Bht0S0ehYeaPBa9oTdLe9
	eV9QFDhpJiCMwd9nboc+S7BBhiAiMAK3NTCusojt4UKdsuohfHVZA0hRMPdHbmwjtNOErbQHgTVte
	RloSLz2uNVv3ulOCktXt+WC+XRQznnJMq7hBE+9gBN9z26UL4AKTDKOq7cYRbOUmA81AK6+9Zaarq
	lN4E/U4/vNhnKB37TZL4qay6EqdhkMKsD4fiodRM8v8BXckKAdrSJ+qioqnKmr3ZSHNhkgbL4a4fk
	C0DzVm0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trHzl-00000000gek-0eyg;
	Sun, 09 Mar 2025 14:51:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trHxn-00000000gHx-1AqG;
	Sun, 09 Mar 2025 14:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 749D0A431EA;
	Sun,  9 Mar 2025 14:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369BBC4CEE3;
	Sun,  9 Mar 2025 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741531749;
	bh=IGpFddVBBxQL0jWLZ1CuQkeHAw1KzCzTqLo0KMHbMBA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SmyRjiHp3xzZSlxPwbe8MW5i8XRpkGUyAEQE5dDhP2Bk7q8NR5AElXnuPDcu/rEn0
	 EMW4cxlpj+/lzUAI82rLo6FhliQ/ZXwg2eUl7g5cfZqXzzsR0c6/YCiEeJrUkdqwbk
	 O7xJQGIfgwhMP12Q9RRPRKCK1heZ7EAcA7sOyR5N/uUgLumKkVKbyqnE71rNQaavhE
	 Pp0KYybOnTiAMX1ullZT4Wp8DGpGxjVwQvqbwFHN2L3uX1MQhrA4bSNReVxYAkXd6K
	 ks730h5004TAWkhCeoW1/IL2llxfUVkgs9ircKvqvjZUvJBLdHaCr+I2NppBnB11mR
	 uY0jx6wBL/hMA==
Date: Sun, 09 Mar 2025 09:49:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Danzberger <dd@embedd.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Nikita Shubin <nikita.shubin@maquefel.me>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guo Ren <guoren@kernel.org>, linux-mediatek@lists.infradead.org, 
 Felix Fietkau <nbd@nbd.name>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-phy@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 upstream@airoha.com, Michael Turquette <mturquette@baylibre.com>, 
 linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250309132959.19045-6-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
 <20250309132959.19045-6-ansuelsmth@gmail.com>
Message-Id: <174153174798.1107714.11562627501354617614.robh@kernel.org>
Subject: Re: [PATCH 05/13] dt-bindings: mfd: add Documentation for Airoha
 EN7581 SCU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_074911_483846_F8290696 
X-CRM114-Status: GOOD (  11.93  )
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


On Sun, 09 Mar 2025 14:29:36 +0100, Christian Marangi wrote:
> Add Documentation for Airoha EN7581 SCU.
> 
> Airoha EN7581 SoC expose registers to control miscellaneous pheriperals
> via the SCU (System Controller Unit).
> 
> Example of these pheriperals are reset-controller, clock-controller,
> PCIe line speed controller and bits to configure different Serdes ports
> for USB or Ethernet usage.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../mfd/airoha,en7581-scu-sysctl.yaml         | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.example.dtb: system-controller@1fb00000: clock-controller: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/airoha,en7581-scu-sysctl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.example.dtb: clock-controller: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/clock/airoha,en7523-scu.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250309132959.19045-6-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


