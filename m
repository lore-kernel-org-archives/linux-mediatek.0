Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F15EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 02:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eg7ULP2yOFlXcGh70ikESc8dnbS10xi+rzil4Da2hjo=; b=HSnZmKLweSwsk9EhiF/d//ow1M
	+L8fgMiZjYxBAphCrv6bwZKVKCOCLhv798vGIsdZhazreRGMMuVLCwHo+yO7zeBzRnkM7s8K6Tmbl
	hI6OMKCR1hp4Vd+RGE5dC95jqoLKMuzVUqlZ2cu1q2ukRj8kXpX03egbf3ATgQZLdMSZGRuJqNPFS
	oNhcNOBerurTBzQFiKY07trVYsUjJHvRLQ2wbMsmOzsL3saleLOhsgfMRrqggn3r9X/7n3npez+IY
	Pum8mKA+//ITH3bawOpFHJHEnESbpYko8m7OuL7es+4wM0sVTzIlOB3QC2T16yMxT2X6EtYs9f6cz
	rdSMCDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTvm8-002k9h-1s; Mon, 20 Feb 2023 02:19:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTvm5-002k8B-NU; Mon, 20 Feb 2023 02:19:31 +0000
X-UUID: fe3e923ab0c411eda08d4d6090ec5a5c-20230219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=eg7ULP2yOFlXcGh70ikESc8dnbS10xi+rzil4Da2hjo=;
	b=HG6XHcfhCa/Vd45eedD0pqbI+SmS9mVlxRUyAYLCU/x6F9/zlzSmXcK/qKCGlq+CmilI484yypDKnElgKc/yVi8oYcgLdsnhOeC1nLylzRVGPHk4tnEJBzymLwRZsHOWzNZWxrJ/oolgvyL1mhoFmwxdPwkUNBIE0mp/OpA3UN8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:476107b7-64b3-426b-989b-7e5f5b8b4cd4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:885ddb2,CLOUDID:296cefb0-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: fe3e923ab0c411eda08d4d6090ec5a5c-20230219
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 450778787; Sun, 19 Feb 2023 19:19:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 20 Feb 2023 10:19:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 20 Feb 2023 10:19:20 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH] arm64: dts: mediatek: Add cpufreq nodes for MT8192
Date: Mon, 20 Feb 2023 10:19:15 +0800
Message-ID: <20230220021915.9473-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_181929_819426_4D1F3081 
X-CRM114-Status: UNSURE (   9.79  )
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

Add the cpufreq nodes for MT8192 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
Fix a address warning on dtbs_check
https://patchwork.kernel.org/project/linux-mediatek/patch/1609223471-24325-1-git-send-email-andrew-sh.cheng@mediatek.com/
[Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
---
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 424fc89cc6f7..181ec2db7a69 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -55,6 +55,7 @@ cpu0: cpu@0 {
 			clock-frequency = <1701000000>;
 			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
 			next-level-cache = <&l2_0>;
+			performance-domains = <&performance 1>;
 			capacity-dmips-mhz = <530>;
 		};
 
@@ -66,6 +67,7 @@ cpu1: cpu@100 {
 			clock-frequency = <1701000000>;
 			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
 			next-level-cache = <&l2_0>;
+			performance-domains = <&performance 1>;
 			capacity-dmips-mhz = <530>;
 		};
 
@@ -77,6 +79,7 @@ cpu2: cpu@200 {
 			clock-frequency = <1701000000>;
 			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
 			next-level-cache = <&l2_0>;
+			performance-domains = <&performance 1>;
 			capacity-dmips-mhz = <530>;
 		};
 
@@ -88,6 +91,7 @@ cpu3: cpu@300 {
 			clock-frequency = <1701000000>;
 			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
 			next-level-cache = <&l2_0>;
+			performance-domains = <&performance 1>;
 			capacity-dmips-mhz = <530>;
 		};
 
@@ -99,6 +103,7 @@ cpu4: cpu@400 {
 			clock-frequency = <2171000000>;
 			cpu-idle-states = <&cpu_sleep_b &cluster_sleep_b>;
 			next-level-cache = <&l2_1>;
+			performance-domains = <&performance 1>;
 			capacity-dmips-mhz = <1024>;
 		};
 
@@ -110,6 +115,7 @@ cpu5: cpu@500 {
 			clock-frequency = <2171000000>;
 			cpu-idle-states = <&cpu_sleep_b &cluster_sleep_b>;
 			next-level-cache = <&l2_1>;
+			performance-domains = <&performance 1>;
 			capacity-dmips-mhz = <1024>;
 		};
 
@@ -121,6 +127,7 @@ cpu6: cpu@600 {
 			clock-frequency = <2171000000>;
 			cpu-idle-states = <&cpu_sleep_b &cluster_sleep_b>;
 			next-level-cache = <&l2_1>;
+			performance-domains = <&performance 1>;
 			capacity-dmips-mhz = <1024>;
 		};
 
@@ -132,6 +139,7 @@ cpu7: cpu@700 {
 			clock-frequency = <2171000000>;
 			cpu-idle-states = <&cpu_sleep_b &cluster_sleep_b>;
 			next-level-cache = <&l2_1>;
+			performance-domains = <&performance 1>;
 			capacity-dmips-mhz = <1024>;
 		};
 
@@ -254,6 +262,12 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 
+		performance: performance-controller@11bc10 {
+			compatible = "mediatek,cpufreq-hw";
+			reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
+			#performance-domain-cells = <1>;
+		};
+
 		gic: interrupt-controller@c000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <4>;
-- 
2.34.1


