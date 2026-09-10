Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00205C79F9F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 18:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y8XjXkTt7OwnBatQHDJ8BB6tv81zJsznjCg93fBi03c=; b=FXGOwi8zi6Oh/uEXSJSXbFwEJG
	24+gDp2gZ1aPkQczjgLrm44UeSztS6Bo5M/gwxG0iWvtgu1rPUOY2uotjp1TuELTtJuBEtmBJUHvh
	2p3LjS4IzsXhLL+kK8VOq7o5PGGF4RR7fmAHrFNMP8BB8OYwptM+8+OPz3wEtNjgN39TBKCDj5+I8
	PqwggOHtzxkJzbpoMx9Qp1BUJaXGDUXv/4NX595ULhUW39lcmnulAH0BGYSI0K6k3Gcjyflk7u439
	6nE5yT3o1I8czsh38cEqHIK+UgavYO1KkAMG72Bszuv3QzHcJSf4J4zZ2naLplFl0Mak71AuxZ2XZ
	ST0NykyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jSZ-0000000F96P-0M9q;
	Thu, 10 Sep 2026 18:25:19 +0000
Received: from out-71.mta0.migadu.com ([2001:41d0:1004:224b::47] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jSV-0000000F95n-3KCc
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 18:25:18 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Unzddf307mAvMOURKnhmf+KWoikvjT9ZPBPAxTwAQAE=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789064709; v=1; x=1789669509;
 b=JmpqVa2PZ4+Qp/nd4bxw0YWMj2QpHvMinnwo6iVSWfGk3oUkATLTEhNdyD492m4peGEVD7V3
 9fh7GMmpK53ghysOEcifvmT4Gq4kLej7hvX5GWerFuIIwwK/lzZpq6gzEQtDLOwFrgozKtrJWKd
 6XDbpJPr8fDThELdkkSaRtxEt3PQbsnbeJ+84ndhv5v7zMMX+W3y7lT5tKCafJ/xx5pGff/ZWfh
 S9DlObe5gu/PCgVIYgWCMC+0lO0vy7lrDSvlP66vO9WhLcrtz8cWS8F6Se1NC4UhfqxRBuUDKAc
 ZJMyesP85PIQlk+17cRyOjSzb5fdYcJ6ypfzVnHP6BSPw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 424bc7d2cbc17b05;
	Thu, 10 Sep 2026 18:24:59 +0000
X-Mizu-Trace-ID: 424bc7d2cbc17b05
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless] wifi: mt76: mt7925: cancel mlo_pm_work on the USB stop path
Date: Thu, 10 Sep 2026 11:24:57 -0700
Message-ID: <20260910182457.35209-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_112516_576595_B4428F80 
X-CRM114-Status: GOOD (  10.12  )
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

81faf578320d added the cancel to mt7925_ops, but it never reaches USB.
mt7925u_probe() takes its own copy of the ops and points .stop back at the
shared mt792x handler, which cancels mac_work, ps_work, wake_work and
reset_work and knows nothing about mlo_pm_work. So the work still outlives
teardown there. The last line of that commit message says it covers both
buses. That's mine and it's a boo-boo.

Give the USB path its own stop that cancels the work first.

Two-link MLO on a Netgear A9000, work armed with a power-save change, then
the interface brought down:

                   stock    patched
    stop ran        3/3      3/3
    work still ran  3/3      0/3

Skipping the stop leaves both builds running the work, so the zero is the
cancel and not a setup that failed.

Fixes: 276a56883257 ("wifi: mt76: mt7925: update the power-saving flow")
Cc: stable@vger.kernel.org
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index 1757023..db6fd01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -147,6 +147,15 @@ out:
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

