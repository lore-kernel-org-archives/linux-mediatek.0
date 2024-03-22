Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91665C54E71
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 05:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYF/6Qgvwv550sczzSoqXQkMYrDtEle/KYuTW20vweg=; b=oH/7kd1uAWV3fOWYqE3sIV8DbY
	otzkdkm7U64mFCtEOnj/YeMCFrWHFQpjYyQnSRRIvQMAL3MS7YQEnJNt81RDMcGNrppcO3z1Rwftt
	wibewP68h5SSJxEnJhcDkcdOEUhuGgMJOZDE3o4YejGtD+SDT5HO9IpNOKouZSiNPvyX2NpNisR7f
	0Dsb3xrnJbyzgl8TgqDqzk4tnFMXptQrQZ5qs69VuC85pCWXWNFq8ydZs6rXxRM+okHk2padgGBaF
	p1h9Zc1o4K+9tJfag/JqZPtVNef25GPVFX+PFEoo7nRe6k60CuYeaVjIPp13zUPyK18BUxVZDZsVn
	GlDeKDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnXSg-00000005qfH-03QG;
	Fri, 22 Mar 2024 05:29:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnXSK-00000005qMr-3iIJ;
	Fri, 22 Mar 2024 05:28:43 +0000
X-UUID: 06ad1c40e80d11ee9aa9374d6d45775a-20240321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lYF/6Qgvwv550sczzSoqXQkMYrDtEle/KYuTW20vweg=;
	b=Mgja/S6kvfm6xI5HKwzUsbFAIJ9rpvSS+z11wpJK8ItZjrbQg+LGkJf2ygewGxXnqcbdD+Vm5So7zGrYCam47Sn8FVvrI2jKbLQ3vo2n8wF0Y8VokfUs51w5id9WuyMKEdZySYAptbJglOJyYsUD1oeXutGBFMeV+XzM2a3NLmQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:5a1fef29-e703-4bcf-9dea-71b5205fa552,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:c955cc81-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 06ad1c40e80d11ee9aa9374d6d45775a-20240321
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 910210761; Thu, 21 Mar 2024 22:28:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 13:28:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 13:28:31 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 06/14] drm/mediatek: Turn off the layers with zero width or height
Date: Fri, 22 Mar 2024 13:28:21 +0800
Message-ID: <20240322052829.9893-7-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322052829.9893-1-shawn.sung@mediatek.com>
References: <20240322052829.9893-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_222841_112736_B58171BA 
X-CRM114-Status: GOOD (  12.07  )
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

We found that IGT (Intel GPU Tool) will try to commit layers with
zero width or height and lead to undefined behaviors in hardware.
Disable the layers in such a situation.

Fixes: 777b7bc86a0a ("UPSTREAM: drm/mediatek: Add ovl_adaptor support for MT8195")
Fixes: fa97fe71f6f9 ("UPSTREAM: drm/mediatek: Add ETHDR support for MT8195")

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 2 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c            | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 4fbf61c6b5423..494f7bf4a7881 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -158,7 +158,7 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 	merge = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx];
 	ethdr = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0];

-	if (!pending->enable) {
+	if (!pending->enable || !pending->width || !pending->height) {
 		mtk_merge_stop_cmdq(merge, cmdq_pkt);
 		mtk_mdp_rdma_stop(rdma_l, cmdq_pkt);
 		mtk_mdp_rdma_stop(rdma_r, cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index ac4132210585e..6bf398850e85f 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -160,7 +160,12 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 	if (idx >= 4)
 		return;

-	if (!pending->enable) {
+	if (!pending->enable || !pending->width || !pending->height) {
+		/*
+		 * instead of disabling layer with MIX_SRC_CON directly
+		 * set the size to 0 to avoid screen shift due to mixer
+		 * mode switch (hardware behavior)
+		 */
 		mtk_ddp_write(cmdq_pkt, 0, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(idx));
 		return;
 	}
--
2.18.0


