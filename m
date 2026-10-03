Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452ACCA5FDD
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2026 23:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=31HyEI551z0b+UDEBr/vRbFkDuTaJ+xJQ1ApwEyzTGc=; b=wfgIc/OWBwXjPs+BJRiO/nJXKn
	si7HcV5iAJodfSCUblUypCyf40U2/vVRcL1n2SHFeEFJ/gy+nkcaP/7SFZVKN0mprkSa8K50a1oZA
	1M5IARQXTPtdtGvBYp8BtgJQhaCFDYRIl8H2utWXTMjU41oFivyQNc2kEe9zP5kl5SwbgCrTEOm8P
	TJIj6CklFrW/Z8P/bWHS7wlufuglpI6mUOVTEBHCXKElLeoM/BSeqlarEcIhNluDOB+wKes+0wr8m
	VrrnB+z/OMh9wba8+ADNgh1c4GgaeW5SnY0Zftywp9yNMfPUMfs787BalTofGqo+47qzfXLECdmq0
	Pdo6gY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD9US-0000000EBQY-1FLo;
	Sat, 03 Oct 2026 23:50:04 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD9UO-0000000EBPt-33kk
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Oct 2026 23:50:02 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=xl4GPcatPDKKUjDT7CDuYUyfau6OOsS9xvgfmbROSqc=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791071397; v=1; x=1791676197;
 b=PQbZknVu9G/tPctE/quZ1qGAi0Ea4d6lcvmy7irIHxJ3j84en/cOfsnqcH3MJAonsjikZm4b
 k8m4n5hd8Fvoc0SjsvZ3tRpSYA2oj5WZk7LSLLW/DAgy3VDSEdkYt2gTB+5fPxukd3azwfK/cqo
 pWPkVwWlJp7zf6CJpv/pwoKUtrVFZuv313IZXUIvJa6yY9RRu2fVUjgKueR0dHlwuAPvAHPFscc
 VW5P7E8qLg4iG6pdrwQsT4HSnhm/kEZyRMDOSeoCIH8F2tLoigFO/88BuKmcBSTTdIZGWhqtQu3
 RnBsaP4Ofc22QS8YasDklR+3vUasTpryYQ/MFfDbvV9MQ==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b4c22351e5f5a4a7;
	Sat, 03 Oct 2026 23:49:47 +0000
X-Mizu-Trace-ID: b4c22351e5f5a4a7
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH RESEND wireless] wifi: mt76: mt7925: cancel mlo_pm_work on the USB stop path
Date: Sat,  3 Oct 2026 16:49:44 -0700
Message-ID: <20261003234944.96066-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_165001_079832_30AB2190 
X-CRM114-Status: UNSURE (   9.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Every other teardown path cancels this work, PCIe unbind included. USB
unbind does not: PCIe has its own unregister hook for it, while USB
shares a generic one and the stop callback that would have covered it is
replaced in probe.

That cancel came in commit 81faf578320d ("wifi: mt76: mt7925: cancel
mlo_pm_work on stop"), whose last line says it covers both buses. That's
mine and it's a boo-boo.

Give the USB path its own stop that cancels the work first.

Two-link MLO on a Netgear A9000, work armed then the interface down:

                   stock    patched
    stop ran        3/3      3/3
    work still ran  3/3      0/3

Skipping the stop entirely leaves both builds running it, so the zero is
the cancel.

Fixes: 276a56883257 ("wifi: mt76: mt7925: update the power-saving flow")
Cc: stable@vger.kernel.org
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt7925/usb.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index 1757023ea70d..db6fd014447b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -147,6 +147,15 @@ static int mt7925u_mac_reset(struct mt792x_dev *dev)
 	return err;
 }
 
+static void mt7925u_stop(struct ieee80211_hw *hw, bool suspend)
+{
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+
+	cancel_delayed_work_sync(&dev->mlo_pm_work);
+
+	mt792xu_stop(hw, suspend);
+}
+
 static int mt7925u_probe(struct usb_interface *usb_intf,
 			 const struct usb_device_id *id)
 {
@@ -193,7 +202,7 @@ static int mt7925u_probe(struct usb_interface *usb_intf,
 	if (!ops)
 		return -ENOMEM;
 
-	ops->stop = mt792xu_stop;
+	ops->stop = mt7925u_stop;
 
 	mdev = mt76_alloc_device(&usb_intf->dev, sizeof(*dev), ops, &drv_ops);
 	if (!mdev)
-- 
2.55.0


