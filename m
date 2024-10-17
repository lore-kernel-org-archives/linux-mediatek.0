Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7CCD21260
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 08:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIKQOSn+OzCMfWxjDnYu4Cj5q8Asx6TloHeXxyGjmj8=; b=3Lw4LDIYqvWOXhKdddp+pea1c3
	d1HjA+qj+WqfLxQlM7SZBsSFk6/DNg2npCApqQbeaCSajoiTTWVgVMp8CSTcWjd3wygPUN2ZClxgU
	2R+Cza6Ksxfi2YMko6I5iOyzyBr3HpB6CjwSgUPYWKKRMFUWW6JV4WqXNhT4h8D9SkQkdHZ5Juk6F
	0RoZf5WU+CWOdXeV4lnfVzVXC2XtmduHZlghlS39ZoXDq0tktjqu0LaEcrWDY0YJOIC8iuoGhNO0X
	vmcCvpbtdFCkEqkiNHa09D4a2iiq7OSr97Ev/64k2DeF+f5H+gLyPdsCavPR43d1tFYmSMmGrFegj
	zwtNMs0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1MJ4-0000000EFUK-2fjf;
	Thu, 17 Oct 2024 08:56:30 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1MEj-0000000EEnE-2Oqw;
	Thu, 17 Oct 2024 08:52:03 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539d9fffea1so701666e87.2;
        Thu, 17 Oct 2024 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729155120; x=1729759920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIKQOSn+OzCMfWxjDnYu4Cj5q8Asx6TloHeXxyGjmj8=;
        b=SIkmp1srQomZsJecmu/U1FppH+prUU5j8nbpnkMqnxpzRBR0251qm2UEcovlif4Q+s
         oU9sLy8pzn6v8JSPK9+BRQCMhhADMkp/tvjaqT4QAxqiTxjT5Er/pEK3S5PYM6P+vgOc
         8Thqw94nzjb3Fi8z1AlExUmu6X1H4BZF93Bp3dEjT3EHdYvkWsjcDpqmho28NlDgMfW5
         T3VymD+PkSsNdjHMbnijeWO60sXG97cfTwys+kY3QKsDZPXr8uf/IvPyODOT40G+fLYJ
         b1bk2jKcSFehsQGuwVJXEu3IBK/DAk30L3zThRz9LpkOg4mAdyVoTbSMRq9UORU0eCSC
         m5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729155120; x=1729759920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIKQOSn+OzCMfWxjDnYu4Cj5q8Asx6TloHeXxyGjmj8=;
        b=jZJMNDrr/ca/g7mOErU5uXCjXqCSsVuNTvfh9vIcamhSIPulUTSvk5TmJEr2DXMmJB
         0WVo4KbuhcUVN1VRWT/zyDiWuFwr6MiXjjzUOY4y5icS1IDKBjHzAXkQ6G+7s9I4sH1g
         xamWGoD20jT9BL1mYqluRYkShc9StVVDpSVC89kRoV+lrgiqUkjeN4dZ+3FvcZa6w202
         qgNuUPT6q//ZcSDZ1Oj/9TFuqHAbrfDBRA1q0D4NBuCul34KSGK5zS8glrTUftRCxF8O
         Djv9XMc3ASbvU2tXVcaNd1ZMTeXVwDaChs2WbsjqCpHrV1ahKPvjv3DABzjxO3WCgClQ
         HS6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgsx3JJY8hzdvXavmqN7r4DWtSCvzZ5yESPO23E88jFf5j40CnhM0K6Rnkz9TnCy43jEA7R43bxq2ej1wTryM=@lists.infradead.org, AJvYcCXuWfTayIITvfAZ15r5reiHOot4gwf1DGMmK2WBPkIv96m/Cpj0EydWjo5ew1VImmSPxLCaviWEO8g6OtJrtQHJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yybeu9I3EaHGJfOzkiT8aCuAfcsQmVDx6XRScLvBRzjk3xlxtk0
	m/J7R2mLSZDQQ5t8Ivn8Nx8an4iw2HPCYP+g8+lyT5got3YMgMOO
