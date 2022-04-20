Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2C2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 13:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trymJFJsjni08VsWKdzzxos51IEtbEfiKhVcYCXd0Wc=; b=CN7+4eoIB40ta7
	68YEngNz0LWEhySOjtHLu5kMD4fPOf5QjxcVWRTyEK/dXV+DkjipcMEP9UYoe4OqNx0qDn0pSupW0
	93ZVw/j4GHzbIgOEDJlgCE0aMMCH9am5iOn4ijor0yhLER3F13ZlMqaZ90ixsgGagxvJiR0SnI3r0
	2VIWX09wBBy5XRdLhgtgZkezVk5zPcgFMytL8GSS8c/btkOdkRXd7eCrLY7eQuUheCnDk+PZZG3IW
	oCFuiBqxcksPlMuHqzgQuKUU2rUvvi2gQbBoFuMDESi9lgn6aoipRy5mjgZXcSQqlUr7dhgHj7WbQ
	OrdPyOAS5Y7uY5TYMKCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhA4k-0095WY-3f; Wed, 20 Apr 2022 13:08:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhA3s-0095Aj-EE; Wed, 20 Apr 2022 13:08:05 +0000
X-UUID: 39a89d9195aa45e5848e0a731d2a6155-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b66dca95-1507-472a-9c9e-b9bbd644ee3c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:8df25cf0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 39a89d9195aa45e5848e0a731d2a6155-20220420
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2129209654; Wed, 20 Apr 2022 06:05:34 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 06:05:33 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 20 Apr 2022 21:05:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Apr 2022 21:05:30 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V2 12/12] clk: mediatek: reset: Add infra_ao reset support for
 MT8195
Date: Wed, 20 Apr 2022 21:05:27 +0800
Message-ID: <20220420130527.23200-13-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_060800_553085_176C7DB8 
X-CRM114-Status: GOOD (  11.80  )
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

The infra_ao reset is needed for MT8195. Therefore, we add this patch
to support it.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8195-infra_ao.c | 8 ++++++++
 include/dt-bindings/reset/mt8195-resets.h  | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8195-infra_ao.c b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
index 8ebe3b9415c4..31d0039250dc 100644
--- a/drivers/clk/mediatek/clk-mt8195-infra_ao.c
+++ b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
@@ -182,9 +182,17 @@ static const struct mtk_gate infra_ao_clks[] = {
 	GATE_INFRA_AO4(CLK_INFRA_AO_PERI_UFS_MEM_SUB, "infra_ao_peri_ufs_mem_sub", "mem_466m", 31),
 };
 
+static struct mtk_clk_rst_desc infra_ao_rst_desc = {
+	.version = MTK_RST_SET_CLR,
+	.reg_num = 4,
+	.reg_ofs = 0x0,
+	.reset_n_cells = 2,
+};
+
 static const struct mtk_clk_desc infra_ao_desc = {
 	.clks = infra_ao_clks,
 	.num_clks = ARRAY_SIZE(infra_ao_clks),
+	.rst_desc = &infra_ao_rst_desc,
 };
 
 static const struct of_device_id of_match_clk_mt8195_infra_ao[] = {
diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
index a26bccc8b957..2479680616fb 100644
--- a/include/dt-bindings/reset/mt8195-resets.h
+++ b/include/dt-bindings/reset/mt8195-resets.h
@@ -26,4 +26,11 @@
 
 #define MT8195_TOPRGU_SW_RST_NUM               16
 
+/* INFRA RST0 */
+#define MT8195_INFRA_RST0_THERMAL_AP_RST       0
+/* INFRA RST3 */
+#define MT8195_INFRA_RST3_PTP_RST              5
+/* INFRA RST4 */
+#define MT8195_INFRA_RST4_THERMAL_MCU_RST      10
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
