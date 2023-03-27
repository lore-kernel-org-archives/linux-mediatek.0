Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF045C76195
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DjhKkbWyZb/pcUplnUVgrPqYJx7Ddkwbwq9OQMADxaY=; b=1OTGEp+YHm4UUqMMzozuGpQGYj
	aMMZuEcJFxgQ4r+EWXK2U42mxYB20kRG4K7PHXI3LKTeQyRqrlP2DMsW0gYSPcd/G9byj3aDercp/
	/ZC90kGO0jK6xmYkaRSz+WLN2LAE9tvurjXtEOpPLa8BytJZftBDQTyh+XglZ1EkxK9AzJWhFtsgQ
	pBn7vhV8aSKjtmKI2E6syO28hMxdmMnLMDHOeplVQV2PVQXaTpBzC0YFM00KkABPUFUo1WwCVAz9/
	dC4Au5uJCeciteKH4jlskzhSXC+CMAIk8/8OLdottxRDImGgfCOxBw3WUDWP9hIP1voK08DWohoUo
	elIYUADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiLd-00AH7F-0I;
	Mon, 27 Mar 2023 08:37:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiLX-00AH4o-0P;
	Mon, 27 Mar 2023 08:36:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D1D96601F5E;
	Mon, 27 Mar 2023 09:36:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679906213;
	bh=ubB9ozQrHtmRAC/h3ra8X8vZIkv037PoS7C0Tn1POaQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Hq+VWeyIHZac38b5D8jvwU8JFH3CHhnwWviZEWONgG6Uruu8oMv1HfRHoPOpRYmSz
	 i+PWmyfzx78Pv68NqDyXOZGWRoSMDui9gyPlzE0YSZOgmOxzfFMTNe7fBiKVZRFjIC
	 P4KKZMkXf2pMROJHkheZoy0t3ay+OhA5lN7/UMDKo/7z54oztM8OxH3f2Z2G3jM/6U
	 V7Q12gZ0cBhjpW0dg23RiEEBuVK4e7pgWvI3DrEHPtEhy4ithm3thRSAHVWynr4BYe
	 v8m+fVHbRzgua6cxa2FOj8Ip0fYPvVlDaVwKXzIqtPztyllYm5cgKw5lmFXns+HQdV
	 YtK4cQH34us8A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	houlong.wei@mediatek.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 00/17] MT6795 Helio X10 and Sony Xperia M5: DT step 2!
Date: Mon, 27 Mar 2023 10:36:30 +0200
Message-Id: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_013655_290457_18F2AF0D 
X-CRM114-Status: GOOD (  12.40  )
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

Changes in v2:
 - Squashed the addition of mediatek,mt6795-gce.h header with the
   commit adding the MT6795 GCE compatible.

This series further enhances the support for the MT6795 Helio X10 SoC
and the Sony Xperia M5 smartphone.

In particular, for the SoC support, this adds:
 - Frequency Hopping support
 - I2C controllers
 - Power domains
 - IOMMU support and LARBs
 - GCE/CMDQ Mailbox
 - VDECSYS and VENCSYS clocks
 - MMSYS support

...and, on the Xperia M5 smartphone, this adds:
 - Frequency Hopping with Spread Spectrum for MAINPLL, MPLL, MSDCPLL
 - Touchscreen support (Synaptics S2726, fw id: 1898977, RMI4 protocol)
 - Accelerometer
 - Magnetometer
 - Proximity sensor
 - NFC support

...all of which was successfully tested on the Xperia M5 smartphone.

This series depends on [1] for the MMSYS support.

Plan for step 3 is to push upstream full display support, which does
already work on my custom tree ;-)

[1]: https://lore.kernel.org/all/20230309102618.114157-1-angelogioacchino.delregno@collabora.com/

Cheers!

AngeloGioacchino Del Regno (17):
  arm64: dts: mediatek: mt6795: Add Frequency Hopping Controller node
  arm64: dts: mediatek: mt6795: Add apmixedsys syscon node
  arm64: dts: mediatek: mt6795: xperia-m5: Enable Frequency Hopping
  dt-bindings: i2c: i2c-mt65xx: Add compatible for MT6795 Helio X10
  arm64: dts: mediatek: mt6795: Add nodes for I2C controllers
  arm64: dts: mediatek: mt6795: Add SoC power domains
  dt-bindings: mailbox: mediatek,gce-mailbox: Add support for MT6795
  arm64: dts: mediatek: mt6795: Add support for the CMDQ/GCE mailbox
  arm64: dts: mediatek: mt6795: Add MMSYS node for multimedia clocks
  arm64: dts: mediatek: mt6795: Add VDECSYS and VENCSYS clocks
  arm64: dts: mediatek: mt6795: Add support for IOMMU and LARBs
  arm64: dts: mediatek: mt6795-xperia-m5: Enable I2C 0-3 busses
  arm64: dts: mediatek: mt6795-xperia-m5: Add Synaptics RMI4 Touchscreen
  arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMA255 Accelerometer
  arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMM050 Magnetometer
  arm64: dts: mediatek: mt6795-xperia-m5: Add Sensortek STK3310
    Proximity
  arm64: dts: mediatek: mt6795-xperia-m5: Add NXP PN547 NFC on I2C3

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   |   4 +
 .../mailbox/mediatek,gce-mailbox.yaml         |  20 +-
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 166 ++++++++++++
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 245 ++++++++++++++++++
 include/dt-bindings/gce/mediatek,mt6795-gce.h | 123 +++++++++
 5 files changed, 550 insertions(+), 8 deletions(-)
 create mode 100644 include/dt-bindings/gce/mediatek,mt6795-gce.h

-- 
2.40.0


