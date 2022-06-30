Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DC4CCA481
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44QyxIdLgmzFlasEkSUrBitKr2n+JMbv4eUmO9P8oH8=; b=qukI5MLW0TReFKWrBxTgEbDPOH
	Mep15zm5ftHfrcSwkR7ncH1PbriuVDbDE7QXdTFck/1QIQmpBC3ClSJO3m9rkXXzrIfTg1pSB2NQG
	rO7VynoS27rAR0pjRH/Yn5ttkGDBsKfkfP5N9jSFVXDg46c3zns5K+ML1cGonoiqvDIr0Gfv9UuCO
	uorFy8PKVAh/BvijMdS28X78uNm23h0RvMdJ80KL3ZO6cyl/a5tEzEp4T1rJvuo5I6jj+FIBEHIB3
	kKSTIkw6G8cs92g+VahUmI5QWKOJ0VlJvT5l+A9NOK6Cd7z0QDFWt7gSuPwRMjTMzmcIjKiehGZT0
	IL/LqIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wB3-000IlR-Of; Thu, 30 Jun 2022 15:33:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wAZ-000IVM-OA; Thu, 30 Jun 2022 15:33:29 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 550ED6601967;
	Thu, 30 Jun 2022 16:33:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656603206;
	bh=nOhUYm0IpD/r1TykJ1rAO+e9Iu31jMTfdhwk8vihElo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dFfhWxuSBWqkSfXsPVunMYMQkVJY8BXA0MhFArUZ46NJ7p62OdDljvSVEXy2QeOYf
	 l+8GkP9/Us8ROdHej63ydggHcBo+xnHXEZGtThGGuaxpbUawObBYS7QA3vHUnwNXfB
	 HRFfJvfz+PuIMlhZwyB3j9gcix+OdnWZrAzMI24cSRGbCS5dLLrgYzfAFFl+wfsekW
	 ymEcGd2Qm9kay97ztD5UYXbKYqAhol4ZnZqhu31KGrpG014/wbAflZbtQxm2e9L/vZ
	 Kk4Dtb6F9ZtTIkMPKZsIh5JKS4Xdl+Gfz5q2OVlNd05R5nVq3mA4OtTd1PVAHw3jUR
	 M04zt3f5L4f+g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	gtk3@inbox.ru,
	luca@z3ntu.xyz,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH 02/11] arm64: dts: mediatek: Introduce MT8195 Cherry platform's Tomato
Date: Thu, 30 Jun 2022 17:33:07 +0200
Message-Id: <20220630153316.308767-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_083328_094474_A6C30896 
X-CRM114-Status: GOOD (  13.85  )
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

Introduce the MT8195 Cherry Chromebook platform, including three
revisions of Cherry Tomato boards.

This basic configuration allows to boot Linux on all board revisions
and get a serial console from a ramdisk.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  3 +++
 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  | 11 ++++++++
 .../dts/mediatek/mt8195-cherry-tomato-r2.dts  | 11 ++++++++
 .../dts/mediatek/mt8195-cherry-tomato-r3.dts  | 12 +++++++++
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 26 +++++++++++++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 50a2c58c5f56..0b12035a4f08 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -39,6 +39,9 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r1.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r2.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r3.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
new file mode 100644
index 000000000000..17e9e4d6f6ab
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ */
+/dts-v1/;
+#include "mt8195-cherry.dtsi"
+
+/ {
+	model = "MediaTek Tomato (rev1) board";
+	compatible = "google,tomato-rev1", "google,tomato", "mediatek,mt8195";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
new file mode 100644
index 000000000000..b915fba311e9
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ */
+/dts-v1/;
+#include "mt8195-cherry.dtsi"
+
+/ {
+	model = "MediaTek Tomato (rev2) board";
+	compatible = "google,tomato-rev2", "google,tomato", "mediatek,mt8195";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
new file mode 100644
index 000000000000..2ead9eca2ec9
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ */
+/dts-v1/;
+#include "mt8195-cherry.dtsi"
+
+/ {
+	model = "MediaTek Tomato (rev3 - 4) board";
+	compatible = "google,tomato-rev4", "google,tomato-rev3",
+		     "google,tomato", "mediatek,mt8195";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
new file mode 100644
index 000000000000..7406d7bbf725
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "mt8195.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x80000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.35.1


