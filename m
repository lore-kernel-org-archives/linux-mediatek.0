Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0EAC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 19:40:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC588611BD
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 19:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC588611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5OwuifeJNEISZzSc4eOopZVZCePukE6hdm55IV1W9w0=; b=IvSgu4L5mI7QM+4+MvChEffvl
	qWsUzN6HzXkZ6I8FuluvHl456CX1mb9sly4DWKINNWkZG8Nv3MtaguaxY742M2DmAKnMnz5dnLIWb
	wRZ3ZyuID5pbl1a93xAfY66/0fpjvu9yg46E43/kFImAYek0waNoBevODNha/0dNX8FNAdYRPMOTS
	7o+u04XiGT1cEoLb7cD9FDZGcExHw2gS24KCkr3xDv/sODUFJ2UZEEQI3AWJaBOpnu++WJxi0a2zb
	r2NkikwHSpzocCuAaMaOD9mnqdZPwKb1keV0nmN/CfCTmwFwoI5+7xRiNWDB35jbCFnavVmLPGpOO
	LlGwrcG1A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj5a7-001ksS-R4; Tue, 18 May 2021 19:40:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj5Zh-001kp1-5l
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 19:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Kav2sISS6YUfpAfIMUuL/snESEkTzPWRiHLUpCAjbiM=; b=W4FqWzLyP9pofwzQh5m56Nw6dw
 dZ3zKh6zNn44EHxSwIe6Nh6r+QPt5kCRlSB2IwaWFZJG/Xae9ew1FwBvm8zzXa8vkFn+9xc/x4fWF
 1ID9KtDQBC2eI1LJ4PwM+kzZfvd33c3ueK9EnuQHay4ZFSoX/WKhViokb6fRaR067DotHChtChTdJ
 n7SzF2OpUVEBmO4lT5E6winQY+FAUTgv0RB4NQ6A+YR7OGnwvu0SKRl8IlsZM1+2IvkySlvYuEpbi
 7WeYlrsXyNuaL3zWHbb8j/8Lo2ofkU8WHEGXNBL6hXh/qyEMesmfbdreqKBbUQdA4owImJibxnfoT
 YZRhbd6Q==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj5Zd-00Ev4K-Oe
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 19:40:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so2073432wmf.1
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 12:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kav2sISS6YUfpAfIMUuL/snESEkTzPWRiHLUpCAjbiM=;
 b=svP8wwHMUCz6sMmkD1cSLDvah6qd2cTw7P7uxvTaTVitye+P74FGXSfcQwoOEBL/QD
 OlmRC2XIAIURpTNY0BnZLgKEBhONej6Vl1vnnoLc+NVTxkgj7tIvydNN4eRaNhrc0bkc
 vnIIcgCqEhHw/mazYOU86zIYMb3i6wCuOPAwEnYRDreLzLIFgS67PeDQjeJuglKHwpT/
 PdbTwNJFqcMAQzVMQsDeJ6yrrdCs67LwPP0kv5oWu3Ttlujh2QJdGwy2zdIA+NXBRCIR
 3ZNj/24H0R2JWHMeBop/J7vytrawl6wTU7K0jhP/h4Lsg8CWKl8WmTuVIfQnTcBLpkCf
 +O8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kav2sISS6YUfpAfIMUuL/snESEkTzPWRiHLUpCAjbiM=;
 b=XcSnpP7tS8B6KO6vCqK2wbcuCAxs0dEjY76vd5ZOiGO1TX0UPiwai8u4wcdNj2Vp2p
 ZLPZABb4qVq1rxHxSrcw61zE+l9iNAskeRdkvv831dl3WYFKR5BD1CETyj3vidvez5AR
 fGMSfJv56qe3YKdeGgqBegmq0pDtxeHp71EhGLCd0xeujba1/H1TdD3g+crpZIWBIVSY
 T8i2Z1BeqRh7DXqaUWtWa1yciHL6KMpA9PkLPHou8US7EM5b173Kbn3r71lM1EU0FVUb
 bwKPokY4i5vjUCnEr5HVd9viUViZeyDayNU0XyO0EkB6uVgK4dNY4OBJRkK0FF3Z2X30
 S1Cg==
