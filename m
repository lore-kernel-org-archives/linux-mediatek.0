Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20537C77B76
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVM5uoUGB0Gp8dPeeI0djESR7YU+eE6G8BZ/l7OGfto=; b=Wuy9UuRp05873L4qNUrFkxuIVc
	MKiZ3V8xnQhTX/4cIa1i69/OTnGf5Dtt0aTHd0acwsGaiTFq6aR0/ToJuxbI4vjWLz9x9ND9wBlKB
	mt6Eu3077BVux9gxqVvMGWy7AhZRkG8pelnPUny/RmQKILUoq0NnSOpUERqtzNJxHw1mKd6w/Xeya
	AAbilCQSjaohDMuVMF4scG77keotsr7zC5tyTQIii/iYayCDIvwN2bxmIehP63QCFNfg5zgctWpkR
	c+I38DWU6kXmhMGFlGDxsZ4NblytoboedSp0of6kFocuk0eA0Yz6OphgpY9KoFu0r96CBb+6G3p9/
	BCqs58Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYgr-002qhH-0a;
	Wed, 12 Apr 2023 11:31:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYeB-002o2l-0D;
	Wed, 12 Apr 2023 11:28:23 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 99A6A6603218;
	Wed, 12 Apr 2023 12:28:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298897;
	bh=SIiYIZu+Qhm3zKiTKfPHBsciu1M3MyEiqZRJOVy9F3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DDNXpZZNAGm91/nzFYldQE2kVwRRWRvw1b3+Ny5PYw7hgA3Z8L7H49DfCrPmsodIi
	 vpg1iNQUSke0Ozw31KNlTcTsm0F+SDs5lQYOdBNTzQosmT0a2FLAhyPsf3PLSb7+uO
	 CgaLekoryNjNfqHXHefUKH+D5Apcw0VZ6cDrNHQHotesBp4TsA357+qWk5/HH6so7h
	 nVJougGkvdlUkmPYC/giEuTU7q2cATWDJFrfd6tDxnhgD549VFnecLgEvqWYXhqo6m
	 KwtLwV0/WoHh++UDjcCBCr2cA70ZqEtKI5FWucw6hwWTI9Qr00gHK8SIPWgIkLjzhc
	 Ek2y4NVjRGuUQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	xinlei.lee@mediatek.com,
	houlong.wei@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 23/27] arm64: dts: mediatek: Add MT6331 PMIC devicetree
Date: Wed, 12 Apr 2023 13:27:35 +0200
Message-Id: <20230412112739.160376-24-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042819_401927_C5B23532 
X-CRM114-Status: GOOD (  11.01  )
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

MT6331 is the primary PMIC for the MediaTek Helio X10 MT6795 smartphone
platforms: add a devicetree describing its regulators, Real Time Clock
and PMIC-keys.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6331.dtsi | 284 +++++++++++++++++++++++
 1 file changed, 289 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6331.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6331.dtsi b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
