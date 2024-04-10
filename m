Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3F4CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 19:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uxo89sMS0NY9ztiDKQAuRbfc1d5PUD6ZLRkkA6a+FNk=; b=2oQf+xDZtp7dtIoBU7lvLccVaz
	x7LeHO0sDJIIhcayP1Y7DbLYzh+ST2SYzfuNYCvpjBqIFtTRfcdvDQZIuYe30V4/rdT6Wbeg6HKi9
	NOwjyeBb1RHuX9KJKwdwO3aQgzs/1HbMM3n3zY0CFOKSslG2zFM6dIFlkqsUTzE608/HvXqLlxaaH
	M6RViLLVhA88ld5nmqnO0dZScH6lFxeMer5QP67+HZspUlxmv/XH9LLEAZZMrzMqHSFwTScNhs/0n
	uSQUb8QB7JwIflkQ5AxBzuGQyGUtySrTqoFQGJLaWMk1tJvBCw3QrGO4uEOR2m/4eUaZdOGTE5Ww/
	ouiixK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudgW-00000008hCo-1vWA;
	Wed, 10 Apr 2024 19:32:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudgR-00000008hAC-2w2Y;
	Wed, 10 Apr 2024 19:32:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8C943CE2A55;
	Wed, 10 Apr 2024 19:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88179C43390;
	Wed, 10 Apr 2024 19:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712777552;
	bh=WW5sMpVOz0tGbMU1O5onTUR51y42uNFu9wn05WPtkWY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=tq4rrWfX9sfVjyG1eyRA5JQGhmGUZZ7uZmnP8xeGteU4tmjtBJwX1rIwj8QFaJQjX
	 hazgBdZOKaDhWWOOpBX6HrGOSdUUKtAERdIR/r8t0ihV2Y0E50ZsNeIdGCuECZsGc4
	 MVhev7smKrOV3LTOgTQd6psiBKajiUbE3PItXRb805uwXE93PscA8sScGPOQ0bD2h3
	 yL4o4fFtnh+PyXMspoVkdeCYh+yHEbJJA7uBTYcP8lE1egXnKItFj4r5SyFia/wVYd
	 et+x2ylnr2iBKZZMb3xWvQ/x8CxEmBdAQqRiw1NTwJlG9b10JfdjTo1V82rU5g43Wu
	 5YHbgdVHo6jUg==
Date: Wed, 10 Apr 2024 14:32:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-rockchip@lists.infradead.org, 
 Scott Branden <sbranden@broadcom.com>, 
 Thippeswamy Havalige <thippeswamy.havalige@amd.com>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
 Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>, 
 Heiko Stuebner <heiko@sntech.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, 
 Jim Quinlan <jim2101024@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org, 
 Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, asahi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Kettenis <kettenis@openbsd.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Tom Joseph <tjoseph@cadence.com>, linux-renesas-soc@vger.kernel.org, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 linux-mediatek@lists.infradead.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, Bjorn Andersson <andersson@kernel.org>, 
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20240410181521.269431-4-krzysztof.kozlowski@linaro.org>
References: <20240410181521.269431-1-krzysztof.kozlowski@linaro.org>
 <20240410181521.269431-4-krzysztof.kozlowski@linaro.org>
Message-Id: <171277754988.1212749.4199877903133990039.robh@kernel.org>
Subject: Re: [PATCH v2 4/4] dt-bindings: PCI: mediatek,mt7621-pcie: switch
 from deprecated pci-bus.yaml
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_123236_127050_BDCFAE3F 
X-CRM114-Status: GOOD (  17.24  )
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


On Wed, 10 Apr 2024 20:15:21 +0200, Krzysztof Kozlowski wrote:
> dtschema package with core schemas deprecated pci-bus.yaml schema in
> favor of individual schemas per host, device and pci-pci.
> 
> Switch Mediatek MT7621 PCIe host bridge binding to this new schema.
> 
> This requires dtschema package newer than v2024.02 to work fully.
> v2024.02 will partially work: with a warning.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Important: v2024.03 (said dtschema newer than v2024.02) was not yet
> released, therefore this patch probably should wait a bit. Previous
> patches do not depend anyhow on future release, so they can be taken as
> is.
> 
> Changes in v2:
> 1. New patch
> 2. Split mediatek,mt7621-pcie to separate patch as it uses
>    pci-pci-bridge schema.
> ---
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.example.dtb: pcie@1e140000: pcie@0,0: Unevaluated properties are not allowed ('clocks', 'phy-names', 'phys', 'resets' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/mediatek,mt7621-pcie.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.example.dtb: pcie@1e140000: pcie@1,0: Unevaluated properties are not allowed ('clocks', 'phy-names', 'phys', 'resets' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/mediatek,mt7621-pcie.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.example.dtb: pcie@1e140000: pcie@2,0: Unevaluated properties are not allowed ('clocks', 'phy-names', 'phys', 'resets' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/mediatek,mt7621-pcie.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240410181521.269431-4-krzysztof.kozlowski@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


