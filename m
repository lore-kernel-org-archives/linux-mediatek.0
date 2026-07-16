Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65459C4450A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 13:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQXyXktmRwdV28xpGceshEF/JNFts0ziqizCyo4+KEI=; b=QnE6IMgmReFUyujPVrUTGrgLnl
	2rEwblRjyuALUqYWW608mzFe8RBAKJ0fPD1xq1R4L5GOcHXyuos9ABhqBUXOx/kUwtDoUTAk6eYV4
	Xdo7PCLphHMb0aQDz5DjyadaoCsux8iLjzSn/76AQD3rUZLE9HoOm9WGmxUKqPqMCy7X+gQlTKUDb
	OKaKatmlTsTklR7JPA8gY4wrUZjJPiHOql7zWeGGAj0ZUqj9L877DTHtP4IJY3uGOZrG3eY82gTSY
	xKMjugk5BEfGTFOZKsQWY1FnR2cORswujK7XwzIPMjIqLhjv9PH60ULd1K0mAbLubUsYLc0k6h0w+
	12S7f6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMUF-0000000HPjb-0hQR;
	Thu, 16 Jul 2026 13:50:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMUD-0000000HPjI-43E8
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 13:50:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79C97432BD;
	Thu, 16 Jul 2026 13:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35751F00A3A;
	Thu, 16 Jul 2026 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784209849;
	bh=sQXyXktmRwdV28xpGceshEF/JNFts0ziqizCyo4+KEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cHRF9DY7OUMbIUxRihEmpqEfoiWBHuUGaQ43J8L0+mMJWNihEwvSpPVR7ZW74AWrQ
	 QSb2JWtDXAqc9IzHoUr67567XT4qREwC+l4Wxfaxemfv1AOoYwHQgre1xEbDR5dUm9
	 RRzPAbVGMRqWtWuC+PdaUHv4a7T1abVA1KnwtN0o=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Bongani Hlope <developer@hlope.org.za>,
	Arjan van de Ven <arjan@linux.intel.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 7.1 341/518] wifi: mt76: mt7921/mt7925: fix NULL dereference in CSA beacon
Date: Thu, 16 Jul 2026 15:30:09 +0200
Message-ID: <20260716133055.277340106@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716133047.772246337@linuxfoundation.org>
References: <20260716133047.772246337@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

7.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Arjan van de Ven <arjan@linux.intel.com>

[ Upstream commit 351dd7d2c80d23e56dcce6faa4e62bea5b0877c7 ]

This patch is based on a BUG as reported by Bongani Hlope at
https://lore.kernel.org/all/20260502125824.425d7159@bongani-mini.home.org.za/

When a channel-switch announcement (CSA) beacon is received,
cfg80211 queues a wiphy work item that eventually calls
mt7921_channel_switch_rx_beacon(). If the station disconnects
(or the channel context is otherwise torn down) between the
time the work is queued and the time it runs, the driver's
dev->new_ctx pointer can already have been cleared to NULL.
mt7921_channel_switch_rx_beacon() then dereferences new_ctx
unconditionally, triggering a NULL pointer dereference at
address 0x0:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:mt7921_channel_switch_rx_beacon+0x1f/0x100 [mt7921_common]

The same missing guard exists in mt7925_channel_switch_rx_beacon(),
which shares the same code pattern introduced by the same commit.

Add an early-return NULL check for dev->new_ctx in both
mt7921_channel_switch_rx_beacon() and
mt7925_channel_switch_rx_beacon(). When new_ctx is NULL there is
no pending channel switch to process, so returning immediately is
the correct and safe action.

Fixes: 8aa2f59260eb ("wifi: mt76: mt7921: introduce CSA support")
Reported-by: Bongani Hlope <developer@hlope.org.za>
Oops-Analysis: http://oops.fenrus.org/reports/lkml/20260502125824.425d7159@bongani-mini.home.org.za/report.html
Link: https://lore.kernel.org/all/20260502125824.425d7159@bongani-mini.home.org.za/
Signed-off-by: Arjan van de Ven <arjan@linux.intel.com>
Cc: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>
Link: https://patch.msgid.link/20260504145107.1329197-1-arjan@linux.intel.com
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 3d74fabe74085e..a326f4c95c7c86 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1508,6 +1508,9 @@ static void mt7921_channel_switch_rx_beacon(struct ieee80211_hw *hw,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	u16 beacon_interval = vif->bss_conf.beacon_int;
 
+	if (!dev->new_ctx)
+		return;
+
 	if (cfg80211_chandef_identical(&chsw->chandef,
 				       &dev->new_ctx->def) &&
 				       chsw->count) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 79cc30a3b29efc..9dc5ee51eb9f96 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2403,6 +2403,9 @@ static void mt7925_channel_switch_rx_beacon(struct ieee80211_hw *hw,
 	if (ieee80211_vif_is_mld(vif))
 		return;
 
+	if (!dev->new_ctx)
+		return;
+
 	beacon_interval = vif->bss_conf.beacon_int;
 
 	if (cfg80211_chandef_identical(&chsw->chandef,
-- 
2.53.0




