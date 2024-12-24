Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0CDE7718D
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2024 20:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXnwfLpkhYYxYPhM72Gwoblk8EAA9RKQzbpLJtQuu9k=; b=TFPuaHjiquNx0UEBIQD+w4GJk0
	PzuT7bjpeaylhGFtpdEUtwUgiVWGTAx+OzWhvjmOuz0N/eIxW/0R76vJNl3ZoCgp1g5TM2rJ7Su8y
	N6Dh7H2t+p+7dp9BRXYNo9Tk8a4fZfXKo8lxuQq4nJZed7EE4DFfP5vaktPxXE14ggg8T44F52gg0
	nQ7eGmU7yo3Dk4nXqn4H9JY1kDLKslvI+vAMpquw/sl3mKcSxFRiZ7g/WbWngtBC2rpxTUirbhTKY
	qDFvDwK3cY5mlzVkxAPezOa6S0AiBbzV3gmM36ivMxAjkgs4EnkoMYWemvwbCNRuKP3KwNLmRxRVn
	6auHd0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQBjU-0000000Clmn-1lSi;
	Tue, 24 Dec 2024 20:42:24 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQBjR-0000000Clkb-03Bk
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Dec 2024 20:42:23 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e39841c8fd6so5059034276.3
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Dec 2024 12:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735072940; x=1735677740; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXnwfLpkhYYxYPhM72Gwoblk8EAA9RKQzbpLJtQuu9k=;
        b=UmNZw0p5T223nho6w80WENXPu/kcnjwl2ZvzhdE01A1h1kozxr6rzuNNSg6TMXW0d3
         g8RUZAVck9rXTFKFFn3cvpje9fGkcpxz5dVmS8EpAYThOL/GiuhDwfnq9aEF068qAsK8
         362JC3mVvpvuAWn//0MrxPhaGMqVHlAi7USxoWbRYN6Zw7Z/j5L/rbI/KZZsWlqPVaaI
         d4G9lOhQcbqReJl+3b65TuqaPp+WnjP8VKa2xM16XR+0yKGnGfvlZPyuqrvZehsSiJxD
         xhXo4MjI0nLPuyYwo1c60pVOzg6CJ7vKj0G9PzCXJgy+UzUqWKe/xonLLQqMSjocrrQ1
         F8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735072940; x=1735677740;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXnwfLpkhYYxYPhM72Gwoblk8EAA9RKQzbpLJtQuu9k=;
        b=g0pKYjoYt6XMfBe9Yo5HHF0tNU2hlAzCXOFhfdnS3TgIrZJMeL3bPuCqSS8/Wq1edp
         /ltx5JrqmFrTEK4d1YV/p+QkGCpVb3S8CQjhx4iugoxdlGgD4tdHEQHzr6oyMWgm0TPI
         oBi6K2ZJ8Dqy7tJKAHixVM0Am8YPx8xbLpfsSV3BbCaUbPLpJqngtKwuC7cRlPpSt8bS
         cUUITeLJvpzzS7glWq462lOln1PWsfC2cH8YzLXxWvKnRpXq1DKvJg0MmY4/76LFK9Ui
         jgAC2kD3IuZ4SJVeOTqCMYmsEkGRM3tkUw8m9c7N227tVJqzuD4lEaPVklI0/gmtqXUT
         PI0w==
X-Forwarded-Encrypted: i=1; AJvYcCUVsiMe8kRcX9BOYpC+NSS5DgePS4+wMCAftyndY/zoIZb/uaoaD+iAEM/pY5fvfXGCuAmyGygHSjRAMdVmOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuC1n8Wf4/13kpBRSACjP3kVkxl59Z6lTGBJfdEbyGJLgDLqEF
	cfyPqeEzC4/4VOBaNsU0dT/zXxMXOpoUGu7lwsvMfv2tsmshLLpy
X-Gm-Gg: ASbGnctDA7PO9FuS+Ug6VlV93ag5lPb+Ihlprj0zgFRvknjnXZiszEeFU3HTQ2l4Z6I
	Eec3B8Aq77uop2rbphYPTkChHT5eHunkoKFcfd4DBs2HvmRF34D2TbBWoTVKrANOVEZarDuRKXR
	a1Yt5ZLAxVZiaYDCJaHKUwrH/OLc2EaYOKr6wQjGWEYKN7iL/sXymwjAZpcVlhQR9hCtmCdPNje
	77n9ACEVnm9s9UQWUkTvtnoP6SY/PSizAVrh0NSyEg0GZI=
X-Google-Smtp-Source: AGHT+IHV+iw7nhCOruiNhoeu7PopZ4UMC1hvScgq+hQwsnjeEN9dXcF9T8WqbdodvVb+Z8wPCw+Grw==
X-Received: by 2002:a05:690c:688d:b0:6ea:8d6f:b1bf with SMTP id 00721157ae682-6f3f7f2743fmr140672607b3.0.1735072939698;
        Tue, 24 Dec 2024 12:42:19 -0800 (PST)
Received: from halaneyt14s.local ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e73e785dsm30493877b3.1.2024.12.24.12.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 12:42:18 -0800 (PST)
From: Andrew Halaney <ajhalaney@gmail.com>
Date: Tue, 24 Dec 2024 14:42:11 -0600
Subject: [PATCH] Bluetooth: btusb: Add new VID/PID 13d3/3610 for MT7922
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-tx55e-bluetooth-v1-1-e83ebc81507a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKIca2cC/x3MSwqAIBRA0a3IGyf4JWgr0aDPKx+EhloI4d6Th
 mdw7wsJI2GCgb0Q8aFEwTfIjsHqZn8gp60ZlFBGKmV4LtYiX84bcwjZcT1ra4xYhBY9tOqKuFP
 5j+NU6wcfO2lZYQAAAA==
X-Change-ID: 20241224-tx55e-bluetooth-3a35440b0307
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Andrew Halaney <ajhalaney@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_124221_076619_3C84CF01 
X-CRM114-Status: GOOD (  13.13  )
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

A new machine has a Archer AX3000 / TX55e in it,
and out the box reported issues resetting hci0. It looks like
this is a MT7922 from the lspci output, so treat it as a MediaTek
device and use the proper callbacks. With that in place an xbox
controller can be used without issue as seen below:

    [    7.047388] Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20241106163512
    [    9.583883] Bluetooth: hci0: Device setup in 2582842 usecs
    [    9.583895] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
    [    9.644780] Bluetooth: hci0: AOSP extensions version v1.00
    [    9.644784] Bluetooth: hci0: AOSP quality report is supported
    [  876.379876] input: Xbox Wireless Controller as /devices/virtual/misc/uhid/0005:045E:0B13.0006/input/input27
    [  876.380215] hid-generic 0005:045E:0B13.0006: input,hidraw3: BLUETOOTH HID v5.15 Gamepad [Xbox Wireless Controller] on c0:bf:be:27:de:f7
    [  876.429368] input: Xbox Wireless Controller as /devices/virtual/misc/uhid/0005:045E:0B13.0006/input/input28
    [  876.429423] microsoft 0005:045E:0B13.0006: input,hidraw3: BLUETOOTH HID v5.15 Gamepad [Xbox Wireless Controller] on c0:bf:be:27:de:f7

lspci output:

    root@livingroom:/home/ajhalaney/git# lspci
    ...
    05:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter

and USB device:

    root@livingroom:/home/ajhalaney/git# cat /sys/kernel/debug/usb/devices
    ...
    T:  Bus=01 Lev=01 Prnt=01 Port=10 Cnt=03 Dev#=  4 Spd=480  MxCh= 0
    D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
    P:  Vendor=13d3 ProdID=3610 Rev= 1.00
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

Signed-off-by: Andrew Halaney <ajhalaney@gmail.com>
---
I'm mostly following similar patterns here to set this up, and
am not sure how to validate the WIDEBAND setting is appropriate
(but based on the other entry it seems it should be).

Thanks,
Andrew
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 279fe6c115fac51dd941eee2d496392917e083cd..ce534c212431157a382fce75f2b6657b6c9c6c96 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -610,6 +610,8 @@ static const struct usb_device_id quirks_table[] = {
 	/* MediaTek MT7922 Bluetooth devices */
 	{ USB_DEVICE(0x13d3, 0x3585), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3610), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 
 	/* MediaTek MT7922A Bluetooth devices */
 	{ USB_DEVICE(0x0489, 0xe0d8), .driver_info = BTUSB_MEDIATEK |

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241224-tx55e-bluetooth-3a35440b0307

Best regards,
-- 
Andrew Halaney <ajhalaney@gmail.com>


