Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5A1C25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 10:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KPQvvAhw/QNVA2rWSAmQjx+yY2X/Ig4NrPz7gPkeZ8=; b=WHINzQ5bUzMGuK+2cLx4nmG75t
	xVNlZXwN737VmGL4cueOo0o/BQEtsZJYV9p3t3Tr2ePwtu0Pfmip9iMCjMO8geBJAQFRn9wXTql4o
	BX4qV+FPsRSmOpq9yUFHW0jGhf5NOGJzxJhU5W0p8pYD8DtGN7V5N1WWw05bjwH/FZgDrjspDc8MM
	PBXZ1NxXvmGXSQc3Ll+sVmiEdWfSBSr8ePrpQANu9FmFRy20ALR7VhcZ1S7kYGHz7qyiEIaZduXWh
	EnkD5ZKGvVBEUYeOZKAJZv6uUF74ySV7oj/Zx5yiYzetsda2GptHnOQENsxIM1QgYYBF5gSQlAGWL
	I+0n8jyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5HX-0000000GQO7-0745;
	Mon, 03 Jun 2024 10:51:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5HO-0000000GQFy-00Ze
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jun 2024 10:51:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4213373568dso21187635e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jun 2024 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717411863; x=1718016663; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KPQvvAhw/QNVA2rWSAmQjx+yY2X/Ig4NrPz7gPkeZ8=;
        b=JeydQNre2ON/SylhQCHZQ674IiuDj+HzFIafWGVOTw06YVgq4clGlVExQrFYF4aPW/
         m9NgPjVKn2KnSV0nREdrcATLCpJhLGX0xeeT29sD3QLHfjZ7XBexdqE/YmGeQCYkEAuB
         GQ8/3YzBii0KSkIoIBhcfiR3p7b+G1EpxW3ozVwmTk1gzTTJvLE7FSoPRVQnLY7mQ3ER
         ptEU5vOJd564gKG5YJkcFCJJizYq6dnvlpdI6mrVe08z1kEjVvVjftpP6wyRNH3AYFNi
         HRcPUXCqKDeqYtfFqwOmk3zOVKEL5yjdJXY3ATUN1i+qFsp2y3UULeraMZVcs4D+v3gf
         HWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717411863; x=1718016663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KPQvvAhw/QNVA2rWSAmQjx+yY2X/Ig4NrPz7gPkeZ8=;
        b=pxKx7AZJqpynrEEqt5sjNorNtg/nZmasUcSxite/DqlOuz1QFE+/R/NX8TQPXo8KML
         1NVNixoBHOoWAHBBLqafHyynl//oVDLqOHNaTqb5R/oCkFkjRNTvtxZ4nOXsOERMZ/WH
         Sa7aPJkAqAmsI+mSXE3gJEKRA05p+a8HiEn7hRjYTYFqZRGYh1+8ObPVi9ggE7orW7VI
         qJMxRsL/sMe232KGmj3WVYDaRS06Wnch7EZLmocFPcfhBNsFn01OmygjDNipBMccdFPe
         snTXaaRelLcjY7afvvCFjwfD8Ak55NM7+LHLMy8CrcMWpv7Xr/rCm/li6GFFja1Kwx6C
         NUKg==
X-Forwarded-Encrypted: i=1; AJvYcCXZcC/Futu7rzZdOTJMVlo0z651lgdOIf/9otYNpOf4XnxBTmYkL0BOLGM3yHxXJu6SBa0v8rLiAh6QZFqUgcSIiezvb3Xyke/kzJDZg+29KXz0
X-Gm-Message-State: AOJu0YzVKvzpAU4zfYoWAXk0jw9ezvP3stRSZB5WDH7XJSALcY9sMepb
	5aBJkg/ROFQQDg6Q7Ihg76fx2K+xPqVd/sHIbGp7vpwwef5BUYxeA1pzp/t3T8QUU++nzHfhodq
	C
X-Google-Smtp-Source: AGHT+IHIpI7ZG1pCJsIFce1Ck3eFPOfrieRcWpk0YEJqOFz8SVhpF8pID2UFEAvp0s2E15RMKaVAHg==
X-Received: by 2002:a05:600c:45cb:b0:41a:c92:d323 with SMTP id 5b1f17b1804b1-4212e04a1famr79830925e9.10.1717411863490;
        Mon, 03 Jun 2024 03:51:03 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42133227f8asm95372535e9.19.2024.06.03.03.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:51:03 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 03 Jun 2024 12:50:50 +0200
Subject: [PATCH v7 3/6] arm64: dts: mediatek: mt8186: add lvts definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-mtk-thermal-mt818x-dtsi-v7-3-8c8e3c7a3643@baylibre.com>
References: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
In-Reply-To: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
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
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717411855; l=1717;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=ZXPmUPXXFa1JCVfBMk9FrptEjzZlcdWN0z1cSMSnOwA=;
 b=Kt+1V0UhcrpohxTAKZFUE6vVY7Di9DK+ytngdabEc9EgSfLdYOSvG84ZuIRjZE5ntcFnGkiTk
 2NXaGqDdubOAar0nMdkuK90dJZZMBlW7wdgSxz2A3s1DmE7244C82G2
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_035106_128709_9331215E 
X-CRM114-Status: UNSURE (   8.53  )
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


