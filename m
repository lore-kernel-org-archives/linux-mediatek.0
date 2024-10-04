Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FF0CFA750
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 08:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4TchenuM2PZiHwsPrmRTDwDZS9j+elV+kESl2Ludm4=; b=BG7T7FzhxUIOnQ
	6QNGNqdg8YMHGi8Tkx5wSOKEx6bP2xekMMPqBRPkc6KyjUV3oJwLD0fmehNaNVbHYaKUMzeQQaB2e
	lIAZxqCHmzaqF3jUA3bRyig9iETJUcTc+XG/Db8xywX1qr8S4otiXvgulP009o3mKuwYxf6YmlfOw
	KSqoPx7EyK4q8586vZhb1v4KA9TL0Q3URMORldHvaAT8I1djSpw7S/ERKQk+sTKZWVsYZViGCdX/F
	1lgqGXyg8NrAmTYSiFgz0XT12XQC38ZvsuoGPcL6Zz2R8vX0AyBSPFrsA7nkony01u8knMViNoKZS
	tHgfYGZxT4Esdq2rRIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdcZ-0000000BOm5-451c;
	Fri, 04 Oct 2024 08:25:07 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdQy-0000000BM73-2Xds
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Oct 2024 08:13:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-207115e3056so16782605ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Oct 2024 01:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728029588; x=1728634388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4TchenuM2PZiHwsPrmRTDwDZS9j+elV+kESl2Ludm4=;
        b=lS67LO+BT2COua/Mz6JF7NEPrYkPguAg4o4wGuGgm6UwpjXP0QiEl1HvtVmfJyvL4L
         MtejiairxZBjZXRn2H5CL83g/rpb22K7ly+sTCSFTBHAvFZF2ndtxFh+CLnPS8szPvap
         VTi+/e0VYi4zamefNVaneW4PVLRczIkQV002U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029588; x=1728634388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4TchenuM2PZiHwsPrmRTDwDZS9j+elV+kESl2Ludm4=;
        b=evdR3V7BO4y6brDRpZfYAUizjfk5r1k+Fz0z07SQhQ9wdGCLplhnXYvK9wbCkEdprx
         AmX7s5KjZwx1Kf3XcSPzsEn1CMG8rvesYwQl7ONZYBCecndDcCuSzUyeDsam8yrcoShA
         yI5BQwao/xeDSNN9LR0r9W3Ayo30oYijxjxe0DVo0DjtP7MC/T4VlG34QC2hpTdp12uS
         3lVGqZPu2GxHc64SuazvFks+GMaZWVXI4wv+Y81iYAjX9UScOl7PvE8j0guzTTGRlBzG
         mfbg8OFCXLwh3eEBFDGxcXz2Ptp981pagoetqvpc5UbFF6/Ln46l+PNwEyTKNULWvsfz
         o4JA==
X-Forwarded-Encrypted: i=1; AJvYcCUFIN98ysW3iLYqvlazFGugNkxZJuLLvsfyyogjtvzY7+4i2hYHYR9ID1RNLEtXUGedEEQ1yk2h+JBgPAbTWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YykH8EqJJAUq/7HL4LmNGWAlf8J66wijli9lqtnEYNNBNCc1N0Z
	lZMQTUEadXjyupd9V3I8zLxgjZzwpGUDuTcsdbjrMlH192beolaNmZvIlBfCvw==
X-Google-Smtp-Source: AGHT+IFNQ0WywxJScoB1okGv8SlygVhcsYIeOTSbtTWqDzvqCcmKgVOc2GfwIiZyeIV6XO2xvKyTmQ==
X-Received: by 2002:a17:902:c94a:b0:20b:968e:2585 with SMTP id d9443c01a7336-20bfdf80044mr35741085ad.6.1728029588048;
        Fri, 04 Oct 2024 01:13:08 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:73bb:cecf:e651:2ce6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beefad264sm19401305ad.205.2024.10.04.01.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 01:13:07 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 8/9] arm64: dts: mediatek: mt8188: Add DP-INTF nodes
Date: Fri,  4 Oct 2024 16:12:00 +0800
Message-ID: <20241004081218.55962-9-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241004081218.55962-1-fshao@chromium.org>
References: <20241004081218.55962-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_011308_695547_F6FA735A 
X-CRM114-Status: UNSURE (   9.03  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the primary and secondary dp-intf nodes.
These DP-INTF hardware IPs are the sink of the vdosys0 and vdosys1
display pipelines for the internal and external displays, respectively.

Individual board device tree should enable the nodes and connect input
and output ports as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index ec12617ea925..8864f1ead663 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -24,6 +24,8 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		dp-intf0 = &dp_intf0;
+		dp-intf1 = &dp_intf1;
 		ethdr0 = &ethdr0;
 		gce0 = &gce0;
 		gce1 = &gce1;
@@ -2480,6 +2482,18 @@ disp_dsi1: dsi@1c012000 {
 			status = "disabled";
 		};
 
+		dp_intf0: dp-intf@1c015000 {
+			compatible = "mediatek,mt8188-dp-intf";
+			reg = <0 0x1c015000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
+				 <&vdosys0 CLK_VDO0_DP_INTF0>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL1>;
+			clock-names = "pixel", "engine", "pll";
+			interrupts = <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			status = "disabled";
+		};
+
 		mutex0: mutex@1c016000 {
 			compatible = "mediatek,mt8188-disp-mutex";
 			reg = <0 0x1c016000 0 0x1000>;
@@ -2745,6 +2759,18 @@ merge4: merge@1c110000 {
 			mediatek,merge-fifo-en;
 		};
 
+		dp_intf1: dp-intf@1c113000 {
+			compatible = "mediatek,mt8188-dp-intf";
+			reg = <0 0x1c113000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_DPINTF>,
+				 <&vdosys1 CLK_VDO1_DP_INTF0_MMCK>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL2>;
+			clock-names = "pixel", "engine", "pll";
+			interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			status = "disabled";
+		};
+
 		ethdr0: ethdr@1c114000 {
 			compatible = "mediatek,mt8188-disp-ethdr", "mediatek,mt8195-disp-ethdr";
 			reg = <0 0x1c114000 0 0x1000>,
-- 
2.47.0.rc0.187.ge670bccf7e-goog


