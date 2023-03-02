Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D55C678D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0YVPdDle1NaFco5UbTAMJ63K0C79g/uIPg380c+Gdo=; b=bifIOzuxzAM6Bmexw2RdDemioC
	XL2tqH+Blz9OPiXtbb+AR2nM0cSxeMST7Gxt8XWn1vIqUCPHAUu0CSge2tllaVa858/TqxY/ny/pa
	4LJiDef4MGSc/wxPZ/RjKMGb8kuCZyeJZ/6yslh/UGH45khihzjUPAcUVf2TZZxYOXpbn+B/TZv1C
	hDsD29acRKSJIf4CbQKJ7o6e10sOcaJJoomDNrJjKBdy39PTqr2V40ppnId/x2C33MJBFvEp7QMfG
	4lCOZa+0lDVivgwh1KebvrABV0Ttgnm95IG4m0cYKMJBfUew/pK30pZ1ngWZykfRbKzkHmppB2sJl
	pPutPKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXi2K-0028A4-4l; Thu, 02 Mar 2023 12:27:52 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXi21-0027zZ-Hp; Thu, 02 Mar 2023 12:27:35 +0000
Received: by mail-ed1-x52e.google.com with SMTP id g3so11414409eda.1;
        Thu, 02 Mar 2023 04:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677760053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0YVPdDle1NaFco5UbTAMJ63K0C79g/uIPg380c+Gdo=;
        b=Qv7Kkabrm00rp8Xs8/p7jI7WFOj8UQYMkRElDC6cttipvBQcAsk0jriUZDSifA3I5/
         9gJ676FyGVUj9OMKRMa3/Ce3PLlrkDZ0vpXoTEzAxOaQvwsUv7LIIoG74TrW+8E6rud3
         GNI4n7PwM4bGew1wk7gXmgEq4fBUKbDKf24ERmgiMwIt3KJ0zSsmNhAtW6qspAvHCmsP
         llpM5srqIGWxgvMuwqevfGS+/L/6eBbID8zlJ2M+Df5MAZHKayZS/jkIubqAwn+k0rsE
         YMz6mJ+MtXmPmj2dVTITi5bz1+kawST2e+MxhXSErWMv41WP4FG9nt+e0Fxax46RL8m5
         8GDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677760053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0YVPdDle1NaFco5UbTAMJ63K0C79g/uIPg380c+Gdo=;
        b=QojdQQZL1B637dJqxiqUlMlWY3krSnE4XSgEOSys5w6jBgwA27Ej8qKoEle1EWQtVo
         3NQgLC2rH291NMeNzQtwPpeGOl97kWho9DA7XOUC5OoxmGLdpYSUy17/rsrXOCLEclKV
         ko4L+6lddDgYRXE4nepxti0PtI0FnyH1TMKo8vAdj97chhp99oDynk3f22dVBs9uz6z4
         VCp0HNnW8YUqGYHZ19v2mtBdMAV1HgqIZzLWBQarWpfmOUi77T6i4hxxjt7MJK4nktJd
         XIv2c0DmkBIfjXeoeRM/0wm3VX0AvsCWOGYz9g4M7H/zhyaVWbZnxLFIPjAo3DyegEuD
         C1zA==
X-Gm-Message-State: AO0yUKUPGZMK/67U25zemp74X+eu5pu1ydj4PoKMhSpRpvtcA3f6VfLk
	0GIRMIQxNdzVKzOJRpz2Imo=
X-Google-Smtp-Source: AK7set8LKXktfUXsHTwFvibDbL5TSOXHnbTis5kPWESFbKm0pRN/tNN8dxkVullwlTC8i4Gv7zU8kQ==
X-Received: by 2002:aa7:d7cc:0:b0:4be:7311:1135 with SMTP id e12-20020aa7d7cc000000b004be73111135mr4026476eds.31.1677760053077;
        Thu, 02 Mar 2023 04:27:33 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id qc17-20020a170906d8b100b008ca37f3eae9sm7038375ejb.131.2023.03.02.04.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 04:27:32 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	"Garmin.Chang" <Garmin.Chang@mediatek.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] soc: mediatek: pm-domains: Add support for MT6735
