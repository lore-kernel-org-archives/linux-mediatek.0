Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00335C77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 10:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8BG56Q0+m7b3FaG//0Q095XeVZlwC5hERE//1oBbUU=; b=H1w/k9utYZ3xucWgNtfGOK2pGp
	dveDHxWbqYWmRmsKXmkI59hJDouXg3FTJBdzdXUOpcCutwk0cl2hAYcyiTCexdH3JPeU1CjpYk5w2
	6KdxzSgJgBNsHAE/A+vz8Dum537hHMxg4gbDRyo/we7QvYwRe5VBBEuMlCms0DDp3sXlRpATKefMh
	dMZX+Nxh6VJPtlCk2aoiJlZSUSawR/CVkQvcr8LMSA8PE95EWOiGExkWpepzZBLj9+1w/Mkyk7Utp
	Ud13t8Z8Oob2x5f+VDLyLnJgS2PxaK9dxUb4qBQdPxIl0Odl+/ZJBODvkOfDB0ejcHwfWLdBwqzal
	ZwRapWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcjR-003ey0-2S;
	Wed, 26 Apr 2023 10:50:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prcid-003eYP-2i
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 10:49:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f1738d0d4cso44997585e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 03:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682506188; x=1685098188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8BG56Q0+m7b3FaG//0Q095XeVZlwC5hERE//1oBbUU=;
        b=aYXAZzfvKzrHp5bTwPuhC2l54ThShzXKcWkTdVvcqp9HG8uhapgDMdJqdFU6KEkdFz
         /V8fGA0FaZUxaLCH7un4kCZgIghDz5Ft5t8aLcAUdpfqCYWwvV1vJmfnGCP6Wp+hQRel
         Es9tBOvAyo77i8I5RvjoC68oXyN9eRd4bL3tWrgOPS4G9p4Xjw8RhiaSJ1TtKHuVg0Do
         PMpEeXeHAREKep47txySM/3/9n9c3JTjAlucxSzXT2UtZwObOVhONNVDiOhC+03Y7/s/
         hUp6IB1oLmoXeEBsbOL2h/KUzMlJAwDkVy7kMjxW7Tu8n+P9YjppN+A3m0UiM5XY6lw7
         ZrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682506188; x=1685098188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8BG56Q0+m7b3FaG//0Q095XeVZlwC5hERE//1oBbUU=;
        b=KJcfMdImZe3+OgWkShp+ed19fpSLTtIgm6+/NORWEEZE1jx+wpfzwwwf3lL6p/ejyY
         8xWlIP+/xBpVy6FKEEZihszcfqX1vhjiZ3D5qVx+hb2oAT1GiOLbUVXWK728SMDyn3Ou
         FKq4aJWegWFwc7smalD9il9019y5T17VeN4vCG6Sq1sih+Zy5eCA2QN12qtxO+97+grS
         U8cQ2WF62UBy9CeksB1ZXNRVxhfSCv36YTeAydwPlRBZlgK7m/9+u+e73FwT28ngiLfv
         lF2mcsYp9lSEM74PMKsWVIhiyTUOQGezIvS3sR6ig81foDOIA2oI477ttsESwtIa2Nyp
         ndsA==
X-Gm-Message-State: AAQBX9c1rPZyfWaA+9+MYwZN0gN8CywrTNO6sGZAiKs3d05y4ttKhlSY
	qbpPkyH4fN8lltJmbQ8U/aX2oA==
X-Google-Smtp-Source: AKy350YVXLQCLnS1cLdK89PZrv/Z1ugf29n4CNXgA0SCxiYJYfI7aIZG8KPKKkr1P9krW8LpegL6Rg==
X-Received: by 2002:a7b:c3d2:0:b0:3ed:a80e:6dfa with SMTP id t18-20020a7bc3d2000000b003eda80e6dfamr11851697wmj.40.1682506187845;
        Wed, 26 Apr 2023 03:49:47 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm17601988wmj.35.2023.04.26.03.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:49:47 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 26 Apr 2023 12:49:10 +0200
