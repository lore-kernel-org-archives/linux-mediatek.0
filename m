Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3717FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EOymTzDeMT8KnkkH2CbCN0RSUPtqrInGVZj1LUNm0dc=; b=N4FW+vSusQFzP4i25DfeNvHDcJ
	yLrGooj4nJGNLdFpEAHG/Rb1Bq8OX6ZyJcvhlQC3tTrn7TSZ+AmELmO+6WJNMRuW+iQvT8yMOdLta
	hLT4lVEPnkB2U0MW0aN8Fb1UEY+nW0bZGvjEAo25+BVE2/xsWIlYJAvPOLIkWr/heJi6gjXETi4Yg
	yNa7779lGcqdgto+1eGSd5Qd69/hFdO+9FTPNbv3lb8LjFtG9J4RjZiabI1OJfiTcPaWxzYmBT7ht
	z8jL4djh7kPR3n5dx44TR3AuvIfDcFX14QyBXJMGMUSBKPTrHR+zS69ItnHORFNKddkyx+GiNjjGA
	3RBqEzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og0nK-00DMlQ-4C; Wed, 05 Oct 2022 09:34:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og0n9-00DMgU-4u; Wed, 05 Oct 2022 09:34:16 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 98BBD66022E4;
	Wed,  5 Oct 2022 10:34:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664962449;
	bh=pRg0SkW5d5gHVASYVoiFL+t/7J8p0XFnGA9gDu1F/Lg=;
	h=From:To:Cc:Subject:Date:From;
	b=WJEbR58ZP3OCHhAFbRm6aXrr7djjEr+MKGpCNj5rEbflgnRDXMTgxtzqyoQXTEXyL
	 XKRXZx9b04xz9104Pa9sLLxBp3oSEjV9K8GzBglt/aLjU2+FGMGx9I5ZJiHf1IgkSN
	 oteWdNodt8bW7wZjkX9UDFRrceYaf+faRkS57UB70fq6TmfrZSR4wgtCPQt/Hzf6hE
	 ki4yp+4lU7doa58WMzS1TPp1ir+TzZATOmoyGU5QEIgUOrQuTIA00r/z9C9YU/G16b
	 M5VdOnISiqaK4TLS4Bx8Pjx9Mf4yPPJTEF5C81V/c3IBjsuIBL4wsFYQqI+Wqwc609
	 oDEle3kRlmX+Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	tinghan.shen@mediatek.com,
	seiya.wang@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8195: Fix CPUs capacity-dmips-mhz
Date: Wed,  5 Oct 2022 11:34:03 +0200
Message-Id: <20221005093404.33102-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_023415_339243_ED88F4CA 
X-CRM114-Status: UNSURE (   9.91  )
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

The capacity-dmips-mhz parameter was miscalculated: this SoC runs
the first (Cortex-A55) cluster at a maximum of 2000MHz and the
second (Cortex-A78) cluster at a maximum of 3000MHz.

In order to calculate the right capacity-dmips-mhz, the following
test was performed:
1. CPUFREQ governor was set to 'performance' on both clusters
2. Ran dhrystone with 500000000 iterations for 10 times on each cluster
3. Calculate the mean result for each cluster
4. Calculate DMIPS/MHz: dmips_mhz = dmips_per_second / cpu_mhz
5. Scale results to 1024:
   result_c0 = (dmips_mhz_c0 - min_dmips_mhz(c0, c1)) /
               (max_dmips_mhz(c0, c1) - min_dmips_mhz(c0, c1)) * 1024

The mean results for this SoC are:
Cluster 0 (LITTLE): 11990400 Dhry/s
Cluster 1 (BIG): 59809036 Dhry/s

The calculated scaled results are:
Cluster 0: 307,934312801831 (rounded to 308)
Cluster 1: 1024

Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 905d1a90b406..0b85b5874a4f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -36,7 +36,7 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
-			capacity-dmips-mhz = <578>;
+			capacity-dmips-mhz = <308>;
 			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
@@ -49,7 +49,7 @@ cpu1: cpu@100 {
 			enable-method = "psci";
 			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
-			capacity-dmips-mhz = <578>;
+			capacity-dmips-mhz = <308>;
 			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
@@ -62,7 +62,7 @@ cpu2: cpu@200 {
 			enable-method = "psci";
 			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
-			capacity-dmips-mhz = <578>;
+			capacity-dmips-mhz = <308>;
 			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
@@ -75,7 +75,7 @@ cpu3: cpu@300 {
 			enable-method = "psci";
 			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
-			capacity-dmips-mhz = <578>;
+			capacity-dmips-mhz = <308>;
 			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
-- 
2.37.2


