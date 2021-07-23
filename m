Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DED6C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 08:31:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3B6E60EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 08:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3B6E60EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igeyeJFZ/FYU4ShCSzMPJ4r7CWFlt3T99TPAUeyFyd8=; b=cYc5E8vtoyAs8/
	cQGRIf841XBoQ4kev14ZdfBtEam5beJuIfMOcMaCERkePS/iuapzg7wgklxnI0h0Cj9CGIdDgFD8m
	CB6An5lz6GSPaDnOWw67Ks5vBVyk15ZPoRnxc74epy2CSQSWc3S93ox8y324FdxjCKznY24OnJqEP
	uRN68NIDBKQkr9Y+NkollVoAk7k7YUuvXaTYQXe5iEe0PDOoL9U+Md/1AZV/2lXNUreCurTxl0en3
	zSHGZoO2zcNCB3ggUCO9Z/PeUs8T8Y6oKreVvlyrOUBxqU4Yvynl3gntnyv9CtNxrmBbLBGAO5+eF
	JU47PYRTA0+b4EFoObDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6qan-003wUS-Gl; Fri, 23 Jul 2021 08:31:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6qal-003wTB-Kd; Fri, 23 Jul 2021 08:31:37 +0000
X-UUID: 015db5d657a9482c9e0a5d3c56c6a630-20210723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5uouW4Vo/w4VMbphPue/dQWRgU/bcjv4twvxX8BVfRM=; 
 b=EgeNa8pbqs6BzTR0gvrQ7rYlrFDuXJDC2oSADIX4tgDPGtYqAZFAb4UMUVuEJQnFtkrQcr83d1rTRmMMxQW7qY48IniuDfpess19hmy7AzWsBei7H5UobRhTJMbYZhd50EzBcBZlPZF0q+2ntUdVZpPOJbn6lnVKi1fmXOYqSY4=;
X-UUID: 015db5d657a9482c9e0a5d3c56c6a630-20210723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 943864107; Fri, 23 Jul 2021 01:31:32 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 01:23:20 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 16:23:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Jul 2021 16:23:18 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH v4 2/3] phy: phy-mtk-tphy: support new hardware version
Date: Fri, 23 Jul 2021 16:22:41 +0800
Message-ID: <1627028562-23584-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1627028562-23584-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1627028562-23584-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_013135_730071_832279B7 
X-CRM114-Status: GOOD (  18.33  )
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

The PHYA arch is updated, and doesn't support slew rate calibrate
anymore on 7nm or advanced process, add a new version number to
support it.
Note: the FreqMeter bank is not used but reserved.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~4: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 40 +++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 731c483a04de..42a1174da6cc 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -27,7 +27,8 @@
 #define SSUSB_SIFSLV_V1_U3PHYD		0x000
 #define SSUSB_SIFSLV_V1_U3PHYA		0x200
 
-/* version V2 sub-banks offset base address */
+/* version V2/V3 sub-banks offset base address */
+/* V3: U2FREQ is not used anymore, but reserved */
 /* u2 phy banks */
 #define SSUSB_SIFSLV_V2_MISC		0x000
 #define SSUSB_SIFSLV_V2_U2FREQ		0x100
@@ -270,6 +271,7 @@
 enum mtk_phy_version {
 	MTK_PHY_V1 = 1,
 	MTK_PHY_V2,
+	MTK_PHY_V3,
 };
 
 struct mtk_phy_pdata {
@@ -330,6 +332,10 @@ static void hs_slew_rate_calibrate(struct mtk_tphy *tphy,
 	int fm_out;
 	u32 tmp;
 
+	/* HW V3 doesn't support slew rate cal anymore */
+	if (tphy->pdata->version == MTK_PHY_V3)
+		return;
+
 	/* use force value */
 	if (instance->eye_src)
 		return;
@@ -878,7 +884,7 @@ static void u2_phy_props_set(struct mtk_tphy *tphy,
 		writel(tmp, com + U3P_U2PHYBC12C);
 	}
 
-	if (instance->eye_src) {
+	if (tphy->pdata->version < MTK_PHY_V3 && instance->eye_src) {
 		tmp = readl(com + U3P_USBPHYACR5);
 		tmp &= ~PA5_RG_U2_HSTX_SRCTRL;
 		tmp |= PA5_RG_U2_HSTX_SRCTRL_VAL(instance->eye_src);
@@ -1042,11 +1048,15 @@ static struct phy *mtk_phy_xlate(struct device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (tphy->pdata->version == MTK_PHY_V1) {
+	switch (tphy->pdata->version) {
+	case MTK_PHY_V1:
 		phy_v1_banks_init(tphy, instance);
-	} else if (tphy->pdata->version == MTK_PHY_V2) {
+		break;
+	case MTK_PHY_V2:
+	case MTK_PHY_V3:
 		phy_v2_banks_init(tphy, instance);
-	} else {
+		break;
+	default:
 		dev_err(dev, "phy version is not supported\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -1075,6 +1085,10 @@ static const struct mtk_phy_pdata tphy_v2_pdata = {
 	.version = MTK_PHY_V2,
 };
 
+static const struct mtk_phy_pdata tphy_v3_pdata = {
+	.version = MTK_PHY_V3,
+};
+
 static const struct mtk_phy_pdata mt8173_pdata = {
 	.avoid_rx_sen_degradation = true,
 	.version = MTK_PHY_V1,
@@ -1086,6 +1100,7 @@ static const struct of_device_id mtk_tphy_id_table[] = {
 	{ .compatible = "mediatek,mt8173-u3phy", .data = &mt8173_pdata },
 	{ .compatible = "mediatek,generic-tphy-v1", .data = &tphy_v1_pdata },
 	{ .compatible = "mediatek,generic-tphy-v2", .data = &tphy_v2_pdata },
+	{ .compatible = "mediatek,generic-tphy-v3", .data = &tphy_v3_pdata },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mtk_tphy_id_table);
@@ -1129,12 +1144,15 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 		}
 	}
 
-	tphy->src_ref_clk = U3P_REF_CLK;
-	tphy->src_coef = U3P_SLEW_RATE_COEF;
-	/* update parameters of slew rate calibrate if exist */
-	device_property_read_u32(dev, "mediatek,src-ref-clk-mhz",
-		&tphy->src_ref_clk);
-	device_property_read_u32(dev, "mediatek,src-coef", &tphy->src_coef);
+	if (tphy->pdata->version < MTK_PHY_V3) {
+		tphy->src_ref_clk = U3P_REF_CLK;
+		tphy->src_coef = U3P_SLEW_RATE_COEF;
+		/* update parameters of slew rate calibrate if exist */
+		device_property_read_u32(dev, "mediatek,src-ref-clk-mhz",
+					 &tphy->src_ref_clk);
+		device_property_read_u32(dev, "mediatek,src-coef",
+					 &tphy->src_coef);
+	}
 
 	port = 0;
 	for_each_child_of_node(np, child_np) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
