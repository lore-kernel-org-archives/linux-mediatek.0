Return-Path: <SRS0=NTS1=G2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBCAC43381
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:45:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 364A6239D4
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 364A6239D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aoZ6iRt7TPLZvn6zRZk0Xi+jx/N7cCtlBckAbl2icCQ=; b=SCuCl9anayECd2rFM9UPYAD8a
	4H9eG36cNWZtLkMr2nlqTCn3NDfgdvFSZyPOWVOkE4OAfm9p4JT3v2wOHHVhNGOUC9Rx3jBRc0H5z
	eC4SLR549Egp4caOt+ZtT57ZiHM4Ncxnp7iSuEaoKodYQfjh9l6VWvEFm9qytWUoaiJ4Mb2rx5kmg
	Enj3MpCqhKpQk/cKNgcrqFsrgVYcEoba6A18oiJXpqv6SDbuyZvsIXfPJy+uH5u/m6/31J2wpxj/D
	VIFsjWRjimgn4gwmpmgc1NqZGJ4AiH6nLr7hsXGkkcKjyD7PWn5gA5RmdtHVWxaOKV2KSG8ydT9wY
	vhol10umQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3EY0-0005Xi-Ac; Sat, 23 Jan 2021 08:45:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3EXv-0005UO-JG
 for linux-mediatek@lists.infradead.org; Sat, 23 Jan 2021 08:45:28 +0000
X-UUID: 925885ec55e24cebb58d8ddb24b0f77b-20210123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ShDSiuPrQZnlAovldFmaaf8I5bjukynGk9hey5s0wts=; 
 b=LhxLP9lKYdthYYi3ACP6Iw4KuiwvHfqjdks+aFvdLD3lnxZxt83WhuR+0R652uKtUpXTavaEvGZNlkNEGi7VWWJtNQHWbzkaos6ZpfrrZYjdFeTBiutlMhh1rfzh4AKWAiO+fG78GOfUZUFj3qDu7duep4KWhiWC+4TPcWj94hg=;
X-UUID: 925885ec55e24cebb58d8ddb24b0f77b-20210123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1325543417; Sat, 23 Jan 2021 00:45:18 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 00:35:19 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 16:35:18 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Jan 2021 16:35:18 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v7 22/22] mt76: mt7921: add sta statistics
Date: Sat, 23 Jan 2021 16:35:13 +0800
Message-ID: <8885b6803848b5a4302b523d9cf7430c05478280.1611389300.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1611389300.git.objelf@gmail.com>
References: <cover.1611389300.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EF34D0D19CA955ACC7A0044D39A2FFDDA87272A98BB2A7346AB4CD4CEA8C427A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_034527_756415_712C4AAC 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: ryder.lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Soul.Huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Add sta statistics support to query current tx bitrate

Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index cc1fea7d3bb2..2ec1a1270ae8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1095,6 +1095,31 @@ static void mt7921_set_rekey_data(struct ieee80211_hw *hw,
 }
 #endif /* CONFIG_PM */
 
+static void mt7921_sta_statistics(struct ieee80211_hw *hw,
+				  struct ieee80211_vif *vif,
+				  struct ieee80211_sta *sta,
+				  struct station_info *sinfo)
+{
+	struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+	struct mt7921_sta_stats *stats = &msta->stats;
+
+	if (!stats->tx_rate.legacy && !stats->tx_rate.flags)
+		return;
+
+	if (stats->tx_rate.legacy) {
+		sinfo->txrate.legacy = stats->tx_rate.legacy;
+	} else {
+		sinfo->txrate.mcs = stats->tx_rate.mcs;
+		sinfo->txrate.nss = stats->tx_rate.nss;
+		sinfo->txrate.bw = stats->tx_rate.bw;
+		sinfo->txrate.he_gi = stats->tx_rate.he_gi;
+		sinfo->txrate.he_dcm = stats->tx_rate.he_dcm;
+		sinfo->txrate.he_ru_alloc = stats->tx_rate.he_ru_alloc;
+	}
+	sinfo->txrate.flags = stats->tx_rate.flags;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
+}
+
 const struct ieee80211_ops mt7921_ops = {
 	.tx = mt7921_tx,
 	.start = mt7921_start,
@@ -1132,4 +1157,5 @@ const struct ieee80211_ops mt7921_ops = {
 	.set_wakeup = mt7921_set_wakeup,
 	.set_rekey_data = mt7921_set_rekey_data,
 #endif /* CONFIG_PM */
+	.sta_statistics = mt7921_sta_statistics,
 };
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
