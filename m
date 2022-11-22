Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A60CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 03:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTB5WxU1MVbx3x7hLOrrWvui3zg37X1Y1n8WoNJQx8Y=; b=0opDiL1bJzGNLnPzlc1QTpowxe
	9U75c5f4kJlEFB+IdbdJ8qbiNd4VQMnrTdRrCDpXymy/PJKF1RNRhDiW/S0HhFro1/rtbndRY2n3E
	NPPhzGF5b4ttO+Tp2/zhy6vwTPtTCZk+mVMyt1y19GaPK5+B72Doih23NmtgQM6ZWQMJu2Jd5PUM+
	/maiN/D4p8UtyAKsdntml5ntYmu4gQhUUwb4GDMTUN8DyV8VjsPOghRuLakKYk4fwyHfmqabWJsfS
	o78DMMFlyc0PuHPu9DlsB4BsUR4uguEV9LSFfg8OAbhnN7p5vcip65Tlmadcjuu+4j8wtTljiYRfr
	M5qwi/xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxK3h-0038ob-2A; Tue, 22 Nov 2022 03:34:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxK39-0038KT-70; Tue, 22 Nov 2022 03:34:21 +0000
X-UUID: f1bce06db7f64c5591fe17d1eb938e3f-20221121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=QTB5WxU1MVbx3x7hLOrrWvui3zg37X1Y1n8WoNJQx8Y=;
	b=ZMqnLEGtazuFFF8yqSxSiGYC6efftyncuy87YhcVMwNDx0VB4/EA/Cpuri2qiA7V7aoOVIp2FRIm41gTj+2QYN4thWJiyifhzTq0PjdDXgi6vqaKBxFTRCEcDxcP+46FmBi3w2Yk7bEwyKubxGkGtj3BYJkR/CpyyhMNL42plYI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:f114b8c4-6f89-4ffe-bf70-5f8e593ee557,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:d0b3712f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f1bce06db7f64c5591fe17d1eb938e3f-20221121
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 397626251; Mon, 21 Nov 2022 20:34:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 22 Nov 2022 11:34:08 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 22 Nov 2022 11:34:07 +0800
Message-ID: <bdc08ff5-432e-9a60-1d38-0f44cebd19a8@mediatek.com>
Date: Tue, 22 Nov 2022 11:34:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [GIT PULL] arm64: dts: mediatek updates for v6.2
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, arm-soc <arm@kernel.org>, "SoC
 Team" <soc@kernel.org>
CC: Pierre Gondois <pierre.gondois@arm.com>, Yassine Oudjana
	<y.oudjana@protonmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
	<nfraprado@collabora.com>, Sam Shih <sam.shih@mediatek.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
	<linux-mediatek@lists.infradead.org>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bear Wang
	<bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, Fabien Parent
	<fparent@baylibre.com>
References: <8933d687-71f0-e9ad-a7c6-2e5a8993463d@gmail.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <8933d687-71f0-e9ad-a7c6-2e5a8993463d@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_193419_320111_34591486 
X-CRM114-Status: GOOD (  27.65  )
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


On 11/22/22 02:47, Matthias Brugger wrote:
> Hi Olof and Arnd,
> 
> Please have a look on the latest and greatest DT patches for MediaTek. 
> We got basic support for the Sony Xperia M5 (Helios X10 based). Apart 
> from that we have activity around the MT7986 which is on the BananPi R3. 
> Hopefully support the latter will be ready in the next merge window.
> Apart from that, MT8195 based Chromebooks have now support for video 
> encoder, PCIe and display port (internal and external one).
> 
> Best regards,
> Matthias
> 
> ---
> The following changes since commit 
> 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>    Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>    
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/__;!!CTRNKA9wMg0ARbw!27PeFLVkB-GGYHHNA51sblVY8UUfYoly9LDdEupM8_c-POxI4Me0a9eBkZvuotWDcBw$ 
> tags/v6.1-next-dts64
> 
> for you to fetch changes up to 885e153ed7c1b0ec8bc25651f0644b3cb65ecaf4:
> 
>    arm64: dts: mt7986: add spi related device nodes (2022-11-21 18:17:35 
> +0100)
> 
> ----------------------------------------------------------------
> Fix check warnings all over the place.
> 
> mt7986:
> - Add crypto, I2C and SPI nodes
> 
> mt6795:
> - Add clock nodes
> - Add DMA support for UARTs
> - Add MMC nodes
> - Add basic support for Sonyx Xperia M5
> 
> mt8195:
> - Add video enconder node
> - Add PCIe support
> - Fine tune capacity-dmips-mhz
> - Add support for internal and external display port

Dear Matthias,

Sorry for bothering you and a reminding again.

