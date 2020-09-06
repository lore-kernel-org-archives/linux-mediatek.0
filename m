Return-Path: <SRS0=UOtS=CP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADB1C433E2
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 17:24:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C4C2075A
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 17:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Blf/IfEe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GSYmCjav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5C4C2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PYb2AmcYuKaDctjUee3SCmSAcxAEjiKu3GbS22k8s64=; b=Blf/IfEe7tKYIvDsNNxGU6z5s
	inqk22I9TcRvJIdLqeCWqy90AJehEGN60kpk7gFtYA8m+PK3OuPFOeR0T3qkoQGfyQwBWOLWDQDub
	svRfna+ZSvkd0qDU9wZyB5BPycBD9LnflvHR8osc3zabkfkhc64yGB1w3rOW7uNBIvRAw/9vMGkmQ
	Bkg0aaFVDT3FjsPqZhr/9xPESKj7+t1OW+po+sr9LwlNBTO74Fdt+S7UNsVLi/KQsasmvCNDA6jci
	cKGHw5QZ+VOOmWs3IphHoaSn0UaY52+FjyuhpkORhjRIYRPiZoC4cP9Y8b+od2IpD698XG3mLSphy
	5ipS4LMdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEyOS-0005h3-O9; Sun, 06 Sep 2020 17:23:56 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEyON-0005fT-2S
 for linux-mediatek@lists.infradead.org; Sun, 06 Sep 2020 17:23:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id a17so12554143wrn.6
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Sep 2020 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5LFv5ZzrVOAZXLCXj1U+E9oMgR2hqbPqCxx8fHUWScg=;
 b=GSYmCjav2aZ0QhgMTTV2qcj7Jla39knHA76pCWIbROE5UHL1B9bue+wfrpvN6uUQ+u
 Mt471x1TRdzFcB2Hovb9nv1XWxAVTGOc4yd3LS9jyA8Eo7XoVXR83/X/eVOqOS/3FA1g
 RblNCxiwOGushHpmwDedToQykLg1aa3C29ePp+XuqhbkxX1QAu4EFdkX9JGXzuSCkhfb
 yir95FfKypfPGgQT+tyOvkHtmn3nNrzlT4MbFzgQ2Moh4ciUVxa5+/jxTL1wBdqSJU1D
 nGNs6t2sFGAXTXFmoUdir4ih8dho/XmuoECl60z5gK73qlfw4DkGAva44YPtencAF9Cm
 gR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5LFv5ZzrVOAZXLCXj1U+E9oMgR2hqbPqCxx8fHUWScg=;
 b=tIt5lD8Zw5e8lPgKLrwNMdYdbVHCt8kJBG2blRPQHSyLySfF8EcukwepZd/kxQdYw6
 1JQLDS7oayuG0WiqLlWn0TTEhftoh5Vt7O15bs4NxPiE44CoBmk3rLMVYvLjR4ztfeIA
 AMY2cQkSm6MPXk9N/vBnfKST8/+RRJUyEkQ5PO8ROXLNmc/QI+jKX1JnSftrHri+IJRi
 5A7BHvyEuJjPO7pF3L3TCwIzMS5QBHHqjQPWqeqpH/9sTv6adafiKW6xvNzXpkw2ZHVO
 6uLvnJiOS1iy6gs0m3med2k2QdVvSLJbZk0SSnTJDWft95QjxhQACrTsQ+TYUIPwb2Rg
 huDg==
X-Gm-Message-State: AOAM531XAQtU+NDHmb32I9VI3ANg0j34c+Yd3yfD0tZLItQ3p0V8gePB
 ej3jAJTKBgN8SNMZOtNBi6CsPw==
X-Google-Smtp-Source: ABdhPJxdwKrbmm/JNyMDgs0+HCcl31Zmvuic08YJEaYa3l1Ok6Ysb6o9cijYOYLzCz/0m5GNM6rTAQ==
X-Received: by 2002:adf:e2c7:: with SMTP id d7mr17499432wrj.110.1599413029588; 
 Sun, 06 Sep 2020 10:23:49 -0700 (PDT)
Received: from localhost.localdomain (208.19.23.93.rev.sfr.net. [93.23.19.208])
 by smtp.gmail.com with ESMTPSA id p18sm4490311wrx.47.2020.09.06.10.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 10:23:49 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] soc: mediatek: add SCPSYS power dmain for MT8167 SoC
Date: Sun,  6 Sep 2020 19:23:37 +0200
Message-Id: <20200906172337.1052933-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200906172337.1052933-1-fparent@baylibre.com>
References: <20200906172337.1052933-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200906_132351_158051_148661C5 
X-CRM114-Status: GOOD (  14.98  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ulf.hansson@linaro.org, krzk@kernel.org,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 mars.cheng@mediatek.com, macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
 owen.chen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add SCPSYS power domain support for MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/soc/mediatek/mtk-scpsys.c     | 99 +++++++++++++++++++++++++++
 include/linux/soc/mediatek/infracfg.h |  8 +++
 2 files changed, 107 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index f669d3754627..ce897720ef17 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/mt6797-power.h>
 #include <dt-bindings/power/mt7622-power.h>
 #include <dt-bindings/power/mt7623a-power.h>
+#include <dt-bindings/power/mt8167-power.h>
 #include <dt-bindings/power/mt8173-power.h>
 
 #define MTK_POLL_DELAY_US   10
@@ -89,6 +90,7 @@ enum clk_id {
 	CLK_HIFSEL,
 	CLK_JPGDEC,
 	CLK_AUDIO,
+	CLK_AXI_MFG,
 	CLK_MAX,
 };
 
@@ -103,6 +105,7 @@ static const char * const clk_names[] = {
 	"hif_sel",
 	"jpgdec",
 	"audio",
+	"axi_mfg",
 	NULL,
 };
 
@@ -911,6 +914,87 @@ static const struct scp_domain_data scp_domain_data_mt7623a[] = {
 	},
 };
 
