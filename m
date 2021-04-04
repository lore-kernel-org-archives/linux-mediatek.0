Return-Path: <SRS0=JQRm=JB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3859AC43460
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Apr 2021 07:59:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFD7161364
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Apr 2021 07:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFD7161364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ysf90i8S2jST++SLh6qGVmmRP6Oprk8ssROKn62DKP0=; b=mIgQRlJmC947oMFUcT4wHyRu8s
	Peyh4X/Xx7mc5+8rrGeew767YH/XngTY1agaIecu1+CqM3GMnWeZAcinUpHTnlFpv3GGvshSQS3Ug
	EATpP86Ac8/HDNqvqZwld7z4ylvDCmyLZ4iSIZ+ngLvLKMbVEVPoKt133fENSrLiT28DbVPCMkU/j
	KFtrGT2NTFDs/KUe3xFWyycPVdh22NZxMMA+VI9VGoD6+T3d/yWjGBPLrbSbBKMVmF9kKyZvUxpph
	K3VT2w6t5DFJA0AxrlsnFslurlLETs+mqsUyyMlG+3Lel63Cgtv0M6MaXp0VEfhroAsXaMtVj7+e2
	4Im3b08A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSxeo-00FXOn-Fe; Sun, 04 Apr 2021 07:58:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSxek-00FXOB-I1
 for linux-mediatek@lists.infradead.org; Sun, 04 Apr 2021 07:58:52 +0000
X-UUID: 7cff2cab6dac4fcba54e13c1d3adb4fc-20210404
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Lix99kfb9nUzZKKpP9ZJCY9xlnGoJFGMhBE7goTsO2E=; 
 b=oM7Mpkx4T53dfdgec/ePIfE7D7ZY/xMz/VZ1rO4Jqlsxfw4rC2DVZ1/6tUYHNQyegh+WoJtpRISXS9M4+XLKwtS7wOvihORfXpKiNrHKJTv3iUO2RQLlZ7Py8AxTIZA6nBFeYkTdyMeQXExWIuKduig+tl726tI0QjOt8rPQyLc=;
X-UUID: 7cff2cab6dac4fcba54e13c1d3adb4fc-20210404
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2060341768; Sun, 04 Apr 2021 00:58:47 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Apr 2021 00:48:45 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Apr 2021 15:48:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 4 Apr 2021 15:48:25 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/2] mt76: mt7615: fix .add_beacon_offload()
Date: Sun, 4 Apr 2021 15:48:23 +0800
Message-ID: <e4f7df8a29d59656cff1c24dce0c2b695436e9f9.1617522253.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 107E1DE47BFFE049BF3324AC3A36DE74FC65B65B725E15F0D9C5F58DFB9999A92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210404_085850_976476_9F539EE0 
X-CRM114-Status: UNSURE (   8.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

ieee80211_beacon_get_template() returns NULL when beacon state is disabled,
so beacon_offload cannot be disabled for some devices.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 04b21ec611bb..3274d079bd11 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -702,6 +702,9 @@ mt7615_mcu_add_beacon_offload(struct mt7615_dev *dev,
 	};
 	struct sk_buff *skb;
 
+	if (!enable)
+		goto out;
+
 	skb = ieee80211_beacon_get_template(hw, vif, &offs);
 	if (!skb)
 		return -EINVAL;
@@ -731,6 +734,7 @@ mt7615_mcu_add_beacon_offload(struct mt7615_dev *dev,
 	}
 	dev_kfree_skb(skb);
 
+out:
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_BCN_OFFLOAD, &req,
 				 sizeof(req), true);
 }
@@ -1165,8 +1169,8 @@ mt7615_mcu_uni_add_beacon_offload(struct mt7615_dev *dev,
 			__le16 tim_ie_pos;
 			__le16 csa_ie_pos;
 			__le16 bcc_ie_pos;
-			/* 0: enable beacon offload
-			 * 1: disable beacon offload
+			/* 0: disable beacon offload
+			 * 1: enable beacon offload
 			 * 2: update probe respond offload
 			 */
 			u8 enable;
@@ -1189,6 +1193,9 @@ mt7615_mcu_uni_add_beacon_offload(struct mt7615_dev *dev,
 	};
 	struct sk_buff *skb;
 
+	if (!enable)
+		goto out;
+
 	skb = ieee80211_beacon_get_template(mt76_hw(dev), vif, &offs);
 	if (!skb)
 		return -EINVAL;
@@ -1213,6 +1220,7 @@ mt7615_mcu_uni_add_beacon_offload(struct mt7615_dev *dev,
 	}
 	dev_kfree_skb(skb);
 
+out:
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_BSS_INFO_UPDATE,
 				 &req, sizeof(req), true);
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
