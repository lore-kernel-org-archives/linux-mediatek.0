Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CABC43460
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:45:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1DC5613A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1DC5613A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6YRsLOgqv+nP2v1ZRb2d4NVsxmBdRSAiIMRXYChzsQo=; b=AD5M1MVAhp3Gun8Ulgxz3Qoeg
	dRZTNp5HBNNdyyU+MUpfTBQCAgzLguA9ueSK+WDzMv72G8fW0XhXrdsQ+FljJhF69mhz6AKtvfz7o
	j4FhXAB4CTCJAENS1inlaXdcweE1kBN9cNI+1dmgszgC3aaGqnszVbBL+cX70OO3bhOyBuzIV+WNz
	ruPEJujHU77EKMLJNysgLvv7z0SFq4sUsY96lXEqqKiANmc5R2Xtb8/E6frpMJcw6P1vTIOVjHwOK
	ftqE1gVxODjQMXs7bIywtzyHNcF0R2bJMsuLIMJQogbmHiCd3B30smX2KDFy/5UoBLwrK7aeNgBYr
	/RJh7vJ2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTceD-001MlM-4d; Tue, 06 Apr 2021 03:45:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTceA-001MkK-53
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 03:45:00 +0000
X-UUID: 178fe6d652a9431b8fd0c1b96396f12a-20210405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fythrLCBUas+1JNDAt9B6NtC/TXOXBwAU5ewmdG6vh8=; 
 b=Jdqa++eWqPcGR5V8SqG6r0YZOVrWx9RKPiDE+aYUfQ8bk4tf11wlRbU2BRS3VYh28yBwyCxuHWKgGBDsp+YZbNaEfeki3p5SBySE4YwN3yoHjZGHaLss1PsDFTx2KNMJfzB0ouTFg6t8w4KLFkTI1qhHAbCRGqgBav743CrqDvY=;
X-UUID: 178fe6d652a9431b8fd0c1b96396f12a-20210405
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 917672927; Mon, 05 Apr 2021 20:44:43 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Apr 2021 20:34:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 11:34:41 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 6 Apr 2021 11:34:41 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 6/6] mt76: mt7921: reduce the data latency during hw scan
Date: Tue, 6 Apr 2021 11:34:39 +0800
Message-ID: <2a90d50ed8f1f423d84d02c2d32e9e0686873525.1617679693.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4c5666ad0683e467f11ca4a4abb5be335be25696.1617679693.git.objelf@gmail.com>
References: <4c5666ad0683e467f11ca4a4abb5be335be25696.1617679693.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_044458_685453_D85C1927 
X-CRM114-Status: GOOD (  10.48  )
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

From: Sean Wang <sean.wang@mediatek.com>

Reduce the data latency during hw_scan by the split scan which would switch
back to operational channel right after scanning each channel done.

Suggested-by: Asda Wen <Asda.Wen@mediatek.com>
Suggested-by: Soul Huang <Soul.Huang@mediatek.com>
Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 5 ++++-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 1bd6294042b6..4892728ad9bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1395,11 +1395,14 @@ int mt76_connac_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		req->ies_len = cpu_to_le16(sreq->ie_len);
 	}
 
+	if (is_mt7921(phy->dev))
+		req->scan_func |= SCAN_FUNC_SPLIT_SCAN;
+
 	memcpy(req->bssid, sreq->bssid, ETH_ALEN);
 	if (sreq->flags & NL80211_SCAN_FLAG_RANDOM_ADDR) {
 		get_random_mask_addr(req->random_mac, sreq->mac_addr,
 				     sreq->mac_addr_mask);
-		req->scan_func = 1;
+		req->scan_func |= SCAN_FUNC_RANDOM_MAC;
 	}
 
 	err = mt76_mcu_skb_send_msg(mdev, skb, MCU_CMD_START_HW_SCAN, false);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 5a3efd744546..6f9b7807305a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -362,6 +362,9 @@ enum {
 #define NETWORK_IBSS			BIT(18)
 #define NETWORK_WDS			BIT(21)
 
+#define SCAN_FUNC_RANDOM_MAC		BIT(0)
+#define SCAN_FUNC_SPLIT_SCAN		BIT(5)
+
 #define CONNECTION_INFRA_STA		(STA_TYPE_STA | NETWORK_INFRA)
 #define CONNECTION_INFRA_AP		(STA_TYPE_AP | NETWORK_INFRA)
 #define CONNECTION_P2P_GC		(STA_TYPE_STA | NETWORK_P2P)
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
