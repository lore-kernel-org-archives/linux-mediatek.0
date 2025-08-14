Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E6CCA0ED1
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Aug 2025 09:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=enM03Y+SofNC9f2L6BJ7C/DVoLrJlmtDheNAd8lIknI=; b=BYgSCilMDHJ9nw
	O7pYXZrO+Hz8zWP8XKFtfee3dYPMQHM4AtOWyMTLoMy0h3BA7jUuX8/jd/Wr2XmQXI7cOi0HNy+sW
	x6Ny2klF++8Mh7MGUzPlNKD81FeC6Cm2AbyvDW+ebsTiZXyBLsy+JppHoPpLyIKufrr7YOKHbYzlB
	oqm7voaVV6p7ulTkAORS+T/RMH38rd4im1ndWpWa7dukTQJ3Qi+XO9S+fDs4T7aDKTBegCyK+AU0/
	3SA1M9dbc83VNMrqF9ct+TxqYRNdcuUsxiRUdD+TcYBQMaafNvaTntWuKXgak4/MUKjW/rkoyv/Vp
	tGW56oJLJPPd/aRGSQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUhA-0000000GV5T-1oY1;
	Thu, 14 Aug 2025 09:56:28 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUCy-0000000GOZ8-0Z82
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Aug 2025 09:25:17 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b4717553041so524721a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 02:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755163515; x=1755768315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=enM03Y+SofNC9f2L6BJ7C/DVoLrJlmtDheNAd8lIknI=;
        b=NCRhMuSV1MhMkDHPRxLSHwn120ud1jkhL9H1bHAt6nUo7MwbScaBZXi+4oW5wjj8b7
         IsY/y7h6plMyxe5Zpfd5EyVGae29K92e2xQvuKZN2OZigc9dK9AK0iZcyZFa8VXeiw+4
         bzjN/blahJvJb9DFbHq40/AC15bHuyCVpkzZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163515; x=1755768315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enM03Y+SofNC9f2L6BJ7C/DVoLrJlmtDheNAd8lIknI=;
        b=i0X1JRmfT2YgH5WgRqdyqv5dhAKWufMhl0nCjlWdM8ZfIxp+JwJOI5SOVXWqq+nDrY
         63PzzTa7mv6O5qd5tUffqOg746fZc6l/vH0Zg5LDdihe8jQxmx1P4QNxGUYV8dBplvRE
         naV6U35SiI1v0sCOe1MqMuqO8p0NdYttmT0tcRARfgywXHqpOER0VfWgCO4yA4Ky8ikM
         ptq7AVsArxozX/aDrRfhj8SI3PVXIVA2Pcc0kloltUwm2qcKNB7inPSDxqxSY2SfA5X8
         2ZD2rUjwnJ3Q6yoGhq0yYeFKK2P9Qbrbp4eTc1jaKGH824ok1+Fy1GrvAX2H9aGnDYuS
         jMwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn3yB1bH+toVAP6VhE9p/ulvflnZOcB0PTgMb68YAC22coy6+00phG4+t6IzTKk5WSv3OpSE/cT0jiqC370g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRUxlW4PaIagOfMNaARae9+GID5eOmE8Zg+Vo+AjFQWwCBJFZy
	YXoZckLGD7ccdUFinszf0gj9kZdWg18X4Z4j19x/hkF3fIMvyaPcsDPTpGhPXNLVAQ==
X-Gm-Gg: ASbGncuGIZGxC0sOC/eG84gUXCHZVELKC7PLa7SHhArqIdlfVIB5ZTWuzfDIL7s7r94
	D4oFY+pkjE/4HKM7NMlx4vZioF87cv8WvhGDyj4lsta0R1N9HDysKNGWgAjlU7inI251LQwy/rt
	M+KpeBetH9QtoMBXRp6N5lq9N7u26C+6UzS/w/0IXj7MlnVDgETDrBzF4jVq0uki+3WtOcvFjWD
	+3N4wvEt3OXqCgfG+Y4RG6aleOt2L12XwVW/w4nVNwH2ZF3F2BimNZYpJWu7xCYNRPN72xn/Uyn
	er9WE29mAAxXnM50QQQUSLKkO22kwLlc63cnD3w+rwLdoqhodPm1mgaK2P7Zgfs8uAlWJrEspBL
	FQxUxrZ4bqfvSK9EPR2mCXmf9l3xtSXKxG1haktSQ
X-Google-Smtp-Source: AGHT+IEGaNwQwUsuoFyhAT0RG891ff1UB5Uya2JxWtJ1QeDXdtqAdYENXV7IRVwIlXojpGbzegP6Lg==
X-Received: by 2002:a17:902:e84b:b0:240:3dbb:7603 with SMTP id d9443c01a7336-244584dc1d4mr36979635ad.19.1755163515364;
        Thu, 14 Aug 2025 02:25:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c44f:5805:6bc2:66d4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976d13sm346186645ad.109.2025.08.14.02.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:25:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
Date: Thu, 14 Aug 2025 17:25:08 +0800
Message-ID: <20250814092510.211672-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_022516_173114_7343CA0A 
X-CRM114-Status: UNSURE (   9.83  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The first SCP core is used to drive the video decoder and encoders.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Added SCP vreq pin
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index c5254ae0bb99..7fedbacdac44 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -164,6 +164,12 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		scp_mem_reserved: memory@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x800000>;
+			no-map;
+		};
+
 		apu_mem: memory@55000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x55000000 0 0x1400000>;
@@ -1077,6 +1083,13 @@ pins-bus {
 		};
 	};
 
+	scp_pins: scp-pins {
+		pins-scp-vreq {
+			pinmux = <PINMUX_GPIO98__FUNC_O_SCP_VREQ_VAO>;
+			bias-disable;
+		};
+	};
+
 	spi0_pins: spi0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO69__FUNC_O_SPIM0_CSB>,
@@ -1146,6 +1159,18 @@ &postmask0_out {
 	remote-endpoint = <&dither0_in>;
 };
 
+&scp_cluster {
+	status = "okay";
+};
+
+&scp_c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scp_pins>;
+	firmware-name = "mediatek/mt8188/scp.img";
+	memory-region = <&scp_mem_reserved>;
+	status = "okay";
+};
+
 &sound {
 	pinctrl-names = "aud_etdm_hp_on", "aud_etdm_hp_off",
 			"aud_etdm_spk_on", "aud_etdm_spk_off",
-- 
2.51.0.rc1.163.g2494970778-goog


