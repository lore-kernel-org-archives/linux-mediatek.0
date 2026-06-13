Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24A5CD98CF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRPTT3/6G4lP2VEfu1IORtyPMTNcjVGbmV1lNT9rjb0=; b=IUoZg9Zxzb0C0Zux1juSrZlb30
	SXJ54hSaTiDeAboT0ZqAMrrh3ESr42G4SyWZ23o39w0brUjyl0ZMlild76BNmb9wV4msz+rF/6MYW
	iT+L7n/zggwG7lis9AlbG8va3YZjRrOODeHZoHQXVw3AcLyb/ck59t+Q3vj9Zz46EYMDS1G6YXDJe
	D1dc9MiTgGH7tps+bk/N46W93DR68R3yt01+0jxYCvshcS9yevT1vqI5qn73pm/SHTmYTyp4EDGFM
	szR00qPeZWJmqrlXFcGSXTnthn6Y4ln+iWCsMB9A+JgXMDQ7uEgjcdBAVc3gPqHaCrDU6+N9JTRNB
	vxKRWvRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX3x-0000000Ca8s-3N07;
	Sat, 13 Jun 2026 22:42:49 +0000
Received: from mail-dy1-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX3t-0000000Ca7o-271m
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:42:48 +0000
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-307263ad0cbso3285930eec.0
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390565; x=1781995365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HRPTT3/6G4lP2VEfu1IORtyPMTNcjVGbmV1lNT9rjb0=;
        b=n1OpsOJ5eBDR31uCB73tcok4inkOjpxXt3cupw0amK2BBC/+FXkJErk50jLwR1Dzes
         2XWAEaBs/2V9wDLx06dde5HTpIYzZoslS/sAp5EW+THxzvNSzFC8EUfgNErr6gnWFIYm
         zHHzIj2hq9HhBt8Vk2tvzyGv7DTKp0tvtWreQieSigsu+kjDdp+vrkfFYeWHyU+srBU7
         C5xxneQiAmST3UedRoXRquU7SPbT2rpw+PdsBrec2QLPNvwsUnTE/xwA4O++/4JUSv9Z
         5LHo1XE0pxyOWFChbkruD2/XCqe0pcbHb0HwqkHyCUxJ2wPUVVq4xfFQy0vXKMr1Swqu
         i60w==
X-Forwarded-Encrypted: i=1; AFNElJ/QURq2XbL/Dcl1gwDyPKbSzDeUipFPbNdlWvjDXJxp+6ni3QceIp5SMzmynKEgeg7OoMKTDsQAKhQIwzuhlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTlP6ouCkQzvOHi/Vi55qmkYkVXl+5Ctx9Tj2Syh1mIwK5/UJ5
	D91an6AQkQVSy3ImOAefKWHymN2W6VE4OUClz0wNwgLrNtLb6TBq/F+M
X-Gm-Gg: Acq92OGNP3oNtz/cvO1nKijziGt5J3m6in/FsDz/T6h6/PfPAeAzd9jsTaujGzmu5P2
	7kEgILD3UJQzhLrT89TGNDEi7oBTiGC03XZldt1k3vG4CjrnNDhFO1pqcII2jLUeYX5yU/cTIRL
	1R0AApeXnZEqHjyMIzdMyA96r4NVN4CoioMcAId8z89xNkJ4EyFoCzw1guNu7acrP/Nv+tiCWcK
	XUcNZSE1UMtggR6AKjbmzQCt624DrFIS1zquVvmQXI5TkdlQM8qaVMx42p9J0c5DS0Y/za2nuQK
	k1TvRADEUpA1nIq7UUmwk1EnaS8yDBIBUWgLPmr9p+KCvd7vXoRdwrcFZ0B6ffzxzyHkpr8l/ND
	z4EufajTwIhlrQVDbFjhh2cUx/7njz6oco3FpeLlpi5K/a5KISKv4jhBIOX6tpqI+qu1vbDXeBt
	2+QTBEYlzp1QraGsWLkqZtI4dt4WmTVOcQOtokFpXaKzC36tkFaq3Bhq67YXxfAtT6DjO737/t1
	rzjiDlRb/RhqjJI5s7jIDU6inr02tabN612eI1M
X-Received: by 2002:a05:7300:df41:b0:2d9:5cd9:b8ff with SMTP id 5a478bee46e88-309356121d0mr2697668eec.6.1781390564540;
        Sat, 13 Jun 2026 15:42:44 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm11104825eec.28.2026.06.13.15.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:42:44 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 6/6] wifi: mt76: mt792x: quiesce USB paths on disconnect
Date: Sat, 13 Jun 2026 17:41:31 -0500
Message-ID: <20260613224131.2396026-7-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613224131.2396026-1-sean.wang@kernel.org>
References: <20260613224131.2396026-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_154245_548980_123FEFCD 
X-CRM114-Status: GOOD (  10.33  )
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

From: Sean Wang <sean.wang@mediatek.com>

USB disconnect can leave reset/init work, TX worker, and MCU waiters active
while the device is being removed. Stop those paths before unregistering
the device to avoid teardown waiting on firmware or queue activity after
disconnect.

Run WFSYS reset after USB queue deinit so removal does not issue the reset
while USB traffic may still be queued.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt792x_usb.c   | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index c4da1b900d47..e5d2d2f6a388 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -230,9 +230,9 @@ EXPORT_SYMBOL_GPL(mt792xu_mcu_power_on);
 static void mt792xu_cleanup(struct mt792x_dev *dev)
 {
 	clear_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
-	mt792xu_wfsys_reset(dev);
 	skb_queue_purge(&dev->mt76.mcu.res_q);
 	mt76u_queues_deinit(&dev->mt76);
+	mt792xu_wfsys_reset(dev);
 }
 
 static u32 mt792xu_uhw_rr(struct mt76_dev *dev, u32 addr)
@@ -494,13 +494,27 @@ void mt792xu_disconnect(struct usb_interface *usb_intf)
 {
 	struct mt792x_dev *dev = usb_get_intfdata(usb_intf);
 
-	mt792xu_reset_work_cleanup(dev);
+	if (!dev)
+		return;
+
+	set_bit(MT76_RESET, &dev->mphy.state);
+	set_bit(MT76_MCU_RESET, &dev->mphy.state);
+	clear_bit(MT76_STATE_RUNNING, &dev->mphy.state);
+	wake_up(&dev->mt76.mcu.wait);
+	skb_queue_purge(&dev->mt76.mcu.res_q);
+
+	cancel_work_sync(&dev->reset_work);
 	cancel_work_sync(&dev->init_work);
-	if (!test_bit(MT76_STATE_INITIALIZED, &dev->mphy.state))
+	mt76_worker_disable(&dev->mt76.tx_worker);
+	mt792xu_reset_work_cleanup(dev);
+	if (!test_bit(MT76_STATE_INITIALIZED, &dev->mphy.state)) {
+		set_bit(MT76_REMOVED, &dev->mphy.state);
 		return;
+	}
 
 	mt76_unregister_device(&dev->mt76);
 	mt792xu_cleanup(dev);
+	set_bit(MT76_REMOVED, &dev->mphy.state);
 
 	usb_set_intfdata(usb_intf, NULL);
 
-- 
2.43.0


