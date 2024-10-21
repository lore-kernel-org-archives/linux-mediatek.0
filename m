Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087B2D17123
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 18:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9Kr8p0wLbuimo7qEKutcLXp9yoQ2p+kfuV89wfaO84=; b=YbhKOMlfv/baIrVOdWiz4xIlDH
	Nx1eFsxuzssxKNPmPO6Ixj+bv4FcpsuCiKzW31AAfKCUXBBMJdRPJrrZxBcIYjWtxG1LHoInvfAX5
	K6L/mCcs6+vRhw/aRcrDr46AOXGNaabGBuzrb1xcU5+xECeUaTkVbGBXH5WRkp21wTYKn+Bs+gute
	1uMCZRj6OFOBAZtbyexgU8yn1FdceOQ11qHqDvH70FA4Cy0hIVvkkQPc4BoAeXK8+cdUnzPcLheHO
	zQloJ+6WBJu5AsXnnN4hXPACh8kPD01pJF3xpS2Fv1uR/3TIV0hqdTLS+1qM6t6u0QLz0eZA17Oe5
	8SvjLoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2wkL-00000008Dj2-0tuw;
	Mon, 21 Oct 2024 18:03:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2wfq-00000008Cjs-35sl;
	Mon, 21 Oct 2024 17:58:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5119D5C59FE;
	Mon, 21 Oct 2024 17:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CAE0C4CEE7;
	Mon, 21 Oct 2024 17:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729533513;
	bh=AU1fwaTTVLa71D02ZQ1USonnY5Leg+lK4dyzvIoJ5E0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=eCBZtJIwgOpyPDEDW5qODnrdHLLYivBHiSizWtHyk300oIZpHtjmqcIzn0kfn+S45
	 uEnFMnpENMH2DYIBVuyCFpOVxnT2M80UJwJJhGSt+0O5gg7hrgq4q4HoLPGIAyav06
	 2Bwj5VA1RwaDg0q67tizNTEO72FXwMJIjiqiMjBRs3cIG+SI11HasazBpkHjKm5HAq
	 ijQMTI+VJpWkQtKbp/EfiIN2vCAyvwauoTiobeLtynhbFgoM1CqXGCtskv+xeNGkpW
	 kVoQUGrlYhgOwz8vCeXCt8ORh7IIBgzoqfsuI2pBUFlgzSSp7vhUfwd6lXFwJEC7VO
	 WvwsUDapCv2DQ==
Date: Mon, 21 Oct 2024 12:58:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
 Benjamin Tissoires <bentiss@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 devicetree@vger.kernel.org, Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20241018-post-reset-v2-0-28d539d79e18@chromium.org>
References: <20241018-post-reset-v2-0-28d539d79e18@chromium.org>
Message-Id: <172953337296.748240.4918539108990404546.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] Using i2c-hid-of-elan driver instead of
 i2c-hid-of driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_105834_934583_57C7A871 
X-CRM114-Status: GOOD (  19.07  )
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


On Fri, 18 Oct 2024 13:13:40 +0000, Hsin-Te Yuan wrote:
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
> Adding other second source touchscreen used by some mt8183 devices in
> this series since this should be based on the workaround of pinctrl
> issue.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
> Changes in v2:
> - Add second source touchscreen patches since they should based on the
>   first patch of this series.
> - Link to v1: https://lore.kernel.org/r/20241018-post-reset-v1-0-5aadb7550037@chromium.org
> 
> ---
> Hsin-Te Yuan (4):
>       arm64: dts: mediatek: mt8183: Fix race condition of pinctrl
>       arm64: dts: mediatek: mt8183: Switch to Elan touchscreen driver
>       arm64: dts: mediatek: mt8183: kenzo: Support second source touchscreen
>       arm64: dts: mediatek: mt8183: willow: Support second source touchscreen
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8183-kukui-jacuzzi-burnet.dtb mediatek/mt8183-kukui-jacuzzi-cozmo.dtb mediatek/mt8183-kukui-jacuzzi-damu.dtb mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb mediatek/mt8183-kukui-jacuzzi-kenzo.dtb mediatek/mt8183-kukui-jacuzzi-pico.dtb mediatek/mt8183-kukui-jacuzzi-pico6.dtb' for 20241018-post-reset-v2-0-28d539d79e18@chromium.org:

arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dpi@14015000: power-domains: False schema does not allow [[92, 7]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dpi@14015000: power-domains: False schema does not allow [[92, 7]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dpi@14015000: power-domains: False schema does not allow [[94, 7]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: dpi@14015000: power-domains: False schema does not allow [[92, 7]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: vcodec@17020000: 'assigned-clocks' is a required property
	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dpi@14015000: power-domains: False schema does not allow [[92, 7]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: dsi@14014000: 'port' is a required property
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: dpi@14015000: power-domains: False schema does not allow [[90, 7]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#






