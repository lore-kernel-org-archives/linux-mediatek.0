Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E545C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 02:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5dO3QXKW+EMNPFgq+OsEV+dOpiDKa/M7a/eaue4TI8=; b=ZZrZMVTf3Tr5ua
	LbLDtJhUh30bqknEgWeQO5aeiaWVUHzG8XmEwaHr6ensAslYt7GyFc5xJw+i5mraFSwXfGK0z/wM8
	N1STvlcSzUrETaRp51BzfG/xe0swXDk3EMaewNvLiKmMioEyy4EsdOF6pbfW4ldT7LL0RIrswxkUZ
	BlTqZSjSt3huFne3+T89PjffSZoS8NMNgLfAfXKoQs06nM4ap0JL9qDEASogwFhq3EHU54P+Zfk3e
	mwdShENH3OKXJBKxRUUBm3WRmOGGyXOve++/cqbfy38xfT8hfJG1tMmfM3aTTRvoTGb2e82tIxZPI
	NxTaAsVhZ3F3xIE1GJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mz8LK-000CQB-7S; Mon, 20 Dec 2021 02:24:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mz8LA-000CG9-9I
 for linux-mediatek@lists.infradead.org; Mon, 20 Dec 2021 02:23:53 +0000
X-UUID: 2bd56c836176465e8754f9df36656591-20211219
X-UUID: 2bd56c836176465e8754f9df36656591-20211219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 443554036; Sun, 19 Dec 2021 19:23:42 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Dec 2021 18:18:21 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 20 Dec 2021 10:18:15 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 20 Dec 2021 10:18:15 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v4 10/12] mt76: mt7915: update mt7915_chan_mib_offs for mt7916
Date: Mon, 20 Dec 2021 10:18:02 +0800
Message-ID: <66bd0621df3af68d2dce299d7ac2f8c4768d472c.1639965732.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1639965732.git.Bo.Jiao@mediatek.com>
References: <cover.1639965732.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_182352_420238_855562C6 
X-CRM114-Status: GOOD (  12.14  )
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

Update v2 offset. This is an intermediate patch to add mt7916 support.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 13 +++++++++----
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h |  8 +++++++-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 6ea213b..d32fbf6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3818,19 +3818,24 @@ int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy)
 int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch)
 {
 	/* strict order */
-	static const enum mt7915_chan_mib_offs offs[] = {
-		MIB_BUSY_TIME, MIB_TX_TIME, MIB_RX_TIME, MIB_OBSS_AIRTIME
+	static const u32 offs[] = {
+		MIB_BUSY_TIME, MIB_TX_TIME, MIB_RX_TIME, MIB_OBSS_AIRTIME,
+		MIB_BUSY_TIME_V2, MIB_TX_TIME_V2, MIB_RX_TIME_V2,
+		MIB_OBSS_AIRTIME_V2
 	};
 	struct mt76_channel_state *state = phy->mt76->chan_state;
 	struct mt76_channel_state *state_ts = &phy->state_ts;
 	struct mt7915_dev *dev = phy->dev;
 	struct mt7915_mcu_mib *res, req[4];
 	struct sk_buff *skb;
-	int i, ret;
+	int i, ret, start = 0;
+
+	if (!is_mt7915(&dev->mt76))
+		start = 4;
 
 	for (i = 0; i < 4; i++) {
 		req[i].band = cpu_to_le32(phy != &dev->phy);
-		req[i].offs = cpu_to_le32(offs[i]);
+		req[i].offs = cpu_to_le32(offs[i + start]);
 	}
 
 	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_CMD(GET_MIB_INFO),
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 92268e6..c0cc592 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -161,10 +161,16 @@ struct mt7915_mcu_mib {
 } __packed;
 
 enum mt7915_chan_mib_offs {
+	/* mt7915 */
 	MIB_BUSY_TIME = 14,
 	MIB_TX_TIME = 81,
 	MIB_RX_TIME,
-	MIB_OBSS_AIRTIME = 86
+	MIB_OBSS_AIRTIME = 86,
+	/* mt7916 */
+	MIB_BUSY_TIME_V2 = 0,
+	MIB_TX_TIME_V2 = 6,
+	MIB_RX_TIME_V2 = 8,
+	MIB_OBSS_AIRTIME_V2 = 490
 };
 
 struct edca {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
