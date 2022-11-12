Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E99C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Nov 2022 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lENu3a5A9J6wdwuret1odYFBW6/Is27YNxGGEEqEMjQ=; b=Cns1N5waRz4Quq4sUWPY6cR/e7
	JbTpycp6Rkw/u3T96/HXDYevEaBKa8sBceFiYjwy48L2vVEXadTdLPi7Z9VDevbYaBbRd322Q1Pvf
	659Y3KbedEUAvE67QYvKLh+thw6+ICNRvY6MNuzJXY9/R+aEmtY7xObGhbvLfwUoo6fI0tHXwN4tx
	/x9DdnpeMh4KpeTEX+eeRAovcvlIKJ6XYoojEkJc/GYdii9e8n/nGbUnhIEtoRJSN36SncFdhVdZ1
	08gJM8FMYj6K2Os4HLjGQspVFStXAHI3xaKgBvIZeZ0rv8JKOzUfNPplrEU7z9QqCBfuh1SoMbmLM
	Wh8PIjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otnxV-0054Ga-NT; Sat, 12 Nov 2022 10:41:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otnxT-0054FO-Ic; Sat, 12 Nov 2022 10:41:56 +0000
X-UUID: f066390fb2be40c598f840eec159e3f1-20221112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lENu3a5A9J6wdwuret1odYFBW6/Is27YNxGGEEqEMjQ=;
	b=ON/ZeKnv9G5dlXrHM8zRx6cIvZ2WPGTywjpRan1BnKie02/KYfd33q7KcV63GzLuA5SXwXSjVF7jHdFouJomEvQ/BrA/7RtPBlG/UtwPUgp7ZV4hQkrSWphfAOuTJDntl70b8PFZWptyYT606ES3ablyAD+R0/lI8NKoVgAn7Vg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:ae3f5e3a-01fc-4c54-a7aa-555d54f2bb35,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:b1875b5d-100c-4555-952b-a62c895efded,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f066390fb2be40c598f840eec159e3f1-20221112
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1746691216; Sat, 12 Nov 2022 03:41:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 12 Nov 2022 17:41:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 12 Nov 2022 17:41:46 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, George Sun <george.sun@mediatek.com>, Xiaoyong Lu
	<xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho
	<stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 1/5] media: mediatek: vcodec: Fix getting NULL pointer for dst buffer
Date: Sat, 12 Nov 2022 17:41:40 +0800
Message-ID: <20221112094144.4256-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221112094144.4256-1-yunfei.dong@mediatek.com>
References: <20221112094144.4256-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_024155_644485_114475E8 
X-CRM114-Status: GOOD (  10.91  )
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

The driver may can't get v4l2 buffer when lat or core decode timeout,
will lead to crash when call v4l2_m2m_buf_done to set dst buffer
(NULL pointer) done.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/mtk_vcodec_dec_stateless.c        | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index c45bd2599bb2..e86809052a9f 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -138,10 +138,13 @@ static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_ctx *ctx, int error
 		state = VB2_BUF_STATE_DONE;
 
 	vb2_dst = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
-	v4l2_m2m_buf_done(vb2_dst, state);
-
-	mtk_v4l2_debug(2, "free frame buffer id:%d to done list",
-		       vb2_dst->vb2_buf.index);
+	if (vb2_dst) {
+		v4l2_m2m_buf_done(vb2_dst, state);
+		mtk_v4l2_debug(2, "free frame buffer id:%d to done list",
+			       vb2_dst->vb2_buf.index);
+	} else {
+		mtk_v4l2_err("dst buffer is NULL");
+	}
 
 	if (src_buf_req)
 		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
-- 
2.18.0


