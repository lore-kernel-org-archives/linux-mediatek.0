Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A075AC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTq3Rd3TJ513y76FFI3WT0dfpVj4Khn+ApB44y0p0+k=; b=LRuH6c3WFgNYgC1861dUYKX/MU
	bdfoEMCg/GhvBF/LolNTD/B2mrmTG4w6148LU8ryDInNe1M/PZysOqSt/rDsQMgX/IbYCfTLXkzp8
	+cBV3k7pK4KBoMG2NhK55MD3H/cbn9099SBZKoxHiFBxybyie9a8Mp7bOn5Hi2OPHsZRxSTyuvdKo
	M5Ud8oDTXsoxsLJ6LvddPsSNpv3VKaBhHXru+cpDNfzFsGCiLnOl1d0JxLmqz6uqbHOx7IhA1C2c1
	cXwyYCwhWuphp2xtkPQUOxjPhxtCbMkSW5XrxMyeIZau34OtpbsHqzVaWIPXSic1pw3asjDGHAJ6f
	dYWY61qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaviy-00AFkP-Te; Wed, 21 Sep 2022 09:08:56 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavgE-00AE80-6O
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 09:06:09 +0000
Received: by mail-wr1-x42b.google.com with SMTP id n10so8686623wrw.12
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 02:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=hTq3Rd3TJ513y76FFI3WT0dfpVj4Khn+ApB44y0p0+k=;
        b=0c2Cy+Q4wxXUAvCsCYHW2Jf8B8+krbOBDUB7xauW7/MN/NXxhW3ygOeM5v2ZrgqEzl
         xLrIGnNBJS5IvoQhCVJ9RzIA5NcZe0v03Alpp2kuTuvNaZJldsybst/SunpEBzz/hRn+
         Bu7b4tbLUItAFCyx8C6B9l0T1coCvRcUmxDsplAJBfc2W0bGKoiYq40M/kSc/GepPFLz
         DxFZHirBp0PJu+KhrFyA+e060GPY+teQ5a1KsIAdrQeJoq7flqLo+aiguQjoAimB5BZE
         +DvSu0zXEk5TpN062T1rAElzC73z6yMbpGGh+TCV42ZMbSKdRoAJ9JUvzQtdkMRBhqzC
         +HBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hTq3Rd3TJ513y76FFI3WT0dfpVj4Khn+ApB44y0p0+k=;
        b=GDOVQu1M5OL27Yj6J+bzqLLBZZX5eQSG2M+HTbzActXS/8QPQYx+tO/HjYySocsWKa
         ktG5dCvfMkagnmY8j1o94zmW9wyh5pnFc1YD0t0nLDNFAC/paw+vK5HY18S/oGyk4PX5
         wYwjD1TzXBBaRqP8HQby3zj9GALzJ2R7xIGdLPlh89FjB7IQcwUsccUdTTocqwHwHI2t
         v/cJQxAt99xUKevOfFbiVDoq2WhcqA07yLbCMrCt2dK4RDxvhr67m2ZcmGZQ494am5ox
         Dunj1N+C13GoOiXgodzTAcLTAw4WBBiWbuE+lu5IvFBiPaFL9O/YJsubU2503I87dTns
         nYQg==
X-Gm-Message-State: ACrzQf0SKebFSPNLQgPFJlrViHRJcraN5Qcz442d3T6uwLOJ0Z7C8BmR
	i+VMOAgTjwFpUuk3+aW1vrJewg==
X-Google-Smtp-Source: AMsMyM4Qpq8v43feSwHJfA27oBOpdjOQnzkAJwh28NMTj4f2VN4DosURKua9zHscoCuwe0yDrxwgnQ==
X-Received: by 2002:adf:fb88:0:b0:22a:f742:af59 with SMTP id a8-20020adffb88000000b0022af742af59mr10817471wrr.230.1663751163802;
        Wed, 21 Sep 2022 02:06:03 -0700 (PDT)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id p10-20020a5d638a000000b0022b0064841esm1975482wru.59.2022.09.21.02.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 02:06:03 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Wed, 21 Sep 2022 11:05:33 +0200
Subject: [PATCH v2 1/1] arm64: dts: mediatek: mt8183: disable thermal zones without
 trips.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220921-mt8183-disables-thermal-zones-up-v2-1-4a31a0b19e1e@baylibre.com>
References: <20220921-mt8183-disables-thermal-zones-up-v2-0-4a31a0b19e1e@baylibre.com>
In-Reply-To: <20220921-mt8183-disables-thermal-zones-up-v2-0-4a31a0b19e1e@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>, daniel.lezcano@linaro.org
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663751161; l=1541;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=+48HSG61Tboa5W5HVeC955O8SAyXJVzdboBwb6baiTg=;
 b=G6EMcK1spRehaxNq/icrbsiBlZLOHtLbMIiv271RWH23rYmDwzq8SlL12BPpNVMsMeAZ6+Q7oXW6
 GcLOJNqqCSjfr9joJaP05Cf/8OfsAfmsOx1G9Oe0eTAhXhHPJj7j
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_020606_283948_E1ECF1D4 
X-CRM114-Status: UNSURE (   6.91  )
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

Thermal zones without trip point are not registered by thermal core.

tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
only.

Disable the zones above and keep only cpu_thermal enabled.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 9d32871973a2..44a197e92c99 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1193,6 +1193,7 @@ tzts1: tzts1 {
 				sustainable-power = <5000>;
 				trips {};
 				cooling-maps {};
+				status = "disabled";
 			};
 
 			tzts2: tzts2 {
@@ -1202,6 +1203,7 @@ tzts2: tzts2 {
 				sustainable-power = <5000>;
 				trips {};
 				cooling-maps {};
+				status = "disabled";
 			};
 
 			tzts3: tzts3 {
@@ -1211,6 +1213,7 @@ tzts3: tzts3 {
 				sustainable-power = <5000>;
 				trips {};
 				cooling-maps {};
+				status = "disabled";
 			};
 
 			tzts4: tzts4 {
@@ -1220,6 +1223,7 @@ tzts4: tzts4 {
 				sustainable-power = <5000>;
 				trips {};
 				cooling-maps {};
+				status = "disabled";
 			};
 
 			tzts5: tzts5 {
@@ -1229,6 +1233,7 @@ tzts5: tzts5 {
 				sustainable-power = <5000>;
 				trips {};
 				cooling-maps {};
+				status = "disabled";
 			};
 
 			tztsABB: tztsABB {
@@ -1238,6 +1243,7 @@ tztsABB: tztsABB {
 				sustainable-power = <5000>;
 				trips {};
 				cooling-maps {};
+				status = "disabled";
 			};
 		};
 

-- 
b4 0.10.0

