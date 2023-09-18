Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A91CCD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FmL+tmhWGFQcrwwwy2xFlnk4sPriKRNmcjNvLKxuIk=; b=Ikb5Jp+rRBOAWr6gWyUNhGfAIB
	5EityaVMDJVSjW1MrURNxMBm1ibr1zwgNmXWvifhmIb0jpqAj7j/UuXkdPE+fnv2d40exgZyF6yMf
	qHJLM5V1zSwQqfypVXYvI/rhoYx69+hbtVyqeD6jSlaslB4k0w60E135JPRq84uvnXd60iWYmRZt7
	eX3GlUBMmB5ZNLjRGUhZv3KS9IXVo6pFvZtVUX68QotmFvzM5yqex4t4d9CbikTqcBXQ27n8Ew8Du
	mXMvF4NuWUYA9n5GuWgTQvQs8DOn1O9oL9eYFSsoiP+lIkjytQfN+5vDbbnXy/8yVofM/ZWEGMlyc
	9nC92/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9qS-00Eryk-0H;
	Mon, 18 Sep 2023 08:43:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9qE-00Ernw-0U;
	Mon, 18 Sep 2023 08:42:51 +0000
X-UUID: 56ba5e0055ff11ee86758d4a7c00f3a0-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2FmL+tmhWGFQcrwwwy2xFlnk4sPriKRNmcjNvLKxuIk=;
	b=XtYHvi6LM/Qr2+ikCHEEYsK6og1hX+Hqv4AFlPQaYAoR1s/jWiWUSAYwR1HCMSxSPs4CBm5LREBexF8lkT/TvQnJX+QgYTVZUvQ+qxKsW3pekKrOwnreTOILIGzl/y/DiAn5FBPZhSN5Zoiicr1P+JV0g+kAfn0EexjYiHeAwfQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:47cdf304-97fc-4169-9750-a33d1fd9affc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:f694f6be-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 56ba5e0055ff11ee86758d4a7c00f3a0-20230918
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1265218021; Mon, 18 Sep 2023 01:42:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 16:42:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 16:42:11 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Chen-Yu Tsai <wenst@chromium.org>,
	CK Hu <ck.hu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.com>
Subject: [PATCH v2 06/11] drm/mediatek: Support alpha blending in display driver
Date: Mon, 18 Sep 2023 16:42:02 +0800
Message-ID: <20230918084207.23604-7-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230918084207.23604-1-shawn.sung@mediatek.com>
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.435800-8.000000
X-TMASE-MatchedRID: 61l6kdP/ldn2fv0LTPfvM6MVgdN9w+TCWjWsWQUWzVr/evmlVf9xZkN+
	V6ZFLcNd6rlI+AD5R5wSqo3ZUfrHh25/NyTKlG69DB+ErBr0bAOuiRuR9mCautchlMhSt6FeQHf
	bKe/4YJLlpBcKhHrskTLaKLaWub4PHxPMjOKY7A8LbigRnpKlKSPzRlrdFGDwU+2vIzDCyqmf+Q
	y/rKrINsCo2Oi+tjk+FpltkTCMnT3Dhj6t95pUrg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.435800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 428F88119AF2C6E762C3F1B230F9FA71349FB6689841C1FBE17B295B794B9CE12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_014250_227508_1D6529B2 
X-CRM114-Status: UNSURE (   9.63  )
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

Support alpha blending by adding correct blend mode and
alpha property in plane initialization.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index db2f70ae060d..f87cf56fb846 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -301,6 +301,9 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   size_t num_formats)
 {
 	int err;
+	u32 blend_mode = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+			 BIT(DRM_MODE_BLEND_PREMULTI)   |
+			 BIT(DRM_MODE_BLEND_COVERAGE);
 
 	if (!formats || !num_formats) {
 		DRM_ERROR("no formats for plane\n");
@@ -323,6 +326,14 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 			DRM_INFO("Create rotation property failed\n");
 	}
 
+	err = drm_plane_create_alpha_property(plane);
+	if (err)
+		DRM_ERROR("failed to create property: alpha\n");
+
+	err = drm_plane_create_blend_mode_property(plane, blend_mode);
+	if (err)
+		DRM_ERROR("failed to create property: blend_mode\n");
+
 	drm_plane_helper_add(plane, &mtk_plane_helper_funcs);
 
 	return 0;
-- 
2.18.0