X-Google-Smtp-Source: AGHT+IFa05Tw/OxDuv2XAa8AxBAc26dQ4PJSNT2cz40KikvUKyt7MVPDkF5xJw0vAU4W5HtGJocRug==
X-Received: by 2002:a05:6512:3994:b0:539:f2b9:c4d0 with SMTP id 2adb3069b0e04-53a03f8865amr4887610e87.52.1729155119163;
        Thu, 17 Oct 2024 01:51:59 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29816c24sm267045266b.110.2024.10.17.01.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:51:58 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Alexandre Bailon <abailon@baylibre.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/2] soc: mediatek: pm-domains: Add support for MT6735
Date: Thu, 17 Oct 2024 11:51:35 +0300
Message-ID: <20241017085136.68053-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241017085136.68053-1-y.oudjana@protonmail.com>
References: <20241017085136.68053-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_015201_814229_8263A94A 
X-CRM114-Status: GOOD (  17.30  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mt6735-pm-domains.h | 96 +++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    |  5 +
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |  2 +
 include/linux/soc/mediatek/infracfg.h         |  5 +
 4 files changed, 108 insertions(+)
 create mode 100644 drivers/pmdomain/mediatek/mt6735-pm-domains.h

diff --git a/drivers/pmdomain/mediatek/mt6735-pm-domains.h b/drivers/pmdomain/mediatek/mt6735-pm-domains.h
new file mode 100644
index 0000000000000..71896be68e227
--- /dev/null
+++ b/drivers/pmdomain/mediatek/mt6735-pm-domains.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT6735_PM_DOMAINS_H
+#define __SOC_MEDIATEK_MT6735_PM_DOMAINS_H
+
+#include "mtk-pm-domains.h"
+#include <dt-bindings/power/mediatek,mt6735-power-controller.h>
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
+		.bp_cfg = {
+			BUS_PROT_INFRA_UPDATE_TOPAXI(MT6735_TOP_AXI_PROT_EN_MD1),
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
+		.bp_cfg = {
+			BUS_PROT_INFRA_UPDATE_TOPAXI(MT6735_TOP_AXI_PROT_EN_CONN),
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
+		.bp_cfg = {
+			BUS_PROT_INFRA_UPDATE_TOPAXI(MT8173_TOP_AXI_PROT_EN_MM_M0),
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
+		.bp_cfg = {
+			BUS_PROT_INFRA_UPDATE_TOPAXI(MT8173_TOP_AXI_PROT_EN_MFG_S),
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
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 3580913f25d39..b866b006af699 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -16,6 +16,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/soc/mediatek/infracfg.h>
 
+#include "mt6735-pm-domains.h"
 #include "mt6795-pm-domains.h"
 #include "mt8167-pm-domains.h"
 #include "mt8173-pm-domains.h"
@@ -608,6 +609,10 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys)
 }
 
 static const struct of_device_id scpsys_of_match[] = {
+	{
+		.compatible = "mediatek,mt6735-power-controller",
+		.data = &mt6735_scpsys_data,
+	},
 	{
 		.compatible = "mediatek,mt6795-power-controller",
 		.data = &mt6795_scpsys_data,
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
index aaba5e6b0536f..2ac96804b9853 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
@@ -21,6 +21,7 @@
 #define SPM_ISP_PWR_CON			0x0238
 #define SPM_DIS_PWR_CON			0x023c
 #define SPM_CONN_PWR_CON		0x0280
+#define SPM_MD1_PWR_CON			0x0284
 #define SPM_VEN2_PWR_CON		0x0298
 #define SPM_AUDIO_PWR_CON		0x029c
 #define SPM_MFG_2D_PWR_CON		0x02c0
@@ -30,6 +31,7 @@
 #define SPM_PWR_STATUS			0x060c
 #define SPM_PWR_STATUS_2ND		0x0610
 
+#define PWR_STATUS_MD1			BIT(0)
 #define PWR_STATUS_CONN			BIT(1)
 #define PWR_STATUS_DISP			BIT(3)
 #define PWR_STATUS_MFG			BIT(4)
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index 6c6cccc848f48..9956e18c5ffa9 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -434,6 +434,11 @@
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
2.47.0


