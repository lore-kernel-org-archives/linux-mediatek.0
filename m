Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACE0CD4851
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 10:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6ywYk7FLqn3ZWRTSSAPnaG63s5r8m9iMZ44l9N16Yg=; b=WJTurNRrZEmMbFD37VBAnc2DiI
	3qxR77jf+gt+I9nTFoeOA5EIZx82Ajks3z+dBW2NjP5bZVqgEkB3+qgz+SC786elg4rAeGcg3YOJ0
	ipXtFLrMWLTW4CDhD1KHWG1X4d+w3L7FuXSAdBig7qj6K5/Qii5I2ITYXI6pHHp1rZNcdy3X6JVxt
	uWgoyoytrEl3iRkMN7KBYB7A2SP8/AVYq0GGUenGDHs6RuH7TVKvBWZuqnBCM9JGBioaZ+gw/XvLS
	2V+ttxtLkS2RZPctXgTpAmR8U4ilH0XV1Z3sxyD2Fdf6fEpx00JMAcwujU5VqdX/asdeeTGgpfzhS
	V02maFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT4C-000000059wf-2Hb5;
	Thu, 14 May 2026 10:13:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT44-000000059pw-1mkv
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 10:13:15 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82faf871346so5756938b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2026 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778753592; x=1779358392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6ywYk7FLqn3ZWRTSSAPnaG63s5r8m9iMZ44l9N16Yg=;
        b=CARzWmofQAFVmwLBlXZzG1KsWaCaT8JOKuXP8GD+ZhKC4rqSh0ii8qyTsRuIJaHyG8
         IWcMWS5SSaaYP24PerJMZQ8JLAIlsqR/JpLzGSlDQ9QwHGhcObUTN1onrDvIpyYCHSof
         3gp5ctiWYGIKdjgDadLlnicfrtn7yiR33cKs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753592; x=1779358392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6ywYk7FLqn3ZWRTSSAPnaG63s5r8m9iMZ44l9N16Yg=;
        b=CDGMyIkVHHGy178M5QHpMm7lyzLbBKN98p5GVh6M83P4zH16IBaDbKj6X8uymY/CkL
         9JJ1Bk7fkcdtTMsEN9IeXuatprWbWylDWV6Rbc0y+FrWhor7ldB6S9u8XjROuKtG60Po
         UB1wSaVMtKDdbca460STokETNEBI7osGZo/fmR9J/1hny4Qtb1XbzkLBOwj8imWd6p8b
         p5h+1ofuFFfGCUX9UY3WFc0/sXY9TNGf05o/zp6ns35+XTnFYvW1IYI0CijE5+7mgv49
         gmWQEzhsJq/2qFly++SJt2Qk0ED51TjiRMD27n+rzyTLw24Mrqev1KXonf0M7Ugn15Vk
         +P8g==
X-Forwarded-Encrypted: i=1; AFNElJ/X0cYWDb0WpgO17+jK9RXxC5RXOJzolKshBSHWhLxmWTXdLYSsdXCBgqh/Zw71kGKpJY9/MZ6inXzkAnE34Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSZ06E4bRXZ2nr8UiDdGHk2bXloOhuXgrMoUz2xLh2upoU8/OD
	2JplIvKzzhdPMMhvRJfL5DPmBFiCXthyR0VgRCXIa4eMrTSK2EpMtE/Q5ZU5MEgbotSG+dbS2o7
	31O0=
