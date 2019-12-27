Return-Path: <SRS0=MHhQ=2R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39C5C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 09:06:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8657E20828
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 09:06:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HF9CgkO7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uLwIdT3V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8657E20828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLTacfzwj2z7BlvOYZCiQIz8REY4ry7BR/wVyiRwnrM=; b=HF9CgkO7Zz7psm
	B2Q4UkAvA2NoR9p/lpwfBQ88PMQytHe+gGmzymiMcNOg3+JRl0zQDQFhnsQcFVCBNU3bhpg6cVnYh
	9KTCItj2s6uchpOMPw8NYHzYU3UjpdSNSQe5UQELEE2mKquuvp2f2hG1ToekqRxWXuSeBLcJby/Ce
	0Igt2uQDVQiAmnTGSVd+8SmLNrBejRtU2fOfpLFrEC6eTnH7rhv8zMYamwa/3w0Kc/oFWr72v4V+X
	1ikH+n78KpIA7hlHuAtgAmTX0vj5PF8QMi/xjnTGVrD0RhpSpvTpKMlH324LS228L3MH9In6/lSf1
	eEU8lMBZNBzt/qGg4KOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iklZw-0006Xl-5y; Fri, 27 Dec 2019 09:06:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iklZt-0006Vx-0A
 for linux-mediatek@lists.infradead.org; Fri, 27 Dec 2019 09:06:38 +0000
X-UUID: 5e9fddd2fea24718bad1c3a6ca598b64-20191227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ay+ibNcB5NYuieSrDeYdH8wOhecnM0m+aMHmpuj+/+g=; 
 b=uLwIdT3VyvXUEqpZz/gaOGkvTkabUUP2+eJ7AU7Lbl+EQCbt+qjs25Ss51iAQYIn93jYfGI8r4N7sVHuYgO85wiFgVNAGOH8nBtQeCRVapUOfPIBZKlhGaMgil/X7lBl1VocrJ+88J3gQ4vAv4hqDRsi2KWckwYz3MgmHtfA6rk=;
X-UUID: 5e9fddd2fea24718bad1c3a6ca598b64-20191227
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 781078996; Fri, 27 Dec 2019 01:06:33 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 01:00:21 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 16:59:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 27 Dec 2019 17:00:00 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 3/3] mt76: mt7615: add a .get_stats callback
Date: Fri, 27 Dec 2019 17:00:09 +0800
Message-ID: <b9c5cf59dd656fb5dea67b46ed264d0e0290da3f.1577411732.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <7d450f0c4fec3c7242804e47f9bce13255e7f28d.1577411732.git.ryder.lee@mediatek.com>
References: <7d450f0c4fec3c7242804e47f9bce13255e7f28d.1577411732.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D8B3679B52C8892946EFCE5EE48E5DCE8D2162D8BAB16D665268CFBF2D8ACECB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_010637_044260_38F490D6 
X-CRM114-Status: UNSURE (   5.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a .get_stats callback.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 0efd8065812c..331bed775b6d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -628,6 +628,21 @@ mt7615_sta_remove(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			  IEEE80211_STA_NOTEXIST);
 }
 
+static int
+mt7615_get_stats(struct ieee80211_hw *hw,
+		 struct ieee80211_low_level_stats *stats)
+{
+	struct mt7615_phy *phy = mt7615_hw_phy(hw);
+	struct mib_stats *mib = &phy->mib;
+
+	stats->dot11RTSSuccessCount = mib->rts_cnt;
+	stats->dot11RTSFailureCount = mib->rts_retries_cnt;
+	stats->dot11FCSErrorCount = mib->fcs_err_cnt;
+	stats->dot11ACKFailureCount = mib->ack_fail_cnt;
+
+	return 0;
+}
+
 static u64
 mt7615_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 {
@@ -679,6 +694,7 @@ const struct ieee80211_ops mt7615_ops = {
 	.release_buffered_frames = mt76_release_buffered_frames,
 	.get_txpower = mt76_get_txpower,
 	.channel_switch_beacon = mt7615_channel_switch_beacon,
+	.get_stats = mt7615_get_stats,
 	.get_tsf = mt7615_get_tsf,
 	.get_survey = mt76_get_survey,
 	.get_antenna = mt76_get_antenna,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
