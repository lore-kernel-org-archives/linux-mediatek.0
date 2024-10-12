Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C373DD1A431
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 03:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jEOM+uWSPEOPR7VEwN5kEOeIKQrT8FMXpA4LyF1Zbig=; b=DkefRjlJN4+wYkPcq9dcc7J0Qu
	bjTn35K/4rZIJ0moARoUa7VYGSVL3C/F+sWOlxBebvIPq4e9C15dYJh8Lh9MsXl7VjwVar+1eVhub
	SZQlIcVgm7ujPEhgrAcDhQTgOKECKDWhA/QwT5pqRy0sCfjhEK8lxj9jLAJcfhAJ8ENqGRJyEuXX2
	Sn7HZJZiWJ/Rg9fE891c7WvC8UBJHNofnLwMkM8D7mIBzNhQZkEmarZK8h7SwSKPfCu1D0ZfGmofF
	BJoM3ELAIXeNSFYG+prw86KBeJZpzYSyehHTdyu4X/ZosEQz6ZS6077KbtRzDtv1rUck2IDKqCmeM
	YmVwB5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szSo6-00000000RzX-27Wo;
	Sat, 12 Oct 2024 03:28:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szSo3-00000000RzA-0JeZ;
	Sat, 12 Oct 2024 03:28:40 +0000
X-UUID: 0f52cbb4884a11efb3adad29d29602c1-20241011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jEOM+uWSPEOPR7VEwN5kEOeIKQrT8FMXpA4LyF1Zbig=;
	b=MN0sCtGMSy0CvrFl9CUzyumePRyEXWE47BgfPLh41ezOBc33QFKF07qhy99mAIVzmuZ2abj51w2SkXD0FXfHFQ4XiWHDOARakkCLNuQNy/asyIBM3q6HfbVVj6OGRtUUcfO0rE3CjB28u8j/DS+pg0hoUHwRYOIqi7bz2MCgQmU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:2691c3dc-c950-4c95-bc02-221206165d32,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:83452141-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0f52cbb4884a11efb3adad29d29602c1-20241011
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 4377933; Fri, 11 Oct 2024 20:28:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 12 Oct 2024 11:28:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 12 Oct 2024 11:28:28 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: <fshao@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<shengnan.wang@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>, <10572168@qq.com>,
	<ot_xiaofeiw.wang@mediatek.com>, Zhi Mao <zhi.mao@mediatek.com>
Subject: [PATCH] media: i2c: dw9768: Use runtime PM autosuspend
Date: Sat, 12 Oct 2024 11:25:53 +0800
Message-ID: <20241012032805.23545-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.971100-8.000000
X-TMASE-MatchedRID: ys/FpHHmWmyiwkztVCsqbymjEOrcO6AyTJDl9FKHbrleiHO/WPO/+/4f
	ZVz77tXZ4vM1YF6AJbbGJQ3BiiLAggtuKBGekqUpnH7sbImOEBR7VdEbWjzSg1/RgROefpJJv/j
	eH367KZ9mU104S42Oids+iaVjws45LPkTHGoONYy7DBs4v5OL2nWfSzpWW4iP2JbScDz7h7fyNp
	7g4PXe0BXsxz6ujBxUq1f8XSkHBUmNJXmEMVvLtpRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.971100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 723C8014F5CA88C1ABFCEC0A728BE8073CCBC88D59AB5644A8EB391FFF02A60D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_202839_142457_09BFF249 
X-CRM114-Status: UNSURE (   9.76  )
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

Use runtime PM autosuspend function to avoid rapid power state bouncing.

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 drivers/media/i2c/dw9768.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index 18ef2b35c9aa..9d39198a9ad4 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -374,7 +374,8 @@ static int dw9768_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	pm_runtime_put(sd->dev);
+	pm_runtime_mark_last_busy(sd->dev);
+	pm_runtime_put_autosuspend(sd->dev);
 
 	return 0;
 }
@@ -490,6 +491,8 @@ static int dw9768_probe(struct i2c_client *client)
 		goto err_power_off;
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_idle(dev);
 
 	return 0;
-- 
2.46.0


