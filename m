Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FEFCD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 08:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NAyow8X3gkrKIXrdZZsBjPykepVjWpYDrdgw89x4pGE=; b=jkasKnWPCMfLm7eRs2DC/RFvxt
	PZnJC+Hv1r+8XLcLj+YQkETdaqitaIXgnrMJF8b5lnd2/nKNfX7R654QXDRPHLnpRZA53wO4WKhxU
	2ayAC3QAqJmVv4Eb3QxLpdmWPNPONLtaGuPJrkD2Tio5vF4AjIHHGe5p34rrG9HC6VJkqqMkTzBFR
	Sq/GCC0K5+sLiXc/HzeQs1TYaBtaRUtrOmUcrbXN7Vp1xhxoBrjKLGaESqh/fc4wc9r2vAsm8VOaR
	r3FGwptzo3MlrvkRu9kOKObszGHQfhdH/QOQUEXtcSRCGCzd71TpQfxTHUYBBUFq7ukJvwLx76JNG
	SKUmYQ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTVq-00000005v9F-2oub;
	Wed, 10 Apr 2024 08:40:58 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTVl-00000005v70-230X
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 08:40:55 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6e6888358dfso3925189a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 01:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712738450; x=1713343250; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAyow8X3gkrKIXrdZZsBjPykepVjWpYDrdgw89x4pGE=;
        b=X4RgvcBn35DUp6h5+dbOht0lI7zGDKHCWPt/VYrCmsHHHnqufuOepmFh9qdKilXMVU
         skiDUz+OIAVY0c5g/d5SP3ELdj9LJPsKINT0eC8p/v5YnK+lp9A6SpcIMyYkTDRM0t4+
         QXLNwVM81eoVL0GPD2+JowmbB1/A40Cc5Gp/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712738450; x=1713343250;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAyow8X3gkrKIXrdZZsBjPykepVjWpYDrdgw89x4pGE=;
        b=NCeGoNBxolvOjTYE6rIppZRP4tKuM9G91zyTAERuvx4QcdFrRryCiQiTXxyDKyByjM
         OCOm/28VfiMnoEvYUG4wc6exeOGwp4KZjLK+moz0/v32rSB6RBAyoyx4LfBGA8iGXMvW
         irnShiwN7frIhy1lJy5ZBjT5ULp/hFSunxwHNAPI+JBq+1+/fHEEWjOq8FK5EKyqGMOh
         iu6/fq7f0kUumpXHhk5STioJ4SH/0JVSgYihJD8tvBgjZXOsniRTSUjMTP7NLdfj2pt1
         jitNWAkUruvEYgRFnoZYl/6yD/TxKTlapiQwt9CXb2ip/q8idkycfn9tDuck22WJNJoS
         nCcg==
X-Forwarded-Encrypted: i=1; AJvYcCW7DVcAITUrEqfvKuESwYQzmnbdbif29GKKK7Rh1r2wqneN6TLWmheSOfiJoJrj6BI1VLZ7AYpZGt/unLtdWJxDCJ3/puskqZNOyv56TXvXMNQw
X-Gm-Message-State: AOJu0YyqLWSiTT+WfTETzmQ6UpGx0CV3hCNEAIP46hMTfzqGSy0dIt6w
	1aiRPVNCdvV/WbIeqttISZyTRetTEJpTNlokWlHX0NijmaXgaZPUWrosO/BKVdM4M7DN41nBZQP
	8dA==
X-Google-Smtp-Source: AGHT+IGQIGRSVbir8tD+7BU7dQc6yvCondb+sBONRHguGITH+9jJFPC17Z5wLbgHntSupY3dHcRiGg==
X-Received: by 2002:a05:6870:700c:b0:22e:d2b2:25fe with SMTP id u12-20020a056870700c00b0022ed2b225femr2049905oae.1.1712738450103;
        Wed, 10 Apr 2024 01:40:50 -0700 (PDT)
Received: from yuanhsinte1.c.googlers.com (88.216.124.34.bc.googleusercontent.com. [34.124.216.88])
        by smtp.gmail.com with ESMTPSA id i6-20020a056a00004600b006e04ca18c2bsm9606330pfk.196.2024.04.10.01.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 01:40:49 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 10 Apr 2024 08:40:45 +0000
Subject: [PATCH v2] arm64: dts: mediatek: mt8192: Add missing trip point in
 thermal zone
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-upstream-torvalds-master-v2-1-679777847b63@chromium.org>
X-B4-Tracking: v=1; b=H4sIAI1QFmYC/42NTQ6DIBBGr2JYdxqg2L9V79G4IDgoSREzg6SN8
 e6lnqDL9yXvfatgpIAs7s0qCEvgkKYK+tAIN9ppQAh9ZaGlNtIoCcvMmdBGyImKffUM0XJGAiM
 tet8adXYXUfWZ0If3nn52lcfAVfnsT0X91j+iRYGCa6vxJk9eOnQPN1KKYYnHRIPotm37Aoofg
 AjDAAAA
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 Balsam CHIHI <bchihi@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_014053_723813_D3564B84 
X-CRM114-Status: GOOD (  11.22  )
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

According to Documentation/driver-api/thermal/power_allocator.rst, there
should be two passive trip points. Adding the missing trip point to
ensure that the governor works optimally.

Fixes: c7a728051f4e ("arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v2:
- Clearify the reason of adding another passive trip point
- Link to v1: https://lore.kernel.org/r/20240410-upstream-torvalds-master-v1-1-852e903f0cec@chromium.org
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 05e401670bced..08d8bccc84669 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1959,6 +1959,11 @@ cpu0-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU0>;
 
 			trips {
+				cpu0_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu0_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -1989,6 +1994,11 @@ cpu1-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU1>;
 
 			trips {
+				cpu1_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu1_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -2019,6 +2029,11 @@ cpu2-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU2>;
 
 			trips {
+				cpu2_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu2_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -2049,6 +2064,11 @@ cpu3-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU3>;
 
 			trips {
+				cpu3_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu3_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -2079,6 +2099,11 @@ cpu4-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU0>;
 
 			trips {
+				cpu4_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu4_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -2109,6 +2134,11 @@ cpu5-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU1>;
 
 			trips {
+				cpu5_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu5_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -2139,6 +2169,11 @@ cpu6-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU2>;
 
 			trips {
+				cpu6_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu6_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -2169,6 +2204,11 @@ cpu7-thermal {
 			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU3>;
 
 			trips {
+				cpu7_thres: trip-point {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu7_alert: trip-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;

---
base-commit: 20cb38a7af88dc40095da7c2c9094da3873fea23
change-id: 20240410-upstream-torvalds-master-40aeff5416c7

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


