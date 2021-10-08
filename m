Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E85FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 15:41:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65310610E5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 15:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65310610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p63tt7gUyRTy7dDmECJ653y/jbgJyw9FbcCVC3CNsPo=; b=sQ148QK4tGXUiQ
	oxMiYa+HG4iPy2ExvAEPgEXq3RCsMhFhm/fK5iRQonry4njan35uIu9pTVLAGEY5COfrOMgY5+g7O
	AWidQc851Zml/D3bZ5QGO4/9TMxEQ5aArZes03HwUJ3h/YD6xHj3FUP0uO27qRuciI0JcLSc9rdmH
	GzrBITRV9StM6B2LUEmKYs5DgXBtxCOmFvPtr6bIuXzWia/9a6MCI4toB8UwcfZixo+uUZQsB4n66
	ozE4as5prqWEXCHoLd4UlKT04+9UOKkiwdz6VMojCJWxb/kv8TQS/8ahLUJAa8hGQx7UKqiWJdTq5
	mfDjfvukDjUXgBIWuTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYrzo-003GZz-Ss; Fri, 08 Oct 2021 15:41:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYrzk-003GVW-Lp
 for linux-mediatek@lists.infradead.org; Fri, 08 Oct 2021 15:41:14 +0000
X-UUID: 8a6d313bb69d46a5bc0bfe53218beb67-20211008
X-UUID: 8a6d313bb69d46a5bc0bfe53218beb67-20211008
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1612016639; Fri, 08 Oct 2021 08:41:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Oct 2021 08:41:04 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Oct 2021 23:41:04 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, Eric-SY
 Chang <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, Evelyn
 Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: mt7921: add delay config for sched scan
Date: Fri, 8 Oct 2021 23:40:50 +0800
Message-ID: <be717a2f0272ab8d339f4bc658fdde855eb78f0d.1633705676.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_084112_742668_73A463B1 
X-CRM114-Status: GOOD (  11.39  )
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

From: Deren Wu <deren.wu@mediatek.com>

Add a delay parameter for firmware to support delay scheduled scan.

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 9c0f86eefd75..1f4fdb470578 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1540,8 +1540,10 @@ int mt76_connac_mcu_sched_scan_req(struct mt76_phy *phy,
 		get_random_mask_addr(addr, sreq->mac_addr,
 				     sreq->mac_addr_mask);
 	}
-	if (is_mt7921(phy->dev))
+	if (is_mt7921(phy->dev)) {
 		req->mt7921.bss_idx = mvif->idx;
+		req->mt7921.delay = cpu_to_le32(sreq->delay);
+	}
 
 	req->ssids_num = sreq->n_ssids;
 	for (i = 0; i < req->ssids_num; i++) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index cb36dd39221c..5b75465bc05a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -805,7 +805,9 @@ struct mt76_connac_sched_scan_req {
 		} mt7663;
 		struct {
 			u8 bss_idx;
-			u8 pad2[19];
+			u8 pad1[3];
+			__le32 delay;
+			u8 pad2[12];
 			u8 random_mac[ETH_ALEN];
 			u8 pad3[38];
 		} mt7921;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
