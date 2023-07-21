Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B88CC0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yq5he0JP/YouQ2LQb3GUolT+3OkSYbWcP3yNSOtSPB4=; b=qxjF4uBlFhoRtP5MeTeDub878k
	XLKzz9KysxLL8Pe5xtMR3PMv/iKJNtI4UxP6SZEvQRbaD+9oOsnEnS6PjPWtuGueKQRlJbFSbGbRS
	k53fYHX3EXCX5tqcaAtFFNWKbflQOQYOb8AV+kmsHEl0geLORZax3qM9ZN1rF8EsUp0QY0Sw3Kpe8
	p2IM5KqM6XhIjCiNjnDfOqEXatKu+68smxrhXFUEMwL/Ikx+zSZBoX0X8qm4jiOqQMTaqDVjyN1kz
	Ku6zXBqi8hAjlnM36UIKlSCqS0EA9xVesy0JEKrqrOp5Ll3YbNju+LBrI9roF3lu50lDyOhodkB/x
	OiIcU2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwZU-00F24X-0a;
	Fri, 21 Jul 2023 20:17:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwZ3-00F1tb-38;
	Fri, 21 Jul 2023 20:17:27 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 14FC066070F7;
	Fri, 21 Jul 2023 21:17:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689970644;
	bh=OQ+uMM3DuJnJS29eyS3oK2aoBh9Y5cY70VQATcXr59g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GyEF+c8erOO/Qs7gQRusAMP5IBO8XrL+ijJjwxya83usLMxDYCmHYq8QhK3s2OStJ
	 0Q+EpZ1gOeuachYQlQDC0dpKgerHd7D7Ml3YRqtdy1+Oz4KxM21Tw22RYk9JPFofYt
	 EiUdEKB/wvI6t7jWXQ8wJVqvwAWQ7CEGJ4yPlJlnhtfGn03JD6loQk9LHFS4YcF2Tm
	 qQEdm/UjQsqKZAnJRVtPXdBvkttSCR+J2umQ4Bwham3T/J11vhxP/Z0FEXA84GVOpg
	 MteVD03Up30r9fpQv39+WxjKoLpGCTcv7HwI9yPO4J8YPYXks5pqPDSDPaWKH/jnin
	 iswfsQ5h5hB2A==
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
Subject: [PATCH v3 5/5] arm64: dts: mediatek: Add spherion-rev4
Date: Fri, 21 Jul 2023 16:16:58 -0400
Message-ID: <20230721201705.387426-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721201705.387426-1-nfraprado@collabora.com>
References: <20230721201705.387426-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_131726_135444_0FB05223 
X-CRM114-Status: GOOD (  15.89  )
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

Add a devicetree for rev4 of Spherion. It uses the rt5682s audio codec
instead of the rt5682 used in the previous revision.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

(no changes since v2)

Changes in v2:
- Added audio nodes directly in this file

 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mediatek/mt8192-asurada-spherion-r4.dts   | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 05aede2777a4..80aaf71f23e1 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -47,6 +47,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r5-sku2.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r4.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r2.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
new file mode 100644
index 000000000000..0039158c9e60
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2022 Google LLC
+ */
+/dts-v1/;
+#include "mt8192-asurada.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Google Spherion (rev4)";
+	compatible = "google,spherion-rev4", "google,spherion",
+		     "mediatek,mt8192";
+
+	pwmleds {
+		compatible = "pwm-leds";
+
+		led {
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			color = <LED_COLOR_ID_WHITE>;
+			pwms = <&cros_ec_pwm 0>;
+			max-brightness = <1023>;
+		};
+	};
+};
+
+&cros_ec_pwm {
+	status = "okay";
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
+		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
+		MATRIX_KEY(0x02, 0x02, KEY_FULL_SCREEN)
+		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
+		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
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
+	compatible = "elan,ekth3500";
+};
-- 
2.41.0


