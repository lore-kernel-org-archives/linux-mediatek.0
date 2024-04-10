Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4215FCD1297
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 06:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e5v4LfNlblo2WKgRAn2D3NW7xqD55htd+EO/6vEx8Ak=; b=iF7NMVXAcydpulCQfvPgUVzBDY
	62LZ08CQ52RMiKoX+vpst1KN8OrA4SiF1eFMx4Tg8CjqBB8mWCqS9eZbb8dFs0eyXwteEYimTOcxj
	N5kDZW6TQvGiyd6DD1Y9DNZLadgSvyBq10fUZ8D16zHUmSdVLZufCWg9Jzh2gMgG8NM8b9AAsFff6
	DbRbJ+MpKJ+07iNEc4/+lprxG0xisqL4sgzPABt+KbkMUCiAjnsxBUFuvmpslgsNUUkAYWEuy+7ja
	l7UUihw9zs93yTFuz2K858YaQE3AwuIzHOcfYopTXLkNmDj0ioIajHP6jxH8cyTp/hE8nkcIk9eXq
	ov266Cqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRJv-00000005M7B-18P6;
	Wed, 10 Apr 2024 06:20:31 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRJr-00000005M61-2sxJ
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 06:20:29 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ecf3f001c5so5264835b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 23:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712730026; x=1713334826; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5v4LfNlblo2WKgRAn2D3NW7xqD55htd+EO/6vEx8Ak=;
        b=oCjSww4RIqjJ+swGipsSyavesOKx0loas9rA1j2Rk6L7+5UeOxJNjgmAqgXP47FxkP
         13HLN4AuVOMViUaWKFeaG3FS0zrB5T23huhGxZUKLQFXVwTT49q9OfnCCKFFBAD18VtK
         8M3UACPifJZJi5v11rVV1nhHwIQwbvkWzv2hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712730026; x=1713334826;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5v4LfNlblo2WKgRAn2D3NW7xqD55htd+EO/6vEx8Ak=;
        b=ZyIq9M6dpyS41YMGcU8QjeTs8hFvsMeJkXTo74el3p68GKmKhh6A2Cg/hz+vh5+V4r
         hFPCU5s81Z0A2IbPZpyKBx9etpCOKN8NexJdNnxsKIVD+5IJ/dVVk6yEzxzICcYcEkOV
         pGeL3wvvuwtFvKUhkT6uj39R8XUP4N+llJhWDRU1GXnYVUc9aHSXSliP7gGmCesnKCFa
         msjWuueL8lU+2s/SzYe8lExeO5/26NZ4HvwrxSynsqDBCJERupepxdng8yBRFv7hAB1j
         MHozCgtJU9xFOYug2FBzE+ge4wVjIRSE35ptu0XOqCThq5JysrrS8WwpimQ8PguRTleX
         vJFg==
X-Forwarded-Encrypted: i=1; AJvYcCXJiyKSwVj3A+Pcbm0ycAfeJPBsYUO0HBNHdUMj3e+XthriipQUYPdIwvguTwPUezJNc3Ev+M+uQz72uDv6cp8ZLn8JxDx40DsRLQ2Bu7vbneFf
X-Gm-Message-State: AOJu0Ywqvs7/jHwsusHlvQx32qxWnqz0BJjdUaeFEx7y/GHv2vhJYKpe
	ySVJKij5+ibk5kvM9UGI8e6fm30lY0B/xLRDdZXMe9hLH8ryw+7kcqcKUwEfUQ==
X-Google-Smtp-Source: AGHT+IHAta98FxLNG/x0sc1YsRsry9ENklaCOvy0ZnfjzpSfwTLrCO0ZpnFeZ9TC6+QWoa+lKUCVCQ==
X-Received: by 2002:a05:6a00:21c9:b0:6ec:ee7c:141c with SMTP id t9-20020a056a0021c900b006ecee7c141cmr2087534pfj.16.1712730025858;
        Tue, 09 Apr 2024 23:20:25 -0700 (PDT)
Received: from yuanhsinte1.c.googlers.com (88.216.124.34.bc.googleusercontent.com. [34.124.216.88])
        by smtp.gmail.com with ESMTPSA id lb14-20020a056a004f0e00b006ead47a65d1sm9411384pfb.109.2024.04.09.23.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 23:20:25 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 10 Apr 2024 06:20:20 +0000
Subject: [PATCH] arm64: dts: mediatek: mt8192: Add missing trip point in
 thermal zone
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-upstream-torvalds-master-v1-1-852e903f0cec@chromium.org>
X-B4-Tracking: v=1; b=H4sIAKMvFmYC/x3MTQqEMAxA4atI1gZa6Sh4FXERajoT8I+kiiDe3
 TLLb/HeDcYqbNBXNyifYrKtBb6uIP5o/TLKVAyNa4IL3uGxW1amBfOmJ82T4UKWWTE44pQ+wbe
 xg5Lvykmu/3oYn+cFMVnATGoAAAA=
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 Balsam CHIHI <bchihi@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_232027_738408_406A1BE7 
X-CRM114-Status: UNSURE (   9.88  )
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

Add the missing passive trip point which is expected by kernel.

Fixes: c7a728051f4e ("arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 05e401670bced..08d8bccc84669 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1959,6 +1959,11 @@ cpu0-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU0>;
 
 			trips {
+				cpu0_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu0_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -1989,6 +1994,11 @@ cpu1-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU1>;
 
 			trips {
+				cpu1_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu1_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -2019,6 +2029,11 @@ cpu2-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU2>;
 
 			trips {
+				cpu2_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu2_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -2049,6 +2064,11 @@ cpu3-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU3>;
 
 			trips {
+				cpu3_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu3_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -2079,6 +2099,11 @@ cpu4-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU0>;
 
 			trips {
+				cpu4_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu4_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -2109,6 +2134,11 @@ cpu5-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU1>;
 
 			trips {
+				cpu5_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu5_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -2139,6 +2169,11 @@ cpu6-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU2>;
 
 			trips {
+				cpu6_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu6_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -2169,6 +2204,11 @@ cpu7-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU3>;
 
 			trips {
+				cpu7_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu7_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;

---
base-commit: 20cb38a7af88dc40095da7c2c9094da3873fea23
change-id: 20240410-upstream-torvalds-master-40aeff5416c7

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


