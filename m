Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D50CCE7B0C
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 08:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZNL2xap7oS9tgNofh5Q08A9m6sr7oqpmvudQ+aQQzo=; b=US4Gtv8dbBuHu7OB+8E/HZDVS2
	76OWIDNcKXYx2qncMSf0EH5dqkSkOjwoU32p07hqs9eH0Uevp/cgPeREuEe3qZgTBaWwmOnu4WVrL
	yCn4oWCPZEevC/s5llFpc1nim7HaxMNkqFn3YbfT13v3/0uEMYEhjrwKrqDZwFPMYpxx3tygPL35x
	fGBedpwd8Z7wQqfks0aroH0Rl079Z9QwiLR0dgEFHLXMinWwlAWOYrMVwufEEIio4yrvB0WlSTk3i
	/tUC4kMc+fRtoNXW+im3zt0E8ZxQRRYQOno4enuBjoQP8tOde2qyONruYujI3jaEjHlb7ylQFjreo
	hMAAtFaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmp7-002fn4-0P;
	Thu, 28 Sep 2023 08:56:41 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmob-002fUh-2l
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Sep 2023 08:56:11 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3af5fd13004so1134836b6e.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Sep 2023 01:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695891369; x=1696496169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZNL2xap7oS9tgNofh5Q08A9m6sr7oqpmvudQ+aQQzo=;
        b=fXnM0A2ROtgAc05SbPk7tkVA3SFJvxY2VSVr4sgWbLdJKIBf+1KnTyRRpbHbSMn+SQ
         /L/4koY57zsOEVd7Qa1y8s8YRwsdqofm2xaEJxQ00cQHU9e0YRfJLDBtGcWiAVUduSdR
         1fQH8RqAdWb71d+R+b/wiSUMrGGioHKvQUwyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695891369; x=1696496169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZNL2xap7oS9tgNofh5Q08A9m6sr7oqpmvudQ+aQQzo=;
        b=QTD4YesnHWK/aEifQGFrlplwThTBALrK1mdIQxOebetIjMmHME0rj+bb9mMgiyVJcV
         hlasSwrDUaYf3QiAC4doL0/tQfTdrJgj2qBPXxFgWYuZvFyg5XdDdrb6dn/S1Buw9Agm
         dznfWa2YtXAIfEJcEeTIwj7Qrck33R1dK0c9F0OODTzrSAG29itzMdrpVUpAIzWRCuSr
         nlDxDxyqEw6gkKfd3yqVpG3I2bpYFergXrPjeeicCOAVBOoky1bsTItrQGPDJp4HFmbg
         sfz2v3pgbx6c8OcvSXi3btM5bX/IGKdEj7Lzpl/pnZkXagdIjwOkyHkkkSWfol8ACEuc
         hzjg==
X-Gm-Message-State: AOJu0YzKMpn/wm6fEH1So5pH81rQ9Jpr0xYg2KpMv9VDZUpE0cR2jci8
	khkYdoBVZVknLi7opBL0VUgUmQ==
X-Google-Smtp-Source: AGHT+IHebtThJXaKtrU9g5yT/aInEDgutgbt2q6VlFhzqf+DJC7Yjfbm2/1ZK8V2h/BRrv/cAxfijQ==
X-Received: by 2002:a05:6808:1b29:b0:3a4:2941:af49 with SMTP id bx41-20020a0568081b2900b003a42941af49mr787460oib.22.1695891369299;
        Thu, 28 Sep 2023 01:56:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6747:c12a:dbfd:2cc7])
        by smtp.gmail.com with ESMTPSA id y7-20020aa78047000000b006879493aca0sm1754016pfm.26.2023.09.28.01.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 01:56:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 06/12] regulator: mt6358: Use mt6397-regulator.h binding header for buck mode macros
Date: Thu, 28 Sep 2023 16:55:29 +0800
Message-ID: <20230928085537.3246669-7-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20230928085537.3246669-1-wenst@chromium.org>
References: <20230928085537.3246669-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_015609_956753_5DB02D9A 
X-CRM114-Status: GOOD (  14.38  )
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

The (undocumented) possible values for the buck operating modes on the
MT6358 are the same as those on the MT6397, both for the device tree
bindings and the actual hardware register values.

Reuse the macros for the MT6397 PMIC in the MT6358 regulator driver by
including the mt6397-regulator.h binding header and replacing the
existing macros. This aligns it with other PMIC.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v3:
none

Changes since v2:
- new patch

 drivers/regulator/mt6358-regulator.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index c4ecac5f3fc8..f966eedbbd6e 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -13,8 +13,7 @@
 #include <linux/regulator/mt6358-regulator.h>
 #include <linux/regulator/of_regulator.h>
 
-#define MT6358_BUCK_MODE_AUTO	0
-#define MT6358_BUCK_MODE_FORCE_PWM	1
+#include <dt-bindings/regulator/mediatek,mt6397-regulator.h>
 
 /*
  * MT6358 regulators' information
@@ -326,7 +325,7 @@ static const struct linear_range vldo28_ranges[] = {
 
 static unsigned int mt6358_map_mode(unsigned int mode)
 {
-	return mode == MT6358_BUCK_MODE_AUTO ?
+	return mode == MT6397_BUCK_MODE_AUTO ?
 		REGULATOR_MODE_NORMAL : REGULATOR_MODE_FAST;
 }
 
@@ -371,10 +370,10 @@ static int mt6358_regulator_set_mode(struct regulator_dev *rdev,
 
 	switch (mode) {
 	case REGULATOR_MODE_FAST:
-		val = MT6358_BUCK_MODE_FORCE_PWM;
+		val = MT6397_BUCK_MODE_FORCE_PWM;
 		break;
 	case REGULATOR_MODE_NORMAL:
-		val = MT6358_BUCK_MODE_AUTO;
+		val = MT6397_BUCK_MODE_AUTO;
 		break;
 	default:
 		return -EINVAL;
@@ -402,9 +401,9 @@ static unsigned int mt6358_regulator_get_mode(struct regulator_dev *rdev)
 	}
 
 	switch ((regval & info->modeset_mask) >> (ffs(info->modeset_mask) - 1)) {
-	case MT6358_BUCK_MODE_AUTO:
+	case MT6397_BUCK_MODE_AUTO:
 		return REGULATOR_MODE_NORMAL;
-	case MT6358_BUCK_MODE_FORCE_PWM:
+	case MT6397_BUCK_MODE_FORCE_PWM:
 		return REGULATOR_MODE_FAST;
 	default:
 		return -EINVAL;
-- 
2.42.0.582.g8ccd20d70d-goog


