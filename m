Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AA8C76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 03:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YUxMnnBoBjKrP6eT7G8iGitEYRUBySq8m73f+BY/FXE=; b=RFudzqa7PkuOQ1Ce4lnsqoSO/p
	N2BhrgrAwTLlXT/iO3kTUfr03RF2hFrMyobmeRIxbk+crlgrz2TEptt4mQun/HoSK3xwN3yM49ln9
	lKPvnbFLFYTCU2vJBT3iQnYMYqkHUAAJGrVe8wGoksgj9xdJi7mWXqLVkub6/Rj+LqnXth2XpLnOo
	ganXLDjZP+EMtHP1HaI0ExAl5SLpabBCtvMyRbH8J+cyDUPKhgUkAfUK2rUltvz3j1YrPsFqq4hw4
	6QIuRD+ibPfdEtn/6TMIewwtW3qBptel9FOprGyIVejUq34B7+8Y8UKodvidzApr2SnCQ9dxZK3FB
	YN4s+SsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgzjC-00Cyau-0X;
	Tue, 28 Mar 2023 03:10:30 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgzj9-00CyZQ-0x
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 03:10:28 +0000
Received: by mail-pg1-x534.google.com with SMTP id bn14so6374480pgb.11
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Mar 2023 20:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679973023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUxMnnBoBjKrP6eT7G8iGitEYRUBySq8m73f+BY/FXE=;
        b=KdHMYTZ+x9N6Y2ZHPvM5OOf1HdzpFEikBS2iQZV+B3QYXIXaprCuBPEykGaIjjMmmF
         9yBnctCbUSfOtGcS6D2OKWoLezvO0rWEsqrEsAbWMSCdVqW845rKaQWrVUDNWzkxkAVA
         NGl8Zrn5UXoCHPws2BjWSXs8FdoqXZyblqoUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679973023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUxMnnBoBjKrP6eT7G8iGitEYRUBySq8m73f+BY/FXE=;
        b=k4rTDPkIGiSzDGIlX8P6MAc65Ar97W1jyM1uRTjVagQVtnRdVRwNQ9AAZyeBoE8jzA
         p+CfGWFSWoUQNx2IGnGRuT27m+bRqPeg9O2GPiTf4WMnd1HZRCjzBAQnQLZWcBfS/hjM
         8nJq3lZmN66vE8hCvrtPITsWscjxzqNf76vG/RIm8GDcndEgMcEBDRmCS952dlyBq/uK
         jWE22qZ2XDRpzOfGNSJ8blXL7LuCCrxksnpsaweNwJWNlbN24p+AG5REDfppuxts98bm
         vNo+ajrm9tdwnbji9r+WC/skyXFIwe9xauXmTxr7fjHskwb3ohipm/h89NOEQtyDykQy
         FKYg==
X-Gm-Message-State: AAQBX9duMSIzTKjRLGhij+J6DuvQGqsmJLHKtE07FLNGF4TIb2BXHqTs
	XYKCb/fl8Bp6raA7vYDfG5qdfw==
X-Google-Smtp-Source: AKy350bC0L1BKVrEfalM7Kp5nZEIaRUuRJee1hKp+ImAy2irYV3TzoJlLwy5gM6RcRC6DEXB1+GhuA==
X-Received: by 2002:a62:198a:0:b0:626:f692:5b1 with SMTP id 132-20020a62198a000000b00626f69205b1mr12059691pfz.22.1679973023114;
        Mon, 27 Mar 2023 20:10:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:da70:de00:9a3d:7067])
        by smtp.gmail.com with ESMTPSA id n26-20020aa78a5a000000b006260e5bdd81sm19548719pfa.45.2023.03.27.20.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 20:10:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: Fix sensor 1 interrupt status bitmask
Date: Tue, 28 Mar 2023 11:10:17 +0800
Message-Id: <20230328031017.1360976-1-wenst@chromium.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_201027_365320_0A061972 
X-CRM114-Status: GOOD (  12.44  )
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

The binary representation for sensor 1 interrupt status was incorrectly
assembled, when compared to the full table given in the same comment
section. The conversion into hex was also incorrect, leading to
incorrect interrupt status bitmask for sensor 1. This would cause the
driver to incorrectly identify changes for sensor 1, when in fact it
was sensor 0, or a sensor access time out.

Fix the binary and hex representations in the comments, and the actual
bitmask macro.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/thermal/mediatek/lvts_thermal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index ca16c90e1d55..d87d3847c7d0 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -66,7 +66,7 @@
 #define LVTS_MONINT_CONF			0x9FBF7BDE
 
 #define LVTS_INT_SENSOR0			0x0009001F
-#define LVTS_INT_SENSOR1			0X000881F0
+#define LVTS_INT_SENSOR1			0x001203E0
 #define LVTS_INT_SENSOR2			0x00247C00
 #define LVTS_INT_SENSOR3			0x1FC00000
 
@@ -396,8 +396,8 @@ static irqreturn_t lvts_ctrl_irq_handler(struct lvts_ctrl *lvts_ctrl)
 	 *                  => 0x1FC00000
 	 * sensor 2 interrupt: 0000 0000 0010 0100 0111 1100 0000 0000
 	 *                  => 0x00247C00
-	 * sensor 1 interrupt: 0000 0000 0001 0001 0000 0011 1110 0000
-	 *                  => 0X000881F0
+	 * sensor 1 interrupt: 0000 0000 0001 0010 0000 0011 1110 0000
+	 *                  => 0X001203E0
 	 * sensor 0 interrupt: 0000 0000 0000 1001 0000 0000 0001 1111
 	 *                  => 0x0009001F
 	 */
-- 
2.40.0.348.gf938b09366-goog


