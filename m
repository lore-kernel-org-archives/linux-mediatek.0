Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB09C4708C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 11:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+cs7EVShYZRFsgchwQW+s7LcvPR5pBLmkfaRdjbVBU=; b=sWTadgmkAuhgS7WakyX8WuVMXB
	DFSbgahn4gxRiX/yNJBevKTRWENlMi25BOK2X++CmNBEG5urDFMfg7k4Y4ZkDD35L5hpOot9V7nGy
	GGfwS3+Gbpej6P62tM81XLFopZQP70AgjpUFxSIxEbq35tpC+n/vHxKLoRLv8+1Ljskyr0R86slB6
	J6p6pbIlS+SYyhNDuE6sXdfmepZ+PFOv2DW24yZkwU6+u5KtKDm+U2J1N9ByjrFiaJOFI/L4NbBFG
	I8pXvj31hzisWU4rQKcSyM2LPta8QWbIhuI0P8L1Gfy2a8texax3BblDx1HJSNmIrydtuxXL5a8/x
	ALtp3RHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2W4z-008Pny-UY; Tue, 06 Dec 2022 11:25:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2W37-008O4E-Mz; Tue, 06 Dec 2022 11:23:47 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 542056602B80;
	Tue,  6 Dec 2022 11:23:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670325819;
	bh=h6nkSvmYgmO1NUiTtUIOSdVJ5+xRcYgOqZpZRIpVBIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QsJHfqCoL4aa4oNImrCnUmK/JLhYSrigl9mN+TT4L5JgUPQHpzlP2EgvbQYxsqzbJ
	 TOC+zgn4HqCJqttQYbJ11zYuh7KsmmPy7R/Mu3pQDuyDPo21XWyKIDZ13MntoIRR19
	 R/Ex9pmZiOFE2hvmAuepWR4p95uCLbiIRuY6tjGc1mTL/0QtvZUXtrzy0Yvd1mdIK4
	 gqJOsZabX5lOj5LeWfrc/+dqNN3N/kJnUBXIlzCkUEEOTijQZCKJjgA/PRbW3n/Lm0
	 I/LXCul8tlaR1WObeBXbgonK0iS8Zl+YJUEIHyOjmeQA9Hz4ilVUhu0PekNfp45mu1
	 vgNnjLd7cA4bQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	nfraprado@collabora.com,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 5/5] arm64: dts: mt6795: Add complete CPU caches information
Date: Tue,  6 Dec 2022 12:23:30 +0100
Message-Id: <20221206112330.78431-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206112330.78431-1-angelogioacchino.delregno@collabora.com>
References: <20221206112330.78431-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_032345_939181_1ACADCDD 
X-CRM114-Status: UNSURE (   6.00  )
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

This SoC's AP subsystem has 8x Cortex-A53 CPUs, specifically,
four CPUs per cluster, with two CPU clusters.

Each CPU has:
 - A 32KB I-cache, 2-way set associative;
 - A 32KB D-cache, 4-way set associative.

Each cluster has a unified 1MB L2 cache, 16-way set associative.

With that in mind, add the appropriate properties needed to specify the
caches information for this SoC, which will now be correctly exported
to sysfs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index bb575837e4ce..b3fc76d837a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -40,6 +40,12 @@ cpu1: cpu@1 {
 			enable-method = "psci";
 			reg = <0x001>;
 			cci-control-port = <&cci_control2>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 		};
 
@@ -49,6 +55,12 @@ cpu2: cpu@2 {
 			enable-method = "psci";
 			reg = <0x002>;
 			cci-control-port = <&cci_control2>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 		};
 
@@ -58,6 +70,12 @@ cpu3: cpu@3 {
 			enable-method = "psci";
 			reg = <0x003>;
 			cci-control-port = <&cci_control2>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 		};
 
@@ -67,6 +85,12 @@ cpu4: cpu@100 {
 			enable-method = "psci";
 			reg = <0x100>;
 			cci-control-port = <&cci_control1>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_1>;
 		};
 
@@ -76,6 +100,12 @@ cpu5: cpu@101 {
 			enable-method = "psci";
 			reg = <0x101>;
 			cci-control-port = <&cci_control1>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_1>;
 		};
 
@@ -85,6 +115,12 @@ cpu6: cpu@102 {
 			enable-method = "psci";
 			reg = <0x102>;
 			cci-control-port = <&cci_control1>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_1>;
 		};
 
@@ -94,6 +130,12 @@ cpu7: cpu@103 {
 			enable-method = "psci";
 			reg = <0x103>;
 			cci-control-port = <&cci_control1>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_1>;
 		};
 
@@ -138,11 +180,19 @@ core3 {
 		l2_0: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-unified;
 		};
 
 		l2_1: l2-cache1 {
 			compatible = "cache";
 			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-unified;
 		};
 	};
 
-- 
2.38.1


