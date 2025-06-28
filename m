Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27234C54ED1
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jun 2025 22:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4D4A8XAdpX1i4Oxx8GKbKsEsP87KOS/0voX/OWNYJ0=; b=XIHCvqSQtTzgC6krqkb02FsB6H
	se7qMqvatTW5KOsM5nlO4jQS6lGB2LJncr5e1GDfxkqbTPLuktT7jx030HsO4WSGwbP/XKyCYanV+
	ZFbs5ScFYKrqVAFYEXqZ//CuFasnv6NDliT6NhHEWPKbVx+8n2OtDM7Qpw940QMbjaDpNd3hE8hAH
	2tz+SnXTbvlAIL/ciwKAYj3M0cpVRMqN5L0fJTJ17G1EvJJJmlQ40JDmYsNzNI4dx4nQ1Kbxo2cXX
	OWIEZhUiEzT3Gy5pPVnGeEKby/9ZsZvBCAZZXnlJ9kIR32ubvvy14j5D/ZJUjSnTFpudoZGSHuib2
	5zpRving==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVeGj-0000000HMdh-0blK;
	Sat, 28 Jun 2025 22:43:33 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVeCB-0000000HMHB-0kEh
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Jun 2025 22:38:52 +0000
Received: (wp-smtpd smtp.wp.pl 30624 invoked from network); 29 Jun 2025 00:38:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1751150324; bh=g4D4A8XAdpX1i4Oxx8GKbKsEsP87KOS/0voX/OWNYJ0=;
          h=From:To:Subject;
          b=snyhA2IHcT9W6z5L2uRF9hYG2TAKfFXK42R8PScodBY/tr+9V01QIGJI/a2Pacg3I
           7bNjQyij1sT9Ura0N5nxwA7mdRyT/bwRX26Yv7rzIKBPqe79CY0jylSSmK77Aq9p/f
           sixeZUB7vK9+iTmZ1NNqUmeNgnAJWrE4rYQe4H2KYhXdZ0YuTzLS5+fQJIZaiHJu1V
           UEAof7cKFtPMJZnFQGbaAYJJg7yY+nCyGNZHC3cY18kQ0YHyop6ksYsv39vfgBmTja
           w+LTDyvsAbgm4XaCUv4LSC7gG12bkh93zR+9kgzDKBu7CmQht6uoUPwvdk9iEz673H
           LytEWgEI4M79w==
Received: from 83.24.145.121.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.145.121])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rafael@kernel.org>; 29 Jun 2025 00:38:44 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	olek2@wp.pl,
	zhiyong.tao@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] thermal/drivers/mediatek: Add support for MT7981 SoC
Date: Sun, 29 Jun 2025 00:38:36 +0200
Message-Id: <20250628223837.848244-3-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628223837.848244-1-olek2@wp.pl>
References: <20250628223837.848244-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: f11e1f19f95536b631eb315c46069eaa
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [AQOB]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_153851_368734_A9AA3ED9 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

The temperature sensor support on the MT7981 is exactly the same
as on the MT7986.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index 9ee2e7283435..020324901505 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1149,6 +1149,10 @@ static const struct of_device_id mtk_thermal_of_match[] = {
 		.compatible = "mediatek,mt7622-thermal",
 		.data = (void *)&mt7622_thermal_data,
 	},
+	{
+		.compatible = "mediatek,mt7981-thermal",
+		.data = (void *)&mt7986_thermal_data,
+	},
 	{
 		.compatible = "mediatek,mt7986-thermal",
 		.data = (void *)&mt7986_thermal_data,
-- 
2.39.5


