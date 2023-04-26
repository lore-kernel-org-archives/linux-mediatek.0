Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D46AC7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 10:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRBwEvfGQIrh+pVMdhdSvf8KI6OxPqchD4EYbezjkwM=; b=TFYqygXMbZhE0UEREgjwctU3Le
	9HbAtjfC9iiXNVb6WYCGi3J7yBA6Rcv0haCpWxHiuunYQ4Ryxy4P9OaY0koEtedtpEr6AMXXMKl+w
	n+wOEtxkII01JLV7172T3A1AbCRc4a83A9rfUj+4m5cb4EAHv5FYxB7NYmA1OcEaKYtkgmJhQkZxV
	0vSFEwgc6jEpEGWWg6R6BgEu4vhDo4q6ta7nkSaEhyKgW9IM6cueaagoxO6XwaXiod+A1ExncFWFB
	HW0ltzb6X1/vPy8VqgVEHuv/ZvJzNaY5MvKPmLdkqmTecoC1O9Fq0yaQueAgXHarYKdtP3t8EG+SH
	9SU59KeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcjT-003eyu-0C;
	Wed, 26 Apr 2023 10:50:43 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prcif-003eZg-04
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 10:49:54 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f1e2555b5aso27133885e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 03:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682506190; x=1685098190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRBwEvfGQIrh+pVMdhdSvf8KI6OxPqchD4EYbezjkwM=;
        b=FYB6XKHSK5KKsJr3WxBuRzt7a4ngh9IlwcxKwIBWhfFwmlPj4w9QvRnUf14Zud2OWr
         qPM0OzIHcGKwtFddfme28Ugk0gict/9LoW1Z/E+64kNpc0X0zVyotIINirzNIjjE2XM7
         zaaWUXOvVPBm8cY8qws7cFAac4sx6+hYtJ7UzbWbYwMklWxCdIQfALtnnL/oGIrdr47f
         Dt2PT6bOfqLu3miub99uy+KjLrA90TfC5B4Mjt4NGj+rmzXlmt4hZEJsBPFTCAEkV15q
         LYdSmhZOvFPKvl87gW8PKGuHxatWYbcvnzBvTwBfquCc8kT0MWamX9MLzjtsmv1BFCvP
         G3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682506190; x=1685098190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRBwEvfGQIrh+pVMdhdSvf8KI6OxPqchD4EYbezjkwM=;
        b=Bg1YjMnzNif5KxyW+lqh3zKdWTbLCMI+4icUlNC85vT2RIziQi6d2b68abiXc9aKra
         kQviI0/8uazR9rhqw7OGFVnxPPqqeq/imFdPTAem3pUYP6msrc0zE6TToSh6HITTkHYe
         B5pQ9Kg4XirlIGBorLIqXAoVOwF4caiASqVASr3I2CY25Jz/RBu+5mr9kMx5LXlmpdv0
         ip1YNAOA22hFBV+gCO2VyhOSQwo8EeLwhbM7ihuHuDPP1Q6JhTswNFC0vEpGNrTIhZ9+
         18dFuhMH5TV+OH4iGKCLJw2uPynT/QXVnswj3nGce/dLLt6AoyWG+tvouAut6ebRgJhq
         pfnA==
X-Gm-Message-State: AC+VfDyOtjWAikKVa4pV6v8oPdQhx90VQ+m5BQPlvSNfEEhH0HUZA1HH
	LzmeToSwlDu3vs6SREY+s5LYxg==
X-Google-Smtp-Source: ACHHUZ60G0FOxr7QbkS+ZT6GBwmKMmS2XUtDyx60byZRloL04GW+p5mCyFBHDEQZYkQZHCnBjdwV9A==
X-Received: by 2002:adf:db88:0:b0:304:a40c:43c3 with SMTP id u8-20020adfdb88000000b00304a40c43c3mr764782wri.45.1682506190004;
        Wed, 26 Apr 2023 03:49:50 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm17601988wmj.35.2023.04.26.03.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:49:49 -0700 (PDT)
From: amergnat@baylibre.com
Date: Wed, 26 Apr 2023 12:49:12 +0200
Subject: [PATCH v6 12/12] arm64: dts: mediatek: Add CPU Idle support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v6-12-8d6b1cfe7f29@baylibre.com>
References: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2737; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=vYzOQ2oc5j6ZLGT/M6bLKTIS/chNEplrOLaJKWbM7ds=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkSQG//NpQI53n7ENVZKetGCC5B3KGBqtL1pkQsjqZ
 srv1ZcaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZEkBvwAKCRArRkmdfjHURdFOD/
 9s6M7dJ3f1t9Ed8MXttvbolu9ojaNWTU5EMJ+7zH8udM2rTz/P5ge7tmJn6KG+D33RjwpXBnKWC3H7
 U9N7xXV3QoTaLaVeUxUzoU75ISfZEJGufUgxElJiygTw7VFcO7bZornDO5jw2bnQ5oXoYjp0AL+1o5
 R68PF9vW2VipeMtxw3sPHD7LyFy96n9EYPS0LkRSBP+9VEqEkQuc45dzNwUtmgGcLv+KAvllQyRCLP
 3HnF+rVfq04Sy62ofdiIUC5IGMHyGXS+Rd5ofXDJpzhuQKhvcrPG1s9GRqG1VxoHvygvudOpddvaeX
 DSjCnYCW5jzAh772Boi1W9Qq1RYA5hgtoEnaNEPvieuRsXlyQ17N9b0Jxv547SPjl4Jzd3QsvNOLvm
 Ph4Nyf5X1a8/EUlzWCV6HZg/14Qp4wGudia6OKwLahWTMZ8czHt95aiFwRhJeGoxZcDQM4z4SQVfNw
 QlONqroOGAFvjiwrDEUYXVpCrcyZR+bxOGUFyI04+d+6ORytZYpTbfev+pX2cR2FtZJyvEvCp7WISq
 sW/NByCHH6Eq0uigoMARj7+r3vxaVWljOzf/KQcSGArqIMkLtvxuKhr9rkpCIvsL6SstC+b2KHOy0g
 xypXGB6U1r9aKg9H4ESi/92R/82AqJ7jt6/5QKXRVfpIqYAumyZj7UGxFPig==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_034953_058916_521A4EDC 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Amjad Ouled-Ameur <aouledameur@baylibre.com>

MT8365 has 3 CPU Idle states:
- MCDI_CPU. (Multi-Core-Deep-Idle)
- MCDI_CLUSTER.
- DPIDLE. (Deep-Idle)

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index cfe0c67ad61f..413496c92069 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -128,6 +128,7 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -147,6 +148,7 @@ cpu1: cpu@1 {
 			reg = <0x1>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -166,6 +168,7 @@ cpu2: cpu@2 {
 			reg = <0x2>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -185,6 +188,7 @@ cpu3: cpu@3 {
 			reg = <0x3>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -198,6 +202,37 @@ cpu3: cpu@3 {
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
+		idle-states {
+			entry-method = "psci";
+
+			CPU_MCDI: cpu-mcdi {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x00010001>;
+				entry-latency-us = <300>;
+				exit-latency-us = <200>;
+				min-residency-us = <1000>;
+			};
+
+			CLUSTER_MCDI: cluster-mcdi {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010001>;
+				entry-latency-us = <350>;
+				exit-latency-us = <250>;
+				min-residency-us = <1200>;
+			};
+
+			CLUSTER_DPIDLE: cluster-dpidle {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010004>;
+				entry-latency-us = <300>;
+				exit-latency-us = <800>;
+				min-residency-us = <3300>;
+			};
+		};
+
 		l2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;

-- 
2.25.1


