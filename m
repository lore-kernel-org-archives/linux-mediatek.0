Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211E6C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 11:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lq1LrDfU7PKrNV/gx4opdtLsxly2u+zqM3dodOcCbXk=; b=Sw2hBfom/rrqpQ
	QU+IejQKGI1cBXGCJyEvcEVv79untt1EG1QveXkeD6IMbsfM98wgLGEu2eKwJsSA8WYxEpmMeHPNA
	79gwiTZHemMCMT1QwA7BV0CJrZhdHSAiEL9AOYJMNdoyxuYFNdyIzo6QGjGy93VIBTscw/YIuCMhO
	y1hrF7Q0v8TpVI9G8yo+A4Y8yokEACv/tRoPfeLbNQzJgn5y3/GpJPk0bvVIBO3jcBBTxbtMwjAe0
	cMrwk+NtSLUFHO7trepgEUaWfmkZFc2YGnwdrXEt2r0ekd7IEVuJm8iFpj5LzzcGf24JBLlUxKZDR
	e8WKFcNb4ucTFw5lwFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGIk-001IHL-TQ; Thu, 09 Jun 2022 11:26:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGFx-001GP8-2j; Thu, 09 Jun 2022 11:23:18 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 242DF66017E1;
	Thu,  9 Jun 2022 12:23:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654773795;
	bh=u2SRqTpnqi7EaYL6hrMeHhetZF1DSjSsk+5BaLSaDYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SM57X/MrN9GrbDpuAEoY1Gm2pdZTmIAmmDs7NEphHYS3vh17uofGRJQO8E1I/u+Jh
	 a2VlTrIk6MXtUNLUK4060Vh84W9ztgzITm5HMifGnjBhVmCQWIzn06jbzzNNA/73TP
	 /5+SzKAP8bZe9PehjknKUuLbjJNy3M+GYYsDGRGHm9qfDEzi3ukICNI+9ldl5kymHK
	 lVIPCRL3BMvUSa6wMUAk8H4CC2u5waTxj/weCJ0bCb666baCLec6j5MhCmUhJjuT0o
	 3WoWmbe0twZ4ItHZ+ECimsI3rPG1XXgBMb8x26recK7yyeWdTe+41MDaB09gC2kXAw
	 kbX7ULA4KxZ+A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 08/10] arm64: dts: mediatek: mt6795: Add ARM CCI-400 node and assign to CPUs
Date: Thu,  9 Jun 2022 13:23:01 +0200
Message-Id: <20220609112303.117928-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
References: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_042317_275872_B745EFBB 
X-CRM114-Status: UNSURE (   8.64  )
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

This SoC features an ARM CCI-400 IP: add the required node and
assign the cci control ports to the CPU cores.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 44 ++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 217d99621558..db1f24b3b9a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -34,6 +34,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x000>;
+			cci-control-port = <&cci_control2>;
 			next-level-cache = <&l2_0>;
 		};
 
@@ -42,6 +43,7 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x001>;
+			cci-control-port = <&cci_control2>;
 			next-level-cache = <&l2_0>;
 		};
 
@@ -50,6 +52,7 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x002>;
+			cci-control-port = <&cci_control2>;
 			next-level-cache = <&l2_0>;
 		};
 
@@ -58,6 +61,7 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x003>;
+			cci-control-port = <&cci_control2>;
 			next-level-cache = <&l2_0>;
 		};
 
@@ -66,6 +70,7 @@ cpu4: cpu@100 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x100>;
+			cci-control-port = <&cci_control1>;
 			next-level-cache = <&l2_1>;
 		};
 
@@ -74,6 +79,7 @@ cpu5: cpu@101 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x101>;
+			cci-control-port = <&cci_control1>;
 			next-level-cache = <&l2_1>;
 		};
 
@@ -82,6 +88,7 @@ cpu6: cpu@102 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x102>;
+			cci-control-port = <&cci_control1>;
 			next-level-cache = <&l2_1>;
 		};
 
@@ -90,6 +97,7 @@ cpu7: cpu@103 {
 			compatible = "arm,cortex-a53";
 			enable-method = "psci";
 			reg = <0x103>;
+			cci-control-port = <&cci_control1>;
 			next-level-cache = <&l2_1>;
 		};
 
@@ -226,6 +234,42 @@ gic: interrupt-controller@10221000 {
 			      <0 0x10226000 0 0x2000>;
 		};
 
+		cci: cci@10390000 {
+			compatible = "arm,cci-400";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0 0x10390000 0 0x1000>;
+			ranges = <0 0 0x10390000 0x10000>;
+
+			cci_control0: slave-if@1000 {
+				compatible = "arm,cci-400-ctrl-if";
+				interface-type = "ace-lite";
+				reg = <0x1000 0x1000>;
+			};
+
+			cci_control1: slave-if@4000 {
+				compatible = "arm,cci-400-ctrl-if";
+				interface-type = "ace";
+				reg = <0x4000 0x1000>;
+			};
+
+			cci_control2: slave-if@5000 {
+				compatible = "arm,cci-400-ctrl-if";
+				interface-type = "ace";
+				reg = <0x5000 0x1000>;
+			};
+
+			pmu@9000 {
+				compatible = "arm,cci-400-pmu,r1";
+				reg = <0x9000 0x5000>;
+				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt6795-uart",
 				     "mediatek,mt6577-uart";
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
