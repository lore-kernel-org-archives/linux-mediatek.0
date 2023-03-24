Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4765EC6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 17:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FDCRjgkVguwXKJPmiprwa8t2CNrwGgdcGU4eea0VKLE=; b=P6E9vNoH6jHRXX7+lpbjDFfM/4
	X5TBSxucQCAiS0hDuNkybASrYAzIi4bGVS1DdrLfALcC3gkRAbEkiMTLRBzd7XhnU9KxhRrJThI9I
	x51ObWRqvRP4hLg8ZnX3t60zN21dXnLLuL56uuaxngXTxL6zDyt7cXcAHJFkJNIGEsm0ubENjHWW4
	dD450AGYy6ArvLmKAwizlk2+kz4vVgg7afIVV9GerqRQnjaGux4Ezm4IHYyiAB9z9yZ+dloy5aD7Q
	4OLVvUqoBfH76KMLd6vKvJj1M5CmZZDztQrASyhSogsPPkDOUW44SQSvHov2LeHXDJwn4V1HcqCAs
	INvyRXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfldd-005AcN-21;
	Fri, 24 Mar 2023 17:55:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfld5-005AH2-2O;
	Fri, 24 Mar 2023 17:55:10 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 46F78660312C;
	Fri, 24 Mar 2023 17:55:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679680501;
	bh=hOCXvcOE1MA3NmbXb3wO5+23XLwEJusz/3mlJjscfXY=;
	h=From:To:Cc:Subject:Date:From;
	b=VcCelZrzrPMuMi4IAPf/JS1jSst8gv5jyfXGHeGomLiCesKIFIlrpIcbwURAxZlYr
	 8iu4m9pA3wqxjgq/TNVqZTyVoeMQ7RKgHTqwLyyVUvuXEABEKDTxItS29tv/fnykqC
	 hmNFCIs4Hni9YSB6NUMojaZiZ6GAAyXg80m5M01YsBXLokNFEfu8qrcDsvxRujBl6J
	 XqMX8W+cfzCa90NcVo0WQHg0KQS8+0PzD9Gl2gIqKQSogt/2QN7VD7qPNXepnFWufI
	 vxLWmLD5bIWO7zg+YwnAzimPPdI5KBGy1/RpbNrnciKEckvz9C3/5bReE1VnhWTXv5
	 Ai/9q2kT9RYKg==
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
Subject: [PATCH v1 00/18] MT6795 Helio X10 and Sony Xperia M5: DT step 2!
Date: Fri, 24 Mar 2023 18:54:38 +0100
Message-Id: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_105508_026203_BF5B036F 
X-CRM114-Status: GOOD (  10.84  )
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

AngeloGioacchino Del Regno (18):
  arm64: dts: mediatek: mt6795: Add Frequency Hopping Controller node
  arm64: dts: mediatek: mt6795: Add apmixedsys syscon node
  arm64: dts: mediatek: mt6795: xperia-m5: Enable Frequency Hopping
  dt-bindings: i2c: i2c-mt65xx: Add compatible for MT6795 Helio X10
  arm64: dts: mediatek: mt6795: Add nodes for I2C controllers
  arm64: dts: mediatek: mt6795: Add SoC power domains
  dt-bindings: mailbox: mediatek,gce-mailbox: Add compatible for MT6795
  dt-bindings: gce: Add header for MT6795's GCE mailbox
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


