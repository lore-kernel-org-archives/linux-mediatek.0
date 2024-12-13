Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9058E7717D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2024 05:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4GVLFVs9w1ID31bls4QxEe595eevO3e2bV1KeBxYl8=; b=plWlmqkQkAVXZODhNPNIxGCBBi
	1T8viCDxHzlkFnmnWyyDvCY8EU5Hs5Z5NKsuuAwWEk5SFn1VSVYuL011ZE9kwSh4Td4reb49CTLhK
	mCW20msR51/lUdLi1B2agKJQavZVyLzf2QnLXarZHPIetiXDWZpvEUAXf1o/6UcRv2+jm1b34LgrO
	i8b5VdgIFtZrTXPouE75w1FLnT5Bf52ZY1u5W5CydGMEHj7b3Ds6ajAcygt5jMgknxb6OP+6pp2IG
	cZLDMuDhlM02+7No2hp3sEmrAaZtitrKb2vf0B9+cXAzOB+gGWZgEOu6IcqgN3G6j0O/X3C/fXQvz
	aAbWlUEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyGw-00000002mCA-3shB;
	Fri, 13 Dec 2024 05:31:30 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyDV-00000002lbV-1HYo
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Dec 2024 05:27:58 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-725dbdf380aso1224862b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Dec 2024 21:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734067676; x=1734672476; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4GVLFVs9w1ID31bls4QxEe595eevO3e2bV1KeBxYl8=;
        b=A8JYViIok4kAiJajUiPzBauN72Xslulqp/hP2cZ7ln8/CTyY6xtOhZqWWUx1Y6cKvE
         cK0mnCUq0WPRGoRHEAcMyXaSLeVxOFCssnzPRxAv/YwqKpBfMXh9BHwiQiBci5ssl8kw
         fG97kWAmLUDgLQp5R8+nonDsHCkpdeRMV+VM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734067676; x=1734672476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4GVLFVs9w1ID31bls4QxEe595eevO3e2bV1KeBxYl8=;
        b=ALaBpJV6+/d18qfldP2l9d4N0d+HZKcmzCjYfxwmuyM391s7EIJh1XhzVN4IUxSRBI
         ihShi+xvQq0IKnUHIRvj9oSWK7ZSjHR3+iRGUihADqB0CR6Q1NT4FG4nsL2vKEDOqWZx
         WUTdJsPFVW4SzA6U9Kf7Dc9yFAdeuM+l6FNPneQ6ndC4xiOYascmKqOG9dWHso/YRnve
         lRgCllxtTz3Pmu3Tl7jRuevXB4KKiBzaEI1OIPWT0Phjdad7tlu+bDSffRgXeR2aczHN
         ajcDOcCYSRYd0z6oEeffiJPwEN2hcZzwmxywMRMP6a+uTEhu9Xi5exRB4qs7YMkve2r/
         VJWg==
X-Forwarded-Encrypted: i=1; AJvYcCW+azJ8et/fOi+r8RjqaipKjm4/T44xOisQR+MhCI7g1tHbc0SXKZiMI35mP0N/omY5+6ld9tzWUUE8F3DN2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTJkF5jen/coRosiKUw8keRYNt0oYf+aAOOD2t6S5kptNqbLyp
	Eh8ZpJ4pGfVMA6IkWZeiQHDl1z5UE+bEHcrULF8a5Hn3/1As2VoziBjkhOnBPw==
X-Gm-Gg: ASbGncuSE/JuLrVHt+szTzh5Mu2wRcMF+ZJDV2ZZTOcxOjug8NIvIV3k4gd+pU9ZX/v
	KORR6tJ1fSdzC3rKU+jUY6zuB1v5AtgOFUJz7V0dGwJkNWfqDBHNK/qFIX27fFHy0KXCJ9GENiW
	XeN8w+Q2f1FQr7L8uUoS3m/l6DbLggfv0F51gelgY7W2NXM/YZng27YlIh6xyBym6aEP6Ftn6aG
	D+ijUoZsjpIlt5TvHBAxV9Ypm7BmqVIlYTIWermGbf+2kb7WfzppFS9q9qzRNm5tiTCWDx/S5L/
	sG/oV3eE0oktCgJjpe1v+l0nHB+9qpcSjqC+1y/oWBp/ey0=
X-Google-Smtp-Source: AGHT+IHal8NKejL0izByzIBf1fuwDy1PG2fbPNERA1Cbl9Yln/09XYoA7/+dew9qh4tY8eROOfTDpA==
X-Received: by 2002:a05:6a00:c96:b0:724:bf30:147d with SMTP id d2e1a72fcca58-7290c17f109mr1865316b3a.11.1734067676481;
        Thu, 12 Dec 2024 21:27:56 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7263803a805sm7386830b3a.14.2024.12.12.21.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 21:27:56 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 13 Dec 2024 05:27:48 +0000
Subject: [PATCH v3 2/2] arm64: dts: mediatek: mt8183: willow: Support
 second source touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-touchscreen-v3-2-7c1f670913f9@chromium.org>
References: <20241213-touchscreen-v3-0-7c1f670913f9@chromium.org>
In-Reply-To: <20241213-touchscreen-v3-0-7c1f670913f9@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_212757_345533_E5D57CA9 
X-CRM114-Status: UNSURE (   8.03  )
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

Some willow devices use second source touchscreen.

Fixes: f006bcf1c972 ("arm64: dts: mt8183: Add kukui-jacuzzi-willow board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
index 76d33540166f900c99c419c4f97ca0a56cf658f5..c942e461a177efe1e711a978c3bfb9f852f1b0ee 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
@@ -6,6 +6,21 @@
 /dts-v1/;
 #include "mt8183-kukui-jacuzzi.dtsi"
 
+&i2c0 {
+	touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+
+		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <70>;
+		hid-descr-addr = <0x0001>;
+	};
+};
+
 &i2c2 {
 	trackpad@2c {
 		compatible = "hid-over-i2c";

-- 
2.47.1.613.gc27f4b7a9f-goog


