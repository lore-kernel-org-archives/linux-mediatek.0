Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FFBC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Subject:From:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2s7Bnpn4tdL6ZT8OZhpNnm4kjABi9s9ef7qYQmT+sVw=; b=0533IpffXv9GHW
	fo7l+xjhq6jxFbPsFAfWeLw9pXe6gwhYqOc1VY7WMjGhFPfBSaXLwNvi9eC+QjWd8hsw8XntiV1IC
	wOjOPvtEH4VsnoWf1AyhbfyJ8Yfyf+Bf5AtLbliW0AMM5is+GXI3rTVEHVH6BbXje8EuvmOYmBpsp
	/PZkhI849JEuJtEaFwLzi39f4s6yEf/tM5yQFQ8ZtQkS5rHCSqbVmkTiADdZXOgGwCfqLEmEQLE//
	/kRAFujsNUtMfufqfDbd+3b9iBkUnVfqIebobSC38WVzd3EEiEVKwPDXF9p+Nbv06bvoGd9qRdxod
	zyiXS0z1E+18td8f37Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHcp-00D9Rt-CR; Wed, 01 Feb 2023 18:14:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHce-00D9PJ-0L; Wed, 01 Feb 2023 18:14:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id q8so13322485wmo.5;
        Wed, 01 Feb 2023 10:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s7Bnpn4tdL6ZT8OZhpNnm4kjABi9s9ef7qYQmT+sVw=;
        b=drkgdP+ekZPVrtppAi50a25isigIUPd7UmBwqj2eQEX8xDI9ZuRDaWLtj5EomMaOoK
         ukUdfijOKcCa4dqy1cmhS/LsH4Ep6rdBl5o7ayNvqwSNS0nKN3CU2erMXgiNPIWSK+ox
         NWYo+P9Q7s8lJe12kqX9GVMRrWVymbbUgargsGGg0st57JzuGEM8LewnWcnmcq+z0ShT
         MTSG33N20pEHE2rw9yJcIU5upm6lfRdjLohPFxYVgWhptXnfSoxuTF5qvlIfcMWeJ4X9
         go/VPmuwIpYoprXHQPNSHSQ5dPOVEUu973tDAEMQOFF4X4KR+CdOj5NT/AFcmZmiStWX
         DMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2s7Bnpn4tdL6ZT8OZhpNnm4kjABi9s9ef7qYQmT+sVw=;
        b=LNWbHBkq2MHFsqAWNCA/cE87pIAKmiFbb3EYyChBKVonTcSHaru4H7Znm3Ne8IYwBV
         wz2/3ppvqO0kUuMTakeqEtgNJ/xW6eXB20VlU2n8EizJCNvsf8JB12GoIVnqON0SKNUC
         FO7tGV2UI5v6Yr9ij/T/Ns+1TzyN3nI0vxUkJ55/yf7OQQkqJkEKG6u8uVeTz47Mshwz
         7Q4rKriGEZRmBmPnwwOcbEhgKlor9fhWNaO25SPRL9D+/0kqZYZQ5RjCT727QsgwphaT
         BTbFfCuBg+TMQ0z+vaXKS7QGtn/B1hoV9O12L+dLR1pEyoWt51nPK6iuaODyQsXdceq0
         Kfyw==
X-Gm-Message-State: AO0yUKX6WEExHUHVkp1/o8Yn412mEbFOokb8lNRknsOOV2PezzysQzN5
	S5dtULDdkWpTclA7xTDQQHk=
X-Google-Smtp-Source: AK7set/8qQb1Hjw/betjv72ZaigX0crtS9Q2pSRmxgWLGBSHuXF8mCw+9KMjFoffloFpy6+/1ilkCg==
X-Received: by 2002:a05:600c:540c:b0:3df:9858:c03d with SMTP id he12-20020a05600c540c00b003df9858c03dmr153738wmb.18.1675275253589;
        Wed, 01 Feb 2023 10:14:13 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l16-20020a1c7910000000b003dc1d668866sm2378907wme.10.2023.02.01.10.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:14:12 -0800 (PST)
Message-ID: <2eefe6d4-6ca3-dc5f-6a04-f4f3c49692dd@gmail.com>
Date: Wed, 1 Feb 2023 19:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: mediatek updates for v6.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_101416_096302_85193961 
X-CRM114-Status: GOOD (  19.68  )
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
Cc: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, "allen-kh.cheng" <allen-kh.cheng@mediatek.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, Alexandre Mergnat <amergnat@baylibre.com>, Biao Huang <biao.huang@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>, Pin-Yen Lin <treapking@chromium.org>, Chen-Yu Tsai <wens@csie.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hsin-Yi Wang <hsinyi@chromium.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Balsam CHIHI <bchihi@baylibre.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Olof,
Hi Arnd,

