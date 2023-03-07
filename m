Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85646C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 16:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JY0Ro4rQcxnhRsiPxJHCXtVEYXHerbDIXQMmbNIdWm4=; b=Kxb37KXU3kr8JUuPnFHhcBt7lc
	7NTwrC9UzmwBKvv1XVeokTn9XQjhdKOPkUck+RkwEWZR/jKMPsIGKOX9nC2V3dp7WjE1kC7fyKrGF
	1UbHjOrwzzcI2+M9G2E41AsyMhgqRrhQDhJ/Rvzm5jrrwH8liIOdo62mBlCB5VypIYnePJZs+YNPb
	FMTYtpoweGfMQqyhUBEJlYZq6vq/GHpixOS89wLhPD7ZnZ/e6xf1rXXeRCXweG96bt2EDPCIYDinX
	bN73I3gZBLRTF8YLvZAd/nVFiES2TSlE2tLZWmVdKh1fF1+vyXzvMTsakxDKqBlH6vJRZcBLhnyOV
	K+iC2Fsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZaSR-001dch-0o; Tue, 07 Mar 2023 16:46:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZVM-001ISU-S5
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 15:45:38 +0000
Received: by mail-wr1-x436.google.com with SMTP id bw19so12552145wrb.13
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 07:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678203930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JY0Ro4rQcxnhRsiPxJHCXtVEYXHerbDIXQMmbNIdWm4=;
        b=HPRCUxRSNyyA/oVsmJzaxnWi/aGeU+cplMFkWIaR2F7aOlur6xHyVOmHaPAKxhi6S5
         6HE4UAsO2+d0XsL5fLTME2qD1b9iemXabrKBz99/HFrLWyXgqZ10sOYFVcFPsXlzy/AS
         qt417U9I2jHYrPuL5Wu4SH7jhN8rWtLitFhGDLuldeq4REKk8ZLMdIpSTJm9bOwakbQI
         bsD2NwGi2p+IwZVSEEGnUIqRmG3GS4QFXwJ5n7Mx+wZ+zK+dywTlSMSeZp+gLtCSjkZ6
         JYg57EDiQZ3V7pMCmUA9qHRyOz+/J/8UADAxwLqYYLNvcg7sDXZnmTRvVIWvty46O2Yi
         E0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678203930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JY0Ro4rQcxnhRsiPxJHCXtVEYXHerbDIXQMmbNIdWm4=;
        b=f0uyPkcEvR4laoKT9SPyBmqz4Ubb+GkyDmBUBfWI/g1tyAboi5vVTNtSsmOp0Ss2a3
         rDxxUpd4w0bGeQTgKQVyA28h0iWN4kMl/XOpjGrFUv3xkmMQctim6uqhq90exN/vokKU
         us6lmaZULm6w7URFktyOs8lKIK+5T1DS0aq63cPksXrvchVydOckgriThCxkKkwbE791
         NKYeQwdw38uIBRc9/E1u5o0NaBytSKmJULefro9/25ddXZ43w/bG1u8dJMPobyHGgoDL
         VMvBBjCUS8aGQZvNK5GMhGvDTcCGfV8oRFEpEbyVvFAot9kJZdHy40/V63XYGBnl+utj
         npkw==
X-Gm-Message-State: AO0yUKU35R7/zBry+e6pSex8pw46WI4VPt4zl5eQjExOT7baBRzvjrrY
	YJXvhLfw/LJoTVCtu5sbDsJIjA==
X-Google-Smtp-Source: AK7set8RZzUjacZh8k2s+HDG9BdJ+pG4VhUR6FtsQdsozL54tKbWq3T7WAAE627gMEVl78AJPnNVIw==
X-Received: by 2002:a5d:6a48:0:b0:2c7:dec:77a7 with SMTP id t8-20020a5d6a48000000b002c70dec77a7mr8356572wrw.71.1678203930693;
        Tue, 07 Mar 2023 07:45:30 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d50c2000000b002c704271b05sm12697905wrt.66.2023.03.07.07.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 07:45:30 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8195: Add AP domain temperature thresholds
Date: Tue,  7 Mar 2023 16:45:24 +0100
Message-Id: <20230307154524.118541-5-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307154524.118541-1-bchihi@baylibre.com>
References: <20230307154524.118541-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_074532_917252_4C56EF2C 
X-CRM114-Status: UNSURE (   9.78  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Balsam CHIHI <bchihi@baylibre.com>

Specify the targeted temperature thresholds.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 90 +++++++++++++++++++-----
 1 file changed, 72 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index b066d1eab1dc..0dab67d283a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2654,11 +2654,17 @@ map0 {
 		};
 
 		vpu0-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_ap MT8195_AP_VPU0>;
 
 			trips {
+				vpu0_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				vpu0_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
@@ -2668,11 +2674,17 @@ vpu0_crit: trip-crit {
 		};
 
 		vpu1-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_ap MT8195_AP_VPU1>;
 
 			trips {
+				vpu1_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				vpu1_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
@@ -2682,11 +2694,17 @@ vpu1_crit: trip-crit {
 		};
 
 		gpu0-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_ap MT8195_AP_GPU0>;
 
 			trips {
+				gpu0_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				gpu0_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
@@ -2696,11 +2714,17 @@ gpu0_crit: trip-crit {
 		};
 
 		gpu1-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_ap MT8195_AP_GPU1>;
 
 			trips {
+				gpu1_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				gpu1_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
@@ -2710,11 +2734,17 @@ gpu1_crit: trip-crit {
 		};
 
 		vdec-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_ap MT8195_AP_VDEC>;
 
 			trips {
+				vdec_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				vdec_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
@@ -2724,11 +2754,17 @@ vdec_crit: trip-crit {
 		};
 
 		img-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_ap MT8195_AP_IMG>;
 
 			trips {
+				img_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				img_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
@@ -2738,11 +2774,17 @@ img_crit: trip-crit {
 		};
 
 		infra-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_ap MT8195_AP_INFRA>;
 
 			trips {
+				infra_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				infra_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
@@ -2752,11 +2794,17 @@ infra_crit: trip-crit {
 		};
 
 		cam0-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_ap MT8195_AP_CAM0>;
 
 			trips {
+				cam0_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cam0_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
@@ -2766,11 +2814,17 @@ cam0_crit: trip-crit {
 		};
 
 		cam1-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_ap MT8195_AP_CAM1>;
 
 			trips {
+				cam1_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cam1_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
-- 
2.34.1


