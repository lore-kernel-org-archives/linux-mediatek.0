Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256F8ECE585
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8SnkEIUaJgzB4YgotT7EsNuRM1+AXvDniyzdMxhF5A=; b=kYH7sRvjJGSUuw
	cHW7Yh49CDPq3jdFpPa5m2ygMQK8cDteHP80+8Fh/bS+hAl2KLY1/iaZpxAVQQmzEQjiPH04nluIM
	zb8imtheFwB6/N+dpxjZrVzR/tJVI3XDBeXGFIGH5OzruzPLaqHN3dPGjSEi0unbkS5TRtUiaPmXI
	C3XkqsDzGO1fAAjUxMhp7H58H1vb7soJjZZA7lI0vxT+mtt0CeTNSlMUlqCUZswhHhapelPX1IHna
	GJXQOtUfpYUIzUJdb507yb8aXa8XG16C2euy/SjAhwCL/isOy2o5ANSTkcEg+h0hq+z3FUcA9JKiA
	LI/UlET7xeqKzbmBs0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncjA-00000001hUe-36w5;
	Mon, 09 Sep 2024 11:38:41 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncPM-00000001dJI-0SNU
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 11:18:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2053616fa36so43982285ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 04:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725880691; x=1726485491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8SnkEIUaJgzB4YgotT7EsNuRM1+AXvDniyzdMxhF5A=;
        b=JNVXSCTmx3q7DsEZbs2Y0KM+18PLSrQ76QzUzZUvz8skCT87onf9pGahvm9QqNNYhM
         k6d6ouhv/9lPl4yc5AVS4gFNOm8NwDgB26vwDBNwGJ8KjyEeXxOG/3TjW4ibfVXTs84P
         IluMumfJjTPkg2/NPbcj7EX4tbzlcohZbN4zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880691; x=1726485491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8SnkEIUaJgzB4YgotT7EsNuRM1+AXvDniyzdMxhF5A=;
        b=GNoXzupY+Rclfy4w6RIH12La/CRrLuW+MOVpDQuZCmwV02qz3qK6i7mECSMvA421Oz
         3jqwJDGe5k+e9b1Re9BGEqNgMxqpiS9BG9JRY5/XeTVpjhP/i7x5Sz/XCtj8Fzpvqr8W
         e6pJ3Xhe6AESLiDclCAg3nfQlHA8yQozmq/wGkbss5yGzWxTUKoqc1FGvteyguRyNrmK
         iE8Y0yo46XrbXW4RO1tLOXD2cCKYxLpVTHnpg1PnIk8A9sy90jhAHJdjfhjuUaqgmZn7
         0f21dTL7v/ol+bf91JVR8+0CIjWuDlQ1SjwFtLi309zIAZrRW1vOra+Ha2rc+5lwtuI2
         BqDg==
X-Forwarded-Encrypted: i=1; AJvYcCUET6XAq1iUjP1hfdgwsmgZmSMGIIA5npkyCszoMeT+1WSda3Bl1XU1OfwX04ZSiLVSTn8PmvlwAmT3G/VRqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxao598AD50Lg1az9c//4fsTQLxqqzQ0W2q9RuQ4WiTzMCygZeX
	5QyRVSzXg0eDCQ7Ct7UpMgS9uw+WbAQm9Iu9vcRUHvpOTjRWsC8Ed13YclxfRg==
X-Google-Smtp-Source: AGHT+IHyDTzsdvKTYHYCRsjLXJj55VMYefAZZ1kao3wEu5P8Vpo/msMT/FaZZWK8Pig44zwKxNmXAQ==
X-Received: by 2002:a17:903:244d:b0:203:a20d:5857 with SMTP id d9443c01a7336-2070a3c3a13mr73134925ad.5.1725880691452;
        Mon, 09 Sep 2024 04:18:11 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:6647:6d5f:dd48:8f5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1dc55sm32039745ad.186.2024.09.09.04.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:18:10 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 09/13] arm64: dts: mediatek: mt8188: Add PWM nodes for display backlight
Date: Mon,  9 Sep 2024 19:14:22 +0800
Message-ID: <20240909111535.528624-10-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240909111535.528624-1-fshao@chromium.org>
References: <20240909111535.528624-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041812_172222_77FA6582 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add two hardware PWM nodes for display backlight usage on MT8188 SoC,
and mark them as disabled by default.
Boards can enable the necessary PWM node as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 7e3a90c1a173..4593bc1fb5b7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1425,6 +1425,28 @@ lvts_ap: thermal-sensor@1100b000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		disp_pwm0: pwm@1100e000 {
+			compatible = "mediatek,mt8188-disp-pwm", "mediatek,mt8183-disp-pwm";
+			reg = <0 0x1100e000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_DISP_PWM0>,
+				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM>;
+			clock-names = "main", "mm";
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		disp_pwm1: pwm@1100f000 {
+			compatible = "mediatek,mt8188-disp-pwm", "mediatek,mt8183-disp-pwm";
+			reg = <0 0x1100f000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_DISP_PWM1>,
+				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM1>;
+			clock-names = "main", "mm";
+			interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		spi1: spi@11010000 {
 			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
 			#address-cells = <1>;
-- 
2.46.0.469.g59c65b2a67-goog


