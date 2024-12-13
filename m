Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D710FE7717D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2024 04:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I9SAvhC/1O9xhOgEJgltjPIiKB+jL/KUsbTgQGFrTOI=; b=PQWoz2GaP+/hcJoP4jvDB84A8m
	+0vTBKY3c6tH7SpHmfMOfiTMuFXbyfQDdF+clXTmlxAAIXJRnUtT9R0yLJZtJ8/Jx/2eidZa8xK4X
	Ke0YJtCjxqNpYHi5YQibDpFvYHu6pzi93TDWej1b89mOcqtT9tP0aGy3QjDIYZXePkrcvNLU+OMPZ
	9VmDY4NfY3K3o67uEiNQJu3doQaglKHkKDWYjmN9MLVnvI4w2opMeay6wo7SFBIB/gX35v6WJ3lHi
	x7vxhJ3ZYfdwOBgJVV249xxyAngGD0HYrDNDO6q26N7/YtONKbqSzuumt73v/Gl7Qiuxm6HEB3IO3
	vlvfULyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLxkN-00000002j9N-2Qsh;
	Fri, 13 Dec 2024 04:57:51 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLxjH-00000002j2b-16tG
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Dec 2024 04:56:45 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-728ea1e0bdbso1105085b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Dec 2024 20:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734065801; x=1734670601; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I9SAvhC/1O9xhOgEJgltjPIiKB+jL/KUsbTgQGFrTOI=;
        b=RO73Mfd+mlIV3skRrCK68/fwE5sKSAx7YWudX5bH7ky2jyKBn1SUJbtMzYHKQWAGkC
         WP+QMBeRGTRmbYInrauxFrx+OLAP/CMIgzUHQHA/Roe+/18Dn7kZaTuQCfG71RpcNTS4
         GXs5zHtaUuOfrl6evW+BczqDInlt85UakK+PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734065801; x=1734670601;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9SAvhC/1O9xhOgEJgltjPIiKB+jL/KUsbTgQGFrTOI=;
        b=umToESaG9VhwwGKsaQOtZatIfPkcRMmdfrFS/1m3+XfIpIsnzD9yFD8JfFHW2YvSNv
         4n+0HnMXnsf912LD3EQGxJPKq1p/6M2yGN5YJo0RSFmz8aoHFyw3zUhJqjy8mHedFzLr
         KmrKPhylA9NRJF6yG1/1lmYVoIVbe15zqlpYRdLtsWmUWJxtsYMDWVYjic6KZqIBRPsY
         tk7lOTFGV7ZeEiIX+olIhTXuewb2RxotzCTbZ0XIsUACnE1bxL0oDxV9d+9idvzIh40c
         rPArr+MX9ynkOlHXH16QgXKGAaYcwZqlv0rUdBZKSH+Se1XM8z7EewrRg/pS5ZXUcd/e
         kGRg==
X-Forwarded-Encrypted: i=1; AJvYcCUt5FP5Dn1Qu8M/n2/8P0kA/0EqE0PP7Tr8xklG3qrzC/ai02aVi+SzFCWKcfKXSTWi+FaSdvh7GxLgX/ZMVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYdTcKeozQb8RQ3jrFJ866yg6kyYXv1RaXVE2+U3JpLr94fzb8
	orbYeNLvjLT8nw/8r/vt9zsd4Kv54qMpBUNV7tsSxswVvFXTGgoB6gUse0PnGQhjZ1yxY5DTfW8
	=
X-Gm-Gg: ASbGnctMMI3+jlkdRtKRda5azf23LVTkBaoE6SPTv+EsHsOM0J0KRp9KhEFmm6TwFH9
	7OlJAGRqxlLYxi7xDtKJ3zRfVzW1UGLwkSiV/gWvMhFgcULtfjCXBUpfbweIuD4XG6MNOuovXvt
	9L+Ih4403rwTfNdU1vdxEIWCGBzNGEsh2o18sqxgD3Tb6ftV55sfO7WL48sjyFsiQCGXxJuvcQ7
	2MgsZATF8pXxar2Md+QKS2ebRvP0fiYcf2syMUaTT7OIUeDS/EYBbcEdBYNlnauWtOfinFApih0
	c92ykIYrAuNoJzws8wMbfd7EvYdKgKmZWaHxkMW+jTxp18I=
