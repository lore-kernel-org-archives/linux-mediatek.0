Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CBEEB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 20:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMEfN8xWZOu7uShwdY1/3yggbHwMEHKTlaZdILx6Ks0=; b=dqoJFhX+AbtGOTWJakQpLjvVJs
	dVeGbv7mx64vjBsuFKVgrYDR3a8AfExR8e94vM2XYHcssVRk3H8fC9pAb/mj7XmutJ5f7fw/dYymM
	mL8LXxeA7dBB1jOQDJC45i4n1NMNhae2s69jZRZj+VrjtIpPV3KjeunEAR517aIBBqnZYn+Qp7Yjy
	+y5AunDK5OjMjaweWy5bD2iUX4yEhFjk10XzXqp1gon3o+/n/7cvo9jC/LakvBI7RdDza1gby4suL
	8t1Pz+G8LkNUv/CzOh+U1cnA8PvAv/ApWp5YYCEH0LhXdvxoimM2toTpGrebV5n13Kba6O5/bddbf
	QZ1fGbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwZN-00F229-0b;
	Fri, 21 Jul 2023 20:17:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwZ1-00F1sj-2a;
	Fri, 21 Jul 2023 20:17:25 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EC35D66070EA;
	Fri, 21 Jul 2023 21:17:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689970642;
	bh=0atwDp8U+leq8k/bKki3zrwD1rnrL6CHUWiUgbgnsSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ClW3tlNO/N36RrIv5VjN9tUutETt8zJTnql7N9JBj2T4D5prO7uUIngRKKWPB2cpF
	 o8cVAKOWYqp3XcPycs9Y+AT2Y93biJXsXqtAjnnDRru4up9dAw84wNCYlDtDegUYyq
	 EJb/yRp4KhJIG+vGcXLYuKruuVE3nipxUpqB2hRhuEkMxHlQotyyIXxF0MmCDvOPXJ
	 y5JiSLo0zvhVOV1dx1wHzUWbwsIrZ7mqPU+uU2yGg2vqWYGSGRNR9sNaMQRmYkiFc1
	 Ggq9CuQnUbvpJE7ERPEgTyOPKH/EUbjyYeIvUlI13g3pnIiZjWkhLvARVbyIWYLzZn
	 KuS8ZGfSAPiXw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 4/5] arm64: dts: mediatek: Add hayato-rev5-sku2
Date: Fri, 21 Jul 2023 16:16:57 -0400
Message-ID: <20230721201705.387426-5-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721201705.387426-1-nfraprado@collabora.com>
References: <20230721201705.387426-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_131723_972500_9884C4DE 
X-CRM114-Status: GOOD (  15.77  )
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

Add a devicetree for rev5-sku2 of Hayato. It uses the rt5682s audio
codec instead of the rt5682 used in the previous revision.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

(no changes since v2)

Changes in v2:
- Added audio nodes directly in this file

 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mt8192-asurada-hayato-r5-sku2.dts         | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index c99c3372a4b5..05aede2777a4 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -45,6 +45,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r5-sku2.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
new file mode 100644
index 000000000000..3127ee5f6172
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2022 Google LLC
+ */
+/dts-v1/;
+#include "mt8192-asurada.dtsi"
+
+/ {
+	model = "Google Hayato rev5";
+	compatible = "google,hayato-rev5-sku2", "google,hayato-sku2",
+		     "google,hayato", "mediatek,mt8192";
+};
+
+&keyboard_controller {
+	function-row-physmap = <
+		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
+		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
+		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
+		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
+		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
+		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
+		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
+		MATRIX_KEY(0x02, 0x09, 0)	/* T8 */
+		MATRIX_KEY(0x01, 0x09, 0)	/* T9 */
+		MATRIX_KEY(0x00, 0x04, 0)	/* T10 */
+	>;
+	linux,keymap = <
+		MATRIX_KEY(0x00, 0x02, KEY_BACK)
+		MATRIX_KEY(0x03, 0x02, KEY_FORWARD)
+		MATRIX_KEY(0x02, 0x02, KEY_REFRESH)
+		MATRIX_KEY(0x01, 0x02, KEY_FULL_SCREEN)
+		MATRIX_KEY(0x03, 0x04, KEY_SCALE)
+		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
+		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
+		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
+		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
+
+		CROS_STD_MAIN_KEYMAP
+	>;
+};
+
+&rt5682 {
+	compatible = "realtek,rt5682s";
+};
+
+&sound {
+	compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682s";
+
+	speaker-codecs {
+		sound-dai = <&rt1015p>;
+	};
+
+	headset-codec {
+		sound-dai = <&rt5682 0>;
+	};
+};
+
+&touchscreen {
+	compatible = "hid-over-i2c";
+	post-power-on-delay-ms = <10>;
+	hid-descr-addr = <0x0001>;
+	vdd-supply = <&pp3300_u>;
+};
-- 
2.41.0


