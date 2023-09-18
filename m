Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF52ECD13D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjClo4xkeDmrqc325xBc4ylMLN29H3Nj2c2sd61GlRk=; b=DeHjHlWO/PrB154VgmmNaLHfat
	opfYpk9m6URPGA1WlyFTNHDqa1+Uw7jict/0zTpixhNl4PCWQEGtZGJmm8mnch/s1KRfx++vJURgN
	kINzTJ4HeOzNRyziuB4MkSMFtaoxMaPsfAaRclNt7smyHeyPZF98Dk+DNb4c4oVrIpTs5883NtPBI
	27IIe9+3CKVZgyC9hZKpRWXdXybMwxqvShkc28iOrUby7l7a60IUAflU5Be3eczduLegeFRIu3yoD
	WeqbY4SZRRPnryEMvedhHXcxs21wzRvwpAw599ZnrQWS2datOONJ2UXXTaLLTWsHdrXjK5YSY0DKm
	zIZ5r+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAiV-00Ey9u-2E;
	Mon, 18 Sep 2023 09:38:55 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAi4-00ExtV-1K
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 09:38:32 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-98377c5d53eso542433466b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 02:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695029907; x=1695634707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjClo4xkeDmrqc325xBc4ylMLN29H3Nj2c2sd61GlRk=;
        b=PGupKhtlhD8beT3hkFj8fnVDgQriIeD3+rD8vBHk6ow95Nv1Dqlpx2pXiKnUffrLUy
         7Y+jb734pYai+TNCkwSjY2G3BSrbpQJKnFoS0YELarPUTZ804ISOffSPoGelzjlgzuPU
         ievdHwxBkl61oaNs+MH2XhkdynPl2ERuqMyfsL+sgzeyU6a7urh9xHwcYvETmoVsxHBS
         tNIaQrLpY8qE/BnMfWMVBIuTeOGGQaZIglk3rc6F1qINyeit5XCCM80V9Z3RsWmrpZhZ
         jpGpSjGjw8/3EVoskVwrmZ9sTHeKMLuoObo5uIog00/jnmYW1Ye3a12f6T8rtlJdx1HG
         DE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695029907; x=1695634707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjClo4xkeDmrqc325xBc4ylMLN29H3Nj2c2sd61GlRk=;
        b=rUJXHYkoAMnsGdEiP+PEzw8c8jco9UOyvCCVwfkgsmHTNef1+7LqFjSoYkeaycbv2s
         O+2TwbnP5NClLtyC3fBNr6gAyN5d81Ln+TI95szmOH9Px8eEWxFNPsqGDOY5s1rlj/i6
         K96PjYitu49msC+FCgLZxn0B1oa9HKFVEruk/03aL8yt50NiU6CXyTgWcQ3MU42WsNMp
         algSZedYi42qYljn796dtrJlxkoOjxddmFFq1Tk4n5F1CSVh9V6vEMQDxCfbzrBqQKTp
         ov+5qIvsevyCcvECw0CtgrvGRa/IkoCkjpGC2AikYTJbvXwVEj16RrKmkcM5brwTLpv1
         hyCQ==
X-Gm-Message-State: AOJu0Yzr33s1OyVDqRRpD8h7n30h3GBy0fyMNIhbdh9WHFlty3dWsu7Y
	6/ylJcMwHtcGoTnICvbu4qByXA==
X-Google-Smtp-Source: AGHT+IG5kT7m81nr2cfYALjUa49dNQ97RPPmoYgDi+S4RJYIvoH7+IKgfpfd4AnrNN10ZqjeCYkGUw==
X-Received: by 2002:a17:906:2011:b0:9ae:1de:f4f3 with SMTP id 17-20020a170906201100b009ae01def4f3mr2608681ejo.13.1695029907127;
        Mon, 18 Sep 2023 02:38:27 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a246:8222:872:4a5b:b69c:1318])
        by smtp.gmail.com with ESMTPSA id o10-20020a1709061d4a00b0099293cdbc98sm6251164ejh.145.2023.09.18.02.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 02:38:26 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v8 8/8] soc: mediatek: pm-domains: Add support for MT8365
