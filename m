Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89895C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 19:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Uac+pNoJWvk1YG3xnBZ9E1dKIbudwUnPsApI3M6W8c=; b=JysXbbsEl7Wgy/
	o3XGsDfG5ttQXoQsTBLHLPHpGdC0aTZMk2SBGyt15JQ+PksM/l3qkmcjqwDfZdtsyMK7J3sdHdkCF
	M09daPlH1txnbbyJIgxn1eX3TaDQSM0/1/Xz7QbDOhVStL+ej5Es7wVHS91Dfq+dZw1Wu7mx+kV7+
	dlF6mrM3m5++25SSF2Z9FTFHfq9nb7q0Gx3KEQqpv46RDebqyWsbzIbYjGMDQTlMclM5t0xIQMFGF
	9SHosRdGxc9jfWlZjfL3wgbGzCDvRuONc3w9KfhHTmQQY/RyEMIYol1lwMgW5NcEm4jYuFOKQjJcG
	qYKqywbHP4j1xuZgNz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6sq-007WPw-Ek; Fri, 18 Nov 2022 19:18:40 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6cX-007OjE-2r; Fri, 18 Nov 2022 19:01:51 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 0F02D408F1;
	Fri, 18 Nov 2022 19:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1668798100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Uac+pNoJWvk1YG3xnBZ9E1dKIbudwUnPsApI3M6W8c=;
	b=rEfhhMJ3SboHRT66Ds97LMw4Prt6m2LdIp8j/pJq0RJi/cRmOuZhtWo8Gg2AWjHhtqh3nj
	O6hRq/0NzC8aDMEb9xgx2gfhffakhtDe5u3Agq79EmH818/AULPZ47ZZx3yGXASCXzr5m7
	DLqNPIVx/MLCDOs4QgZWRTWMy1kGaXM=
Received: from frank-G5.. (fttx-pool-80.245.77.125.bambit.de [80.245.77.125])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id B670D12271E;
	Fri, 18 Nov 2022 19:01:39 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v6 11/11] arm64: dts: mt7986: add BPI-R3 nand/nor overlays
Date: Fri, 18 Nov 2022 20:01:26 +0100
Message-Id: <20221118190126.100895-12-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118190126.100895-1-linux@fw-web.de>
References: <20221118190126.100895-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_110149_528319_CAC0FE9B 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add devicetree overlays for using nand and nor on BPI-R3.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
maybe rename to dtso?

"kbuild: Allow DTB overlays to built from .dtso named source files"
https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=363547d2191cbc32ca954ba75d72908712398ff2

more comments about the dt overlay-support:

https://patchwork.kernel.org/comment/25092116/
https://patchwork.kernel.org/comment/25085681/
---
v4:
- drop compile-comment from overlays
- add author-information to dt-overlays
---
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt7986a-bananapi-bpi-r3-nand.dts | 55 +++++++++++++++
 .../mediatek/mt7986a-bananapi-bpi-r3-nor.dts  | 69 +++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index e8902f2cc58f..d42208c4090d 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts
new file mode 100644
index 000000000000..15ee8c568f3c
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Authors: Daniel Golle <daniel@makrotopia.org>
+ *          Frank Wunderlich <frank-w@public-files.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
+
+	fragment@0 {
+		target-path = "/soc/spi@1100a000";
+		__overlay__ {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			spi_nand: spi_nand@0 {
+				compatible = "spi-nand";
+				reg = <0>;
+				spi-max-frequency = <10000000>;
+				spi-tx-buswidth = <4>;
+				spi-rx-buswidth = <4>;
+
+				partitions {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					partition@0 {
+						label = "bl2";
+						reg = <0x0 0x80000>;
+						read-only;
+					};
+
+					partition@80000 {
+						label = "reserved";
+						reg = <0x80000 0x300000>;
+					};
+
+					partition@380000 {
+						label = "fip";
+						reg = <0x380000 0x200000>;
+						read-only;
+					};
+
+					partition@580000 {
+						label = "ubi";
+						reg = <0x580000 0x7a80000>;
+					};
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts
new file mode 100644
index 000000000000..f18643a9089c
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Authors: Daniel Golle <daniel@makrotopia.org>
+ *          Frank Wunderlich <frank-w@public-files.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
+
+	fragment@0 {
+		target-path = "/soc/spi@1100a000";
+		__overlay__ {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			flash@0 {
+				compatible = "jedec,spi-nor";
+				reg = <0>;
+				spi-max-frequency = <10000000>;
+
+				partitions {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					partition@0 {
+						label = "bl2";
+						reg = <0x0 0x20000>;
+						read-only;
+					};
+
+					partition@20000 {
+						label = "reserved";
+						reg = <0x20000 0x20000>;
+					};
+
+					partition@40000 {
+						label = "u-boot-env";
+						reg = <0x40000 0x40000>;
+					};
+
+					partition@80000 {
+						label = "reserved2";
+						reg = <0x80000 0x80000>;
+					};
+
+					partition@100000 {
+						label = "fip";
+						reg = <0x100000 0x80000>;
+						read-only;
+					};
+
+					partition@180000 {
+						label = "recovery";
+						reg = <0x180000 0xa80000>;
+					};
+
+					partition@c00000 {
+						label = "fit";
+						reg = <0xc00000 0x1400000>;
+						compatible = "denx,fit";
+					};
+				};
+			};
+		};
+	};
+};
-- 
2.34.1


