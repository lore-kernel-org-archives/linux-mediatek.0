Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0CAC48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8R6XJUdM4OX6YZvqNiswbsRfy05UZJX8Sl1ACJA7ofE=; b=F5Lw+puk5Y0PZImk8ZR3rdNoZP
	hlJXr8dRKSS3K/t3evkN5G/eXYBgLroIhP6dzrdTXxV6fKvzsUToJAI8Y/4zEAM5GIhVP+MfKYbyC
	fmO/Zy1fInWbYQCiv35Y1pGADMmHgMY81Lc+s6RvqoHWbf/gn1Wqdj4Dz2SIoR7f9oLGHiG7HJXgk
	obZxwVOc36wfKxOOkYTu+plWTWD5wKFfkrSUlvr8DyarUTooQKD12Yif0hsQlP3uaqfQcAcbNliL5
	kxmND9nwSGZ1Ne28BXoaRV+27o1mMWJc8urVbJEw+31fo1T2dkx42JSOdXdB3Rj3EWcE5dRfe+8Ss
	nM9Wdv9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIDr-00000003a01-0Wnn;
	Fri, 26 Jan 2024 09:10:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIDm-00000003Zws-2cRy
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 09:10:00 +0000
X-UUID: aa8e6b3ebc2a11ee9a263b4415211400-20240126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8R6XJUdM4OX6YZvqNiswbsRfy05UZJX8Sl1ACJA7ofE=;
	b=ug8IkZKqAtxgMYo+hI0sHdq3GoYNeGgikX2O0IFElbPIrrOv4oob8SjmvLiU9oR6oWBQum84OwCjHE6XIlTmfejkIXKqy4AJKE4eaQKF4WwVaMuJsMiHndi+ZJLjSIAi7M12UOd32cV5xMEbGPDh7zmL+ZeCrqDircn82jw3+SE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:4b24ddab-7b32-4d92-bf84-e9f2647fb00e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:d574c97f-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aa8e6b3ebc2a11ee9a263b4415211400-20240126
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 7390520; Fri, 26 Jan 2024 02:09:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 Jan 2024 17:09:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Jan 2024 17:09:50 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 11/12] wifi: mt76: connac: set correct muar_idx for mt799x chipsets
Date: Fri, 26 Jan 2024 17:09:22 +0800
Message-ID: <20240126090923.6357-11-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240126090923.6357-1-shayne.chen@mediatek.com>
References: <20240126090923.6357-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.828000-8.000000
X-TMASE-MatchedRID: vws8hDIFFaMWBq7RS3cuV+G5dRZCgxC3gHzgwy8qV5os/uUAk6xP7PlY
	oV6p/cSxmX/XWgxo3gzY07Y6b1ctINvWh31RtNY8ngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIfiA
	qrjYtFiQbwNee2pVTlW6Utbit3SRvfw8OUuId6ZupSfcXfsp6K37cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.828000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: CE695003E5315B9D23078F5661B99C05B3B81D8F4AFE8FDED07608DF2AACEA182000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_010958_696619_ED12686A 
X-CRM114-Status: UNSURE (   8.99  )
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

The MUAR (multicast unicast address) is an address mapping table that
participates in the process of searching WTBL entries. For mt799x
chipsets, the default muar index of BMC WTBL is 0xe.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2: update commit message
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h     | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index fdde3d70b300..98d64d3d2993 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -227,6 +227,11 @@ static inline bool is_mt7992(struct mt76_dev *dev)
 	return mt76_chip(dev) == 0x7992;
 }
 
+static inline bool is_mt799x(struct mt76_dev *dev)
+{
+	return is_mt7996(dev) || is_mt7992(dev);
+}
+
 static inline bool is_mt7622(struct mt76_dev *dev)
 {
 	if (!IS_ENABLED(CONFIG_MT7622_WMAC))
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 96494ba2fdf7..3140d0cc8f59 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -283,6 +283,9 @@ __mt76_connac_mcu_alloc_sta_req(struct mt76_dev *dev, struct mt76_vif *mvif,
 	};
 	struct sk_buff *skb;
 
+	if (is_mt799x(dev) && !wcid->sta)
+		hdr.muar_idx = 0xe;
+
 	mt76_connac_mcu_get_wlan_idx(dev, wcid, &hdr.wlan_idx_lo,
 				     &hdr.wlan_idx_hi);
 	skb = mt76_mcu_msg_alloc(dev, NULL, len);
-- 
2.39.2


