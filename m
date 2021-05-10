Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F12FC43618
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:15:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2AF96120D
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2AF96120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cCZ8Ue47bWBZQtsOeUFpSPYAL8lGkuXg8OhA/wA9WSg=; b=m72PQ+VCnfO2Wjm67XtkICjpV
	tdO5I2IBhZCl1DDVo2+dwtfLT26GipqDOi2t4RiAyJCRxVI3PoPtLZnY/lCgESVVE4VaEg1NjVq9j
	0I4sKo00tWT6T84EUxM8Fy1AfmzkdOezPS8fvlIPVocrz6+TVc3MICsh9mx7sxu4AYtf2tPbmwBT3
	8QfJf95yXMSMbY7/v31MtWIE4gJix/EUekWvA6qtXwK1MvtAbpuiH1JJZ5OWkVq1okrw37mNCIlEo
	RCWgj3+Kit4RkNCSV24fAJAOHDYqJB3vz5klRoa6oMhTWVu16JJKZ2bVjZQiSv61x6/94sk2B+A4O
	DI8ZrtxBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg7cs-00ElOn-O1; Mon, 10 May 2021 15:15:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7cl-00ElM0-5s
 for linux-mediatek@desiato.infradead.org; Mon, 10 May 2021 15:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=QJwYec6xJ0LSNIBGpFWyX8aFSE35uVEbqazvMZ8CKQk=; b=b4QvhKxnxzVhf0/MMQcWKImSUy
 YYNRvsyfWhNsFH02u7eSgmAxo/bSLQ85/T9C0yeA3llHovPOzRgtcMRRo6HMitWkjhxNQxPjLCfXJ
 g+iduAXWjIuot1DReF/GNiAFMFV13mdkFYd8P20opK3zScaT3e6GTACeI3HQI0uoaswJy1i10lo1l
 ysS6q6D7MUB+dVdoXHRZMtMV3zDaUPXetSGu/wRH7XXNoUZPmrjBHLwuAaP6bYnyojkSOqfYL+znb
 RQxyXnK7qIHFK31wxzmZZFcvN9/bmZh1av7zj/Px+5cxpsMANsenrqhc6NnxzCnu0sAFanc+8l+ee
 bdT7pSTw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7ci-008rIT-F6
 for linux-mediatek@lists.infradead.org; Mon, 10 May 2021 15:15:09 +0000
X-UUID: 6fc9089f4f664c38bac883d96f5178e3-20210510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QJwYec6xJ0LSNIBGpFWyX8aFSE35uVEbqazvMZ8CKQk=; 
 b=DfZUYghCWZJVh6Khf4HBrTPcF91D4OIZsp9AaFZIMypoa+zVtAfqL362k07uaL63V5n6Jr3yffdde2vRsoWhsYhWPkLSnZBj+q00r6Lel+5jRZ3u4gVXKmLRRlzRTb//JmnfEuMmfF/h1ssxdot84yP8K+LJPuIjFDCFeOM5w4c=;
X-UUID: 6fc9089f4f664c38bac883d96f5178e3-20210510
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1188738284; Mon, 10 May 2021 08:15:01 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 08:15:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 23:14:59 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 May 2021 23:14:59 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, YN Chen <yn.chen@mediatek.com>
Subject: [PATCH 6/9] mt76: connac: fix WoW with disconnetion and bitmap pattern
Date: Mon, 10 May 2021 23:14:54 +0800
Message-ID: <1620659697-12048-6-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
References: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_081508_536576_E546FC80 
X-CRM114-Status: GOOD (  10.19  )
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

From: YN Chen <yn.chen@mediatek.com>

Update MCU command usage to fix WoW configuration with disconnection
and bitmap pattern and to avoid magic number.

Fixes: ffa1bf97425 ("mt76: mt7921: introduce PM support")
Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: YN Chen <yn.chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 11 +++++++----
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h |  8 ++++++++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 542d7d9f1f52..6ffe4b91d567 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1999,7 +1999,7 @@ mt76_connac_mcu_set_wow_pattern(struct mt76_dev *dev,
 	ptlv->index = index;
 
 	memcpy(ptlv->pattern, pattern->pattern, pattern->pattern_len);
-	memcpy(ptlv->mask, pattern->mask, pattern->pattern_len / 8);
+	memcpy(ptlv->mask, pattern->mask, DIV_ROUND_UP(pattern->pattern_len, 8));
 
 	return mt76_mcu_skb_send_msg(dev, skb, MCU_UNI_CMD_SUSPEND, true);
 }
@@ -2034,14 +2034,17 @@ mt76_connac_mcu_set_wow_ctrl(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	};
 
 	if (wowlan->magic_pkt)
-		req.wow_ctrl_tlv.trigger |= BIT(0);
+		req.wow_ctrl_tlv.trigger |= UNI_WOW_DETECT_TYPE_MAGIC;
 	if (wowlan->disconnect)
-		req.wow_ctrl_tlv.trigger |= BIT(2);
+		req.wow_ctrl_tlv.trigger |= (UNI_WOW_DETECT_TYPE_DISCONNECT |
+					     UNI_WOW_DETECT_TYPE_BCN_LOST);
 	if (wowlan->nd_config) {
 		mt76_connac_mcu_sched_scan_req(phy, vif, wowlan->nd_config);
-		req.wow_ctrl_tlv.trigger |= BIT(5);
+		req.wow_ctrl_tlv.trigger |= UNI_WOW_DETECT_TYPE_SCH_SCAN_HIT;
 		mt76_connac_mcu_sched_scan_enable(phy, vif, suspend);
 	}
+	if (wowlan->n_patterns)
+		req.wow_ctrl_tlv.trigger |= UNI_WOW_DETECT_TYPE_BITMAP;
 
 	if (mt76_is_mmio(dev))
 		req.wow_ctrl_tlv.wakeup_hif = WOW_PCIE;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 3ed2fb5e1389..8f4d85b148fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -590,6 +590,14 @@ enum {
 	UNI_OFFLOAD_OFFLOAD_BMC_RPY_DETECT,
 };
 
+#define UNI_WOW_DETECT_TYPE_MAGIC		BIT(0)
+#define UNI_WOW_DETECT_TYPE_ANY			BIT(1)
+#define UNI_WOW_DETECT_TYPE_DISCONNECT		BIT(2)
+#define UNI_WOW_DETECT_TYPE_GTK_REKEY_FAIL	BIT(3)
+#define UNI_WOW_DETECT_TYPE_BCN_LOST		BIT(4)
+#define UNI_WOW_DETECT_TYPE_SCH_SCAN_HIT	BIT(5)
+#define UNI_WOW_DETECT_TYPE_BITMAP		BIT(6)
+
 enum {
 	UNI_SUSPEND_MODE_SETTING,
 	UNI_SUSPEND_WOW_CTRL,
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
