Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15EBC4727E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:04:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B690208C7
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cWtbIdLr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B690208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a3tK3TPtxAUMWj8iJM+dhIytPgcmdE/Monnne2uYLU0=; b=cWtbIdLrzu5S+43z/3DQ6+w4U
	urE0+zxsAayYq/MejZzwa8uQ0Cl/RMHoDodg8gZWKauq73sILHI7xMxs0W6o6MKyb3I5oF4djZuEx
	TYN4HhcOi7MEKQ8T5I7D3PDssjbYZs2AIRKtuQ5QrRTQCqDyJ8kf7Ww6Nyu70g9kRMBQNM1hvOPi7
	XjX2t+LnrAE5bqEoJLPN8PbYix9Ke42ryQdLI0ksD/KjHEVYxniLDAVtJ99mbmlFCxSzZGSWeCi2O
	NHC2/Ky20bEsIr+ccsOaGeZ7yfCIFnRjkMG5No2G0voik0L9nQJJbwW4V3UlmYZP0AjiowY7TmlNQ
	ska3amP/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO13e-00011o-Eg; Thu, 01 Oct 2020 16:03:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO125-0008SF-Pf; Thu, 01 Oct 2020 16:02:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 397C529D757
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/12] soc: mediatek: pm-domains: Add support for mt8183
Date: Thu,  1 Oct 2020 18:01:53 +0200
Message-Id: <20201001160154.3587848-12-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001160154.3587848-1-enric.balletbo@collabora.com>
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_120214_069009_B8F26D91 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

Add the needed board data to support mt8183 SoC.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v2:
- Do not use hardcoded values for triplets set, clear and status in
  infracfg and SMI.

 drivers/soc/mediatek/mtk-pm-domains.c | 217 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/infracfg.h |  46 ++++++
 2 files changed, 263 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 0222be12d0df..b7ccf94c1c58 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -16,6 +16,7 @@
 #include <linux/soc/mediatek/infracfg.h>
 
 #include <dt-bindings/power/mt8173-power.h>
+#include <dt-bindings/power/mt8183-power.h>
 
 #define MTK_POLL_DELAY_US   10
 #define MTK_POLL_TIMEOUT    USEC_PER_SEC
@@ -47,6 +48,7 @@
 #define PWR_SRAM_CLKISO_BIT		BIT(5)
 #define PWR_SRAM_ISOINT_B_BIT		BIT(6)
 
+#define PWR_STATUS_CONN			BIT(1)
 #define PWR_STATUS_DISP			BIT(3)
 #define PWR_STATUS_MFG			BIT(4)
 #define PWR_STATUS_ISP			BIT(5)
@@ -705,6 +707,210 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 	},
 };
 
