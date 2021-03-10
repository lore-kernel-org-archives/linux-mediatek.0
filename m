Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBDEC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 06:38:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63B9864FE8
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 06:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63B9864FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EFPlsBP4fbqOabRt9aKUiQkF3wWGBpHOXRJmBGoCA54=; b=KwXpBg42O9J9JlKWaSZtuJakZ
	I5IMygzevar2muOrNpfnEIzppK1N/kBsxbAW6pe1kNRth0oTdSHOuMBcDg/jeoj4RDGPenpDwZ65a
	eN5fghKGw+BYWGXwkefy7xCqvSZ1ulxq18XpypplltpNS/5a16+7/IKE+A2W2gW2hHdF6nJyGhDtD
	ZQWaY+9mnAqad5vPZpBQpakbwRCW/Q1fSwAXqE4tpafSirgYx9IeSvFZIvZyLrUEXoRetu/6bwWmD
	HA9dYNEhKvrWbtLfCfpMGrVSm1jPvDJ339wWgnYeIoguGQfC+alGzi2Gsl3dutvBjM90p7F6Cmoa7
	3O8UgZ47g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJsU0-0068Vm-3s; Wed, 10 Mar 2021 06:38:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJsT5-0068Ih-1e; Wed, 10 Mar 2021 06:37:17 +0000
X-UUID: 68f1683fb11744a4828a7b9f1f859a08-20210309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=a8yTCYd/tbfP8xTAFsGZCGz2OBHxmDtE1AQMxlAEtQE=; 
 b=T9JkW8i/u3Fn/IysrXrwi4Eeny2rG/K8KVq24jlUal+NY147SAJw7D56MuhCFno9zrhE1Q9dT00Hm97D7z/RRTV/qolNKoH9WPS9rtQeMJNtt6Y3hbgOVXXuarCMHW7iX9vMohCaSG75gA4OaR7aFzF62x664MNheow045RK/y4=;
X-UUID: 68f1683fb11744a4828a7b9f1f859a08-20210309
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1653846935; Tue, 09 Mar 2021 22:37:04 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Mar 2021 22:37:02 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 14:37:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 10 Mar 2021 14:37:00 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wendell Lin
 <Wendell.Lin@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>, Sean Wang
 <Sean.Wang@mediatek.com>, Macpaul Lin <Macpaul.Lin@mediatek.com>, Owen Chen
 <owen.chen@mediatek.com>, Evan Green <evgreen@chromium.org>,
 <Yong.Wu@mediatek.com>, Joerg Roedel <jroedel@suse.de>, Shawn Guo
 <shawnguo@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Ryder Lee
 <Ryder.Lee@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: Ainge Hsu <ainge.hsu@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, 
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, CC Hwang
 <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>
Subject: [PATCH v10 2/4] soc: mediatek: add MT6765 scpsys and subdomain support
Date: Wed, 10 Mar 2021 14:36:56 +0800
Message-ID: <1615358218-6540-3-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1615358218-6540-1-git-send-email-macpaul.lin@mediatek.com>
References: <1615291538-9799-1-git-send-email-macpaul.lin@mediatek.com>
 <1615358218-6540-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_063715_502161_4B04CA3C 
X-CRM114-Status: GOOD (  14.81  )
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

From: Mars Cheng <mars.cheng@mediatek.com>

This adds scpsys support for MT6765
Add subdomain support for MT6765:
isp, mm, connsys, mfg, and cam.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
Signed-off-by: Owen Chen <owen.chen@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 91 +++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index ca75b14931ec..fc8d3858f1b4 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -15,6 +15,7 @@
 
 #include <dt-bindings/power/mt2701-power.h>
 #include <dt-bindings/power/mt2712-power.h>
+#include <dt-bindings/power/mt6765-power.h>
 #include <dt-bindings/power/mt6797-power.h>
 #include <dt-bindings/power/mt7622-power.h>
 #include <dt-bindings/power/mt7623a-power.h>
