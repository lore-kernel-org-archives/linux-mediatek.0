Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAD1EEB581
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vo2+Ht37rnzqncUjP5jQLU3n66LjuW5bTm8lsUZgRBs=; b=2BVkYrke8pfct0mPKJDz+mibKb
	tdPAKe7U2ZPqblJJ29dWAMCNFQ8OLiV2+d5lM3rPTArfq1Xvf8Lp+frIoy/mV5gqHixOj+ou95YMu
	toutTQSF8UQjWpK/BlLwauM1EEy1LUVCEySfrqw0/sbsEQ+0odU81NcI2kzzZ+lvexEbaaHTjINnB
	VgDFpMo9OOVIZ8HIG6X12kVKKVqCsvFaohfp3qsfHNrZkwPdgbAmV0ZAsgDu6ZffZ6H7wTSr53gYl
	b0H9+aL6qRBY29BrX69UPgn1XXkZBKzFON+Q07WgImjU280ZjDDS4fzo98n5awloFRaEvB8Y5PKye
	JNzgImIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qffhv-000Rky-2l;
	Mon, 11 Sep 2023 12:07:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qffhr-000Ri6-33;
	Mon, 11 Sep 2023 12:07:57 +0000
X-UUID: d2dfc146509b11ee86758d4a7c00f3a0-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vo2+Ht37rnzqncUjP5jQLU3n66LjuW5bTm8lsUZgRBs=;
	b=cxjUr8GVZQ/7AK54Bk5oI274CX1haREkAjeEh3Db+TidObOT4GOkW9gYdK4DLL1FKQ39BOAoGC2jseNdmBuJznCXBRZMkBKNPVhidlGKoG1noHYhCKL1gpK00/EJ+L5e2PF5COI0go992Uhcnek3aqEFDwpDb8yGYUiLvY1ZUVw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:97785ed1-38d0-4c86-a0b9-138ee2798a85,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:ca71e4c2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d2dfc146509b11ee86758d4a7c00f3a0-20230911
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1604715290; Mon, 11 Sep 2023 05:07:48 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 20:07:45 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 20:07:44 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Shuijing Li
	<shuijing.li@mediatek.com>
Subject: [PATCH v4,2/3] drm/mediatek: dsi: Add dsi cmdq_ctl to send panel initial code
Date: Mon, 11 Sep 2023 20:07:59 +0800
Message-ID: <20230911120800.17369-3-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230911120800.17369-1-shuijing.li@mediatek.com>
References: <20230911120800.17369-1-shuijing.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_050755_986908_21E527A0 
X-CRM114-Status: GOOD (  12.64  )
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

For mt8188, add dsi cmdq reg control to send long packets to panel
initialization. MT8188 hardware has been changed to automatically
set the cmdq_size value by default when sending long packets.
In this patch, the cmdq_size value is set manually instead.
Remain consistent with previous IC.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes in v4:
Add a comment per suggestion from the previous thread:
https://lore.kernel.org/all/14e03873-3723-8293-0190-445a71828b25@collabora.com/
Changes in v3:
reorder patch 2/3 and 3/3, and describe more about why mt8188 need this
patch,
per suggestion from the previous thread:
https://lore.kernel.org/lkml/411ddbf95e2c2298b84899065691d478069ec273.camel@mediatek.com/
Changes in v2:
use mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL); directly,
per suggestion from the previous thread:
https://lore.kernel.org/lkml/015f4c60-ed77-9e1f-8a6b-cda6e4f6ac93@gmail.com/
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d8bfc2cce54d..623aa829ef6b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -86,6 +86,7 @@
 
 #define DSI_CMDQ_SIZE		0x60
 #define CMDQ_SIZE			0x3f
+#define CMDQ_SIZE_SEL		BIT(15)
 
 #define DSI_HSTX_CKL_WC		0x64
 
@@ -178,6 +179,7 @@ struct mtk_dsi_driver_data {
 	const u32 reg_cmdq_off;
 	bool has_shadow_ctl;
 	bool has_size_ctl;
+	bool cmdq_long_packet_ctl;
 };
 
 struct mtk_dsi {
@@ -996,6 +998,10 @@ static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const struct mipi_dsi_msg *msg)
 
 	mtk_dsi_mask(dsi, reg_cmdq_off, cmdq_mask, reg_val);
 	mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE, cmdq_size);
+	if (dsi->driver_data->cmdq_long_packet_ctl) {
+		/* Disable setting cmdq_size automatically for long packets */
+		mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL);
+	}
 }
 
 static ssize_t mtk_dsi_host_send_cmd(struct mtk_dsi *dsi,
-- 
2.40.1