+/*
+ * MT8167 power domain support
+ */
+#define PWR_STATUS_MFG_2D_MT8167	BIT(24)
+#define PWR_STATUS_MFG_ASYNC_MT8167	BIT(25)
+
+static const struct scp_domain_data scp_domain_data_mt8167[] = {
+	[MT8167_POWER_DOMAIN_DISP] = {
+		.name = "disp",
+		.sta_mask = PWR_STATUS_DISP,
+		.ctl_offs = SPM_DIS_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bus_prot_mask = MT8167_TOP_AXI_PROT_EN_MM_EMI |
+				 MT8167_TOP_AXI_PROT_EN_MCU_MM,
+		.clk_id = {CLK_MM},
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8167_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
+		.sta_mask = PWR_STATUS_VDEC,
+		.ctl_offs = SPM_VDE_PWR_CON,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.clk_id = {CLK_MM, CLK_VDEC},
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8167_POWER_DOMAIN_ISP] = {
+		.name = "isp",
+		.sta_mask = PWR_STATUS_ISP,
+		.ctl_offs = SPM_ISP_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.clk_id = {CLK_MM},
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8167_POWER_DOMAIN_MFG_ASYNC] = {
+		.name = "mfg_async",
+		.sta_mask = PWR_STATUS_MFG_ASYNC_MT8167,
+		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
+		.sram_pdn_bits = 0,
+		.sram_pdn_ack_bits = 0,
+		.bus_prot_mask = MT8167_TOP_AXI_PROT_EN_MCU_MFG |
+				 MT8167_TOP_AXI_PROT_EN_MFG_EMI,
+		.clk_id = {CLK_MFG, CLK_AXI_MFG},
+	},
+	[MT8167_POWER_DOMAIN_MFG_2D] = {
+		.name = "mfg_2d",
+		.sta_mask = PWR_STATUS_MFG_2D_MT8167,
+		.ctl_offs = SPM_MFG_2D_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.clk_id = {CLK_NONE},
+	},
+	[MT8167_POWER_DOMAIN_MFG] = {
+		.name = "mfg",
+		.sta_mask = PWR_STATUS_MFG,
+		.ctl_offs = SPM_MFG_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.clk_id = {CLK_NONE},
+	},
+	[MT8167_POWER_DOMAIN_CONN] = {
+		.name = "conn",
+		.sta_mask = PWR_STATUS_CONN,
+		.ctl_offs = SPM_CONN_PWR_CON,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = 0,
+		.bus_prot_mask = MT8167_TOP_AXI_PROT_EN_CONN_EMI |
+				 MT8167_TOP_AXI_PROT_EN_CONN_MCU |
+				 MT8167_TOP_AXI_PROT_EN_MCU_CONN,
+		.clk_id = {CLK_NONE},
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+};
+
+static const struct scp_subdomain scp_subdomain_mt8167[] = {
+	{MT8167_POWER_DOMAIN_MFG_ASYNC, MT8167_POWER_DOMAIN_MFG_2D},
+	{MT8167_POWER_DOMAIN_MFG_2D, MT8167_POWER_DOMAIN_MFG},
+};
+
 /*
  * MT8173 power domain support
  */
@@ -1064,6 +1148,18 @@ static const struct scp_soc_data mt7623a_data = {
 	.bus_prot_reg_update = true,
 };
 
+static const struct scp_soc_data mt8167_data = {
+	.domains = scp_domain_data_mt8167,
+	.num_domains = ARRAY_SIZE(scp_domain_data_mt8167),
+	.subdomains = scp_subdomain_mt8167,
+	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt8167),
+	.regs = {
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+	},
+	.bus_prot_reg_update = true,
+};
+
 static const struct scp_soc_data mt8173_data = {
 	.domains = scp_domain_data_mt8173,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt8173),
@@ -1096,6 +1192,9 @@ static const struct of_device_id of_scpsys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt7623a-scpsys",
 		.data = &mt7623a_data,
+	}, {
+		.compatible = "mediatek,mt8167-scpsys",
+		.data = &mt8167_data,
 	}, {
 		.compatible = "mediatek,mt8173-scpsys",
 		.data = &mt8173_data,
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index fd25f0148566..6ee49bf90acf 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -2,6 +2,14 @@
 #ifndef __SOC_MEDIATEK_INFRACFG_H
 #define __SOC_MEDIATEK_INFRACFG_H
 
+#define MT8167_TOP_AXI_PROT_EN_MM_EMI		BIT(1)
+#define MT8167_TOP_AXI_PROT_EN_MCU_MFG		BIT(2)
+#define MT8167_TOP_AXI_PROT_EN_CONN_EMI		BIT(4)
+#define MT8167_TOP_AXI_PROT_EN_MFG_EMI		BIT(5)
+#define MT8167_TOP_AXI_PROT_EN_CONN_MCU		BIT(8)
+#define MT8167_TOP_AXI_PROT_EN_MCU_CONN		BIT(9)
+#define MT8167_TOP_AXI_PROT_EN_MCU_MM		BIT(11)
+
 #define MT8173_TOP_AXI_PROT_EN_MCI_M2		BIT(0)
 #define MT8173_TOP_AXI_PROT_EN_MM_M0		BIT(1)
 #define MT8173_TOP_AXI_PROT_EN_MM_M1		BIT(2)
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
