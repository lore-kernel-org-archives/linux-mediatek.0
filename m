Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5B7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 18:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7ClOaY29q/UhKGleJgriKV9seCgrAHzD4o55sbVqbE=; b=EQ3eNRze9BJ/19jmUxU+DH1VeD
	tL4Nb1yu0CcOqAdM08HxwpMI7h6mnwKtb2+KrhcS+Mt/IDOsNAgD6L72PVuVzQIdSTzELLnw+bCMq
	V7ET6oncq2cVTICqO5C+r4XnaFOHx5NyZfEDHVPm0/IVyVyBo5cQD2fAooHDhKaYb8oOICHQ67qiQ
	QAPrpbTj74G6dKLbR1SowVopB9M6dxShrj9E4WqAeo9GaIshC2/Vus9tp2MuB5Q4QDWAeFPIr6yZh
	NPejYEQ7oGHz3e5CbT+m09G1UcTRz1TIZ+OPNhSbGmnFoCh3bYmqIFbExFdLe7UCwB1w94d9BASNh
	oV2gYNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEEIm-009AE7-W7; Wed, 20 Jul 2022 18:20:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEEIN-009A03-1m
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 18:19:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h9so2209390wrm.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u7ClOaY29q/UhKGleJgriKV9seCgrAHzD4o55sbVqbE=;
        b=U25zxMuTlfG9FKoGJ8D0VJx2M73CYydlvOMHsJis/rV0YVmrC6mR0xG6wVsf0jVtsh
         LGYhX+2OZHZGLcWAYcBwN/kxj5pEKVfWT5CI5VYGAljVYrY+Tc6MtBikiOmQJ2WG1ElO
         ORuSxTh7fBcVgNVov8LDetdZJ0eiSyVtZZy/l1UjoMgZsBV8SEaNK5YFxMt6TSF63ODI
         ZSH8Q+t/5HwvjV+sbwr7RV8a1wYelm/dKcbV6mwjwG45OHZsG1YqVIniZL7nYRd1elvv
         rEW6Wxoz3UwFc07F5QgYKPyJCr2UYU/mr7bNC/sdKOddwNjIN8nGLWnMAxzpqeAOqmvF
         6cAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u7ClOaY29q/UhKGleJgriKV9seCgrAHzD4o55sbVqbE=;
        b=gP9uhEBh0YuJbq63MZE9015xspjJtX2SEEmLyIM8+MotRVaklbMnXLOHOI+b4Tf3lg
         PoxAIBkVm3jBZEiiRpOeDmC0CU1UDdPSLRPQKHzrfwRn4XH8zUXVgCl9PJNAgSCCVDzr
         6bvkiwKJ+vVsFA+oDzQAqdQyIDVQDhaN3c6K2jTclDe3IBDsgcf7ERrma9AOdKU9/U4a
         jZgIul8MYPuytgT+hcQogUAJbbczHxkSZvawPqjaJ49LDWITbyMKy6Y532PjeQDUlySY
         mPPEN1G5LAV2YbJSKtZ4i/zSOtfBkdmWuAPkQzT/IlL2/XKw/N1lHe0mf18VG/DhheRG
         yP4A==
X-Gm-Message-State: AJIora/RzlYBO60ql5DgaGUiniFg6OFRrceAFFSRlU9RS9Y8LjfGi1md
	xVyyI1k4teCN8N/+CGQVNUhKwhL5UvWt+w==
X-Google-Smtp-Source: AGRyM1vfj2pobuNQH2wthtGApjgEuP8BunLn/EqZqFLAOjATur0M5PpTlWR4RkCynwXU5aGpbpkUkw==
X-Received: by 2002:adf:ee4b:0:b0:21e:4ecf:b150 with SMTP id w11-20020adfee4b000000b0021e4ecfb150mr2128791wro.290.1658341177830;
        Wed, 20 Jul 2022 11:19:37 -0700 (PDT)
Received: from amjad-ThinkPad-T490.home (2a01cb040613180084408ac44a1fa242.ipv6.abo.wanadoo.fr. [2a01:cb04:613:1800:8440:8ac4:4a1f:a242])
        by smtp.googlemail.com with ESMTPSA id z17-20020a05600c0a1100b003a31d200a7dsm3400093wmp.9.2022.07.20.11.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 11:19:37 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: matthias.bgg@gmail.com
Cc: rafael@kernel.org,
	fparent@baylibre.com,
	amitk@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	robh+dt@kernel.org,
	rui.zhang@intel.com,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>
Subject: [PATCH v2 3/4] thermal: mediatek: control buffer enablement tweaks
Date: Wed, 20 Jul 2022 20:18:53 +0200
Message-Id: <20220720181854.547881-4-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220720181854.547881-1-aouledameur@baylibre.com>
References: <20220720181854.547881-1-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_111939_127098_98AAE86A 
X-CRM114-Status: GOOD (  14.69  )
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

From: Markus Schneider-Pargmann <msp@baylibre.com>

Add logic in order to be able to turn on the control buffer on MT8365.
This change now allows to have control buffer support for MTK_THERMAL_V1,
and it allows to define the register offset, and mask used to enable it.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Tested-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
 drivers/thermal/mtk_thermal.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 216eb0d61c5b..1dc276f8c4f1 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -283,6 +283,9 @@ struct mtk_thermal_data {
 	bool need_switch_bank;
 	struct thermal_bank_cfg bank_data[MAX_NUM_ZONES];
 	enum mtk_thermal_version version;
+	u32 apmixed_buffer_ctl_reg;
+	u32 apmixed_buffer_ctl_mask;
+	u32 apmixed_buffer_ctl_set;
 };
 
 struct mtk_thermal {
@@ -578,6 +581,9 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
 	.adcpnp = mt7622_adcpnp,
 	.sensor_mux_values = mt7622_mux_values,
 	.version = MTK_THERMAL_V2,
+	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
+	.apmixed_buffer_ctl_mask = ~0x37,
+	.apmixed_buffer_ctl_set = 0x1,
 };
 
 /*
@@ -1031,14 +1037,18 @@ static const struct of_device_id mtk_thermal_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_thermal_of_match);
 
-static void mtk_thermal_turn_on_buffer(void __iomem *apmixed_base)
+static void mtk_thermal_turn_on_buffer(struct mtk_thermal *mt,
+				       void __iomem *apmixed_base)
 {
 	int tmp;
 
-	tmp = readl(apmixed_base + APMIXED_SYS_TS_CON1);
-	tmp &= ~(0x37);
-	tmp |= 0x1;
-	writel(tmp, apmixed_base + APMIXED_SYS_TS_CON1);
+	if (!mt->conf->apmixed_buffer_ctl_reg)
+		return;
+
+	tmp = readl(apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
+	tmp &= mt->conf->apmixed_buffer_ctl_mask;
+	tmp |= mt->conf->apmixed_buffer_ctl_set;
+	writel(tmp, apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
 	udelay(200);
 }
 
@@ -1138,8 +1148,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		goto err_disable_clk_auxadc;
 	}
 
+	mtk_thermal_turn_on_buffer(mt, apmixed_base);
+
 	if (mt->conf->version == MTK_THERMAL_V2) {
-		mtk_thermal_turn_on_buffer(apmixed_base);
 		mtk_thermal_release_periodic_ts(mt, auxadc_base);
 	}
 
-- 
2.37.1


