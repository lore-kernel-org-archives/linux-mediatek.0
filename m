Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2A2C7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 06:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rATucrsos2tqGiaE1yHomrRoPA5q3yHw7OeBD65YDf0=; b=qG1NbqCjh+OZQ5bETnj7w1GvMz
	9QacUdmi1CUb9mewGz8QyMG1CNOzGC8cUV2y5j7y7VGXu6ZRI0/ZktRTqHJK5Eheq4CUykUwk3Io3
	ivdLVGvMtchfDnsA8AS1eEmFEbq0q1pAmZmCleSO718Lre15l5D0xEFY3kI0XiruW4596F+IkPlzL
	t/73If9mabzBgZW99zYjx9G5/U9SyjbKNiEmy7ZAXtIppIGz2PULnnPM5b+PlsEBts38Vy2Zmw6kv
	a59RpnGlFP3VlJfnVnODJN0oUp1TgZxsy5MvVXhx4BKBJJLQvyUqLupfFMLsPdRMpsujXf8ts8v4i
	zur11F9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm78E-00GXI2-1L;
	Tue, 11 Apr 2023 06:05:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm78B-00GXHN-2g;
	Tue, 11 Apr 2023 06:05:29 +0000
X-UUID: d7fb5036d82e11ed8687db9d93187ff1-20230410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rATucrsos2tqGiaE1yHomrRoPA5q3yHw7OeBD65YDf0=;
	b=ALlxPA9/Bzk/lPL2MP9TvN1qLCAdFlgH2pbirvxabfgqk8z+OifZv7M6fHMqvdz3tsVssdL5Z20sOMKtFIMR6+s9Uc81hjH7QoZ/Uf7VFes41XiP3ebhJ9wnZA/ek+BPh+8Y8d+4/w22baVDUEAD7Glk2J8B+dsCj29GyrfdxXY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:3f0fe4f5-f43a-4a31-989d-91b8595cfeab,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:88338dea-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: d7fb5036d82e11ed8687db9d93187ff1-20230410
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1887558338; Mon, 10 Apr 2023 23:05:22 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 11 Apr 2023 13:54:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 11 Apr 2023 13:54:16 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<maoguang.meng@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Irui
 Wang" <irui.wang@mediatek.com>
Subject: [PATCH v2, 2/2] media: mediatek: vcodec: make sure pointer isn't NULL before used
Date: Tue, 11 Apr 2023 13:54:13 +0800
Message-ID: <20230411055413.539-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411055413.539-1-irui.wang@mediatek.com>
References: <20230411055413.539-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_230527_879762_F2E06129 
X-CRM114-Status: GOOD (  11.87  )
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

CERT-C Expression check:
Dereferencing buf, which is known to be NULL, check buf is not NULL
before used.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index d65800a3b89d..db65e77bd373 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -943,7 +943,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 		 * FIXME: This check is not needed as only active buffers
 		 * can be marked as done.
 		 */
-		if (buf->state == VB2_BUF_STATE_ACTIVE) {
+		if (buf && buf->state == VB2_BUF_STATE_ACTIVE) {
 			mtk_v4l2_debug(0, "[%d] id=%d, type=%d, %d -> VB2_BUF_STATE_QUEUED",
 					ctx->id, i, q->type,
 					(int)buf->state);
-- 
2.18.0


