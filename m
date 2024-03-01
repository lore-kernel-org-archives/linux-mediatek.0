Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B60C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=blIn0p2u3QS9iJ7wxkzaIEJOBeHVH2WoSM8ME7du+Nk=; b=JvIn6iUv8trwAdok/arjXS2Jz4
	FnU88Iy//yRg5JADq5F9iesQNkazYsSxvVQZlGuKrAYbBjONeodAhTS1my8XR27ihtQkHgpP02KlC
	IvQy8CINrIIIt2ChrSbhfdaiU9ydVyRi2yB2KKDW9g3qWQfSt1dwsFeSN3sNn11o+UN893C8kjU8w
	V4lE9KNtU5KEy3wdOEyqn/8nnB1gdnYT9KSjreDQjtHDBpv4ZWMU6nFkOLwumuEWD2mTNrtnlX4Ir
	sTzP2BBZC/OGliSoeYHxTHfgq18LY0aJLNysoEQtXXVjaaJpdlkKCkMisYAFEeoqXocroLIVn9Y57
	BdcJ9EAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfxco-0000000GmGs-1Ygc;
	Fri, 01 Mar 2024 07:48:10 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfxck-0000000GmFZ-2x2c;
	Fri, 01 Mar 2024 07:48:08 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a3e7f7b3d95so258701766b.3;
        Thu, 29 Feb 2024 23:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709279285; x=1709884085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=blIn0p2u3QS9iJ7wxkzaIEJOBeHVH2WoSM8ME7du+Nk=;
        b=AAAy1TjR601bT1T4fQWuGybMVbDhxbGWa0CZPGErOJTpCkkEGmWSSU0mJ6z29ZkGqs
         gEhE1uCBzmek+7KUXokchh6hjNlDb59vpZOMH8LUKgW06gu1azlZu/SXkYFPFIbCXQml
         CCfNcl/IxIunvvyMFYiGEKrZQDvJFK69vIuK7r6y/2Hadzkhjdu/bEkdUWZ0OGMotlQp
         5EbvN9I485+f4t0CraOiGakZ69pzPP5mT49S5qg6oi5CcEWBR4ZBLAg8KxxKF8JQqE+V
         5tyDmFZNs9eqgE8X1jGJXq7kVcXDVBCcvPzEi77kUYp8r2dw0x7iMbWs33BXmDQLtNdu
         pKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709279285; x=1709884085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blIn0p2u3QS9iJ7wxkzaIEJOBeHVH2WoSM8ME7du+Nk=;
        b=CR70dLXYPK6sOUgwsPHSvU4L1rLeMvsUymTFrSLMelx1nthtD4l50KfcdsYBoXIAsi
         1ZJmup0SiCnL5zs0PlIvhXTKFerTTntOuY2kmVLAV4RshxOEsKUTvkpwzN4gwwtIb4hm
         T4hn8gOzPzq86s7bWWyPvIDnm4tU6yEUmRoN8HW/tJU24QMzfAFozXxF6VVgHyfOPZ41
         tLYcCSLjX62KeOH6F9H4D/JvKaCBV8lTN7+Wlk0wV6wfYSw/rPQmnw2ZKHTwogDSS+q5
         oa0QhP8zhI7m95Q0RJ7amxWkhZ8ZezZh19RS4bgtA/RH4F+LF1jcIihMrDvcQ+X+v//p
         LRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg8Mnad6TsDjlZ1tZezlER0kXLnEB/YmOKhXIg5GExUtfzU1lCcoDoNIaTUd2q3xqVEHcicgMyBjJdLglUCXgt/Vg9IgVgcJ9vihby9F3UvyVfAu/f2T/t+kevbLxLguf5LwfMI6utvthS+fMPH76uaHIzCZJQytI=
X-Gm-Message-State: AOJu0Yw602aEcQBv1Wxn0Am9k5BQhlmo2Mpht/sL4nZOJiuDxa2Yln6r
	4FA3FcBf/whwgI01x/dSBWcqh5Se6H7h01ObfndpwtwRsjUAOWCg
X-Google-Smtp-Source: AGHT+IGjvcG3NiU3BthL7n7m+TBWOhPmabQI29Jtj8gY4+rhklgDETXkIcNQ2rOzg+GWx51/qkCVIQ==
X-Received: by 2002:a17:906:c49:b0:a3e:e678:556 with SMTP id t9-20020a1709060c4900b00a3ee6780556mr646579ejf.58.1709279284547;
        Thu, 29 Feb 2024 23:48:04 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id f26-20020a170906139a00b00a4417c46efbsm1438684ejc.82.2024.02.29.23.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 23:48:03 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] arm64: dts: mediatek: mt2712: fix validation errors
Date: Fri,  1 Mar 2024 08:47:41 +0100
Message-Id: <20240301074741.8362-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_234806_768895_C3F37CD6 
X-CRM114-Status: GOOD (  11.97  )
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

From: Rafał Miłecki <rafal@milecki.pl>

1. Fixup infracfg clock controller binding
   It also acts as reset controller so #reset-cells is required.
2. Use -pins suffix for pinctrl

This fixes:
arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: syscon@10001000: '#reset-cells' is a required property
        from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,infracfg.yaml#
arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: pinctrl@1000b000: 'eth_default', 'eth_sleep', 'usb0_iddig', 'usb1_iddig' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
        from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts | 8 ++++----
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi   | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
index 0c38f7b51763..234e3b23d7a8 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
@@ -129,7 +129,7 @@ ethernet_phy0: ethernet-phy@5 {
 };
 
 &pio {
-	eth_default: eth_default {
+	eth_default: eth-default-pins {
 		tx_pins {
 			pinmux = <MT2712_PIN_71_GBE_TXD3__FUNC_GBE_TXD3>,
 				 <MT2712_PIN_72_GBE_TXD2__FUNC_GBE_TXD2>,
@@ -156,7 +156,7 @@ mdio_pins {
 		};
 	};
 
-	eth_sleep: eth_sleep {
+	eth_sleep: eth-sleep-pins {
 		tx_pins {
 			pinmux = <MT2712_PIN_71_GBE_TXD3__FUNC_GPIO71>,
 				 <MT2712_PIN_72_GBE_TXD2__FUNC_GPIO72>,
@@ -182,14 +182,14 @@ mdio_pins {
 		};
 	};
 
-	usb0_id_pins_float: usb0_iddig {
+	usb0_id_pins_float: usb0-iddig-pins {
 		pins_iddig {
 			pinmux = <MT2712_PIN_12_IDDIG_P0__FUNC_IDDIG_A>;
 			bias-pull-up;
 		};
 	};
 
-	usb1_id_pins_float: usb1_iddig {
+	usb1_id_pins_float: usb1-iddig-pins {
 		pins_iddig {
 			pinmux = <MT2712_PIN_14_IDDIG_P1__FUNC_IDDIG_B>;
 			bias-pull-up;
diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 6d218caa198c..082672efba0a 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -249,10 +249,11 @@ topckgen: syscon@10000000 {
 		#clock-cells = <1>;
 	};
 
-	infracfg: syscon@10001000 {
+	infracfg: clock-controller@10001000 {
 		compatible = "mediatek,mt2712-infracfg", "syscon";
 		reg = <0 0x10001000 0 0x1000>;
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	pericfg: syscon@10003000 {
-- 
2.35.3


