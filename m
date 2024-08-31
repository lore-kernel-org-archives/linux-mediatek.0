Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23391C5474C
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Aug 2024 05:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f8Rpa4fFBhx9DDbPlfi2ydRSRTedbWnSRs5nS3M9bNU=; b=YCeCoDyJTuEBrk0fGx3nEk4dXZ
	Bq+QijUp5ANLfzP0js9R8+GLTTOqbz5s/Tmvpra0DrXFHbMW+t5VGThCN0eFcyKgS4V2HSgNbsb7e
	gbtEfMju25eVzPDpgBpIMSD5rOSPZRZ5L6meXiTogT/lq81aywvzLvkqDOL9N09mFmjwFB0tIFTvX
	wy9KenfZee29q9amGMCNfa+T0zVX+dqIh8M3k8PsGu2tbfIVn+jTWz9UD+kfiJ2u7mpZ2bF/Qw03y
	vQAi1TeULc4XJrGMLJHFf56w+NRLvlnghGWZJOBt32VaSTlEflZPCyySfxXcgdTEfR2wj0pcRGReL
	COyyzTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skH41-00000008eUz-3SUM;
	Sat, 31 Aug 2024 05:54:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skH3z-00000008eUL-0fYF;
	Sat, 31 Aug 2024 05:54:20 +0000
X-UUID: 71e6fa60675d11efb3adad29d29602c1-20240830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=f8Rpa4fFBhx9DDbPlfi2ydRSRTedbWnSRs5nS3M9bNU=;
	b=Y//BSKwYxcrkxLUn+VqZh1J4qvu8JUUWGhAz0sn+WnfQxDfghJcb4KZ9FZ3by4JO5Sv/uXTWyPnSKbHKbP3dIyWItGxeHYmfcR5rL54z0fbxTDepaEISjnbXwYgRY/Z/4r/vZN2BIT2S3+al423o2jO0N4QI0KJGv0LAb8IPFuY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:90bc8904-1c7c-42e5-b0a3-c9a841aa18b3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:cea676cf-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 71e6fa60675d11efb3adad29d29602c1-20240830
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 734206714; Fri, 30 Aug 2024 22:54:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 31 Aug 2024 13:54:08 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 31 Aug 2024 13:54:07 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<shengnan.wang@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>, <10572168@qq.com>,
	<ot_xiaofeiw.wang@mediatek.com>, Zhi Mao <zhi.mao@mediatek.com>
Subject: [PATCH] media: i2c: improve suspend/resume switch performance for GT9769 VCM driver
Date: Sat, 31 Aug 2024 13:52:09 +0800
Message-ID: <20240831055328.22482-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_225419_240873_D7C52BB8 
X-CRM114-Status: GOOD (  11.13  )
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

Chromebook camera AP can switch between video and photo mode,
the behavior corresponding to VCM is suspend and resume,
it will cause camera preview is not smooth during switching operation.
We use autosuspend function can fix this issue.

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 drivers/media/i2c/dw9768.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index 18ef2b35c9aa..7449d29df901 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -374,7 +374,7 @@ static int dw9768_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	pm_runtime_put(sd->dev);
+	pm_runtime_put_sync_autosuspend(sd->dev);
 
 	return 0;
 }
@@ -490,6 +490,7 @@ static int dw9768_probe(struct i2c_client *client)
 		goto err_power_off;
 	}
 
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_idle(dev);
 
 	return 0;
-- 
2.46.0


