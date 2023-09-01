Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D46CA0FE1
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 07:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kIjOu9XgiejjBGgxALVhj8CipJIkLUKJc8BINq5SLgk=; b=BU6S2j/sYd5De8
	XrWx7OlOWqfMsJFcJY4pK0A8LjOZD/wW3ogmt1i3ynQWGaG7K/myIpFWmBzDWC/cg1QAYaXiY35zU
	S9HC5SMS0lp3xzaKmWuoYAsJtnS22tCLsNkLEP1aqJNHqP4s4/CWuRqX7L6LA1SioIJbKkKtb5Rv2
	rHybZ3n3Hc8+3Z//0mTqBFlDeGyc4mS0zwBCh1OwZR1Te18Jljwm9Dq4ZekL4DJvLe4339huh6k68
	TtvWCp67IIqdVictzcf9QiAgVOj2m8PG1U7ZccXClrYiS8Jhrg1RDrOIv2yK8ajnlTU6Pj7F41bpm
	HyZGzHyKflh1cMzsgcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbyZJ-00GbTZ-1C;
	Fri, 01 Sep 2023 07:27:49 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbyZE-00GbSS-2u;
	Fri, 01 Sep 2023 07:27:46 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id B59283FF3B;
	Fri,  1 Sep 2023 07:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1693553261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kIjOu9XgiejjBGgxALVhj8CipJIkLUKJc8BINq5SLgk=;
	b=jdy1+n1CvunsgfhGiX0wrC4o89x841J8EAsmKNy1Y23y8Jyp/C1sObUPbCpYyQRPndw5Ee
	zXrtEtfjDE61ibn7N5hEJBwhVGkViQJC23wmLzX4dvizlN26smsxuRzdifyhEXkkZA4toq
	B/fwRXHI0RHI1/Fxa0BP0fNhQIptlYg=
Received: from frank-G5.. (fttx-pool-80.245.79.3.bambit.de [80.245.79.3])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 4B95D3601E7;
	Fri,  1 Sep 2023 07:27:37 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v1] arm64: dts: mt7986: add overlay for SATA power socket on BPI-R3
Date: Fri,  1 Sep 2023 09:27:30 +0200
Message-Id: <20230901072730.13571-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 17c63c84-d582-4f38-896e-fd3131e7c05c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_002745_099400_E871F454 
X-CRM114-Status: GOOD (  13.77  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Bananapi R3 has a Power socket entended for using external SATA drives.
This Socket is off by default but can be switched with gpio 8.

Add an overlay to activate it.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mt7986a-bananapi-bpi-r3-sata.dtso         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index c99c3372a4b5..822d3e36d3df 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sata.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso
new file mode 100644
index 000000000000..6ab06813412a
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Author: Frank Wunderlich <frank-w@public-files.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
+
+	fragment@0 {
+		target-path = "/";
+		__overlay__ {
+			reg_sata12v: regulator-sata12v {
+				compatible = "regulator-fixed";
+				regulator-name = "sata12v";
+				regulator-min-microvolt = <12000000>;
+				regulator-max-microvolt = <12000000>;
+				gpio = <&pio 8 GPIO_ACTIVE_HIGH>;
+				enable-active-high;
+				regulator-always-on;
+			};
+
+			reg_sata5v: regulator-sata5v {
+				compatible = "regulator-fixed";
+				regulator-name = "sata5v";
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5000000>;
+				regulator-always-on;
+				vin-supply = <&reg_sata12v>;
+			};
+		};
+	};
+};
+
-- 
2.34.1


