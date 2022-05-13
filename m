Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF0CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lq1LrDfU7PKrNV/gx4opdtLsxly2u+zqM3dodOcCbXk=; b=YmEuJR0j2iL43y
	3b2VdnpVoN9tngOsKpgBVLrQKIhjcQAGDurrQRvBNJmrturNNT46WNnsNxkzmHPzs9UY0NrKu2kdK
	S9JX8RZ5NbiAvkHLutuXhETujCBe0KAK3gTVT4qonFYw/pmoU9NiOi+b8x2H36QvBly0O4xwGO1Z1
	DXd1PdVVAPF7px7l0jE74f2mZhd+w3x2/IzUsX/i5CxvRxlRyWiac0kdlsJPCJUjdUFL2t7VFrIjD
	Jk3xFJzl47/K6SkbCTLc64MtNmv1wtqyRscyjQ4sZd+D9i/rNdbwpzVtPGhykbY8JJuOWNw1sQ88y
	We3rANrOCojryhQhF8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYwM-00H2Ru-Nw; Fri, 13 May 2022 17:18:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYu9-00H0yf-0J; Fri, 13 May 2022 17:16:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 275411F463B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652462198;
 bh=u2SRqTpnqi7EaYL6hrMeHhetZF1DSjSsk+5BaLSaDYU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZeWZhdG9YtV3hpkjxhdOPtmSe3qvvFh+9VjDugbUZDzCglh5Qperba9fLxK7mMFZW
 A/fCGOvGjD08wpU9biJQVkR8gLlVlZB6kAcRKQ+9InH+sShRXLKiPWJmiB8kLVD/SS
 rGVz4MqGzv8s1yiQQINsRHigYZ3BcYkP7QQvt//GCRcg+blgNV2BPhCeeZUiEF8S7N
 nXEwS3yWdbS42g1dHcHU9gOxhcqePwK0loK1h90mkVj3HzG/qpYXYmfhOfQWGk12ou
 1to3/yU4wjy+BqpkH70qwqhBWJ9ckOz/vbkpkB9stSxMydRV7JFWYNwGd12/qDDyVo
 rLmJ4ye5ggRVw==
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
Subject: [PATCH 7/7] arm64: dts: mediatek: mt6795: Add ARM CCI-400 node and
 assign to CPUs
Date: Fri, 13 May 2022 19:16:17 +0200
Message-Id: <20220513171617.504430-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
References: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_101641_256247_2E4AB7B7 
X-CRM114-Status: UNSURE (   8.39  )
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
