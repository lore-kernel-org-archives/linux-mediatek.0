Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3626EC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 16:01:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC1E5221E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 16:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dyJVxjuU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOltaOc3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC1E5221E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdDkbotZX5HlYa0OG3F1t/qDKDo6V1vRff0o6IE7QLA=; b=dyJVxjuUn5GH2ijgEluB7rPQEU
	tycoFsycRP/hAbMUTMStVJqqrvW+iR5B2XDYuzYjuVICQIxuZc2xC+iaCT7ONhrpEoJWNcS8jTfMT
	KWr6xNNJhFqOYbPeDXpwPVA6/VlmYBq4m5/RRNo2YFVllUpYqf2Uxp1SRgxp0//r0tV6AuDNjrLgJ
	aj049EeJ/JOnD9Aq3ndccQMuiHZo75OFhD5knU0TVZXXzeg8uYSP5P3+cW0NRygcwZFRAuQ9Red83
	QDwrjinyx62S3OrPZeo2eCn6xuL9qhySiVYtjxf8L6ITs9YWgTFEfbDTAfOZKateui8JXWIcx0xlX
	ei8d+v8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIZsB-0005U6-Hm; Wed, 16 Sep 2020 16:01:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIZpu-0004H5-RZ; Wed, 16 Sep 2020 15:59:12 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9921622482;
 Wed, 16 Sep 2020 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600271949;
 bh=8OnggKDEvaqUI8NVuFZUCiaEESVDd9WWXRjDl36eKaM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cOltaOc37anJGjPGtCeapUvOGK58ezeNsETk2WlnLPh/H9imSvV9ZYiUngP40Qz6H
 LenA5VXXgGBymUBd/S9bxf7yO+jRFyG2gSqTfsnBbFRaAV5+LG+D0Ai1+K19bbdfss
 CQ2vjjndfd/+x0186rpAjHiELOLs8c0Ww7MAhfPA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 Nishanth Menon <nm@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 12/15] ARM: dts: aspeed: align GPIO hog names with dtschema
Date: Wed, 16 Sep 2020 17:57:12 +0200
Message-Id: <20200916155715.21009-13-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916155715.21009-1-krzk@kernel.org>
References: <20200916155715.21009-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_115911_133367_4BECAF5B 
X-CRM114-Status: GOOD (  14.04  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts  | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 21ae880c7530..d5ac379c909e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -564,7 +564,7 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		smbus0 {
+		smbus0-hog {
 			gpio-hog;
 			gpios = <4 GPIO_ACTIVE_HIGH>;
 			output-high;
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
index cb85168f6761..577c211c469e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
@@ -827,7 +827,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus0 {
+				smbus0-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -852,7 +852,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus1 {
+				smbus1-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -900,7 +900,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus2 {
+				smbus2-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -925,7 +925,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus3 {
+				smbus3-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -992,7 +992,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus4 {
+				smbus4-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -1017,7 +1017,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus5 {
+				smbus5-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -1065,7 +1065,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus6 {
+				smbus6-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -1090,7 +1090,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus7 {
+				smbus7-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
