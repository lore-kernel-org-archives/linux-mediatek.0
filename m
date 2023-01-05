Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADECC4708E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 20:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vP64e5b9ohPWmtQISJdT6ZMeITPgHiIqXiaeBFbmRb0=; b=Nmvqg1KKDEnaUCNjMRlcCnWkwK
	4/CQsTd4Mzg8rbCdsUqFEj/3MWwuPhL8BBGp+8yjN6maglSNMU/UuicDImmkehjh2k4DX/L+jZXsy
	shrOFcVorSOYWyvglQjLDOe455y76ctGLtubmGbwc+0zh83j6PtspiVAUvT4OKe9H5Fc11rfiwuGs
	Yn38qP/qoyR1f/lLGRv/JgXsCL6O2O9NsSGpDr+mJQYT5UyTPFmeTPBP+rutoctgxDd7MlV3ZfJ4W
	MnDcoKTKTpyIwhGwhhmmn/jIm0DK021y6QKPscbdurvWrsRyjqnkkHi6rItRC6h9qS0DNRzQgcAsx
	J5uRx2KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDX60-00EhaD-40; Thu, 05 Jan 2023 20:44:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDTz6-00CujA-37
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 17:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vP64e5b9ohPWmtQISJdT6ZMeITPgHiIqXiaeBFbmRb0=; b=kYygBVG+Aq0vLXTIDwCAjVkbUl
	hkDx/stb7EWPRH9fp2Gyb/+W+0qnXyuCWQQihfOXH7zjnLeotkg1+XdLVu2nIBYhO5xxotMQJ1ddc
	YmdTfhJ32gcuxxpicDa1hJJ+Hcd4/2+ZB0repbMEK7x9CNleTyt+BXcg4HQSS7k5QGTYV5Ufvl3ze
	fxfrhCAvNOK/i17aAovruJlUKZWhiPwXwbizGt41DuOXOWCTBWguKLU4eSLUjWP2g9KyenlkQJ3Go
	rrPFE6cGdvBrcrNSCLT+st8MEc202friVTMSx8C1CISADiztmTGsf1aVNNjR8hQ5k21cFqOuasBCV
	DeQSilfQ==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDTiq-00GKHx-Vq
	for linux-mediatek@lists.infradead.org; Thu, 05 Jan 2023 17:08:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id d4so28790882wrw.6
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 09:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vP64e5b9ohPWmtQISJdT6ZMeITPgHiIqXiaeBFbmRb0=;
        b=eCNMHDOaWZVSQxYE+JmQV8tG4HWDvxojEViLcY7wJRhQzMqsxDtzFgrjlujeERKhEJ
         K0R+BPVOcnmZJN/RtFEVPnktuxHBcDaWQFKZjnQc9SiYGXl050ITes6RIuDXKQvovVsx
         cQLSaMVucd2bHrRVTvYJXc51FFdbtJjUMmUBO5enk1YjPGB41+VRZeiayZVAjQN4P7MV
         4vXCOG2iTMFbLNZwUX6bethu+JxTW4TqemawA2IosX5KXyVrFxR+/KDGM5hbpwXU8iFt
         RUdriaIDnqvhqMXPjviX6VExdGwnWGyJKKpnrXqdALfTL8unN3/nibCPRyzkxe7qbeI1
         ns7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vP64e5b9ohPWmtQISJdT6ZMeITPgHiIqXiaeBFbmRb0=;
        b=kDz1F/wDfbowBCEqH7APKSU1betskI3HQNNiUtMnDNYiLH65j43dRFaUO8xJbTjQJY
         h3ed/B+3R4c5lu+kyJul7S3c2rSjTYpX2pzr682GpIEPpbRAw+A5+mlIsO/sXrawCOab
         LBZl+wto1wdNja+76cLMRMVIS5qhs3t4baZS77MmL2ty+hTn+pYhdA5kCTocETwBfynj
         bm+xj/Gfnmpro8yKGbLnMKDbtAWxNpK7lk7x7qraBqPUnsgJrA+3P/m+KPYuxQcF2rST
         DeXZk2GrH+HJZLjxftIp4h3tgegPz+dzk/A44ZkOv1eeCk7gM9rosXo23SjRtx2cs2+/
         3WRQ==
X-Gm-Message-State: AFqh2kpwzsDBjmquLRcC/RxhoMCVRKY1S2Mge5ybnjQLr3GhbaxiMwsB
	Xy+AB5eMs4Moox5UMNTfIjIk0g==
X-Google-Smtp-Source: AMrXdXs2RKfEtCAqsPWOgrfPiuG4a6OOYOxjvHp/8Zh9GrpmHzgNu0JjO9S3KNSOrksOPYFxO2638A==
X-Received: by 2002:a05:6000:242:b0:27f:aa94:a9f2 with SMTP id m2-20020a056000024200b0027faa94a9f2mr23955810wrz.68.1672938475251;
        Thu, 05 Jan 2023 09:07:55 -0800 (PST)
Received: from blmsp.fritz.box ([2001:4091:a245:805c:9cf4:fdb8:bb61:5f4e])
        by smtp.gmail.com with ESMTPSA id f14-20020adfe90e000000b002365730eae8sm37164853wrm.55.2023.01.05.09.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:07:54 -0800 (PST)
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
Subject: [PATCH 8/8] soc: mediatek: pm-domains: Add support for MT8365
Date: Thu,  5 Jan 2023 18:07:35 +0100
Message-Id: <20230105170735.1637416-9-msp@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105170735.1637416-1-msp@baylibre.com>
References: <20230105170735.1637416-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_170809_155719_4D60FCC6 
X-CRM114-Status: GOOD (  15.28  )
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
index 000000000000..8735e833b15b
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
+		.caps = MTK_SCPD_STRICT_BUS_PROTECTION | MTK_SCPD_HAS_WAY_EN,
+		.bp_infracfg = {
+			BUS_PROT_WR(BIT(16) | BIT(17), 0x2a8, 0x2ac, 0x258),
+			BUS_PROT_WR(BIT(1) | BIT(2) | BIT(10) | BIT(11), 0x2a0, 0x2a4, 0x228),
+			BUS_PROT_WAY_EN(BIT(6), 0x200, BIT(24), 0x0),
+			BUS_PROT_WAY_EN(BIT(5), 0x234, BIT(14), 0x28),
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
index 29a9028dd9b3..adb7716df0a8 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -23,6 +23,7 @@
 #include "mt8186-pm-domains.h"
 #include "mt8192-pm-domains.h"
 #include "mt8195-pm-domains.h"
+#include "mt8365-pm-domains.h"
 
 #define MTK_POLL_DELAY_US		10
 #define MTK_POLL_TIMEOUT		USEC_PER_SEC
@@ -647,6 +648,10 @@ static const struct of_device_id scpsys_of_match[] = {
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
2.39.0