new file mode 100644
index 000000000000..fcec8c07fe39
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2023 Collabora Ltd.
+ * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	pmic: mt6331 {
+		compatible = "mediatek,mt6331";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6331regulator: mt6331regulator {
+			compatible = "mediatek,mt6331-regulator";
+
+			mt6331_vdvfs11_reg: buck-vdvfs11 {
+				regulator-name = "vdvfs11";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1493750>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-allowed-modes = <0 1>;
+				regulator-always-on;
+			};
+
+			mt6331_vdvfs12_reg: buck-vdvfs12 {
+				regulator-name = "vdvfs12";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1493750>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-allowed-modes = <0 1>;
+				regulator-always-on;
+			};
+
+			mt6331_vdvfs13_reg: buck-vdvfs13 {
+				regulator-name = "vdvfs13";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1493750>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-allowed-modes = <0 1>;
+				regulator-always-on;
+			};
+
+			mt6331_vdvfs14_reg: buck-vdvfs14 {
+				regulator-name = "vdvfs14";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1493750>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-allowed-modes = <0 1>;
+				regulator-always-on;
+			};
+
+			mt6331_vcore2_reg: buck-vcore2 {
+				regulator-name = "vcore2";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1493750>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-allowed-modes = <0 1>;
+				regulator-always-on;
+			};
+
+			mt6331_vio18_reg: buck-vio18 {
+				regulator-name = "vio18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-allowed-modes = <0 1>;
+				regulator-always-on;
+			};
+
+			mt6331_vtcxo1_reg: ldo-vtcxo1 {
+				regulator-name = "vtcxo1";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6331_vtcxo2_reg: ldo-vtcxo2 {
+				regulator-name = "vtcxo2";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6331_avdd32_aud_reg: ldo-avdd32aud {
+				regulator-name = "avdd32_aud";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3200000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6331_vauxa32_reg: ldo-vauxa32 {
+				regulator-name = "vauxa32";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3200000>;
+				regulator-ramp-delay = <0>;
+			};
+
+			mt6331_vcama_reg: ldo-vcama {
+				regulator-name = "vcama";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-ramp-delay = <0>;
+			};
+
+			mt6331_vio28_reg: ldo-vio28 {
+				regulator-name = "vio28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6331_vcamaf_reg: ldo-vcamaf {
+				regulator-name = "vcam_af";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <0>;
+			};
+
+			mt6331_vmc_reg: ldo-vmc {
+				regulator-name = "vmc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <0>;
+			};
+
+			mt6331_vmch_reg: ldo-vmch {
+				regulator-name = "vmch";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <0>;
+			};
+
+			mt6331_vemc33_reg: ldo-vemc33 {
+				regulator-name = "vemc33";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+			};
+
+			mt6331_vgp1_reg: ldo-vgp1 {
+				regulator-name = "vgp1";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+			};
+
+			mt6331_vsim1_reg: ldo-vsim1 {
+				regulator-name = "vsim1";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+			};
+
+			mt6331_vsim2_reg: ldo-vsim2 {
+				regulator-name = "vsim2";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-ramp-delay = <0>;
+			};
+
+			mt6331_vmipi_reg: ldo-vmipi {
+				regulator-name = "vmipi";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+			};
+
+			mt6331_vibr_reg: ldo-vibr {
+				regulator-name = "vibr";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <0>;
+			};
+
+			mt6331_vgp4_reg: ldo-vgp4 {
+				regulator-name = "vgp4";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+			};
+
+			mt6331_vcamd_reg: ldo-vcamd {
+				regulator-name = "vcamd";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+			};
+
+			mt6331_vusb10_reg: ldo-vusb10 {
+				regulator-name = "vusb";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6331_vcamio_reg: ldo-vcamio {
+				regulator-name = "vcam_io";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <0>;
+			};
+
+			mt6331_vsram_reg: ldo-vsram {
+				regulator-name = "vsram";
+				regulator-min-microvolt = <1012500>;
+				regulator-max-microvolt = <1012500>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6331_vgp2_reg: ldo-vgp2 {
+				regulator-name = "vgp2";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6331_vgp3_reg: ldo-vgp3 {
+				regulator-name = "vgp3";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+			};
+
+			mt6331_vrtc_reg: ldo-vrtc {
+				regulator-name = "vrtc";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+			};
+
+			mt6331_vdig18_reg: ldo-vdig18 {
+				regulator-name = "dvdd18_dig";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <0>;
+				regulator-always-on;
+			};
+		};
+
+		mt6331rtc: mt6331rtc {
+			compatible = "mediatek,mt6331-rtc";
+		};
+
+		mt6331keys: mt6331keys {
+			compatible = "mediatek,mt6331-keys";
+			power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+			home {
+				linux,keycodes = <KEY_HOME>;
+			};
+		};
+	};
+};
-- 
2.40.0