Below are large list of updates for 64 bit based MediaTek boards. While we have 
some smaller updates to older HW, like MT8183 and MT8173, a lot is happening in 
the around the Chromebooks chips.

The MT8186 has got support for several peripherals like IOMMU, power domains, 
DSI, audio and DPI.

The MT8192 (Acer Chromebook 514) got support for the internal display and audio.

The MT8195 (Acher Crhomebook Spin 513) got support for the power domains as well 
as JPG en- and decoder.

Apart from that we got support for the MT7986 based BananaPi R3.

Please have a look!

Regards,
Matthias

---
The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.2-next-dts64

for you to fetch changes up to 6bbd1241700ac10c0ae71b86030ad9a6ca41b93b:

   arm64: dts: mediatek: mt8516: Fix the watchdog node name (2023-02-01 14:54:57 
+0100)

----------------------------------------------------------------
mt7986:
- add USB host support
- add support for mmc, pcie
- add support for Bananpi R3

mt8173:
- switch to SMC watchdog for Acer Chromebook R13
- move panel under aux bus

mt8183:
- support detachable keyboards on kukui based Chromebooks
- describe 13 MHz clock correctly
- complete CPU cache information

mt8186:
- Add pm-domains, iommu, dsi
- describe 13 MHz clock correctly
- complete CPU cache information
- add crypto support for the eMMC
- add audio controler, DPI and ADSP mailbox support
- describe CPUs as a single cluster

mt8192:
- describe 13 MHz clock correctly
- complete CPU cache information
- enable display regulators, backlight, internal display and audio on
   Acer Chromebook 514
- describe CPUs as a single cluster

mt8195:
- Add power domain to t-phy
- describe 13 MHz clock correctly
- complete CPU cache information
- enable audio for Acer Chromebook Spin 513
- add ethernet support for the demo board
- add JPG enconder and decoder device
- describe CPUs as a single cluster

Smaller changes for mt6795, mt7622, mt8516 and mt6358.

----------------------------------------------------------------
Alexandre Mergnat (2):
       arm64: dts: mt6358: change node names
       arm64: dts: mt8173: change node name

Allen-KH Cheng (9):
       arm64: dts: mt8186: Add power domains controller
       arm64: dts: mt8186: Add IOMMU and SMI nodes
       arm64: dts: mt8186: Add dsi node
       arm64: dts: mediatek: mt8186: Add crypto support for eMMC controller
       arm64: dts: mediatek: mt8186: Add ADSP mailbox nodes
       arm64: dts: mediatek: mt8186: Add audio controller node
       arm64: dts: mediatek: mt8186: Add DPI node
       arm64: dts: mediatek: mt7986: Fix watchdog compatible
       arm64: dts: mediatek: mt8516: Fix the watchdog node name

AngeloGioacchino Del Regno (21):
       arm64: dts: mediatek: mt8195: Use P1 clocks for PCIe1 controller
       arm64: dts: mediatek: mt8195: Add power domain to U3PHY1 T-PHY
       arm64: dts: mt8195: Add complete CPU caches information
       arm64: dts: mt8192: Add complete CPU caches information
       arm64: dts: mt8186: Add complete CPU caches information
       arm64: dts: mt8183: Add complete CPU caches information
       arm64: dts: mt6795: Add complete CPU caches information
       arm64: dts: mediatek: cherry: Add Audio Front End (AFE) support
       arm64: dts: mediatek: cherry: Enable the Audio DSP for SOF
       arm64: dts: mediatek: cherry: Add external codecs and speaker amplifier
       arm64: dts: mediatek: cherry: Add sound card configuration
       arm64: dts: mediatek: mt8173-elm: Move display to ps8640 auxiliary bus
       arm64: dts: mt8195: Fix CPU map for single-cluster SoC
       arm64: dts: mt8192: Fix CPU map for single-cluster SoC
       arm64: dts: mt8186: Fix CPU map for single-cluster SoC
       arm64: dts: mt8195: Change idle states names to reflect actual function
       arm64: dts: mt8186: Change idle states names to reflect actual function
       arm64: dts: mt8192: Change idle states names to reflect actual function
       arm64: dts: mediatek: mt7622: Add missing pwm-cells to pwm node
       arm64: dts: mediatek: mt8186: Fix watchdog compatible
       arm64: dts: mediatek: mt8195: Fix watchdog compatible

Balsam CHIHI (1):
       arm64: dts: mt8195: Add efuse node to mt8195

