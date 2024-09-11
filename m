Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9EEEE4991
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjEfjad5gaHh9yR5Z7gt+sOiMhf7ln7vUbnINutcJ9U=; b=oODUOs3Pj6z2cS
	gGZXa4VzoBnmVFCJzho/SmqyS0d43OTi/8B+myuQI/h+kG1EEapERxnuiybJQlyN/99DYVj6VFXtY
	Z7Ftq76RKwwEnKmKvFsnGdSXnINv8g9Ku5xyIM4P0J98/1eFZjAqwAJclgCSSIZxVbNJrfKa9JeTr
	Hwy4nbftg4zBCFLa1KkUJN18uLPK5EGzw1/SESc9IHM0sEE/7Wuul74km3y4WpUvWOsEbmRLd7stw
	coEEhoj3OodqDYMY4+PoUl30tvUeFbE8l77vMA8PWPDlWut1pWT7zIFxJLbdQXKpTeGnkMqTzkTxG
	BNKm/3DsK67ImyFnLR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soL9H-00000009DcW-2Tej;
	Wed, 11 Sep 2024 11:04:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKxN-00000009Awj-23fg
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 10:52:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2053a0bd0a6so18949215ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726051936; x=1726656736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjEfjad5gaHh9yR5Z7gt+sOiMhf7ln7vUbnINutcJ9U=;
        b=fLefkuBAvHDaMZ36Cr68RFMPIsgUVmPHZjq8J9/4Y+fjwol2tFKcNRgGer5BQfILGr
         ZzYfBLJXnTMhwgSklUh7Z91rTsmpSHxQNrYID5NylOW0HXtZHK0Gidoxi72x6XKC5Lwu
         R3ZNcSblmgw1EednO1acb1mWlqvZu5amrjGxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051936; x=1726656736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjEfjad5gaHh9yR5Z7gt+sOiMhf7ln7vUbnINutcJ9U=;
        b=nO6ly4M+0oWHp68UIn7xZc1q0fWL4DaaXH6fWKNTNR5IWBTmMkQwjmgJC/4QQb6tZ5
         AXodOtytpTMzFSQwB9i+z6OfgSLcRoT7ARhWdigoXcZ2mSJHJpb/Jz/GIx/9PSuRKAQL
         vihtCjmHSn/Mu0gCzecerCHHglQyBkInyrCfTWZ3I8FfsXa+di2Gu1VWuHF8BmQ4ivth
         8isO/QiZdMIim7FwJXykNL8vU3qeSdlUBs6vICdIQaiP2qIXe4dKlrfDhxzsWau4du6h
         eUM35VP0OCoitzMw8k4UpM5PLCLDdB+Jxv1pn3NQoVfCAsRQ2778NK1ykPL6KVWNb3zj
         tz6w==
X-Forwarded-Encrypted: i=1; AJvYcCX9Yf0BEYMLCejNVuhJyNO5fXYmExMEmFOEBJ/zDJ0ygnd3jZ5dMb8X2wh2tGRRUNWVBrk0zWbIxXsuA4NIDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPMB6XVl/D5wAH0Tbo14sCCl62sFwIHoQyTrlIxIMFq2ewkrkI
	JLM6Hrf1AAN5i4QXLMOtyX2RtdMEE3Bp1KZnjbRjdYiCRGsLK8OSBpalzJHDPA==
X-Google-Smtp-Source: AGHT+IHlInOKvp4aF9oOmTvOITgeWKC+0zEZ++z77fG527ltX5qYlsAvDX/ku3VjlZ9QpmIaMIkPLQ==
X-Received: by 2002:a17:902:d2d1:b0:205:4531:54d with SMTP id d9443c01a7336-207521bbe0fmr39165075ad.30.1726051936144;
        Wed, 11 Sep 2024 03:52:16 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8242b3d13sm7147352a12.52.2024.09.11.03.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:52:15 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 5/8] arm64: dts: mediatek: mt8188: Add PWM nodes for display backlight
Date: Wed, 11 Sep 2024 18:51:10 +0800
Message-ID: <20240911105131.4094027-6-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911105131.4094027-1-fshao@chromium.org>
References: <20240911105131.4094027-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_035217_572078_8CD2F514 
X-CRM114-Status: UNSURE (   9.04  )
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

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index f746b89c1ec6..61530f8c5599 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1418,6 +1418,28 @@ lvts_ap: thermal-sensor@1100b000 {
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
2.46.0.598.g6f2099f65c-goog


