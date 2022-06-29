Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CF3CCA480
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlBAJ6umAF1V61Q4mybHN1X5a2Jj6QmSFTKvXtnjPKM=; b=GQ2asec1Igs/OJmbo0b75hEEAp
	0CZHU3kGRjaxNDIM3IBN0TiOW5YUgPhsl3/SIIEzbQs6jBV4APuHuFOZ8id7twudgErFRkeBypnq7
	Aln783RqRPBsz5FVMpjiEyR9dUs1077Cp5lEIV7utu+EvBK1TR8K6RZ2jr//5QdrA/A6f6st2b83g
	emmi5BfJHks7vvUvafEiQmvLiWXhS+XpKEBVLkOfNw5Us05UhgoSpkfurdQbekLH8Y3q7YnnA9yyG
	oesoIOAUFCma4+D7U0jVdSUpxaOYaQ7bUEamG94DSLpswaZplTOwiCT3PZFS2U1EYW4sZ6D+otoHH
	8YIx99/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a96-00CphL-VP; Wed, 29 Jun 2022 16:02:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a6s-00CoPm-LH; Wed, 29 Jun 2022 16:00:12 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BDAA86601948;
	Wed, 29 Jun 2022 17:00:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518407;
	bh=7FWouNZ6jxRvkXEGGYykyUzgA0FsaeEdzAQhsdSPeQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ICPLGRrsFmfJiv67vOjuykNSlEi/3AMFS5RWsC1OOpYtw5QGTrSW6RMtl07jl0+Ny
	 ahlJtwU78hOLHfseudm9WRWJarMXzz+xoQ52DFGlxHSPhefFCXRiZM+5Oyv0FxqCiY
	 dzTMvH/lGpjztpUkVU03Ef+RhDvPOArVPxvuGXdCp6x20bE8kEs8YKqd9cPpoHXQ9H
	 d2zTveIpfcm13EvYLih80XYnY3Ejavsl/dzxGpmT/FGZCxJkwVWaPHhMGrA2OSIgOX
	 swfCcrbNCR5pGRvYhUuEht12JsLegGNZ5Lqol1uF/HNjyp5K2q62wxOSpUopBHej78
	 oKReKgY9SYaqw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 03/19] arm64: dts: mediatek: Introduce MT8192-based Asurada board family
Date: Wed, 29 Jun 2022 11:59:40 -0400
Message-Id: <20220629155956.1138955-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090010_901329_07E1F8C4 
X-CRM114-Status: GOOD (  15.32  )
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

Introduce the MT8192 Asurada Chromebook platform, including the Asurada
Spherion and Asurada Hayato boards.

This is enough configuration to get serial output working on Spherion
and Hayato.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

---

(no changes since v2)

Changes in v2:
- Changed model name prefix from Mediatek to Google on Hayato and
  Spherion dts

 arch/arm64/boot/dts/mediatek/Makefile         |  2 ++
 .../dts/mediatek/mt8192-asurada-hayato-r1.dts | 11 ++++++++
 .../mediatek/mt8192-asurada-spherion-r0.dts   | 13 ++++++++++
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 26 +++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 50a2c58c5f56..b52058965a0d 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -38,6 +38,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
new file mode 100644
index 000000000000..00c76709a055
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2020 Google LLC
+ */
+/dts-v1/;
+#include "mt8192-asurada.dtsi"
+
+/ {
+	model = "Google Hayato rev1";
+	compatible = "google,hayato-rev1", "google,hayato", "mediatek,mt8192";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
new file mode 100644
index 000000000000..d384d584bbcf
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+/dts-v1/;
+#include "mt8192-asurada.dtsi"
+
+/ {
+	model = "Google Spherion (rev0 - 3)";
+	compatible = "google,spherion-rev3", "google,spherion-rev2",
+		     "google,spherion-rev1", "google,spherion-rev0",
+		     "google,spherion", "mediatek,mt8192";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
new file mode 100644
index 000000000000..277bd38943fe
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ * Author: Seiya Wang <seiya.wang@mediatek.com>
+ */
+/dts-v1/;
+#include "mt8192.dtsi"
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
2.36.1


