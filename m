Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86668C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 18:02:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0080F21D79
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 18:02:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ell/6eOV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zRkjmdTa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0080F21D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=269AP8BT777VZEG12fEA/JEvXM9b0EOdYq69I70u+FU=; b=Ell/6eOVQrM0hD1CGEGlTuPyQX
	wwReugq19EuSbvgkRu/JSXZ2mvZXvWlSxpLbITnwCR8HWsQ9K7cFDGRDGWIYhbl1TWrZkCC7GdA/N
	Rvf6lYcva8+DxwE8Zzgaex6XwDhqSt6+CITkFsb9HcryZCUG6dnKPhbs0qnf6n6UKOpbMd3TZa4yA
	VnW84A4clIP1XpF9kd3+RUHFcg2s6KzGQkfLIvNN4bISbqILYKlfgO7wLgcixBk09+JxCaHNI/Jfp
	YHPFdaPQhiRHp3Ft+2urCllq/6uskQk+RCjMUcSZg1HLMIMfwa3kHXgSjqp/OW7N4yW5nkq4QVMTw
	yGd+yhZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGQtW-0004bm-H6; Thu, 10 Sep 2020 18:02:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGQr2-00034c-A4; Thu, 10 Sep 2020 17:59:29 +0000
Received: from localhost.localdomain (unknown [194.230.155.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41D6F21D79;
 Thu, 10 Sep 2020 17:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599760767;
 bh=761zDxdXKDgTK0JSlpGwt9ghMs+g4BFzNJFURh3ro3I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zRkjmdTa7gbAktlFYrjxcRUY4d6ZSLoFPt8I76S3yJlVe+pMlLO1yZvq1GKw6nrgA
 GNuYvkQYqzVYORH3bBDutC9k9PT1TLS8dPJhHwlLygQFq2P/RjLxKjbe4HkVBCuMB+
 sk2SwkNwVK9r3XwdVkXWd978CKbND1N9TP4N7HAU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 Nishanth Menon <nm@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 14/15] ARM: dts: armada: align GPIO hog names with dtschema
Date: Thu, 10 Sep 2020 19:57:32 +0200
Message-Id: <20200910175733.11046-15-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910175733.11046-1-krzk@kernel.org>
References: <20200910175733.11046-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_135928_527202_D9C65010 
X-CRM114-Status: GOOD (  14.84  )
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

The convention for node names is to use hyphens, not underscores.
dtschema for pca95xx requires GPIO hogs to end with 'hog' prefix.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/armada-388-clearfog.dts  |  4 ++--
 arch/arm/boot/dts/armada-388-clearfog.dtsi | 10 +++++-----
 arch/arm/boot/dts/armada-388-helios4.dts   |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
index 20f8d4667753..4140a5303b48 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dts
+++ b/arch/arm/boot/dts/armada-388-clearfog.dts
@@ -73,13 +73,13 @@
 	 * 14-SFP_TX_DISABLE
 	 * 15-SFP_MOD_DEF0
 	 */
-	pcie2_0_clkreq {
+	pcie2-0-clkreq-hog {
 		gpio-hog;
 		gpios = <4 GPIO_ACTIVE_LOW>;
 		input;
 		line-name = "pcie2.0-clkreq";
 	};
-	pcie2_0_w_disable {
+	pcie2-0-w-disable-hog {
 		gpio-hog;
 		gpios = <7 GPIO_ACTIVE_LOW>;
 		output-low;
diff --git a/arch/arm/boot/dts/armada-388-clearfog.dtsi b/arch/arm/boot/dts/armada-388-clearfog.dtsi
index a0aa1d188f0c..f8a06ae4a3c9 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/armada-388-clearfog.dtsi
@@ -141,31 +141,31 @@
 		#gpio-cells = <2>;
 		reg = <0x20>;
 
-		pcie1_0_clkreq {
+		pcie1-0-clkreq-hog {
 			gpio-hog;
 			gpios = <0 GPIO_ACTIVE_LOW>;
 			input;
 			line-name = "pcie1.0-clkreq";
 		};
-		pcie1_0_w_disable {
+		pcie1-0-w-disable-hog {
 			gpio-hog;
 			gpios = <3 GPIO_ACTIVE_LOW>;
 			output-low;
 			line-name = "pcie1.0-w-disable";
 		};
-		usb3_ilimit {
+		usb3-ilimit-hog {
 			gpio-hog;
 			gpios = <5 GPIO_ACTIVE_LOW>;
 			input;
 			line-name = "usb3-current-limit";
 		};
-		usb3_power {
+		usb3-power-hog {
 			gpio-hog;
 			gpios = <6 GPIO_ACTIVE_HIGH>;
 			output-high;
 			line-name = "usb3-power";
 		};
-		m2_devslp {
+		m2-devslp-hog {
 			gpio-hog;
 			gpios = <11 GPIO_ACTIVE_HIGH>;
 			output-low;
diff --git a/arch/arm/boot/dts/armada-388-helios4.dts b/arch/arm/boot/dts/armada-388-helios4.dts
index fb49df2a3bce..b3728de3bd3f 100644
--- a/arch/arm/boot/dts/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/armada-388-helios4.dts
@@ -166,19 +166,19 @@
 					interrupt-controller;
 					#interrupt-cells = <2>;
 
-					board_rev_bit_0 {
+					board-rev-bit-0-hog {
 						gpio-hog;
 						gpios = <0 GPIO_ACTIVE_LOW>;
 						input;
 						line-name = "board-rev-0";
 					};
-					board_rev_bit_1 {
+					board-rev-bit-1-hog {
 						gpio-hog;
 						gpios = <1 GPIO_ACTIVE_LOW>;
 						input;
 						line-name = "board-rev-1";
 					};
-					usb3_ilimit {
+					usb3-ilimit-hog {
 						gpio-hog;
 						gpios = <5 GPIO_ACTIVE_HIGH>;
 						input;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
