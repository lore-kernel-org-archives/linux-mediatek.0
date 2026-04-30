Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525BCCD13D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2026 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIU6eDFMl4h7LH/YZnBPz34gKbnCQOIlFSSPHF3rbCY=; b=oRTjiIzqLdSJNuQWrz1n6IGsMt
	fhIbfRGeI1cZE171/g/NyoXIwQsSbGBzGifGDtXrjQyuPNTMcEFrYD8MPMI3ROXRprQ0lmM6cP/V4
	Yvx5BgnTK380U0TlCGM4dYLucgD+avE9Zmd243+sl3zrgz0s4zJExFvL22+uzHZsswLJhQyTLpYUi
	x+CEhKDhMYbWeLwLnSpaBeDVQIzdtXLAT7REgjLxOFG/WlzJQMsccT7x9D2q6B1MygtmcEsHZdwxn
	tZCfjyalQjCsdsW9e2AdQOMqT4gVj3ZDFsnBS3IBe2NKINSnRyoY+i/b5jzXctU9fer+bwNaxKDyE
	5uaXoulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMqO-0000000515C-14Me;
	Thu, 30 Apr 2026 08:34:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMqJ-0000000510v-1cXd
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Apr 2026 08:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03C7743E7C;
	Thu, 30 Apr 2026 08:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4D5C4AF0C;
	Thu, 30 Apr 2026 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777538033;
	bh=NJWCpHLArg8paeKRmtaOO1YhmVDyGXFRGMJt49dMrn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nmKG4Hp9dU0q4m/RWs3MC1wIAb5vHhuqs8CZA5vxsTrYdeUirCJdRAjA3KNzFPepP
	 X/gPufSQDrrqdLFjYnGWqkzJYmRy9QmxRju94gSCW2z0OMokR9VJY/49l32A14fc/q
	 /TJdwwuFqDNoQGUqmio6Bm+T70qs9fAc6bo3nrYhMth9SyvUmkYx3uh2mgNT5CwRUG
	 cud2iVj5v/5D9Y5txej0uJ1C2dh1aUlMTn4yGUEzXPdZqxAfeqDJ8goQ0fHNPIOCxH
	 le9yMThMsNyuHig7rHkrtTOtpqZTZrsMMyFPQsbQHPJ0yVxO8/Twa8dvZ9cMQpYxPO
	 PaaKJDQ5TIdTQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wIMqF-00000000u0G-1tDe;
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
Subject: [PATCH v2 RESEND 4/5] wifi: mt76: mt792xu: drop redundant device reference
Date: Thu, 30 Apr 2026 10:33:34 +0200
Message-ID: <20260430083335.215239-5-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430083335.215239-1-johan@kernel.org>
References: <20260430083335.215239-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_013355_476289_A74B21B7 
X-CRM114-Status: GOOD (  12.00  )
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
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 2 --
 drivers/net/wireless/mediatek/mt76/mt7925/usb.c | 2 --
 drivers/net/wireless/mediatek/mt76/mt792x_usb.c | 1 -
 3 files changed, 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 17057e68bf21..9bfc234f306f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -197,7 +197,6 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 	dev->fw_features = features;
 	dev->hif_ops = &hif_ops;
 
-	udev = usb_get_dev(udev);
 	usb_reset_device(udev);
 
 	usb_set_intfdata(usb_intf, dev);
@@ -246,7 +245,6 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 	mt76u_queues_deinit(&dev->mt76);
 
 	usb_set_intfdata(usb_intf, NULL);
-	usb_put_dev(interface_to_usbdev(usb_intf));
 
 	mt76_free_device(&dev->mt76);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index d9968f03856d..84bcebbf009a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -185,7 +185,6 @@ static int mt7925u_probe(struct usb_interface *usb_intf,
 	dev->fw_features = features;
 	dev->hif_ops = &hif_ops;
 
-	udev = usb_get_dev(udev);
 	usb_reset_device(udev);
 
 	usb_set_intfdata(usb_intf, dev);
@@ -234,7 +233,6 @@ static int mt7925u_probe(struct usb_interface *usb_intf,
 	mt76u_queues_deinit(&dev->mt76);
 
 	usb_set_intfdata(usb_intf, NULL);
-	usb_put_dev(interface_to_usbdev(usb_intf));
 
 	mt76_free_device(&dev->mt76);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 47827d1c5ccb..0d9dbd0aaf9e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -341,7 +341,6 @@ void mt792xu_disconnect(struct usb_interface *usb_intf)
 	mt792xu_cleanup(dev);
 
 	usb_set_intfdata(usb_intf, NULL);
-	usb_put_dev(interface_to_usbdev(usb_intf));
 
 	mt76_free_device(&dev->mt76);
 }
-- 
2.53.0


