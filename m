Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230C8CCFA07
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z38GlW3THT9BzHnG3gs4307lwSEZDQpO7EaCPA/kazY=; b=5FS9l68aYamMQ+qzbKerzFuRVH
	mWK0VmyOdT6FwZB2VfHk398rHoOl713G/n0FGoEhi0jQ9szsfQbbbvG66f4BS4ZBN8qASxHu706lF
	IEObjl4a9lYyRgE3r97QDxC+ERqikVprpLqlfHTAZwPsiZo/GfDxjvVIwTOvEwCo0JuL+aAmLQaRZ
	PmQ/JtHdb2vxowRx4n2uL74qEKaYuRVCwSZaLMlyHM3OCIkq5bklRYDSWnmfcHqAdz56V2/SccikP
	3i05dmbP27INlmolh8xsiMl2xqIHt1UtSU82bKbvBx+e/A1u09r6hBFzhYUOiKciU+TeXGc1aboF0
	V6sCufjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZrj-0000000DO2j-0oVx;
	Wed, 05 Nov 2025 09:31:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZrf-0000000DNwD-1pa9
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 09:31:40 +0000
X-UUID: 37a72886ba2a11f09f706fa2197c6ceb-20251105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Z38GlW3THT9BzHnG3gs4307lwSEZDQpO7EaCPA/kazY=;
	b=l57vePKI93v7zpghQuxvsfTDi8fYBxv0HomwojP7/rC47b/n3bB2vzDJeQXoIl17JMY8Wx5gCI/+GYfV0XERXU0vsi8bWFdgQLb8kIGqUAvyp+/IiLFwcmoThEXmb3LjhCM+GdhivrJqIbJf4nQNy09dBfvy0TYoq+c2yDjKJn8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:63840d38-5e8d-4911-9a06-adf58acdb41c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:657a28e0-3890-4bb9-a90e-2a6a4ecf6c66,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 37a72886ba2a11f09f706fa2197c6ceb-20251105
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1618998614; Wed, 05 Nov 2025 02:31:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 5 Nov 2025 17:31:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 5 Nov 2025 17:31:30 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 11/12] wifi: mt76: mt7996: fix using wrong phy to start in mt7996_mac_restart()
Date: Wed, 5 Nov 2025 17:30:59 +0800
Message-ID: <20251105093100.541408-11-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251105093100.541408-1-shayne.chen@mediatek.com>
References: <20251105093100.541408-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_013139_491150_B3A08BC2 
X-CRM114-Status: GOOD (  10.36  )
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

Pass the correct mt7996_phy to mt7996_run().

Fixes: 0a5df0ec47f7 ("wifi: mt76: mt7996: remove redundant per-phy mac80211 calls during restart")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index c1f2938d1f21..2c869f710193 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2368,7 +2368,7 @@ mt7996_mac_restart(struct mt7996_dev *dev)
 		if (!test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
 			continue;
 
-		ret = mt7996_run(&dev->phy);
+		ret = mt7996_run(phy);
 		if (ret)
 			goto out;
 	}
-- 
2.51.0


