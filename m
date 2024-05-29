Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290AEC25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 05:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfScJpV1Lc9Qk+5AjcIRGjAhjeQSJWXXmZ+kw0+4hM8=; b=l+Djmbk4NGApRGST17d0adTnMB
	j7LtOmO84XAmXVvZNJLCj79ut3MfcLQYVbg7Tve5FM3bIBYf2VxHp+sNLYlQLQATmnWd/zlECU3o0
	BseS4LvSpHijFGYGeqbRuzf/iJWq/OnNHLwEI/9WQ0095cX3UyScLJvM80Z3bKij4uzDI2b6Uf5BU
	czpAZKBKtLx1VJLju5oQ42AS3G6A7OYg7UpgW0kB3wXvvik1lx6L37YgcZNhTegLS8jyjz5B9MKY4
	fsL662qo/XVywTm3Cgap75LXFuzWDsVxEmftKwYFZ2t9dipZqL+K0jvJvb3uwYaaV0J7o1DQ1GP+q
	LXiQKhFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCKI-00000002w7k-2miD;
	Wed, 29 May 2024 05:58:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCK7-00000002w13-2n3t
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 05:58:09 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-355080e6ff9so1582157f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 May 2024 22:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716962286; x=1717567086; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfScJpV1Lc9Qk+5AjcIRGjAhjeQSJWXXmZ+kw0+4hM8=;
        b=3Y/lTJNEm+8WIa6XKlNUMJ1Cz1Rr3fC20pjnURxc867Q/VGhdxPeS/7PbPQju83Bm3
         D65TbTXPIW4gQfQ7FiY1l6BlfSi9saOtnIPDPkzk4Xugauu22WTQ77zbJrygeRoZdIP9
         zc6DKep+NXE+MuUdG/Q4d0Zx52pnrpb+q0EFzI3unrI7HBuaHKbT0teVTEBAucvY6MyA
         HMsGkQJpfauGTNrLkNsvkBBEbGX+DOb5XXaqcmSYfUbxAorzj3MN13bBZfJ+zErx0Mqa
         f1R9z0EELaZCWKmNzHjwcOtQHn7cn28bYgJiAIQTzdKSGtvZvyjU1k5km3C7Cf+QeMaQ
         0EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716962286; x=1717567086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfScJpV1Lc9Qk+5AjcIRGjAhjeQSJWXXmZ+kw0+4hM8=;
        b=h/cm4AoE73/jUjAj9WkNGOj8RmDvh5aHllX7IQNn+05FBBgu8V0ca/NhRnxicv4+x+
         dpallSEycmJ/E+UjEXQEyMpG67ROMfY0sXaHN09YFSA1Uy1OozJe8L5n6+W31z2FtAPV
         41V0vaewBshjNIK6vBuVwZjKbMCSBaatGKjFObO/2G37OF3RUWkG8k6FBeh4ixMXnIdj
         d9lrudkrg3DaFFlqSGXHPuHdw7U0tA4HPAmBnGkFAEeaiBNYgQjRMkD+RNFpzOTZcJa2
         +yVMIxBG4JMmww55YXoZX7q2o2yEJT0QIkirhbd+WifZJOHu3w2dV1qsIBoxRUbXU4XJ
         T6nw==
X-Forwarded-Encrypted: i=1; AJvYcCUX58u1MokE5E9W+yQgwOFUMC1f6wPbE7zU5y0Q2VrIQlrsK1psGuOoSUWA6wTSHkRmVjEylo3SYbdeMlP8dXcIi4pWgAF9UcoKYCZm+VUe3LPU
X-Gm-Message-State: AOJu0Yxga9CN3/h/wpevjndckif29c6ZnP4qZy6lZTecvisjjGOsGhr1
	AJ4atEUFBcZLnY6BzzxthjrXAOFXLFxNPeLMjEQfKoCO0GFRGAOVHpaSY4UOHsA=
X-Google-Smtp-Source: AGHT+IEhIghjCSz3JD+qRhMXK6k396BTyvSTpsRBU6N2qMRXuJS6yBtfu+BePUFIt0tLfkMWIyISmA==
X-Received: by 2002:a05:6000:1e84:b0:356:9078:cc9b with SMTP id ffacd0b85a97d-3569078cd49mr7723125f8f.16.1716962285680;
        Tue, 28 May 2024 22:58:05 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4210896676bsm169075435e9.4.2024.05.28.22.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 22:58:05 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Wed, 29 May 2024 07:57:57 +0200
Subject: [PATCH v6 2/6] dt-bindings: thermal: mediatek: Fix thermal zone
 definitions for MT8188
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-mtk-thermal-mt818x-dtsi-v6-2-0c71478a9c37@baylibre.com>
References: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
In-Reply-To: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
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
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716962279; l=2646;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=0zA4K5GlKKb8X4MA0dH7F7aTDharqePLUmZ645uCgXs=;
 b=VpFSdaZV2QCLWhCBlT9NHY2sMDqmWzooPYogLUmvRpVxbKfVfoDy0RtLffVktFo/UV/nRLG9Q
 QmnS56V+dd+BYblBogVCdMLv5w82LxelJgXNlLFk5s4k5yWRFeNR4Ki
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_225807_743979_8E2BD96A 
X-CRM114-Status: GOOD (  13.66  )
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

The definitions can be modified safely here because they are used only
in the LVTS driver, which is modified accordingly.

Fixes: 78c88534e5e1 ("dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for MT8188")
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


