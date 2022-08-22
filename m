Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536F3C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dgr+R+Ooqj7O8IbEZN3k8kABePugAAeIHX9669QxJ80=; b=A6VR9o9qry0Zik4DOTVHi0OGG/
	9bjqi83BB/VsqWVoeLnbTJpH57xDAmfD9SXodpCv+M0YZAdtQ7XAMVFEdi73xBB6TIsmwQyv1mV4w
	nNcrmQIMq8JQ/suRukuhh6YYrrsk71TEAX7bUBJDHmm7wMTrfgxU0QihQORUI/9TtZA3iVXaZnrQF
	lH0Zsec2e4HUfoJ/o8ZS5gxQ8NpswDrHTwhc11OZ/6yZfG44Va7HVwalOWBPA1puOnUFExProdj2H
	T0AfvNREY5ZsO90iTaFC+T0k1js0yG+OmRKsf+90IEhlT778wAQqxEJZNXZc2a2GYumY7ey8fs9WW
	haFPElvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ8gG-00Bh65-Er; Mon, 22 Aug 2022 14:45:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ8gA-00BgoP-Mq
	for linux-mediatek@lists.infradead.org; Mon, 22 Aug 2022 14:45:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id u14so13495629wrq.9
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Aug 2022 07:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Dgr+R+Ooqj7O8IbEZN3k8kABePugAAeIHX9669QxJ80=;
        b=LXdfeBz4Yy+YTGZJbK0oIjM0jbxrBzTh2JKA8EQRGw5cj7NPVw6DJesIgZzMnzbIUe
         6WhtfX1+IUwKruRgjJCYvq5582adxr7Ldir/qTE7UE+tb6hulPZu9JmMnR+fyY9Bjg1C
         LQ5zeJ5GG1BJxZam5amMZlBnZ8rmsROB7xrRMM9FBINxScP25g3kv3faSjpEQko+Qf9R
         aZ6Ncv6BPWZANYEWPvWF4NXV8w/qC0O6DfiejY95tuzsbuJ70Qt123vMQ/WJmAZdvdBo
         0FnhZ0obLz2wQdDZDQHl8pFRYo/ufJEoji8SN38Lmc5DiOf3VvUZ3NF3bBM+ZjndK7+/
         IOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Dgr+R+Ooqj7O8IbEZN3k8kABePugAAeIHX9669QxJ80=;
        b=PN1S2IAN9DDjBkV3kxQmgqEUW7tSFK7LoqK3SyRkwrSRQxJJllI1Okxap4hunXsjS9
         kFN7ZBHAe8gL4VwGrHcydPJV38SJX3qg/uyTU8PjuCSzBfCGES0G8QXTYKkFhxjmLR7r
         KHfTTYUe7+sY57d6213vcIvIl1S+wktTe9dI+7/MB7zL8fQrZYoSBwKw70EIa60VYmwr
         tCP2cxsKpa2B4gAgbaostHyEh1zKAQFNL+mYOyEw9oNA8Ln6iQPOXceC2iyXfg92r3Sr
         PFSclRsEZ3HO4Tvvw26qehsGxXjKZPBl5+QBwLV1dbrZyrtlVBRzChb3ivgUaCYrnyTr
         hAxg==
X-Gm-Message-State: ACgBeo0q7ER2gAZl53uxOi76FzHrc0C4aN+GfAnhrJjjRwpQkLpTLvKD
	BNcbbDR9JJqrw9mK8gOGGOL9Qw==
X-Google-Smtp-Source: AA6agR6T30+0oOAruQ1NqH8Mc3XrzaGWuY4JttKOMhps4dvfSnG9rR5qWPpPk2ZQkHLHfHOIE3PQ9g==
X-Received: by 2002:a05:6000:1806:b0:225:5c19:6c75 with SMTP id m6-20020a056000180600b002255c196c75mr2040295wrh.524.1661179525219;
        Mon, 22 Aug 2022 07:45:25 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id z24-20020a1cf418000000b003a5dadcf1a8sm14670935wma.19.2022.08.22.07.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 07:45:24 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 4/4] soc: mediatek: pm-domains: Add support for MT8365
Date: Mon, 22 Aug 2022 16:43:03 +0200
Message-Id: <20220822144303.3438467-5-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822144303.3438467-1-msp@baylibre.com>
References: <20220822144303.3438467-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_074527_007707_0585D539 
X-CRM114-Status: GOOD (  15.50  )
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

From: Fabien Parent <fparent@baylibre.com>

Add the needed board data to support MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/soc/mediatek/mt8365-pm-domains.h | 147 +++++++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c    |   5 +
 2 files changed, 152 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8365-pm-domains.h

