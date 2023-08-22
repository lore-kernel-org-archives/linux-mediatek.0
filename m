Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39F7EE4993
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 08:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlF1u7hcM0QcOf0dBRcVX4obCkl3j7F2WIt5v6FZgoU=; b=mxDBsWzQRV3N5UIBwVbz/97Gcn
	52adDcn+fLrkWkv2RXZVKXIXfQaYhZSrRUewUhIcgXPB1ZcqQsSnsxydjkgiYo+19q/oO6lWXkV0Y
	TribGyhZHV9IcYLTMYsvbflvBe/bTy9j/ngbg4zAqR/GfENUphYuPJBKTQaWBOJIjNaxTx+YLz4Ih
	08U5LrDUPMvm2/ogTMrORZ1+lwhjwEjFQJS/fxVMjbxnCb29JjVHHFLGsS1nbYMkmzUPfx1wgUmwl
	bzSSD41xzqzYWt8TkKp2/hhuJfQJ66yjvhwl+bKnq/o66SkK7lO4I43lwLgCUYWjIDTqsMBxy4CeN
	d2y30czA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN25-00FUmt-1Z;
	Tue, 22 Aug 2023 08:46:37 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN1S-00FUJf-1Q
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Aug 2023 08:46:00 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68a410316a2so1325138b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 01:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692693958; x=1693298758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlF1u7hcM0QcOf0dBRcVX4obCkl3j7F2WIt5v6FZgoU=;
        b=mhxuhaGqh88+7Ene1JAl6kiwkMKSUNbySevMtCh45aHQzwcstAH3Zxc0tfaKCOyV1g
         ZwwqbRmdYMX9iHwcax5SYaE3jG5u3ApPmK4LhMkh2aWnTo/Z5esP4OgtPTiTgS/X4fM8
         loOv7lDpdU/vDqg55o1JV3nZuZZRDW4GO7AWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692693958; x=1693298758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlF1u7hcM0QcOf0dBRcVX4obCkl3j7F2WIt5v6FZgoU=;
        b=h8GWeQq5DfszEtvlWcdvE5zw0sFqWaCSgsKAav/QaBICGh/59IUxOkhvZT7WFJcP3n
         Fdu5qkzauG3VzdGOVLc6vQ3lvz7yv/r80akzXe1DzTrdqVha3QxKAIlGMoPmG0LMQWv5
         Gj0FZ4xjff3SoNT4BESfAf9IF9BO66iKEfHkNJsrTJ9g8hs1Dz60sL3ZPirmHG1xuKeg
         BLkhVytwNeDdCg/LlaQNpB41vR9VCYz8xf+RF9qOX3unJZAPRMaUdsTr6B1guT5rjtJ1
         A+ExCqRiQugF4cdvzLN8cKvcIIVm4ioIqIQp1R4Al2fYT3c3FBjSz7hL+GkyZE43b06I
         yhXQ==
X-Gm-Message-State: AOJu0Ywu8Ux8AIjfMYKGDmRjDoFxcKQ7Jni1qt0ZxJCl5JeU0YceDwfy
	cKznN3Q2xRjUd8LpT6tbKSvcbg==
X-Google-Smtp-Source: AGHT+IHjB5kNMo/7EJRgipMgtPWyKH6stKI6IA+7/JLvg5/DHP/HLoq+swtjIZEl1DUHRTjCliTjJQ==
X-Received: by 2002:a05:6a20:7347:b0:140:6979:2952 with SMTP id v7-20020a056a20734700b0014069792952mr7772550pzc.47.1692693957871;
        Tue, 22 Aug 2023 01:45:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e619:3fa0:1a90:6bb0])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b00666b012baedsm7304790pfe.158.2023.08.22.01.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 01:45:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 11/11] arm64: dts: mediatek: mt8183-kukui: Add PMIC regulator supplies
Date: Tue, 22 Aug 2023 16:45:19 +0800
Message-ID: <20230822084520.564937-12-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822084520.564937-1-wenst@chromium.org>
References: <20230822084520.564937-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_014558_508259_AB8FF4E4 
X-CRM114-Status: GOOD (  11.25  )
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

The PMIC regulator node is missing regulator supplies. Now that the
binding supports them, add all the power rail supplies. Most of them
are fed from a system-wide semi-regulated power rail. A couple LDOs
are fed from the PMIC's own buck regulator outputs.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 6ce16a265e05..d48c66cc8c18 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -103,6 +103,14 @@ pp3300_alw: regulator6 {
 		regulator-max-microvolt = <3300000>;
 	};
 
+	/* system wide semi-regulated power rail from charger */
+	reg_vsys: regulator-vsys {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -404,6 +412,26 @@ &mt6358codec {
 	Avdd-supply = <&mt6358_vaud28_reg>;
 };
 
+&mt6358regulator {
+	vsys-ldo1-supply = <&reg_vsys>;
+	vsys-ldo2-supply = <&reg_vsys>;
+	vsys-ldo3-supply = <&reg_vsys>;
+	vsys-vcore-supply = <&reg_vsys>;
+	vsys-vdram1-supply = <&reg_vsys>;
+	vsys-vgpu-supply = <&reg_vsys>;
+	vsys-vmodem-supply = <&reg_vsys>;
+	vsys-vpa-supply = <&reg_vsys>;
+	vsys-vproc11-supply = <&reg_vsys>;
+	vsys-vproc12-supply = <&reg_vsys>;
+	vsys-vs1-supply = <&reg_vsys>;
+	vsys-vs2-supply = <&reg_vsys>;
+	vs1-ldo1-supply = <&mt6358_vs1_reg>;
+	vs2-ldo1-supply = <&mt6358_vdram1_reg>;
+	vs2-ldo2-supply = <&mt6358_vs2_reg>;
+	vs2-ldo3-supply = <&mt6358_vs2_reg>;
+	vs2-ldo4-supply = <&mt6358_vs2_reg>;
+};
+
 &mt6358_vgpu_reg {
 	regulator-min-microvolt = <625000>;
 	regulator-max-microvolt = <900000>;
-- 
2.42.0.rc1.204.g551eb34607-goog


