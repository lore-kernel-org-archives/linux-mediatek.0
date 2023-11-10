Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38823C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 01:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwLaIgMGWJSJFkr+2QiUxV9wT496qyWwMkmiQeFkrzA=; b=ok4JEhRq7JcQqepCuA0ajqtWHi
	SG7G+eMdI76ITEJHpqoxP1gs5hyZIas/OleMNc5OA4EpUDord5ceuNaTv2bfpbE18OHPxkUiLg1ki
	x07fwcgnYvLH6MfUe5gF6Vr/cZTv4lyxv7Lut0dJ+M8ADtCM4KLGH1j29FEIVkFnceNp6oUOtQYaa
	p1pEm3qu59v+mGE47+yBqYTQsQc+pgdBIRGT7UnEAASRZn76Zn64zHwKSKQDwK1Qp8QaPllYnLX2b
	LSEC5+qKkN7dMHBq2YsZx1cygbfW5QJEjPKLo6J5x+oLrT1AsyPWUrYinQqOigmm1TzSBSE5Fk/Ut
	45kgvXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1GLb-007adh-03;
	Fri, 10 Nov 2023 01:30:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1GLY-007acj-2F;
	Fri, 10 Nov 2023 01:30:09 +0000
X-UUID: aa534b7a7f6811ee9b7791016c24628a-20231109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LwLaIgMGWJSJFkr+2QiUxV9wT496qyWwMkmiQeFkrzA=;
	b=jkMz74ilxxBQnU1Jowy7OJpCrgiO4UuC9KTmUS3wkxl7aYyJkhvvuZ9LDBdZ/DrH1JuL4pf6FNlpxh7e9kowRnXasVaexpvSzMcEUCjBRiajXIaMMxhL/ri/4J4HrrEipPD1pUbEKlahNPcQ248uB1jVjT+YuR40HLdUwCo0OIg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:7b715020-1f69-4475-ab60-e97477ef250b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:65dde35f-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aa534b7a7f6811ee9b7791016c24628a-20231109
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <stuart.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1131204619; Thu, 09 Nov 2023 18:30:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Nov 2023 09:29:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Nov 2023 09:29:24 +0800
From: Stuart Lee <stuart.lee@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Stuart Lee <stuart.lee@mediatek.com>,
	Lancelot Wu <lancelot.wu@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	<stable@vger.kernel.org>
Subject: [PATCH 1/1] drm/mediatek: Fix access violation in mtk_drm_crtc_dma_dev_get
Date: Fri, 10 Nov 2023 09:29:14 +0800
Message-ID: <20231110012914.14884-2-stuart.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231110012914.14884-1-stuart.lee@mediatek.com>
References: <20231110012914.14884-1-stuart.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_173008_740754_0799EED4 
X-CRM114-Status: GOOD (  13.62  )
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

Add error handling to check NULL input in
mtk_drm_crtc_dma_dev_get function.

While display path is not configured correctly, none of crtc is
established. So the caller of mtk_drm_crtc_dma_dev_get may pass
input parameter *crtc as NULL, Which may cause coredump when
we try to get the container of NULL pointer.

Fixes: cb1d6bcca542 ("drm/mediatek: Add dma dev get function")
Signed-off-by: Stuart Lee <stuart.lee@mediatek.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index c277b9fae950..047c9a31d306 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -921,7 +921,14 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 
 struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
 {
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_drm_crtc *mtk_crtc = NULL;
+
+	if (!crtc)
+		return NULL;
+
+	mtk_crtc = to_mtk_crtc(crtc);
+	if (!mtk_crtc)
+		return NULL;
 
 	return mtk_crtc->dma_dev;
 }
-- 
2.18.0


