Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30ACC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:59:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3550920BED
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:59:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KJTweiZd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkFAnNN1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3550920BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/KWWAR8Qued3uZI/dV2+b74bSVpFZoQxBIskSMTek0=; b=KJTweiZdoT5NFTIumboEPJdx78
	SGn0pnpOgS+U09u+glwzvqKdYftUBQdg36XU5y7bvvYZEHKSvv4FSZePmiwP1TZn1Uqclu8r+w5Ho
	IphoZHheWmlg7bYsT6+JRF0WWyb8N4nL6okDBfgEcb7602zdNm9ND2Up4VjKHWecvjUJiJVCEZin1
	R8aUN2eKLulnLHZSAltTblTDS3k0HVfCB7fcOpH2VGDl7g5eJ5DDUxc2kUlCMwDewIMBTE8d6M5Pw
	Ce21hT/Catp0VXgVQl80EocsKQaczmzsLfgNUwuFmseCsZJgah1NbSJQZAGXZQsHeRMwRYETtEkdN
	/Ogb+nLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGQqV-0002mt-Gu; Thu, 10 Sep 2020 17:58:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGQq1-0002U7-N9; Thu, 10 Sep 2020 17:58:26 +0000
Received: from localhost.localdomain (unknown [194.230.155.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94DB620BED;
 Thu, 10 Sep 2020 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599760704;
 bh=OXsik6EqH3Q2Anuh4Xhln9JrXulc3fb3eoNqyC07rng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fkFAnNN12TOdvhn6emMXCqZQykb5yLGh/K746LenzHXMlovIxKy+Zq5SdiXSlg8Qz
 2RF8OVfWrKuDXJjqAAuMRbITTXVF8nP01xdSgL7obFCqV1222DzGswOIh25HVyevKV
 peANFOdksg/OJHzPQg/BjhrCOwJkzry8HLVVUU8A=
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
Subject: [PATCH v2 05/15] arm64: dts: renesas: align GPIO hog names with
 dtschema
Date: Thu, 10 Sep 2020 19:57:23 +0200
Message-Id: <20200910175733.11046-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910175733.11046-1-krzk@kernel.org>
References: <20200910175733.11046-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_135825_920122_72E5649B 
X-CRM114-Status: GOOD (  14.45  )
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
 .../boot/dts/renesas/r8a77951-salvator-xs.dts      |  2 +-
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |  2 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
index cef9da4376a3..e5922329a4b8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
@@ -118,7 +118,7 @@
 };
 
 &pca9654 {
-	pcie_sata_switch {
+	pcie-sata-switch-hog {
 		gpio-hog;
 		gpios = <7 GPIO_ACTIVE_HIGH>;
 		output-low; /* enable SATA by default */
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
index 5cef64605464..d7e621101af7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
@@ -55,7 +55,7 @@
 };
 
 &pca9654 {
-	pcie_sata_switch {
+	pcie-sata-switch-hog {
 		gpio-hog;
 		gpios = <7 GPIO_ACTIVE_HIGH>;
 		output-low; /* enable SATA by default */
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 202177706cde..e9ed2597f1c2 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -143,49 +143,49 @@
 		interrupt-parent = <&gpio6>;
 		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
 
-		audio_out_off {
+		audio-out-off-hog {
 			gpio-hog;
 			gpios = <0 GPIO_ACTIVE_HIGH>; /* P00 */
 			output-high;
 			line-name = "Audio_Out_OFF";
 		};
 
-		hub_pwen {
+		hub-pwen-hog {
 			gpio-hog;
 			gpios = <6 GPIO_ACTIVE_HIGH>;
 			output-high;
 			line-name = "HUB pwen";
 		};
 
-		hub_rst {
+		hub-rst-hog {
 			gpio-hog;
 			gpios = <7 GPIO_ACTIVE_HIGH>;
 			output-high;
 			line-name = "HUB rst";
 		};
 
-		otg_extlpn {
+		otg-extlpn-hog {
 			gpio-hog;
 			gpios = <9 GPIO_ACTIVE_HIGH>;
 			output-high;
 			line-name = "OTG EXTLPn";
 		};
 
-		otg_offvbusn {
+		otg-offvbusn-hog {
 			gpio-hog;
 			gpios = <8 GPIO_ACTIVE_HIGH>;
 			output-low;
 			line-name = "OTG OFFVBUSn";
 		};
 
-		sd-wifi-mux {
+		sd-wifi-mux-hog {
 			gpio-hog;
 			gpios = <5 GPIO_ACTIVE_HIGH>;
 			output-low;	/* Connect WL1837 */
 			line-name = "SD WiFi mux";
 		};
 
-		snd_rst {
+		snd-rst-hog {
 			gpio-hog;
 			gpios = <15 GPIO_ACTIVE_HIGH>; /* P17 */
 			output-high;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
