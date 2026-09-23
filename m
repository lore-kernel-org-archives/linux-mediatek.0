Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C20DC9830B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 17:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rSVC1PTEQHng6adVNVsxEgGSuZ1aRiSDmwjzL8rlN+0=; b=iPrkKO+QYbMWPuUuyE034LyVlT
	JRnHqOFNUta/NUJy+FXrOM1eJ2/PYmwQtD4UpcPotBwvVSBqrUl/iz937SsQ/jC4+e5GIpaDfiHnB
	MKlPziA3oUn8t5FkO5fYlt1HH+LWuofIZxU2VSXBf5uU7h4q+zEuoLjJe++9bD9oyPk7jWTKoh17Z
	+Xm0jHBxnM+bgQiOGI93MJhTI68SKM4wWKOWf7spW9hV0uEEOeENxPd83qabvHEcJneiAaRX56J4O
	ODF4seWlLq0B+vKYIRFCfsv151qnUD03qxP8xeL3cuS5qLRI3PkyrqaksnU4tP2kcPHSFjqsf9pnM
	wYcoCkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qi7-000000092Da-1rrp;
	Wed, 23 Sep 2026 17:24:47 +0000
Received: from out-36.mta0.migadu.com ([2001:41d0:1004:224b::24] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qhw-000000092A9-2gyz
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Sep 2026 17:24:46 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=HjQOpuoQbKo7UsoxrCfXuZx+XAmeFfUI2umie4vhgCY=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790184272; v=1; x=1790789072;
 b=HXG1rQsfup3O2TVcAI3wEya9KPXinvUGmFONNRiSo616RSap32xcv8nAWRdWJB+81luYxNDj
 2suKyJRZwODKImHSHZjdNPXhRPF8qWYl4g/pJzK7QLE+4+wAI0q9Px6snbPpjOnkJ8sH0ySAeSb
 lb+qDhHouk1fiWMz7TAroDvVVMazia23T1SmaMUoajB6K4GMDiBkYQ2FremqKOATerrv2/2nu6U
 zCUCK9+oXfK6Ix8V7wPYKR9dEBDDX6ibcVuykTvDA6Q9K7hr41lWDlZa7bbOvpK9gpZZHMUjb1G
 BYFx0DszTBVEWGUqnaYrLRUuU5Hm/lr/CCnSfVGAS2nMw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 07e5e90db26aa7f8;
	Wed, 23 Sep 2026 17:24:32 +0000
X-Mizu-Trace-ID: 07e5e90db26aa7f8
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Eason Lai <eason.lai@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless] wifi: mt76: mt792x: defer the MCU shutdown past unregister on USB
Date: Wed, 23 Sep 2026 10:24:24 -0700
Message-ID: <20260923172424.24021-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_102437_520064_66FE6B37 
X-CRM114-Status: UNSURE (   8.26  )
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

The USB disconnect path abandons the MCU before it unregisters, so the
teardown commands that follow cannot be answered. The response parser
reads the silence as a timeout and starts a chip reset for each one,
queueing the work that was cancelled nine lines earlier and reloading
firmware onto a device being removed.

Shut the MCU down after unregister instead. MT7921AU on a Pi 5, eight
unload cycles per arm:

    unload         5.67 s -> 2.81 s
    MCU timeouts   8      -> 0
    reset queued   8/8    -> 0/8

Deauthorizing the port with the link up, to cover a surprise removal,
goes from 3.21 s to 0.33 s.

Fixes: 7910bd565d8b ("wifi: mt76: mt792x: quiesce USB paths on disconnect")
Tested-by: Eason Lai <eason.lai@mediatek.com>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt792x_usb.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 850f6b2cfc4a..5e19e64a9a00 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -502,21 +502,26 @@ void mt792xu_disconnect(struct usb_interface *usb_intf)
 		return;
 
 	set_bit(MT76_RESET, &dev->mphy.state);
-	set_bit(MT76_MCU_RESET, &dev->mphy.state);
 	clear_bit(MT76_STATE_RUNNING, &dev->mphy.state);
-	wake_up(&dev->mt76.mcu.wait);
-	skb_queue_purge(&dev->mt76.mcu.res_q);
 
-	cancel_work_sync(&dev->reset_work);
 	cancel_work_sync(&dev->init_work);
 	mt76_worker_disable(&dev->mt76.tx_worker);
 	mt792xu_reset_work_cleanup(dev);
 	if (!test_bit(MT76_STATE_INITIALIZED, &dev->mphy.state)) {
+		set_bit(MT76_MCU_RESET, &dev->mphy.state);
+		wake_up(&dev->mt76.mcu.wait);
+		skb_queue_purge(&dev->mt76.mcu.res_q);
+		cancel_work_sync(&dev->reset_work);
 		set_bit(MT76_REMOVED, &dev->mphy.state);
 		return;
 	}
 
 	mt76_unregister_device(&dev->mt76);
+
+	set_bit(MT76_MCU_RESET, &dev->mphy.state);
+	wake_up(&dev->mt76.mcu.wait);
+	skb_queue_purge(&dev->mt76.mcu.res_q);
+	cancel_work_sync(&dev->reset_work);
 	mt792xu_cleanup(dev);
 	set_bit(MT76_REMOVED, &dev->mphy.state);
 
-- 
2.55.0


