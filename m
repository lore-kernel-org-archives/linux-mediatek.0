Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B610C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yb6TSg1odExnNfcDJVYvjtcC3cuBiX2NF48eWa42adw=; b=Kuz1FQuzNUGCw/
	FKT+632VpWkhi31TTfG4HnOXBiQRiwRASXAFro6u/gVBHTB7mYAO4ZCo0HkYPzyTz8doTLupZcK4o
	p0JmcEQ+a0MKmCWMps/zgKCnC0eWHE3PNVUdAaXeKG48/Rgd1mbGyMH77vHpFmTkIzhyWvUJ8bEiB
	FmSlVEMENoMYELQ1cu4EZrv9HAI5SU7hcEcrjdKeff2p1iGCozd76YSPPVD4ABF7wZrt3c3+Vgjwr
	HDea2Rzz/CPWBBzornh7CllXHvCiw/6SnNE915VULH3Lp08ZjuID5jF9oLc7zDjCQth9LT8Zjssqt
	f0Kyu5liS1ycYo5R3okA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmWoQ-00Efkz-Pr; Thu, 05 May 2022 08:26:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmWoL-00Efgp-9k
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 08:26:11 +0000
X-UUID: 7be5ea364a534e7fa734d7db038f84b2-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c0781e6d-931b-42ff-84f2-e0ada57ed5d0, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:a7294b16-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 7be5ea364a534e7fa734d7db038f84b2-20220505
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chui-hao.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1151993428; Thu, 05 May 2022 01:25:59 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 01:25:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 16:25:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 5 May 2022 16:25:56 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
 <ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH 4/4] mt76: mt7915: limit minimum twt duration
Date: Thu, 5 May 2022 16:25:54 +0800
Message-ID: <20220505082554.16656-4-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220505082554.16656-1-chui-hao.chiu@mediatek.com>
References: <20220505082554.16656-1-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_012609_506196_B83B32F1 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

The minimum twt duration supported by mt7915 is 64 according to hardware
design. Reply station with TWT_SETUP_CMD_DICTATE if min_twt_dur smaller
than 64.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index ff60a3d2d26d..e912ecacb578 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -2633,6 +2633,7 @@ void mt7915_mac_add_twt_setup(struct ieee80211_hw *hw,
 			      struct ieee80211_sta *sta,
 			      struct ieee80211_twt_setup *twt)
 {
+#define MT7915_MIN_TWT_DUR 64
 	enum ieee80211_twt_setup_cmd setup_cmd = TWT_SETUP_CMD_REJECT;
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 	struct ieee80211_twt_params *twt_agrt = (void *)twt->params;
@@ -2654,6 +2655,12 @@ void mt7915_mac_add_twt_setup(struct ieee80211_hw *hw,
 	if (hweight8(msta->twt.flowid_mask) == ARRAY_SIZE(msta->twt.flow))
 		goto unlock;
 
+	if (twt_agrt->min_twt_dur < MT7915_MIN_TWT_DUR) {
+		setup_cmd = TWT_SETUP_CMD_DICTATE;
+		twt_agrt->min_twt_dur = MT7915_MIN_TWT_DUR;
+		goto unlock;
+	}
+
 	flowid = ffs(~msta->twt.flowid_mask) - 1;
 	le16p_replace_bits(&twt_agrt->req_type, flowid,
 			   IEEE80211_TWT_REQTYPE_FLOWID);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
