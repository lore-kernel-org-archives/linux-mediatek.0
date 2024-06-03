Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAD9C41513
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qji0UP0xUl/IquKfodaZRyE+GMoc8OcYwqb2/om3sxM=; b=A6hWtU9y7BfESanB3BT3bUq8WH
	81XydAwItarucx0HQaLYolXYc2D+EgwxUrEGUnp7JG+Y4xRuap7wImnWTINVhta41s/owoxuQIPJR
	Hb5grZNPCM6ga/++dfsbEsBxEV0+zzMthX4ONTqilK7Bs2uMreEHQPu+BKUyaadYAkQMs/z+ifuWH
	t0SmJKPbnrKqKAYTSsDtkvEZvXDzmKz80Vw9aVZn/B+tK0SjxrjeCFCQiDEpPry9zVajrVwLZEIOw
	FnCTEOWDLdaN+vzWPbOgCQUj021tLBvUn+glOTRvJtSTM7qiOdPfjaRB2ZAl5pB/ggGkWuB9uqaqu
	mHmxr6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5HT-0000000GQL7-3OWi;
	Mon, 03 Jun 2024 10:51:11 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5HM-0000000GQFg-38Lt
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jun 2024 10:51:06 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2e95a1f9c53so52140671fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jun 2024 03:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717411862; x=1718016662; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qji0UP0xUl/IquKfodaZRyE+GMoc8OcYwqb2/om3sxM=;
        b=C0n+m0HfEGGWO9WhSAQiyKTFnIBNaP5+OY1LGSK5bIEqdxlW5YWeTQaqdwKTygoAgG
         jSDGx44mKyjiEaEf0aN3kd5Q/z7HTWI0gZL+3yxxeKt1LFmk6r+ZdJ/SOWdpkmmnzTMN
         ho7A/xLOQGYVvTLktkkfWueG/HiiZTgdyhHR6/Z/d7N7/KynUy+ZnHIYAwjzSoB7A0/d
         ck0Q0YJXdVn45ekig3M/wPH8lTgqD9Y8gowFRKqmdTTOMdpAnvbUMQg69z7SG0VIs2Ef
         rKyFFnZfcu/mGFigFh8YecpMXc7bqF3Hsk4OrOYInuz3J/oUs8byYTrNjFDF39izLVbH
         8OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717411862; x=1718016662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qji0UP0xUl/IquKfodaZRyE+GMoc8OcYwqb2/om3sxM=;
        b=RncCN7RHbgnXb1I5LBBcNPRwJ/E3EDoqKxY/k1MP17BAbiividbzARpUqx2A1wmQ8O
         CIqtaQBXFo31B3s0XtxDP1hOwBdtI/kGCa1QvCmGuKFDl0HU2IYvppxyuhocpD/83aXp
         KJq8M9SZpo+oih0UyBcsPlyFlaYApvarFEMtS5IVE/ZzDslewtezv4Mj8Aa2CDWRXLQx
         3+RQ7Sdw83g6xwMwlBFI4xR5GLyEd1J97EAI/Kz6dXysJiqt/lHh88LgJw1RSaX9eKCr
         X1z89xcENMc6/O+L3F/evremle8T0BApn77RQTubFgBENxrkT0z609gtN1mM3X75HKt9
         KfJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcQnuF1C+xPLhsz9YrED0wGJHT0wGkuk7SEhZZsztGoOdJyvaBydEltQHMeiNTSie+EiCweRgCetrZJFAri1wa2RjUtL89wiLsGyI3MzocFMEd
X-Gm-Message-State: AOJu0YysxOl7bj7kjRw2JkCLpGVj290JHZr0Xvx61B2jYkmbN0excUYd
	xtLa8A6ysphkmzDOOIMKIeFznc4hRDNGcNEYrmjdoSjpoBgDjUSoKUatgWsvNSY=
