Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD865C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NN+Q3q0BxDoQb6X55VzHKi6+M4es95yNcRRxFvvxYg8=; b=t/bttu81VH94+sf44Ts8q0u/QC
	7ZFJLI6Bkuxalyfgh+Qk23m27BgpEeH8IENbXZyAnDLXPg4d23AL7bJufkqxyj608voB7Db+NYh7g
	V6eN9RHigDu3gXfjabW9DPeXvwgNIyUPIDgkkaY5hXtLZY0V/Tw9+HBRZJtiPEkD9QKj0aB/kjVbe
	WLFmZdy9uIOBIkmzH+/5CX6A+hLD5tk+AYSftk5VLgDn1oPTDhprL6KPs50W8fg4eTe+rsKeC+Wjv
	EbcyzdxCGVs4zlM+EJcnQMxao6NBzPTV3BldKdR1DxZYAFQLzxBwQCeFInFJVXwpJ+XZziSMOFKjh
	A6zAnopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pev3c-00FVJz-1u;
	Wed, 22 Mar 2023 09:47:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pev3Z-00FVII-2B;
	Wed, 22 Mar 2023 09:46:59 +0000
X-UUID: 7bde64dec89611ed8687db9d93187ff1-20230322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NN+Q3q0BxDoQb6X55VzHKi6+M4es95yNcRRxFvvxYg8=;
	b=pO+WauDQei2FV8u+dh8hKSi3E40mjmWRP31PVTPpiu8lVPZ+pI+AzaM0D8828Hfw4OhIKdFwemibOmGx45WfyT2uUVBOqUwRC8683a0/nLaGetX0HQYpM4TGXdWZNfiLFb4RS1lib60uNzjUXA9ufYjOO2BfKDEf1bxatq0zVr0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:9a5ec77e-0ef7-4921-a518-3599f527d52d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.22,REQID:9a5ec77e-0ef7-4921-a518-3599f527d52d,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:120426c,CLOUDID:ef1993f6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230322174628CBGUXQ3U,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 7bde64dec89611ed8687db9d93187ff1-20230322
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1302205496; Wed, 22 Mar 2023 02:46:56 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 22 Mar 2023 17:46:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 22 Mar 2023 17:46:25 +0800
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
Subject: [PATCH v2,6/7] media: mediatek: vcodec: Change dbgfs interface to support encode
Date: Wed, 22 Mar 2023 17:46:16 +0800
Message-ID: <20230322094617.19410-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322094617.19410-1-yunfei.dong@mediatek.com>
References: <20230322094617.19410-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_024657_735414_CA7F65AD 
X-CRM114-Status: GOOD (  14.60  )
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
index 9e586889717b..f4d6afff64f3 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
@@ -51,7 +51,7 @@ struct mtk_vcodec_dbgfs {
 #if defined(CONFIG_DEBUG_FS)
 void mtk_vcodec_dbgfs_create(struct mtk_vcodec_ctx *ctx);
 void mtk_vcodec_dbgfs_remove(struct mtk_vcodec_dev *vcodec_dev, int ctx_id);
-void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev);
+void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev, bool is_encode);
 void mtk_vcodec_dbgfs_deinit(struct mtk_vcodec_dev *vcodec_dev);
 #else
 static inline void mtk_vcodec_dbgfs_create(struct mtk_vcodec_ctx *ctx)
@@ -62,7 +62,7 @@ static inline void mtk_vcodec_dbgfs_remove(struct mtk_vcodec_dev *vcodec_dev, in
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


