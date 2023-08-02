Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98CCC04A6A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 14:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUhX4vm7/YwxpZ4R5IgDTC1j/2pYbB/emjeIzE3ZJpI=; b=kPZkXO4rOR6CW+fsm0cHyuHAKW
	D3PC+jdJHrhQLTo+TSow5qnebDq61/lRpzr78jfYohZc+dp8Y5y7KCFzAEmsmItkVswLBPqW6rSzg
	3KYnOgnqTINU/ecHqag9fYdaBc43HGOWPUk9SqocJ7pkvka2ZEzfgQP2lAE1xNZ0HGzBwsohTgfAD
	UG3w6isd/6XaQsXGm11o+4wg1SykZKAUnndR5QwzjnXEUoe0mXWBmsNOauhCpXjPfh/jW5mrfsEAe
	Tfej6PHIq+MA0Ra4C+jPa7MZbTZ21f7NQ4HzfrpFxdGHa2EFFk7LIa5LOZxvWcdiBHordKDkHyEAe
	Ultgn6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDIj-0058za-0R;
	Wed, 02 Aug 2023 14:58:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDIf-0058y8-1u;
	Wed, 02 Aug 2023 14:58:11 +0000
X-UUID: fcf86e0e314411ee83ed1395ce914268-20230802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=aUhX4vm7/YwxpZ4R5IgDTC1j/2pYbB/emjeIzE3ZJpI=;
	b=nNRmNcLJnezH5Xo4YW8VLPowU8hYB+6Bodr8/H/TcUhQMd6V1tYNR+GUcmrJo32Tz0VKNmC9O7xpR/JLGQHCh82ZxWs9zd4ksWmPvTtABEZUFBaM2nSzDME3liWbXC4zza+rSTaeZALAU92lkIWdJ30cXGtha0/9J5MDUKtTzw4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:e6b78d91-5519-4ac8-ab1e-272533a8a9fd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:0c95d1a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: fcf86e0e314411ee83ed1395ce914268-20230802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1910839612; Wed, 02 Aug 2023 07:58:06 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Aug 2023 22:48:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Aug 2023 22:48:04 +0800
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
Subject: [PATCH v8 3/8] drm/mediatek: Fix using wrong drm private data to bind mediatek-drm
Date: Wed, 2 Aug 2023 22:47:57 +0800
Message-ID: <20230802144802.751-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230802144802.751-1-jason-jh.lin@mediatek.com>
References: <20230802144802.751-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_075809_633355_51CF7F20 
X-CRM114-Status: GOOD (  14.57  )
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

In mtk_drm_kms_init(), each element in all_drm_priv should has one
display path private data only, such as:
all_drm_priv[CRTC_MAIN] should has main_path data only
all_drm_priv[CRTC_EXT] should has ext_path data only
all_drm_priv[CRTC_THIRD] should has third_path data only

So we need to add the length checking for each display path before
assigning their drm private data into all_drm_priv array.

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


