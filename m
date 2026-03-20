Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8929109318E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKdWbHOtOd1Eh/qijp744Js8e+N53SqNuNkX4+eo90M=; b=LH4PbMidNSRqQKWlZn3BrjAQ43
	FKW8exR97T4Vj2VSDrcWO6F5UPRChF1szqtMgvfvzehf8ZT74aNImDwd0Zz1b9hwB2jQCvqRe7M62
	p8NgmNOyUL3zrjm4M4AxdxAdPp6DeAoOxOd+dtW2GoNl6gSlinCzyX2zEAmrjkpziynR0M/1jVFK4
	LLbhIYwG0sOJc0cP9qNAOX6D9Qfnk7FnlBDsHhWJ3eE+mADNBq+TRYH+6PBWOA3ebPCcyehKQzHWl
	guXkNnzArlg44GTu6RnKi1R/czyuEiXdEz1ggj+8NKvMLbthOhHM3e2FUfI+EMyk1c9NXsYmCnC8P
	IwFJjsRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSw-0000000CNsJ-3mOv;
	Fri, 20 Mar 2026 08:44:22 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSj-0000000CNfr-2DJ9
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b056b7f783so8656235ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996249; x=1774601049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKdWbHOtOd1Eh/qijp744Js8e+N53SqNuNkX4+eo90M=;
        b=PlUqTrQ8KSYyJsOweDq40gXx1KQ/00WpXAWpz0JcG7aBT5tmT38mO7pMQ0Vq6Pctdt
         o/FxZV3lWv46asFpe6JpIGalNhBu1wsMqaJWHYmeEqvjE6G6RnazYAoDrwZQ6T1nnrze
         tcw0cn8189r4Wug8S5/0iThx2dZh0DvOcWZhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996249; x=1774601049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKdWbHOtOd1Eh/qijp744Js8e+N53SqNuNkX4+eo90M=;
        b=UwMKNIgWbFh36pmPOwt9BzejeQNTkshON5u49vkx88ckCmVKJpOoMoLNKgqX87wf5N
         kYiA9Cbm8uBEeI0yxIYDOXwg9U7UAyd6aBdOA9i5jxj0R1LgmJlFnIdMwXneQpfmQh7B
         9dIoUqcI8NaDNhvsez/e2t8I7tlfxbxOL18g5+BK7OPh8WovO6Ph28xO2tj+EC+4UmGT
         72U7GLrVS68/C8OctA6pRZCSBSGbT339w9rzJfpSYAom88n1LK9+xRYQEHbe0+ZOPgF+
         H8FWXPGutJwVBa8HOlu0BNzLUq2no3OCq/6Oieot1Wt3M5Zch+VGEao8hiuvJYMIjozE
         CKDg==
X-Forwarded-Encrypted: i=1; AJvYcCVomqdYGcVrWrGS4mZYiWn6R7Eu57yLTEvl8iMOtBQYVmGA9OcCHEjZmFpswDsC7AEtNuXLHpRPy51WyAC22g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxejzA+VtFKsfEWNHee6wIZhHdknEdgaNjqExXcVAHqnSRJIsi3
	lqtat294FIygQA2xcg5zAifosTYg2loSYzFnhu/FeCdA/OmokhiZz189HgR67ghc7Q==
X-Gm-Gg: ATEYQzzlhE/DzJVOfnAa7RX6/X8jdeFLED0ABGB2V+RqgjCa3t5cVn4PwYhSPcyfoUc
	gIRWWEV1otZI3nfwgUduDwnlYxWwpD1tVdoS0/ryqehxYaXrqbMo3toTbXRS0pGPw0STeCbw5s1
	l7hjZd8+IZkHXqtGmqhvDvqkCGREoqFAZgbphL11WpY0ouq2F0Ot6qEbRbn7rVWBJSkB/YCq44k
	iYef1sbNy8gsFYEIU3t1CD6LsVNsiL+s2YW32Gj3Jj8kWjGYR3GcS6VEPCzYj6bmklhyNaxN82v
	IvicUhd+dKdzAdXOfDAKUZHraVdP/EkcKq5252HMlvuRNjPaTb6xeRsUj+blVjEe5wLPoyGOrrn
	Cotcqyh6PTMIsiMd4P5WTdVa21WbOVM6EHXrlMZmprELT56eg/4u/KfydPBvOycrt6o+4HtRu7P
	zmkTn4bN8bNXTfk0QMjL/HlHtkzqXvcbi/W9HIiAkM5sgwO8tzzQM3jg5I987ENbEQEvl76M3ho
	Wj8xGPWm014Z3bgP7U=
X-Received: by 2002:a17:903:283:b0:2b0:5a4c:726f with SMTP id d9443c01a7336-2b0771d6e70mr50846735ad.15.1773996248677;
        Fri, 20 Mar 2026 01:44:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] arm64: dts: mediatek: mt8192-asurada: Add MT6315 PMIC supplies
Date: Fri, 20 Mar 2026 16:43:36 +0800
Message-ID: <20260320084351.2461060-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014409_566139_176FC367 
X-CRM114-Status: GOOD (  10.28  )
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

There are two MT6315 PMICs in the MT8192 Asurada design. One has two
outputs ganged together and two outputs unused. The other has three
outputs ganged together, and one left independent.

Add supplies for all the used regulators. In the case of ganged outputs,
add the supply for just the first output.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index d16634e9f342..318903b112a3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -175,6 +175,17 @@ pp3300_wlan: regulator-3v3-wlan {
 		gpio = <&pio 143 GPIO_ACTIVE_HIGH>;
 	};
 
+	/* system wide switching 4.2V power rail */
+	pp4200_g: regulator-4v2-g {
+		compatible = "regulator-fixed";
+		regulator-name = "pp5000_a";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		vin-supply = <&ppvar_sys>;
+	};
+
 	/* system wide switching 5.0V power rail */
 	pp5000_a: regulator-5v0-a {
 		compatible = "regulator-fixed";
@@ -1612,6 +1623,9 @@ mt6315_6: pmic@6 {
 		reg = <0x6 SPMI_USID>;
 
 		regulators {
+			pvdd1-supply = <&pp4200_g>;
+			pvdd3-supply = <&pp4200_g>;
+
 			mt6315_6_vbuck1: vbuck1 {
 				regulator-name = "Vbcpu";
 				regulator-min-microvolt = <400000>;
@@ -1637,6 +1651,8 @@ mt6315_7: pmic@7 {
 		reg = <0x7 SPMI_USID>;
 
 		regulators {
+			pvdd1-supply = <&pp4200_g>;
+
 			mt6315_7_vbuck1: vbuck1 {
 				regulator-name = "Vgpu";
 				regulator-min-microvolt = <400000>;
-- 
2.53.0.959.g497ff81fa9-goog


