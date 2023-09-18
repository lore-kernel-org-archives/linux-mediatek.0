Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3359C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 07:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A60OSmANdEj1qdlQAPPS0Wy4M2HCzCwvUt3i18ClpfU=; b=r31Ya4DuaN5/39MlpvfuKA2gc+
	KwxjeKSqimS1QTxGlghAR78jSgMg2uA73CKaMgx4eR4OC0RkzeO1X2eRzcmVlZENo+Y7zsAsp6ZMC
	0U+c9yJX4uLSgKhsOmJBEjPNVB94iplG0aT683P4pa3oHbY6tL6ZmVyfEcMBxspKbj40s7a0P3eyn
	6lvu1vgmi2YjwYPP4rbjMVuEPqz5dJg897QWgYUsMMHMW8aGOKmOE3GUbiYXMsS29yzETd/KKvsq6
	q9APpzzV+NU6FgjlaB6CSn3gGxymWr38PxzO1hGA32phaAaBGmMKJobBYIetZ7wlUyTzO6Gag9gPQ
	IT84kSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9AQ-00EnOr-0Y;
	Mon, 18 Sep 2023 07:59:38 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9AM-00EnNz-2t;
	Mon, 18 Sep 2023 07:59:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7888E20003;
	Mon, 18 Sep 2023 07:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1695023968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A60OSmANdEj1qdlQAPPS0Wy4M2HCzCwvUt3i18ClpfU=;
	b=WoNKxA2JwenWUdbj4rcD0ooJY/T0jemtRMr1pLi0jbUxp0obE6v/QGaZ25JniMN8dnv4Bm
	yKcjINMmqKJ0R9bR9UmSie4I1NGz/xvHmzSlvuNVkceS5+O5SlgPkVybsiYVI55mc58NTF
	A8Td2/fNDiMsSUDfbpDoJ9YHNvXrL6AQGw5JcTuVZ29A/cu+djArUiUBi5I3GRRyX4kBIH
	VlvaJb1k4aZxm7fOEDAoix1KashvQGL+qDZuaH+KaXN+4TAxtK6oJqIrY+7Bmy9lt/wNm8
	q8AKShrI4Za+QHqbX5sHPuQitldi3hXGADn/9e5XS7nTvv2jI2SYcmJtb13sVg==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] mips: dts: ralink: mt7621: rename to GnuBee GB-PC1 and GnuBee GB-PC2
Date: Mon, 18 Sep 2023 10:59:15 +0300
Message-Id: <20230918075915.87029-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_005935_083877_560EDF48 
X-CRM114-Status: GOOD (  10.24  )
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

Rename GB-PC1 to GnuBee GB-PC1, and GB-PC2 to GnuBee GB-PC2 to include
brand and model name.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts | 2 +-
 arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
index 129b6710b699..f9c262cc2e96 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
@@ -8,7 +8,7 @@
 
 / {
 	compatible = "gnubee,gb-pc1", "mediatek,mt7621-soc";
-	model = "GB-PC1";
+	model = "GnuBee GB-PC1";
 
 	memory@0 {
 		device_type = "memory";
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
index f810cd10f4f4..b281e13f22ed 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
@@ -8,7 +8,7 @@
 
 / {
 	compatible = "gnubee,gb-pc2", "mediatek,mt7621-soc";
-	model = "GB-PC2";
+	model = "GnuBee GB-PC2";
 
 	memory@0 {
 		device_type = "memory";
-- 
2.39.2


