Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE72AD75BB2
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2024 04:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lI/K4ucl8KGgsqsmNWx6aKov8gDN64MnPlyw9H+LSEw=; b=aYxhL/MFRSdBNSMEbm4/mL53o3
	Xf4lT9XGFwU2GeMa8NBSKUn4o0SnFocjeEyJFNvttdUAirjfGne4nWFZTy/i2pSEPj6wztH5YJlPr
	tfr+5jDCfxs4e5EIDf4crOGE9FVLOAplNct3BJuyzi7B5iUYln0mmIB/V4htGby7tNWxgBtrwBJmQ
	K9NZOHSl6K8tDKqs+mPgma+iutpWMlSJIe177S3Krc2UYOx+SbA9/sWZqqrpJ4lMlTyVFuQlTTPiH
	9fZ8V7oyF8mV2DiboaOqe2pqGwqp45jd0x9X22BVfL+O9ZhSS3oDHRORMNzlSb7Oj6zRy2iPmMw9L
	B+loaUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyna-0000000GmgM-065u;
	Thu, 21 Nov 2024 04:28:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDylg-0000000Gm5U-3kLY;
	Thu, 21 Nov 2024 04:26:14 +0000
X-UUID: bb561782a7c011ef9048ed6ed365623b-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lI/K4ucl8KGgsqsmNWx6aKov8gDN64MnPlyw9H+LSEw=;
	b=GnKNIoegG9Rm8XJjX947Oipzo+PQaYedEaiS6SRZDwdrT4mUONXRRsseiCJTyDhVV/xY2/b3tT9zs1V9w1JOaHE1sxYhyN+hjp3OFjfOJgo3vf0A9S50JQqTveJV/ro36T1QRFuIziGiFe/Iai/OWX38O25uV4u7CHcmwdp9Zt0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:e953f5c0-9b53-471c-bd9e-38b964daedd9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:0336d6fe-58af-4a77-b036-41f515d81476,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bb561782a7c011ef9048ed6ed365623b-20241120
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2120821140; Wed, 20 Nov 2024 21:26:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 12:26:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 12:26:05 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Moudy
 Ho <moudy.ho@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 8/8] media: mediatek: mdp3: Add pa_base due to CMDQ API change
Date: Thu, 21 Nov 2024 12:26:02 +0800
Message-ID: <20241121042602.32730-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_202612_929446_9C0E7E85 
X-CRM114-Status: GOOD (  14.27  )
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

To support non-subsys ID hardware on new SoCs, the CMDQ API has been
changed to include the pa_base parameter. This change accommodates
the new interface requirements.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 4 ++--
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index ea2ea119dd2a..a0836d3b0cb8 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -326,7 +326,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
 		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    set->value, 0xFFFFFFFF);
+				    (u16)set->reg, set->value, 0xFFFFFFFF);
 	}
 	/* Config sub-frame information */
 	for (index = (num_comp - 1); index >= 0; index--) {
@@ -382,7 +382,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
 		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    0, 0xFFFFFFFF);
+				    (u16)set->reg, 0, 0xFFFFFFFF);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 3e5d2da1c807..ef36318e4742 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -10,7 +10,7 @@
 #include "mtk-mdp3-cmdq.h"
 
 #define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask, ...)	\
-	cmdq_pkt_write_mask(&((cmd)->pkt), id,			\
+	cmdq_pkt_write_mask(&((cmd)->pkt), id, base,		\
 		(base) + (ofst), (val), (mask), ##__VA_ARGS__)
 
 #define MM_REG_WRITE(cmd, id, base, ofst, val, mask, ...)	\
@@ -52,7 +52,7 @@ do {								\
 #define MM_REG_POLL_MASK(cmd, id, base, ofst, val, _mask, ...)	\
 do {								\
 	typeof(_mask) (_m) = (_mask);				\
-	cmdq_pkt_poll_mask(&((cmd)->pkt), id,			\
+	cmdq_pkt_poll_mask(&((cmd)->pkt), id, base,		\
 		(base) + (ofst), (val), (_m), ##__VA_ARGS__);	\
 } while (0)
 
-- 
2.43.0


