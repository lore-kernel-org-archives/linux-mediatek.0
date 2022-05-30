Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FF5C43219
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 18:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSAlhqVN+IfJoy7zZnTThlCKUMrqvzi6Np69TYeKfoc=; b=kYyWDfyw2holk7
	UfkOrZ3uGYzlG94GZK8ZNBy8UijM93D6uvz5qcdu4Fh1gEsP8guec37ZO23BYObCASLjIdMu5XZFd
	Dv6jtJcKc+Nz7RPMWJwI4v8z0Aq38Y14M9ELstTK7f/Ff4rDlQHR/r7Bq+/an9ZfQEldZE1qKadqA
	J/Tuvy3N5JVPyaB7YI+l9JWS5o/v2+/VQYnykhRBDxqItU+W3KjHPBQjO1Ev43n3fzq78C8IDJ8sq
	5ZJQG2OD2GXyXkq7I/2KXvhLETD5rCPlT3XMWL44IptRB6UL4D4Fyo1f2hEvnJ4O2aTMQHKC1XXn9
	C/S06xthatzT4Pz2MIkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvkIN-007tOU-4x; Mon, 30 May 2022 18:39:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvkHt-007tFI-Uc
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 18:38:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id n124-20020a1c2782000000b003972dfca96cso33390wmn.4
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 11:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WJIpNSj7cFGZKfz96vdTia4ueHbBhL0XrZ+0w4C6IYE=;
        b=538U10qwEaxm5rxxQsk5NI8sE5wUkOtH4BNKM+zfVW0GNB3vHD62f5U//NDRHmkV2B
         qccG+9m1TxPPc1csSJClj4js1U/gKXBMW0oLYqcBN4XDfCzoIU+RaHH+M0czK+u/H+Wc
         sKkwZqIHJk+KDm7Z1+T36ysTnoDVBBwLEN1RoO2WKRVjUHvKnNVfiIsjWYBMp+9GrSmo
         M1A7vAoy2itFKot4G3HbNejLNaXxeUHQMsQoJ42415V4yTjXKz/RiOO660+SD4QPfkOR
         aIybp4d8hZ7xnZy1f9IYmoeBpAPOCvyuyvO9vovewnScKqmFJTIZS9uESXjhRJRldFHg
         uXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WJIpNSj7cFGZKfz96vdTia4ueHbBhL0XrZ+0w4C6IYE=;
        b=3hjnHH8DSB6LtV6Dz19xYX4xCMGQZB5/qfezTMeiCMcJpoN6C591xozgAF2B+/cSHU
         nJ2P0C9tpgSazJtSbNozIqc/Zz5irVAuMMEiiJqnhr/M66V3bi6aTU79gNN+O7GUwkap
         q9eysWsQROPr+kl3aEmXLtiGZwAyufHmf4Fyg7+mSEasqaYOcru2a035un0vjE00UCvj
         y48uY1Dw2W4aDotgo1akBTRoFh9HatO15RgYChD+FLN984KJM3bj+SndNB7tTbD9oEQM
         HzTutlh+vPxT3B7v0xC4q5R1LtcCZ0ftx084+c1x4psPQU9GoQMI7EwIx5k/CqXAWKCr
         kFog==
X-Gm-Message-State: AOAM532MF2axthdOnuXrATF5rnynEJ3dLGqwPPlv+fR0pnhYj00ShLl2
	B2MnAJk4z6oycdTkGl/jR+PNNA==
X-Google-Smtp-Source: ABdhPJzFPNMdqmxWHsp0ZjP89yZHiEJv77pVuSJhjJ50Elj7hVUbK5nlDWSL0Bz9w+pTjOdDshlSxw==
X-Received: by 2002:a05:600c:4ca1:b0:397:8b29:255a with SMTP id g33-20020a05600c4ca100b003978b29255amr15885946wmp.139.1653935921545;
        Mon, 30 May 2022 11:38:41 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id e9-20020adfe389000000b0020c5253d8fcsm11459088wrm.72.2022.05.30.11.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 11:38:40 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] thermal: mediatek: control buffer enablement tweaks
Date: Mon, 30 May 2022 20:38:32 +0200
Message-Id: <20220530183833.863040-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530183833.863040-1-fparent@baylibre.com>
References: <20220530183833.863040-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_113846_028475_45443197 
X-CRM114-Status: GOOD (  15.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Markus Schneider-Pargmann <msp@baylibre.com>

Add logic in order to be able to turn on the control buffer on MT8365.
This change now allows to have control buffer support for MTK_THERMAL_V1,
and it allows to define the register offset, and mask used to enable it.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/thermal/mtk_thermal.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index ede94eadddda..b09738ef1093 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -271,6 +271,9 @@ struct mtk_thermal_data {
 	bool need_switch_bank;
 	struct thermal_bank_cfg bank_data[MAX_NUM_ZONES];
 	enum mtk_thermal_version version;
+	u32 apmixed_buffer_ctl_reg;
+	u32 apmixed_buffer_ctl_mask;
+	u32 apmixed_buffer_ctl_set;
 };
 
 struct mtk_thermal {
@@ -514,6 +517,9 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
 	.adcpnp = mt7622_adcpnp,
 	.sensor_mux_values = mt7622_mux_values,
 	.version = MTK_THERMAL_V2,
+	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
+	.apmixed_buffer_ctl_mask = ~0x37,
+	.apmixed_buffer_ctl_set = 0x1,
 };
 
 /*
@@ -963,14 +969,18 @@ static const struct of_device_id mtk_thermal_of_match[] = {
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
 
@@ -1070,8 +1080,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		goto err_disable_clk_auxadc;
 	}
 
+	mtk_thermal_turn_on_buffer(mt, apmixed_base);
+
 	if (mt->conf->version == MTK_THERMAL_V2) {
-		mtk_thermal_turn_on_buffer(apmixed_base);
 		mtk_thermal_release_periodic_ts(mt, auxadc_base);
 	}
 
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
