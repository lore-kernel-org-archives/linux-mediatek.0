Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C64C27C43
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LFRzA2jv++FPUlxd8JolO9nWBiHx3kKVkoJZodA5vUs=; b=dnF1+LJGg99stqo+tDDl4+rNd3
	8YGHYLATFhNp5S9yPmGjpcB/AYYgF7whXI+bX9FROrKNn0xK/Wzm+RKyhegl/DO7SxjIvf8gsKXGi
	Gxppib/AFjIaMYjaecij7KxqxARwbAsNx88DcNfIINaakluqls5nCQo+4QN18iadD15EmSp3GWRwB
	gNsawPmI8dwARfR2Rfzt7czBZHiv6xbYAxetTeNBkZRsGxidZecJawWccn0eskzpczQ9R8/7w5/pz
	F8wvcN/WgYZhK5rYDWxdF2ZobrawiZdN7lWw529X4Q5jkvWyqESciId6//r2651lKB8ftYJ+tIzIt
	MdAtHEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcBc-00000006qPg-1jw2;
	Thu, 30 May 2024 09:35:04 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcB2-00000006qBQ-395m;
	Thu, 30 May 2024 09:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717061663;
	bh=8ZQGTCGcyaej3NAULCSUI7HXuYKHb/3VdfI4eWGwi3k=;
	h=From:To:Cc:Subject:Date:From;
	b=4IOp5nkEGFtLNSOZG0xMpT8cqoH5Sf5dX+TlDIk/7s2JkAVhbtHaQrPuXewcNhh0w
	 kn+E+QTCioX1cHuXpdOxBOY3saNvT444FLkSUaKnFsD2u73MrbjF3cV/Eyq0PjG8sy
	 PQqOI0z7U6rqRZP9myveNpu1H9b9oXYUpIB4REIgNOGjYIE1NcLNMtmKhSHHlitmC9
	 NYYicYZGYBwC1Qapst0KOgN19AMMsYKDNvQiKGY65HA3JzsPHmo3nxPkxEmy0qeZMw
	 yrllIsYMOio5xKx9V0B9D5dQMlRL8YRD/A3ib05c5EhGfkju73C5rVuJ6pp7djqMhX
	 rvVlZl45PqByw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4E7FB3782196;
	Thu, 30 May 2024 09:34:22 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lee@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	bigunclemax@gmail.com,
	dlechner@baylibre.com,
	marius.cristea@microchip.com,
	marcelo.schmitt@analog.com,
	fr0st61te@gmail.com,
	mitrutzceclan@gmail.com,
	mike.looijmans@topic.nl,
	marcus.folkesson@gmail.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/4] MediaTek MT6357/8/9 PMIC Auxiliary ADC support
Date: Thu, 30 May 2024 11:34:06 +0200
Message-ID: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_023429_254620_0ECA621B 
X-CRM114-Status: GOOD (  10.25  )
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

This series adds support for the Auxiliary ADC IP found on the MediaTek
MT635(x) PMICs, including MT6357, 6358 and 6359, exposing various ADC
channels for accessory detection (usually, on 3.5mm jack), battery
voltage, PMIC temperature, PMIC-integrated voltage regulators, and
others, depending on the PMIC model.

AngeloGioacchino Del Regno (4):
  dt-bindings: iio: adc: Add MediaTek MT6359 PMIC AUXADC
  iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC
  mfd: mt6397-core: Add support for AUXADCs on MT6357/58/59 PMICs
  arm64: dts: mediatek: Add ADC node on MT6357, MT6358, MT6359 PMICs

 .../iio/adc/mediatek,mt6359-auxadc.yaml       |  43 ++
 arch/arm64/boot/dts/mediatek/mt6357.dtsi      |   5 +
 arch/arm64/boot/dts/mediatek/mt6358.dtsi      |   5 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi      |   5 +
 drivers/iio/adc/Kconfig                       |  12 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/mt6359-auxadc.c               | 598 ++++++++++++++++++
 drivers/mfd/mt6397-core.c                     |  10 +
 .../iio/adc/mediatek,mt6357-auxadc.h          |  21 +
 .../iio/adc/mediatek,mt6358-auxadc.h          |  22 +
 .../iio/adc/mediatek,mt6359-auxadc.h          |  22 +
 11 files changed, 744 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
 create mode 100644 drivers/iio/adc/mt6359-auxadc.c
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h

-- 
2.45.1


