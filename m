Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCCDD1CA15
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2024 03:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euPhqg7viIx2XTAkn9Q5AvVF/uGDGrDQK80Z56OHLio=; b=xcWs8QlBTEgtZqChypaLYqLmbg
	0mcnCs83bsiu40E7fvnP7hiFc7ckqfx+rMjO+6bRofq/wTySt1hXT+nNdnW0lBU6hJFTTJstyIZ5O
	TsGR5IuDK9aiMhPoFNEaTS+wnyUrnr+8X8F8vcFyH+2+/36V0V05TKMZg/uputYupK4r+xcouQX+Z
	Gx/UA7+YawlVFz0GXRQCCvCUiTAsJNhUrz5ujk3Qt31tXS5bVn+UL+NRyKbKQ9JaotM4cDCA6QcHG
	TJYwCD+xiHSmflGAq2x6VrknoScIpyE3g0L++SZhMxOxaXo+KGrGO+mqo2dTiPUwDvTo0Sj6x2qmA
	u3N5kSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8A40-0000000FkJA-0LmA;
	Tue, 05 Nov 2024 03:17:04 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t89vg-0000000FisX-1rDk
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Nov 2024 03:08:30 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2113da91b53so15750715ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Nov 2024 19:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730776107; x=1731380907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euPhqg7viIx2XTAkn9Q5AvVF/uGDGrDQK80Z56OHLio=;
        b=SaPaF82T2u22UVGoqj8MqvSUQcVIVMqPHuTIEHN54l6gmNnhpGlYj5A/7YkqK68VQQ
         opmnQeYTwlb0mJUHrImj1uKWO+slS2nU6Mq98tu/TMSxja71dZxpoon/6s/KcPZm62Vz
         GwMWk3scXJsjZYXNunZ8z7VejLgU2EKHNKFkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730776107; x=1731380907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euPhqg7viIx2XTAkn9Q5AvVF/uGDGrDQK80Z56OHLio=;
        b=JPSurLSwRPO25r4bMbOH7lwivIHB1W3vHxD7qx2qwvFnrdb1yyyzbbr8F9hTV4joYM
         2pAfgj8napcxt2chd9JcnbM4kguhcvpxUUy9wCzsLOkyAAAUFCiM9yjATWK2bt3c9RA6
         Ye69MB6kb2QGr7Ei6Ma3ilZ2LaPm/TR/uxEMfDojs9bSXU0cec4V85LodCNz8K1L1Gxd
         B7ozhA2DtosBpsDpwJ+6myskNjBN4PZa+w5jc3A2OFN2KKSanEEKrvN/CRW86/Hz7hpJ
         mtkjyvRBk5NVagoS8Tqddhsfjzym4xCkG5UO9aP3nAzSDnNx8oAecO4D1vXGpUrRIvbS
         t46g==
X-Forwarded-Encrypted: i=1; AJvYcCWS7TviXMljjwlCWQGfJyJrEpUxX+PBwWyvjHOaZN3ggmpz0P8r85YOiRiP4UNCTEMSDkbZEtVij5Ewsq9ucg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzC9dbqoQCn0v8pdqYNLO6XhkIliZEgs8IdoYSVlnWe9Xf5h4pi
	ljJofYOtJH9OFv3uCGsvZwZqisbAoh5dXYve04LuG9Lyh9jOqVshRZIbAV0tbA==
X-Google-Smtp-Source: AGHT+IGBp3c1Lhzc3e6+qTBBRkT4mBZaYjen82U0w7kAh09SHgIN3F5lnKg4nHiKKOQv7zPeWuvL8A==
X-Received: by 2002:a17:902:cec4:b0:20c:c834:b107 with SMTP id d9443c01a7336-210c68cc81bmr425323355ad.22.1730776107551;
        Mon, 04 Nov 2024 19:08:27 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d8d4dsm67497885ad.270.2024.11.04.19.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 19:08:27 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 05 Nov 2024 03:08:14 +0000
Subject: [PATCH RESEND v2 4/4] arm64: dts: mediatek: mt8183: willow:
 Support second source touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-post-reset-v2-4-c1dc94b65017@chromium.org>
References: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
In-Reply-To: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_190828_514247_336ED484 
X-CRM114-Status: UNSURE (   8.52  )
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
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
index 813e6bf65b62ee6742e52133f9adf7e83a6078c5..e8241587949b2bc238ffa85f8fa6b6ca78b1d6f5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
@@ -12,15 +12,3 @@ / {
 	chassis-type = "laptop";
 	compatible = "google,juniper-sku17", "google,juniper", "mediatek,mt8183";
 };
-
-&i2c0 {
-	touchscreen@40 {
-		compatible = "hid-over-i2c";
-		reg = <0x40>;
-
-		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
-
-		post-power-on-delay-ms = <70>;
-		hid-descr-addr = <0x0001>;
-	};
-};

-- 
2.47.0.199.ga7371fff76-goog


