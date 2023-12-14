Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65B9C3DA79
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 06:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+uFOxS7n5grSNHrAFSx8XCQRvD6lGHMhzCBfr8ABok=; b=cP0zIdeaTul7Is/IJrNzuf3a9o
	HcXF3gZUuulM1lKdK1XBXqe7dBNopcNy8V9nC/vft4sybyIyxs/v7jzp46PwTTpAmQGH3/jq36HY4
	5lbrq0lyiTx0RzoGflvk58SLoWkQMP5rH63n2oJAu6yDzqUtrMXgRQS9LiRKVlZ+e1o59j6W0GaIC
	yclsMTkHi+55ByL1ltZAJnSgU1Q4ZFpXfF0lQ5GOx+Zh2CLZx47yoZVesc/NBQQEOkcMSh+o3SK0a
	q/iAncPExPmUpgJF6aY2LDFFJlaLh7IWZdbui9dYmWHZYygdz6L/5ObfqyafK6mRHtDO1s5EAIgix
	tkgTxObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDelz-00GtVD-12;
	Thu, 14 Dec 2023 06:00:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDelP-00Gsxq-1C;
	Thu, 14 Dec 2023 06:00:07 +0000
X-UUID: 00d810649a4611ee958cff29c719f35b-20231213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=o+uFOxS7n5grSNHrAFSx8XCQRvD6lGHMhzCBfr8ABok=;
	b=HQei70YyMsCagpVWBBq+9XOlgy7sf2MXe7+oqmZkCfUDaTk1X4JZL1gX6LDuBmgquRaDeavYBXYSbCSLumeiNh0siIc5tyIufEojckSrQfsnRZNyeGlDjqB6Hhz6rGOdReVpucoMVCBy1IF34U+wVxQWAg5PK3ghYUlRZardJAM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:96b7dbba-74b0-47e9-a113-1a700a733cc7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:a0ff2e61-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 00d810649a4611ee958cff29c719f35b-20231213
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 180886937; Wed, 13 Dec 2023 22:59:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Dec 2023 13:58:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Dec 2023 13:58:49 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Matthias Brugger <matthias.bgg@gmail.com>, Moudy Ho <moudy.ho@mediatek.com>,
	Hsiao Chien Sung <shawn.sung@mediatek.com>, Nathan Lu
	<nathan.lu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, "Roy-CW .
 Yeh" <roy-cw.yeh@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	xinlei lee <xinlei.lee@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v12 09/23] soc: mediatek: Support reset bit mapping in mmsys driver
Date: Thu, 14 Dec 2023 13:58:33 +0800
Message-ID: <20231214055847.4936-10-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231214055847.4936-1-shawn.sung@mediatek.com>
References: <20231214055847.4936-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_220003_513520_8EE539D2 
X-CRM114-Status: GOOD (  13.65  )
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

- Reset ID must starts from 0 and be consecutive, but
  the reset bits in our hardware design is not continuous,
  some bits are left unused, we need a map to solve the problem
- Use old style 1-to-1 mapping if .rst_tb is not defined

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 9 +++++++++
 drivers/soc/mediatek/mtk-mmsys.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 1b160fcc1d27..fee958d0b8a6 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -314,6 +314,15 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
 	u32 offset;
 	u32 reg;
 
+	if (mmsys->data->rst_tb) {
+		if (id >= mmsys->data->num_resets) {
+			dev_err(rcdev->dev, "Invalid reset ID: %lu (>=%u)\n",
+				id, mmsys->data->num_resets);
+			return -EINVAL;
+		}
+		id = mmsys->data->rst_tb[id];
+	}
+
 	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
 	id = id % MMSYS_SW_RESET_PER_REG;
 	reg = mmsys->data->sw0_rst_offset + offset;
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 9d8507f98b7a..d370192737ca 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -78,6 +78,8 @@
 #define DSI_SEL_IN_RDMA				0x1
 #define DSI_SEL_IN_MASK				0x1
 
+#define MMSYS_RST_NR(bank, bit) (((bank) * 32) + (bit))
+
 struct mtk_mmsys_routes {
 	u32 from_comp;
 	u32 to_comp;
@@ -119,6 +121,7 @@ struct mtk_mmsys_driver_data {
 	const struct mtk_mmsys_routes *routes;
 	const unsigned int num_routes;
 	const u16 sw0_rst_offset;
+	const u8 *rst_tb;
 	const u32 num_resets;
 	const bool is_vppsys;
 	const u8 vsync_len;
-- 
2.18.0


