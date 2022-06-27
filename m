Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8901C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 03:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRU7mneva3MEPw42pJjeyu23K6vLvfNfOJ3HVwNFNB8=; b=svVNFqFLmkH86e5r1vYw3Lgquk
	8jcdBrEb9iE/idi5PZjBCIRXBv56mLY7I7/Z5OOOUsri0VPV2nXnryYj4Yxs9PrvlnFNY5KC9JYtj
	rAZkDWgfYmTJQJgH+2xjip9BfZeDlnXIILSGwwsjft2IGimq9/hYjui2vrSUMgqFdRSSABo9CR+mT
	HgMViWN5uwxQ1aoa0CZOgbvnMPiVF7oU7Y7alJEC8pY26sF/auB0/5YvJ7zMM5wUrTO5Ti77iPUqA
	kl24DxGVpIWkvM3LWOQB7tqlq24TMPwVuix/+W9L8QqJNJiS0GqWQExAC7NMkNW/QAqE/xZI0WikR
	RCyLk1cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5f43-00EuYx-DL; Mon, 27 Jun 2022 03:05:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5f0n-00EsVo-Dc; Mon, 27 Jun 2022 03:02:06 +0000
X-UUID: b6dd8947fc494434909767d907af6612-20220626
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:9c516213-45a6-400c-ba56-8469c8655e8e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:a2bb90ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b6dd8947fc494434909767d907af6612-20220626
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1560576168; Sun, 26 Jun 2022 20:01:58 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Jun 2022 19:56:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 27 Jun 2022 10:56:34 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jun 2022 10:56:33 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [V10,7/7] mtk-jpegenc: add stop cmd interface for jpgenc
Date: Mon, 27 Jun 2022 10:56:25 +0800
Message-ID: <20220627025625.8956-8-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627025625.8956-1-irui.wang@mediatek.com>
References: <20220627025625.8956-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_200205_489228_9F6450D9 
X-CRM114-Status: GOOD (  10.78  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

Add stop cmd interface for jpgenc to stop stream

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 24e3e69baec8..2696651b457b 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -612,6 +612,9 @@ static const struct v4l2_ioctl_ops mtk_jpeg_enc_ioctl_ops = {
 	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
 
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+
+	.vidioc_encoder_cmd		= v4l2_m2m_ioctl_encoder_cmd,
+	.vidioc_try_encoder_cmd		= v4l2_m2m_ioctl_try_encoder_cmd,
 };
 
 static const struct v4l2_ioctl_ops mtk_jpeg_dec_ioctl_ops = {
@@ -1381,6 +1384,7 @@ static int mtk_jpeg_open(struct file *file)
 	} else {
 		v4l2_ctrl_handler_init(&ctx->ctrl_hdl, 0);
 	}
+
 	mtk_jpeg_set_default_params(ctx);
 	mutex_unlock(&jpeg->lock);
 	return 0;
-- 
2.18.0


