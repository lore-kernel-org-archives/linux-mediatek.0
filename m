Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD006C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:20:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A475860EFE
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A475860EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQaYkB9CGETT3myjRS0sGTEGgJKYyDRWrcg5FyM9AAE=; b=Sx2qKXC7CVubtA
	WWu+L318lQ44czdfNp9pJP+AcZXrtb9SF28MZvx5ERLh1SmyKpSnnHEU5T2sWtDD/XLyFmEYTtvY5
	2N7ENF4Or4RWYn01CdDLYThjUhjDYD8qfwBZDa8o+kBXiyiXIAjFoAgXmf9KJy8MRqN/XG3aEMeL/
	XjvC+vq5mM3JRhvKYWepXEVE6mJHR5jELtoketpzrOmZmYZpuuWQ7bHdI4IT8C38TRFXIcW02thhX
	r0v5YRGe5NLqcfezW5T7p6MSH2SVmoQ8PT/bgH9T3p8Tp+ZzAnRoi3lxu1zpET+HK/KghYXRUw5hE
	KEhCZghlzO3mGf5pnV7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mff6B-004PIB-Rt; Wed, 27 Oct 2021 09:19:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mff66-004PF0-NJ
 for linux-mediatek@lists.infradead.org; Wed, 27 Oct 2021 09:19:52 +0000
X-UUID: 0903691f88b44aa891f3b09834556b8b-20211027
X-UUID: 0903691f88b44aa891f3b09834556b8b-20211027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1967587957; Wed, 27 Oct 2021 02:19:45 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Oct 2021 02:09:47 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Oct 2021 16:40:37 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 27 Oct 2021 16:40:37 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH 09/11] mt76: mt7915: update mt7915_chan_mib_offs for mt7916
Date: Wed, 27 Oct 2021 16:40:17 +0800
Message-ID: <175d571e0c16287c1d7b57d60340497a8cfb2ddb.1635323366.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1635323366.git.Bo.Jiao@mediatek.com>
References: <cover.1635323366.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_021950_788114_150E080D 
X-CRM114-Status: GOOD (  12.57  )
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
index b60b4b2..dcd8939 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3794,19 +3794,24 @@ int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy)
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
index e9f39ed..22b0e85 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -182,10 +182,16 @@ struct mt7915_mcu_mib {
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
