Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D389BC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 17:52:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8626D610A4
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 17:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8626D610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I3BVp9iFvUTP6pbh/NzTjR2vbj16P9DV091wh+A56ug=; b=uq0ihHy1bRUw1d
	R+nuZWVXz4Y2HhGwsylmB1Ckix3hJ5yyJ+JeIpmbWVwR+3c+IzDItphXUqWtsxoBQ2zHbj+zoQKgo
	qdldM0fZTU/SMtFRq6UWzXeRZSeRFpXCR4DxpuoloDyiAfbPsBm927+ej6wdJ0SYuQkfQ3+cREwx7
	nBPQUGjR0knjm2CmjBlNPXVQOtJPiLaMrl5LK7/oCQfWsuLJaIUYFevbmPqRdYjVpH94WmhDOAduG
	IPemW6vDoqzUZke9qhm2oT80Y3rr9FlCBcpgshDPnrHMfaem9Dk61jK/BbD0RVi5KePJnEsAnq99x
	1C4qkQWd6WBu0pvHeTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEbLg-00DJ85-Bo; Fri, 13 Aug 2021 17:52:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEbLb-00DJ6u-7B
 for linux-mediatek@lists.infradead.org; Fri, 13 Aug 2021 17:52:03 +0000
X-UUID: e631883c23c541258ab24b781ab9a48a-20210813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1XcrGk1cOS+RXzOb5YCoyNIwp8yqRWJRCTP2k0MqGE8=; 
 b=SqCTLvYbLpUtz4MSE+lUf+o02QPiF5doVP6F28KRfA/zpdtOG3JYHW5qqrSgrmt8IENtxbu+HPgUv6GOdCO9rU9lGh3BrJzfCgLY8yLNydsBjLk9cVjOOEZquIUu2vT07AmWfvEIWXjBtuWqjoX7xzvdBObdTx2XO4Jo2/NB7/s=;
X-UUID: e631883c23c541258ab24b781ab9a48a-20210813
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 3590874; Fri, 13 Aug 2021 10:51:53 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 10:51:52 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 14 Aug 2021 01:51:50 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 14 Aug 2021 01:51:50 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mt76: mt7921: fix kernel warning from
 cfg80211_calculate_bitrate
Date: Sat, 14 Aug 2021 01:51:48 +0800
Message-ID: <e0389646cd508d9a5c7055eb85c44cc459cdf59d.1628876256.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_105159_318976_3BBEBCA3 
X-CRM114-Status: GOOD (  12.77  )
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

Fix the kernel warning from cfg80211_calculate_bitrate
due to the legacy rate is not parsed well in current driver.

Also, zeros struct rate_info before we fill it out to avoid the old value
is kept such as rate->legacy.

[  790.921560] WARNING: CPU: 7 PID: 970 at net/wireless/util.c:1298 cfg80211_calculate_bitrate+0x354/0x35c [cfg80211]
[  790.987738] Hardware name: MediaTek Asurada rev1 board (DT)
[  790.993298] pstate: a0400009 (NzCv daif +PAN -UAO)
[  790.998104] pc : cfg80211_calculate_bitrate+0x354/0x35c [cfg80211]
[  791.004295] lr : cfg80211_calculate_bitrate+0x180/0x35c [cfg80211]
[  791.010462] sp : ffffffc0129c3880
[  791.013765] x29: ffffffc0129c3880 x28: ffffffd38305bea8
[  791.019065] x27: ffffffc0129c3970 x26: 0000000000000013
[  791.024364] x25: 00000000000003ca x24: 000000000000002f
[  791.029664] x23: 00000000000000d0 x22: ffffff8d108bc000
[  791.034964] x21: ffffff8d108bc0d0 x20: ffffffc0129c39a8
[  791.040264] x19: ffffffc0129c39a8 x18: 00000000ffff0a10
[  791.045563] x17: 0000000000000050 x16: 00000000000000ec
[  791.050910] x15: ffffffd3f9ebed9c x14: 0000000000000006
[  791.056211] x13: 00000000000b2eea x12: 0000000000000000
[  791.061511] x11: 00000000ffffffff x10: 0000000000000000
[  791.066811] x9 : 0000000000000000 x8 : 0000000000000000
[  791.072110] x7 : 0000000000000000 x6 : ffffffd3fafa5a7b
[  791.077409] x5 : 0000000000000000 x4 : 0000000000000000
[  791.082708] x3 : 0000000000000000 x2 : 0000000000000000
[  791.088008] x1 : ffffff8d3f79c918 x0 : 0000000000000000
[  791.093308] Call trace:
[  791.095770]  cfg80211_calculate_bitrate+0x354/0x35c [cfg80211]
[  791.101615]  nl80211_put_sta_rate+0x6c/0x2c0 [cfg80211]
[  791.106853]  nl80211_send_station+0x980/0xaa4 [cfg80211]
[  791.112178]  nl80211_get_station+0xb4/0x134 [cfg80211]
[  791.117308]  genl_rcv_msg+0x3a0/0x440
[  791.120960]  netlink_rcv_skb+0xcc/0x118
[  791.124785]  genl_rcv+0x34/0x48
[  791.127916]  netlink_unicast+0x144/0x1dc

Fixes: 1c099ab44727 ("mt76: mt7921: add MCU support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index cadb633639d3..27317c121256 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -328,14 +328,15 @@ mt7921_mcu_tx_rate_parse(struct mt76_phy *mphy,
 			 struct rate_info *rate, u16 r)
 {
 	struct ieee80211_supported_band *sband;
-	u16 flags = 0;
+	u16 flags = 0, rate_idx;
 	u8 txmode = FIELD_GET(MT_WTBL_RATE_TX_MODE, r);
 	u8 gi = 0;
 	u8 bw = 0;
+	bool cck = false;
 
+	memset(rate, 0, sizeof(*rate));
 	rate->mcs = FIELD_GET(MT_WTBL_RATE_MCS, r);
 	rate->nss = FIELD_GET(MT_WTBL_RATE_NSS, r) + 1;
-
 	switch (peer->bw) {
 	case IEEE80211_STA_RX_BW_160:
 		gi = peer->g16;
@@ -357,13 +358,18 @@ mt7921_mcu_tx_rate_parse(struct mt76_phy *mphy,
 
 	switch (txmode) {
 	case MT_PHY_TYPE_CCK:
+		cck = true;
+		fallthrough;
 	case MT_PHY_TYPE_OFDM:
 		if (mphy->chandef.chan->band == NL80211_BAND_5GHZ)
 			sband = &mphy->sband_5g.sband;
 		else
 			sband = &mphy->sband_2g.sband;
 
-		rate->legacy = sband->bitrates[rate->mcs].bitrate;
+		rate_idx = FIELD_GET(MT_TX_RATE_IDX, r);
+		rate_idx = mt76_get_rate(mphy->dev, sband, rate_idx,
+					 cck);
+		rate->legacy = sband->bitrates[rate_idx].bitrate;
 		break;
 	case MT_PHY_TYPE_HT:
 	case MT_PHY_TYPE_HT_GF:
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