X-Gm-Message-State: AOAM532KQq6nzVSPAfWeFfzWlij0UJgLXji9xie49q+eflQ5yHTm95e/
 WUFQrUMB6NcY+Yo9OaWbCX3GiA==
X-Google-Smtp-Source: ABdhPJwYqopLI+Bb7aEMtJWH/hLReqeGPRgrs511JmhDMQwQaApEiCm1FcB7oStnAEbJd9w4ZFoDhw==
X-Received: by 2002:a7b:cb96:: with SMTP id m22mr7079774wmi.59.1621366812330; 
 Tue, 18 May 2021 12:40:12 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id q186sm5484407wme.20.2021.05.18.12.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 12:40:11 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] soc: mediatek: pm-domains: Add support for MT8365
Date: Tue, 18 May 2021 21:40:08 +0200
Message-Id: <20210518194008.2921469-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518194008.2921469-1-fparent@baylibre.com>
References: <20210518194008.2921469-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_124013_810387_E1CB8CAD 
X-CRM114-Status: GOOD (  16.64  )
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

Add the needed board data to support MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/soc/mediatek/mt8365-pm-domains.h | 129 +++++++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c    |   5 +
 2 files changed, 134 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8365-pm-domains.h

diff --git a/drivers/soc/mediatek/mt8365-pm-domains.h b/drivers/soc/mediatek/mt8365-pm-domains.h
new file mode 100644
index 000000000000..964387967888
--- /dev/null
+++ b/drivers/soc/mediatek/mt8365-pm-domains.h
@@ -0,0 +1,129 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8365_PM_DOMAINS_H
+#define __SOC_MEDIATEK_MT8365_PM_DOMAINS_H
+
+#include "mtk-pm-domains.h"
+#include <dt-bindings/power/mt8365-power.h>
+
+/*
+ * MT8365 power domain support
+ */
+
+static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
+	[MT8365_POWER_DOMAIN_DISP] = {
+		.name = "disp",
+		.sta_mask = PWR_STATUS_DISP,
+		.ctl_offs = 0x30c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(BIT(16) | BIT(17), 0x2a8, 0x2ac, 0x258),
+			BUS_PROT_WR(BIT(1) | BIT(2) | BIT(10) | BIT(11), 0x2a0, 0x2a4, 0x228),
+			BUS_PROT_WR_IGN(BIT(5), 0x0, 0x234, 0x28),
+			BUS_PROT_WR(BIT(6), 0x2a0, 0x2a4, 0x228),
+		},
+	},
+	[MT8365_POWER_DOMAIN_VENC] = {
+		.name = "venc",
+		.sta_mask = PWR_STATUS_VENC,
+		.ctl_offs = 0x0304,
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
+	.pwr_sta_offs = 0x0180,
+	.pwr_sta2nd_offs = 0x0184
+};
+
+#endif /* __SOC_MEDIATEK_MT8365_PM_DOMAINS_H */
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 0af00efa0ef8..4c8eecaace99 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -20,6 +20,7 @@
 #include "mt8173-pm-domains.h"
 #include "mt8183-pm-domains.h"
 #include "mt8192-pm-domains.h"
+#include "mt8365-pm-domains.h"
 
 #define MTK_POLL_DELAY_US		10
 #define MTK_POLL_TIMEOUT		USEC_PER_SEC
@@ -576,6 +577,10 @@ static const struct of_device_id scpsys_of_match[] = {
 		.compatible = "mediatek,mt8192-power-controller",
 		.data = &mt8192_scpsys_data,
 	},
+	{
+		.compatible = "mediatek,mt8365-power-controller",
+		.data = &mt8365_scpsys_data,
+	},
 	{ }
 };
 
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
