Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD47C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Subject:From:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oyd7CAiQasMEjV0UrlEB9KTbfh3f8ai09wLGi3B5N8I=; b=SG4zikWi3sNRPg
	Mv9TQuV96IoZ9NtSGPQFDksmNmFIiNMPdqUWdwVxjYGX5yoC1jO/8gm4NXC5/mqloAalKfV+UUdYX
	UJuyJUYKUYnApXgPng99oP6woHh5iq3kdR1QIsvgo/0YnLfi6VUn1bVjhcLQKos7mhcxZ7glFLqxQ
	lqqKQBuEEY4t3qI/cZ5OhPUbN+cqWD3A/oL34ULGR/9lwPr7DskeJ47In9RhUXbDY+EB8yIYKIZOk
	Chy1hnRj0dfZRcuD1XjtJrMCYZ9HI3n9ZCntNHh+Cus805zxy88XQ01HVvxY+RkqswaZ72wSl/vM0
	lp7w9ZyY0TcjJRhlsIAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxBpP-00H8Ou-Ux; Mon, 21 Nov 2022 18:47:35 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxBpM-00H8NB-PL; Mon, 21 Nov 2022 18:47:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id l14so2323076wrw.13;
        Mon, 21 Nov 2022 10:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyd7CAiQasMEjV0UrlEB9KTbfh3f8ai09wLGi3B5N8I=;
        b=hb9CcICSgIbE98+jDxGR2LLIHzrsClboL2t/egatytCM9rfHxDa/wcQeUGIF2xj/Dh
         cfI8beXuCRYK40z7gj/v1g9MIzOmazfQslK7XwvKZDdIiuOhVIolLUNMrGr0IqWE+DVb
         AZBeg8fni+jPtUYdhtpsGqIqlPP4sIRO2yXi8krb2pOr3ezsthuGp70MKd5Lg5YUWqQg
         1m0F63De9Ug6NzoALVN8ygbaJWWfS+2usFfIildavFT7Ju8SLEkQ0k2myU7dvmr9Jpwt
         4r3Qd0z/J3epntz+ocHVDyfQRIxIeVUc0Ud8lAgfx+tXdZsGvYwfRR/tkD/pCh3G4/dG
         lh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oyd7CAiQasMEjV0UrlEB9KTbfh3f8ai09wLGi3B5N8I=;
        b=mNa1QxphCvL13Fo11QEDoTHB5iqIO8PXf2v0Lw9NAOU6ZvwFHfKZkaSgwylBjrR+Kt
         5BGJoASbCryu8FMOdOE1FZxwklfLTLzbpHpRELrLaXMrk5H0KdjpYWsO5iUO924Q/NC4
         uhezzNZE1RRCXo7fEDE5ekm4jvMnK9a5a2cgCBRs11XVDDqmAGpKAsaUx9JtG+1ygZz3
         Bci0Hvz3gM4LurTC82SZgKp2THmuX1EMy4t9C5tKXOdTph8x0D0WXVoCXlHlCIiscDSY
         hcrCJTcDgV5inDtFv4N+x+V/QjXYL1Ghouyq6GVjUIuxVdtovb0awneTm6NnLzRxmsGp
         rtQQ==
X-Gm-Message-State: ANoB5plVBtDj2EPMfyd/pmIry9qI4viyKNymHs9aBpxxmsfMGLmmq9Tx
	JUOPpeKxgdhvDILxNhWWQ8I=
X-Google-Smtp-Source: AA0mqf5OhBj/7Lq8rRjG45P21kz8UUgCv1OUUzQtebk2WGAkLWTA1uZHvQqTDQw0ER/8y9OuOpTv2A==
X-Received: by 2002:adf:f90d:0:b0:236:6efd:ed6a with SMTP id b13-20020adff90d000000b002366efded6amr12774492wrr.32.1669056447896;
        Mon, 21 Nov 2022 10:47:27 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id iv7-20020a05600c548700b003cf87623c16sm21979766wmb.4.2022.11.21.10.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 10:47:26 -0800 (PST)
Message-ID: <8933d687-71f0-e9ad-a7c6-2e5a8993463d@gmail.com>
Date: Mon, 21 Nov 2022 19:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: mediatek updates for v6.2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_104732_877430_B5A90EFD 
X-CRM114-Status: GOOD (  15.08  )
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
Cc: Pierre Gondois <pierre.gondois@arm.com>, Yassine Oudjana <y.oudjana@protonmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, Sam Shih <sam.shih@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Bo-Chen Chen <rex-bc.chen@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Olof and Arnd,

Please have a look on the latest and greatest DT patches for MediaTek. We got 
basic support for the Sony Xperia M5 (Helios X10 based). Apart from that we have 
activity around the MT7986 which is on the BananPi R3. Hopefully support the 
latter will be ready in the next merge window.
Apart from that, MT8195 based Chromebooks have now support for video encoder, 
PCIe and display port (internal and external one).

