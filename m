Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57950C761AF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 05:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GuFyUqiRXL44E8YjExaFkqLJRCHMgFArBeHbkEw/w8=; b=xPwsQ/EaqM/zJhWdyIS+jwjkXO
	i7KC+Q6wCugjOj3Th/un2shpDShWNjzVqCWv2nKFQp3rAIJEHmnwQ4YCkBKq9zuK4QOOkdHp5ZYSu
	rLKWfeiVPnAGS3i2saER1+bSQn6/lanM4z0WncJzIU2hkYXkDyrNSH8sIb7Ayi1yIn9Tmm2Exeatr
	6jQM+IhpHWmF/DmwLvcRpmNIRTHSs+N7eNo9fq2Vh+6bkHA/R/Do2XlA7kWV4rgtBWXF3NSRTfvbI
	6YUvOuVzg2mZ+pkk8L/O/8aSm94T8QbXMgTgwrqE1LXJ/JF2A+LRU0V9PV73xYAVxhltfd9qcqMFk
	DK0mQqSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgfnz-009rj2-0o;
	Mon, 27 Mar 2023 05:54:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgfnv-009reO-05;
	Mon, 27 Mar 2023 05:54:04 +0000
X-UUID: c4ef8b28cc6311edb7d8d11f642b8e78-20230326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2GuFyUqiRXL44E8YjExaFkqLJRCHMgFArBeHbkEw/w8=;
	b=BGKMiLkowhtO5vezsy308ryaFV4xlOYiheFY1CbvJctcm79QUmvrV6sGK98PW9mjp+vnNZuZFV1enl5b64+EdcNSc64naAvfsXB2DcHjukdOKLbFabfsus4xzMYWivjkHWuTN/g4vdXJt4VPNXHvB/b77myDrUKDCh1mtVerUks=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:e18991e2-f712-4e20-b33e-5ec202a53cfc,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:c14603f7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: c4ef8b28cc6311edb7d8d11f642b8e78-20230326
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2052054889; Sun, 26 Mar 2023 22:53:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 27 Mar 2023 13:53:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 27 Mar 2023 13:53:33 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3,6/7] media: mediatek: vcodec: Change dbgfs interface to support encode
Date: Mon, 27 Mar 2023 13:53:14 +0800
Message-ID: <20230327055315.13936-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327055315.13936-1-yunfei.dong@mediatek.com>
References: <20230327055315.13936-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_225403_069801_934E9AD3 
X-CRM114-Status: GOOD (  12.94  )
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

Extend dbgfs init interface to support encode and create encode
dbgfs file.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c    | 9 +++++++--
 .../media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h    | 4 ++--
 .../media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c  | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
index 1b1b4301a83d..4f6d0a4af651 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
@@ -160,11 +160,14 @@ void mtk_vcodec_dbgfs_remove(struct mtk_vcodec_dev *vcodec_dev, int ctx_id)
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dbgfs_remove);
 
-void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev)
+void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev, bool is_encode)
 {
 	struct dentry *vcodec_root;
 
-	vcodec_dev->dbgfs.vcodec_root = debugfs_create_dir("vcodec-dec", NULL);
+	if (is_encode)
+		vcodec_dev->dbgfs.vcodec_root = debugfs_create_dir("vcodec-enc", NULL);
+	else
+		vcodec_dev->dbgfs.vcodec_root = debugfs_create_dir("vcodec-dec", NULL);
 	if (IS_ERR(vcodec_dev->dbgfs.vcodec_root))
 		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%d\n",
 			IS_ERR(vcodec_dev->dbgfs.vcodec_root));
@@ -174,6 +177,8 @@ void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev)
 	debugfs_create_x32("mtk_vcodec_dbg", 0644, vcodec_root, &mtk_vcodec_dbg);
 
 	vcodec_dev->dbgfs.inst_count = 0;
+	if (is_encode)
+		return;
 
 	INIT_LIST_HEAD(&vcodec_dev->dbgfs.dbgfs_head);
 	debugfs_create_file("vdec", 0200, vcodec_root, vcodec_dev, &vdec_fops);
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
index b0bdb84a46df..ba43518d0fcb 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
@@ -50,7 +50,7 @@ struct mtk_vcodec_dbgfs {
 #if defined(CONFIG_DEBUG_FS)
 void mtk_vcodec_dbgfs_create(struct mtk_vcodec_ctx *ctx);
 void mtk_vcodec_dbgfs_remove(struct mtk_vcodec_dev *vcodec_dev, int ctx_id);
-void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev);
+void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev, bool is_encode);
 void mtk_vcodec_dbgfs_deinit(struct mtk_vcodec_dev *vcodec_dev);
 #else
 static inline void mtk_vcodec_dbgfs_create(struct mtk_vcodec_ctx *ctx)
@@ -61,7 +61,7 @@ static inline void mtk_vcodec_dbgfs_remove(struct mtk_vcodec_dev *vcodec_dev, in
 {
 }
 
-static inline void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev)
+static inline void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev, bool is_encode)
 {
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index 8c2443a18f5e..bba7b932f4fa 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -433,7 +433,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		mtk_v4l2_debug(0, "media registered as /dev/media%d", vfd_dec->minor);
 	}
 
-	mtk_vcodec_dbgfs_init(dev);
+	mtk_vcodec_dbgfs_init(dev, false);
 	mtk_v4l2_debug(0, "decoder registered as /dev/video%d", vfd_dec->minor);
 
 	return 0;
-- 
2.18.0


