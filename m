Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B15DC47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TxqUCZUmsP7DgZniUm0/38xJfKfkBwtdPc5aQ25lcnU=; b=Uu7S/o3EBgLyKJFzIz4Ro1qT0B
	lzCEo/6TPwN1gSOCpTSiM1yxDNHFNT4lMH4vs/GNtZ2U/QblB7S9Ej306lAnQ4vh1sIBmUcX1x/5l
	EiLcYZtYbS1oEJqxARmhBG6j9eL8zDqY2pUqtKp4a150TIqrJLaMMmafVdER56vRef3eakB48CfK3
	k/Y9VSaNk11MXtV7AdtF9wjrvbBe8NwHLrvcXt7314cfwPkBVzhU9CJAvdUAHQGlVRQbQw70/ymYR
	q/L9N9s9C+sK1cB3uhda19XILWN+1QVbL6cy9oBsJOqZPnMgFjiD0zS9B3EiYUBUUAqI9t1cd0eEx
	1sYp/tCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV69N-00000002Ayy-3mfR;
	Wed, 31 Jan 2024 08:40:53 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV69K-00000002Awm-2Wv3
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jan 2024 08:40:51 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3bda741ad7dso4072466b6e.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Jan 2024 00:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706690449; x=1707295249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TxqUCZUmsP7DgZniUm0/38xJfKfkBwtdPc5aQ25lcnU=;
        b=C5znfCw/YzN41zhrOB2PWrm08+UukUFcUx9wqJIgjjQ0e0NoOxVs0NkdtmSKajgYcg
         9Xm4mt4GjrnfiURLKtXGrALDrWZaoytnKWyp57A+ZYrn5g721WxxE83/2pqgWXgINgx+
         eAb2PuAIia6vSC4Q8NgrKF8kUOXPermtS9oaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706690449; x=1707295249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxqUCZUmsP7DgZniUm0/38xJfKfkBwtdPc5aQ25lcnU=;
        b=l6XWZMDXzbWidXjder8q/X26uLVe7TE6i9HbAOfLzmL4c4Dduov1XV4r3VtZAD2MCL
         oRumbYFA+evsGSZuZ3ZzbVw2sR7M5p9jxVJapdZQ+lF5wiA0bw3HM9p1qefK6OKFx+KB
         FFi3cMx+Qjgj5qtO9um0z3cO2oUHzPb2qv+TeP6Nbc84OXKdDBlS+NNBxADsvGRGK1lo
         fNRXmdcMKLK1/7Zz9YHTLlIHCb0OzPiSLD7jB2vXcOJmqpf6YzAED0MQIPJk+IA+cft4
         SCt/pVmAZE47ia2Ex9LJU5lVYq3O+mIN5jpkodCaPelGyL7kOAWMWXHxWh0G8Pt7MvAM
         OVOw==
X-Gm-Message-State: AOJu0YzeM7Q3uNI1CUnwz9sfj1+5ytNLouKPN/waFWHGYtcDWQ5G3Sdt
	QP8lP6AX73yAdVieTF9PDyNz9SsSjoFtfIByUu6LVfBNMZDtGkv/OQvUj4ZoMA==
X-Google-Smtp-Source: AGHT+IH8zjEWpqXVJCV30f8ffZPJow/hwX+WfjPUWbBYzdz2Cck6xeNQQO9eY44+yWg7fTKY2uKYoA==
X-Received: by 2002:a05:6808:bd4:b0:3be:453d:7654 with SMTP id o20-20020a0568080bd400b003be453d7654mr1106395oik.48.1706690448802;
        Wed, 31 Jan 2024 00:40:48 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74d3:dadd:270b:194a])
        by smtp.gmail.com with ESMTPSA id k1-20020aa788c1000000b006de3ffa19f4sm3343454pff.0.2024.01.31.00.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 00:40:48 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: mediatek: mt8183-pico6: Fix wake-on-X event node names
Date: Wed, 31 Jan 2024 16:40:41 +0800
Message-ID: <20240131084043.3970576-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_004050_668848_28009C8C 
X-CRM114-Status: GOOD (  12.57  )
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

The wake-on-bt and wake-on-wlan nodes don't have a button- or event-
prefix that the gpio-keys binding requires.

Fix up the node names to satisfy the binding. While at it, also fix up
the GPIO overriding structure for the wake-on-wlan node. Instead of
referencing the gpio-keys node and then open coding the node, add a
label for the event node, and use that to reference and override the
GPIO settings.

Fixes: 055ef10ccdd4 ("arm64: dts: mt8183: Add jacuzzi pico/pico6 board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts      | 8 +++-----
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
index 6a7ae616512d..0d5a11c93c68 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
@@ -17,7 +17,7 @@ bt_wakeup: bt-wakeup {
 		pinctrl-names = "default";
 		pinctrl-0 = <&bt_pins_wakeup>;
 
-		wobt {
+		event-wobt {
 			label = "Wake on BT";
 			gpios = <&pio 42 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_WAKEUP>;
@@ -47,10 +47,8 @@ trackpad@2c {
 	};
 };
 
-&wifi_wakeup {
-	wowlan {
-		gpios = <&pio 113 GPIO_ACTIVE_LOW>;
-	};
+&wifi_wakeup_event {
+	gpios = <&pio 113 GPIO_ACTIVE_LOW>;
 };
 
 &wifi_pwrseq {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index a241bb70cd76..89932984889d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -142,7 +142,7 @@ wifi_wakeup: wifi-wakeup {
 		pinctrl-names = "default";
 		pinctrl-0 = <&wifi_pins_wakeup>;
 
-		button-wowlan {
+		wifi_wakeup_event: event-wowlan {
 			label = "Wake on WiFi";
 			gpios = <&pio 113 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_WAKEUP>;
-- 
2.43.0.429.g432eaa2c6b-goog


