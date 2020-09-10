Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EB7C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 18:00:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1193E20C09
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 18:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C0ZJd+Re";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0lS38qL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1193E20C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEMsG28QgBAm16kEO1PF2r4iMZc5ftuBatsSusLMFRY=; b=C0ZJd+Reo7IRRmvJb2j0UzYC51
	pB5MO1rqx5Pc+OPEbCjC6HP/2WP+V3WHvM/4ztbY6iojI3pnHybky/rnChNSoiJxNP+c2AAuH5X1F
	G0A5zh9ugPnxTznRg32ta2koAmQCHOzw6EvajWyO26r8joLYYUA8mcPkQZst8495kEC0DCLBopo+4
	P1V4GzgQ7qbNV3mcIkox/nMGcwn/ZEyeC0TS1AWHGcwDZx6xI7NZ/69hwYLdQWVqBPDEWufFL3ixT
	N8JOGX06TwOj62VvnysdHRhv8yk/Xt+Go8PNlah0Ahm+jB+epZttgfmuu64tiwIqRXKIjgU/W+yI6
	kZilt9wA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGQrx-0003ax-9B; Thu, 10 Sep 2020 18:00:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGQqa-0002p2-KL; Thu, 10 Sep 2020 17:59:01 +0000
Received: from localhost.localdomain (unknown [194.230.155.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F18F421D40;
 Thu, 10 Sep 2020 17:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599760739;
 bh=euoNrh4CREhCtBrTlTDs/D23cyiar9mHO2VGZrvJGGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C0lS38qLr2jfEk2yhlwaXZzmaYcinq8ZDR7MVbkH6ctctSqOAC39pmBVy9T7tMARz
 ne82KmiWRJSRU2WQZGzCRJK+h6gtHtGpzyilfRd83upQgUNsalLHMtJUjNP8mF2oYB
 UBVCPw0WqSHJZS7u1eoQkNx0kWdJb8Q31lbJLNjc=
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
Subject: [PATCH v2 10/15] ARM: dts: am3874: iceboard: fix GPIO expander reset
 GPIOs
Date: Thu, 10 Sep 2020 19:57:28 +0200
Message-Id: <20200910175733.11046-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910175733.11046-1-krzk@kernel.org>
References: <20200910175733.11046-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_135900_895102_CBF57A28 
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

Correct the property for reset GPIOs of the GPIO expander.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/am3874-iceboard.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am3874-iceboard.dts b/arch/arm/boot/dts/am3874-iceboard.dts
index 1bb57019d082..9423e9feaa10 100644
--- a/arch/arm/boot/dts/am3874-iceboard.dts
+++ b/arch/arm/boot/dts/am3874-iceboard.dts
@@ -195,7 +195,7 @@
 					"FMCA_PG_C2M", "FMCA_PRSNT_M2C_L", "FMCA_CLK_DIR", "SFP_LOS",
 					"FMCB_EN_12V0", "FMCB_EN_3V3", "FMCB_EN_VADJ", "FMCB_PG_M2C",
 					"FMCB_PG_C2M", "FMCB_PRSNT_M2C_L", "FMCB_CLK_DIR", "SFP_ModPrsL";
-				reset_gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+				reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
 			};
 
 			u42: pca9575@21 {
@@ -208,7 +208,7 @@
 					"QSFPA_LPMode", "QSFPB_ModPrsL", "QSFPB_IntL", "QSFPB_ResetL",
 					"SFP_TxFault", "SFP_TxDisable", "SFP_RS0", "SFP_RS1",
 					"QSFPB_ModSelL", "QSFPB_LPMode", "SEL_SFP", "ARM_MR";
-				reset_gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+				reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
 			};
 
 			u48: pca9575@22 {
@@ -227,7 +227,7 @@
 					"GP_SW5", "GP_SW6", "GP_SW7", "GP_SW8",
 					"GP_LED8", "GP_LED7", "GP_LED6", "GP_LED5",
 					"GP_LED4", "GP_LED3", "GP_LED2", "GP_LED1";
-				reset_gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+				reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
 			};
 
 			u59: pca9575@23 {
@@ -240,7 +240,7 @@
 					"GTX1V8PowerFault", "PHYAPowerFault", "PHYBPowerFault", "ArmPowerFault",
 					"BP_SLOW_GPIO0", "BP_SLOW_GPIO1", "BP_SLOW_GPIO2", "BP_SLOW_GPIO3",
 					"BP_SLOW_GPIO4", "BP_SLOW_GPIO5", "__unused_u59_p16", "__unused_u59_p17";
-				reset_gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+				reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
 			};
 
 			tmp100@48 { compatible = "ti,tmp100"; reg = <0x48>; };
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
