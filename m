Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C939C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 11:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AA/zJxgLyXGzp1J2+WkEAN14CQdsA2D7Ovus/U+zG0U=; b=wffVKd1EjC2NHn+azWLOpF0zgw
	W21wKt08lt6mC4TkBq70tnS1hZYq7AFbJ9SaVKTL7s619dnpdofay+dLRxXw/x22kyCjKfIRVcJVA
	TJiiTLqtSrINXHYzaTYENWSa8iUoiRtZ4knt2pP+9ng6NImmkxR7BLETiR2JmjCLpIKp7uYJPnaei
	RhUqnSO1cxc/RgXLOte1OGkZzzKa0P8tGQRPQjKkuRG3L4HAylrfduaomHpT0qxtFkkHSZUFxMU8I
	KxDV7GUaTDWnBJSNItAAvFceFj5B9GPlEdy80P7Hu0iTdVwDhh0h/pcVfuuYbmO6fgTqfhaJ98x8C
	chhiGmnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtpc-0000000GtrJ-02Rz;
	Wed, 20 Mar 2024 11:10:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtpZ-0000000GtqG-3P2Y
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Mar 2024 11:10:03 +0000
X-UUID: 635c678ee6aa11ee9aa9374d6d45775a-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AA/zJxgLyXGzp1J2+WkEAN14CQdsA2D7Ovus/U+zG0U=;
	b=bcQfNcuJhHDikCqBtfquWtzYmuewzw2irQ61v8n8VKaFkgfVaDtkHOY7EcliTd96jaDX8hj49GNU3q2yPP1samE1THRFa06OXd1tGNTlCy0dbvr0VIsKhHkxOzAV22ANGDwAy8NEbM6dfvLnIVXyhorMM3sXsZy869FaOtzL2PU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:9ca38674-164d-49f7-a944-d17b7afc6783,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:e0dab881-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 635c678ee6aa11ee9aa9374d6d45775a-20240320
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1216019845; Wed, 20 Mar 2024 04:09:58 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 19:09:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 19:09:24 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 06/10] wifi: mt76: mt7996: fix potential memory leakage when reading chip temperature
Date: Wed, 20 Mar 2024 19:09:14 +0800
Message-ID: <20240320110918.3488-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320110918.3488-1-shayne.chen@mediatek.com>
References: <20240320110918.3488-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.866700-8.000000
X-TMASE-MatchedRID: Q/tsoOSh0kO72QdSbIBqAFz+axQLnAVBCt59Uh3p/NXgr/zYTDOZCFO4
	BD7nLMxnEPB80RQOifWDvCSgORorg6+/EguYor8cFEUknJ/kEl7dB/CxWTRRuzBqYATSOgWjIVo
	uPNaxr7bQ1l1qpCo/B9axUQUOK6+X5kN66jfD6Jji053WVk3w/Om7H5y9fALyQ99DMjxTAszir2
	K1f2u0rAcJ1KpoeGnSgITnGkK0NFNRskXKHhdfKpij9M86UwHhsKHfMTjCprzAgTvs8QFuaX7cG
	d19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.866700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B71DB43DC290BFF2A9CFE7C40720512F50044A0C33C64EB5C25BD89D4D2EA7D22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_041002_071555_F5E76B14 
X-CRM114-Status: UNSURE (   9.35  )
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

From: Howard Hsu <howard-yh.hsu@mediatek.com>

Without this commit, reading chip temperature will cause memory leakage.

Fixes: 6879b2e94172 ("wifi: mt76: mt7996: add thermal sensor device support")
Reported-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index c4eefc593a40..d5e35f6dd52e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3750,6 +3750,7 @@ int mt7996_mcu_get_temperature(struct mt7996_phy *phy)
 	} __packed * res;
 	struct sk_buff *skb;
 	int ret;
+	u32 temp;
 
 	ret = mt76_mcu_send_and_get_msg(&phy->dev->mt76, MCU_WM_UNI_CMD(THERMAL),
 					&req, sizeof(req), true, &skb);
@@ -3757,8 +3758,10 @@ int mt7996_mcu_get_temperature(struct mt7996_phy *phy)
 		return ret;
 
 	res = (void *)skb->data;
+	temp = le32_to_cpu(res->temperature);
+	dev_kfree_skb(skb);
 
-	return le32_to_cpu(res->temperature);
+	return temp;
 }
 
 int mt7996_mcu_set_thermal_throttling(struct mt7996_phy *phy, u8 state)
-- 
2.39.2


