Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A656CCED27C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 08:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AEmpf1Qh2kfZRDBsrgiylITiUd0y+4rTAJ+KrYJvhnY=; b=PNVDIE4vSnZm/QeKxXevzPArVc
	L3XzKo8lJ5+H70YQJC3/coWCGWVo1HPU6m1Q7h7Qdar//vZxDpa3upWaZcx0uBy8t1KJuWb6rRnKh
	GclA3s7pwDr+/QWInz9Icufmej1u2OxW4DdxV5xd7IC6X6hytYKnM+2ES7n5O4rsTmmKdpOpIa5TZ
	bPad3StMbDTse7xiriM1T2DCs4L/1BS/0g296JkQqIw2hoLlhMCgiM5aNbEF8eWeWMhUPdcKWRDtW
	kaA8reQbZFkAlgZtUJruct8S/4VWVfd8VZO/umyJ9YBt4F+Vl/LV8FFv8s7YVrnzN0WWfXPjTNl8w
	8x8ceJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5iM-000000054w0-2j5b;
	Tue, 08 Oct 2024 08:37:06 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5Tq-000000050Fn-26MZ
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 08:22:07 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71df468496fso2748033b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 01:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728375726; x=1728980526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEmpf1Qh2kfZRDBsrgiylITiUd0y+4rTAJ+KrYJvhnY=;
        b=cFYxltDo26RPeZA/E4Exu6yd4KjUiAJcjpeO2y+ijqjpVCfHeR5QLUCwVIK3XAMenL
         S4aqopsBu8uBEeW0d7CpG/+fJss75SkbllQd58G07PCJq3oEhWDCo4FvqyVPC4Wba4VY
         YybmYVRpjyq60I7sPV3nDDC1NZeRKdYoUIrqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728375726; x=1728980526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEmpf1Qh2kfZRDBsrgiylITiUd0y+4rTAJ+KrYJvhnY=;
        b=NIUjDHU9iGGmJ2VfXThfNtM7yVV2/78pxPtvgcFwpSp1S5dNaw5pEMakygkBXKfqA1
         ZJsf9c9df9HMgXsSSKfSR9Lt26lA855VeOaCm7hUY9b1BlbBP1mghF0qVrPiktfu111N
         3jaBKpgDlTCXfUXLwn7VE+TYOu5h7IeGdJvOoHz4yPpRgn6lTNIq8FRJWEpkkgU4V5wZ
         AzTbGR+xLe8KJ2P2RqmbdxOhPmdqDxkRnVGna639AoxKNt7V+2bU0xB7FIjwzBpjnDvV
         3iPOoD2UtbEmJGvIXBRU1W7pK8DEq7KzQVX41k9K+piRM/+IcdABTcvigTWdtqZE2Fii
         intg==
X-Forwarded-Encrypted: i=1; AJvYcCUass12bOUm7R+EPYbLctO3+pssouzt99IhJ3dcrC09F4uhLYLaBigrsVerYs83EwXXxBTpINC77WAMDtvJlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyS2P4539Q6A6axOoP5KFGNVwlrkY6MBJDgWdEqZw7QhZTx/uRY
	yWhb5MGnDy0+ro3iLnj6KThiTgz5w7lBYU06ZbSo/bpuznzq77bT0WUI7C3/+g==
X-Google-Smtp-Source: AGHT+IGs6ruuA946P6zuVAHheO6fA4ce2N15T5/3R5m2iMP4gQbVW50etvU9cRYSthEEe6bgR250uQ==
X-Received: by 2002:a05:6a00:c8b:b0:71e:cb:e7b2 with SMTP id d2e1a72fcca58-71e00cbe85amr2649580b3a.21.1728375725616;
        Tue, 08 Oct 2024 01:22:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9f6c4ce2bsm6247176a12.83.2024.10.08.01.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 01:22:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8186-corsola-voltorb: Merge speaker codec nodes
Date: Tue,  8 Oct 2024 16:21:59 +0800
Message-ID: <20241008082200.4002798-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_012206_565948_8056F97D 
X-CRM114-Status: GOOD (  12.20  )
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

The Voltorb device uses a speaker codec different from the original
Corsola device. When the Voltorb device tree was first added, the new
codec was added as a separate node when it should have just replaced the
existing one.

Merge the two nodes. The only differences are the compatible string and
the GPIO line property name. This keeps the device node path for the
speaker codec the same across the MT8186 Chromebook line.

Fixes: 321ad586e607 ("arm64: dts: mediatek: Add MT8186 Voltorb Chromebooks")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../dts/mediatek/mt8186-corsola-voltorb.dtsi  | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
index 52ec58128d56..fbcd97069df9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
@@ -10,12 +10,6 @@
 
 / {
 	chassis-type = "laptop";
-
-	max98360a: max98360a {
-		compatible = "maxim,max98360a";
-		sdmode-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
-		#sound-dai-cells = <0>;
-	};
 };
 
 &cpu6 {
@@ -59,19 +53,14 @@ &cluster1_opp_15 {
 	opp-hz = /bits/ 64 <2200000000>;
 };
 
-&rt1019p{
-	status = "disabled";
+&rt1019p {
+	compatible = "maxim,max98360a";
+	sdmode-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
+	/delete-property/ sdb-gpios;
 };
 
 &sound {
 	compatible = "mediatek,mt8186-mt6366-rt5682s-max98360-sound";
-	status = "okay";
-
-	spk-hdmi-playback-dai-link {
-		codec {
-			sound-dai = <&it6505dptx>, <&max98360a>;
-		};
-	};
 };
 
 &spmi {
-- 
2.47.0.rc0.187.ge670bccf7e-goog


