Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B278410AB801
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2nKOrQu/q+fU5meJzN4ZZdsdpjtXwGQWpbKXuDrdLOI=; b=kE7NvAMnEAA0N+u4aLEmWnP2F3
	QfSc1ds/KWuLX6JsHutxJvjWDhmBb4NugLTlktBR+rSkoccVuQDoee6Y1+lCMv2N5rbyMXVRUW4aJ
	kAnx4kAobVZ+VGVZxVxJivXwaphvceBH+AlBycIaCB5ONDOEhpsY2gQ3pbPmE/7sRUnGlf8+c6HxN
	ctt5e56l1OnLyxkq1uEFnl7hbGf2ib+EHMKsoRBwJhN9/WDXP7Phr3cYQtJnH6gAQuIRct20Jdqe6
	4ZkaF76gJsL/rIio9ETmvUAS5DscKjPtfzrRaJAR/3E97pGWKd36eEA1vtJ4CWViY/+NoZu15L4CY
	kiPOfnpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pzr-000000065Pa-045R;
	Thu, 26 Mar 2026 19:03:59 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pzn-000000065Om-3B2C
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 19:03:57 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1774551831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2nKOrQu/q+fU5meJzN4ZZdsdpjtXwGQWpbKXuDrdLOI=;
	b=TjMDUMtIJ/7IoigppoL+DTJfUqlnRSf24SQVC7lanDwzSqZxyQBsw+n1+8rndwlh1yijiK
	Riz+vX7YLNG/U1IWLFmMMJL6mqCF7JRrj+Yw5pBOtFzDuPlY+iDlAFMN/zOISl7q3cjaHb
	ttHK6cEq/t6K06Mjc+HlIOtb9XhZBnPmNfA7cKq+Heshge4pY2bcBjvf1xFD81gzA26s8I
	BoqVg/LTaesJZrN44CwR+sHYVNI8S77aXS3WLqOA3H7Xo2Ze1XghhtjKHND9IGSar13iYF
	ouOue0c9C5v7Ea0SUIzzb/C6+QEX79WMP8yiBfsY3q966LQ3tXGYbM5eyM1ylA==
From: Lucid Duck <lucid_duck@justthetip.ca>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	morrownr@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH wireless-next] wifi: mt76: mt7925: add Netgear A8500 USB device ID
Date: Thu, 26 Mar 2026 12:03:46 -0700
Message-ID: <20260326190346.415226-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_120356_162553_F9915EAA 
X-CRM114-Status: UNSURE (   7.45  )
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

Add USB device ID for the Netgear A8500 (0846:9050) which uses
the mt7925 chipset.

Cc: stable@vger.kernel.org
Signed-off-by: Lucid Duck <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt7925/usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index d9968f038..e44f0cafd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -12,6 +12,9 @@
 static const struct usb_device_id mt7925u_device_table[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x7925, 0xff, 0xff, 0xff),
 		.driver_info = (kernel_ulong_t)MT7925_FIRMWARE_WM },
+	/* Netgear, Inc. A8500 */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0846, 0x9050, 0xff, 0xff, 0xff),
+		.driver_info = (kernel_ulong_t)MT7925_FIRMWARE_WM },
 	/* Netgear, Inc. A9000 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x0846, 0x9072, 0xff, 0xff, 0xff),
 		.driver_info = (kernel_ulong_t)MT7925_FIRMWARE_WM },
-- 
2.53.0


