Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FA7CFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 07:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mikTk70CrNGupwfA96mysETqIWVDq8bAGh/Y0KQDRqk=; b=1gMlJVZtzOW4JOQFhySV5hI0BR
	z/vq7v/xgztHBhHTz86bJYHz9rkP+S6yiaH6V8n945BrIDQyLum2MwAfcE5GSmnMKiJ8lzQWNn85h
	XTy11HB+TuRHtsXuUtUI0Tnc1l+PDN/DDOMNc7zctdyGZSj7B2/bGf2QCdz+vQRx306yRslF7V3fF
	qEwLuQdgUgGRMDEnFTi+Iabn6/HEsPFAdPvDsD017l+9LEKXW7YcA1XSILmfwv7hNvX6jXUfWdDj1
	elWPm0I23DY02RtLrtKRP5+dOtTHkpo5DGoLxFZCZTFZIycug26tDmWAC1EFwKe6pEX2JOwi7n9/d
	SIhpZuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhnt-00000001WlN-327Y;
	Mon, 07 Oct 2024 07:05:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhk0-00000001VtZ-1qUE;
	Mon, 07 Oct 2024 07:01:13 +0000
X-UUID: ec47d034847911efb3adad29d29602c1-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mikTk70CrNGupwfA96mysETqIWVDq8bAGh/Y0KQDRqk=;
	b=kOpMlkOfjRZ52uzLNF3HmAAaqGiEAO1ytcGaDLYix69DaTaa5BPM0j66LSIa/touncT1qCVa0zhjeD14u1cFIyonOa6wDNRk9YeeulpccXrY8WDkC6fld/UxVsM11W7+ZmmgRXg9QYcVmBzl2qk11HFExQBh14fjOLTd1rpPDFQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:77ecb76d-b844-46cd-98bc-5677f3b4401f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:5b1fda64-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ec47d034847911efb3adad29d29602c1-20241007
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 374357348; Mon, 07 Oct 2024 00:01:06 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 15:01:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 15:01:03 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Adam Thiede <me@adamthiede.com>, Yassine Oudjana
	<yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, Alper Nebi Yasak
	<alpernebiyasak@gmail.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v9 2/5] drm/mediatek: ovl: Refine ignore_pixel_alpha comment and placement
Date: Mon, 7 Oct 2024 15:00:58 +0800
Message-ID: <20241007070101.23263-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
References: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_000112_510675_8B636E8A 
X-CRM114-Status: GOOD (  11.16  )
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

Refine the comment for ignore_pixel_alpha flag and move it to
if (state->fb) statement to make it less conditional.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 8453a72f9e59..ddc826c42653 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -481,16 +481,16 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		 */
 		if (blend_mode || state->base.fb->format->has_alpha)
 			con |= OVL_CON_AEN;
-	}
 
-	/* CONST_BLD must be enabled for XRGB formats although the alpha channel
-	 * can be ignored, or OVL will still read the value from memory.
-	 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
-	 * affect the result. Therefore we use !has_alpha as the condition.
-	 */
-	if ((state->base.fb && !state->base.fb->format->has_alpha) ||
-	    blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
-		ignore_pixel_alpha = OVL_CONST_BLEND;
+		/*
+		 * Although the alpha channel can be ignored, CONST_BLD must be enabled
+		 * for XRGB format, otherwise OVL will still read the value from memory.
+		 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
+		 * affect the result. Therefore we use !has_alpha as the condition.
+		 */
+		if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE || !state->base.fb->format->has_alpha)
+			ignore_pixel_alpha = OVL_CONST_BLEND;
+	}
 
 	if (pending->rotation & DRM_MODE_REFLECT_Y) {
 		con |= OVL_CON_VIRT_FLIP;
-- 
2.43.0


