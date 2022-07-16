Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53D1C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 10:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gX4ADV+gNYWmG6XkHjoggjbzVYlgFdcp3C4XInkn5A=; b=Xn6vbV4BDfESdPf2R/uK8bJ2N4
	Qa0jf0WwI7RBHKxAnDMGW0ztr66Bc4D2fImmL04GtUxak5EArTDf3g1uHo/jUGnDzy9awNcp3kldB
	SBsEeCsAIGFkE3h4QG4oCd14JCLwVnxjKuJ2jTzPZsNvnvwpBPs/b/kQ/0HxuQ8QHEuOTNGEuU7Gw
	npd8JRssrTjRPhGsjUQEGqK0+f03IgIOMwS1Vd7GOdJOzVbF0L4gXcPh/+oKzZw2/Fm/WpZzL6OOY
	+eTTecJ+i2Ta2/fVppK/Ou72cR64wiOjsAVm4xYXxpoaLhELIarWDqlEi4tIgWp+xB105BTIyu5LR
	cGBnJF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCegm-00FFnK-Qu; Sat, 16 Jul 2022 10:06:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCegT-00FFdG-0d; Sat, 16 Jul 2022 10:06:04 +0000
X-UUID: bfe06f9ea608436ab3b9053833868e95-20220716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:739560ce-5b41-48bb-a835-e63be8d909b6,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:9cca7464-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: bfe06f9ea608436ab3b9053833868e95-20220716
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 785561042; Sat, 16 Jul 2022 03:05:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sat, 16 Jul 2022 17:34:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sat, 16 Jul 2022 17:34:44 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>, kyrie wu <kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
	<srv_heupstream@mediatek.com>, irui wang <irui.wang@mediatek.com>
Subject: [V11,7/7] mtk-jpegenc: add stop cmd interface for jpgenc
Date: Sat, 16 Jul 2022 17:34:35 +0800
Message-ID: <20220716093435.29796-8-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220716093435.29796-1-irui.wang@mediatek.com>
References: <20220716093435.29796-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_030601_118872_C5D32072 
X-CRM114-Status: GOOD (  10.86  )
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
Signed-off-by: irui wang <irui.wang@mediatek.com>

---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 510abe0f84f1..386d48cc4f59 100644
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
@@ -1389,6 +1392,7 @@ static int mtk_jpeg_open(struct file *file)
 	} else {
 		v4l2_ctrl_handler_init(&ctx->ctrl_hdl, 0);
 	}
+
 	mtk_jpeg_set_default_params(ctx);
 	mutex_unlock(&jpeg->lock);
 	return 0;
-- 
2.18.0


