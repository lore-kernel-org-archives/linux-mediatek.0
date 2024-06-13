Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F84C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 09:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fj+e1QsKU5Ji35g9aZ9RFH1JnKkoB0lBYUlGTIe+08w=; b=krD6jojUdGZIkS6ZYSaF575byF
	atNLyp4ljyxsiso3mjBKcOg8mvTNpJe3MTgy6Tl6IYRzmEVQ8XowHq4vwT9Y4iH1P7y4oP1HLerAH
	nC3DEjyusJtQLBunJLORm0R30tdwi4sZaJ8wP0E/E8dpZ/YBpcF2YkE59SwxMoSt8IYsNqLsb7CO2
	Mc6FhuDYjUL6XDkx0kjzlmx/YAaVCSz3cmUwc5WFcl074cjBFHHAXd1CUPtVYcPwPUYDAaULMFIf0
	049RShSlIE7+1WD8p5t59buCqLJq2nsZroAg1tIWnKy3gNriPDrOUagfDiJVDjJiRfULn5rVNhgLE
	dXMPnDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHgrV-0000000FzJ6-1Zb0;
	Thu, 13 Jun 2024 09:35:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHgrS-0000000FzHT-2Kzf;
	Thu, 13 Jun 2024 09:35:15 +0000
X-UUID: 399c14a2296811efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Fj+e1QsKU5Ji35g9aZ9RFH1JnKkoB0lBYUlGTIe+08w=;
	b=DZFNhL+Hfyb3gTU2hYEBr1Uzv0i11u1YWZjHOz6LaT/nfLbfVqAm0QUwf8zgbYDkTa8VeRxdS2XOAyD4pwd+NsbEPR22QJIj5+ZFzM/LTXBEn3qY6WgODgILhe3i9C5gbySLoC32d3f8D9rrQNczf4bhemsVeYFFTW18Uwc5Obo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:d6730a9f-e61c-4977-9d3f-e5447f689de1,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:cd120b85-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 399c14a2296811efaf04eb0598667787-20240613
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2018110521; Thu, 13 Jun 2024 02:35:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 17:34:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jun 2024 17:34:02 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 3/3] media: mediatek: vcodec: fix h264 stateless decoder smatch warning
Date: Thu, 13 Jun 2024 17:33:57 +0800
Message-ID: <20240613093357.583-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613093357.583-1-yunfei.dong@mediatek.com>
References: <20240613093357.583-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.129400-8.000000
X-TMASE-MatchedRID: 6efVvalF+Gioft0ZW3r/iTCaEJt46PppPtDsRiRP0d9h2fnHe1cil/Rm
	0kmqtH+DgHpD5xuuxKghg4hY1jreIz1/tvmVhm3Z4RtSDjG+z7An8jQhMLowhTb9TB28UbkiGd2
	282fApofi8zVgXoAltsIJ+4gwXrEtwrbXMGDYqV/ClX+2r3j3WDRT/I/BBHwITHBVEG6vjoTaBw
	jHzSg+qiZNezEAhIbllzt00UpdO3Vn/s7tNNnb98Fx8NfhvvdfIlHoet1GO9L18oxPF4/ixaMnT
	JRI0XInfXwUEm1ouDzLDYxFC1/7rjCBQDy1BJScwL6SxPpr1/I=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.129400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7A535968AABAC5A26AD9AAC417FAEEEE6836C2AA2F6B1234C28B08AD6DD310CB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_023514_613007_241B1D71 
X-CRM114-Status: GOOD (  10.28  )
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

Fix smatch static checker warning for vdec_h264_req_if.c. Leading
to kernel crash when fb is NULL.

Fixes: 06fa5f757dc5 ("media: mtk-vcodec: vdec: support stateless H.264 decoding")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c      | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
index 73d5cef33b2a..1e1b32faac77 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
@@ -347,11 +347,16 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		return vpu_dec_reset(vpu);
 
 	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
+	if (!fb) {
+		mtk_vdec_err(inst->ctx, "fb buffer is NULL");
+		return -ENOMEM;
+	}
+
 	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
 	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
 
-	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
-	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
+	y_fb_dma = fb->base_y.dma_addr;
+	c_fb_dma = fb->base_c.dma_addr;
 
 	mtk_vdec_debug(inst->ctx, "+ [%d] FB y_dma=%llx c_dma=%llx va=%p",
 		       inst->num_nalu, y_fb_dma, c_fb_dma, fb);
-- 
2.18.0


