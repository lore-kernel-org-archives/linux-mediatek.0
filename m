Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26D4C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 18:50:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A486B61221
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 18:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A486B61221
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3LtMWeMa288hkcIfLGhFNYrq/GMINfJ3SiXrwPbzxsw=; b=pw+ij0vau6s5md
	O9YNG9+fICCY6CHZg0KpI0nAr0Bvw1P2iFo4Jd3CUruFsKEuAOdusXoKNGnIiVMf9LlWwiZkGJREi
	eQ3ujWi1wexmwd07PZNgKk2rCjQ34fBJ7G/jiIPlFtCyY5aS5/cnicSS21jTvVwQAsv3q39gImdmd
	0mgJLHlFBBrTQj3bpNlRZ/23UmUPTqCIAkiar+JPse1NiaDGqQ50Ilm7cYE+/wwnppRR9ZBD06pfR
	/WXNUY7CNlZCNcXwqQHtjFym+z9sPfIPbk247qAFEN7GUfFRDiCRWnF0ypAxYXd/YI/rRWebrSnkG
	y6EtjIWagdnJLAyu5/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m310m-008CH9-M9; Mon, 12 Jul 2021 18:50:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m310j-008CGl-CW
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 18:50:35 +0000
X-UUID: 9f8ea0e2e3e14f1c8e3bca94a3f434a5-20210712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gm4pb6KvILYRfyj77gzf/eUMmPQgUsc7XZcHabRaxWU=; 
 b=p9TyLaTKTR+NgHey+LHHIf4Sy0mqFkmpeTj4AmIDA6V886jgjZKUoVUJwcfTREtwm4WEZHN2MaMVEphnNQ2orhqZ5eXGBxSE3IfPUbJKw/wFKMVOugHw1/oePF+gc1ZzjGQW422Q3AQK0fp7pFnptu1iQijXAeCmWG2MdC1s3z0=;
X-UUID: 9f8ea0e2e3e14f1c8e3bca94a3f434a5-20210712
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1182348930; Mon, 12 Jul 2021 11:50:30 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 11:40:28 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 02:40:13 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Jul 2021 02:40:14 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 1/2] mt76: fix mt76_rates for the multiple devices
Date: Tue, 13 Jul 2021 02:40:11 +0800
Message-ID: <a9586764e6cd94bb91e0a9addf9319bb95dfe4db.1626114777.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_115033_489168_B83A7660 
X-CRM114-Status: GOOD (  13.74  )
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

PHY offset in either .hw_value or .hw_value_short for mt7615, mt7663,
mt7915 and mt7921 device all start at bit 6, not 8.

Suggested-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: splitted out from the patch ("mt76: mt7921: fix mgmt frame using unexpected bitrate")
    to cover more devices which have the same issue.
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 24 +++++++++----------
 drivers/net/wireless/mediatek/mt76/mt76.h     | 12 +++++-----
 .../net/wireless/mediatek/mt76/mt7603/init.c  | 19 +++++++++++++--
 .../net/wireless/mediatek/mt76/mt76x02_util.c | 16 ++++++-------
 4 files changed, 43 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index d03aedc3286b..20b2423efc19 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -84,18 +84,18 @@ static const struct ieee80211_tpt_blink mt76_tpt_blink[] = {
 };
 
 struct ieee80211_rate mt76_rates[] = {
-	CCK_RATE(0, 10),
-	CCK_RATE(1, 20),
-	CCK_RATE(2, 55),
-	CCK_RATE(3, 110),
-	OFDM_RATE(11, 60),
-	OFDM_RATE(15, 90),
-	OFDM_RATE(10, 120),
-	OFDM_RATE(14, 180),
-	OFDM_RATE(9,  240),
-	OFDM_RATE(13, 360),
-	OFDM_RATE(8,  480),
-	OFDM_RATE(12, 540),
+	CCK_RATE(0, 10, 6),
+	CCK_RATE(1, 20, 6),
+	CCK_RATE(2, 55, 6),
+	CCK_RATE(3, 110, 6),
+	OFDM_RATE(11, 60, 6),
+	OFDM_RATE(15, 90, 6),
+	OFDM_RATE(10, 120, 6),
+	OFDM_RATE(14, 180, 6),
+	OFDM_RATE(9,  240, 6),
+	OFDM_RATE(13, 360, 6),
+	OFDM_RATE(8,  480, 6),
+	OFDM_RATE(12, 540, 6),
 };
 EXPORT_SYMBOL_GPL(mt76_rates);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 25c5ceef5257..e51ab917296d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -755,17 +755,17 @@ enum mt76_phy_type {
 	MT_PHY_TYPE_HE_MU,
 };
 
