Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA1BCF649D
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 09:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yqgHKnptu5bK43gGLrnEqqpfwTrlY1ULN7Za2e2rfGM=; b=UkupdOGjlm9IUQH+cm28DM4z6b
	db0c7XThjeBnjpvawehqe+6ONxiM6eEF4J+AXTq6VZhd1o6Q+tI22P1YpOoHmIQI4OY+9rC9OMbzZ
	shd+WWYqRpiF4ImCxs6C+uHGYqHUPJl0QKkH/t051QD5zlH8r0luCfKB08EXY9HntpvRYFkbPhTZ1
	i60pRZg71/+GmqnizktY5apqfs2MyUS6F9kmNYyf+3e+CJ23srBHYkOliD+846hi4nxpS42JvUDqU
	Cjt7zun5xHuSt5fnkFsmHkNuEm7TivS5hq25Lw0hgH6fW6pHdZi8cxeWggSLlQumUdMEtR0TtSTyk
	PFjBpalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svCge-0000000GW8s-2xEN;
	Mon, 30 Sep 2024 09:27:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCZf-0000000GUEV-1ycp;
	Mon, 30 Sep 2024 09:20:12 +0000
X-UUID: 2e7899387f0d11efba0aef63c0775dbf-20240930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yqgHKnptu5bK43gGLrnEqqpfwTrlY1ULN7Za2e2rfGM=;
	b=anWrLSmYD1+3k4rZ20foGTgJzeg6I44Xk67A341xP3ORVfqRKoi8pGVGkxWaURuSVjuekGi6Z0EUyNn+KXIZ09mhSpR63EfBAJBf+rKr5nKi7Uezx0YUJx62hqUNx5SWlNo4OsuGdOrcbe1LkOn3n3qydIk+UcIm7JxT08CJIHo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:e4ec411c-d2e9-4226-9037-edc61dcb945e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:8cbcc89e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2e7899387f0d11efba0aef63c0775dbf-20240930
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1650050316; Mon, 30 Sep 2024 02:20:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Sep 2024 17:20:03 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Sep 2024 17:20:02 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <msp@baylibre.com>,
	<rex-bc.chen@mediatek.com>, <dmitry.osipenko@collabora.com>,
	<ck.hu@mediatek.com>, <jitao.shi@mediatek.com>, <mac.shen@mediatek.com>,
	<peng.liu@mediatek.com>, <liankun.yang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 1/1] drm/mediatek: Add return value check when reading DPCD
Date: Mon, 30 Sep 2024 17:17:41 +0800
Message-ID: <20240930092000.5385-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_022011_551265_0AA66251 
X-CRM114-Status: GOOD (  12.93  )
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
 drivers/gpu/drm/mediatek/mtk_dp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index d8796a904eca..3cab65345d1e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2018,6 +2018,7 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	enum drm_connector_status ret = connector_status_disconnected;
 	bool enabled = mtk_dp->enabled;
 	u8 sink_count = 0;
+	size_t value;
 
 	if (!mtk_dp->train_info.cable_plugged_in)
 		return ret;
@@ -2032,7 +2033,12 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	 * function, we just need to check the HPD connection to check
 	 * whether we connect to a sink device.
 	 */
-	drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
+	value = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
+	if (value < 0) {
+		drm_err(mtk_dp->drm_dev, "Failed to read DP Sink Count: %zd\n", value);
+		return ret;
+	}
+
 	if (DP_GET_SINK_COUNT(sink_count))
 		ret = connector_status_connected;
 
-- 
2.45.2


