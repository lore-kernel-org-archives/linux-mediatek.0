Return-Path: <SRS0=XgPn=2S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1026C2D0C3
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 03:06:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A461A208C4
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 03:06:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a1zzmlxE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AG4KEV3c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A461A208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1z4P5bVSdxWbO1lSR+5e79SU4ObVSaAyZCruAZJPXg=; b=a1zzmlxEclNXRm
	C9pjJ4tHd6MZwCAbzViunENl/spTSRkeRzVw6H7fCfMJ9c2YtNH81/Dg40HOtqElnww6QtQnWWoeV
	0zV+v+DJrMzw/ri9D0XSBFj7f3QOUHIbxjSZt4KDlg9Gj2E4bhngUj+XuCayQKQgtu+mttGqK8J4G
	8yuHPw+spvCE3duGXDUa6/Px+aj68pK9foR5QPMx9638Uh7nPYx+2wm+crVDhwwml+x/pWyQ1zVkC
	gjbX7N1bcV3b+uqa5e23b8lDhSBXB58Aw3oAmkwKEBta4qrgHQhRmzt8dQEKPZrjz9MO2MJj7K/BV
	QC8YOGjIucqgNIsMkMIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1il2RH-00036M-Kc; Sat, 28 Dec 2019 03:06:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1il2RE-000361-0W
 for linux-mediatek@lists.infradead.org; Sat, 28 Dec 2019 03:06:49 +0000
X-UUID: 3837fa15675546648c8b0db780969f57-20191227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ij959lRItOwY5+DCQXFnh/qX3GVtKszFINCfTg2rMt0=; 
 b=AG4KEV3cgVh7zGOCoKwcCbFz6pX5J+tsT8uj9NWohpeBzxUoTU+Xp+RC8P1VUohaA7Lo/Px9c3Q5E1dnnQ2rWjMUtYbFgRjL2UK9IDDbKWrYlmNKWOf9c6TXWW+dVvoI+2lStSMqXrScOABSyKW/AskjdJWDmFhO3k16KbGIcLo=;
X-UUID: 3837fa15675546648c8b0db780969f57-20191227
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 148913698; Fri, 27 Dec 2019 19:06:44 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 19:06:54 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 28 Dec 2019 11:05:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 28 Dec 2019 11:05:52 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v1 3/3] mt76: mt7615: add a get_stats() callback
Date: Sat, 28 Dec 2019 11:05:12 +0800
Message-ID: <294f99d401beeee1e7f1e65bf32d580d1568aa24.1577501739.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <769aba6e014b8e7650c3909d6adb8427c1d5c5ae.1577501739.git.ryder.lee@mediatek.com>
References: <769aba6e014b8e7650c3909d6adb8427c1d5c5ae.1577501739.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C67F8ACB24958420C070F8DC06EF8CBC01D642FFE0CBF873142BF4F0890688832000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_190648_060913_D90433EC 
X-CRM114-Status: UNSURE (   5.55  )
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

Add a get_stats() callback for mib statistics.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index fa67331918ea..4a2bf689c795 100644
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