Bernhard Rosenkränzer (2):
       dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
       arm64: dts: mediatek: Remove pins-are-numbered property

Biao Huang (1):
       arm64: dts: mt8195: Add Ethernet controller

Chen-Yu Tsai (5):
       arm64: dts: mediatek: mt8183: Fix systimer 13 MHz clock description
       arm64: dts: mediatek: mt8192: Fix systimer 13 MHz clock description
       arm64: dts: mediatek: mt8195: Fix systimer 13 MHz clock description
       arm64: dts: mediatek: mt8186: Fix systimer 13 MHz clock description
       arm64: dts: mediatek: mt8192: Mark scp_adsp clock as broken

Frank Wunderlich (1):
       arm64: dts: mt7986: add Bananapi R3

Hsin-Yi Wang (2):
       arm64: dts: mt8183: kukui: Split out keyboard node and describe detachables
       arm64: dts: mt8183: jacuzzi: Move panel under aux-bus

Krzysztof Kozlowski (3):
       arm64: dts: mediatek: align LED node names with dtschema
       arm64: dts: mediatek: mt7622: drop serial clock-names
       arm64: dts: mediatek: mt8183: drop double interrupts

Nícolas F. R. A. Prado (5):
       arm64: dts: mediatek: asurada: Add display regulators
       arm64: dts: mediatek: asurada: Add display backlight
       arm64: dts: mediatek: asurada: Enable internal display
       arm64: dts: mediatek: asurada: Enable audio support
       arm64: dts: mediatek: asurada: Add aliases for i2c and mmc

Pin-yen Lin (1):
       arm64: dts: mt8173-elm: Switch to SMC watchdog

Sam Shih (3):
       arm64: dts: mt7986: add usb related device nodes
       arm64: dts: mt7986: add mmc related device nodes
       arm64: dts: mt7986: add pcie related device nodes

kyrie wu (2):
       arm64: dts: mt8195: add jpeg encode device node
       arm64: dts: mt8195: add jpeg decode device node

  .../devicetree/bindings/arm/mediatek.yaml          |   4 +
  arch/arm64/boot/dts/mediatek/Makefile              |   5 +
  arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |   1 -
  arch/arm64/boot/dts/mediatek/mt6358.dtsi           |   6 +-
  arch/arm64/boot/dts/mediatek/mt6795.dtsi           |  50 ++
  arch/arm64/boot/dts/mediatek/mt7622.dtsi           |   2 +-
  .../dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dtso |  29 ++
  .../dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso |  55 ++
  .../dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso  |  68 +++
  .../dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso   |  23 +
  .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 450 ++++++++++++++++
  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts       | 120 +++++
  arch/arm64/boot/dts/mediatek/mt7986a.dtsi          | 125 ++++-
  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts       |   8 +
  arch/arm64/boot/dts/mediatek/mt8167.dtsi           |   1 -
  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |  41 +-
  arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |   2 +-
  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   1 -
  .../mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts  |   2 +-
  .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  28 +-
  .../boot/dts/mediatek/mt8183-kukui-kakadu.dtsi     |   6 +
  .../boot/dts/mediatek/mt8183-kukui-kodama.dtsi     |   6 +
  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi      |   6 +
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |   2 +-
  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  86 ++-
  arch/arm64/boot/dts/mediatek/mt8186.dtsi           | 579 ++++++++++++++++++++-
  .../mt8192-asurada-audio-rt1015p-rt5682.dtsi       |  19 +
  .../dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi |  26 +
  .../dts/mediatek/mt8192-asurada-audio-rt5682.dtsi  |  21 +
  .../boot/dts/mediatek/mt8192-asurada-hayato-r1.dts |   1 +
  .../dts/mediatek/mt8192-asurada-spherion-r0.dts    |   1 +
  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   | 465 +++++++++++++++++
  arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 107 +++-
  .../boot/dts/mediatek/mt8195-cherry-tomato-r1.dts  |  10 +
  .../boot/dts/mediatek/mt8195-cherry-tomato-r2.dts  |  10 +
  .../boot/dts/mediatek/mt8195-cherry-tomato-r3.dts  |  10 +
  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    | 109 ++++
  arch/arm64/boot/dts/mediatek/mt8195-demo.dts       |  77 +++
  arch/arm64/boot/dts/mediatek/mt8195.dtsi           | 309 ++++++++++-
  arch/arm64/boot/dts/mediatek/mt8516.dtsi           |   3 +-
  40 files changed, 2764 insertions(+), 110 deletions(-)
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dtso
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
  create mode 100644 
arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682.dtsi

