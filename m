Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54486C19F21
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 05:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPqKI0Rrptc3CrApeJpiZjs8AxnfNcpd2cY1vhKhtwg=; b=fxYfMTIFHEIW+ptlL8aSCwRAxF
	VIVIKXXlK1+uOQT1sYl+ZxJS3cC79xRp+BzFYO3Bc9OL4psXSrXf0Msfsu9+d7yPEv8qMTgtYPqP3
	Sdjae65qzsTFD2be1RNmOjNi/HLUmUQkvI0u0BarTJ1YSgW6fjFE126I/Mu5azbiJNgzzkdpT8heb
	vNo1M4WTnV6AdqVM3Je1Qi5FCEmNXKuKJSTsFnTzYiKOWm4DU50fFstryyVIG/jHkGzX8nGsN4Uos
	xVgyWtyBJ0gBPH4bCZEK6Tw9rp8eTNgBR09xtn5oprrAScN6FAA3ZrnawwUb3I8pqj+nd3zcKdabw
	QTBACc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGZBC-009BVf-9G; Wed, 27 Jul 2022 05:01:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGZB9-009BQl-QR; Wed, 27 Jul 2022 05:01:53 +0000
X-UUID: 6e56c2907d7841a497311132fc788317-20220726
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:cb7fb628-da6c-4da7-a57e-4a73ea4a2965,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:6a65eacb-7c9b-4dbc-a9d4-00659d6b7a90,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 6e56c2907d7841a497311132fc788317-20220726
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 958415193; Tue, 26 Jul 2022 22:01:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 27 Jul 2022 12:50:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 27 Jul 2022 12:50:39 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
	<deller@gmx.de>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v15 07/11] drm/mediatek: Add retry to prevent misjudgment for sink devices
Date: Wed, 27 Jul 2022 12:50:31 +0800
Message-ID: <20220727045035.32225-8-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_220151_871997_20A7562A 
X-CRM114-Status: GOOD (  15.85  )
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

For some DP dungles, we need to train more than onece to confirm that we
don't misjudge the status of sink device.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index ce817cb59445..80d7d6488105 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -42,6 +42,7 @@
 #define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
 #define MTK_DP_TBC_BUF_READ_START_ADDR 0x08
 #define MTK_DP_TRAIN_DOWNSCALE_RETRY 8
+#define MTK_DP_TRAIN_CLEAR_RETRY 50
 
 struct mtk_dp_train_info {
 	bool tps3;
@@ -1431,11 +1432,25 @@ static int mtk_dp_video_config(struct mtk_dp *mtk_dp)
 
 static int mtk_dp_training(struct mtk_dp *mtk_dp)
 {
+	short max_retry = MTK_DP_TRAIN_CLEAR_RETRY;
 	int ret;
 
-	ret = mtk_dp_train_start(mtk_dp);
-	if (ret)
-		return ret;
+	/*
+	 * We do retry to confirm that we don't misjudge the sink status.
+	 * If it is still failed, we can confirm there are some issues for the
+	 * sink device.
+	 */
+	do {
+		ret = mtk_dp_train_start(mtk_dp);
+		if (!ret)
+			break;
+	} while (--max_retry);
+
+	dev_info(mtk_dp->dev, "dp training clear retry times: %d\n",
+		 MTK_DP_TRAIN_CLEAR_RETRY - max_retry);
+
+	if (!max_retry)
+		return -ETIMEDOUT;
 
 	ret = mtk_dp_video_config(mtk_dp);
 	if (ret)
-- 
2.18.0


