Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60837E8FDC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 02:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMxn+WVizjmYY6Ut3cxVQcDYe3FAgydr3Np6TZ8oI8A=; b=ETpa+z+QsbXKdSATeZIlkRLX42
	mHXb0qK+18pR5A1uaY+5JBJ4IK9Bh2oUhWFmugwmShxqSid10D43zU4fJi238KahBsySeeoLrnZAg
	rxTXmXpKZwAI2+fuukH+dRUi9SyQkU8074O6AT/BoV8TFwem9Evhdig6OSQhRYnN1QwD3kaDIcPMA
	IR6indPJvoX3OTex3/rxdOwpiViOoEmJBgJ/bzkKsCtFiuthiZ3gWWhfwE4KS7wE5EjBUBp44NDBB
	JyVb60cyuFlA7pjrEpQKVJO41mZXdRmuVRv+bVvJzAwCn2TMHdl/TsDqeYSXUJSQkOeIoMg4UUGT/
	NrbU/vtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnror-00Fnlz-0K;
	Wed, 04 Oct 2023 02:41:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnrol-00Fnhn-1S;
	Wed, 04 Oct 2023 02:40:56 +0000
X-UUID: 6d2557b4625f11ee86758d4a7c00f3a0-20231003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KMxn+WVizjmYY6Ut3cxVQcDYe3FAgydr3Np6TZ8oI8A=;
	b=hq9NwfCUOIwNvTT61gu2+1p54ZxN04krkr8Ej7tRF2B5mFMTEywG4U6wEi511w9JXgzY6q6U2i1SfT6wtuZ1uAvUAGeHTcWb8GkTy2Njls1Cwu5hTXsZciq2I7t2m8zoVQC3gCts3KVmHJHxNQ2wZ57zZp4RcjR7WPTzlr6X3tc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:6933cb0e-809d-4349-943f-0514ca2c9850,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:de718ebf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6d2557b4625f11ee86758d4a7c00f3a0-20231003
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 248832057; Tue, 03 Oct 2023 19:40:48 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Oct 2023 10:40:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Oct 2023 10:40:15 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v11 3/9] drm/mediatek: Fix using wrong drm private data to bind mediatek-drm
Date: Wed, 4 Oct 2023 10:40:07 +0800
Message-ID: <20231004024013.18956-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
References: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.036500-8.000000
X-TMASE-MatchedRID: IDRSBkmySF1GlhjnipkGEGwjJ4TFeU1uYpovC7zX5q/Npr24oOS4xkfp
	kQx2u0KsbDDGr42tgBMSqo3ZUfrHh5Coy9iDotiwFYJUGv4DL3wHQj6IJQ7jncRbUf2aWQ/nJET
	WX/pKcs46hUOcTonr9IAy6p60ZV62fJ5/bZ6npdiyO81X3yak8wZbZpuKmuxzNli+eDT2tDyGJo
	dZodTf/LorMSFXg3vW4Ts9Wri8gIl+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.036500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 41CEC5A55D489F33C93B4909D693A2B44F859C2386C62EEF1B9628DB7F09C8322000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_194055_493259_0F0B0769 
X-CRM114-Status: GOOD (  13.06  )
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
Tested-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index efe36eace8f0..bf4a04c1156b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -352,6 +352,7 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 {
 	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
 	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
+	struct mtk_drm_private *temp_drm_priv;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
 	struct device_node *node;
@@ -371,11 +372,21 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 			continue;
 
 		drm_dev = device_find_child(&pdev->dev, NULL, mtk_drm_match);
-		if (!drm_dev || !dev_get_drvdata(drm_dev))
+		if (!drm_dev)
 			continue;
 
-		all_drm_priv[cnt] = dev_get_drvdata(drm_dev);
-		if (all_drm_priv[cnt] && all_drm_priv[cnt]->mtk_drm_bound)
+		temp_drm_priv = dev_get_drvdata(drm_dev);
+		if (!temp_drm_priv)
+			continue;
+
+		if (temp_drm_priv->data->main_len)
+			all_drm_priv[CRTC_MAIN] = temp_drm_priv;
+		else if (temp_drm_priv->data->ext_len)
+			all_drm_priv[CRTC_EXT] = temp_drm_priv;
+		else if (temp_drm_priv->data->third_len)
+			all_drm_priv[CRTC_THIRD] = temp_drm_priv;
+
+		if (temp_drm_priv->mtk_drm_bound)
 			cnt++;
 
 		if (cnt == MAX_CRTC)
-- 
2.18.0


