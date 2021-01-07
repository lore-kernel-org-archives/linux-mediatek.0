Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90E4C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 05:22:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B5CA22DBF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 05:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B5CA22DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gRnEIWmuAZN5qkNHAeSjm4Dw7bkPbXny92ImPjjtXMw=; b=ChRZwI5BUNFQp/GVlf3zektY1g
	3YGYxkJxZWtd4sHPV7J2GULnXx66RFoKqyVfYQ2f9SIpaSalXW4uQ6ZyUrNF1SLFFyDz5EEzSzG/Q
	lqxHyn6ozse9Ei0+MhEokhHFBDuSH7FkXgVCEAusYEAhHPIfRbqhvWVpMS/BWuXYNWj2xZbvGC7lA
	jsBL2mtAYl+FuCLSSDBsPWQHIvnvDdqAncAvwRykX3y0vsh1i1VNRY+zwIxtHozWwd9ftQZ2Opxk2
	jyJjVXapS3KHv9MLFryp/EESfUQ+6Nj7itlE7RD8ITU3+a5ONyBuIqLYUXgia7OHMddMxr0YnxjE+
	vnArgxHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxNkY-0003uu-VB; Thu, 07 Jan 2021 05:22:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxNkT-0003tM-6R
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 05:22:15 +0000
Received: by mail-pf1-x42a.google.com with SMTP id t8so3158986pfg.8
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 21:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eLE93hpiBdRKt3WPBHOIxpy0yVp5ANcOQ4KAWXhz31Y=;
 b=Br2fUK5aQXEQnNF2FL1dWIM9oohchhmsLPeZY1u7dDH6KCIXjWouGqEdPHCo2bEsbj
 egUPgfFtUqJoYxOlC0VJTE4TE6pcc7/y4e7P6d1wZutvDlBUMthu6ImFhapt7FJVTl97
 SBso3chUoEzWTIJN2Y+NI9mYwJ81XAXeTFhII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eLE93hpiBdRKt3WPBHOIxpy0yVp5ANcOQ4KAWXhz31Y=;
 b=kCgrfuWXO7V1WZVn3QXsGZ9rgIoqGJ3dhit3dGaMHGu0tU3V4XWFiytdgC76Coh8VX
 dvN6VMSE0aCLoZ/IhAANyoZ7GWxcZ/uTA7owKTopaQAUwJJmHdQ3m8+JuOXEtZtEteSs
 b4pIXlVEBV7OzW2ZYyLU8rV/WktLP1uy0dM58t5Sb74qugKL1NkmVFzEbAZVaKJQKXxX
 G0iz9ObXhnHag53fbeY9IiBkzNpV7S43cgwvBrZBdgF04I5vqW5R5F0IqPgtJxTqO7+4
 qUgM581NGpUpjG5A/OG2slyaEePpJBzgzzSlIwIOMdw0OPmynLrYzB1CtQYymZweLRiw
 cvOQ==
X-Gm-Message-State: AOAM5330ME0oLcaIo4wbb+hZkvcSlRMtq5saV97pS90hBqkzE+6RD96R
 TlYkW9b2BCCv9ujXnWMaHq1rag==
X-Google-Smtp-Source: ABdhPJxJqLa/QJi+BCyVXEoST+A+b/gUGY6Xzc5D/qYc5FFQDs9oz+sKkoXWsQZWFRRhap+t+tKBLw==
X-Received: by 2002:a65:68c9:: with SMTP id k9mr131095pgt.328.1609996930794;
 Wed, 06 Jan 2021 21:22:10 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id c5sm4824479pgt.73.2021.01.06.21.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 21:22:10 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: mt8183: config dsi node
Date: Thu,  7 Jan 2021 13:22:05 +0800
Message-Id: <20210107052206.2599844-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_002214_223786_4293A541 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Config dsi node for mt8183 kukui. Set panel and ports.

Several kukui boards share the same panel property and only compatible
is different. So compatible will be set in board dts for comparison
convenience.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Change:
v2: move compatible to board dts
---
 .../mediatek/mt8183-kukui-krane-sku176.dts    |  5 +++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 37 +++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
index 47113e275cb52..721d16f9c3b4f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
@@ -16,3 +16,8 @@ / {
 	model = "MediaTek krane sku176 board";
 	compatible = "google,krane-sku176", "google,krane", "mediatek,mt8183";
 };
+
+&panel {
+        status = "okay";
+        compatible = "boe,tv101wum-nl6";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index bf2ad1294dd30..d3d20e4773cf1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -249,6 +249,35 @@ &cpu7 {
 	proc-supply = <&mt6358_vproc11_reg>;
 };
 
+&dsi0 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	panel: panel@0 {
+		// compatible will be set in board dts
+		reg = <0>;
+		enable-gpios = <&pio 45 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_pins_default>;
+		avdd-supply = <&ppvarn_lcd>;
+		avee-supply = <&ppvarp_lcd>;
+		pp1800-supply = <&pp1800_lcd>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+
+	ports {
+		port {
+			dsi_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
@@ -547,6 +576,14 @@ pins_clk {
 		};
 	};
 
+	panel_pins_default: panel_pins_default {
+		panel_reset {
+			pinmux = <PINMUX_GPIO45__FUNC_GPIO45>;
+			output-low;
+			bias-pull-up;
+		};
+	};
+
 	pwm0_pin_default: pwm0_pin_default {
 		pins1 {
 			pinmux = <PINMUX_GPIO176__FUNC_GPIO176>;
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
