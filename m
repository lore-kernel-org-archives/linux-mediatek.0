Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB0AE77198
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2025 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cMDSCtGjZWJsWp0VLSuytv75YuoxhvMH+zr0NBthYg4=; b=l2OHsG3JYO00tr8cQr5/LZKISQ
	9ytt7+AONoMZkyhIG+jIIp7427ddU8gfw3OErnyI0vzrN8oUv5fW8SxYCrveFba4y14Q5pfIOOiDO
	veLqFUKNgNopF0qE/lvcxzBmYxk97AsuWNYLA1xXnJtFReD0nSAUfYYHMsRvqzUCW7bsi6KJ1tN5A
	S8aPh7Rux3uEnYHDGl744iZO4QIXocjQVmJ8LL/5QYb1NZ5R4Rtj9Fq5hTYcZXlRhq6roYjSgP5vY
	GBitsZvlT4gBqU7sVGH+bs/8RsAfQIxSIl9y8OJvLe8u12R4783BFJjoh7TuvfeyM4ednXjI6I6M7
	b2+yDJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcIC-0000000CNHl-0qef;
	Fri, 03 Jan 2025 07:40:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcCa-0000000CMAQ-2dNI;
	Fri, 03 Jan 2025 07:34:37 +0000
X-UUID: 2bac252ac9a511ef82ff63e91e7eb18c-20250103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cMDSCtGjZWJsWp0VLSuytv75YuoxhvMH+zr0NBthYg4=;
	b=KP1iPlWqnO5mgSAAyfLGAG8Xi3QjSIpMirvZuj4k4POPhoy3gstCpR/oYVeHq7XXKgDUEo2pSeHmRCuDRz6m4q2xE14dw/DIomQUPJOt0Puq/SQdhw2NcgnfmZRppQLvp8lpsi0zLBJtrwu0qo2VDUuXIvUAH+D/hlL4ZUPz1+E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:71045bdc-2f01-460a-8946-408503db37c8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:dccc9925-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 2bac252ac9a511ef82ff63e91e7eb18c-20250103
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1796259730; Fri, 03 Jan 2025 00:34:31 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 15:34:28 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 15:34:27 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <ck.hu@mediatek.com>,
	<msp@baylibre.com>, <granquet@baylibre.com>, <dmitry.osipenko@collabora.com>,
	<rex-bc.chen@mediatek.com>, <jitao.shi@mediatek.com>,
	<mac.shen@mediatek.com>, <peng.liu@mediatek.com>,
	<liankun.yang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/1] drm/mediatek: Add return value check when reading DPCD
Date: Fri, 3 Jan 2025 15:33:22 +0800
Message-ID: <20250103073425.28615-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_233436_672056_31E625E7 
X-CRM114-Status: GOOD (  12.69  )
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

Returns the number of bytes transferred (1) on success.
Check the return value to confirm that AUX communication is successful.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
Changes in V4:
- Fix IF judgement condition.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20241218113448.2992-1-liankun.yang@mediatek.com/

Changes in V3:
- Using drm_dp_read_sink_count() to improve patch.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20241128030940.25657-1-liankun.yang@mediatek.com/

Changes in V2:
- Modify Fixes in Commit Message.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240930092000.5385-1-liankun.yang@mediatek.com/
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 36713c176cfc..b8e4e9a6eb78 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2100,7 +2100,6 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 	enum drm_connector_status ret = connector_status_disconnected;
 	bool enabled = mtk_dp->enabled;
-	u8 sink_count = 0;
 
 	if (!mtk_dp->train_info.cable_plugged_in)
 		return ret;
@@ -2115,8 +2114,8 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	 * function, we just need to check the HPD connection to check
 	 * whether we connect to a sink device.
 	 */
-	drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
-	if (DP_GET_SINK_COUNT(sink_count))
+
+	if (drm_dp_read_sink_count(&mtk_dp->aux) > 0)
 		ret = connector_status_connected;
 
 	if (!enabled)
-- 
2.45.2