-#define CCK_RATE(_idx, _rate) {					\
+#define CCK_RATE(_idx, _rate, _offset) {			\
 	.bitrate = _rate,					\
 	.flags = IEEE80211_RATE_SHORT_PREAMBLE,			\
-	.hw_value = (MT_PHY_TYPE_CCK << 8) | (_idx),		\
-	.hw_value_short = (MT_PHY_TYPE_CCK << 8) | (4 + _idx),	\
+	.hw_value = (MT_PHY_TYPE_CCK << (_offset)) | (_idx),		\
+	.hw_value_short = (MT_PHY_TYPE_CCK << (_offset)) | (4 + _idx),	\
 }
 
-#define OFDM_RATE(_idx, _rate) {				\
+#define OFDM_RATE(_idx, _rate, _offset) {			\
 	.bitrate = _rate,					\
-	.hw_value = (MT_PHY_TYPE_OFDM << 8) | (_idx),		\
-	.hw_value_short = (MT_PHY_TYPE_OFDM << 8) | (_idx),	\
+	.hw_value = (MT_PHY_TYPE_OFDM << (_offset)) | (_idx),	\
+	.hw_value_short = (MT_PHY_TYPE_OFDM << (_offset)) | (_idx), \
 }
 
 extern struct ieee80211_rate mt76_rates[12];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/init.c b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
index 031d39a48a55..59f684b08c55 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
@@ -304,6 +304,21 @@ mt7603_init_hardware(struct mt7603_dev *dev)
 	return 0;
 }
 
+static struct ieee80211_rate mt7603_rates[] = {
+	CCK_RATE(0, 10, 8),
+	CCK_RATE(1, 20, 8),
+	CCK_RATE(2, 55, 8),
+	CCK_RATE(3, 110, 8),
+	OFDM_RATE(11, 60, 8),
+	OFDM_RATE(15, 90, 8),
+	OFDM_RATE(10, 120, 8),
+	OFDM_RATE(14, 180, 8),
+	OFDM_RATE(9,  240, 8),
+	OFDM_RATE(13, 360, 8),
+	OFDM_RATE(8,  480, 8),
+	OFDM_RATE(12, 540, 8),
+};
+
 static const struct ieee80211_iface_limit if_limits[] = {
 	{
 		.max = 1,
@@ -541,8 +556,8 @@ int mt7603_register_device(struct mt7603_dev *dev)
 
 	wiphy->reg_notifier = mt7603_regd_notifier;
 
-	ret = mt76_register_device(&dev->mt76, true, mt76_rates,
-				   ARRAY_SIZE(mt76_rates));
+	ret = mt76_register_device(&dev->mt76, true, mt7603_rates,
+				   ARRAY_SIZE(mt7603_rates));
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
index ccdbab341271..70a62bf16425 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -19,14 +19,14 @@ struct ieee80211_rate mt76x02_rates[] = {
 	MT76x02_CCK_RATE(1, 20),
 	MT76x02_CCK_RATE(2, 55),
 	MT76x02_CCK_RATE(3, 110),
-	OFDM_RATE(0, 60),
-	OFDM_RATE(1, 90),
-	OFDM_RATE(2, 120),
-	OFDM_RATE(3, 180),
-	OFDM_RATE(4, 240),
-	OFDM_RATE(5, 360),
-	OFDM_RATE(6, 480),
-	OFDM_RATE(7, 540),
+	OFDM_RATE(0, 60, 8),
+	OFDM_RATE(1, 90, 8),
+	OFDM_RATE(2, 120, 8),
+	OFDM_RATE(3, 180, 8),
+	OFDM_RATE(4, 240, 8),
+	OFDM_RATE(5, 360, 8),
+	OFDM_RATE(6, 480, 8),
+	OFDM_RATE(7, 540, 8),
 };
 EXPORT_SYMBOL_GPL(mt76x02_rates);
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
