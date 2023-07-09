Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E427C001B0
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Jul 2023 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6zbGvaQuZ99enhnUYYjFFLwH7tik1/gT0DNG2wltyM=; b=wLKXCR3ywD+UBvU57bWiUtfps3
	F3sowhLjQgAryXGX6MiXqZrPQXRGF6icLdaFZZGCwZtw1AdvjKVf/zJXsFKRsVITM3gWzc7ioOwBq
	iA6gmq0s5lr/IisAyZHnZMDM7G0ptJ0hFI88oA/WYaqpIk6Bc0erkspQOcKkQ7TQhRpI6cZfEAMvZ
	Br/LUcOmhGrBpn5KaN0Az/BpZUonWAGyxFPT6NopPMzD6PO87ckyErE4/rhxTl6iXcXLyqh2J4+/Z
	ZpnE4meVcOrE03+ZKU7EvZhli8w5oozksicq79Un+0f4k0ZPnF0GAjbLuz5Q7g2aa6wB/pa7jjeFT
	+3OePHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIXFN-009Q82-0j;
	Sun, 09 Jul 2023 16:26:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIXFJ-009Q7H-2t;
	Sun, 09 Jul 2023 16:26:51 +0000
X-UUID: 652057c21e7511ee912e1518a6540028-20230709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Y6zbGvaQuZ99enhnUYYjFFLwH7tik1/gT0DNG2wltyM=;
	b=qt0jJ9/8YrR0Qcel0vA4od8U2WgqiC+Cd2Q8KfWCpXB5d83b5FLWAQoWrmNcynq8Ozj/mBlwFIWT0YdAsBQ8ROurTvaIP7tuR1bXAV158h9qeTh6OtfUeA0pjcSqwrAy0TBsb0fVBFy06S1yvVjo0FYBmLXZX8tUl/XKQ0lq/Rc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:b7209d06-3ff7-4d1c-b64e-58a592415a89,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.27,REQID:b7209d06-3ff7-4d1c-b64e-58a592415a89,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:01c9525,CLOUDID:7fbccada-b4fa-43c8-9c3e-0d3fabd03ec0,B
	ulkID:2307100026453RD35GG8,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 652057c21e7511ee912e1518a6540028-20230709
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 545721354; Sun, 09 Jul 2023 09:26:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
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
Subject: [PATCH v2 1/2] drm/mediatek: Fix iommu fault by swapping FBs after updating plane state
Date: Mon, 10 Jul 2023 00:26:40 +0800
Message-ID: <20230709162641.6405-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230709162641.6405-1-jason-jh.lin@mediatek.com>
References: <20230709162641.6405-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_092649_969630_0032FEF4 
X-CRM114-Status: GOOD (  11.59  )
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

According to the comment in drm_atomic_helper_async_commit(),
we should make sure FBs have been swapped, so that cleanups in the
new_state performs a cleanup in the old FB.

So we should move swapping FBs after calling mtk_plane_update_new_state(),
to avoid using the old FB which could be freed.

Fixes: 1a64a7aff8da ("drm/mediatek: Fix cursor plane no update")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 31f9420aff6f..b1a918ffe457 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -210,9 +210,9 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
 	plane->state->src_y = new_state->src_y;
 	plane->state->src_h = new_state->src_h;
 	plane->state->src_w = new_state->src_w;
-	swap(plane->state->fb, new_state->fb);
 
 	mtk_plane_update_new_state(new_state, new_plane_state);
+	swap(plane->state->fb, new_state->fb);
 	wmb(); /* Make sure the above parameters are set before update */
 	new_plane_state->pending.async_dirty = true;
 	mtk_drm_crtc_async_update(new_state->crtc, plane, state);
-- 
2.18.0