+/*
+ * MT8183 power domain support
+ */
+static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
+	[MT8183_POWER_DOMAIN_AUDIO] = {
+		.sta_mask = PWR_STATUS_AUDIO,
+		.ctl_offs = 0x0314,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+	},
+	[MT8183_POWER_DOMAIN_CONN] = {
+		.sta_mask = PWR_STATUS_CONN,
+		.ctl_offs = 0x032c,
+		.sram_pdn_bits = 0,
+		.sram_pdn_ack_bits = 0,
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_CONN, MT8183_TOP_AXI_PROT_EN_SET,
+				    MT8183_TOP_AXI_PROT_EN_CLR, MT8183_TOP_AXI_PROT_EN_STA1),
+		},
+	},
+	[MT8183_POWER_DOMAIN_MFG_ASYNC] = {
+		.sta_mask = PWR_STATUS_MFG_ASYNC,
+		.ctl_offs = 0x0334,
+		.sram_pdn_bits = 0,
+		.sram_pdn_ack_bits = 0,
+	},
+	[MT8183_POWER_DOMAIN_MFG] = {
+		.sta_mask = PWR_STATUS_MFG,
+		.ctl_offs = 0x0338,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8183_POWER_DOMAIN_MFG_CORE0] = {
+		.sta_mask = BIT(7),
+		.ctl_offs = 0x034c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8183_POWER_DOMAIN_MFG_CORE1] = {
+		.sta_mask = BIT(20),
+		.ctl_offs = 0x0310,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8183_POWER_DOMAIN_MFG_2D] = {
+		.sta_mask = PWR_STATUS_MFG_2D,
+		.ctl_offs = 0x0348,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_1_MFG, MT8183_TOP_AXI_PROT_EN_1_SET,
+				    MT8183_TOP_AXI_PROT_EN_1_CLR, MT8183_TOP_AXI_PROT_EN_STA1_1),
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_MFG, MT8183_TOP_AXI_PROT_EN_SET,
+				    MT8183_TOP_AXI_PROT_EN_CLR, MT8183_TOP_AXI_PROT_EN_STA1),
+		},
+	},
+	[MT8183_POWER_DOMAIN_DISP] = {
+		.sta_mask = PWR_STATUS_DISP,
+		.ctl_offs = 0x030c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_1_DISP, MT8183_TOP_AXI_PROT_EN_1_SET,
+				    MT8183_TOP_AXI_PROT_EN_1_CLR, MT8183_TOP_AXI_PROT_EN_STA1_1),
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_DISP, MT8183_TOP_AXI_PROT_EN_SET,
+				    MT8183_TOP_AXI_PROT_EN_CLR, MT8183_TOP_AXI_PROT_EN_STA1),
+		},
+		.bp_smi = {
+			BUS_PROT_WR(MT8183_SMI_COMMON_SMI_CLAMP_DISP,
+				    MT8183_SMI_COMMON_CLAMP_EN_SET,
+				    MT8183_SMI_COMMON_CLAMP_EN_CLR,
+				    MT8183_SMI_COMMON_CLAMP_EN),
+		},
+	},
+	[MT8183_POWER_DOMAIN_CAM] = {
+		.sta_mask = BIT(25),
+		.ctl_offs = 0x0344,
+		.sram_pdn_bits = GENMASK(9, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_MM_CAM, MT8183_TOP_AXI_PROT_EN_MM_SET,
+				    MT8183_TOP_AXI_PROT_EN_MM_CLR, MT8183_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_CAM, MT8183_TOP_AXI_PROT_EN_SET,
+				    MT8183_TOP_AXI_PROT_EN_CLR, MT8183_TOP_AXI_PROT_EN_STA1),
+			BUS_PROT_WR_IGN(MT8183_TOP_AXI_PROT_EN_MM_CAM_2ND,
+					MT8183_TOP_AXI_PROT_EN_MM_SET,
+					MT8183_TOP_AXI_PROT_EN_MM_CLR,
+					MT8183_TOP_AXI_PROT_EN_MM_STA1),
+		},
+		.bp_smi = {
+			BUS_PROT_WR(MT8183_SMI_COMMON_SMI_CLAMP_CAM,
+				    MT8183_SMI_COMMON_CLAMP_EN_SET,
+				    MT8183_SMI_COMMON_CLAMP_EN_CLR,
+				    MT8183_SMI_COMMON_CLAMP_EN),
+		},
+	},
+	[MT8183_POWER_DOMAIN_ISP] = {
+		.sta_mask = PWR_STATUS_ISP,
+		.ctl_offs = 0x0308,
+		.sram_pdn_bits = GENMASK(9, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_MM_ISP,
+				    MT8183_TOP_AXI_PROT_EN_MM_SET,
+				    MT8183_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8183_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR_IGN(MT8183_TOP_AXI_PROT_EN_MM_ISP_2ND,
+					MT8183_TOP_AXI_PROT_EN_MM_SET,
+					MT8183_TOP_AXI_PROT_EN_MM_CLR,
+					MT8183_TOP_AXI_PROT_EN_MM_STA1),
+		},
+		.bp_smi = {
+			BUS_PROT_WR(MT8183_SMI_COMMON_SMI_CLAMP_ISP,
+				    MT8183_SMI_COMMON_CLAMP_EN_SET,
+				    MT8183_SMI_COMMON_CLAMP_EN_CLR,
+				    MT8183_SMI_COMMON_CLAMP_EN),
+		},
+	},
+	[MT8183_POWER_DOMAIN_VDEC] = {
+		.sta_mask = BIT(31),
+		.ctl_offs = 0x0300,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_smi = {
+			BUS_PROT_WR(MT8183_SMI_COMMON_SMI_CLAMP_VDEC,
+				    MT8183_SMI_COMMON_CLAMP_EN_SET,
+				    MT8183_SMI_COMMON_CLAMP_EN_CLR,
+				    MT8183_SMI_COMMON_CLAMP_EN),
+		},
+	},
+	[MT8183_POWER_DOMAIN_VENC] = {
+		.sta_mask = PWR_STATUS_VENC,
+		.ctl_offs = 0x0304,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.bp_smi = {
+			BUS_PROT_WR(MT8183_SMI_COMMON_SMI_CLAMP_VENC,
+				    MT8183_SMI_COMMON_CLAMP_EN_SET,
+				    MT8183_SMI_COMMON_CLAMP_EN_CLR,
+				    MT8183_SMI_COMMON_CLAMP_EN),
+		},
+	},
+	[MT8183_POWER_DOMAIN_VPU_TOP] = {
+		.sta_mask = BIT(26),
+		.ctl_offs = 0x0324,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_MM_VPU_TOP,
+				    MT8183_TOP_AXI_PROT_EN_MM_SET,
+				    MT8183_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8183_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_VPU_TOP,
+				    MT8183_TOP_AXI_PROT_EN_SET,
+				    MT8183_TOP_AXI_PROT_EN_CLR,
+				    MT8183_TOP_AXI_PROT_EN_STA1),
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_MM_VPU_TOP_2ND,
+				    MT8183_TOP_AXI_PROT_EN_MM_SET,
+				    MT8183_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8183_TOP_AXI_PROT_EN_MM_STA1),
+		},
+		.bp_smi = {
+			BUS_PROT_WR(MT8183_SMI_COMMON_SMI_CLAMP_VPU_TOP,
+				    MT8183_SMI_COMMON_CLAMP_EN_SET,
+				    MT8183_SMI_COMMON_CLAMP_EN_CLR,
+				    MT8183_SMI_COMMON_CLAMP_EN),
+		},
+	},
+	[MT8183_POWER_DOMAIN_VPU_CORE0] = {
+		.sta_mask = BIT(27),
+		.ctl_offs = 0x33c,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE0,
+				    MT8183_TOP_AXI_PROT_EN_MCU_SET,
+				    MT8183_TOP_AXI_PROT_EN_MCU_CLR,
+				    MT8183_TOP_AXI_PROT_EN_MCU_STA1),
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE0_2ND,
+				    MT8183_TOP_AXI_PROT_EN_MCU_SET,
+				    MT8183_TOP_AXI_PROT_EN_MCU_CLR,
+				    MT8183_TOP_AXI_PROT_EN_MCU_STA1),
+		},
+		.caps = MTK_SCPD_SRAM_ISO,
+	},
+	[MT8183_POWER_DOMAIN_VPU_CORE1] = {
+		.sta_mask = BIT(28),
+		.ctl_offs = 0x0340,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE1,
+				    MT8183_TOP_AXI_PROT_EN_MCU_SET,
+				    MT8183_TOP_AXI_PROT_EN_MCU_CLR,
+				    MT8183_TOP_AXI_PROT_EN_MCU_STA1),
+			BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE1_2ND,
+				    MT8183_TOP_AXI_PROT_EN_MCU_SET,
+				    MT8183_TOP_AXI_PROT_EN_MCU_CLR,
+				    MT8183_TOP_AXI_PROT_EN_MCU_STA1),
+		},
+		.caps = MTK_SCPD_SRAM_ISO,
+	},
+};
+
 static const struct scpsys_soc_data mt8173_scpsys_data = {
 	.domains = scpsys_domain_data_mt8173,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8173),
