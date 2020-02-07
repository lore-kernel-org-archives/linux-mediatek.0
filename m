Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35352C352A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 09:03:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB9B62082E
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 09:03:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bVh7yjSS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="apIyMSSZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB9B62082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUclqYHEQpCdMxTIedxAmROUIGLnD5n2TCbdZubx1z4=; b=bVh7yjSSiKQ60L
	QcYR98syiefqes4ez7DwyL39tYmPapp6e2DhpP3SpJEhdvmXzn3o0H4hEEwZt3bT+X2+kRc0zO9+N
	TJfcfyS8eN6BgJ+M1Ph3wwZZKt9inBeEcATAT3XtqdJbzhBiN+62f6KPrqJ5FB4qto3KnoH6Poizb
	XI0CqyUCyeHDEd9iZ6IjQOyiqpZniSQp9sLoUF3hZP4ECepWFJbuytd5MMrVpOErQ9xKm7ItVDGu+
	QmTuz1Wn9HcipHBb+c4ZBfsOYuDl0nWLCW1u2jYB2k96TNHV2vJJ5AxTDPhNxh1yEqQ6y8TUsHslW
	PB2de/jj/q+ody+2a/0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izzY1-0006V3-HA; Fri, 07 Feb 2020 09:03:37 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izzXL-0005kU-Qr
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 09:02:57 +0000
Received: by mail-pg1-x530.google.com with SMTP id l24so803632pgk.2
 for <linux-mediatek@lists.infradead.org>; Fri, 07 Feb 2020 01:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hyAZ9vYdcLRitaWkueSPpRE9ACzjySSGPJECXo05uy8=;
 b=apIyMSSZ4jYtNfFDRJB4/7iIklUgN/HYdWCZgfb5sA1QFK9ejxCzko2FEKnJaX8YoL
 iREwkNhnJIsuRx3nWjH8Tvfob+WwiJLMED3G3JwgzpLIHx/U7duUDf2jDf/7pv3CgX5x
 alEEunHcwPcP4HaZmtHClbGnOnWQDIMINPmMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hyAZ9vYdcLRitaWkueSPpRE9ACzjySSGPJECXo05uy8=;
 b=uXPHLBtCZ+c4dqcpG7AQLfBKvd0hluWdu+xBsCH2fXy+Ri4kxvAE21FJEsLyg2y3gI
 USBKkksfzJYGLCaAwIh1q80T8M+LCq5dNB/6WX2/wB01zdbLIXqq/n73Dzk1vBb0XjXv
 p+W0Kh+vQNrVrzvmQ8RDYLBNbv8q54fi7YzSYMo/jPzjMKp6egiaz59yMvoMrS/eX3e2
 iIbahKQRREXi4QD8SrssmubBIssy4jyVD70rCaCAvq9Xl/YHbNUuxdWQcKpLiOfzejTd
 cxTRmscgH6GuKXb331Z2HRBMaQGEVQe6OVjQIFCjVV8HCztKtvb3qlkKIj5+oj2lzfvh
 4NIA==
X-Gm-Message-State: APjAAAWv9O9TjBD3ZUQZVBI7OcKzUvFSHGsHDdWgQ7cIsEDIIK3vGkG3
 BhioAHU1BtcrwhiUKCHb4EdCMQ==
X-Google-Smtp-Source: APXvYqyAdlphOjBQWx0IcPgDO3Cm1fli8wvyJ4OJ0h/6ogXLLzS88sG63L6kGFfFGTgTfsxEQZgT6w==
X-Received: by 2002:a63:eb02:: with SMTP id t2mr8516311pgh.289.1581066173726; 
 Fri, 07 Feb 2020 01:02:53 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id w6sm2309463pfq.99.2020.02.07.01.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 01:02:53 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 3/5] arm64: dts: mt8173: fix unit name warnings
Date: Fri,  7 Feb 2020 17:02:26 +0800
Message-Id: <20200207090227.250720-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
In-Reply-To: <20200207090227.250720-1-hsinyi@chromium.org>
References: <20200207090227.250720-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_010256_152049_8CE9D0C1 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixing several unit name warnings:

Warning (unit_address_vs_reg): /oscillator@0: node has a unit name, but no reg property
Warning (unit_address_vs_reg): /oscillator@1: node has a unit name, but no reg property
Warning (unit_address_vs_reg): /oscillator@2: node has a unit name, but no reg property
Warning (unit_address_vs_reg): /thermal-zones/cpu_thermal/trips/trip-point@0: node has a unit name, but no reg property
Warning (unit_address_vs_reg): /thermal-zones/cpu_thermal/trips/trip-point@1: node has a unit name, but no reg property
Warning (unit_address_vs_reg): /thermal-zones/cpu_thermal/trips/cpu_crit@0: node has a unit name, but no reg property
Warning (unit_address_vs_reg): /thermal-zones/cpu_thermal/cooling-maps/map@0: node has a unit name, but no reg property
Warning (unit_address_vs_reg): /thermal-zones/cpu_thermal/cooling-maps/map@1: node has a unit name, but no reg property
Warning (unit_address_vs_reg): /reserved-memory/vpu_dma_mem_region: node has a reg or ranges property, but no unit name
Warning (simple_bus_reg): /soc/pinctrl@10005000: simple-bus unit address format error, expected "1000b000"
Warning (simple_bus_reg): /soc/interrupt-controller@10220000: simple-bus unit address format error, expected "10221000"
Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 38 ++++++++++++------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 790cd64aa447..2b7f566fb407 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -42,14 +42,14 @@ aliases {
 		dpi0 = &dpi0;
 		dsi0 = &dsi0;
 		dsi1 = &dsi1;
-		mdp_rdma0 = &mdp_rdma0;
-		mdp_rdma1 = &mdp_rdma1;
-		mdp_rsz0 = &mdp_rsz0;
-		mdp_rsz1 = &mdp_rsz1;
-		mdp_rsz2 = &mdp_rsz2;
-		mdp_wdma0 = &mdp_wdma0;
-		mdp_wrot0 = &mdp_wrot0;
-		mdp_wrot1 = &mdp_wrot1;
+		mdp-rdma0 = &mdp_rdma0;
+		mdp-rdma1 = &mdp_rdma1;
+		mdp-rsz0 = &mdp_rsz0;
+		mdp-rsz1 = &mdp_rsz1;
+		mdp-rsz2 = &mdp_rsz2;
+		mdp-wdma0 = &mdp_wdma0;
+		mdp-wrot0 = &mdp_wrot0;
+		mdp-wrot1 = &mdp_wrot1;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
@@ -246,21 +246,21 @@ psci {
 		cpu_on	      = <0x84000003>;
 	};
 
-	clk26m: oscillator@0 {
+	clk26m: oscillator0 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <26000000>;
 		clock-output-names = "clk26m";
 	};
 
-	clk32k: oscillator@1 {
+	clk32k: oscillator1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <32000>;
 		clock-output-names = "clk32k";
 	};
 
-	cpum_ck: oscillator@2 {
+	cpum_ck: oscillator2 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
@@ -276,19 +276,19 @@ cpu_thermal: cpu_thermal {
 			sustainable-power = <1500>; /* milliwatts */
 
 			trips {
-				threshold: trip-point@0 {
+				threshold: trip-point0 {
 					temperature = <68000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				target: trip-point@1 {
+				target: trip-point1 {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_crit: cpu_crit@0 {
+				cpu_crit: cpu_crit0 {
 					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -296,13 +296,13 @@ cpu_crit: cpu_crit@0 {
 			};
 
 			cooling-maps {
-				map@0 {
+				map0 {
 					trip = <&target>;
 					cooling-device = <&cpu0 0 0>,
 							 <&cpu1 0 0>;
 					contribution = <3072>;
 				};
-				map@1 {
+				map1 {
 					trip = <&target>;
 					cooling-device = <&cpu2 0 0>,
 							 <&cpu3 0 0>;
@@ -316,7 +316,7 @@ reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-		vpu_dma_reserved: vpu_dma_mem_region {
+		vpu_dma_reserved: vpu_dma_mem_region@b7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xb7000000 0 0x500000>;
 			alignment = <0x1000>;
@@ -368,7 +368,7 @@ syscfg_pctl_a: syscfg_pctl_a@10005000 {
 			reg = <0 0x10005000 0 0x1000>;
 		};
 
-		pio: pinctrl@10005000 {
+		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8173-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl_a>;
@@ -575,7 +575,7 @@ mipi_tx1: mipi-dphy@10216000 {
 			status = "disabled";
 		};
 
-		gic: interrupt-controller@10220000 {
+		gic: interrupt-controller@10221000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
 			interrupt-parent = <&gic>;
-- 
2.25.0.225.g125e21ebc7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