Date: Mon, 18 Sep 2023 11:37:52 +0200
Message-Id: <20230918093751.1188668-9-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918093751.1188668-1-msp@baylibre.com>
References: <20230918093751.1188668-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_023828_590008_18A3A460 
X-CRM114-Status: GOOD (  15.99  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/pmdomain/mediatek/mt8365-pm-domains.h | 197 ++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    |   5 +
 include/linux/soc/mediatek/infracfg.h         |  41 ++++
 3 files changed, 243 insertions(+)
 create mode 100644 drivers/pmdomain/mediatek/mt8365-pm-domains.h

diff --git a/drivers/pmdomain/mediatek/mt8365-pm-domains.h b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
new file mode 100644
index 000000000000..3d83d49eaa7c
--- /dev/null
+++ b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
@@ -0,0 +1,197 @@
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
+#define MT8365_BUS_PROT_INFRA_WR_TOPAXI(_mask)				\
+		BUS_PROT_WR(INFRA, _mask,				\
+			    MT8365_INFRA_TOPAXI_PROTECTEN_SET,		\
+			    MT8365_INFRA_TOPAXI_PROTECTEN_CLR,		\
+			    MT8365_INFRA_TOPAXI_PROTECTEN_STA1)
+
+#define MT8365_BUS_PROT_INFRA_WR_TOPAXI_1(_mask)			\
+		BUS_PROT_WR(INFRA, _mask,				\
+			    MT8365_INFRA_TOPAXI_PROTECTEN_1_SET,	\
+			    MT8365_INFRA_TOPAXI_PROTECTEN_1_CLR,	\
+			    MT8365_INFRA_TOPAXI_PROTECTEN_1_STA1)
+
+#define MT8365_BUS_PROT_SMI_WR_CLAMP_EN_PORT(port)			\
+		BUS_PROT_WR(SMI, BIT(port),				\
+			    MT8365_SMI_COMMON_CLAMP_EN_SET,		\
+			    MT8365_SMI_COMMON_CLAMP_EN_CLR,		\
+			    MT8365_SMI_COMMON_CLAMP_EN)
+
+#define MT8365_BUS_PROT_WAY_EN(_set_mask, _set, _sta_mask, _sta)	\
+		_BUS_PROT(_set_mask, _set, _set, _sta_mask, _sta,	\
+			  BUS_PROT_COMPONENT_INFRA |			\
+			  BUS_PROT_STA_COMPONENT_INFRA_NAO |		\
+			  BUS_PROT_INVERTED |				\
+			  BUS_PROT_REG_UPDATE)
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
+		.bp_cfg = {
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI_1(
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_0 |
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_1),
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
+				MT8365_INFRA_TOPAXI_PROTECTEN_MM_M0 |
+				MT8365_INFRA_TOPAXI_PROTECTEN_MDMCU_M1 |
+				MT8365_INFRA_TOPAXI_PROTECTEN_MM2INFRA_AXI_GALS_SLV_0 |
+				MT8365_INFRA_TOPAXI_PROTECTEN_MM2INFRA_AXI_GALS_SLV_1),
+			MT8365_BUS_PROT_WAY_EN(
+				MT8365_INFRA_TOPAXI_SI0_WAY_EN_MMAPB_S,
+				MT8365_INFRA_TOPAXI_SI0_CTL,
+				MT8365_INFRA_NAO_TOPAXI_SI0_CTRL_UPDATED,
+				MT8365_INFRA_NAO_TOPAXI_SI0_STA),
+			MT8365_BUS_PROT_WAY_EN(
+				MT8365_INFRA_TOPAXI_SI2_WAY_EN_PERI_M1,
+				MT8365_INFRA_TOPAXI_SI2_CTL,
+				MT8365_INFRA_NAO_TOPAXI_SI2_CTRL_UPDATED,
+				MT8365_INFRA_NAO_TOPAXI_SI2_STA),
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
+				MT8365_INFRA_TOPAXI_PROTECTEN_MMAPB_S),
+		},
+		.caps = MTK_SCPD_STRICT_BUS_PROTECTION | MTK_SCPD_HAS_INFRA_NAO,
+	},
+	[MT8365_POWER_DOMAIN_VENC] = {
+		.name = "venc",
+		.sta_mask = PWR_STATUS_VENC,
+		.ctl_offs = 0x0304,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_cfg = {
+			MT8365_BUS_PROT_SMI_WR_CLAMP_EN_PORT(1),
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
+		.bp_cfg = {
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI_1(
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_PWRDNREQ_MP1_L2C_AFIFO |
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_AUDIO_M),
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
+		.bp_cfg = {
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
+				MT8365_INFRA_TOPAXI_PROTECTEN_AP2CONN_AHB),
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI_1(
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_CONN2INFRA_AXI_GALS_MST),
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
+				MT8365_INFRA_TOPAXI_PROTECTEN_CONN2INFRA_AHB),
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI_1(
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_INFRA2CONN_AHB_GALS_SLV),
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
+		.bp_cfg = {
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI(BIT(25)),
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
+				MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M0 |
+				MT8365_INFRA_TOPAXI_PROTECTEN_INFRA2MFG),
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
+		.bp_cfg = {
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI_1(
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_CAM2MM_AXI_GALS_MST),
+			MT8365_BUS_PROT_SMI_WR_CLAMP_EN_PORT(2),
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
+		.bp_cfg = {
+			MT8365_BUS_PROT_SMI_WR_CLAMP_EN_PORT(3),
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
+		.bp_cfg = {
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI_1(
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_APU2AP |
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_APU_CBIP_GALS_MST),
+			MT8365_BUS_PROT_SMI_WR_CLAMP_EN_PORT(4),
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
+		.bp_cfg = {
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI_1(
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_PWRDNREQ_INFRA_GALS_ADB |
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_M |
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_S),
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
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 69cdf6ff00b8..e26dc17d07ad 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -24,6 +24,7 @@
 #include "mt8188-pm-domains.h"
 #include "mt8192-pm-domains.h"
 #include "mt8195-pm-domains.h"
+#include "mt8365-pm-domains.h"
 
 #define MTK_POLL_DELAY_US		10
 #define MTK_POLL_TIMEOUT		USEC_PER_SEC
@@ -652,6 +653,10 @@ static const struct of_device_id scpsys_of_match[] = {
 		.compatible = "mediatek,mt8195-power-controller",
 		.data = &mt8195_scpsys_data,
 	},
+	{
+		.compatible = "mediatek,mt8365-power-controller",
+		.data = &mt8365_scpsys_data,
+	},
 	{ }
 };
 
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index 07f67b3d8e97..6c6cccc848f4 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -2,6 +2,47 @@
 #ifndef __SOC_MEDIATEK_INFRACFG_H
 #define __SOC_MEDIATEK_INFRACFG_H
 
+#define MT8365_INFRA_TOPAXI_PROTECTEN_STA1				0x228
+#define MT8365_INFRA_TOPAXI_PROTECTEN_SET				0x2a0
+#define MT8365_INFRA_TOPAXI_PROTECTEN_CLR				0x2a4
+#define MT8365_INFRA_TOPAXI_PROTECTEN_MM_M0				BIT(1)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_MDMCU_M1				BIT(2)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_MMAPB_S				BIT(6)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_MM2INFRA_AXI_GALS_SLV_0		BIT(10)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_MM2INFRA_AXI_GALS_SLV_1		BIT(11)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_AP2CONN_AHB			BIT(13)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_CONN2INFRA_AHB			BIT(14)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M0				BIT(21)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_INFRA2MFG			BIT(22)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_STA1				0x258
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_SET				0x2a8
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_CLR				0x2ac
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_APU2AP				BIT(2)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_0	BIT(16)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_1	BIT(17)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_CONN2INFRA_AXI_GALS_MST	BIT(18)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_CAM2MM_AXI_GALS_MST		BIT(19)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_APU_CBIP_GALS_MST		BIT(20)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_INFRA2CONN_AHB_GALS_SLV	BIT(21)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_PWRDNREQ_INFRA_GALS_ADB	BIT(24)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_PWRDNREQ_MP1_L2C_AFIFO		BIT(27)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_AUDIO_M		BIT(28)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_M		BIT(30)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_S		BIT(31)
+
+#define MT8365_INFRA_NAO_TOPAXI_SI0_STA					0x0
+#define MT8365_INFRA_NAO_TOPAXI_SI0_CTRL_UPDATED			BIT(24)
+#define MT8365_INFRA_NAO_TOPAXI_SI2_STA					0x28
+#define MT8365_INFRA_NAO_TOPAXI_SI2_CTRL_UPDATED			BIT(14)
+#define MT8365_INFRA_TOPAXI_SI0_CTL					0x200
+#define MT8365_INFRA_TOPAXI_SI0_WAY_EN_MMAPB_S				BIT(6)
+#define MT8365_INFRA_TOPAXI_SI2_CTL					0x234
+#define MT8365_INFRA_TOPAXI_SI2_WAY_EN_PERI_M1				BIT(5)
+
+#define MT8365_SMI_COMMON_CLAMP_EN			0x3c0
+#define MT8365_SMI_COMMON_CLAMP_EN_SET			0x3c4
+#define MT8365_SMI_COMMON_CLAMP_EN_CLR			0x3c8
+
 #define MT8195_TOP_AXI_PROT_EN_STA1                     0x228
 #define MT8195_TOP_AXI_PROT_EN_1_STA1                   0x258
 #define MT8195_TOP_AXI_PROT_EN_SET			0x2a0
-- 
2.40.1