It seems the bug fix for booting failure of mt8195-demo isn't in this 
dts series.
The patch has been send in the late of September [1] (v1) and resend 
during this RC period [2] (v2). I'm not sure if the patch simply went to 
junk mailbox, or I need to send it in more lists. Many board makers are 
waiting the boot failure fix be merged into mainline and back port to 
previous stable tree since 5.19. We need your help. Thank for your 
attention. :)

arm64: dts: mediatek: mt8195-demo: fix the memory size of node secmon

[1] 
https://lore.kernel.org/all/20220922091648.2821-1-macpaul.lin@mediatek.com/
[2] 
https://lore.kernel.org/all/20221111095540.28881-1-macpaul.lin@mediatek.com/

> ----------------------------------------------------------------
> AngeloGioacchino Del Regno (15):
>        arm64: dts: mediatek: mt8195: Fix CPUs capacity-dmips-mhz
>        arm64: dts: mt7896a: Fix unit_address_vs_reg warning for oscillator
>        arm64: dts: mt6779: Fix devicetree build warnings
>        arm64: dts: mt2712e: Fix unit_address_vs_reg warning for oscillators
>        arm64: dts: mt2712e: Fix unit address for pinctrl node
>        arm64: dts: mt2712-evb: Fix vproc fixed regulators unit names
>        arm64: dts: mt2712-evb: Fix usb vbus regulators unit names
>        arm64: dts: mediatek: pumpkin-common: Fix devicetree warnings
>        arm64: dts: mediatek: mt6797: Fix 26M oscillator unit name
>        arm64: dts: mediatek: mt6795: Add topckgen, infra, peri 
> clocks/resets
>        arm64: dts: mediatek: mt6795: Replace UART dummy clocks with pericfg
>        arm64: dts: mediatek: mt6795: Add support for APDMA and wire up 
> UART DMAs
>        arm64: dts: mediatek: mt6795: Add support for eMMC/SD/SDIO 
> controllers
>        dt-bindings: arm: mediatek: Add compatible for MT6795 Sony Xperia M5
>        arm64: dts: mediatek: Add support for MT6795 Sony Xperia M5 
> smartphone
> 
> Bo-Chen Chen (4):
>        arm64: dts: mt8195: Add dp-intf nodes
>        arm64: dts: mt8195: Add edptx and dptx nodes
>        arm64: dts: mediatek: cherry: Add dp-intf ports
>        arm64: dts: mediatek: cherry: Add edptx and dptx support
> 
> Frank Wunderlich (7):
>        arm64: dts: mediatek: mt2712e: swap last 2 clocks to match binding
>        arm64: dts: mt8183: drop drv-type from mmc-node
>        arm64: dts: mt7622: drop r_smpl property from mmc node
>        arm64: dts: mt7986: fix trng node name
>        arm64: dts: mt7986: add i2c node
>        dt-bindings: arm64: dts: mediatek: add compatible for bananapi r3
>        arm64: dts: mt7986: move wed_pcie node
> 
> Matthias Brugger (1):
>        arm64: dts: mediatek: mt7986: Add SoC compatible
> 
> Nícolas F. R. A. Prado (1):
>        arm64: dts: mediatek: kukui: Remove i2s-share properties
> 
> Pierre Gondois (1):
>        arm64: dts: Update cache properties for mediatek
> 
> Sam Shih (3):
>        arm64: dts: mt7986: harmonize device node order
>        arm64: dts: mt7986: add crypto related device nodes
>        arm64: dts: mt7986: add spi related device nodes
> 
> Tinghan Shen (2):
>        arm64: dts: mt8195: Add venc node
>        arm64: dts: mt8195: Add pcie and pcie phy nodes
> 
> Yassine Oudjana (1):
>        arm64: dts: mediatek: mt6779: Remove syscon compatible from pin 
> controller
> 
>   .../devicetree/bindings/arm/mediatek.yaml          |   2 +
>   arch/arm64/boot/dts/mediatek/Makefile              |   1 +
>   arch/arm64/boot/dts/mediatek/mt2712-evb.dts        |  12 +-
>   arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |  28 +--
>   arch/arm64/boot/dts/mediatek/mt6779.dtsi           |  10 +-
>   .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts    |  88 ++++++++
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi           | 109 +++++++++-
>   arch/arm64/boot/dts/mediatek/mt6797.dtsi           |   2 +-
>   .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |   1 -
>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       |   1 -
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts       | 135 +++++++-----
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |  74 ++++++-
>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts       |  57 ++++-
>   arch/arm64/boot/dts/mediatek/mt7986b.dtsi          |   3 +
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |   6 -
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi           |   3 +
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi           |   3 +
>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |  86 ++++++++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi           | 233 
> ++++++++++++++++++++-
>   arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi   |   6 +-
>   20 files changed, 750 insertions(+), 110 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> 

Regards,
Macpaul Lin

