Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6866FC25B7D
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 May 2024 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KPQvvAhw/QNVA2rWSAmQjx+yY2X/Ig4NrPz7gPkeZ8=; b=uezwhVVimEHOzZD8kwnDFLb4gC
	HzetfkVpTfuUkTbKn1lJWP58MgnWkdAMFSKoB8RWdfvDzclHYgAlPwTLm9ZVWSguETobtw2DbYU72
	/ZRYyvzS0mNWeZrApCR9uZMc4nROnKE5ZVLjF8sJzUa6z/PUNDMc1AybjE7auC+LnpOu8pEhqRyXQ
	OqHkH+WX6JkgFHzNEjOIm5D8Al6rCQEKdmFUE80QK7WvUDDg2OZ9RkkgCGIjHzBY99xa21xscEYvt
	9Mpm6oj+ikHJ0+SIBoR43Ik8nlktnqhAzVXJXNXFAbkSnuKeXyrZfbTEqs3obx3pjywZ9yW8+GXg7
	ejby56fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQrU-00000008TAN-3xPe;
	Fri, 24 May 2024 09:05:16 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQr4-00000008St3-1vQi
	for linux-mediatek@lists.infradead.org;
	Fri, 24 May 2024 09:04:52 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2e95a60dfcdso7540771fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 24 May 2024 02:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716541487; x=1717146287; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KPQvvAhw/QNVA2rWSAmQjx+yY2X/Ig4NrPz7gPkeZ8=;
        b=noQSviTD/oexfxByAieCm91cCKYNGH2a6qMNAjox/dPTMW6NrwkhvRrs5Uepgy4Dm4
         cRY3Hk5LpL0aN0wqDl5V/OClctEHQT0KWuYRpiDvBZoqOSBiZ1uT8oVbP8gJA6ynG5V6
         OaWTEgsY8kgtg8NWdGfV05O+wbf0S7GzSE2E6+7TUaRJ7erNDJgMlAbJZNlPI9V0ZG8s
         m0d5NAla2LuaCooyAPFkzv+ecLICbxCUPEbvBmAL9GuQQoteVbIFoZgQS86bG2QmmGLN
         SeevQLmNfAazYu13g7grzwJ7cpG5/nqfIoAXdjNxJorMBPSCpdz6XLRjglthRi3FtFRv
         D4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716541487; x=1717146287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KPQvvAhw/QNVA2rWSAmQjx+yY2X/Ig4NrPz7gPkeZ8=;
        b=s0/CxBTG7KckY2WWghqNy5EMewyDe62M3PE8tVCJi3Bwl4zqMnM8TLD4fP0G59fmtL
         aQmG+ARZVIqsjpAIcBqQT3+HeLZz6//bygzLpA0X5wMvJ1SOJHbyG3BW9v4QSRK9tmQk
         8uFMRGE1HUGbKS5gb1ExlbqoxKGpkbq95uvY3k5Q8/Qs0sdyAXNYQ5aCann9nsUx1b/L
         xL2gUgptBwY6EwOcy6narsPwQVgt6UcC5APmqyg/fPjYT5y8oKcJeOHsU7FUv/bps4TL
         rQn/tHgKVjyyBKIZ0DnDQiHTCtQlciVW4WfKDEVy7EEmjxcsjdXjaK7QAZSn7O1sxxVY
         YaWg==
X-Forwarded-Encrypted: i=1; AJvYcCVvoMDUPEU0Eu2lJGe7HFnJZgSVps0zZBuug6Wv7Kq9SfCLd1VCmqNLzjxn7Pe/20Gy8r7yuJM9X6d3aVyn2rw8Y9UYwebbq3t+dVWTc9mPBjv3
X-Gm-Message-State: AOJu0Yz9+J7S0vaJ//wk5dsAgxGlnfxsEIFg47awn36XUP04jmmQ3MEx
	37tpfBY+2IwG9jImQD98qyawXS8O2uxGdpEd5JKhgaJ+zdglH7LLQ41xqgSZJaE=
X-Google-Smtp-Source: AGHT+IG4ZPvP3zyMcIIsqJRNHq2zKeq8gVeaCSSEPAEcrdFwonBn4Mlo37q4NLlAbVPyD1pqqDJuSw==
X-Received: by 2002:a2e:9c8f:0:b0:2e6:f59e:226f with SMTP id 38308e7fff4ca-2e95b0bce90mr9581401fa.5.1716541487399;
        Fri, 24 May 2024 02:04:47 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f163a8sm47273045e9.13.2024.05.24.02.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 02:04:46 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Fri, 24 May 2024 11:04:36 +0200
Subject: [PATCH v5 3/6] arm64: dts: mediatek: mt8186: add lvts definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-mtk-thermal-mt818x-dtsi-v5-3-56f8579820e7@baylibre.com>
References: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
In-Reply-To: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716541478; l=1717;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=ZXPmUPXXFa1JCVfBMk9FrptEjzZlcdWN0z1cSMSnOwA=;
 b=DnxRTjxW9wcR2LDOBi5XDgQoQhBL6Qg8MGh6B91uPvtLP04Jw+un7gLHna5Fd+Gap9ino5nx7
 0fkow0NZ0Q1B2HcwWjk8f3uOiSg6Yj45Xh3lrEEqW62m2BKow3pSlc7
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_020450_573882_70D443D8 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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

From: Nicolas Pitre <npitre@baylibre.com>

Values extracted from vendor source tree.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Link: https://lore.kernel.org/r/20240402032729.2736685-8-nico@fluxnic.net
[Angelo: Fixed validation and quality issues]
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 4763ed5dc86c..caec83f5eece 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1361,6 +1361,17 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		lvts: thermal-sensor@1100b000 {
+			compatible = "mediatek,mt8186-lvts";
+			reg = <0 0x1100b000 0 0x1000>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			resets = <&infracfg_ao MT8186_INFRA_THERMAL_CTRL_RST>;
+			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
+			nvmem-cell-names = "lvts-calib-data-1", "lvts-calib-data-2";
+			#thermal-sensor-cells = <1>;
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8186-disp-pwm", "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
@@ -1676,6 +1687,14 @@ efuse: efuse@11cb0000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			lvts_efuse_data1: lvts1-calib@1cc {
+				reg = <0x1cc 0x14>;
+			};
+
+			lvts_efuse_data2: lvts2-calib@2f8 {
+				reg = <0x2f8 0x14>;
+			};
+
 			gpu_speedbin: gpu-speedbin@59c {
 				reg = <0x59c 0x4>;
 				bits = <0 3>;

-- 
2.37.3


