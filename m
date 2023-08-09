Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1465C04FDF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Aug 2023 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45hcMkCzwSX9mWEjHs/aEIFh2M8yucyIFEUmFCkdWhA=; b=0ZtX233ufFKp/bOsAniUyrz2gR
	VEK8Y7J1c249ybM8gukiZRRxWqIxeRw32skGhOLJMBN005IFeM9xlZWTrOHtIs97eO6XmmukISGao
	8AQf6uIiO3mb51TrQ9s1j3Uv7lt4HnMHN4VyGD/PTslAQi6bX7d69raiHW+yl2h4lCPIia/+JhbwM
	tJIvsTPB63JnWS9mpxaersghnGNEBu79XC6TaihMv4/pTJ8Dv/7ZrfS3yfCTo46YSM4vCXLPnwvQG
	hqwQxEy8crlP1vk7vbPd7sE3Gz2LFXTJOe8KJnejbucnZ+ZjfVC4cpebDw/7hSk9TiU3Wbyn4nMJf
	XGKboefQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTnij-005b8i-20;
	Wed, 09 Aug 2023 18:15:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTniZ-005b4T-0S;
	Wed, 09 Aug 2023 18:15:36 +0000
X-UUID: b8bb5de036e011ee912e1518a6540028-20230809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=45hcMkCzwSX9mWEjHs/aEIFh2M8yucyIFEUmFCkdWhA=;
	b=R5J9EmBeQ6JGH9M+97AvChsJFwFwus9DblX0CNKtg+SLvTJ7OfapVdNfVtMhEwC+wOTcZGGs2BX8dwXGxUkLfu45spyF++SSTOMoZUAcfbLdl+QLUfZXpH4si0nEP/kAZbV5YqDbziXF7VYpQxkp9R0AWlIhKu/03TiaUElmOUM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:da9f7d4d-b00e-446b-b83a-e5ea48de93ca,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.31,REQID:da9f7d4d-b00e-446b-b83a-e5ea48de93ca,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:0ad78a4,CLOUDID:110458ee-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:230810021531JCH3NO9I,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48|38,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD,TF_CID_SPAM_ULN
X-UUID: b8bb5de036e011ee912e1518a6540028-20230809
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 912411303; Wed, 09 Aug 2023 11:15:29 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 10 Aug 2023 02:15:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 10 Aug 2023 02:15:26 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Eugen Hristev
	<eugen.hristev@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v9 3/7] drm/mediatek: Fix using wrong drm private data to bind mediatek-drm
Date: Thu, 10 Aug 2023 02:15:21 +0800
Message-ID: <20230809181525.7561-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_111535_181013_6F5B7CFF 
X-CRM114-Status: GOOD (  13.67  )
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

According to mtk_drm_kms_init(), the all_drm_private array in each
drm private data stores all drm private data in display path order.

In mtk_drm_get_all_drm_priv(), each element in all_drm_priv should have one
display path private data, such as:
all_drm_priv[CRTC_MAIN] should only have main_path data
all_drm_priv[CRTC_EXT] should only have ext_path data
all_drm_priv[CRTC_THIRD] should only have third_path data

So we need to add the length checking for each display path before
assigning their drm private data into all_drm_priv array.

Then the all_drm_private array in each drm private data needs to be
assigned in their display path order.

Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 89a38561ba27..c12886f31e54 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -351,6 +351,7 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 {
 	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
 	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
+	struct mtk_drm_private *temp_drm_priv;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
 	struct device_node *node;
@@ -373,9 +374,18 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		if (!drm_dev || !dev_get_drvdata(drm_dev))
 			continue;
 
-		all_drm_priv[cnt] = dev_get_drvdata(drm_dev);
-		if (all_drm_priv[cnt] && all_drm_priv[cnt]->mtk_drm_bound)
-			cnt++;
+		temp_drm_priv = dev_get_drvdata(drm_dev);
+		if (temp_drm_priv) {
+			if (temp_drm_priv->mtk_drm_bound)
+				cnt++;
+
+			if (temp_drm_priv->data->main_len)
+				all_drm_priv[CRTC_MAIN] = temp_drm_priv;
+			else if (temp_drm_priv->data->ext_len)
+				all_drm_priv[CRTC_EXT] = temp_drm_priv;
+			else if (temp_drm_priv->data->third_len)
+				all_drm_priv[CRTC_THIRD] = temp_drm_priv;
+		}
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {
-- 
2.18.0


