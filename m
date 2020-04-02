Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D7EC2BA15
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 13:08:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20D7320678
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 13:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ODOOp3/s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZ0L0PG+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20D7320678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/lHMdjYU9MKdIiQkeOccm27xEJfztQ+6J16hmwZ9bE=; b=ODOOp3/skwExSe
	5XzvnT80C4py03G68+A8aS39z0eTuZxK+0CR0zDu6RxNueNU/CHJcGCn01eh+aNIdsf1BPZFyOTzh
	ibsJuqjI6ERtm2t0TelQxFLUA/KpabuJR4bAL0zk1zLg10P+4YCwudscL80LN8FjNHWr6BuchtMQQ
	MeOQG9LPGAy6sa15yUMCX7gYgYeONbArSCK6fT376uzFPpjb4Ez+VD9YH5S7vMVNwUxW/BQLlspgZ
	Ob1Q79eA9/E8P7CBJ0H58VpxRSwdZxIi4Yh9tTeS1peJ1ihYeYXjbhSawk8Omm2/G6D7Gtv2/ZJCg
	8ZA6lBe32TFTt+zBf+9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJzZq-0005Au-Tr; Thu, 02 Apr 2020 13:08:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJzZo-00056C-1c
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 13:08:09 +0000
Received: from localhost.localdomain.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 612DA20757;
 Thu,  2 Apr 2020 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585832887;
 bh=qY1kduqfBx12lV0XczVCmm5xVfKRUZ4bGDEtw6uGdgE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qZ0L0PG+LC/OxsFgOrhikRphaXRrQaBY2KGdQ9tyxGQ9pc0nkLdd4XQ/29/jh+D2l
 pdMhwtgVW+b0G8rJQa0NSTEUrNcxVQwHoSWCWDg+NULHyAT4DMCQlQdh7RMQby8NHo
 nrqsYs5abgqaYKL8O5OJLYQqyk22ArPmohgEAx5Q=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 10/12] mt76: mt7615: introduce BSS absence event
Date: Thu,  2 Apr 2020 15:06:40 +0200
Message-Id: <87d37ce29bebfaa89aba0609cc0c07b0b514f785.1585832459.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585832458.git.lorenzo@kernel.org>
References: <cover.1585832458.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_060808_139295_5BFEEA24 
X-CRM114-Status: UNSURE (   9.18  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Introduce BSS absence event that is reported when the fw
is leaving or entering current operational channel.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 24 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  8 +++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 193808cca905..5385d16e435d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -339,6 +339,26 @@ mt7615_mcu_scan_event(struct mt7615_dev *dev, struct sk_buff *skb)
 				     MT7615_HW_SCAN_TIMEOUT);
 }
 
+static void
+mt7615_mcu_bss_event(struct mt7615_dev *dev, struct sk_buff *skb)
+{
+	struct mt7615_mcu_bss_event *event;
+	struct mt76_phy *mphy;
+
+	event = (struct mt7615_mcu_bss_event *)(skb->data +
+						sizeof(struct mt7615_mcu_rxd));
+
+	if (event->bss_idx && dev->mt76.phy2)
+		mphy = dev->mt76.phy2;
+	else
+		mphy = &dev->mt76.phy;
+
+	if (event->is_absent)
+		ieee80211_stop_queues(mphy->hw);
+	else
+		ieee80211_wake_queues(mphy->hw);
+}
+
 static void
 mt7615_mcu_rx_unsolicited_event(struct mt7615_dev *dev, struct sk_buff *skb)
 {
@@ -352,6 +372,9 @@ mt7615_mcu_rx_unsolicited_event(struct mt7615_dev *dev, struct sk_buff *skb)
 	case MCU_EVENT_SCAN_DONE:
 		mt7615_mcu_scan_event(dev, skb);
 		return;
+	case MCU_EVENT_BSS_ABSENCE:
+		mt7615_mcu_bss_event(dev, skb);
+		break;
 	default:
 		break;
 	}
@@ -367,6 +390,7 @@ void mt7615_mcu_rx_event(struct mt7615_dev *dev, struct sk_buff *skb)
 	    rxd->ext_eid == MCU_EXT_EVENT_ASSERT_DUMP ||
 	    rxd->ext_eid == MCU_EXT_EVENT_PS_SYNC ||
 	    rxd->eid == MCU_EVENT_SCHED_SCAN_DONE ||
+	    rxd->eid == MCU_EVENT_BSS_ABSENCE ||
 	    rxd->eid == MCU_EVENT_SCAN_DONE ||
 	    !rxd->seq)
 		mt7615_mcu_rx_unsolicited_event(dev, skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 7e55da2b6573..e6a927fd209f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -82,6 +82,7 @@ enum {
 	MCU_EVENT_ACCESS_REG = 0x02,
 	MCU_EVENT_MT_PATCH_SEM = 0x04,
 	MCU_EVENT_SCAN_DONE = 0x0d,
+	MCU_EVENT_BSS_ABSENCE  = 0x11,
 	MCU_EVENT_CH_PRIVILEGE = 0x18,
 	MCU_EVENT_SCHED_SCAN_DONE = 0x23,
 	MCU_EVENT_EXT = 0xed,
@@ -398,6 +399,13 @@ struct nt7615_sched_scan_done {
 	__le16 pad;
 } __packed;
 
+struct mt7615_mcu_bss_event {
+	u8 bss_idx;
+	u8 is_absent;
+	u8 free_quota;
+	u8 pad;
+} __packed;
+
 /* offload mcu commands */
 enum {
 	MCU_CMD_START_HW_SCAN = MCU_CE_PREFIX | 0x03,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
