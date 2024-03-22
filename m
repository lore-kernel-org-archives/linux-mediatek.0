Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D16ACD11DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 05:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u08yQkzLQe3nxMe8CbG1scNucD/LAJ38bA0echu1PJ4=; b=IVi9eWVJ2fmGyVXUEMST7bVXAf
	hPMmbgJr6MwuWYnnWRMrJVxOQZO0VUcjHRcZjAFHwS6zaAEiGHjwmfPOD/CGiDHDW7hch1OiW0X5d
	AWqWKuyLbMvaWRcfGSxIkCfS8y5ux6j18bI2v3csIFehJXSj++xqvBomOgznSoxy/hRrTipIP8Nio
	CXINQ8cGe3M8++5CjyK/LIJdsQCM/8Z5QfcOfa8EXc42nQWteZh/QL6g9R7clh7U/eAsePv1cT0bl
	ap9Udn0Qm2iSRKFkhJ5jTJnK9aJOdIeoMbMfM64AWHAlZPLV7q05e9junMP0QSnbGXTxIHmyUgdoW
	LcU6PKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnXSV-00000005qV2-0SNk;
	Fri, 22 Mar 2024 05:28:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnXSK-00000005qN0-1xZT;
	Fri, 22 Mar 2024 05:28:42 +0000
X-UUID: 07310e10e80d11eeacdb61a41848c7d2-20240321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=u08yQkzLQe3nxMe8CbG1scNucD/LAJ38bA0echu1PJ4=;
	b=QSarjtcUsSmGKfr9c9Thn/GKGV6ZilXSQCVRoG0/lnS2gGsHuUbnbkWamermu9iiCRGGdGQpBSXyqvTUf4apA6Xy2L8swi4/ZDOwwgSIg4sDI+uZyafELE0b/Ay78H48SByqXTORcONYNV9Qll3hzrLj4a18qrENDxzQb6GVOUk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:f525a0a0-62c0-4cb6-a8ca-517ae617d70c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:a2cb4c85-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 07310e10e80d11eeacdb61a41848c7d2-20240321
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 487380667; Thu, 21 Mar 2024 22:28:34 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 13:28:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 13:28:32 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 11/14] drm/mediatek: Support "None" alpha blending in Mixer
Date: Fri, 22 Mar 2024 13:28:26 +0800
Message-ID: <20240322052829.9893-12-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322052829.9893-1-shawn.sung@mediatek.com>
References: <20240322052829.9893-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_222840_544684_E5313B79 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy .
 Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Hsiao Chien Sung <shawn.sung@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Support "None" blend mode on MediaTek's chips.

Please refer to the description of the commit
"drm/mediatek: Support alpha blending in display driver"
for more information.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 4b12ca285e84b..951e3e82a6a1a 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -178,7 +178,8 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 	if (state->base.pixel_blend_mode != DRM_MODE_BLEND_COVERAGE)
 		mix_con |= PREMULTI_SOURCE;
 
-	if (state->base.fb && !state->base.fb->format->has_alpha) {
+	if (state->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
+	    (state->base.fb && !state->base.fb->format->has_alpha)) {
 		/*
 		 * Mixer doesn't support CONST_BLD mode,
 		 * use a trick to make the output equivalent
-- 
2.18.0


