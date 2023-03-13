Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC63C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 20:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THdmWfTqdK58J8e/6mYOUzdaNGMDgz1fed+VpU+vHRE=; b=M5zdUVj7B05raraJtt2WvFkAtH
	+KuErQyBhNuiv7JmeOpu8F7llusWpTOL+GCIYaZRjiZqQWPb3YYIVnNUZ2dNmG2U3RmBMojQ7IqDk
	9HF/NanyN9yC837pGG4gKCw9lVc5MVrgeQ9KZhxcZRWpK9m29sAoMphdS66qd7E4m5GhjU+5A/YzF
	ahbevDIhe7y+muQUlzl+bMglShuF01OmgmGWESt5E5Q/O5qRiTT0GaHQE1troSv3n8rsvd0tiX/hd
	Cdl3mQLgW6D8LFMETRSFMymF9yDLi2GIE1gMQNBLU52eL/wU3m++L/G+//Lxeo/A1MbVuq5qKwTDa
	Cn1Eb4BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbodU-007eoM-2Z; Mon, 13 Mar 2023 20:19:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbobe-007dmb-Uh; Mon, 13 Mar 2023 20:17:20 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E5D5F6603096;
	Mon, 13 Mar 2023 20:17:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678738637;
	bh=4W+F8wexgAtXLns8QVJqRkOERkgC/vz0sMpcELlrybs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JQdAwb+mmBjDfroK5RFAzhVJhK2bsArj7nDwBDBFE8n/l+SjojN8UFxWjYL4Jd5Fo
	 9KYqwrM5Zk1jTgnOWfxOyveICGNLKt8xvkqmv1/AU8Ns7HYx6j0IWG5qxYhmg3AevO
	 bM8MTKGbd3JgKH0rDOYrbZ0+fNdd67q93QrS8+wpT65DJodiX0/Zb25b2R6P0eAdTa
	 2FYaR90HKZmN/Nz5YaW8iPeTShFO66heAkC+SGqVHEsAoCTUaiN4Sk54ZiRMv1GKtx
	 PpAFD8DaEhJZNv+C97krq866sdhsoGqy8PZKUBagadVY8z3T8UzUfkXoOVvoFxBFP6
	 3ULgpCH2fFFFg==
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
Subject: [PATCH v2 5/5] arm64: dts: mediatek: Add spherion-rev4
Date: Mon, 13 Mar 2023 16:14:43 -0400
Message-Id: <20230313201443.2275101-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313201443.2275101-1-nfraprado@collabora.com>
References: <20230313201443.2275101-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_131719_185110_3224EC7F 
X-CRM114-Status: GOOD (  14.63  )
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

Changes in v2:
- Added audio nodes directly in this file

 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mediatek/mt8192-asurada-spherion-r4.dts   | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 6a16685cb958..d08bfd8985a6 100644
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
2.39.2


