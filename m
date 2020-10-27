Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A62C388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 13:12:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 058EF20829
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 13:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dmpIJCa1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fO7GhI+T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 058EF20829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OsFPbPGhLulKcuE8Nwua7Vy55Z2zd1wj3dAlpes2MJE=; b=dmpIJCa1Sq/YfWo/DLLFkuH9m
	C2f1nIq6YFguNTtslFeNVGQCCoa9ghdARrGRqol86kvnWYga8M2LbarXd8jqSPI4TWqsqRAyl+UwG
	3fWiUOYxr8Kxl2ISNOZ4vMoR76eDR1k5W7913oPQSm8ufYTdAdNRMrFwQJT1LVuCQFt+rS3N0GOXD
	AfW63fY4MUMI7Rx/1hdDyy09u/9WfwTDTFnhpQ8U99efzxbaqwXO5ee2trr0vjNza/qR0O3zNjA09
	aqXMzsfR8noMB4w7qWeyibtGMltsOJUUJZTqZvRmRwEQYY61DbnN6C76PSKwlTqcek1QZzPUiUNxe
	qfpLrxMqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXOlc-0002HY-F4; Tue, 27 Oct 2020 13:12:00 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXOlX-0002FE-Fm
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 13:11:56 +0000
Received: by mail-wm1-x341.google.com with SMTP id c16so1393052wmd.2
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vNVNQ1C4yPexwHndr+DYW/xGHvtpoJAKylOs1IEPPgM=;
 b=fO7GhI+TZtPIbtW3DFMaaVYuhKOTCNAfVadXPYXBW/TBBJCx7CrTpTLWB+h+kWFc/4
 9X6pxsCQQvzBsa2fy3Ya3DlIA1Xb8mWtI0DcjfRfZVAGUf0WbTvtJkeG4bqV44Z5e+jB
 OksHNUv2kmIcNIB9XjbRA69ZEaxbt7LKzIRj1P2+N6OYFrnVp+vkGn4MtlZWRiBVk3aS
 KMIdUZVG6kcBthbyi36C04ie7xn7oROgDfWGwX+6VUzYxmVbVWF1Jo5vGOPsVoKu4gMU
 /RqD3CyGbBRy4ethJMkuV2PI6jrF4fl6xOGKrbS+jU8W0fCm22JN5SvgEFVTK/K5xZGG
 UCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vNVNQ1C4yPexwHndr+DYW/xGHvtpoJAKylOs1IEPPgM=;
 b=hs9VaulVZ8r/NurU11s9hcccTAoe3XDfk80qGlO8kbp9NUko7sDErYDajkbgc4NXXS
 LpH2R1vbFx9/GuLlwfZHHujHlPpB7JyO1QdUaUafKmdBJW1om43SLPPrn3DW9P0NhsB5
 QReQoz0lvZ+6wOILHkIOR9IUiED8ShILKg50wLmYCl7C1KxJpUt0CEnA4NeglX5RYHqH
 h3pTAde/ZhCF9T3a6IcXl7FIHaVs91hAs2R5TopPNJD9XYOjDMmmYisFg7vXdp3kjb0f
 aDF1Bqo2cu+LlkMWLvh7+mVuvelVDgh0a4U5WlPWlErgHcrlV0tmptA7h8Qci14xbTMO
 N5sg==
X-Gm-Message-State: AOAM530Q3DD54UfpklISo1XIYKcop14B+YAVFqx/deEx+5mgZuBx3EpS
 77vQ/pEqiSG6kTWSs2+XUmgLTg==
X-Google-Smtp-Source: ABdhPJxZXFIKc0Hpyvb9QsyEzWlj+7cvARDDgRDVOMUjKSMef72YMzDdd7aPCa5VUGK4KiFSR4lhiw==
X-Received: by 2002:a05:600c:2041:: with SMTP id
 p1mr2664300wmg.15.1603804311670; 
 Tue, 27 Oct 2020 06:11:51 -0700 (PDT)
Received: from localhost.localdomain (54.169.185.81.rev.sfr.net.
 [81.185.169.54])
 by smtp.gmail.com with ESMTPSA id v6sm1780117wmj.6.2020.10.27.06.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:11:50 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/2] soc: mediatek: pm-domains: Add support for mt8167
Date: Tue, 27 Oct 2020 14:11:21 +0100
Message-Id: <20201027131122.374046-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201027131122.374046-1-fparent@baylibre.com>
References: <20201027131122.374046-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_091155_581396_3BC908C1 
X-CRM114-Status: GOOD (  20.45  )
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
Cc: enric.balletbo@collabora.com, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the needed board data to support mt8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

This patch depends on the SCPSYS PM domains driver [0].

v2:
	* Implement on top of new SCPSYS PM domains driver [0]

[0] https://patchwork.kernel.org/project/linux-mediatek/list/?series=370737
 drivers/soc/mediatek/mt8167-pm-domains.h | 86 ++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c    |  5 ++
 drivers/soc/mediatek/mtk-pm-domains.h    |  1 +
 include/linux/soc/mediatek/infracfg.h    |  8 +++
 4 files changed, 100 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8167-pm-domains.h