Date: Thu,  2 Mar 2023 15:27:08 +0300
Message-Id: <20230302122708.73848-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302122708.73848-1-y.oudjana@protonmail.com>
References: <20230302122708.73848-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_042733_633732_CF0117D2 
X-CRM114-Status: GOOD (  18.58  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add support for SCPSYS power domains of MT6735. All non-CPU power domains
are added except for MD2 (C2K modem), which is left out due to issues
with powering it on.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/soc/mediatek/mt6735-pm-domains.h | 96 ++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c    |  5 ++
 drivers/soc/mediatek/mtk-pm-domains.h    |  2 +
 include/linux/soc/mediatek/infracfg.h    |  5 ++
 4 files changed, 108 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt6735-pm-domains.h

diff --git a/drivers/soc/mediatek/mt6735-pm-domains.h b/drivers/soc/mediatek/mt6735-pm-domains.h
new file mode 100644
index 000000000000..59e830fc354b
--- /dev/null
+++ b/drivers/soc/mediatek/mt6735-pm-domains.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT6735_PM_DOMAINS_H
+#define __SOC_MEDIATEK_MT6735_PM_DOMAINS_H
+
+#include "mtk-pm-domains.h"
+#include <dt-bindings/power/mt6735-power.h>
+
+/*
+ * MT6735 power domain support
+ */
+
+static const struct scpsys_domain_data scpsys_domain_data_mt6735[] = {
+	[MT6735_POWER_DOMAIN_MD1] = {
+		.name = "md1",
+		.sta_mask = PWR_STATUS_MD1,
+		.ctl_offs = SPM_MD1_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = 0,
+		.bp_infracfg = {
+			BUS_PROT_UPDATE_TOPAXI(MT6735_TOP_AXI_PROT_EN_MD1),
+		},
+	},
+	[MT6735_POWER_DOMAIN_CONN] = {
+		.name = "conn",
+		.sta_mask = PWR_STATUS_CONN,
+		.ctl_offs = SPM_CONN_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = 0,
+		.bp_infracfg = {
+			BUS_PROT_UPDATE_TOPAXI(MT6735_TOP_AXI_PROT_EN_CONN),
+		},
+	},
+	[MT6735_POWER_DOMAIN_DIS] = {
+		.name = "dis",
+		.sta_mask = PWR_STATUS_DISP,
+		.ctl_offs = SPM_DIS_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_UPDATE_TOPAXI(MT8173_TOP_AXI_PROT_EN_MM_M0),
+		},
+	},
+	[MT6735_POWER_DOMAIN_MFG] = {
+		.name = "mfg",
+		.sta_mask = PWR_STATUS_MFG,
+		.ctl_offs = SPM_MFG_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_UPDATE_TOPAXI(MT8173_TOP_AXI_PROT_EN_MFG_S),
+		},
+	},
+	[MT6735_POWER_DOMAIN_ISP] = {
+		.name = "isp",
+		.sta_mask = PWR_STATUS_ISP,
+		.ctl_offs = SPM_ISP_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+	},
+	[MT6735_POWER_DOMAIN_VDE] = {
+		.name = "vde",
+		.sta_mask = PWR_STATUS_VDEC,
+		.ctl_offs = SPM_VDE_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT6735_POWER_DOMAIN_VEN] = {
+		.name = "ven",
+		.sta_mask = BIT(8),
+		.ctl_offs = SPM_VEN_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+	},
+};
+
+static const struct scpsys_soc_data mt6735_scpsys_data = {
+	.domains_data = scpsys_domain_data_mt6735,
+	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt6735),
+};
+
+#endif /* __SOC_MEDIATEK_MT6735_PM_DOMAINS_H */
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 354249cc1b12..0ade6b8cafff 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -16,6 +16,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/soc/mediatek/infracfg.h>
 
+#include "mt6735-pm-domains.h"
 #include "mt6795-pm-domains.h"
 #include "mt8167-pm-domains.h"
 #include "mt8173-pm-domains.h"
@@ -568,6 +569,10 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys)
 }
 
 static const struct of_device_id scpsys_of_match[] = {
+	{
+		.compatible = "mediatek,mt6735-power-controller",
+		.data = &mt6735_scpsys_data,
+	},
 	{
 		.compatible = "mediatek,mt6795-power-controller",
 		.data = &mt6795_scpsys_data,
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 5ec53ee073c4..4aa37dc57ac7 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -19,6 +19,7 @@
 #define SPM_ISP_PWR_CON			0x0238
 #define SPM_DIS_PWR_CON			0x023c
 #define SPM_CONN_PWR_CON		0x0280
+#define SPM_MD1_PWR_CON			0x0284
 #define SPM_VEN2_PWR_CON		0x0298
 #define SPM_AUDIO_PWR_CON		0x029c
 #define SPM_MFG_2D_PWR_CON		0x02c0
@@ -28,6 +29,7 @@
 #define SPM_PWR_STATUS			0x060c
 #define SPM_PWR_STATUS_2ND		0x0610
 
+#define PWR_STATUS_MD1			BIT(0)
 #define PWR_STATUS_CONN			BIT(1)
 #define PWR_STATUS_DISP			BIT(3)
 #define PWR_STATUS_MFG			BIT(4)
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index 07f67b3d8e97..c60f8e7e976e 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -393,6 +393,11 @@
 #define MT7622_TOP_AXI_PROT_EN_WB		(BIT(2) | BIT(6) | \
 						 BIT(7) | BIT(8))
 
+#define MT6735_TOP_AXI_PROT_EN_CONN		(BIT(2) | BIT(8))
+#define MT6735_TOP_AXI_PROT_EN_MD1		(BIT(24) | BIT(25) | \
+						 BIT(26) | BIT(27) | \
+						 BIT(28))
+
 #define INFRA_TOPAXI_PROTECTEN			0x0220
 #define INFRA_TOPAXI_PROTECTSTA1		0x0228
 #define INFRA_TOPAXI_PROTECTEN_SET		0x0260
-- 
2.39.2


