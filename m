Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57324C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 12:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GFjV2Rgcdt3zhSbL4mxje9aAihagzhv6JRa09yEIjQ=; b=oyyAV6rrjaZRZF
	kW/O9YhGoQIXD0ybLiegjaE9x1MA4Bvkt86FRcyytE4W1EcVOtAi0GHw9I0TGrkFjsn4a6zDRm1NE
	/s53Wg6/X7txnwnw4LgFYiMkkdmxSzVgbPf6ot33YJw6bHF3Z6ND5a3pBzsam/QxJRENlL4cEVZU/
	Ajwb0UkNlyrv7qiFoyU861Ff5c8h7ClS6o8SrArbYg7ivg34gkQGZ6LC3Jvq9nNC5mX4gSFlp3HGs
	9lBwE9iIkwmalPArG4d9tKghj0WtbySPkVDXKSSJI1N4R2muf6jQMe7cC56QzxGAKY+3+2PDx3NmM
	6MmU+0CeOXRjf7Uj/wgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk2w3-006hKw-EX; Thu, 28 Apr 2022 12:07:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk2um-006gri-JH; Thu, 28 Apr 2022 12:06:38 +0000
X-UUID: 0e54817d92524bdeb27f45c86898d1a5-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:ecfcfce7-091b-4ae2-a83f-b4e4e67210ba, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:3ba0d4c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 0e54817d92524bdeb27f45c86898d1a5-20220428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 334321520; Thu, 28 Apr 2022 05:06:28 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 04:56:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 19:56:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Apr 2022 19:56:24 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V5 14/16] clk: mediatek: reset: Add infra_ao reset support for
 MT8192/MT8195
Date: Thu, 28 Apr 2022 19:56:17 +0800
Message-ID: <20220428115620.13512-15-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220428115620.13512-1-rex-bc.chen@mediatek.com>
References: <20220428115620.13512-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_050632_687144_FBD5411C 
X-CRM114-Status: GOOD (  14.33  )
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

The infra_ao reset is needed for MT8192 and MT8195.
- Add mtk_clk_rst_desc for MT8192 and MT8195
- Add register reset controller function for MT8192 infra_ao.
- Move definition of infra reset from cl-mt8183.c to reset.h
  because it's the same definition with MT8192 and MT8195.
- Add new definition of infra reset_4 for MT8192 and MT8195.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8183.c          |  6 ------
 drivers/clk/mediatek/clk-mt8192.c          | 18 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt8195-infra_ao.c | 15 +++++++++++++++
 drivers/clk/mediatek/reset.h               |  7 +++++++
 4 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index c7d5ffacbd1d..40b53e15411d 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -18,12 +18,6 @@
 
 #include <dt-bindings/clock/mt8183-clk.h>
 
-/* Infra global controller reset set register */
-#define INFRA_RST0_SET_OFFSET		0x120
-#define INFRA_RST1_SET_OFFSET		0x130
-#define INFRA_RST2_SET_OFFSET		0x140
-#define INFRA_RST3_SET_OFFSET		0x150
-
 static DEFINE_SPINLOCK(mt8183_clk_lock);
 
 static const struct mtk_fixed_clk top_fixed_clks[] = {
diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index ab27cd66b866..add177eb17d2 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1114,6 +1114,20 @@ static const struct mtk_gate top_clks[] = {
 	GATE_TOP(CLK_TOP_SSUSB_PHY_REF, "ssusb_phy_ref", "clk26m", 25),
 };
 
+static u16 infra_ao_rst_ofs[] = {
+	INFRA_RST0_SET_OFFSET,
+	INFRA_RST1_SET_OFFSET,
+	INFRA_RST2_SET_OFFSET,
+	INFRA_RST3_SET_OFFSET,
+	INFRA_RST4_SET_OFFSET,
+};
+
+static const struct mtk_clk_rst_desc clk_rst_desc = {
+	.version = MTK_RST_SET_CLR,
+	.rst_bank_ofs = infra_ao_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(infra_ao_rst_ofs),
+};
+
 #define MT8192_PLL_FMAX		(3800UL * MHZ)
 #define MT8192_PLL_FMIN		(1500UL * MHZ)
 #define MT8192_INTEGER_BITS	8
@@ -1239,6 +1253,10 @@ static int clk_mt8192_infra_probe(struct platform_device *pdev)
 	if (r)
 		goto free_clk_data;
 
+	r = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
+	if (r)
+		goto free_clk_data;
+
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
 		goto free_clk_data;
diff --git a/drivers/clk/mediatek/clk-mt8195-infra_ao.c b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
index 8ebe3b9415c4..4b7f21a6b93c 100644
--- a/drivers/clk/mediatek/clk-mt8195-infra_ao.c
+++ b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
@@ -182,9 +182,24 @@ static const struct mtk_gate infra_ao_clks[] = {
 	GATE_INFRA_AO4(CLK_INFRA_AO_PERI_UFS_MEM_SUB, "infra_ao_peri_ufs_mem_sub", "mem_466m", 31),
 };
 
+static u16 infra_ao_rst_ofs[] = {
+	INFRA_RST0_SET_OFFSET,
+	INFRA_RST1_SET_OFFSET,
+	INFRA_RST2_SET_OFFSET,
+	INFRA_RST3_SET_OFFSET,
+	INFRA_RST4_SET_OFFSET,
+};
+
+static struct mtk_clk_rst_desc infra_ao_rst_desc = {
+	.version = MTK_RST_SET_CLR,
+	.rst_bank_ofs = infra_ao_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(infra_ao_rst_ofs),
+};
+
 static const struct mtk_clk_desc infra_ao_desc = {
 	.clks = infra_ao_clks,
 	.num_clks = ARRAY_SIZE(infra_ao_clks),
+	.rst_desc = &infra_ao_rst_desc,
 };
 
 static const struct of_device_id of_match_clk_mt8195_infra_ao[] = {
diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index ac1ca902c200..4f14fe704763 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -11,6 +11,13 @@
 
 #define RST_NR_PER_BANK 32
 
+/* Infra global controller reset set register */
+#define INFRA_RST0_SET_OFFSET 0x120
+#define INFRA_RST1_SET_OFFSET 0x130
+#define INFRA_RST2_SET_OFFSET 0x140
+#define INFRA_RST3_SET_OFFSET 0x150
+#define INFRA_RST4_SET_OFFSET 0x730
+
 /**
  * enum mtk_reset_version - Version of MediaTek clock reset controller.
  * @MTK_RST_SIMPLE: Use the same registers for bit set and clear.
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
