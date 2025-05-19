Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A84FC2D0CD
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 May 2025 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfXuB+wQPOfsfB20M22Pq6z4uUvKlStXYSoiVK40R24=; b=CHwqmGLwrJ8JE4sQTa42D0V3RM
	onyjtLrfhLjO3tse2xveAhl8ILVF5x40/zey8Sa5MH8ufCgdDik74zoOo+ur7e4t0rWu1vUfV6ilF
	PhKOEBk24Z/y61ESFVj4Z9250/lQAYGt40AE0Ctmw0FVaNlvkIVrAbITEnjHd6QtQNKfdhKrBsJ4K
	jB2MqpggmcY33r2JDQ1SpVDeGi4KuSgQVIYD0L8jSBUvcHKFR7VPv0MdX6LuoZqDifyfzcns4Q8N0
	MF8ppiDru/vcOOcHPDHH22EWv1r413s3yr71b9VVcJnUycEgZ9RasAbZnVIbSEepTAwJwEJpWPFwN
	8EYoD3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzYP-000000098aT-1mVJ;
	Mon, 19 May 2025 12:25:13 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzP0-0000000971D-0d1x
	for linux-mediatek@lists.infradead.org;
	Mon, 19 May 2025 12:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=rfXuB+wQPOfsfB20M22Pq6z4uUvKlStXYSoiVK40R24=; b=CbQyHm
	iiWqpc02fUDFPI1CfmWGxuif8vWzgrvin9FzdX8kbqnbu28TDur88iTGXaRJThh+
	332fIC5uhyHRsk9NbPBDbgckVZP96nWzSjKDglXC0MvmWjkpOIMQTRrB/yH0yR7c
	MpPXnVbD9XBXKN8z4uBTYdPHryx0DOLJsflpk0NHSDxTU7uyYd+jIJahMzwhD537
	paEtDGzL2WOnY1uJzjs/o+4x/nQdWjMnENLB/TVz0+cop+h8iTHt/Tquqj4RCYoh
	YErktFkU1GQ9Vu8j0azNO1VeDHog1A+qfJEG4fOqltuiq74WhgrimZXXnmqRdpe9
	pOpdaRsV/Hv0Y53g==
Received: (qmail 2475103 invoked from network); 19 May 2025 14:15:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 14:15:23 +0200
X-UD-Smtp-Session: l3s3148p1@mCUdFnw1FJpZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/7] arm64: dts: mediatek: use proper node names for GPIO based I2C busses
Date: Mon, 19 May 2025 14:15:02 +0200
Message-ID: <20250519121512.5657-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_051530_483486_14257BCC 
X-CRM114-Status: GOOD (  11.07  )
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

There shall not be a '-' before the number.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index ed79ad1ae871..d0e1d8f064c4 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -64,7 +64,7 @@ wps-key {
 	};
 
 	/* i2c of the left SFP cage (wan) */
-	i2c_sfp1: i2c-gpio-0 {
+	i2c_sfp1: i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pio 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&pio 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -74,7 +74,7 @@ i2c_sfp1: i2c-gpio-0 {
 	};
 
 	/* i2c of the right SFP cage (lan) */
-	i2c_sfp2: i2c-gpio-1 {
+	i2c_sfp2: i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pio 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&pio 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-- 
2.47.2


