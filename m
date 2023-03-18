Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0B3C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Mar 2023 03:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w7qxzHJ9OUqVOD3dN5cCe1joMzyhA01hfu1aWr/0RaU=; b=bgT5OkYBRTufEmaUmuiO3fjSbI
	wNPebfo906rwi4nze7N04SoGu04RTj49GQydj71TMREXdI8JMFMDC4V5t/kLh94f2N94tRyUCaB8M
	snypB7CBoOWtF+c1KDYJ10ktYsc6dB8XtLWTYwU9M6BeZgg4gz9KnuTpg22Wd7TNOpxLRN7AmREoX
	f2iZmsRYdZQRjxrA904H8a7x+WnUkCzELn7KDSP1XkKDpMrR0tf7MElqPHSMkXB9Q+7ulimREh+Xw
	aVYLaGvlu+lQ++o9jy5GoyckY8In8eKZ6yigQNFhlXronpKWm+TCNRfNQ33aiG2eStUywqwe9H3lO
	fVTjYhEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdNgn-00439A-18;
	Sat, 18 Mar 2023 03:57:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdNgl-00438a-04;
	Sat, 18 Mar 2023 03:57:04 +0000
X-UUID: ed88772cc54011edb5598346aad47b14-20230317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=w7qxzHJ9OUqVOD3dN5cCe1joMzyhA01hfu1aWr/0RaU=;
	b=rXMaKEqBmJKsDZANeYJEHu4SiT1TqZjm4BGfZiTh1lsSkhioqRQiQtcmPTR5pAsAuQzHSnH0dX+flL1/3oiNGiH4NiKAuK/HKoUEuaxWUSP0WMpKE3RXSKy7nCJN0DNmbZIYguf+enWaH8JQ2+I3xHn2U5lnFcXPKm0C+1G3OxI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:c07252c3-4b32-49d4-99fe-b18aba90cf5e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.21,REQID:c07252c3-4b32-49d4-99fe-b18aba90cf5e,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:83295aa,CLOUDID:b8042af6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230318115658PBZ9ZYBT,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: ed88772cc54011edb5598346aad47b14-20230317
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 609640727; Fri, 17 Mar 2023 20:56:57 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Sat, 18 Mar 2023 11:56:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Sat, 18 Mar 2023 11:56:53 +0800
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
Subject: [PATCH v5,1/2] media: mediatek: vcodec: Make MM21 the default capture format
Date: Sat, 18 Mar 2023 11:56:50 +0800
Message-ID: <20230318035651.27454-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_205703_068759_B198F7B3 
X-CRM114-Status: GOOD (  12.68  )
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

Given that only the MM21 capture format is supported by userspace tools (like
gstreamer and libyuv), make it the default capture format.

This allows us to force the MM21 format even when a MM21 and MT21C capable
firmware is available (which is needed while dynamic format switching isn't
implemented in the driver), without causing the following regressions on
v4l2-compliance:

        fail: v4l2-test-formats.cpp(478): pixelformat 3132544d (MT21) for buftype 9 not reported by ENUM_FMT
    test VIDIOC_G_FMT: FAIL
        fail: v4l2-test-formats.cpp(478): pixelformat 3132544d (MT21) for buftype 9 not reported by ENUM_FMT
    test VIDIOC_TRY_FMT: FAIL
        fail: v4l2-test-formats.cpp(478): pixelformat 3132544d (MT21) for buftype 9 not reported by ENUM_FMT
    test VIDIOC_S_FMT: FAIL

Fixes: 7501edef6b1f ("media: mediatek: vcodec: Different codec using different capture format")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Nicolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nicolas F. R. A. Prado <nfraprado@collabora.com>
---
changed with v4:
- change the patch order.
- re-write the title and commit message for patch 1.
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index 04beb3f08eea..3000db975e5f 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -392,14 +392,14 @@ static void mtk_vcodec_get_supported_formats(struct mtk_vcodec_ctx *ctx)
 	if (num_formats)
 		return;
 
-	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MM21) {
-		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
-		cap_format_count++;
-	}
 	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MT21C) {
 		mtk_vcodec_add_formats(V4L2_PIX_FMT_MT21C, ctx);
 		cap_format_count++;
 	}
+	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MM21) {
+		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
+		cap_format_count++;
+	}
 	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_H264_SLICE) {
 		mtk_vcodec_add_formats(V4L2_PIX_FMT_H264_SLICE, ctx);
 		out_format_count++;
-- 
2.25.1


