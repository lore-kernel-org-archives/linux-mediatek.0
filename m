Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B37C77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 18:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b406wWUr0nFmh15mz5WJmjRL4+nEkf6kEIPjv0eMqdE=; b=4o2MZKMZ0szkRMhFHe7OMf22Zy
	Wp4zXietN3Q5l5geoh7uW8g1kyUgGtuD+Vf28Z7YSWR2hCHLBTNp14rQZiGZVKYJOVHCIMm5FGt5v
	ESrCUY5oVlrCtXNr95HMey1L01f8Cd4RCbQEirzRo7ee0R0h/6UTHBrLxVxriHz+eYuz/5NPuyNPG
	zH9WJPBHVjYTEPGzDdRG74M9v9ZUQVNNd9RKDcxTdsDBUdFhlxFYJfQfocOBBI1zRxzd56bBVlyOu
	Send1GDaJsicsM+AIXbHBfRTwGj9myRUO4A9SazOu1qaz21yLhKhUhBDhgat72xjQBIzD0+Fb53nh
	DhqnbpQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q59cZ-007eqV-0y;
	Fri, 02 Jun 2023 18:35:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q59cW-007epO-07;
	Fri, 02 Jun 2023 18:35:29 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8980666066EC;
	Fri,  2 Jun 2023 19:35:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685730924;
	bh=jK4RBgnhLajzb2VVh6RYcKZcAuPJaGK5uoOa+eFFoBY=;
	h=From:To:Cc:Subject:Date:From;
	b=Wjv7v5HBHtFx5on0MWE70XzJ0RLica7WNZnenTd22QUX1ETH8ac66iaJKQhXmWWyU
	 yFapVBMRh7+JKmBgNJYxBTEMy5w8KNY4BshEJ9zL9E4qAkgotqYGtIFpOLYpee9gXl
	 N7epNw17P/NF2aTIFBj8SQ5wkOqocT/Fl1zcpFn2u9PD+aAi3Z35yM1lK6FRyCaRcz
	 36gL6CYlxaaLhJ3hGg4iMoqrgLr2MjvHDIcPBCcSQP1zjz27kSmtFgC7gCH4ztc/nq
	 OCf3PH8xC/2uq3Lisks9voOIyZCWTq6xxKipqkiKZx2tMkKQ8Vvhhd9uYVHM8yfJ1o
	 V9Hf5JGs2r9yA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Seiya Wang <seiya.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8192: Fix CPUs capacity-dmips-mhz
Date: Fri,  2 Jun 2023 14:35:15 -0400
Message-Id: <20230602183515.3778780-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_113528_258122_E9758017 
X-CRM114-Status: GOOD (  10.78  )
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
second (Cortex-A76) cluster at a maximum of 2200MHz.

In order to calculate the right capacity-dmips-mhz, the following
test was performed:
1. CPUFREQ governor was set to 'performance' on both clusters
2. Ran dhrystone with 500000000 iterations for 10 times on each cluster
3. Calculated the mean result for each cluster
4. Calculated DMIPS/MHz: dmips_mhz = dmips_per_second / cpu_mhz
5. Scaled results to 1024:
   result_c0 = dmips_mhz_c0 / dmips_mhz_c1 * 1024

The mean results for this SoC are:
Cluster 0 (LITTLE): 12016411 Dhry/s
Cluster 1 (BIG): 31702034 Dhry/s

The calculated scaled results are:
Cluster 0: 426.953226899238 (rounded to 427)
Cluster 1: 1024

Fixes: 48489980e27e ("arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 63247c832f42..db17f67bb801 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -71,7 +71,7 @@ cpu0: cpu@0 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			performance-domains = <&performance 0>;
-			capacity-dmips-mhz = <530>;
+			capacity-dmips-mhz = <427>;
 		};
 
 		cpu1: cpu@100 {
@@ -89,7 +89,7 @@ cpu1: cpu@100 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			performance-domains = <&performance 0>;
-			capacity-dmips-mhz = <530>;
+			capacity-dmips-mhz = <427>;
 		};
 
 		cpu2: cpu@200 {
@@ -107,7 +107,7 @@ cpu2: cpu@200 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			performance-domains = <&performance 0>;
-			capacity-dmips-mhz = <530>;
+			capacity-dmips-mhz = <427>;
 		};
 
 		cpu3: cpu@300 {
@@ -125,7 +125,7 @@ cpu3: cpu@300 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			performance-domains = <&performance 0>;
-			capacity-dmips-mhz = <530>;
+			capacity-dmips-mhz = <427>;
 		};
 
 		cpu4: cpu@400 {
-- 
2.40.1