@@ -750,6 +751,81 @@ static const struct scp_subdomain scp_subdomain_mt2712[] = {
 	{MT2712_POWER_DOMAIN_MFG_SC2, MT2712_POWER_DOMAIN_MFG_SC3},
 };
 
+/*
+ * MT6765 power domain support
+ */
+#define SPM_PWR_STATUS_MT6765			0x0180
+#define SPM_PWR_STATUS_2ND_MT6765		0x0184
+
+static const struct scp_domain_data scp_domain_data_mt6765[] = {
+	[MT6765_POWER_DOMAIN_VCODEC] = {
+		.name = "vcodec",
+		.sta_mask = BIT(26),
+		.ctl_offs = 0x300,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT6765_POWER_DOMAIN_ISP] = {
+		.name = "isp",
+		.sta_mask = BIT(5),
+		.ctl_offs = 0x308,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT6765_POWER_DOMAIN_MM] = {
+		.name = "mm",
+		.sta_mask = BIT(3),
+		.ctl_offs = 0x30C,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.clk_id = {CLK_MM},
+	},
+	[MT6765_POWER_DOMAIN_CONN] = {
+		.name = "conn",
+		.sta_mask = BIT(1),
+		.ctl_offs = 0x32C,
+		.sram_pdn_bits = 0,
+		.sram_pdn_ack_bits = 0,
+	},
+	[MT6765_POWER_DOMAIN_MFG_ASYNC] = {
+		.name = "mfg_async",
+		.sta_mask = BIT(23),
+		.ctl_offs = 0x334,
+		.sram_pdn_bits = 0,
+		.sram_pdn_ack_bits = 0,
+		.clk_id = {CLK_MFG},
+	},
+	[MT6765_POWER_DOMAIN_MFG] = {
+		.name = "mfg",
+		.sta_mask = BIT(4),
+		.ctl_offs = 0x338,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT6765_POWER_DOMAIN_CAM] = {
+		.name = "cam",
+		.sta_mask = BIT(25),
+		.ctl_offs = 0x344,
+		.sram_pdn_bits = GENMASK(9, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+	},
+	[MT6765_POWER_DOMAIN_MFG_CORE0] = {
+		.name = "mfg_core0",
+		.sta_mask = BIT(7),
+		.ctl_offs = 0x34C,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+};
+
+static const struct scp_subdomain scp_subdomain_mt6765[] = {
+	{MT6765_POWER_DOMAIN_MM, MT6765_POWER_DOMAIN_CAM},
+	{MT6765_POWER_DOMAIN_MM, MT6765_POWER_DOMAIN_ISP},
+	{MT6765_POWER_DOMAIN_MM, MT6765_POWER_DOMAIN_VCODEC},
+	{MT6765_POWER_DOMAIN_MFG_ASYNC, MT6765_POWER_DOMAIN_MFG},
+	{MT6765_POWER_DOMAIN_MFG, MT6765_POWER_DOMAIN_MFG_CORE0},
+};
+
 /*
  * MT6797 power domain support
  */
@@ -1033,6 +1109,18 @@ static const struct scp_soc_data mt2712_data = {
 	.bus_prot_reg_update = false,
 };
 
+static const struct scp_soc_data mt6765_data = {
+	.domains = scp_domain_data_mt6765,
+	.num_domains = ARRAY_SIZE(scp_domain_data_mt6765),
+	.subdomains = scp_subdomain_mt6765,
+	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt6765),
+	.regs = {
+		.pwr_sta_offs = SPM_PWR_STATUS_MT6765,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND_MT6765,
+	},
+	.bus_prot_reg_update = true,
+};
+
 static const struct scp_soc_data mt6797_data = {
 	.domains = scp_domain_data_mt6797,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt6797),
@@ -1088,6 +1176,9 @@ static const struct of_device_id of_scpsys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt2712-scpsys",
 		.data = &mt2712_data,
+	}, {
+		.compatible = "mediatek,mt6765-scpsys",
+		.data = &mt6765_data,
 	}, {
 		.compatible = "mediatek,mt6797-scpsys",
 		.data = &mt6797_data,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
