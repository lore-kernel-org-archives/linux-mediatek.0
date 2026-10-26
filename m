Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA9060A2604
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 09:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JCBsNvuT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KrKaz5Hd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ru9WJD/77wcdb27Qp7kbTXOCJ++kNaqReohvkAqpaW8=; b=JCBsNvuT20i6za
	pD5Zo+daLo/YZqLgBr23FLxYdz7xyIcqJJbWg5EoJNY60pwq3zL3nn7n3XX658ZvcpTX3+rn+Iayf
	ZdPu/PCqgCiGzUA9ktUKeLd+TA10+2sxiUVly8bVkz1tIFAn22bB0rz306/i7njXYhQXzZeXaUNtM
	BUKTAncUfIUNWpReUOx5utJ3vFBmqB5RJqx/2BV3J4+r3WcuwiNuXAS02Ca7UueYOYI0C3/aIoY+y
	/38btmPhnLXl9OXhut/NwU4FcmB2BQD4LVPq+rXszQ6w8ILNSbyPnw7iYHDLhYI8PGu5s9SpUIte5
	73Fm9LTillJcyUgZqdwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSi-000000029XM-0Kux;
	Mon, 26 Oct 2026 09:57:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSX-000000029J1-1zXL
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so17481595e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 02:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008660; x=1793613460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ru9WJD/77wcdb27Qp7kbTXOCJ++kNaqReohvkAqpaW8=;
        b=KrKaz5HdKHrmFRuhGLbQD1sNfg4/1wy5zX44T+K3SZ9dnY2Oc1+/wQXn/i6HpaOaTn
         bslFDTiJeaQrXLCgKOLZXDRqQCiz/eEQKUITCB8q+2t9XqfnX0P/FY9VkZTyYr2E7FoV
         mpmHrM6BlMfTjPWkXz2nb9vG+BJlR0SewMrwHvgqOM9QyCpk+QVFEs0WB0NLvsURCZ0d
         Ia2Skl4AXT1oxgFKYcPino7+mEX/HQ9zhP8UHhbaOcYj60xN/l0tLhab/YwRdVTzuVPz
         2CW1AYQWRpXeCVX+7taY9HFmShQFoXfFQBJI5TrhY8juqQwPQuX2RALtrhJj/8k3aDi2
         nEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008660; x=1793613460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ru9WJD/77wcdb27Qp7kbTXOCJ++kNaqReohvkAqpaW8=;
        b=ctcYVaN7Wa1DCbq6ggooCrgzoziya7mgZ/AeNptmaKpyQ/B5ti0Wu0lWXl6uuTGA4i
         VJ7iz+55J04C29qpmxCvC871Jci6Dr9So7bnKHWYu/G98r9R2h1GTfx03SC7hA90djQt
         6bfz9Fi0yJ3opIbdyi1byDzimflQRXls91TuvtX4lLpG0lJDv72wLDpT8m1lUo9mUjoj
         a5sUeiwWNw3wAkxwBfuhsYcS2ywOnYpY9Hj2cRGN9T02F/Xf+FWGakHIH25K0TD3xEA/
         jF5dfQwAUp1haVmvTvg+RBslvhY3/mdQvaTHU/hbO8KbsIAnIvs+IxPZjik3tfDuOQPk
         XWJg==
X-Forwarded-Encrypted: i=1; AKwUvBximqdj8Ylk1t5MBwKahE4NVjN/N82iU6imDLUwEZjKmPRyJimfcmvMwB/tJvpI/9Cma67KE+Za/KurAisW/Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYI5IrRgy4ukUBh9IL1P/yXtYQRzqhNOJPsMsKJz0kPUcoU1RV41
	S7+ihtlBICAGwSzs9I5PmyaS+7qO4IKZECxt4UtQEdOWbA8XZ/xgtbYx
X-Gm-Gg: AYBFou2sITNhqEZ24IZdYZM8A2bOFKw2ofeT89uNHZEBO0t1xHVpSM7Q71o6lC5taeb
	0HP42MLClBE2CWiLSfQH0R9YHe9j9RnZJ3mKLwbATqMcH1MfkTqZ6Rky6f8ReeaZdsAR+Hfv/Tw
	BgHgBD/Ayvnm7gV+r4eu2ilsQfRLJZAHDZXwgx7gRyIsIu1BlXUDd8O4V39NcVgB/XBvyaQDx8P
	Klb2jVL1Q075Dkp2BVlr/rSPOTNASIKRhRkga07bVba65s/9OnRoEEk3FkcngOm6683Q1ZBSAOz
	IOQK4c7AHzR8QzMMPvfwZA7sdcnwt87kL2hXXN7Ox+Iy/D2FtrteJ5hn9cvhpX4pq1W5nJ0JvNO
	7P221uE1c2ogBMIAYHZVvD94czU3XIVni+fNFP14R2NCFBoktPNt8tFHYBnqdviRXeqPdplOKUa
	8HRenJmxebUQT9YqTEb3lKe2YA0r8x27YWY5wn4nr6BRcJ1ZwukhjoF/4OvchxWVFpe7Fqdlqsz
	ZQT3tSRRU6uVMXxJx6cEXZVMRqjz9wJm3T7lfHTiT6U99bJcuWVq9tn2n9FnjQIaZVHetTCbVCB
	Zs5EfLyL6zrC6U7qr91RKRLhVZXG82a51UQ59+868AVMJITb9pCPPtnHS4d7
X-Received: by 2002:a05:600c:3b93:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4a35ac96004mr129196455e9.12.1793008659520;
        Mon, 26 Oct 2026 02:57:39 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:39 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] arm64: dts: airoha: en7581: add thermal sensor nodes
Date: Mon, 26 Oct 2026 10:57:10 +0100
Message-ID: <20261026095727.31708-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025741_550355_04F4F6FA 
X-CRM114-Status: GOOD (  11.78  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add thermal sensor nodes and attach them to the CPU node to control passive
throttle and define critical temperature of the SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index fbc5ee47523c..58bd8b318910 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -81,6 +82,7 @@ cpu0: cpu@0 {
 			power-domains = <&cpufreq>;
 			power-domain-names = "perf";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -94,6 +96,7 @@ cpu1: cpu@1 {
 			power-domains = <&cpufreq>;
 			power-domain-names = "perf";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -107,6 +110,7 @@ cpu2: cpu@2 {
 			power-domains = <&cpufreq>;
 			power-domain-names = "perf";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -120,6 +124,7 @@ cpu3: cpu@3 {
 			power-domains = <&cpufreq>;
 			power-domain-names = "perf";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		l2: l2-cache {
@@ -293,6 +298,39 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&thermal 0>;
+
+			trips {
+				cpu_hot: cpu-hot {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				cpu-critical {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_hot>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	clk20m: clock-20000000 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -319,6 +357,15 @@ gic: interrupt-controller@9000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		thermal: thermal-sensor@1efbd000 {
+			compatible = "airoha,en7581-thermal";
+			reg = <0x0 0x1efbd000 0x0 0xd5c>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			airoha,chip-scu = <&chip_scu>;
+
+			#thermal-sensor-cells = <0>;
+		};
+
 		spi@1fa10000 {
 			compatible = "airoha,en7581-snand";
 			reg = <0x0 0x1fa10000 0x0 0x140>,
-- 
2.55.0


