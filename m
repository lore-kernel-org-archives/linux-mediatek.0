Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A11C19425
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 13:32:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68E1E2313E
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 13:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68E1E2313E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lLD7DejN/ak6Kiq9il5AdEby0WdyojItzb7NoeVgFNc=; b=xZX175m7BRgIc/dt44+aQBxtf
	H/3eu66fhLmAN4E6nlSqa6bW+1s2ukM1VyHHR8nL2NUBRDt8KlK2Kkc3PA3Ow6rjXW8Ojp1zB0U8l
	BqZO0DSir3xVn8Vrpny8eqmCHzX+kQIYp79PxkuzyPZItEq+YKB+Rg306J/mS0DFv0xMC+jopNBKK
	vi5tf4Bbczu0asqSmjf9KPGTf6s8rgEkcJDnxocuJGiT668QSUjvCOkRKk+kLYCCbXHwrw7qJbQeW
	SebX5Q44xkZNnVoLX/3mS36MpyW7IiIhaPD/DqyOqUUsrsY9Q70IsZXsX+jyd9+KhlmPJHi6nFjfi
	rjJlkYc+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmzaL-0006RN-3x; Wed, 09 Dec 2020 13:32:49 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmzaH-0006Po-0x
 for linux-mediatek@lists.infradead.org; Wed, 09 Dec 2020 13:32:46 +0000
Received: by mail-ej1-x644.google.com with SMTP id f23so2146425ejk.2
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Dec 2020 05:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gnPQezsRyZdsHbaKDld50XCLreRYCdlXGZFcJrZyLRI=;
 b=NFa/3iAmkjw7fJ2Cc2BkWL8L2SoJmRWwVQymFZaEkqI+mCVpVJ+nHLDAMG78VyYiaP
 1WaGO4vfMFd1qtCrjcKpR3vD6SAlQDdnodBXkbsT/RqNdhhY3AIvfpaeEwzClHvAAaGV
 9hy7oi7yC3wOUmYi2V39O4kdpuyh0YHem+uP+Irl8tOQ81cGs8AsNF+/y64mlKEWoWi6
 l+SQSAKBmFrDK1qT2lBDak4AuTUmQjL6OmFIZFI63kS4eaihkB8rj5JgId4TzLzb4ZWf
 JfJ255VRJQ1DQmusldS7KhlG9d47FXHZsRDeTpG2vEsBq3nBN2MbnVmUuU+4A+YAvA7O
 LNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gnPQezsRyZdsHbaKDld50XCLreRYCdlXGZFcJrZyLRI=;
 b=dUWJ17X6Au7Vx6X0H0BWq06wfwOQ31yoKzJ6c0MGERs9XFEKasa+wD/TSoNMTq0T/9
 xUy8iU7kpnLkUIBhzNaxX+LjQImm5Bv3/gTJbUF+xuzlkhXmqLkI7gqPy/S3ClQvzgRG
 282R0JcXPAmUh27AG5Rx7U0iSVY63K6+zdHF4mLuiZ5MBs0cg0OG4bYLR3tYGYgRcUoW
 uXXIOE8KbjXWajbl+wMiidKqIwuodsrLsQ0j+6MpcBivjofKgzkOgAK6dMrUTx8H20Sp
 03emyKzvIf817uQt1k+AOPqm45B9xFvUYnJ9vVMJML18m7ktMymYNv7BujA+VL83USHD
 rlyA==
X-Gm-Message-State: AOAM531mkgZBK6SPl4RsfCnLlzZcNw1mFwF9fAxX6weLUJlzkddbZlUa
 16L/M3jC0xrbeJeqKI3z4/cKb+zbJ7tKEQ==
X-Google-Smtp-Source: ABdhPJynnzXqCsWPJQD6bkmbybUjGaPSr3YIfNdZlHKzp+55XOz6ZiRkydX4MD4JdE5Y2Qwcb6TpSg==
X-Received: by 2002:a17:906:4944:: with SMTP id
 f4mr2118774ejt.231.1607520763689; 
 Wed, 09 Dec 2020 05:32:43 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id bq20sm1490646ejb.64.2020.12.09.05.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 05:32:43 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/2] soc: mediatek: pm-domains: Add support for mt8167
Date: Wed,  9 Dec 2020 14:32:37 +0100
Message-Id: <20201209133238.384030-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209133238.384030-1-fparent@baylibre.com>
References: <20201209133238.384030-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_083245_179789_3F8E0B70 
X-CRM114-Status: GOOD (  19.90  )
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the needed board data to support mt8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
This patch was made on top of https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.10-next/soc

v3:
	* s/MT8167_POWER_DOMAIN_DISP/MT8167_POWER_DOMAIN_MM
	* s/.domains/.domains_data
v2:
	* Implement on top of new SCPSYS PM domains driver

 drivers/soc/mediatek/mt8167-pm-domains.h | 86 ++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c    |  5 ++
 drivers/soc/mediatek/mtk-pm-domains.h    |  1 +
 include/linux/soc/mediatek/infracfg.h    |  8 +++
 4 files changed, 100 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8167-pm-domains.h

diff --git a/drivers/soc/mediatek/mt8167-pm-domains.h b/drivers/soc/mediatek/mt8167-pm-domains.h
new file mode 100644
index 000000000000..ad0b8dfa0527
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
+	[MT8167_POWER_DOMAIN_MM] = {
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
+	.domains_data = scpsys_domain_data_mt8167,
+	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8167),
+	.pwr_sta_offs = SPM_PWR_STATUS,
+	.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+};
+
+#endif /* __SOC_MEDIATEK_MT8167_PM_DOMAINS_H */
+
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index fb70cb3b07b3..2d0d50ff35f0 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -15,6 +15,7 @@
 #include <linux/regmap.h>
 #include <linux/soc/mediatek/infracfg.h>
 
+#include "mt8167-pm-domains.h"
 #include "mt8173-pm-domains.h"
 #include "mt8183-pm-domains.h"
 #include "mt8192-pm-domains.h"
@@ -514,6 +515,10 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys)
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
index a2f4d8f97e05..88f5835e1648 100644
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
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
