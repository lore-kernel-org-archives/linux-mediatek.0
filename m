Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50454CA5FA8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 16:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VhzjevPNhMQIYJy/JYceU6XqDtK2KrWqkWBT13xQ+1c=; b=PqeAlb1alqAP8LvjVfnta0xQB/
	xGjpHx2FaUIdm5KSoqMF4gtvI6WRpSZkGQjq4C+0PBZ2EgNeIITd0RnCdyPAdToV08qMFNiE4hs4G
	WtAOdNF23nkwjj2kTjRy8x4j2grFM01pwetW05lMlKf8zMjaWHlXTJ3qFX0FGLQbUblqndgrXvbmz
	v/Egw/HYvfgNQzZn6tby80vRTMv6MSUEZPhl27kpkrSPIwuIfEYy5mpN55N7tyfXxvz4hqRiEvZR0
	mOsbgtfXhwK5TPuKwjgZt0/OOqzcudW5uWfm4WbTKHZljL6Dz034Hr/OfZEabnZmWNDTiJyAMXi7r
	p+BOtzkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEeV-00000004Ao8-1pUu;
	Tue, 20 Jan 2026 16:32:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEeS-00000004Anc-2S3q
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 16:32:21 +0000
X-UUID: 92f8f88ef61d11f0ad39f32c34db0b1c-20260120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VhzjevPNhMQIYJy/JYceU6XqDtK2KrWqkWBT13xQ+1c=;
	b=HkTIH7GtFLx7u61bQVBwVwuYaz5iwYlrLUS1eev5bkogPck/6lkPpd8APzb5KQ4Nme4V6VDV/+NblC2D794e/RlFxXRhsNL5Q0PnNs59i9i0xv0uO6RN6JwKHnl1kCPbQfOhDL98YZj1wz66AFzSQTpFPkvL4ehbPCUI9zlBmu4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:6b2081fc-55cc-43e6-bd3e-6733eed60b95,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:5036027a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 92f8f88ef61d11f0ad39f32c34db0b1c-20260120
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <leon.yen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 954340765; Tue, 20 Jan 2026 09:32:12 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 21 Jan 2026 00:32:10 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 21 Jan 2026 00:32:10 +0800
From: Leon Yen <leon.yen@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<mingyen.hsieh@mediatek.com>, <michael.lo@mediatek.com>,
	<allan.wang@mediatek.com>, <quan.zhou@mediatek.com>,
	<sarick.jiang@mediatek.com>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <leon.yen@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: fix tx power setting failure after chip reset
Date: Wed, 21 Jan 2026 00:31:52 +0800
Message-ID: <20260120163152.3694116-1-leon.yen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_083220_879156_4676F7AB 
X-CRM114-Status: GOOD (  12.38  )
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

After the chip reset, the procedure to set the tx power will not be
successful because the previous region setting is still remains.
Clear the region setting during MAC initialization and allow it to be
reset to finalize the TX power setting.

Fixes: 3bc62aa4484d ("wifi: mt76: mt7925: add auto regdomain switch support")
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7925/regd.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 3ce5d6fcc69d..c0c5cb9aff75 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -91,6 +91,8 @@ int mt7925_mac_init(struct mt792x_dev *dev)
 
 	mt7925_mac_init_basic_rates(dev);
 
+	memzero_explicit(&dev->mt76.alpha2, sizeof(dev->mt76.alpha2));
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_init);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
index 292087e882d1..16f56ee879d4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
@@ -232,7 +232,8 @@ int mt7925_regd_change(struct mt792x_phy *phy, char *alpha2)
 	    dev->regd_user)
 		return -EINVAL;
 
-	if (mdev->alpha2[0] != '0' && mdev->alpha2[1] != '0')
+	if ((mdev->alpha2[0] && mdev->alpha2[0] != '0') &&
+	    (mdev->alpha2[1] && mdev->alpha2[1] != '0'))
 		return 0;
 
 	/* do not need to update the same country twice */
-- 
2.45.2