X-Gm-Gg: Acq92OEfYSuSD6yIoz7NoUA1TWVfuf+11zRfnKPT4AfeQjrYnoighMTBxqIed2qCsEq
	hD21wB05m0RzrQOHZ2u8G7NiiZegK19DbBqKVsl3RySNG9bEExNIHSbvOEk3PtjXswBqkLQzbMo
	8J/+wMrMonh92ex+kQVDjGZ1nDkR5lR8H2ufRbXky3/B15wRLmUR8T33HyUM4XanaGoogXa9E3y
	aaYEKmpW0PwftVCc0ILNvH08XQ5s1QiwxZqRPLm14FSflqa71DUjd8yfTrv6cvTm+fnJfGVoWQL
	MM/TU2ZiGWMYaH4cT9krhrrJYt4qiteKQL+O1RqUiVFxZXFY+GITMbiW17u5/xv6LKrGr7lVTGI
	cNMiiMbTpus1iLqBPB0h8rhWCuccIF7xoNiVScJHv1qjh/f3g4VYntbYbHMrINpaKEZ24YEp2E6
	R6Fw+itlQqnqC0oH0nL5gMd9GkIdk+ZDjcIAmJdPijTix3DMfRneOob67cf2s0bpEfmo1a/xIug
	UBIdFlyVyQWPYXaSlM=
X-Received: by 2002:a05:6a00:439b:b0:838:127d:a161 with SMTP id d2e1a72fcca58-83f03fcc5afmr7790644b3a.18.1778753591788;
        Thu, 14 May 2026 03:13:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm2898427b3a.2.2026.05.14.03.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:13:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8195-cherry: Sort top level nodes correctly
Date: Thu, 14 May 2026 18:12:52 +0800
Message-ID: <20260514101254.2749300-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514101254.2749300-1-wenst@chromium.org>
References: <20260514101254.2749300-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_031312_468402_D2FE6C53 
X-CRM114-Status: GOOD (  11.69  )
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

The thermistor device nodes were added before the vbus regulator and
reserved memory nodes, when they should be after them, based on
alphabetical order of the device node _name_.

Move them to the correct position. No functional changes intended.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 94 +++++++++----------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 538c46ada32b..ef7afc436aef 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -149,6 +149,53 @@ ppvar_sys: regulator-ppvar-sys {
 		regulator-boot-on;
 	};
 
+	usb_vbus: regulator-5v0-usb-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vbus";
+		enable-active-high;
+		regulator-always-on;
+		vin-supply = <&pp5000_s5>;
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scp_mem: memory@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x2900000>;
+			no-map;
+		};
+
+		adsp_mem: memory@60000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60000000 0 0xd80000>;
+			no-map;
+		};
+
+		afe_mem: memory@60d80000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60d80000 0 0x100000>;
+			no-map;
+		};
+
+		adsp_device_mem: memory@60e80000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60e80000 0 0x280000>;
+			no-map;
+		};
+	};
+
+	spk_amplifier: rt1019p {
+		compatible = "realtek,rt1019p";
+		label = "rt1019p";
+		#sound-dai-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rt1019p_pins_default>;
+		sdb-gpios = <&pio 100 GPIO_ACTIVE_HIGH>;
+	};
+
 	/* Murata NCP03WF104F05RL */
 	tboard_thermistor1: thermal-sensor-t1 {
 		compatible = "generic-adc-thermal";
@@ -219,53 +266,6 @@ tboard_thermistor2: thermal-sensor-t2 {
 						120000 51
 						125000 44>;
 	};
-
-	usb_vbus: regulator-5v0-usb-vbus {
-		compatible = "regulator-fixed";
-		regulator-name = "usb-vbus";
-		enable-active-high;
-		regulator-always-on;
-		vin-supply = <&pp5000_s5>;
-	};
-
-	reserved_memory: reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		scp_mem: memory@50000000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x50000000 0 0x2900000>;
-			no-map;
-		};
-
-		adsp_mem: memory@60000000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x60000000 0 0xd80000>;
-			no-map;
-		};
-
-		afe_mem: memory@60d80000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x60d80000 0 0x100000>;
-			no-map;
-		};
-
-		adsp_device_mem: memory@60e80000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x60e80000 0 0x280000>;
-			no-map;
-		};
-	};
-
-	spk_amplifier: rt1019p {
-		compatible = "realtek,rt1019p";
-		label = "rt1019p";
-		#sound-dai-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&rt1019p_pins_default>;
-		sdb-gpios = <&pio 100 GPIO_ACTIVE_HIGH>;
-	};
 };
 
 &adsp {
-- 
2.54.0.563.g4f69b47b94-goog