diff --git a/drivers/soc/mediatek/mt8365-pm-domains.h b/drivers/soc/mediatek/mt8365-pm-domains.h
new file mode 100644
index 000000000000..950ff90d5560
--- /dev/null
+++ b/drivers/soc/mediatek/mt8365-pm-domains.h
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8365_PM_DOMAINS_H
+#define __SOC_MEDIATEK_MT8365_PM_DOMAINS_H
+
+#include "mtk-pm-domains.h"
+#include <dt-bindings/power/mediatek,mt8365-power.h>
+
+/*
+ * MT8365 power domain support
+ */
+
+static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
+	[MT8365_POWER_DOMAIN_MM] = {
+		.name = "mm",
+		.sta_mask = PWR_STATUS_DISP,
+		.ctl_offs = 0x30c,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_STRICT_BUS_PROTECTION,
+		.bp_infracfg = {
+			BUS_PROT_WR(BIT(16) | BIT(17), 0x2a8, 0x2ac, 0x258),
+			BUS_PROT_WR(BIT(1) | BIT(2) | BIT(10) | BIT(11), 0x2a0, 0x2a4, 0x228),
+			BUS_PROT_WAY_EN(BIT(6), BIT(24), 0x200, 0x0),
+			BUS_PROT_WAY_EN(BIT(5), BIT(14), 0x234, 0x28),
+			BUS_PROT_WR(BIT(6), 0x2a0, 0x2a4, 0x228),
+		},
+	},
+	[MT8365_POWER_DOMAIN_VENC] = {
+		.name = "venc",
+		.sta_mask = PWR_STATUS_VENC,
+		.ctl_offs = 0x0304,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_smi = {
+			BUS_PROT_WR(BIT(1), 0x3c4, 0x3c8, 0x3c0),
+		},
+	},
+	[MT8365_POWER_DOMAIN_AUDIO] = {
+		.name = "audio",
+		.sta_mask = PWR_STATUS_AUDIO,
+		.ctl_offs = 0x0314,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
+		.sram_pdn_bits = GENMASK(12, 8),
+		.sram_pdn_ack_bits = GENMASK(17, 13),
+		.bp_infracfg = {
+			BUS_PROT_WR(BIT(27) | BIT(28), 0x2a8, 0x2ac, 0x258),
+		},
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8365_POWER_DOMAIN_CONN] = {
+		.name = "conn",
+		.sta_mask = PWR_STATUS_CONN,
+		.ctl_offs = 0x032c,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
+		.sram_pdn_bits = 0,
+		.sram_pdn_ack_bits = 0,
+		.bp_infracfg = {
+			BUS_PROT_WR(BIT(13), 0x2a0, 0x2a4, 0x228),
+			BUS_PROT_WR(BIT(18), 0x2a8, 0x2ac, 0x258),
+			BUS_PROT_WR(BIT(14), 0x2a0, 0x2a4, 0x228),
+			BUS_PROT_WR(BIT(21), 0x2a8, 0x2ac, 0x258),
+		},
+		.caps = MTK_SCPD_ACTIVE_WAKEUP | MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8365_POWER_DOMAIN_MFG] = {
+		.name = "mfg",
+		.sta_mask = PWR_STATUS_MFG,
+		.ctl_offs = 0x0338,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
+		.sram_pdn_bits = GENMASK(9, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(BIT(25), 0x2a0, 0x2a4, 0x228),
+			BUS_PROT_WR(BIT(21) | BIT(22), 0x2a0, 0x2a4, 0x228),
+		},
+	},
+	[MT8365_POWER_DOMAIN_CAM] = {
+		.name = "cam",
+		.sta_mask = BIT(25),
+		.ctl_offs = 0x0344,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
+		.sram_pdn_bits = GENMASK(9, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(BIT(19), 0x2a8, 0x2ac, 0x258),
+		},
+		.bp_smi = {
+			BUS_PROT_WR(BIT(2), 0x3c4, 0x3c8, 0x3c0),
+		},
+	},
+	[MT8365_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
+		.sta_mask = BIT(31),
+		.ctl_offs = 0x0370,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_smi = {
+			BUS_PROT_WR(BIT(3), 0x3c4, 0x3c8, 0x3c0),
+		},
+	},
+	[MT8365_POWER_DOMAIN_APU] = {
+		.name = "apu",
+		.sta_mask = BIT(16),
+		.ctl_offs = 0x0378,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
+		.sram_pdn_bits = GENMASK(14, 8),
+		.sram_pdn_ack_bits = GENMASK(21, 15),
+		.bp_infracfg = {
+			BUS_PROT_WR(BIT(2) | BIT(20), 0x2a8, 0x2ac, 0x258),
+		},
+		.bp_smi = {
+			BUS_PROT_WR(BIT(4), 0x3c4, 0x3c8, 0x3c0),
+		},
+	},
+	[MT8365_POWER_DOMAIN_DSP] = {
+		.name = "dsp",
+		.sta_mask = BIT(17),
+		.ctl_offs = 0x037C,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(BIT(24) | BIT(30) | BIT(31), 0x2a8, 0x2ac, 0x258),
+		},
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+};
+
+static const struct scpsys_soc_data mt8365_scpsys_data = {
+	.domains_data = scpsys_domain_data_mt8365,
+	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8365),
+};
+
+#endif /* __SOC_MEDIATEK_MT8365_PM_DOMAINS_H */
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index d323275aa11c..dbabdd688a1f 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -23,6 +23,7 @@
 #include "mt8186-pm-domains.h"
 #include "mt8192-pm-domains.h"
 #include "mt8195-pm-domains.h"
+#include "mt8365-pm-domains.h"
 
 #define MTK_POLL_DELAY_US		10
 #define MTK_POLL_TIMEOUT		USEC_PER_SEC
@@ -706,6 +707,10 @@ static const struct of_device_id scpsys_of_match[] = {
 		.compatible = "mediatek,mt8195-power-controller",
 		.data = &mt8195_scpsys_data,
 	},
+	{
+		.compatible = "mediatek,mt8365-power-controller",
+		.data = &mt8365_scpsys_data,
+	},
 	{ }
 };
 
-- 
2.37.2


