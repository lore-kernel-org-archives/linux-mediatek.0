Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739CAEE49A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XmBYoWGzylVDV1lmlCTNWMBiGwgRTxQyh02g5UOnlF4=; b=YfLCC6nfmT296GvKfzWkLHt7lP
	NeWf3hGqIac8ZKD7HJR2bLkc0ZR7cm7WrrBwJuReVfGwOG0SCe905VqwWwYhvQ0tfuZuxHB4NoHBG
	5Xj9vF+MA0IR4k+hC4LLujn476MME75lMiYJttleAxSNWMMe3OI0xThuYXBYbAlgB+Iary7+KAm19
	zXsrT7WV5Ys26xugpTXDe2kFQS9uCmTBoTdtTt9UAHs5wkpym5YHAwXDfWsDd6PBk1IGjzjLM0UQR
	6rotmzDDE+oPBx9U+gSLCkr6TanDEhx4oRS+7MDfhZrNgKQCdWBrP29ExQcdADWDHbncMAuW5uPgg
	xo8H/KLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRPb-00G2rH-1C;
	Tue, 22 Aug 2023 13:27:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRPX-00G2q8-2j;
	Tue, 22 Aug 2023 13:27:09 +0000
X-UUID: 8d5c9c1840ef11ee83ed1395ce914268-20230822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XmBYoWGzylVDV1lmlCTNWMBiGwgRTxQyh02g5UOnlF4=;
	b=Vc8rElcems0pss9uScf2ngO2oHlmN4uBhE+7X7Jn+025m0ZxU3vTuw1/0CpYSvr0A8MjTrpA6zgSyh4dH4rL4LRG+hwnJ8FAafxcy3JEq8Njaia/bSteANHqozhpSMBnxNoh94n+5nMlf9Dgov5zNxx1VPX21MUN5PhqFW9Ezws=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:2be62554-7447-4d70-91bf-79567b87721c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:2f190f13-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8d5c9c1840ef11ee83ed1395ce914268-20230822
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1087974408; Tue, 22 Aug 2023 06:26:50 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 22 Aug 2023 21:26:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 22 Aug 2023 21:26:48 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>, Eugen Hristev
	<eugen.hristev@collabora.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] drm/mediatek: Add spinlock for setting vblank event in atomic_begin
Date: Tue, 22 Aug 2023 21:26:46 +0800
Message-ID: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_062707_888572_9F747014 
X-CRM114-Status: UNSURE (   9.98  )
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

Add spinlock protection to avoid race condition on vblank event
between mtk_drm_crtc_atomic_begin() and mtk_drm_finish_page_flip().

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..128a672fe3c9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -746,6 +746,9 @@ static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
 									  crtc);
 	struct mtk_crtc_state *mtk_crtc_state = to_mtk_crtc_state(crtc_state);
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&crtc->dev->event_lock, flags);
 
 	if (mtk_crtc->event && mtk_crtc_state->base.event)
 		DRM_ERROR("new event while there is still a pending event\n");
@@ -756,6 +759,8 @@ static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
 		mtk_crtc->event = mtk_crtc_state->base.event;
 		mtk_crtc_state->base.event = NULL;
 	}
+
+	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
 }
 
 static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
-- 
2.18.0