X-Google-Smtp-Source: AGHT+IGiTDLsLcSDxxJBfHYdR2L0V7tR+pJ49Omj8OpudBjroJButtWWzfsGSf103bQFR8ayRgCtIQ==
X-Received: by 2002:a2e:9903:0:b0:2e9:794c:19ae with SMTP id 38308e7fff4ca-2ea95122772mr59006141fa.23.1717411861734;
        Mon, 03 Jun 2024 03:51:01 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42133227f8asm95372535e9.19.2024.06.03.03.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:51:01 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 03 Jun 2024 12:50:49 +0200
Subject: [PATCH v7 2/6] dt-bindings: thermal: mediatek: Fix thermal zone
 definitions for MT8188
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-mtk-thermal-mt818x-dtsi-v7-2-8c8e3c7a3643@baylibre.com>
References: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
In-Reply-To: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Julien Panis <jpanis@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717411855; l=2836;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=ZqI2EmSTiCeQkIQ029juObOniGHTqqS9zskZ5qN+P1Y=;
 b=Tw82fn/ZAXPeDohLJa8RKt2pEsOcZr9bdvgVK6hzP3QqxnhsrLDnsX2AgTmAaCXFSECZy0zTP
 oMSA7L28yq2DyzTWri20+vWMBaXVEEvLL9M55ZVVNtlWFMvGysf0qwK
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_035104_939370_C6809C62 
X-CRM114-Status: GOOD (  13.17  )
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

Fix thermal zone names for consistency with the other SoCs:
- GPU0 must be used as the first GPU item.
- SOCx deal with audio DSP, video, and infra subsystems.

The naming must be fixed "atomically" so compilation does not break.
As a result, the change is made in the dt-bindings and in the LVTS
driver within a single commit, despite the checkpatch warning.

The definitions can be safely modified here because they are used only
in the LVTS driver, which is modified accordingly, and have not yet
been included in a released kernel.

Fixes: 78c88534e5e1 ("dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for MT8188")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c             | 10 +++++-----
 include/dt-bindings/thermal/mediatek,lvts-thermal.h | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 506eed52db1e..89fb92666b81 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1487,11 +1487,11 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
 	},
 	{
 		.lvts_sensor = {
-			{ .dt_id = MT8188_AP_GPU1,
+			{ .dt_id = MT8188_AP_GPU0,
 			  .cal_offsets = { 43, 44, 45 } },
-			{ .dt_id = MT8188_AP_GPU2,
+			{ .dt_id = MT8188_AP_GPU1,
 			  .cal_offsets = { 46, 47, 48 } },
-			{ .dt_id = MT8188_AP_SOC1,
+			{ .dt_id = MT8188_AP_ADSP,
 			  .cal_offsets = { 49, 50, 51 } },
 		},
 		VALID_SENSOR_MAP(1, 1, 1, 0),
@@ -1500,9 +1500,9 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
 	},
 	{
 		.lvts_sensor = {
-			{ .dt_id = MT8188_AP_SOC2,
+			{ .dt_id = MT8188_AP_VDO,
 			  .cal_offsets = { 52, 53, 54 } },
-			{ .dt_id = MT8188_AP_SOC3,
+			{ .dt_id = MT8188_AP_INFRA,
 			  .cal_offsets = { 55, 56, 57 } },
 		},
 		VALID_SENSOR_MAP(1, 1, 0, 0),
diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
index 85d25b4d726d..ddc7302a510a 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -34,11 +34,11 @@
 #define MT8188_MCU_BIG_CPU1	5
 
 #define MT8188_AP_APU		0
-#define MT8188_AP_GPU1		1
-#define MT8188_AP_GPU2		2
-#define MT8188_AP_SOC1		3
-#define MT8188_AP_SOC2		4
-#define MT8188_AP_SOC3		5
+#define MT8188_AP_GPU0		1
+#define MT8188_AP_GPU1		2
+#define MT8188_AP_ADSP		3
+#define MT8188_AP_VDO		4
+#define MT8188_AP_INFRA		5
 #define MT8188_AP_CAM1		6
 #define MT8188_AP_CAM2		7
 

-- 
2.37.3


