Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B8CEB8FB0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bmzyT3vhoavJV5YD/9bjCpBgNAP4o0u/rneto0+CusE=; b=Zm9Xcu77GWAhXs
	Ub4w7DzA+Gm9AMriXR8VIe0R5fZO3rnki8Y5jITqlvwOuqXyTn+62atPEn7ErW+B7ZjMmoOOvE/Cf
	150GIl+MBT0qKnsddJ1MDxB3Htg5YZvz2Jh6Ou1CQeirBIGGm4LPASRZtugcORWBrnk+s2llEEO8R
	lxLD6jxdXDekGXn9l6X59bPfxFhHov4WK6xDN8LdUF0D+z3TZQBBV8gSsMwoFsAXtDMCZaR+m8KGQ
	xLr1VB9eCLl6vjawuME/wxbvKWoWsxuqnymbPB/oRsLeOwfczSseGzUzTNKAkqPBpI3wUMPa5kRzT
	+wTIu/8GwnkF8m7mieQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeD44-00Bzjm-0B;
	Thu, 07 Sep 2023 11:20:48 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeD40-00Bziw-2O;
	Thu, 07 Sep 2023 11:20:46 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 04FFB4081B;
	Thu,  7 Sep 2023 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1694085635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bmzyT3vhoavJV5YD/9bjCpBgNAP4o0u/rneto0+CusE=;
	b=w2FAf1f6NYSPYwdHbMqEXFMlOVdC4HmF1Q212UWEGrvaarckAZKkNtvCHUdLCSOkVipCza
	Ooe2QjKtAInOu1Qw0vq5sGegkzD3DyUtuvitA1FJ0oYh0f41J0DtoO6oUXy+UblT8QEd0e
	daPaIchb0Lp+CpS0c9Icp9+HxKt+47Y=
Received: from frank-G5.. (fttx-pool-217.61.150.154.bambit.de [217.61.150.154])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 0FBA2360465;
	Thu,  7 Sep 2023 11:20:34 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] thermal/drivers/mediatek: Fix control buffer enablement on MT7896
Date: Thu,  7 Sep 2023 13:20:18 +0200
Message-Id: <20230907112018.52811-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e7eeb8e1-00de-41f6-a5df-ce2e9164136e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_042044_965755_D61B683E 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Daniel Golle <daniel@makrotopia.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Reading thermal sensor on mt7986 devices returns invalid temperature:

bpi-r3 ~ # cat /sys/class/thermal/thermal_zone0/temp
 -274000

Fix this by adding missing members in mtk_thermal_data struct which were
used in mtk_thermal_turn_on_buffer after commit 33140e668b10.

Cc: stable@vger.kernel.org
Fixes: 33140e668b10 ("thermal/drivers/mediatek: Control buffer enablement tweaks")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index 843214d30bd8..967b9a1aead4 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -690,6 +690,9 @@ static const struct mtk_thermal_data mt7986_thermal_data = {
 	.adcpnp = mt7986_adcpnp,
 	.sensor_mux_values = mt7986_mux_values,
 	.version = MTK_THERMAL_V3,
+	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
+	.apmixed_buffer_ctl_mask = GENMASK(31, 6) | BIT(3),
+	.apmixed_buffer_ctl_set = BIT(0),
 };
 
 static bool mtk_thermal_temp_is_valid(int temp)
-- 
2.34.1


