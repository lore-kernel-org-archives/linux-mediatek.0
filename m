Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103ACC3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OzyMEsbjxgELLAU9H3JVgtxZaYvLlmk6+peydwG5PAI=; b=YTaZFjkoIQ9+ObgsRer+psclpS
	y5IYt/mKyEWEyaZTcs6Ue/CYbi5MdMb9xZT3b3I7/C0FN0DNht3fGYWbEdVU8UrLke8XSYpAkRfNO
	HALBYB6VWi+hKqq64cu6HJsq8oCU/Byh2VEoZojr/KhAOiD0b0i3+1wPb/0AKAIoz09OUIlJSzr9c
	oBoEaRHzTzSKn7Yu4nXCrxK+d0jeIxyUdJYikol+Me+ac4TefVMNedtSXPzeXJ56zjahd0CSX1Mm/
	Ai1W2r84ReIk/qEgtvQowyzCDPFGj097ruk2s4t45okdb62/HPN+5kdCdb+Zv0r+F3/F3AroLj/QG
	XTXc1OAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWCGj-0000000C5ZU-060z;
	Tue, 23 Jul 2024 09:57:17 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWCGf-0000000C5Yh-3eA6
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jul 2024 09:57:15 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5d57d8882eeso951447eaf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Jul 2024 02:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721728632; x=1722333432; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OzyMEsbjxgELLAU9H3JVgtxZaYvLlmk6+peydwG5PAI=;
        b=BwHiYvD/ZrMLN7lmn6Tf/ItNWUU6Kek/EMkB7mrjFmbuNCXNtFmJUlxjg7dDKXwcRf
         e5o6TBKO259N6c5VC7fPA0VVYWhZl3g9tnpXBe88/RIImdYMpUarviGz102Sqp5T/zaL
         yA1XEQQal0SKdAuFCR9Bq/xD4Ssu1GYiCyAe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721728632; x=1722333432;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzyMEsbjxgELLAU9H3JVgtxZaYvLlmk6+peydwG5PAI=;
        b=m8JETIWBi4MmV7AafRVMAH3Ar16LiJP1b4uhgckPnIlbRSpgIUwCIavXZWctCXWB6H
         yz+OGugmE58qdPA1PHejA7FMrQXEZ8EkjnqqS8ovWN+WMgcb9qk7ZW0j2RrjH3Jib6uA
         muetHCNgr5x/jJ47kUG6eba+pU99zkf7X8ZkAN43awSanhqOlnKySTZd/cwqtYLGnN5k
         zzYGAEEw6dyQw4b6vZHWN+u+vNAHWOv8Ql05MheTTXnRrHscWu8g/mPDpYiFC2+MaLiK
         8q7waWg7YglGFxr3OwHWcoksrjA68olpx5A1kX97aA2PqSVCCcOaHUtZmy/K0LooTH0Y
         H1WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOezeos+AUkwQ6bw4r/YpUaBczOrvuKpjY8lbzWu/ibRdFtEjl97Sr2J7COddahTwMBFKrk9l/BENdp1ZGV0/HJ4jk9I/GPi4tqMLh2ll8eL75
X-Gm-Message-State: AOJu0Yz1K5fYHVlMhVPbNClrELqhvXJkqyr0uwvpsVjv/EYPio3o8TLk
	nHeSVuE1EmjrWGu0FPqWtngX1igXep60cMPb74il4NEU1q2lqxOrncTgAww8kQ==
X-Google-Smtp-Source: AGHT+IHDnnxHuI9E06J5YQVs42SxY8MGajBowmzWGUirw5K4mNGoo+X6VpjzSBMPCAM4HXho8gKsfg==
X-Received: by 2002:a05:6358:3392:b0:1aa:a01a:23dc with SMTP id e5c5f4694b2df-1acc5b1f268mr1130147855d.15.1721728632189;
        Tue, 23 Jul 2024 02:57:12 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (46.165.189.35.bc.googleusercontent.com. [35.189.165.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79f0f546147sm5999975a12.82.2024.07.23.02.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 02:57:11 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 23 Jul 2024 09:56:50 +0000
Subject: [PATCH] arm64: dts: mt8183: Add kukui-jacuzzi-cerise series boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-jacuzzi_dt-v1-1-3e994a2b5e24@chromium.org>
X-B4-Tracking: v=1; b=H4sIAGF+n2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyNj3azE5NKqqsz4lBJdA7PkFIOktBRTEyMjJaCGgqLUtMwKsGHRsbW
 1AJmNJk1cAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-a9570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_025713_973519_40C81371 
X-CRM114-Status: GOOD (  11.87  )
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

Cerise is known as ASUS Chromebook CZ1.
Stern is known as ASUS Chromebook Flip CZ1.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 .../dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts   | 25 ++++++++++++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi  | 21 +++++++++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi-stern.dts    | 35 ++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts
new file mode 100644
index 000000000000..b4f4ed701253
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-cerise.dtsi"
+#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
+
+/ {
+	model = "Google cerise board";
+	compatible = "google,cerise-sku0", "google,cerise", "mediatek,mt8183";
+};
+
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
+&touchscreen {
+	status = "disabled";
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_CERISE";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi
new file mode 100644
index 000000000000..087a0ef33e13
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi.dtsi"
+
+&cpu_thermal {
+	sustainable-power = <4500>; /* milliwatts */
+};
+
+&mmc1_pins_uhs {
+	pins-clk {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+};
+
+&i2c2 {
+	i2c-scl-internal-delay-ns = <13200>;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts
new file mode 100644
index 000000000000..15e00feae3a9
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-cerise.dtsi"
+#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
+
+/ {
+	model = "Google stern board";
+	compatible = "google,cerise-sku1", "google,cerise", "mediatek,mt8183";
+};
+
+&mt6358codec {
+	mediatek,dmic-mode = <0>; /* two-wire */
+};
+
+&touchscreen {
+	status = "okay";
+
+	compatible = "hid-over-i2c";
+	reg = <0x10>;
+	interrupt-parent = <&pio>;
+	interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&touchscreen_pins>;
+
+	post-power-on-delay-ms = <10>;
+	hid-descr-addr = <0x0001>;
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_STERN";
+};

---
base-commit: 66ebbdfdeb093e097399b1883390079cd4c3022b
change-id: 20240723-jacuzzi_dt-06cd0bfd5422

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


