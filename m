Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB1BC43602
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIWHnFcEQq2TBgkIFQBCpLfgyHT2aySOS2MIMPq9LZ0=; b=os7L+XI9Wmk9PnQFikGT5thete
	y/4z7XhbqSLOqsrrN3Y6wjsGFvRoEzsaxpBFUujF35asftWzPu1XXsqDkHh/v84XsqpvcyigOKKZi
	x+5K7dQ43y0pk0RbK1zXD3RHjKELdr4PT62swv/Z9PKV4OcOPw/eatsBogGyHdWRb5bRMFFfvw6Ec
	qvSyKlbpKgDZevBjV8xrSayFXzOYqr6l8w7CmvDyCEsqEl8gMHDxwpVlC8L7lRZJr71XeMxbXXIuG
	HaQHXOkdo71Yx5kqp4CLJB2m+oYbsZ3uIpdNm8lW3+yuEDEHRKFzjKFHy4fLMQ+ZwxjdiNn5VRhZN
	EiK+mJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVY-00000006s1q-0VKW;
	Fri, 03 Jul 2026 11:56:36 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVV-00000006rxX-1SXI
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:34 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c85d4b4245aso328034a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079792; x=1783684592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIWHnFcEQq2TBgkIFQBCpLfgyHT2aySOS2MIMPq9LZ0=;
        b=aVkMcdQ1NYm9Ak71RhP/9Dccr2DhRPlXfDCzxuhMwM5Co+g2MNQtkbaotJZGvga/bK
         yAIoFRTOS1zYZZhichq6XVI5RmQ0/5/oAALCOAG2NeKc2wozPfCAouBEZjVYXiyiBLb+
         my/NiZQ2A0rbV0d1THHGczmXjb7R6mJxnQKts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079792; x=1783684592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIWHnFcEQq2TBgkIFQBCpLfgyHT2aySOS2MIMPq9LZ0=;
        b=MMwpC1qVO22Ovh6fjuAKSIS95ovnRkCllgQNHi+kAc6e5qvSVh0BSHDViOUpM9dfoc
         DeAOz2JhpLe7Bnmim07qUBjIRMZ09kj2gC1sKLZvQckUKZ1JQCVYqOzPaZLb6VPlLihA
         zs2M8i1yvYDKyl+wPi+9wMIXWQXGV3yANxxCz5No7LqW2gBxhOg9Hcy5BRTDnOS2kcHx
         0/TF8tzwZfb7BSiRXVuHG5O9RboZNsxFCkzFBGEG9lMnlaDJUi1Fgj9w6pNdzLh3n0iW
         0Hf/S0iunvFYRePU/cZAtjKFqx9zPEacHmw1nO1N7x7+4bNEd/yb4Vyr00/GYMib3oBN
         RArw==
X-Forwarded-Encrypted: i=1; AFNElJ/AVxrTnzPz0d877e69+EpKeAVfVWe7j4X8+aybUMaP0EkDK6Fqw0V2afeBayjX/o2dRkXxLDGzqqFPk4Jt2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBaXI6alC+gRtwotYsuTClNr1OQsVFTOJmEbA8PM++08aC/BsU
	cJo5bWgEnr+NNbd68HO/Ihdm+wUh18Oxm50RB7JyfCuexISQH8OcZF7S0oIKULgUCA==
X-Gm-Gg: AfdE7cmNLFaKm+4qPcHtBXrkTW4J6gb32PL4PpcpMXwNNata1YeMDMzNi2v9Vj6buo3
	62fgYgl1itWL6EEF+i9wafY2DdqKnxYJW7j/hpdPL+luXcVSRbWqZ1UVxN0TDqY53BkI9jCtGvJ
	u2nYyt5Bhrxn6XebqSrpNf8Kq7BjsI2/UtEXdoYkUbxuivKVt1mDydWjVtBUbhN/iBer3yQR41x
	5lyHexNZc5n45KGyIxLSx6vIQ8QdMnIE/uK9TJsQMH8P0TJuXYRWKt5N32ElrnXvUieyAHhKWhl
	+ghw6D+UbxJc/nlRIsxLsTSlCf4oQB49E0PqFADqPW3mBfs/gH5zzWTQrKyhhQcji/gc1mhmW1C
	mIhvv2yxYwX/LDWoFVfoETp6O/cMtWtJHvQzkrK8PcRd45uFpE199hCzO7TZSzzLWmUmIW1Szy5
	SsYyTxxRZ4NTiMuCX1/XgtNQ1kkKJaNIWYXS6k7RT71P4+UfGbRK81FcFnJXzMh9U2lsMR/A==
X-Received: by 2002:a05:6a20:2d14:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3bfed1bf5c0mr13230564637.15.1783079791119;
        Fri, 03 Jul 2026 04:56:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Fri,  3 Jul 2026 19:55:59 +0800
Message-ID: <20260703115601.1323491-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045633_392265_315BE293 
X-CRM114-Status: GOOD (  16.36  )
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

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power up, with
opportunistic skipping of the delay when the regulator was originally
on. The I2C HID driver gained similar opportunistic delay skipping.
So has the I2C OF component prober library.

Now fix the device tree to have the regulator not be always on, and
let the I2C HID device have the correct post-power-on delay time.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 +-------
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 1004eb8ea52c..b9e311fcd9a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -62,13 +62,7 @@ trackpad2: trackpad@2c {
 		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
-		/*
-		 * The trackpad needs a post-power-on delay of 100ms,
-		 * but at time of writing, the power supply for it on
-		 * this board is always on. The delay is therefore not
-		 * added to avoid impacting the readiness of the
-		 * trackpad.
-		 */
+		post-power-on-delay-ms = <100>;
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
 		status = "fail-needs-probe";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..6b9f47f515c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1093,7 +1093,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.55.0.rc0.799.gd6f94ed593-goog


