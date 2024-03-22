Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB2EC47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 05:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RouVurObgINoAKVs/K4CUT3NBt/SpL3/v0jwQBFaevg=; b=uX39wLqw2Q+sDfhANrP+XLyOa6
	GKsi1+r/PXErDQldieK4jt+qIUB91/PQkzjYx+Ox6Lghv1paG5NinQrAZizVtyHtnmPsBxaZOC67a
	jTPsDSxxjUSWxyWFFTepva8owP2szzfbZvc1yeNLNFKWSo2JK0mE11SzfHDONgnq65suLYB7lRKVI
	XZPm2+tm8dJgOd6N1lGuFBsNSVGKkmM52t9n3kFSitPZsiRR2O6PkzWBQmDMGkuf7J0KUF2HX2OAh
	9wsScgG8PIApgXpuIm+zY8Xb7fFQudYbefQuS0IqJimOdrP4EDuzVCv9EW+V6EE8sn06lPPAm07w+
	9Llr5ymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnXSN-00000005qQb-188N;
	Fri, 22 Mar 2024 05:28:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnXSJ-00000005qMg-1Xsr;
	Fri, 22 Mar 2024 05:28:40 +0000
X-UUID: 07829cdae80d11ee9aa9374d6d45775a-20240321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RouVurObgINoAKVs/K4CUT3NBt/SpL3/v0jwQBFaevg=;
	b=A89B3JkJ+UP8X+C4i4fkgyLjiuDlDJ55NGJgEwSnh8enbmwAn0TwraLd/CgBynSthD7NwULfzGGDmGpfWl04Peu6u9gcIrtGc8ppKHGu6epMBPjFDEDjvKSrZxGR7gEREaTRmg7Hi0iCwPljBrNiNZNCzwqyjzWLuRgMX1vKhXE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:bb426319-8e36-4e93-9fcc-b951ec9ee357,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:c855cc81-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 07829cdae80d11ee9aa9374d6d45775a-20240321
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1669165037; Thu, 21 Mar 2024 22:28:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 13:28:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 13:28:31 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 07/14] drm/mediatek: Support alpha blending in display driver
Date: Fri, 22 Mar 2024 13:28:22 +0800
Message-ID: <20240322052829.9893-8-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322052829.9893-1-shawn.sung@mediatek.com>
References: <20240322052829.9893-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.474600-8.000000
X-TMASE-MatchedRID: zNyJSLgyXoKp2D+ysBQGeaMVgdN9w+TCKx5ICGp/WtHxxaAXDrCns61l
	cDruwbtbjztOl8irRXY5GvUK7HqDBwffi0zcbiljzuCAd7BUarYxmlBLt0TR1rFRmrhHzmfvJqo
	crulnRtHu8BTg/pveKiuTDqyOvc9SpfOBymEN+bxDiyuN5FvFNkyQ5fRSh265fmHrLgoJIlxAd9
	sp7/hgkuWkFwqEeuyRMtootpa5vg8fE8yM4pjsDwtuKBGekqUpI/NGWt0UYPCFxaINuf8XsxMBt
	+JDyJKYtmVmHRhdAl+remNmdQKczsk2k+M2T95D
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.474600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F50D86FC5B8506774D7D6CD3822AE2B6767D12BA02AAB699888BC3952AE58FDA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_222839_695584_B817BEB2 
X-CRM114-Status: GOOD (  12.59  )
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

Support "Pre-multiplied" and "None" blend mode on MediaTek's chips by
adding correct blend mode property when the planes init.
Before this patch, only the "Coverage" mode (default) is supported.

For more information, there are three pixel blend modes in DRM driver:
"None", "Pre-multiplied", and "Coverage".

To understand the difference between these modes, let's take a look at
the following two approaches to do alpha blending:

1. Straight:
dst.RGB = src.RGB * src.A + dst.RGB * (1 - src.A)
This is straightforward and easy to understand, when the source layer is
compositing with the destination layer, it's alpha will affect the
result. This is also known as "post-multiplied", or "Coverage" mode.

2. Pre-multiplied:
dst.RGB = src.RGB + dst.RGB * (1 - src.A)
Since the source RGB have already multiplied its alpha, only destination
RGB need to multiply it. This is the "Pre-multiplied" mode in DRM.

For the "None" blend mode in DRM, it means the pixel alpha is ignored
when compositing the layers, only the constant alpha for the composited
layer will take effects.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_plane.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 1723d4333f371..5bf757a3ef202 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -346,6 +346,17 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 			DRM_INFO("Create rotation property failed\n");
 	}
 
+	err = drm_plane_create_alpha_property(plane);
+	if (err)
+		DRM_ERROR("failed to create property: alpha\n");
+
+	err = drm_plane_create_blend_mode_property(plane,
+						   BIT(DRM_MODE_BLEND_PREMULTI) |
+						   BIT(DRM_MODE_BLEND_COVERAGE) |
+						   BIT(DRM_MODE_BLEND_PIXEL_NONE));
+	if (err)
+		DRM_ERROR("failed to create property: blend_mode\n");
+
 	drm_plane_helper_add(plane, &mtk_plane_helper_funcs);
 
 	return 0;
-- 
2.18.0


