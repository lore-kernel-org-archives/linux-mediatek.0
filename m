Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D785C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 12:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/fcxz1jwM/yI/bzppgHbZZ5Jh4TNH9SaKzIKRlIHh0Y=; b=JjnAG/PKgj1h5MIEeUyE54nviD
	n9Dpon7iWCPQEcxW/Fine5gLZ3YBKR+vTBCYBuhH93WLivAvt1sJCng6vAiJmFysK7QrZoVRy+bE1
	30y9Rvklv7zEXG3htXq6pRcAr8Z10rQ9BmFgrTu+D5qcyIaODX8+MTh1gQXtHQ52WQCVfHKkiPXyY
	MgEHcZm8++69ClshfYlp0EKkZ71+VS7vKLNa5D/xasrd74FkKAekbO8AD4tZHbeo/1HczlXnpspgH
	L29oh57MTVHxWAD1NmmdwNNz5fVtTmL9lLaXY303rG/O3FjxenZA3h/o1r2kvpTEPp2h5GEflHkES
	+kxIdNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETIy-00000002Hi3-2fsg;
	Tue, 04 Jun 2024 12:30:20 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETIu-00000002HfJ-0NQf;
	Tue, 04 Jun 2024 12:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717504214;
	bh=ZUDxZH6b1ygH/V49EHxPNI3d82Oqfct1eSSEha90afY=;
	h=From:To:Cc:Subject:Date:From;
	b=4InVuIeo8s72ZzYmxD4Df+dgx53nCkCjPMrV5VNIIGgCgrEsDrjRO/RLEdW511728
	 z5nopx+bTObSHkaUxrQDo+Mjh99rapR9uAo09Apb2LLyhj7ZgRt/u22iFdYSIXrm1D
	 Goer3FOMW4waeOrG0ju2YdQ9GfAVdNGBQefItg4qnZZ4NMei3V0yaziQvKCET47+nB
	 yUq3MdghJAMaO4RYRuxFZBmdL4GtijZDcaCD9eGIm/1PwfQX7JSQU4L3Hf3C2V5k34
	 exVVOPT+Kqj1lyJ5os1cReibIjuUq8NKD0+RSKNbBEqNAJVxBAzmjyWAZUHsdyrnh3
	 6PH9rugdkBHHg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F0058378214D;
	Tue,  4 Jun 2024 12:30:12 +0000 (UTC)
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
	andy.shevchenko@gmail.com,
	kernel@collabora.com
Subject: [PATCH v2 0/5] MediaTek MT6357/8/9 PMIC Auxiliary ADC support
Date: Tue,  4 Jun 2024 14:30:03 +0200
Message-ID: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_053016_495190_FCB4EDDE 
X-CRM114-Status: GOOD (  10.44  )
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
 - Dropped 'mfd: mt6397-core: Add support for AUXADCs on MT6357/58/59 PMICs'
   as Lee J already applied it;
 - Added patch to describe the ADC subnode in the MT6357 MFD binding
   and moved the example node from mediatek,mt6359-auxadc.yaml to
   mediatek,mt6357.yaml
 - Added 8-bits {s8,u8}_fract to math.h
 - Addressed reviewer comments on mt6359-auxadc driver

AngeloGioacchino Del Regno (5):
  dt-bindings: iio: adc: Add MediaTek MT6359 PMIC AUXADC
  dt-bindings: mfd: mediatek,mt6357: Describe Auxiliary ADC subdev
  math.h: Add unsigned 8 bits fractional numbers type
  iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC
  arm64: dts: mediatek: Add ADC node on MT6357, MT6358, MT6359 PMICs

 .../iio/adc/mediatek,mt6359-auxadc.yaml       |  33 +
 .../bindings/mfd/mediatek,mt6357.yaml         |  10 +
 arch/arm64/boot/dts/mediatek/mt6357.dtsi      |   5 +
 arch/arm64/boot/dts/mediatek/mt6358.dtsi      |   5 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi      |   5 +
 drivers/iio/adc/Kconfig                       |  12 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/mt6359-auxadc.c               | 606 ++++++++++++++++++
 .../iio/adc/mediatek,mt6357-auxadc.h          |  21 +
 .../iio/adc/mediatek,mt6358-auxadc.h          |  22 +
 .../iio/adc/mediatek,mt6359-auxadc.h          |  22 +
 include/linux/math.h                          |   2 +
 12 files changed, 744 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
 create mode 100644 drivers/iio/adc/mt6359-auxadc.c
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h

-- 
2.45.1