Subject: [PATCH v6 10/12] arm64: dts: mediatek: add OPP support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v6-10-8d6b1cfe7f29@baylibre.com>
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
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3792; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=iQCxmnK+eQfy1aBNVxZAL4gcwl2Oh2buOTNBmT3l0E0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkSQG/qLQtJwUDks5xtM/071v6dHlJsLh6Vt6q2cR1
 FuGIjLKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZEkBvwAKCRArRkmdfjHURS4/EA
 CDkZZ3jekGCJDLaK+PGqUIPjslW2V+405gqb0QmV1eD4IGEXXQV5+Andbixx64BXRH8eXQ05xz85lt
 l8FawZ1bhgHbtXKQ8XW5J5U3h8iBE2Oa7K2/KPBbPHz+KVxdV6uG+FphjYUu6RcwM6ZslqWIXBXLN7
 wrz7/BnNjTt8vu0sDXdL1ZYQlbRrX+7PGeHokyIa7sqsC5hLzXCqvg5Gxre2RhN7w09MSbUr1CeMHR
 DK0Vql3GCTiHtWA5OV9ZYdGW4IZdJX+Z1sK1rByBxPWcObWw8TiosuxMdWeMebQJBsboeAwwk6g/Z3
 3Gr9Tiel2eY2rRzpaphO7nB/dVPIFn+DBFJhO5h3orgncUdmOyEx2ahf1nAvly0ZVMmAWCqI2jIEdp
 S2RMbNgg2Z+42FiQTZeon41z7vO5aGPJvVMrccdePJDUQBNKfq8H6ZIXN8C1DDh8ZeOrd9aXB4PzEA
 xxxe7BRElv/bH8hi8a5u8P8eD8a89HulKYwsW/Jov77Ye5OR8RactDgbmcQ70p71HfXQjix4Auadv/
 mvEbdpwCT4EsZupQGWQOzVtF/PzxVJE3rbPVAnp1po1j8ujpZ3vu1f3uGl3R6ArkyhQglD++HYbLR+
 kpGrqvo6F68v3/O1Rs44x/yv9Ci4+xmsd9mlNtV51SCn7/bYhWGBd3XkEU7g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_034951_878424_AB4846AA 
X-CRM114-Status: GOOD (  10.00  )
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

In order to have cpufreq support, this patch adds generic Operating
Performance Points support.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 101 +++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index bb45aab2e6a9..cfe0c67ad61f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -20,6 +20,91 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			opp-microvolt = <650000>;
+		};
+
+		opp-918000000 {
+			opp-hz = /bits/ 64 <918000000>;
+			opp-microvolt = <668750>;
+		};
+
+		opp-987000000 {
+			opp-hz = /bits/ 64 <987000000>;
+			opp-microvolt = <687500>;
+		};
+
+		opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-microvolt = <706250>;
+		};
+
+		opp-1125000000 {
+			opp-hz = /bits/ 64 <1125000000>;
+			opp-microvolt = <725000>;
+		};
+
+		opp-1216000000 {
+			opp-hz = /bits/ 64 <1216000000>;
+			opp-microvolt = <750000>;
+		};
+
+		opp-1308000000 {
+			opp-hz = /bits/ 64 <1308000000>;
+			opp-microvolt = <775000>;
+		};
+
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-1466000000 {
+			opp-hz = /bits/ 64 <1466000000>;
+			opp-microvolt = <825000>;
+		};
+
+		opp-1533000000 {
+			opp-hz = /bits/ 64 <1533000000>;
+			opp-microvolt = <850000>;
+		};
+
+		opp-1633000000 {
+			opp-hz = /bits/ 64 <1633000000>;
+			opp-microvolt = <887500>;
+		};
+
+		opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <912500>;
+		};
+
+		opp-1767000000 {
+			opp-hz = /bits/ 64 <1767000000>;
+			opp-microvolt = <937500>;
+		};
+
+		opp-1834000000 {
+			opp-hz = /bits/ 64 <1834000000>;
+			opp-microvolt = <962500>;
+		};
+
+		opp-1917000000 {
+			opp-hz = /bits/ 64 <1917000000>;
+			opp-microvolt = <993750>;
+		};
+
+		opp-2001000000 {
+			opp-hz = /bits/ 64 <2001000000>;
+			opp-microvolt = <1025000>;
+		};
+	};
+
 		cpu-map {
 			cluster0 {
 				core0 {
@@ -50,6 +135,10 @@ cpu0: cpu@0 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu1: cpu@1 {
@@ -65,6 +154,10 @@ cpu1: cpu@1 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu2: cpu@2 {
@@ -80,6 +173,10 @@ cpu2: cpu@2 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu3: cpu@3 {
@@ -95,6 +192,10 @@ cpu3: cpu@3 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		l2: l2-cache {

-- 
2.25.1


