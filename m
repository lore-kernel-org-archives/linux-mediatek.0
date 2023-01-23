Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3A8C38142
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 09:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Mime-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YkNx3mgLipQJhG+GYImQ79kbUnDwDwiamP4NsmHL+BM=; b=Ox+4xOzNk8zMvBNaF1GtEQiav5
	oUmdUKhq8sXXr0GvQ3pARo77RbG6uTpSOv6CRD/5H5znWZGjtTy7JdvbbnRlvxZdogyV6YMHzL9jd
	bcyLfNYWVLfNVmlfUIHiltR3GlkceAGwny8Imzk4gZq/xAbx20RoJqHcgKPD6qqgXaSw2V1FuiEDq
	ikvmZ7wZgYLgO293n6El681pDVocvdidsvkiPi6PPLG46SGyUFM40NxbbXpyqFl2RVrToSGbBOE7c
	Z4kYw8IDtvpacPu1HD+5HkLWCsMJKuQc91tBDVcBUBdayVRMx+13AYqBqb3TPfIf2LL3stAk+5T4V
	qX/4K8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJswt-00GUR5-QI; Mon, 23 Jan 2023 09:17:07 +0000
Received: from securemail.qrsnap.io ([50.126.96.22] helo=securemail.qrnsap.io)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJswg-00GUL7-C3; Mon, 23 Jan 2023 09:16:55 +0000
From: Reese Russell <git@qrsnap.io>
To: git@qrsnap.io
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Deren Wu <deren.wu@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>,
	Ben Greear <greearb@candelatech.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Added Netgear AXE3000 (A8000) usb_device_id to mt7921u_device_table[]
Date: Mon, 23 Jan 2023 01:05:50 -0800
Message-Id: <20230123090555.21415-1-git@qrsnap.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_011654_447277_2C332F8D 
X-CRM114-Status: UNSURE (   7.41  )
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

Issue: Though the Netgear AXE3000 (A8000) is based on the mt7921
chipset because of the unique USB VID:PID combination this device
does not initialize/register. Thus making it not plug and play.

Fix: Adds support for the Netgear AXE3000 (A8000) based on the Mediatek
mt7921au chipset. The method of action is adding the USD VID/PID
pair to the mt7921u_device_table[] array.

Notes: A retail sample of the Netgear AXE3000 (A8000) yeilds the following
from lsusb D 0846:9060 NetGear, Inc. Wireless_Device. This pair
0846:9060 VID:PID has been reported by other users on Github.

Signed-off-by: Reese Russell <git@qrsnap.io>
---
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 5321d20dcdcb..62e9728588f8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -15,6 +15,8 @@
 static const struct usb_device_id mt7921u_device_table[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x7961, 0xff, 0xff, 0xff),
 		.driver_info = (kernel_ulong_t)MT7921_FIRMWARE_WM },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0846, 0x9060, 0xff, 0xff, 0xff),
+		.driver_info = (kernel_ulong_t)MT7921_FIRMWARE_WM },
 	{ },
 };
 
-- 
2.37.2


