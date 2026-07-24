Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70E8C531FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 08:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eOVR+sd2QVsPchDnrXInGMX9n7ResH6jilnddaFJ3mU=; b=1yiwoI4Md1ryB8Xu1aswKP6+D5
	ISb+jjRD34y83fa4JIQbaRP3iRJB3/2ukdtQ9JoowsULENUd0E8zdDpTuSz8HK6K6RiayR4zRFxo0
	lPIoW/Qz53IkWpou7yxl8uJkyCJAoKkZRIXRft30UE1aunGjoOMA4o2ahOWfr7src1E2S3ay+gD+Z
	enYJteDjmHrxPIIEYOTMS8nt6WeMaf0ccNTfOk738P05DP/jqOTRzLIjlw6XPkgVacvPYBQCZB3u7
	WLdoz7vGWV4yOGtKQy8gDQDidhAJOMe/fYGng+0IT2SYB66Tdbqin5EEX70SsIPYSFlbKdqEwcqLB
	/Qw63+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBZU-0000000FsPp-2tg9;
	Fri, 24 Jul 2026 08:47:56 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBZR-0000000FsO9-3ivZ
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 08:47:54 +0000
X-UUID: 57a5a6b4873c11f1afed4741b24580c9-20260724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=eOVR+sd2QVsPchDnrXInGMX9n7ResH6jilnddaFJ3mU=;
	b=qPGNf5kJw+HBhIjlBdRDGD7PrhIu2Lyl8mnRAv+8gx9nvhMtIAtMmPa0guftpHZTXZE7HX30V2u1CCjL/MB9xS5pbBTdrK8u+RK4z+9YJw+8B7hOfo/K90jC2j4YauoLxRPlIXvcD61mN1W0B7h2jwWdO4MplPX2opPWPvmHwDY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:954f55f7-0560-4f9f-8bae-0d25ed08e6b0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:1a008219-ab14-4403-9336-76696324c5a8,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99|100|102|156,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:
	-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 57a5a6b4873c11f1afed4741b24580c9-20260724
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1379289328; Fri, 24 Jul 2026 01:47:46 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 24 Jul 2026 16:47:43 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 24 Jul 2026 16:47:43 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: connac2: add CLC regulatory domain support
Date: Fri, 24 Jul 2026 16:47:42 +0800
Message-ID: <20260724084742.3153813-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014753_956804_932F7570 
X-CRM114-Status: UNSURE (   9.22  )
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

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

Add MT7921_CLC_REGD index definition and corresponding hardware
encapsulation type check in CLC loading flow to support regulatory
domain configuration via CLC (Country/Local Configuration) data.

Fixes: 058f274fb55f ("wifi: mt76: mt7921: add regulatory wiphy self manager support")
Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c    | 4 ++++
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 2e0769d18f87..c6af7f00ca59 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -476,6 +476,10 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 		    u8_get_bits(clc->type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
 			continue;
 
+		if (clc->idx == MT7921_CLC_REGD &&
+		    u8_get_bits(clc->type, MT_EE_HW_TYPE_ENCAP) != hw_encap)
+			continue;
+
 		phy->clc[clc->idx] = devm_kmemdup(mdev->dev, clc,
 						  le32_to_cpu(clc->len),
 						  GFP_KERNEL);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index fb8654b7c5e7..f5628fb6bfbf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -136,6 +136,7 @@ struct mt7921_dma_layout {
 enum {
 	MT7921_CLC_POWER,
 	MT7921_CLC_CHAN,
+	MT7921_CLC_REGD = 3,
 	MT7921_CLC_MAX_NUM,
 };
 
-- 
2.18.0


