Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3A9C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztddfO3HpzzX7jMv99ap2IqMNrkjflAF85r48IEZWKU=; b=opiwW/maj2LMrsvpPz+h0m9u95
	qA+lErbDL3AoxJAKkyRTl4d1ViauM4Op54HrHYbjQD45JpntB3YfV74R+XrPaaK4yjphjEsqXVEtt
	jVSf2Z+xyUF1lRZtfaG0twvmzCda7ZdyEgvsMiMUlK7ksWXz9mZ6HtNL+s6MwjYbpbwDvxj6ppmA9
	Yl0s5yrOvqsQj7uQrYQJC91V1R5DIj7OsISUyyhU3vol4hZpK+JE77/074izdFeTT1zfHraMwuTPu
	RVkYNEjKk6oL3rSCDPGg0k2v9+JW67BmixudKwEtB8gQIlEmV1g+eqzXQtxlWaJRJaYi5JLN+TY8J
	wKBqqyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovbXX-00CGAK-Fk; Thu, 17 Nov 2022 09:50:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovbIa-00C8i7-Rn; Thu, 17 Nov 2022 09:35:10 +0000
X-UUID: 56481d4c53be4d01b665fffd945d296c-20221117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ztddfO3HpzzX7jMv99ap2IqMNrkjflAF85r48IEZWKU=;
	b=sPaIxISqZE9f7omtmM/9wDwL5S8algZJxoK8GKbEG2AOmDzlviQX+r+yu9t2BlQeTK9ABYO6X8dfjV0RY4aUY4OknLUnGZ/XDG/NJZTjKPEBvxFEs4NxjWNuwELlMyI6x9/j9ZP6TEKy0eDMXVuS5B74OY7whvnHqj072Jtp5Pw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:c57cf1c9-f6b9-4468-8b60-8032cde5b15c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:62cd327,CLOUDID:7dc988f8-3a34-4838-abcf-dfedf9dd068e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 56481d4c53be4d01b665fffd945d296c-20221117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1318535400; Thu, 17 Nov 2022 02:35:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 17 Nov 2022 17:25:00 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 17 Nov 2022 17:24:59 +0800
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
Subject: [PATCH v2,4/5] media: mediatek: vcodec: Setting lat buf to lat_list when lat decode error
Date: Thu, 17 Nov 2022 17:24:52 +0800
Message-ID: <20221117092453.31366-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117092453.31366-1-yunfei.dong@mediatek.com>
References: <20221117092453.31366-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_013508_935982_8DED65CB 
X-CRM114-Status: GOOD (  12.10  )
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

Need to set lat buf to lat_list when lat decode error, or lat buffer will lost.

Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9 decoding")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c    | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
index fb1c36a3592d..cbb6728b8a40 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
@@ -2073,21 +2073,23 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		return -EBUSY;
 	}
 	pfc = (struct vdec_vp9_slice_pfc *)lat_buf->private_data;
-	if (!pfc)
-		return -EINVAL;
+	if (!pfc) {
+		ret = -EINVAL;
+		goto err_free_fb_out;
+	}
 	vsi = &pfc->vsi;
 
 	ret = vdec_vp9_slice_setup_lat(instance, bs, lat_buf, pfc);
 	if (ret) {
 		mtk_vcodec_err(instance, "Failed to setup VP9 lat ret %d\n", ret);
-		return ret;
+		goto err_free_fb_out;
 	}
 	vdec_vp9_slice_vsi_to_remote(vsi, instance->vsi);
 
 	ret = vpu_dec_start(&instance->vpu, NULL, 0);
 	if (ret) {
 		mtk_vcodec_err(instance, "Failed to dec VP9 ret %d\n", ret);
-		return ret;
+		goto err_free_fb_out;
 	}
 
 	if (instance->irq) {
@@ -2107,7 +2109,7 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	/* LAT trans full, no more UBE or decode timeout */
 	if (ret) {
 		mtk_vcodec_err(instance, "VP9 decode error: %d\n", ret);
-		return ret;
+		goto err_free_fb_out;
 	}
 
 	mtk_vcodec_debug(instance, "lat dma addr: 0x%lx 0x%lx\n",
@@ -2120,6 +2122,9 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
 
 	return 0;
+err_free_fb_out:
+	vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
+	return ret;
 }
 
 static int vdec_vp9_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
-- 
2.18.0


