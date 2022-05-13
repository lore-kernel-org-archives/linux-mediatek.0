Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D649C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsEY1rCCN/BibJ4jnzzezCsvCgOXXlPzWSujcPX5x1E=; b=VSVs8TG+3ePR4V
	E9yIoisJVvMdTw9uvZx73A8VUyOeGraC/y8uyfePCigHv0gUePTh95T1fL1IuOUNCfwfubmO8lA6Q
	t/d/Ay5BYs/OxR8uVIzKXp7cbWRYTcg22Ij/O3lHdbI/YVDlVa1l4nEjX04//2LShKCoyb5QCIFGN
	dzpL30NXhZ2ab6+fiVM2vsrFiczoT6tV+zvleVf9gLlluBysv0o7cxvfL9oB7tgDltMoW1nck/KAM
	Xq2f3zjA59POQuR/Qmw9J/rDI8kkXs/h5KhWuUiVkWPB5A1xpKMKHtIXK5Jgw6iShQqIriOOorCjl
	Gf0GSBz15tMipWFW0UMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYub-00H1HQ-SA; Fri, 13 May 2022 17:17:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYtt-00H0rv-7J; Fri, 13 May 2022 17:16:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4B9C61F463B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652462184;
 bh=6b5Fn00QFN3S8pk3LiXp3oowU6+YetKGNFXGTWU1NeQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S5rfzoUU1xMstwvoem9aQMqhyD6+D+l3IzMQ2gv3FhEHZWP3irW9F1hY5Z1u8Ge2b
 rhu8YwtB/1D5un8uqnNgU7CvrQRvgFRAXXc/LZnuBb3tZ5gEkRa8NRCvd502VTygfH
 T+b7LhLPTB60WIS2Kfwm62TMUPcYw9tY5p2C4B4seDTSnwiJ8Exy9NymG7b3HV/oM0
 eQ+UAANxW41CqUsPR8XZRzcw18NyQbGSP7MUpTwtUflaIMwYf/qvJX6gEhASghzPF9
 ZJyveqBm5OhnjoyeEYmq0/PwID7d9/u7Qm/dkJZFRV0Tg9cvCc1TLZmOiqTrnbRxWr
 dBldG/nYsyYWA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/7] arm64: dts: mediatek: mt6795: Add cpu-map and L2 cache
Date: Fri, 13 May 2022 19:16:12 +0200
Message-Id: <20220513171617.504430-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
References: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_101625_470412_7F672533 
X-CRM114-Status: UNSURE (   7.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This SoC is HMP and has two clusters with four Cortex-A53 cores each:
declare a cpu map and, while at it, also add the next-level-cache
properties.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 167f90bd991a..1456b9035336 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -34,6 +34,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x000>;
+			next-level-cache = <&l2_0>;
 		};
 
 		cpu1: cpu@1 {
@@ -41,6 +42,7 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x001>;
+			next-level-cache = <&l2_0>;
 		};
 
 		cpu2: cpu@2 {
@@ -48,6 +50,7 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x002>;
+			next-level-cache = <&l2_0>;
 		};
 
 		cpu3: cpu@3 {
@@ -55,6 +58,7 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x003>;
+			next-level-cache = <&l2_0>;
 		};
 
 		cpu4: cpu@100 {
@@ -62,6 +66,7 @@ cpu4: cpu@100 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x100>;
+			next-level-cache = <&l2_1>;
 		};
 
 		cpu5: cpu@101 {
@@ -69,6 +74,7 @@ cpu5: cpu@101 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x101>;
+			next-level-cache = <&l2_1>;
 		};
 
 		cpu6: cpu@102 {
@@ -76,6 +82,7 @@ cpu6: cpu@102 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x102>;
+			next-level-cache = <&l2_1>;
 		};
 
 		cpu7: cpu@103 {
@@ -83,6 +90,55 @@ cpu7: cpu@103 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x103>;
+			next-level-cache = <&l2_1>;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+
+				core1 {
+					cpu = <&cpu5>;
+				};
+
+				core2 {
+					cpu = <&cpu6>;
+				};
+
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		l2_0: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+		};
+
+		l2_1: l2-cache1 {
+			compatible = "cache";
+			cache-level = <2>;
 		};
 	};
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