@@ -712,11 +918,22 @@ static const struct scpsys_soc_data mt8173_scpsys_data = {
 	.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 };
 
+static const struct scpsys_soc_data mt8183_scpsys_data = {
+	.domains = scpsys_domain_data_mt8183,
+	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8183),
+	.pwr_sta_offs = 0x0180,
+	.pwr_sta2nd_offs = 0x0184
+};
+
 static const struct of_device_id scpsys_of_match[] = {
 	{
 		.compatible = "mediatek,mt8173-power-controller",
 		.data = &mt8173_scpsys_data,
 	},
+	{
+		.compatible = "mediatek,mt8183-power-controller",
+		.data = &mt8183_scpsys_data,
+	},
 	{ }
 };
 
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index 3f18cddffb44..826ed51c4843 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -2,6 +2,52 @@
 #ifndef __SOC_MEDIATEK_INFRACFG_H
 #define __SOC_MEDIATEK_INFRACFG_H
 
+#define MT8183_TOP_AXI_PROT_EN_STA1			0x228
+#define MT8183_TOP_AXI_PROT_EN_STA1_1			0x258
+#define MT8183_TOP_AXI_PROT_EN_SET			0x2a0
+#define MT8183_TOP_AXI_PROT_EN_CLR			0x2a4
+#define MT8183_TOP_AXI_PROT_EN_1_SET			0x2a8
+#define MT8183_TOP_AXI_PROT_EN_1_CLR			0x2ac
+#define MT8183_TOP_AXI_PROT_EN_MCU_SET			0x2c4
+#define MT8183_TOP_AXI_PROT_EN_MCU_CLR			0x2e4
+#define MT8183_TOP_AXI_PROT_EN_MCU_STA1			0x2ec
+#define MT8183_TOP_AXI_PROT_EN_MM_SET			0x2d4
+#define MT8183_TOP_AXI_PROT_EN_MM_CLR			0x2d8
+#define MT8183_TOP_AXI_PROT_EN_MM_STA1			0x2ec
+
+#define MT8183_TOP_AXI_PROT_EN_DISP			(BIT(10) | BIT(11))
+#define MT8183_TOP_AXI_PROT_EN_CONN			(BIT(13) | BIT(14))
+#define MT8183_TOP_AXI_PROT_EN_MFG			(BIT(21) | BIT(22))
+#define MT8183_TOP_AXI_PROT_EN_CAM			BIT(28)
+#define MT8183_TOP_AXI_PROT_EN_VPU_TOP			BIT(27)
+#define MT8183_TOP_AXI_PROT_EN_1_DISP			(BIT(16) | BIT(17))
+#define MT8183_TOP_AXI_PROT_EN_1_MFG			GENMASK(21, 19)
+#define MT8183_TOP_AXI_PROT_EN_MM_ISP			(BIT(3) | BIT(8))
+#define MT8183_TOP_AXI_PROT_EN_MM_ISP_2ND		BIT(10)
+#define MT8183_TOP_AXI_PROT_EN_MM_CAM			(BIT(4) | BIT(5) | \
+							 BIT(9) | BIT(13))
+#define MT8183_TOP_AXI_PROT_EN_MM_VPU_TOP		(GENMASK(9, 6) | \
+							 BIT(12))
+#define MT8183_TOP_AXI_PROT_EN_MM_VPU_TOP_2ND		(BIT(10) | BIT(11))
+#define MT8183_TOP_AXI_PROT_EN_MM_CAM_2ND		BIT(11)
+#define MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE0_2ND	(BIT(0) | BIT(2) | \
+							 BIT(4))
+#define MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE1_2ND	(BIT(1) | BIT(3) | \
+							 BIT(5))
+#define MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE0		BIT(6)
+#define MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE1		BIT(7)
+
+#define MT8183_SMI_COMMON_CLAMP_EN			0x3c0
+#define MT8183_SMI_COMMON_CLAMP_EN_SET			0x3c4
+#define MT8183_SMI_COMMON_CLAMP_EN_CLR			0x3c8
+
+#define MT8183_SMI_COMMON_SMI_CLAMP_DISP		GENMASK(7, 0)
+#define MT8183_SMI_COMMON_SMI_CLAMP_VENC		BIT(1)
+#define MT8183_SMI_COMMON_SMI_CLAMP_ISP			BIT(2)
+#define MT8183_SMI_COMMON_SMI_CLAMP_CAM			(BIT(3) | BIT(4))
+#define MT8183_SMI_COMMON_SMI_CLAMP_VPU_TOP		(BIT(5) | BIT(6))
+#define MT8183_SMI_COMMON_SMI_CLAMP_VDEC		BIT(7)
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