diff --git a/drivers/soc/mediatek/mt8167-pm-domains.h b/drivers/soc/mediatek/mt8167-pm-domains.h
new file mode 100644
index 000000000000..ff18139d0d6c
--- /dev/null
+++ b/drivers/soc/mediatek/mt8167-pm-domains.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8167_PM_DOMAINS_H
+#define __SOC_MEDIATEK_MT8167_PM_DOMAINS_H
+
+#include "mtk-pm-domains.h"
+#include <dt-bindings/power/mt8167-power.h>
+
+#define MT8167_PWR_STATUS_MFG_2D	BIT(24)
+#define MT8167_PWR_STATUS_MFG_ASYNC	BIT(25)
+
+/*
+ * MT8167 power domain support
+ */
+
+static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
+	[MT8167_POWER_DOMAIN_DISP] = {
+		.sta_mask = PWR_STATUS_DISP,
+		.ctl_offs = SPM_DIS_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_UPDATE_TOPAXI(MT8167_TOP_AXI_PROT_EN_MM_EMI |
+					       MT8167_TOP_AXI_PROT_EN_MCU_MM),
+		},
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8167_POWER_DOMAIN_VDEC] = {
+		.sta_mask = PWR_STATUS_VDEC,
+		.ctl_offs = SPM_VDE_PWR_CON,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8167_POWER_DOMAIN_ISP] = {
+		.sta_mask = PWR_STATUS_ISP,
+		.ctl_offs = SPM_ISP_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8167_POWER_DOMAIN_MFG_ASYNC] = {
+		.sta_mask = MT8167_PWR_STATUS_MFG_ASYNC,
+		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
+		.sram_pdn_bits = 0,
+		.sram_pdn_ack_bits = 0,
+		.bp_infracfg = {
+			BUS_PROT_UPDATE_TOPAXI(MT8167_TOP_AXI_PROT_EN_MCU_MFG |
+					       MT8167_TOP_AXI_PROT_EN_MFG_EMI),
+		},
+	},
+	[MT8167_POWER_DOMAIN_MFG_2D] = {
+		.sta_mask = MT8167_PWR_STATUS_MFG_2D,
+		.ctl_offs = SPM_MFG_2D_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+	},
+	[MT8167_POWER_DOMAIN_MFG] = {
+		.sta_mask = PWR_STATUS_MFG,
+		.ctl_offs = SPM_MFG_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+	},
+	[MT8167_POWER_DOMAIN_CONN] = {
+		.sta_mask = PWR_STATUS_CONN,
+		.ctl_offs = SPM_CONN_PWR_CON,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = 0,
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+		.bp_infracfg = {
+			BUS_PROT_UPDATE_TOPAXI(MT8167_TOP_AXI_PROT_EN_CONN_EMI |
+					       MT8167_TOP_AXI_PROT_EN_CONN_MCU |
+					       MT8167_TOP_AXI_PROT_EN_MCU_CONN),
+		},
+	},
+};
+
+static const struct scpsys_soc_data mt8167_scpsys_data = {
+	.domains = scpsys_domain_data_mt8167,
+	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8167),
+	.pwr_sta_offs = SPM_PWR_STATUS,
+	.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+};
+
+#endif /* __SOC_MEDIATEK_MT8167_PM_DOMAINS_H */
+
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 293efa27b6ce..34c704865f01 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -15,6 +15,7 @@
 #include <linux/regmap.h>
 #include <linux/soc/mediatek/infracfg.h>
 
+#include "mt8167-pm-domains.h"
 #include "mt8173-pm-domains.h"
 #include "mt8183-pm-domains.h"
 #include "mt8192-pm-domains.h"
@@ -515,6 +516,10 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys)
 }
 
 static const struct of_device_id scpsys_of_match[] = {
+	{
+		.compatible = "mediatek,mt8167-power-controller",
+		.data = &mt8167_scpsys_data,
+	},
 	{
 		.compatible = "mediatek,mt8173-power-controller",
 		.data = &mt8173_scpsys_data,
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index eda453f55126..7c1e1a7209f1 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -14,6 +14,7 @@
 #define SPM_VEN_PWR_CON			0x0230
 #define SPM_ISP_PWR_CON			0x0238
 #define SPM_DIS_PWR_CON			0x023c
+#define SPM_CONN_PWR_CON		0x0280
 #define SPM_VEN2_PWR_CON		0x0298
 #define SPM_AUDIO_PWR_CON		0x029c
 #define SPM_MFG_2D_PWR_CON		0x02c0
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index e7842debc05d..4615a228da51 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -123,6 +123,14 @@
 #define MT8173_TOP_AXI_PROT_EN_MFG_M1		BIT(22)
 #define MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT	BIT(23)
 
+#define MT8167_TOP_AXI_PROT_EN_MM_EMI		BIT(1)
+#define MT8167_TOP_AXI_PROT_EN_MCU_MFG		BIT(2)
+#define MT8167_TOP_AXI_PROT_EN_CONN_EMI		BIT(4)
+#define MT8167_TOP_AXI_PROT_EN_MFG_EMI		BIT(5)
+#define MT8167_TOP_AXI_PROT_EN_CONN_MCU		BIT(8)
+#define MT8167_TOP_AXI_PROT_EN_MCU_CONN		BIT(9)
+#define MT8167_TOP_AXI_PROT_EN_MCU_MM		BIT(11)
+
 #define MT2701_TOP_AXI_PROT_EN_MM_M0		BIT(1)
 #define MT2701_TOP_AXI_PROT_EN_CONN_M		BIT(2)
 #define MT2701_TOP_AXI_PROT_EN_CONN_S		BIT(8)
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