X-Google-Smtp-Source: AGHT+IGVfeYguG/ILnnKexOgC8Dj9851hNf9D996FbgoQLKq1WGOOUB6A+Iz+5HK65u7tKV9Fecjzg==
X-Received: by 2002:a05:6a00:3d10:b0:71e:1722:d019 with SMTP id d2e1a72fcca58-7290c272caemr1997795b3a.22.1734065801174;
        Thu, 12 Dec 2024 20:56:41 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e73f1e41sm9070244b3a.61.2024.12.12.20.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 20:56:40 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 13 Dec 2024 04:56:11 +0000
Subject: [PATCH v3] arm64: dts: mediatek: mt8183: Switch to Elan
 touchscreen driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-post-reset-v3-1-ec30df9b9381@chromium.org>
X-B4-Tracking: v=1; b=H4sIAGu+W2cC/3WMQQ6CMBAAv0J6tqbbWkBP/sN4KHSFPUDJFhsN4
 e8WjkaPM8nMIiIyYRSXYhGMiSKFMYM5FKLt3dihJJ9ZaKVPoKCWU4izZIw4S9eWZaOMhRKMyMH
 E+KDXPrvdM/cU58Dv/Z1gsz83CaSS1jnfVNYqZapr23MY6DkcA3diOyX9v9a51rW35uyrM0L9V
 a/r+gGvT5NC5QAAAA==
X-Change-ID: 20241018-post-reset-ac66b0351613
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
X-CRM114-CacheID: sfid-20241212_205643_335160_2A60B176 
X-CRM114-Status: GOOD (  13.53  )
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

After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
i2c-hid-of"), the i2c-hid-of driver used by some mt8183 devices resets
the touchscreen without having enough post-reset delay. This makes those
touchscreen fail to get probed.

Switch to Elan touchscreen driver, which has enough post-reset delay.

Fixes: 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to i2c-hid-of")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
i2c-hid-of"), i2c-hid-of driver resets the touchscreen without having
proper post-reset delay on OF platform.  From the commit message of that
commit, not to decribe poset-reset delay in device tree is intended.
Instead, describing the delay in platform data and changing to use
specialized driver is more preferable solution.
---
Changes in v3:
- Remove patches related to the race condition of pinctrl since they are
  not needed anymore.
- Link to v2: https://lore.kernel.org/r/20241018-post-reset-v2-0-28d539d79e18@chromium.org

Changes in v2:
- Add second source touchscreen patches since they should based on the
  first patch of this series.
- Link to v1: https://lore.kernel.org/r/20241018-post-reset-v1-0-5aadb7550037@chromium.org
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts       | 9 +++------
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts | 8 ++------
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts | 8 ++------
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts | 8 ++------
 4 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 65860b33c01fe832f3a4b2e21d24ea6b4f0cba2b..b226dfee22669d596e5b45a7cc02133ee4aaa828 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -14,16 +14,13 @@ / {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
+	vccio-supply = <&pp1800_alw>;
 };
 
 &qca_wifi {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
index 72852b7600383972d98d9b0edd40b6e99e34a85b..863f3e403de8577da41b17b144cdb17c578b2027 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
@@ -27,16 +27,12 @@ &cros_ec_pwm {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
 };
 
 &qca_wifi {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
index 757d0afd14fb064fc1de4608e65eb1a561c4dfa6..e0a583ce4a0bb18095a77d23ab8409bb80898979 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
@@ -14,16 +14,12 @@ / {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
 };
 
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
index 6641b087e7c5f3a957e43ac985137dfd84ac7878..7874c9a20e124c65ace3f90e2ec5bcaf59b69c40 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
@@ -14,16 +14,12 @@ / {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
 };
 
 

---
base-commit: eefa7a9c069908412f8f5d15833901d1b46ae1b2
change-id: 20241018-post-reset-ac66b0351613

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


