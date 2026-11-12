Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD20606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 18:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=05Rc9pDt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AluUuisZ3syjW16EuDxwZmf9uFaKZO91pqfZXb9+SsY=; b=05Rc9pDtFTuRqy
	0g3SuqGwgNQQJvMkNwgvE+56KHBsJAiq9nyUoCCdXMd0Xhf9AMoUwEx0wX/e8CT7TrbT03sX0palv
	9AIFDe4vcW8Nj9peKN+zjXoRmPLy7BKi0hArguw5bQqDrCsiZFkZgtqSvMRoyCkpB6c8XmDTqH4f/
	tb8M0kBVvBO4rGLHm9m4HyUL1BBtgyB7Ko2iUC9XFIBqlRAhEkkSa2Wo2MhB4LzT2CTtonGVbpSCX
	FHx1AhTnbAcOTj/jI/EKZUlSZJkWe5Zyhy2arcM4CGrnzY+zB4yeF+RdU0eF2L/bTL4TQwi9rjBVP
	SjrWDs+u15TnjucMUBsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZx2-0000000Atdf-07oc;
	Thu, 12 Nov 2026 18:55:12 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZwr-0000000AtWu-2jKk;
	Thu, 12 Nov 2026 18:55:05 +0000
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRZwk-002XXn-1d;
	Thu, 12 Nov 2026 19:54:54 +0100
From: John Crispin <john@phrozen.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v2 2/3] arm64: dts: airoha: add AN7589 SoC dtsi
Date: Thu, 12 Nov 2026 19:54:45 +0100
Message-Id: <20261112185446.1314808-3-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112185446.1314808-1-john@phrozen.org>
References: <20261112185446.1314808-1-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_105501_748274_D97763AB 
X-CRM114-Status: GOOD (  13.13  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the device tree for the Airoha AN7589 SoC. It describes the four
Cortex-A73 cores, which the firmware brings up over PSCI, the GICv3, the
architected timer and the console UART.

The UART runs from a fixed 1.8432 MHz clock, so the console works
before the SCU clock controller probes. The remaining blocks follow later.

Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in v2:
- Set the size of the GICV region to 0x2000. The virtual CPU interface
  has two 4 KiB pages, with GICV_DIR in the second page.
- Order the nodes and properties as dts-coding-style.rst describes.

 arch/arm64/boot/dts/airoha/an7589.dtsi | 134 +++++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/airoha/an7589.dtsi

diff --git a/arch/arm64/boot/dts/airoha/an7589.dtsi b/arch/arm64/boot/dts/airoha/an7589.dtsi
new file mode 100644
index 000000000000..70ced7c5a4fd
--- /dev/null
+++ b/arch/arm64/boot/dts/airoha/an7589.dtsi
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clk1843200: clock-1843200 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1843200>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
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
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a73";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a73";
+			reg = <0x1>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a73";
+			reg = <0x2>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a73";
+			reg = <0x3>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-size = <0x80000>;
+			cache-line-size = <64>;
+			cache-level = <2>;
+			cache-unified;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		atf@80000000 {
+			reg = <0x0 0x80000000 0x0 0x200000>;
+			no-map;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gic: interrupt-controller@c000000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x0c000000 0x0 0x40000>,
+			      <0x0 0x0c080000 0x0 0x200000>,
+			      <0x0 0x0c400000 0x0 0x2000>,
+			      <0x0 0x0c410000 0x0 0x1000>,
+			      <0x0 0x0c420000 0x0 0x2000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		uart1: serial@1fbf0000 {
+			compatible = "ns16550";
+			reg = <0x0 0x1fbf0000 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk1843200>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
-- 
2.34.1


