Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D574EC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 07:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L8S2VPO1BHTRjj+EeuISd/97JupfkUS9QELUdXcrrDY=; b=z/+MHk3yLdlHLJWyCOGt/HoCTr
	dsNSAaLOGXmgQCE6NViJYdGSm4H2TIIwp1RwOL2LGGwFJm0CohOSgbU8XFAnmJ46ibq30ciiEluHS
	wRu6XKultzXc7QZKdAtzozkPP66mFlAwRrCIWNLmmqu/5yWDqxGnfdaK+sEi5LrCIxDHxUtgv6acX
	Is8D5pbeHaH9SDFrMpVntA7HZX4e2lE+RyARbygmAkmQkbLCTwBMX43aN8sr0Jnf/tJ558Go1yhie
	Nih94MEKqN60a7/EMWMQBccXp++MUBJsUOg6OewChEOX5GgBmOv9IQA0tkQEnSU9A2OclneE2cl5Z
	h7EtEWaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phPqu-00GrZt-31;
	Wed, 29 Mar 2023 07:04:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phPqr-00GrZI-10;
	Wed, 29 Mar 2023 07:04:10 +0000
X-UUID: e1b1b590cdff11edb7d8d11f642b8e78-20230329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=L8S2VPO1BHTRjj+EeuISd/97JupfkUS9QELUdXcrrDY=;
	b=oEWctwD61s8RcEOAyiZKLWe2eM0v2GcUvkqL+uc1Hi42r+Pocftr5bUg6uuxsfSOZ7nzlspsrLZbPRBvmmXjyTKzhQHSltFKT1GrgpPO8UV8Ugj1QIzfBEDzpJ7sYg6q7ea7tD3gAESifkxS6QKnE8/z+7PDp4onIZdJu39Hx9Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:a575e30b-78bc-4ab7-a115-9bd0e1742227,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:919bb4b4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: e1b1b590cdff11edb7d8d11f642b8e78-20230329
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 376491686; Wed, 29 Mar 2023 00:04:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 29 Mar 2023 14:43:26 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 29 Mar 2023 14:43:26 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH] drm/mediatek: dp: change the aux retries times when receiving AUX_DEFER
Date: Wed, 29 Mar 2023 14:43:23 +0800
Message-ID: <1680072203-10394-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_000409_367945_05B49F9B 
X-CRM114-Status: GOOD (  11.65  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

DP 1.4a Section 2.8.7.1.5.6.1:
A DP Source device shall retry at least seven times upon receiving
AUX_DEFER before giving up the AUX transaction.

The drm_dp_i2c_do_msg() function in the drm_dp_helper.c file will
judge the status of the msg->reply parameter passed to aux_transfer
ange-the-aux-retries-times-when-re.patchfor different processing.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1f94fcc144d3..767b71da31a4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -806,10 +806,9 @@ static int mtk_dp_aux_wait_for_completion(struct mtk_dp *mtk_dp, bool is_read)
 }
 
 static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u8 cmd,
-				  u32 addr, u8 *buf, size_t length)
+				  u32 addr, u8 *buf, size_t length, u8 *reply_cmd)
 {
 	int ret;
-	u32 reply_cmd;
 
 	if (is_read && (length > DP_AUX_MAX_PAYLOAD_BYTES ||
 			(cmd == DP_AUX_NATIVE_READ && !length)))
@@ -841,10 +840,10 @@ static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u8 cmd,
 	/* Wait for feedback from sink device. */
 	ret = mtk_dp_aux_wait_for_completion(mtk_dp, is_read);
 
-	reply_cmd = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
-		    AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
+	*reply_cmd = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
+		     AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
 
-	if (ret || reply_cmd) {
+	if (ret) {
 		u32 phy_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3628) &
 				 AUX_RX_PHY_STATE_AUX_TX_P0_MASK;
 		if (phy_status != AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE) {
@@ -2070,7 +2069,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 		ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
 					     msg->address + accessed_bytes,
 					     msg->buffer + accessed_bytes,
-					     to_access);
+					     to_access, &msg->reply);
 
 		if (ret) {
 			drm_info(mtk_dp->drm_dev,
@@ -2080,7 +2079,6 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 		accessed_bytes += to_access;
 	} while (accessed_bytes < msg->size);
 
-	msg->reply = DP_AUX_NATIVE_REPLY_ACK | DP_AUX_I2C_REPLY_ACK;
 	return msg->size;
 err:
 	msg->reply = DP_AUX_NATIVE_REPLY_NACK | DP_AUX_I2C_REPLY_NACK;
-- 
2.18.0