Best regards,
Matthias

---
The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.1-next-dts64

for you to fetch changes up to 885e153ed7c1b0ec8bc25651f0644b3cb65ecaf4:

   arm64: dts: mt7986: add spi related device nodes (2022-11-21 18:17:35 +0100)

----------------------------------------------------------------
Fix check warnings all over the place.

mt7986:
- Add crypto, I2C and SPI nodes

mt6795:
- Add clock nodes
- Add DMA support for UARTs
- Add MMC nodes
- Add basic support for Sonyx Xperia M5

mt8195:
- Add video enconder node
- Add PCIe support
- Fine tune capacity-dmips-mhz
- Add support for internal and external display port

----------------------------------------------------------------
AngeloGioacchino Del Regno (15):
       arm64: dts: mediatek: mt8195: Fix CPUs capacity-dmips-mhz
       arm64: dts: mt7896a: Fix unit_address_vs_reg warning for oscillator
       arm64: dts: mt6779: Fix devicetree build warnings
       arm64: dts: mt2712e: Fix unit_address_vs_reg warning for oscillators
       arm64: dts: mt2712e: Fix unit address for pinctrl node
       arm64: dts: mt2712-evb: Fix vproc fixed regulators unit names
       arm64: dts: mt2712-evb: Fix usb vbus regulators unit names
       arm64: dts: mediatek: pumpkin-common: Fix devicetree warnings
       arm64: dts: mediatek: mt6797: Fix 26M oscillator unit name
       arm64: dts: mediatek: mt6795: Add topckgen, infra, peri clocks/resets
       arm64: dts: mediatek: mt6795: Replace UART dummy clocks with pericfg
       arm64: dts: mediatek: mt6795: Add support for APDMA and wire up UART DMAs
       arm64: dts: mediatek: mt6795: Add support for eMMC/SD/SDIO controllers
       dt-bindings: arm: mediatek: Add compatible for MT6795 Sony Xperia M5
       arm64: dts: mediatek: Add support for MT6795 Sony Xperia M5 smartphone

Bo-Chen Chen (4):
       arm64: dts: mt8195: Add dp-intf nodes
       arm64: dts: mt8195: Add edptx and dptx nodes
       arm64: dts: mediatek: cherry: Add dp-intf ports
       arm64: dts: mediatek: cherry: Add edptx and dptx support

Frank Wunderlich (7):
       arm64: dts: mediatek: mt2712e: swap last 2 clocks to match binding
       arm64: dts: mt8183: drop drv-type from mmc-node
       arm64: dts: mt7622: drop r_smpl property from mmc node
       arm64: dts: mt7986: fix trng node name
       arm64: dts: mt7986: add i2c node
       dt-bindings: arm64: dts: mediatek: add compatible for bananapi r3
       arm64: dts: mt7986: move wed_pcie node

Matthias Brugger (1):
       arm64: dts: mediatek: mt7986: Add SoC compatible

Nícolas F. R. A. Prado (1):
       arm64: dts: mediatek: kukui: Remove i2s-share properties

Pierre Gondois (1):
       arm64: dts: Update cache properties for mediatek

Sam Shih (3):
       arm64: dts: mt7986: harmonize device node order
       arm64: dts: mt7986: add crypto related device nodes
       arm64: dts: mt7986: add spi related device nodes

Tinghan Shen (2):
       arm64: dts: mt8195: Add venc node
       arm64: dts: mt8195: Add pcie and pcie phy nodes

Yassine Oudjana (1):
       arm64: dts: mediatek: mt6779: Remove syscon compatible from pin controller

  .../devicetree/bindings/arm/mediatek.yaml          |   2 +
  arch/arm64/boot/dts/mediatek/Makefile              |   1 +
  arch/arm64/boot/dts/mediatek/mt2712-evb.dts        |  12 +-
  arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |  28 +--
  arch/arm64/boot/dts/mediatek/mt6779.dtsi           |  10 +-
  .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts    |  88 ++++++++
  arch/arm64/boot/dts/mediatek/mt6795.dtsi           | 109 +++++++++-
  arch/arm64/boot/dts/mediatek/mt6797.dtsi           |   2 +-
  .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |   1 -
  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       |   1 -
  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts       | 135 +++++++-----
  arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |  74 ++++++-
  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts       |  57 ++++-
  arch/arm64/boot/dts/mediatek/mt7986b.dtsi          |   3 +
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |   6 -
  arch/arm64/boot/dts/mediatek/mt8186.dtsi           |   3 +
  arch/arm64/boot/dts/mediatek/mt8192.dtsi           |   3 +
  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |  86 ++++++++
  arch/arm64/boot/dts/mediatek/mt8195.dtsi           | 233 ++++++++++++++++++++-
  arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi   |   6 +-
  20 files changed, 750 insertions(+), 110 deletions(-)
  create mode 100644 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts

