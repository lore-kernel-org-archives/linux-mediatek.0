Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2064DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 09:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IP3nUpxcRoVxcKHI1TzKlwuAZ+hoVr5LWD6zfQUkU3k=; b=t8dhCPaW26hZ/W
	tteEbY98TgTuQl0hQlWoFpz2mOzY4TzGZeI5v3Y6M9by3Cbg5ue0Cbe8HciSP114/mEXkKIjI0Cpk
	jKVyHvd6KUt1eBEHuOn2BsJ6eNwGZrxLUXVUwSHjJ8lQssTUsTO2n+7I4UesmTgyviczitqaP+lqT
	reKQ4Md3LfK8HUbiocdg1m2sJ5yMNcWcEGs94EYpwBTFGOvtG1Z1WBY0PdKdhU7TC6SEpUSeVJfjm
	cDBzPzf2e8W5rM2GzzWd84Lt4FiRnAhw5oElrdAXZDA6/KA2B2Hc4GWze/3PL6ODKv78n6cxoC2ya
	LXEL5lrH65JORNeHYFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwh8E-002Str-PQ; Thu, 02 Jun 2022 09:28:42 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwh8B-002SqC-Pu
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 09:28:41 +0000
Received: from localhost.localdomain (unknown [222.129.35.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 06F1B3FC16;
	Thu,  2 Jun 2022 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1654162114;
	bh=v50vX/qMJwlgnnJNbxs2FONfuRb0sn2pPyZzAtsnvKI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=cgx+2Mx48GJ5uR8bYtB0qzowE2H9ILmq4GEiEy+kqXrUW5xj0JnoZ+2CMAsFv1z2j
	 guNRxp6/qrE6BE+IzCtl4Ou7XoiIJkxvtGNbVS2wY+L06q5K6uZeKuZYpcjbNYCrMg
	 r/73meoM3JdB2pMrb8rzD9+Ka4wfkUiYze8W9oqnoT0QKMoRgMk0qVICLQN7MlvPEZ
	 Jgxv1wMEZ3ClpYLQwvweq2qGrzWzvrt3oqSjgPKXLXH6rQyHFj3qHrcQSoC6pDJxHC
	 vPUL+84NmkNQ2FkPQfSk6Rv915/0uhbzmjm+5r9c79t4CFTUf7i6nYLvbR9Gj6KPsQ
	 30zGhwjdQYz3w==
From: Aaron Ma <aaron.ma@canonical.com>
To: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	luiz.dentz@gmail.com,
	johan.hedberg@gmail.com,
	marcel@holtmann.org
Subject: [PATCH] Bluetooth: btusb: Add support of IMC Networks PID 0x3568
Date: Thu,  2 Jun 2022 17:28:22 +0800
Message-Id: <20220602092822.953521-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_022840_128203_604408C7 
X-CRM114-Status: UNSURE (   8.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

It is 13d3:3568 for MediaTek MT7922 USB Bluetooth chip.

T:  Bus=03 Lev=01 Prnt=01 Port=02 Cnt=01 Dev#=  2 Spd=480 MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=13d3 ProdID=3568 Rev=01.00
S:  Manufacturer=MediaTek Inc.
S:  Product=Wireless_Device
S:  SerialNumber=...
C:  #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
I:  If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
I:  If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/bluetooth/btusb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index e25fcd49db70..fb1a67189412 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -477,6 +477,9 @@ static const struct usb_device_id blacklist_table[] = {
 	{ USB_DEVICE(0x0489, 0xe0d9), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH |
 						     BTUSB_VALID_LE_STATES },
+	{ USB_DEVICE(0x13d3, 0x3568), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH |
+						     BTUSB_VALID_LE_STATES },
 
 	/* Additional Realtek 8723AE Bluetooth devices */
 	{ USB_DEVICE(0x0930, 0x021d), .driver_info = BTUSB_REALTEK },
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
