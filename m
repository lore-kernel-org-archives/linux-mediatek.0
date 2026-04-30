Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE52CCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2026 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E++F7xCOqjfxI/oocjAqRAHIiwcZjg018Vxw5dfNXuM=; b=bhZyeFWv8b2dDuqU6HGlfT2RQw
	BgksT9TY1u4NnQhj2xlMr805upaj/JnnQhhNYPWGvR5A4j/ZrD9BwdjMX1FsZrPwuzWy1YTPzBfFU
	tNv6sqSIpSy8kZdt0xH1DNbniZj7VoasTuXC27BUnnI7mKo2C/cwjE6x8mSFIS7fqGFwi5+3KMfLr
	dpoRBhJ8q+q27zHP/+OYW1ixdOosTw7TMlGSUr+my0Wylmp57zF1YvSU6wNsQgX9d5tv+bniFcJsl
	J4sH2GCHBn0463Sq0odqmdUwHnTVi5tqPuT0kPwZBKc1tv1KvMrGMjtNvMEoKRYwgKQom7wrAvzPk
	tOHuHtlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMqO-0000000514n-01sH;
	Thu, 30 Apr 2026 08:34:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMqJ-0000000510y-1Y1N
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Apr 2026 08:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18A3A441DA;
	Thu, 30 Apr 2026 08:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E42C2BCC7;
	Thu, 30 Apr 2026 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777538033;
	bh=JCt6tWeOBXoxgLUmoQyal2hT8O3E6cJwSDW9MnTpiqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EubHyBUCQggaxhwStKQb2aj2yoDp5sa+R3y63rWzbrbiZGRLjFSFn6u44Vzfqyulz
	 71jthDqzU6zIECne1eoG9VPFAW6dzKHdYO90CbocmjGvduXF+szcd5saqxapKX7v47
	 k5SCPP6dyvtrQ6+laqCByU/jOklpx+OjmH/oQxxcdQjjaZd9gN3qrS2JlEBcLfcSDA
	 eZSvMIANbZ3mx9xDaiUlMJTc+E5N2Ml6/PUCRlNsZ28H4MLqGANOA0xDbMf55ABaKV
	 SIwWQB0PLjMvFy7gu8RO4zLs15rvVC4+yJf4lSaPdObSpFkKslhLlynOenccsasUig
	 9otq6D9SBEWlQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wIMqF-00000000u0E-1qgX;
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
Subject: [PATCH v2 RESEND 3/5] wifi: mt76x2u: drop redundant device reference
Date: Thu, 30 Apr 2026 10:33:33 +0200
Message-ID: <20260430083335.215239-4-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430083335.215239-1-johan@kernel.org>
References: <20260430083335.215239-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_013355_426539_13B6337B 
X-CRM114-Status: GOOD (  12.22  )
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
 drivers/net/wireless/mediatek/mt76/mt76x2/usb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
index 01cb3b2830f3..8af360bca643 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
@@ -57,7 +57,6 @@ static int mt76x2u_probe(struct usb_interface *intf,
 
 	dev = container_of(mdev, struct mt76x02_dev, mt76);
 
-	udev = usb_get_dev(udev);
 	usb_reset_device(udev);
 
 	usb_set_intfdata(intf, dev);
@@ -84,14 +83,12 @@ static int mt76x2u_probe(struct usb_interface *intf,
 	mt76u_queues_deinit(&dev->mt76);
 	mt76_free_device(&dev->mt76);
 	usb_set_intfdata(intf, NULL);
-	usb_put_dev(udev);
 
 	return err;
 }
 
 static void mt76x2u_disconnect(struct usb_interface *intf)
 {
-	struct usb_device *udev = interface_to_usbdev(intf);
 	struct mt76x02_dev *dev = usb_get_intfdata(intf);
 	struct ieee80211_hw *hw = mt76_hw(dev);
 
@@ -100,7 +97,6 @@ static void mt76x2u_disconnect(struct usb_interface *intf)
 	mt76x2u_cleanup(dev);
 	mt76_free_device(&dev->mt76);
 	usb_set_intfdata(intf, NULL);
-	usb_put_dev(udev);
 }
 
 static int __maybe_unused mt76x2u_suspend(struct usb_interface *intf,
-- 
2.53.0


