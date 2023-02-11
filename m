Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FA5C636D4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 00:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efUIT41m/vSNhrXVcWHkqGPDzJaOoC84InQplcVn13s=; b=yS7Svo+CGM14FKj1Vwgv+il92f
	7Zfc3qTpw15V4bopCcWR5v71+hDqektOHgg763GQhPOLQ0JSg0HM6OL4g3bhkd0cfrW7pZhRaXfs8
	bfGGeJ3nUFYmOd3IoqBOimONkUWketvWYjLQfaskkZvgW6LHxEtILjBoy2LlLqM3p4ECub2lNhK6v
	7xz80vvR3CDOXw+ACPwuaNQEv8CRBtaVLpYVujqmztreWtFXjsRZdP6K8TFbOjqrEQQYfatEY+QOF
	GBuZMwMdvLM5JRdOkk/wWAS/h6GOcI5ZG8K1Yqi8wyXcRjHDwpCzDB5MqmYZZrdm/ZPhDcHQsZZP2
	ORavWk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQdjm-0086j4-Uv; Sat, 11 Feb 2023 00:27:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQdj6-0086Nu-Cj; Sat, 11 Feb 2023 00:26:49 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C7B56602137;
	Sat, 11 Feb 2023 00:26:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676075207;
	bh=u/Pr3DhxNBpEqqdJfKoFRXtR2Uvs7ZRGDDazPyOIVEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e3oK8jsXuhZB75qmw4F8vbHumsZk4CaL5DnXhNcrcA5poa9HEJtCSvM/jUqwi85ng
	 iFI0wokijPusxSFxQh8Aqc9W7MW3wIJw2LJLYg7w15BvGH0IPIq4pLY7bqCiadeJB5
	 jyv1eXrLypVWA+JyTqhyUvMtm3sPFaRhWd58fVK95bO4ylcuCMVqOsI3Qsy7cbPsj/
	 JBDXe5xFM10ApFl4ArRn5WiRvJF3CiZQ4nC51yWCUK3ligbcFV9uCwSi3g2KtmncZU
	 61eGn5l8w2Fb7RoPNYzde7lnslOkux18CfhN9Bxbkt0VIh9kzOEVPxKvwOydAh0GKa
	 0YL62a1iRwdNA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 4/5] arm64: dts: mediatek: Add hayato-rev5-sku2
Date: Fri, 10 Feb 2023 19:26:25 -0500
Message-Id: <20230211002626.454844-5-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211002626.454844-1-nfraprado@collabora.com>
References: <20230211002626.454844-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_162648_591596_A2DF6713 
X-CRM114-Status: GOOD (  14.30  )
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

 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mt8192-asurada-hayato-r5-sku2.dts         | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 813e735c5b96..b349c4805e4c 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r5-sku2.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
new file mode 100644
index 000000000000..d8f32c5f2b65
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2022 Google LLC
+ */
+/dts-v1/;
+#include "mt8192-asurada.dtsi"
+#include "mt8192-asurada-audio-rt1015p-rt5682s.dtsi"
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
+&touchscreen {
+	compatible = "hid-over-i2c";
+	post-power-on-delay-ms = <10>;
+	hid-descr-addr = <0x0001>;
+	vdd-supply = <&pp3300_u>;
+};
-- 
2.39.1


