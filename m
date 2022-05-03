Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2899FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 14:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsxHSYTPbXjSmYjVtCnqMawqJaQ305Q75WZXCMXfu2I=; b=uTIGiKNAf7V0ex
	4x37YHJXYtfzFEdNgnQ+HRzVymIiypGLcZ/odtyK7yp/wRTWr7oop4Q9kkfK6ycCo++zsI64ar27N
	N3c31QmQSPnP08Yr4rmMNdrA3sIyb7By3LgBxSYhGnLEo7UsP6WYkyjglb+Z/SzEfdl16r5Xi1Fal
	O4Ybg2AXj3MJJkcu8H58A5TY5p7HjFOfL5g3U792YgfcRM1BF5w2DtJSlUlLJHmCXVCye/rdWj7CY
	g/U/o0ywhF5Uift++WQUSWBrU0xYR06Bs/tMv17GpZwixRfcWHlf/TnWJyKZ4rRew/ZXWvecbnCEZ
	JcrlWjUda4tgTgbVhFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltJB-006Bq4-KW; Tue, 03 May 2022 14:15:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltIe-006Bcu-Rm; Tue, 03 May 2022 14:14:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 027491F43549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651587287;
 bh=Vzt5rJ5w7RADVz/xg7c0ik/5e8mPzC+52IMY2R0fGcU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G6yBvaUFOtq2v5zmB5Z+4pdtwSex6+dHxIdEZrcLqxGga+4XL1AIF+fl+rZ/d+eAl
 qTP6097PFgYVBcu6+wC/g1/r4ZBLftyWr3N0RSGZyq0K2/OTXTbaovJWPoiKi9GnjI
 XHc3YgavRqfrGGyQdE/HDgre0kA3Iszglg96hVcjl+ANeTLQyR8eSJeRJwtr3oGmwo
 Bn9qG/LhrsL0tvHPDVP+nglNqX00jMqFlWT0eQPUbx+rwSHGP9of7J+Fk1RosrQC13
 hWk4ZmcMKXYvC7T98XJvBSaKGcDsJgqTnT4NiUVZqIx+B925ZNr6TMS3vCh6svtFD7
 vYrlCGdmP0uSQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
 matthias.bgg@gmail.com, chun-jie.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com, weiyi.lu@mediatek.com,
 mbrugger@suse.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 nfraprado@collabora.com
Subject: [PATCH v2 2/2] soc: mediatek: pm-domains: Add support for Helio X10
 MT6795
Date: Tue,  3 May 2022 16:14:41 +0200
Message-Id: <20220503141441.125852-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503141441.125852-1-angelogioacchino.delregno@collabora.com>
References: <20220503141441.125852-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_071449_202762_E97BEA81 
X-CRM114-Status: GOOD (  14.85  )
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

Add pm-domains (mtcmos) data for MediaTek Helio X10 MT6795 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt6795-pm-domains.h | 112 +++++++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c    |   5 +
 2 files changed, 117 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt6795-pm-domains.h

diff --git a/drivers/soc/mediatek/mt6795-pm-domains.h b/drivers/soc/mediatek/mt6795-pm-domains.h
new file mode 100644
index 000000000000..ef07c9dfdd9b
--- /dev/null
+++ b/drivers/soc/mediatek/mt6795-pm-domains.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT6795_PM_DOMAINS_H
+#define __SOC_MEDIATEK_MT6795_PM_DOMAINS_H
+
+#include "mtk-pm-domains.h"
+#include <dt-bindings/power/mt6795-power.h>
+
+/*
+ * MT6795 power domain support
+ */
+
+static const struct scpsys_domain_data scpsys_domain_data_mt6795[] = {
+	[MT6795_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
+		.sta_mask = PWR_STATUS_VDEC,
+		.ctl_offs = SPM_VDE_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT6795_POWER_DOMAIN_VENC] = {
+		.name = "venc",
+		.sta_mask = PWR_STATUS_VENC,
+		.ctl_offs = SPM_VEN_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+	},
+	[MT6795_POWER_DOMAIN_ISP] = {
+		.name = "isp",
+		.sta_mask = PWR_STATUS_ISP,
+		.ctl_offs = SPM_ISP_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+	},
+	[MT6795_POWER_DOMAIN_MM] = {
+		.name = "mm",
+		.sta_mask = PWR_STATUS_DISP,
+		.ctl_offs = SPM_DIS_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_UPDATE_TOPAXI(MT8173_TOP_AXI_PROT_EN_MM_M0 |
+					       MT8173_TOP_AXI_PROT_EN_MM_M1),
+		},
+	},
+	[MT6795_POWER_DOMAIN_MJC] = {
+		.name = "mjc",
+		.sta_mask = BIT(20),
+		.ctl_offs = 0x298,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+	},
+	[MT6795_POWER_DOMAIN_AUDIO] = {
+		.name = "audio",
+		.sta_mask = PWR_STATUS_AUDIO,
+		.ctl_offs = SPM_AUDIO_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+	},
+	[MT6795_POWER_DOMAIN_MFG_ASYNC] = {
+		.name = "mfg_async",
+		.sta_mask = PWR_STATUS_MFG_ASYNC,
+		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = 0,
+	},
+	[MT6795_POWER_DOMAIN_MFG_2D] = {
+		.name = "mfg_2d",
+		.sta_mask = PWR_STATUS_MFG_2D,
+		.ctl_offs = SPM_MFG_2D_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+	},
+	[MT6795_POWER_DOMAIN_MFG] = {
+		.name = "mfg",
+		.sta_mask = PWR_STATUS_MFG,
+		.ctl_offs = SPM_MFG_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+		.sram_pdn_bits = GENMASK(13, 8),
+		.sram_pdn_ack_bits = GENMASK(21, 16),
+		.bp_infracfg = {
+			BUS_PROT_UPDATE_TOPAXI(MT8173_TOP_AXI_PROT_EN_MFG_S |
+					       MT8173_TOP_AXI_PROT_EN_MFG_M0 |
+					       MT8173_TOP_AXI_PROT_EN_MFG_M1 |
+					       MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT),
+		},
+	},
+};
+
+static const struct scpsys_soc_data mt6795_scpsys_data = {
+	.domains_data = scpsys_domain_data_mt6795,
+	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt6795),
+};
+
+#endif /* __SOC_MEDIATEK_MT6795_PM_DOMAINS_H */
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 5ced254b082b..4da53488c381 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -16,6 +16,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/soc/mediatek/infracfg.h>
 
+#include "mt6795-pm-domains.h"
 #include "mt8167-pm-domains.h"
 #include "mt8173-pm-domains.h"
 #include "mt8183-pm-domains.h"
@@ -555,6 +556,10 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys)
 }
 
 static const struct of_device_id scpsys_of_match[] = {
+	{
+		.compatible = "mediatek,mt6795-power-controller",
+		.data = &mt6795_scpsys_data,
+	},
 	{
 		.compatible = "mediatek,mt8167-power-controller",
 		.data = &mt8167_scpsys_data,
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
