Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B106C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAR9ceNc//mA5cmLDkfFT7PplGN2wFwq9Wd/wjFC8pg=; b=DukhKIPsAO978msXWD/ZW0BSD8
	HZb0zsjdT3cRHOMkq4B6DrqC3emNoEyoRwiB6MofIoD9MDG1ysHyJIydXRhAY+ba+lWhQKmurpucS
	hoE2SEnMPM12Oh0f0TIVCTGS6uyd8J1LsA6lZASrMcCcn9mi5tsqt1xlO1NPVMi8vheRZ+a50kMF5
	nuYMRDxgPo9L4fa4F4C1/Zz+H3mvNlQONPt63mgc+OGGcVtpYYeyukMR+JBUTv+zqNgjD/Yp6BHn1
	QupfFkbMpvvRsqK7WIARXgaPl+Pftf1rFxxB3gHRMSih4DYB3hTMXBAW+QHL+7qeSlzHYwTbrBKwD
	YvOsZtcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0HR-008PoD-U9; Mon, 06 Feb 2023 12:07:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0HN-008Pj3-WB; Mon, 06 Feb 2023 12:07:28 +0000
X-UUID: cda1a350a61611eda08d4d6090ec5a5c-20230206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PAR9ceNc//mA5cmLDkfFT7PplGN2wFwq9Wd/wjFC8pg=;
	b=jTR6uO4TijWOnQZzNfft1sn5fiNMJ3pS67gWViZxa/LoNiLUWkhBoCQ08KKMrQu/ArVqoPbtO8jz2PBdDNVoVjT3uMwdvoFSsksPA+RttsyTR/GYtiOtkxg2QQ9crvQ+fL8HsjbrpRVjdVfdLhN8nXzaPe3OAscFhpKYLCXimvo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:3d2b73b5-878f-4b65-8045-2b31eae67d1e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:885ddb2,CLOUDID:9f647356-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: cda1a350a61611eda08d4d6090ec5a5c-20230206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1956926659; Mon, 06 Feb 2023 05:07:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 6 Feb 2023 20:07:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 6 Feb 2023 20:07:15 +0800
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
Subject: [PATCH 6/6] media: mediatek: vcodec: Add encode to support dbgfs
Date: Mon, 6 Feb 2023 20:07:08 +0800
Message-ID: <20230206120708.19631-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206120708.19631-1-yunfei.dong@mediatek.com>
References: <20230206120708.19631-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_040726_057449_ADF6CA14 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

Add encode to support dbgfs.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
index 9095186d5495..94703c66da74 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
@@ -353,6 +353,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_enc_reg;
 	}
 
+	mtk_vcodec_dbgfs_init(dev, false);
 	mtk_v4l2_debug(0, "encoder %d registered as /dev/video%d",
 		       dev->venc_pdata->core_id, vfd_enc->num);
 
@@ -463,6 +464,7 @@ static int mtk_vcodec_enc_remove(struct platform_device *pdev)
 	if (dev->vfd_enc)
 		video_unregister_device(dev->vfd_enc);
 
+	mtk_vcodec_dbgfs_deinit(dev);
 	v4l2_device_unregister(&dev->v4l2_dev);
 	pm_runtime_disable(dev->pm.dev);
 	mtk_vcodec_fw_release(dev->fw_handler);
-- 
2.18.0


