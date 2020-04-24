Return-Path: <SRS0=cCBG=6I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834F5C55196
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 19:43:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 549CE2173E
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 19:43:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lwCMLo9r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rYYrQl6l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 549CE2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXmR4PR/uPDL6rmdrXv/KLzDmLkPs0mCQzKNbkanBwU=; b=lwCMLo9rXVTb2M
	3yjB77lpK0nZMTas0YwIfUIyZkGpzTkJf88N1hyXSYIo0Ku1CXAs2G96qUJ/3H8N7xTeOEJ8DM8QL
	q8mKMCm00fe8UtKTItTK5/Y7Si1vKEtPmBfqh91CdTMEbtXaGrBr7+shWntQuGy0RuvCU+UGWyN5P
	MUK46IPBCnqzm0ycjhQB5EtiW/zqWxTN9mKdh+7ACTMJZVvj4PY3JsnIFkMNTLJpXaIZXngRZDBJ0
	hY79Wm11HCsQlk1pPrUgUdTmw9Bl7NiswmWGKQ9Yq2tU9qFhm1ma9vMrKBy/2/VhmDMbLEAVH0S3y
	Nt3pKibh1z1Nv9gIMXkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS4EM-0006Fy-CZ; Fri, 24 Apr 2020 19:43:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS4EC-00061n-4J
 for linux-mediatek@lists.infradead.org; Fri, 24 Apr 2020 19:43:13 +0000
X-UUID: eba66b22280c4cf584f809f2f9e7c61a-20200424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PM/tnHF829ngtHOTKKrhyuy84EmR7mXqLZMyji6w4Dc=; 
 b=rYYrQl6lJx9gxom2Hz2TNMvXiZ9MeacubPDtiydbLeHx9nI1MVKXXdyNezSpGVUnW8hc7Mu7wyuLgd3eRk2m/T2Vjj05QUaxlUGYLGxBTREv5nwulflAzoADSHpgaUOJadiP1ETQLBSQjWf+opzB8g7IBWGaflwx62SVxDdf/Wg=;
X-UUID: eba66b22280c4cf584f809f2f9e7c61a-20200424
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 849339699; Fri, 24 Apr 2020 11:43:06 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Apr 2020 12:33:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Apr 2020 03:32:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 25 Apr 2020 03:32:55 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v3 14/18] mt76: mt7915: add .sta_statistics support
Date: Sat, 25 Apr 2020 03:32:35 +0800
Message-ID: <3eb5f6555d9351aa9cf6ba551c806e025d9ec478.1587756404.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1587756404.git.ryder.lee@mediatek.com>
References: <cover.1587756404.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_124312_181621_BFEA36B2 
X-CRM114-Status: UNSURE (   7.44  )
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
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add useful debug counters since this generation uses struct rate_info
to report HE tx rate.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/main.c  | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 6cb69ae6cb0e..b3e26ff32287 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -698,6 +698,31 @@ mt7915_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 	return 0;
 }
 
+static void mt7915_sta_statistics(struct ieee80211_hw *hw,
+				  struct ieee80211_vif *vif,
+				  struct ieee80211_sta *sta,
+				  struct station_info *sinfo)
+{
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct mt7915_sta_stats *stats = &msta->stats;
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
 static void
 mt7915_sta_rc_update(struct ieee80211_hw *hw,
 		     struct ieee80211_vif *vif,
@@ -746,6 +771,7 @@ const struct ieee80211_ops mt7915_ops = {
 	.get_antenna = mt76_get_antenna,
 	.set_antenna = mt7915_set_antenna,
 	.set_coverage_class = mt7915_set_coverage_class,
+	.sta_statistics = mt7915_sta_statistics,
 #ifdef CONFIG_MAC80211_DEBUGFS
 	.sta_add_debugfs = mt7915_sta_add_debugfs,
 #endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
