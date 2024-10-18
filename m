Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97F7D30006
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 12:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mk387nifuaPJqqXScGOwgRwHDfMsoc7bjVCybyXW3xg=; b=Jt2Vv2QvzvW5xPSLMwCfxWJ7vH
	FZffTgw6KLn2GhhEVDtR/kLPbZm9EeP0vsi7Iz/j7NRVeD4fZTmcG67Cfjf4sInzxcq+DZ73o+LHE
	gR4ZLDbdioVXD5wh5WLY/E2O0m6LP5T8d9V+to78rQ4QdVIY0F/DukzX4DColGrtf7dxTim1XSBsT
	UmQrawabHtoh/2x5CVQ6A6IWITqTw+96ZWEuCdtQSapRCG4R1qy3iA2MXBHUwNl+tDTS9K7k7xyW+
	V070to2OudbLdumApXidrFL0NAe4vQLjExBei7dUpqXm+haHUabDYjjrRT7d49cAdZBVvFntVy3qw
	kssBASyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mXS-00000000oT8-48Iz;
	Fri, 18 Oct 2024 12:57:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mT2-00000000nnJ-2B4j;
	Fri, 18 Oct 2024 12:52:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F57BA43FCA;
	Fri, 18 Oct 2024 12:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C83C4CED5;
	Fri, 18 Oct 2024 12:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729255951;
	bh=UZ7u6Rc9FfmOf9m8EMUtl5zNNPrd8QgWBd/z2NMe2/4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=d4Dp4b1bhEoSEo8VPxz5mdVm/h2XfneCMhHY1ULlfDpzajAjvBxHHAeP4pRnvfQci
	 CPahwtCoYkCZvNUHVEmqwv7bLEEkMb3/f0R5dYeRvCcDtkxWBXPYq5T8abV6uv976w
	 AQ9Lq1oC83NCl99T3/psWrKa2Fct2dT/jnFCH7Ke9EzusScZFGJhM9ikduhvyZdwml
	 anF0HUaXcMNzhuBBvaON7AtWxV3MFxwrCnjlWOGkepbqG50PwKsQnKkR84AgxJRi4J
	 7emgm8smTa/NZwRz+PhZTtMHqrFx7Iswag893Hf6TQowKt5+Ds4J9xuu5FSc2CDcmt
	 hRHVbMk4eeHVw==
Date: Fri, 18 Oct 2024 07:52:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241018-post-reset-v1-0-5aadb7550037@chromium.org>
References: <20241018-post-reset-v1-0-5aadb7550037@chromium.org>
Message-Id: <172925540096.17773.4550001283125132036.robh@kernel.org>
Subject: Re: [PATCH 0/2] Using i2c-hid-of-elan driver instead of i2c-hid-of
 driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_055232_725085_5056AC51 
X-CRM114-Status: GOOD (  16.03  )
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


On Fri, 18 Oct 2024 12:03:03 +0000, Hsin-Te Yuan wrote:
> After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
> i2c-hid-of"), i2c-hid-of driver resets the touchscreen without having
> proper post-reset delay on OF platform.  From the commit message of that
> commit, not to decribe poset-reset delay in device tree is intended.
> Instead, describing the delay in platform data and changing to use
> specialized driver is more preferable solution.
> 
> Also workaround the race condition of pinctrl used by touchscreen and
> trackpad in this series to avoid merge conflict.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
> Hsin-Te Yuan (2):
>       arm64: dts: mediatek: mt8183: Fix race condition of pinctrl
>       arm64: dts: mediatek: mt8183: Switch to Elan touchscreen driver
> 
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts |  2 --
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts  |  3 ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts   | 12 +++---------
>  .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts   | 11 ++---------
>  .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts   | 11 ++---------
>  .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts   | 11 ++---------
>  .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi |  3 ---
>  .../boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi      |  3 ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts   |  3 ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts  |  3 ---
>  .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi |  3 ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi       | 10 +++-------
>  12 files changed, 12 insertions(+), 63 deletions(-)
> ---
> base-commit: eca631b8fe808748d7585059c4307005ca5c5820
> change-id: 20241018-post-reset-ac66b0351613
> 
> Best regards,
> --
> Hsin-Te Yuan <yuanhsinte@chromium.org>
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8183-kukui-jacuzzi-burnet.dtb mediatek/mt8183-kukui-jacuzzi-cozmo.dtb mediatek/mt8183-kukui-jacuzzi-damu.dtb mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb mediatek/mt8183-kukui-jacuzzi-pico.dtb mediatek/mt8183-kukui-jacuzzi-pico6.dtb' for 20241018-post-reset-v1-0-5aadb7550037@chromium.org:

arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: dpi@14015000: power-domains: False schema does not allow [[92, 7]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dpi@14015000: power-domains: False schema does not allow [[94, 7]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dpi@14015000: power-domains: False schema does not allow [[92, 7]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: dpi@14015000: power-domains: False schema does not allow [[90, 7]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dpi@14015000: power-domains: False schema does not allow [[92, 7]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#






