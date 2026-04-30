Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E96CCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2026 08:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Od70UfCF87vbTriM2oDl/kwckpa1JbaP8B50ChJmsN0=; b=Kq4vAsjTf8Cm3Bx7lDvG1CzePp
	CYenm0YNmMG31nVfJwMIz7249LTvFfeZ36Axh53p81qdHwS8B2lOA6tHyRbbpwY7HEQsoHEoHYubI
	dbYekHdc8HGOyAR6ghKQ2BcYnAPOdgexs6d6QGhNyQXJ/Ol7C15EWgZDSvzN0M1DPwR0zE/mqCFEl
	eeYsu4uUYKXrGP/b6lS/gFyx/H2su/SAdj7S9yt0fDgsGdw0E1VYXjHAvpaivpm7ah96emhaOMdM4
	kH37YcrjLdvPe+425RhNAWf3Ode0P1eMq7G+Lsp4O3tjTLPzanagQpmEuDzkG7MkaRLfT64h1vCdf
	VQmDgozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMqK-0000000512K-0nUs;
	Thu, 30 Apr 2026 08:33:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMqJ-0000000510x-0fr6
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Apr 2026 08:33:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34CB36057A;
	Thu, 30 Apr 2026 08:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D18C4AF09;
	Thu, 30 Apr 2026 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777538033;
	bh=w4MvbuUnVFxrRLrqGcz+OIFkZ2X2qfkCXwh910utgqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J36Uxyl51qV1TMtO70TlIuevJnP9WfqcH1nq4Id7hz8F22pgNl7X2vSNo0EF/nH0W
	 owqKo+aGWcWhnEEE4GcT0A4IAN6/tgwt2qeyzmtPXuhdWcQ77x5HUGqf/h9AoYXYQF
	 NBwUoTtIFo91TZvnzS7CFqlUBVXCMwWlXDniVAbV80/6nBer0wJLnsAc4aLauha2TF
	 U7iWmD5uKLAjBlQTxCTLAmFtLYVBTxgr2BdxoB8KhBxItd1WgVdyq/MMUWMnPI5PHN
	 ewF2+V+Zg5QFxoKI4vzusP7+05MPFfbtWWV/pLYxw0/HQ9x63MgYV5rwnBvcneeRIh
	 PwVH+uPPf597Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wIMqF-00000000u0A-1lNw;
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
Subject: [PATCH v2 RESEND 1/5] wifi: mt76: drop redundant device reference
Date: Thu, 30 Apr 2026 10:33:31 +0200
Message-ID: <20260430083335.215239-2-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430083335.215239-1-johan@kernel.org>
References: <20260430083335.215239-1-johan@kernel.org>
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

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop the redundant device reference to reduce cargo culting, make it
easier to spot drivers where an extra reference is needed, and reduce
the risk of memory leaks when drivers fail to release it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/usb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
index d91feffadda9..bab7b91f14be 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
@@ -151,7 +151,6 @@ static int mt7663u_probe(struct usb_interface *usb_intf,
 		return -ENOMEM;
 
 	dev = container_of(mdev, struct mt7615_dev, mt76);
-	udev = usb_get_dev(udev);
 	usb_reset_device(udev);
 
 	usb_set_intfdata(usb_intf, dev);
@@ -193,7 +192,6 @@ static int mt7663u_probe(struct usb_interface *usb_intf,
 error:
 	mt76u_queues_deinit(&dev->mt76);
 	usb_set_intfdata(usb_intf, NULL);
-	usb_put_dev(interface_to_usbdev(usb_intf));
 
 	mt76_free_device(&dev->mt76);
 
@@ -211,7 +209,6 @@ static void mt7663u_disconnect(struct usb_interface *usb_intf)
 	mt7663u_cleanup(dev);
 
 	usb_set_intfdata(usb_intf, NULL);
-	usb_put_dev(interface_to_usbdev(usb_intf));
 
 	mt76_free_device(&dev->mt76);
 }
-- 
2.53.0


