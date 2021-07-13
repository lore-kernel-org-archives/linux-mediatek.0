Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC58CC07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 20:16:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 962E561351
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 20:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 962E561351
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ccJwtveIJ6fJaARhxIBek9QHurJHGajYlHnAMWWs24=; b=B8urwXeywJdu8e
	NHnmllKxyNCHELgzQiV/SsqvvSaQDkFk1HPyt1IqXL0ygAKozBSdRpF3M5PJ1WinAdKKBmGiwv3eu
	yNWZWn7AEgx8aKa1E99MCcXFqOqdpB1wKCjPlq6PB3pzNvW2i1jNjSrQW4eChOknb0ZU1QdiHcF7l
	iJ7N7MczGmiFl7oueFDSgjSAt9q4dDgiHFtJXb2jJHmxC5nV8Ug+g2YCUWwXDO56d9mxDZGjBH9lv
	KHWyK4EpwJCtjJI59GjPkivGAoiHlOMifWjgR6cxPz6vduAZOmbOFD+fiVo/9Zrmt5UbOJ+9BT9T7
	SsoNJSzXMUYqnbsoQGkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3OpQ-00BIAZ-DJ; Tue, 13 Jul 2021 20:16:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3OpO-00BI8I-AM
 for linux-mediatek@lists.infradead.org; Tue, 13 Jul 2021 20:16:27 +0000
X-UUID: 7034ef2805cc4009a34fffb7f7225aa5-20210713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jpdFWpmKuOmAuiGW5WC8E84plpAbPLQtF//9P+m8Lqo=; 
 b=CAqNevK5/2ekgcsyu38ekU8mN/ZVl+5UwkOEFaZVgJrNxbfgQdSiqfgMYKOPVn/S2SAYuPXTiv30NMKWrb4Jhfzlx/I1IMqQYmHSIYiwteSba94HWN2JDRVRG53XkOoogiRvBa6KnOi/88Ltm0abmJnm5ETxdawW898+yptcvPQ=;
X-UUID: 7034ef2805cc4009a34fffb7f7225aa5-20210713
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1051685400; Tue, 13 Jul 2021 13:16:22 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 13:16:21 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 04:16:07 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Jul 2021 04:16:08 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 4/4] mt76: mt7915: fix mgmt frame using unexpected bitrate
Date: Wed, 14 Jul 2021 04:16:01 +0800
Message-ID: <e3599d52e8bd3fa590976fd047584c36c34ab412.1626207204.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <92a8ecfdf198b34f98d5c1489a83adf151657760.1626207204.git.objelf@gmail.com>
References: <92a8ecfdf198b34f98d5c1489a83adf151657760.1626207204.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_131626_384529_0098E3EB 
X-CRM114-Status: GOOD (  12.92  )
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

Fix the current driver mgmt frame is not respecting the basic rates field
provided by the AP and then unconditionally is using the lowest (1 or 6
Mbps) rate.

For example, if the AP only supported basic rate {24, 36, 48, 54} Mbps,
mt7921 cannot send mgmt frame with the rate not in the group. So,
instead, we pick up the lowest basic rate the AP can support to send.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Suggested-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v3: created in v3 to solve the same issue found in mt7921.
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c    | 5 +----
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h | 2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 2462704094b0..b48249518459 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -979,10 +979,7 @@ void mt7915_mac_write_txwi(struct mt7915_dev *dev, __le32 *txwi,
 		/* hardware won't add HTC for mgmt/ctrl frame */
 		txwi[2] |= cpu_to_le32(MT_TXD2_HTC_VLD);
 
-		if (mphy->chandef.chan->band == NL80211_BAND_5GHZ)
-			rate = MT7915_5G_RATE_DEFAULT;
-		else
-			rate = MT7915_2G_RATE_DEFAULT;
+		rate = mt76_default_basic_rate(mphy, vif);
 
 		val = MT_TXD6_FIXED_BW |
 		      FIELD_PREP(MT_TXD6_TX_RATE, rate);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 3f613fae6218..b41a31ad316d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -36,8 +36,6 @@
 
 #define MT7915_CFEND_RATE_DEFAULT	0x49	/* OFDM 24M */
 #define MT7915_CFEND_RATE_11B		0x03	/* 11B LP, 11M */
-#define MT7915_5G_RATE_DEFAULT		0x4b	/* OFDM 6M */
-#define MT7915_2G_RATE_DEFAULT		0x0	/* CCK 1M */
 
 #define MT7915_THERMAL_THROTTLE_MAX	100
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
