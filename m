Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FDBCD13DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2026 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCuYwhfHV/ikt3n7JHXBY2RTS4geNXNRPHiqjNDQ3Kw=; b=42yiF+dbzP4umOxT8pF4oRe1gn
	nKNGvyvNJsGpsTeZJRl5JpTBCtq2ZWGlAiGj7DXUUsSKLipbUrzzrboLq4+4s0CsdPvA+da/U83GH
	E6YEZ0PFB7kE5KBcwE/oEVkDHYK6SkpWMioTZg0xgpjEYc+UPueiOcc0c5BMelWtA5zaXwF6+k6lK
	BO2GSAtOgml4QbkdkLEW/bggK2y9vX0cKUQEP1mEk2ofY28e/FGNoNF8DLQ5pRDJUAS3OfBcjkEUM
	Tz/CPcWdtYPH6KY1ZfhsU1JHJzg4/0sPF6Y1y7z/Vsmwq6LNF86Y20e2CmYjsVYfMUNX5YCTtdjD/
	qSdEwwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMqO-0000000515c-2GoH;
	Thu, 30 Apr 2026 08:34:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMqJ-0000000510w-1YE3
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Apr 2026 08:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10D6644100;
	Thu, 30 Apr 2026 08:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE90FC2BCC6;
	Thu, 30 Apr 2026 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777538033;
	bh=vxD9xO6E6gxI2jN1+uuURcxBVAKWmSKLybdcQnknBu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Udrd04/GFekpcWkAbRf/DTZeYGDjPZ10LeYx0lyl78iRMOLH2LjsubMJ2JZv+gfBo
	 jpd3fDuzxLGgZSJIEo68r4DVjkRPbrVhTQLfmYv3cN3s11ZgrbFGC/gg8rKaoZQyXc
	 hBDlXSWV9ZR830TT0mtp1blKFrvymmUEFBFMcTQyuwyfrwP/inHW4V+fsMimDFv96T
	 e/W+WUh7aCP5QMmM73UtB5Hm21Dl5XK0hhhkVTt87hpJIR4GO3B2X7s7RQx8Ui1w/B
	 HSKILqEZ+gZPcJ+y/agypuJ1MceBh2iKgdXiMCWHH2jjTz9nNyZvPGYpzA+XFXI7i2
	 6wBLY21Lo87NQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wIMqF-00000000u0I-1vYF;
	Thu, 30 Apr 2026 10:33:51 +0200
From: Johan Hovold <johan@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 RESEND 5/5] wifi: mt7601u: drop redundant device reference
Date: Thu, 30 Apr 2026 10:33:35 +0200
Message-ID: <20260430083335.215239-6-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430083335.215239-1-johan@kernel.org>
References: <20260430083335.215239-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_013355_432856_4D17DC51 
X-CRM114-Status: GOOD (  11.35  )
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

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop the redundant device reference to reduce cargo culting, make it
easier to spot drivers where an extra reference is needed, and reduce
the risk of memory leaks when drivers fail to release it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/net/wireless/mediatek/mt7601u/usb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/usb.c b/drivers/net/wireless/mediatek/mt7601u/usb.c
index c41ae251cb95..9306870cbc91 100644
--- a/drivers/net/wireless/mediatek/mt7601u/usb.c
+++ b/drivers/net/wireless/mediatek/mt7601u/usb.c
@@ -274,7 +274,6 @@ static int mt7601u_probe(struct usb_interface *usb_intf,
 	if (!dev)
 		return -ENOMEM;
 
-	usb_dev = usb_get_dev(usb_dev);
 	usb_reset_device(usb_dev);
 
 	usb_set_intfdata(usb_intf, dev);
@@ -319,7 +318,6 @@ static int mt7601u_probe(struct usb_interface *usb_intf,
 	mt7601u_cleanup(dev);
 err:
 	usb_set_intfdata(usb_intf, NULL);
-	usb_put_dev(interface_to_usbdev(usb_intf));
 
 	destroy_workqueue(dev->stat_wq);
 	ieee80211_free_hw(dev->hw);
@@ -334,7 +332,6 @@ static void mt7601u_disconnect(struct usb_interface *usb_intf)
 	mt7601u_cleanup(dev);
 
 	usb_set_intfdata(usb_intf, NULL);
-	usb_put_dev(interface_to_usbdev(usb_intf));
 
 	destroy_workqueue(dev->stat_wq);
 	ieee80211_free_hw(dev->hw);
-- 
2.53.0


