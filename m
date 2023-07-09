Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFB0EB64DD
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Jul 2023 16:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gl41/mwMxpqPy8qUUnM/x0ZwnRrefAMV26KSrfVVwmM=; b=hvvT/hSXvvOwOgIra7KI7MvdsO
	HhuHxqU1pK/B9kLex1se8UxjIWUYEnIG3jbHMmcexbLEhmZ8mw3JJRSccoaQMnXGoSRZOawtQQ661
	QxuHfKtEBGaCkI+ixkzHKI0bDXuEOLAb5s9mUwzn0zCrHU1VnBBPCYY7sft4igezFrJbySEXHNqsD
	2+bD+JrfGrcs4gVO/Ho92NN2py2y7YuPM4jz8KYAhLCP789MKsDu764820pe8xDvpOmUroXDL6tws
	70Rmad9bIQL1b22pGB9YCeuy2IdiQq1+LgoGsRGgynM+BnXWM+2Y9UN2SQMQ9uAnV22c7x2fAxfRY
	gZ6yH9zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIXFV-009QBX-35;
	Sun, 09 Jul 2023 16:27:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIXFS-009Q7t-0R;
	Sun, 09 Jul 2023 16:26:59 +0000
X-UUID: 652e6a1a1e7511ee83ed1395ce914268-20230709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gl41/mwMxpqPy8qUUnM/x0ZwnRrefAMV26KSrfVVwmM=;
	b=F76Yb5M85cFKToi9+WC3oA2ahArTltzJtSLbsub6EYAag4Q3qPbPukFBCXZ2t5BTqOg/liQfIH7CGRo6QWZMt9gw9zzEpVLEm1gpv/Dun2leXKAerKG25EQm2sQgvU0DOTNNyDK9yQ3+zJDYyYcxXFE5NW7EVMMBOz5LGaiJfOM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:cb31998f-f972-41b8-befd-f632628dc2ac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.27,REQID:cb31998f-f972-41b8-befd-f632628dc2ac,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:01c9525,CLOUDID:0142070e-c22b-45ab-8a43-3004e9216b56,B
	ulkID:230710002648SV42WL4D,BulkQuantity:0,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,
	TF_CID_SPAM_FAS
X-UUID: 652e6a1a1e7511ee83ed1395ce914268-20230709
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2117905801; Sun, 09 Jul 2023 09:26:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 10 Jul 2023 00:26:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 10 Jul 2023 00:26:42 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Date: Mon, 10 Jul 2023 00:26:41 +0800
Message-ID: <20230709162641.6405-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230709162641.6405-1-jason-jh.lin@mediatek.com>
References: <20230709162641.6405-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_092658_287205_108A6487 
X-CRM114-Status: GOOD (  10.11  )
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

OVL layer should not be enabled before crtc is enabled.
The plane_state of drm_atomic_state is not sync to
the plane_state stored in mtk_crtc during crtc enabling,
so just set all planes to disabled.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..51d10e65004e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -410,6 +410,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 		unsigned int local_layer;
 
 		plane_state = to_mtk_plane_state(plane->state);
+
+		/* should not enable layer before crtc enabled */
+		plane_state->pending.enable = false;
 		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
 		if (comp)
 			mtk_ddp_comp_layer_config(comp, local_layer,
-- 
2.18.0


