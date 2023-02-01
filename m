Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA32C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 07:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iGDkFl5JqVQjjGy2SvcMkXm0cL0smb4pzYZQiFbmEg=; b=HxDNTnkPKEyVU4qhtZhzAwvxu7
	lSLGP7XtnZPm4yGb02oWiAlpY83OugMklvqQj6nHKNc04DIr4tyGRPUS5YFU4DqFy61HqOmRhqCl1
	L1GBDFyQYGKbRPugFDahR887v2MXeoRl8dDQQIdsEOWe9PKCjL9us5yhV6yANrhqMD6FlP3exR7qH
	FpUDKxVPDPWDqvv5VPjqm1LJnTTUrTduzh8h/TLEPQcs+0C8ymF7Bl9mVAxDirzUuMUWj0htdHFSZ
	E635mF1+BVyONtai4qvbdRRA07HhkbBaZQp2XGRSTTpUFxcVWgQYsOyZpXrfg6pMiDn0SE6g3aVpm
	CIEQzqEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7d6-00Ac12-7w; Wed, 01 Feb 2023 07:34:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7d3-00Abyz-8B; Wed, 01 Feb 2023 07:34:02 +0000
X-UUID: c85fd69aa20211edbbe3f76fe852e059-20230201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1iGDkFl5JqVQjjGy2SvcMkXm0cL0smb4pzYZQiFbmEg=;
	b=iOJ06AULMKTzoQunOZ18fOWboHJBw943zcWcsxBpeySpMAeM+KWQmfFf5nu2J+C9lAvv193582bsqKqkvIEcbRhgGu6bMeoLLQMiRmLjURuxkHxVfla3THi0/7M8IA8g6P1UMqDR7XrZc0y/peZIio+xFOuISR9Bo3aJDVnUkTE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:ba0b3be9-45c8-47c7-9b8e-cdf19a0b9975,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:1cab1ef7-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: c85fd69aa20211edbbe3f76fe852e059-20230201
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1147461400; Wed, 01 Feb 2023 00:33:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 1 Feb 2023 15:33:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 1 Feb 2023 15:33:23 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho
	<stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,5/7] media: mediatek: vcodec: remove unused lat_buf
Date: Wed, 1 Feb 2023 15:33:14 +0800
Message-ID: <20230201073316.27923-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201073316.27923-1-yunfei.dong@mediatek.com>
References: <20230201073316.27923-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_233401_307101_D2B6389E 
X-CRM114-Status: GOOD (  11.69  )
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

Remove unused lat_buf from core list, or leading to core list access
NULL point.

Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mediatek/vcodec/vdec_msg_queue.c  | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index ce7c82e38103..cdc539a46cb9 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
@@ -177,7 +177,7 @@ bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
 	struct vdec_lat_buf *buf, *tmp;
 	struct list_head *list_core[3];
 	struct vdec_msg_queue_ctx *core_ctx;
-	int ret, i, in_core_count = 0;
+	int ret, i, in_core_count = 0, count = 0;
 	long timeout_jiff;
 
 	core_ctx = &msg_queue->ctx->dev->msg_queue_core_ctx;
@@ -204,8 +204,20 @@ bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
 			       msg_queue->lat_ctx.ready_num);
 		return true;
 	}
-	mtk_v4l2_err("failed with lat buf isn't full: %d",
-		     msg_queue->lat_ctx.ready_num);
+
+	spin_lock(&core_ctx->ready_lock);
+	list_for_each_entry_safe(buf, tmp, &core_ctx->ready_queue, core_list) {
+		if (buf && buf->ctx == msg_queue->ctx) {
+			count++;
+			list_del(&buf->core_list);
+		}
+	}
+	spin_unlock(&core_ctx->ready_lock);
+
+	mtk_v4l2_err("failed with lat buf isn't full: list(%d %d) count:%d",
+		     atomic_read(&msg_queue->lat_list_cnt),
+		     atomic_read(&msg_queue->core_list_cnt), count);
+
 	return false;
 }
 
-- 
2.18.0


