Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39BDCCA47C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hysOCPD6uzNF8ytMSDRJ2nUuPOZaiP78t3B8jFiJXEE=; b=3tsIT9r9t+Q2wiYcedg461Jj7B
	lW1ltjXBQ9VZp7MxTq1JfqMGU7gIVo1Cng2kUYiIfamXgRwee2ZAnifFqMne0JwfMBRFnEhiMzTPg
	KsD3eOjsscQzt3gTVmhnh5ptANZja3u0UrZ3xH725wznmnrYpuWmnDvAv5PKc4EO4hf4A3LqabjBZ
	qhN47wbfitV3DfcMMpkVb9/UPFYxYZYlnDgid1w9QDr8mPJXXIEoDIecDVxmYRqYShYMct3dAnu5V
	8PbC3xguTOJR8KThz0Ct8u8LZqyqIPYJMtB7gTubFI/2ustKoR1dlB1rfqBb8QkFB5mwIu+R6Scfn
	noYsUmtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a7P-00ConM-OD; Wed, 29 Jun 2022 16:00:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a6r-00CoNU-6G; Wed, 29 Jun 2022 16:00:11 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 88F06660191F;
	Wed, 29 Jun 2022 17:00:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518402;
	bh=5jzvCGoUrHrL5/yJf6+vhjz74pv3DFTUx5ZwFy+A7lE=;
	h=From:To:Cc:Subject:Date:From;
	b=VOBtIa4ti0aCegzf39rysZ4fDCzi3EmDzqdPU9xjnlfjx99gJ81qXdysK3qxh+3pN
	 QnN//y85NmTQf455lS05Nn7IcXaHbaxPDD8sm4I+b2tPWA8NhDS6wW3l6dK/EIaXEA
	 dAzXaf8mqiy6czNH8y/Au/dJPnibIcI9T8sFvsSU2Py4vi3/bv1UpDuvcNIxxoqL7Q
	 npBsJixzWFH29p37i0gmdRKfyroLZwYvDVJp6kvzIhTeqsSbLb8SEwUl8OLQ1srHdy
	 55ewnKYjM1h6cEZOqiajM3ItlHLIVF5B8SL+O2rF60B5PM3RfIXysf5kZn7t/tPD8b
	 h8Z7HI0jab0sQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Maxim Kutnij <gtk3@inbox.ru>,
	Rob Herring <robh+dt@kernel.org>,
	Sam Shih <sam.shih@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 00/19] Introduce support for MediaTek MT8192 Google Chromebooks
Date: Wed, 29 Jun 2022 11:59:37 -0400
Message-Id: <20220629155956.1138955-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090009_414343_6738B99D 
X-CRM114-Status: GOOD (  13.01  )
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


This series introduces Devicetrees for the MT8192-based Asurada platform
as well as Asurada Spherion and Asurada Hayato boards.

Support for the boards is added to the extent that is currently enabled
in the mt8192.dtsi, and using only properties already merged in the
dt-bindings, as to not add any dependencies to this series.

This series was peer-reviewed internally before submission.

Series tested on next-20220629.

v3: https://lore.kernel.org/all/20220512205602.158273-1-nfraprado@collabora.com/
v2: https://lore.kernel.org/all/20220505194550.3094656-1-nfraprado@collabora.com/
v1: https://lore.kernel.org/all/20220316151327.564214-1-nfraprado@collabora.com/

Changes in v4:
- Added patches 17-19 enabling MMC, SCP and SPI NOR flash
- Switched mediatek,drive-strength-adv for drive-strength-microamp
- Switched mediatek,pull-up-adv for bias-pull-up
- Updated Vgpu minimum voltage to appropriate value

Changes in v3:
- Renamed regulator nodes to be generic
- Fixed keyboard layout for Hayato

Changes in v2:
- Added patches 1-2 for Mediatek board dt-bindings
- Added patches 13-16 enabling hardware for Asurada that has since been
  enabled on mt8192.dtsi

Nícolas F. R. A. Prado (19):
  dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-spherion
  dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-hayato
  arm64: dts: mediatek: Introduce MT8192-based Asurada board family
  arm64: dts: mediatek: asurada: Document GPIO names
  arm64: dts: mediatek: asurada: Add system-wide power supplies
  arm64: dts: mediatek: asurada: Enable and configure I2C and SPI busses
  arm64: dts: mediatek: asurada: Add ChromeOS EC
  arm64: dts: mediatek: asurada: Add keyboard mapping for the top row
  arm64: dts: mediatek: asurada: Add Cr50 TPM
  arm64: dts: mediatek: asurada: Add Elan eKTH3000 I2C trackpad
  arm64: dts: mediatek: asurada: Add I2C touchscreen
  arm64: dts: mediatek: spherion: Add keyboard backlight
  arm64: dts: mediatek: asurada: Enable XHCI
  arm64: dts: mediatek: asurada: Enable PCIe and add WiFi
  arm64: dts: mediatek: asurada: Add MT6359 PMIC
  arm64: dts: mediatek: asurada: Add SPMI regulators
  arm64: dts: mediatek: asurada: Enable MMC
  arm64: dts: mediatek: asurada: Enable SCP
  arm64: dts: mediatek: asurada: Add SPI NOR flash memory

 .../devicetree/bindings/arm/mediatek.yaml     |  13 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../dts/mediatek/mt8192-asurada-hayato-r1.dts |  47 +
 .../mediatek/mt8192-asurada-spherion-r0.dts   |  62 ++
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 959 ++++++++++++++++++
 5 files changed, 1083 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi

-- 
2.36.1


