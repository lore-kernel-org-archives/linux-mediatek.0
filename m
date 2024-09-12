Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354E4EED615
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 15:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c1KFFXITdKh/UNVDhGRYZ7z1/sXibi1fC5DJLFmUObI=; b=Y+JXAaQNLtOaAJxs3wdwcmAEoW
	E5jnlpl8NJvMSE7rUeXpuv3KOSEmdqw7A5D68iHvZiFdkC30xuF0fZTC5vP3aGtLb2RpUPlnY/3i9
	FdPGCHEIesKcnXXEdQk98F2XBYm8CrSE49bVR3z/t9Wy9jEukDqVjSfLsqJoO1GFtOx786qkUedlS
	K7hH987ufLIFVwCX+tv8w8jLnDkXHxg4ByQSVvZZerEuXXedQyjQMbKKRPuO4DiDCAxhqvxj5WYTF
	bAt6vmw4ri/IrbligYY349r16a53tBatA9LqOAgFS4cEKy3g7ledKSnKwaDXjqsYjEJMUEXU0yLha
	MFnmTZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1som0D-0000000Dbgv-1T7d;
	Thu, 12 Sep 2024 15:45:01 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1som0A-0000000Dbfl-2G9H
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 15:45:00 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7163489149eso994957a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Sep 2024 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726155897; x=1726760697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c1KFFXITdKh/UNVDhGRYZ7z1/sXibi1fC5DJLFmUObI=;
        b=LOr43s1HcSa2ZqffT2ST0/uehq6oN8nlHa7De1mFd0Tbfc43yHFnA5s3OvQIhQCd1K
         ZVxFdHQrnibUNy5UKt0muJjsQDrf3KEIU65UoDSmicbhrhASx1pWh6kcm2kKpC2cnYng
         Bc/Rd2ONFHV8KuKMxUNETW0ld00kQSlFmn2P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726155897; x=1726760697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1KFFXITdKh/UNVDhGRYZ7z1/sXibi1fC5DJLFmUObI=;
        b=YlJwp2+G0qY8hrJExS7pQmTKGQpdiWFp89WQV923X7PdYvkp0AKCSDaj4HtDT9gTUE
         xNBia6u+G6L5DgHUY1Cc8KZrULZcEppG+lXLmpv5OXGI+6Zd0qWHvObd/MsUxvSWvQH1
         GuBuGDvYFk0+tqGC/1OJMYlQoZmyzYNnYB8Ys6fg4kAqusG8VC4EuK7ynBFj8OjkzeeN
         ILYz66oAOo57P215sC6906TC3AXh4/rQDhk4pxSyjMG7y37g7W22fIkFxlTktxjdgkad
         foYFatxMETBivcPM16S4avjnFX9IJEov7QwlDLO9hqgRzT2aTKMRuFzF22xJkX48hwgl
         A+bw==
X-Gm-Message-State: AOJu0Yxsez3LVQR9+SpLp/Jn+qtSGjuu0UPhXqPoYtk8q5oV3LnJ7EWl
	twZg2BowocZpG+uC7ygcU1amWQe73kOXMWXZZ0HY7oRuS9GijFbgazKywRGhZw==
X-Google-Smtp-Source: AGHT+IGceJb5ON2QNnGfniNjs+7jlg3UmQfUeN5Y/7jmG/+KHg45rsa/zeM5LdGm1y6Xl8ZubgzSaw==
X-Received: by 2002:a05:6a21:10a:b0:1cf:6629:f42a with SMTP id adf61e73a8af0-1cf76253369mr4671233637.42.1726155897269;
        Thu, 12 Sep 2024 08:44:57 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:8638:897f:b6cd:8c44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7190909235csm4751353b3a.134.2024.09.12.08.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 08:44:56 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support
Date: Thu, 12 Sep 2024 23:44:29 +0800
Message-ID: <20240912154451.3447081-1-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_084458_626114_66A4DD14 
X-CRM114-Status: GOOD (  11.17  )
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

Some spherion variants use Synaptics trackpad at address 0x2c in the
I2C2 bus with the generic HID-over-i2c driver, and this cannot be
distinguished from the firmware compatible string.

Support both trackpads in the same devicetree by moving the trackpad
pinctrl property to i2c2 and adding the node for Synaptics trackpad.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 .../boot/dts/mediatek/mt8192-asurada-spherion-r0.dts  | 11 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi      |  4 +---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 29aa87e93888..8c485c3ced2c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -79,3 +79,14 @@ headset-codec {
 &touchscreen {
 	compatible = "elan,ekth3500";
 };
+
+&i2c2 {
+	/* synaptics touchpad */
+	trackpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
+		wakeup-source;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 08d71ddf3668..8dda8b63765b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -335,14 +335,12 @@ &i2c2 {
 	clock-frequency = <400000>;
 	clock-stretch-ns = <12600>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-0 = <&i2c2_pins>, <&trackpad_pins>;
 
 	trackpad@15 {
 		compatible = "elan,ekth3000";
 		reg = <0x15>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&trackpad_pins>;
 		vcc-supply = <&pp3300_u>;
 		wakeup-source;
 	};
-- 
2.46.0.662.g92d0881bb0-goog


