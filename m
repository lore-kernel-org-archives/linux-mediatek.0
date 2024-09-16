Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDDDC3ABB2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 17:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXj06sjT6JD6J+KkgVlsc2m/5C87BrmaByrMq2gcY5U=; b=IAVKjPZsXix/Y5kR7YuyUdk2Hf
	oLp5YIYyts7r7xA35w9IsqONG7qktStN//mu0KwoJ5mB/MZ9SpPYzhNLrA25MqclLhad2R/pJqats
	ndxBrXm4lAYTgu0IgZk/FpAcK0RCl2qtJvdNUAJO3EFcTciPASwEgJP0a450snEy1skaF7JmC3WjI
	1+VgSikdH0IucRe7+k2YTnszzQKWNNKP0RlSMdy5o2BCNHm0mnb6v6rdifcass/A2aSnjG51+uLYR
	+kXRVVSKKkhsbrKb/zp+S1Xc+4PV7ifwN9SHmmuRRv/v8FiRdyqjIZ6oQpILzva70WwbHKN4uZjMy
	S1Qyc52g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFOP-00000004ZsV-0u2O;
	Mon, 16 Sep 2024 17:20:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFOM-00000004ZrR-1Inq
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Sep 2024 17:20:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A3575C5C9E;
	Mon, 16 Sep 2024 17:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B610EC4CEC5;
	Mon, 16 Sep 2024 17:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726507201;
	bh=HEVyZN8Y1qi8flRxY88Etdy1tq7GDjdM0Kqg/1HQTFo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=q6jCs0jKJWHlgV1CBh/9eypvIKNLL9lM4L3Vxjo2tlav5+FGs2fv0YTSwusR4l0bQ
	 8hNcvmdD9inmvcKqFLh1o7H1/aKyNS26x4SK18nskKrGLIxh965HFnYo7gxJZuTnJS
	 ViwsZilkaYU4ECImAnl18Spzz4MTqu+HJ9ncxJIN3z+zvZa4+m8Vbzn78bo9MVzhSS
	 10SAiS6YhNYARECOnFbLDK/54Jtfk8PpV1C6sSYCIIEQk4T/lovkSnW8bzB9uE8hfq
	 ZNEP1Bd3n326xAqGIy0lXpKWjbgP+0q081Aioj0x+VkRTPrz45VfvK1XHfSomPGl1v
	 jQnh4WUIr7iSQ==
Date: Mon, 16 Sep 2024 12:19:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, 
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
 knoxchiou@google.com, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com>
Message-Id: <172650686036.806282.435049873625711480.robh@kernel.org>
Subject: Re: [PATCH v8 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_102002_468210_BF001CBE 
X-CRM114-Status: GOOD (  13.25  )
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


On Sat, 14 Sep 2024 14:31:20 +0800, Jianeng Ceng wrote:
> This is v8 of the MT8186 Chromebook device tree series.
> ---
> Changes in v8:
> - PATCH 1/2: Remove custom label.
> - PATCH 2/2: Change the commit about ponyta.
> - Link to v7:https://lore.kernel.org/all/20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v7:
> - PATCH 2/2: Remove prototype sku.
> - PATCH 2/2: Disable the other trackpad to enable one of them.
> - Link to v5:https://lore.kernel.org/all/20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v6:
> - No change.
> 
> Changes in v5:
> - PATCH 1/2: Remove sku2147483647.
> - PATCH 2/2: Remove sku2147483647.
> - Link to v4:https://lore.kernel.org/all/20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v4:
> - PATCH 1/2: Add more info for Ponyta custom label in commit.
> - Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v3:
> - PATCH 0/2: Add the modify records.
> - PATCH 1/2: Modify lable to label.
> - Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v2:
> - PATCH 2/2: Modify the dtb name without rev2.
> - Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Jianeng Ceng (2):
>   dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
>   arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
> 
>  .../devicetree/bindings/arm/mediatek.yaml     | 10 +++++
>  arch/arm64/boot/dts/mediatek/Makefile         |  2 +
>  .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 ++++++++
>  .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 ++++++++++
>  .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
>  5 files changed, 96 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
> 
> --
> 2.34.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y mediatek/mt8186-corsola-ponyta-sku0.dtb mediatek/mt8186-corsola-ponyta-sku1.dtb' for 20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com:

arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: dp-bridge@5c: 'extcon' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: dp-bridge@5c: 'extcon' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: sound: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: sound: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#






