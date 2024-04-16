Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E8CC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x3Y56dDS984KsDzs2nzTKgy6adBy9joM/agCd66RARo=; b=SFnTFXL3aT0x5aB0992Hno8/Hm
	E8Y+4a/PCWfYCYjywaEZ7LB92ITFkCiBMshTqO2hByF8FH4N3tskstZ99UuawHhHgC4H71XBMJcFV
	2sUyGHTkgoK1ncEY0QsMBI/2g5lbDFcfJPuVOocxG7l8tB8+NK0AqLIDUoS+Yo5DQzCL8ccUPOynv
	4uih44l2+09djQOohDgqbMIge++32sJchoPFKnz96ZQVLkrj6iIPptJ0I7/v7Ps1BYbMPy2G6iuGi
	UrQgh1hsSbIX3QlXBZ3OM3XT8q/Iub/N66iULmIrUxbBKq8wTgBynjgOU7HDhVmuDEQ+8AlOEEwJF
	ZVWB5AhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdMC-0000000BIQn-0vGB;
	Tue, 16 Apr 2024 07:35:56 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdM9-0000000BIQA-2z05
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 07:35:55 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-23319017c4cso2759960fac.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 00:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713252952; x=1713857752; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3Y56dDS984KsDzs2nzTKgy6adBy9joM/agCd66RARo=;
        b=BUlVdH89gO+/X+Sc4jrwWSGiZouYxHMxiK20D+SBbgxAIvLViBBkGUjBT8hqyZXRfJ
         dnnxpCndNaFA6gJXUWAMeU6W/aaCzAHJzAovXf6bVvHZ5UMVSyW1DnUDiaw0GGck03KV
         q5Cawk0agxFJu7gpD4j64Rpp9FWVjuoxTeuOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713252952; x=1713857752;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3Y56dDS984KsDzs2nzTKgy6adBy9joM/agCd66RARo=;
        b=M/dVcektgiOWWYsXGP4iP24KjRjZYx6ob8CN2lXxTRKLIXh8gBOLuhqbJR6rVratzB
         8ZdlY12m4DZduOQUzQt7Kdo08skC2aCW6ykOehE7ewv/8BE/H842uoBysStZRuzSHayA
         V8JcUEncE2r1VdFoThh0s+FecFzE2Op701skaNmnX5N/q+T8oAVn2jJaNmxOh5AS1KTB
         nSxBtbqSIWD8XZsWkWiNo9CCh7I8ljoBcgxF9zOL1DmHMk1i++Xg5gI5aUl1eDHorRQf
         0bgWjNg8Znvdh/guyboLWDjU8V4Eg9LMakjTSeoR90Aux9CJFEYG8//9Xo7UcI89S+UW
         Bd+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcO9X2AMNhaTlyDMLXFP3chM9N0UciCPIb7utVPo0mAd6tR6rmFu+f/oymnzgRtXJD8+CIy8vsBJqI/BMI3YJ1MwGAGgE5Da8S/T9R3xa92q0F
X-Gm-Message-State: AOJu0Yz3H/iJMPaMIBvDfkPYLGkpMz6XYzAuk/jJDKczJBn0jLJWvfkW
	YpXNYW7TyhvHYVLApslxTqowjfWnMOPw5oA8V402a2LtFHuyZAUGpwP47aEizA==
X-Google-Smtp-Source: AGHT+IHNjgaqMYg1Csze8sajKRyaaqmq9zLpH84gQd3fhwrzyArn1i3A0GueOZmBPZ6aUxRl85D33Q==
X-Received: by 2002:a05:6870:568c:b0:232:fba4:4594 with SMTP id p12-20020a056870568c00b00232fba44594mr15920699oao.49.1713252952526;
        Tue, 16 Apr 2024 00:35:52 -0700 (PDT)
Received: from yuanhsinte1.c.googlers.com (88.216.124.34.bc.googleusercontent.com. [34.124.216.88])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b006ea9108ec12sm8307092pff.115.2024.04.16.00.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 00:35:52 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 16 Apr 2024 07:35:47 +0000
Subject: [PATCH RESEND v2] thermal/drivers/mediatek/lvts_thermal: Add coeff
 for mt8192
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240416-lvts_thermal-v2-1-f8a36882cc53@chromium.org>
X-B4-Tracking: v=1; b=H4sIAFIqHmYC/32NPQ/CIBRF/4phFgOvH6iTg10ddDTGUPpaSNpio
 BJN0/8uYTTG8d6bc+5MPDqDnuxXM3EYjDd2jAHWK6K0HDukpomZAIOc5ZzRPkz+Pml0g+xp1mR
 lsc2FVG1LIvJw2JpX0l3JubpUpyO5xV4bP1n3Ti+Bp/W3MHDKKWLBatgpLoryoLSzg3kOG+u65
 Arwj4fIl8BVLRQTMoMvflmWDyKXp07zAAAA
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 Balsam CHIHI <bchihi@baylibre.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_003553_827138_34E1AB33 
X-CRM114-Status: UNSURE (   9.15  )
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

In order for lvts_raw_to_temp to function properly on mt8192,
temperature coefficients for mt8192 need to be added.

Fixes: 288732242db4 ("thermal/drivers/mediatek/lvts_thermal: Add mt8192 support")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v2:
- Reusing mt8195 coeff instead of creating duplicate definitions
- Link to v1: https://lore.kernel.org/r/20240410-lvts_thermal-v1-1-ee50b29c1756@chromium.org
---
 drivers/thermal/mediatek/lvts_thermal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index fd4bd650c77a6..4e5c213a89225 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1530,11 +1530,15 @@ static const struct lvts_data mt7988_lvts_ap_data = {
 static const struct lvts_data mt8192_lvts_mcu_data = {
 	.lvts_ctrl	= mt8192_lvts_mcu_data_ctrl,
 	.num_lvts_ctrl	= ARRAY_SIZE(mt8192_lvts_mcu_data_ctrl),
+	.temp_factor	= LVTS_COEFF_A_MT8195,
+	.temp_offset	= LVTS_COEFF_B_MT8195,
 };
 
 static const struct lvts_data mt8192_lvts_ap_data = {
 	.lvts_ctrl	= mt8192_lvts_ap_data_ctrl,
 	.num_lvts_ctrl	= ARRAY_SIZE(mt8192_lvts_ap_data_ctrl),
+	.temp_factor	= LVTS_COEFF_A_MT8195,
+	.temp_offset	= LVTS_COEFF_B_MT8195,
 };
 
 static const struct lvts_data mt8195_lvts_mcu_data = {

---
base-commit: 20cb38a7af88dc40095da7c2c9094da3873fea23
change-id: 20240410-lvts_thermal-3d365847acff

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


