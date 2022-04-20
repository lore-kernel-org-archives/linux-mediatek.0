Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F53C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 04:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e5I0D4vYnOzDEK0u+7c0KOF8YJXA1qUmgLMAL5CX3eE=; b=jD1ixZbZyqjOGi
	vtrTNPT47+h8EC+MiP/5oh7oBPXaE6L+fO0g45/YMn1QBQYIw6socaDpjeo2gBCUks5nlE3J+r52Q
	lBgTwseJDekykdFFZACmXN27sW/1KFTyqocblDpkem1iNTiqXYyAHHxEZ32JyeCIjMD5LJynprssu
	62iFtkgGtUqLxPZEM5HXctTuFqTidLyAD8AsHmyOSlacy08LBQhsKQO/ROFNjiSAsW6T0ail1zhu8
	HSmzkMkS6X4y9htsuA7eY378zOSWVxCwLeJslv7/sa9qciHeWhN6PSi9vDL28aydQnLeJL6LwiN3M
	BQ3CJEu+Pb0q4Dh3YImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh1fb-007DUX-GL; Wed, 20 Apr 2022 04:10:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh1fY-007DTA-Kr
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 04:10:22 +0000
X-UUID: 10daa73be53045818f81435c649779a9-20220419
X-UUID: 10daa73be53045818f81435c649779a9-20220419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 432333485; Tue, 19 Apr 2022 21:10:09 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Apr 2022 21:03:51 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Apr 2022 12:03:49 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 20 Apr 2022 12:03:48 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Bo Jiao
 <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: report qos_ctl without ACK policy
Date: Wed, 20 Apr 2022 12:03:46 +0800
Message-ID: <20220420040346.8378-1-bo.jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_211020_731986_B0161658 
X-CRM114-Status: UNSURE (   8.16  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

there is no need to report to the mac80211 layer the ACK policy which may
cause rx out-of-order issue, because the hardware rmac module already handle it

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index b47aea6..5080280 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -675,6 +675,11 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 
 		fc = cpu_to_le16(FIELD_GET(MT_RXD6_FRAME_CONTROL, v0));
 		qos_ctl = FIELD_GET(MT_RXD8_QOS_CTL, v2);
+		/*
+		 * there is no need to report the ACK policy to the
+		 * mac80211 layer, because hw has already processed it.
+		 */
+		qos_ctl &= ~IEEE80211_QOS_CTL_ACK_POLICY_MASK;
 		seq_ctrl = FIELD_GET(MT_RXD8_SEQ_CTRL, v2);
 
 		rxd += 4;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
