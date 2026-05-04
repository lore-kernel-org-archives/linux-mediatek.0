Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1866FFF885A
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2026 19:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+kg55pUc+YqgDvvLMINRJfFAwlkmL6dsD2oqNH5ePEw=; b=DHkGAYe84EcBApJpEzVHf8IBM/
	Gk9RWdf7R98U3QPSURYVKKlP+gVMXlXrdHJnKQKoa8wNchqysgR0inXOogZwoH2YvNjA+IYhdSXK7
	30sdk7h9Btv0PseOouKbhfzqwizvsIUt0FYYfU+HYmZb+ne/dqq4ZO3EScslsIpqvVZcYx9fAjG0J
	1YUaZFGrE9I1TpPh2BtQvQ2QFWMz9OpMFLCsKwen8FDBJvLIZEGcnDi4oBqsUhqh0GGZSYBqB3vio
	86MRi79H/V+aDNxpWHti92ojApbBejRV+kvtWoL8QfcaMz0hrqpLlcrfuSUx1ODQx/D2QGhSk6fG/
	heUmf5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJybE-0000000E3z6-4C0E;
	Mon, 04 May 2026 19:05:01 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJybD-0000000E3yE-029I
	for linux-mediatek@lists.infradead.org;
	Mon, 04 May 2026 19:05:00 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7de4be15125so3905506a34.0
        for <linux-mediatek@lists.infradead.org>; Mon, 04 May 2026 12:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921497; x=1778526297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kg55pUc+YqgDvvLMINRJfFAwlkmL6dsD2oqNH5ePEw=;
        b=b4KZVjJrHfsTEKPrEf6JR9EIk7cbyZbVY1ndrXSz7VfOsp95H64ph7SyNFDMK9RGYM
         uQACPWqyWTOn9061ZED+Ikk3sdAXW+lq4p+CkMJxbOohLspU2ZNP7K8GQ/gTioAoOjR4
         7dZso0ymbdBJZYyRepQV9s9ibeTPKrZ9EA8QVjOdzeZewYtr0ifn6sOXNHhxkRsw15J+
         YdNpJYhy9TIZ3uubtCz5N3o/ELWO8DqQKwpr/UdO1txFm5rjrq2XMLsQBCDeD3BM6HJ+
         lxaH7/g4e4lyLebzjkfqxsBmQ0XeevVI28bliPtkooh0IFp+q+HETMh5JtE6FkMcIoZC
         ddDw==
X-Forwarded-Encrypted: i=1; AFNElJ+Usl1tW+lcoWvAwnjPgLvhlyqGc0dhadlnwxgPO9jmzPPspeIeWV2mTQX2nLcfyXIk8XRLX++npMMkVxve5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YysSNROXVk0ydG6rYtJ3D7+vLJ1luSCWTpE7YM60uOroM2JO5Yv
	aK6+fWMqr0dEUXV9dxnfHFqCMW3knRO0mmu3sgp12MKies7INfFMwPn8CZ3Q/Q==
X-Gm-Gg: AeBDiet3c1MwDsIErg0/UL69QuExKW4h40S9I4q7joCfNgZZ5iq88FpjWGTPWA4fQgd
	vtJdOC0rxukNj5sMDFHHYKc/uGb7cr53WM0uWX8h/Uxql4ELZScNBh4C4R/yU52x/NLRz8NRb+3
	/thVVw+DCXLwAPVfKF3hd64HgRqyyhTW3jufo/cupQn5ZutEoxrTwn5OIdtlHBnprulBX0v2/rc
	7cvbEJmeiTZyi1s1jaUrLdc4AZXun9lJmB3K4RGjagEMRw6cQP+FzC4dDf2a5kFlG3qm6BOaN7u
	QLsidNCQYrrvoY6Xnt5Bv34wyVSMfBRL2rp94Um7dsujcSojiuGXY8szFQWXBPID+QO4V2Tn3gJ
	ZVwRdSHzengFeVZY26Al0SZFcm33j2ebuUqHKN8CgkeKm4VVtV5ovUzCqcr+VA8m55JU5euTytj
	ZuFjj5jng00kkHg6RkkfxZCIn43ata1EdJ4X3BMp0uW0lY2NAKzjuzKbIriThUCxKCrlR9RC35J
	cq1tcdgWsc3u/Vurw==
X-Received: by 2002:a05:6830:63ca:b0:7dc:de0f:b640 with SMTP id 46e09a7af769-7dee12afa83mr6320108a34.6.1777921497138;
        Mon, 04 May 2026 12:04:57 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ded51a9612sm7524229a34.26.2026.05.04.12.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:04:56 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Kirill Shubin <kirill.kz.902@gmail.com>
Subject: [PATCH] Bluetooth: btusb: Add new VID/PID 0x0489/0xe156 for MT7902
Date: Mon,  4 May 2026 14:03:53 -0500
Message-ID: <20260504190353.9358-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_120459_091292_7B78DFE6 
X-CRM114-Status: UNSURE (   9.71  )
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

From: Sean Wang <sean.wang@mediatek.com>

Add VID 0489 & PID e156 for MediaTek MT7902 USB Bluetooth chip.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=01 Lev=01 Prnt=01 Port=09 Cnt=05 Dev#=  6 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=0489 ProdID=e156 Rev= 1.00
S:  Manufacturer=MediaTek Inc.
S:  Product=Wireless_Device
S:  SerialNumber=000000000
C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
I:  If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
I:* If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us

Co-developed-by: Kirill Shubin <kirill.kz.902@gmail.com>
Signed-off-by: Kirill Shubin <kirill.kz.902@gmail.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 572091e601f9..f1a225fe94e4 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -676,6 +676,8 @@ static const struct usb_device_id quirks_table[] = {
 	{ USB_DEVICE(0x13d3, 0x3606), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	/* MediaTek MT7902 Bluetooth devices */
+	{ USB_DEVICE(0x0489, 0xe156), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0e8d, 0x1ede), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3579), .driver_info = BTUSB_MEDIATEK |
-- 
2.43.0


