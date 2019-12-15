Return-Path: <SRS0=PXBb=2F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493C0C2D0C8
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 04:07:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EE9D206DA
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 04:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X+b1E6Xw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uUY41+Ur"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EE9D206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3CHAZHJN5Rj9bau3VlmNdLX19hjpEsSVINeIsxj5HM=; b=X+b1E6XwcrBgJd
	iiECSU8gAaaUdY2eFx1QrlbWgmwzQRotSSjNL9c3foEcB00sdGrkmy0bCxMh5Qk6yfTkCIXst6c33
	UzDfAt7QIXuaBzR3e/BAnrqWM1ZSEjXRXhz+lJp/6DH+CE1IrtVpCYiFY/202ELwgRmOMHybP6/Ar
	TG6jIfXnCMLemytD5TznbpEVFZ7sDhJmSRFWVfIlHJWC7OY61pZZdGMpY3wM+To8h7tTyYoZGxln6
	6S8u3K4ERWooJV3lnk/Y4c1pftuFAjM3AGvTWCzww9enZpfy9PVZ7e6TndexjNDiylm+Bo3155Zcn
	UHO4R2psB6lYmk/9ERjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igLBF-0002Pc-Pz; Sun, 15 Dec 2019 04:06:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igLB8-0002Mq-Qp
 for linux-mediatek@lists.infradead.org; Sun, 15 Dec 2019 04:06:52 +0000
X-UUID: 8da42326be3349a68e9874407e7e7933-20191214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=94xcQ2Z3dMqXswcxMI8M18CsZNx5V6+VkyJZm38GJdA=; 
 b=uUY41+UrIUsJD9U5yXPSLy+IdtrFHEFkBi8+ApwUVZ9pQy8NhnzQwVEHFbEkiqmwk9M6DDtuSbG6ZD7/Txvuv6VJiGzYvKH1ZhHqCcI1PCYk1RPsvaUInLceVV7luVe1UQL8c4dfp4pIq+vtPhciOjVoDb3xOtnj2IuoLJRCH6Q=;
X-UUID: 8da42326be3349a68e9874407e7e7933-20191214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1721690777; Sat, 14 Dec 2019 20:06:39 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 14 Dec 2019 19:56:55 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 15 Dec 2019 11:56:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sun, 15 Dec 2019 11:56:22 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/2] mt76: mt7615: add set_antenna callback
Date: Sun, 15 Dec 2019 11:56:32 +0800
Message-ID: <6b3ac6736c0cfa12492f383ec9cfcaad91bfb965.1576381077.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <d3d47e29e2a39c42adfcf912a27b9d19a01d5010.1576381077.git.ryder.lee@mediatek.com>
References: <d3d47e29e2a39c42adfcf912a27b9d19a01d5010.1576381077.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 57E95DD40047F0123CF19775E0D27F7C3250BF6C281BF99FAF626FD033563F632000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191214_200646_882094_4A499BFF 
X-CRM114-Status: UNSURE (   7.27  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Roy Luo <royluo@google.com>, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a set_antenna callback to setup per phy tx/rx streams.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 759a66997c6f..70791544a088 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -48,6 +48,8 @@ static int mt7615_start(struct ieee80211_hw *hw)
 		mt7615_mcu_set_mac_enable(dev, 1, true);
 	}
 
+	mt7615_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
+
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 
 	if (running)
@@ -635,6 +637,33 @@ mt7615_set_coverage_class(struct ieee80211_hw *hw, s16 coverage_class)
 	mt7615_mac_set_timing(phy);
 }
 
+static int
+mt7615_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
+{
+	struct mt7615_dev *dev = mt7615_hw_dev(hw);
+	struct mt7615_phy *phy = mt7615_hw_phy(hw);
+	int max_nss = hweight8(hw->wiphy->available_antennas_tx);
+	bool ext_phy = phy != &dev->phy;
+
+	if (!tx_ant || tx_ant != rx_ant || ffs(tx_ant) > max_nss)
+		return -EINVAL;
+
+	if ((BIT(hweight8(tx_ant)) - 1) != tx_ant)
+		tx_ant = BIT(ffs(tx_ant) - 1) - 1;
+
+	mutex_lock(&dev->mt76.mutex);
+
+	phy->mt76->antenna_mask = tx_ant;
+	phy->chainmask = ext_phy ? tx_ant << 2 : tx_ant;
+
+	mt76_set_stream_caps(&dev->mt76, true);
+	mt7615_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
+
+	mutex_unlock(&dev->mt76.mutex);
+
+	return 0;
+}
+
 const struct ieee80211_ops mt7615_ops = {
 	.tx = mt7615_tx,
 	.start = mt7615_start,
@@ -659,5 +688,6 @@ const struct ieee80211_ops mt7615_ops = {
 	.channel_switch_beacon = mt7615_channel_switch_beacon,
 	.get_survey = mt76_get_survey,
 	.get_antenna = mt76_get_antenna,
+	.set_antenna = mt7615_set_antenna,
 	.set_coverage_class = mt7615_set_coverage_class,
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
