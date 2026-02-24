Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8A6EFB806
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 06:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yF9BrzHSjOCb61spjQQsg4By9fXphtW27Do+4p/DLZc=; b=vIOQOGLJGNkMo69qXcwXglJqro
	k3La+iiIwhqUestLOTOX+763UfRtHkT/p0fZojWRqMYGu2xVJBzl41Mgiy949l/ulhEYx4dlNnCQI
	d+a2IgRhbFggUXvwM6ON2PwxKTfm2o8xAqoHt855ryklbZsn4bBBJozXhZWQpuNuCxcn8cFdlzExy
	CZGaQFkdy2dub6tvlot0sV/vw0SxhuGtdh3hZGxrOTbWL8r0CfE8QbsEPf7uwbBCtvtOC6WxX7z/g
	+HBMvEt2Ouazr4H2Y3UWv1tWo+LxpjfxzZ3AKBKDJ6feElADTt4DemYZ3uNYqwo82egzO7Xi2JpcP
	scGadPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulgX-00000001W49-0Iyk;
	Tue, 24 Feb 2026 06:14:17 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulgU-00000001W3Y-3BOJ
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 06:14:15 +0000
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-66ee7b9af94so2020530eaf.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 22:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771913654; x=1772518454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yF9BrzHSjOCb61spjQQsg4By9fXphtW27Do+4p/DLZc=;
        b=nxpONZrz35V5iArIj9IjYRCP1nIYYpzdOEDvBkyPW2k/+fwp9FL04cj0FlIgoBxIsS
         UzigXs8SGpTfQarhlXevVFF6m195ntYiwRFEwKtXX+BJB34pEQGz869wX3ICIlndfb7P
         WElxlDdCqeCCVmDB8yrjFYtuJdFHKKlV+nFbkat5C3yCFwQDkhD2I0uMYDxg1yVjW5p8
         Xl4PcVB5e8etgujzT1zYv1wi7KD9w8lTn9duatGsQnJqV5qroAjO/sSfMy/GwxU3miL2
         mWKZAh4VYtNctbJL16CQs5H9/3KztliM4B1ixg7q5ajpvv5BDjJmDS9rsYUYu/dP6bcg
         g28w==
X-Forwarded-Encrypted: i=1; AJvYcCWpAZ85zhNYO0QYbBG2f5++8H2JL6eZAjWh8DO+Jav2ucYWQNRvVZ8BPJQ7Hubh1LRLIS3UAngZuxWKTNw3Pg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXFq5iu+r4ZfukSR4kwJkvaaFBACW8ujCA5vXXiefjgHY7zj4m
	EJcz/Ar+IG8DxCZe8L7ORfUeFcscrWg5e3ZMkApPPNnMJiW1Z4DYWzsX
X-Gm-Gg: AZuq6aJGCnmQz2WowHcPfxKXlsD95UYOLESa7Z+Hs4PFIJ4JG494+7yNJV2jbnKrONT
	1nCtnZCthQVRMz5WJvGrM+YljM6Ia+IfNnsjJXNQK8nALZXtkoAtL+ZhZCxp71YlKoh7LpSQ9zJ
	YA5OX6Qs/IXZjWLboDzUNyMMa1NLC0a3h0cFH7K+8SNxEjJW7N21LhDu9MjzbhNSLlcZn7xSuUi
	/9KYMkRLTW0TuZ0zMDR2CLdKzb9uQHQ5JeTA4lKXfPRcMQcJ6f1N0EnTuX4ROMja3ODgq9/2Zai
	y4QwAGKI2vg4AGHbyNtiWwfnVBdg+RWuZrR1qUrHJS3P+ZVxtxW/2WppDqtzX93kiH8phONbVI/
	ll0WKKAIqNbkRsv53HgsMX/Usl5D1TNn3juzJLIrvdfKDe3daPE6wI2FNsB4kUsqJrTBrmil8f1
	yh9LE77inFOqAPs1KFKodez0GmXJxpX9r+zeCdKzAMZ8+bnQ7UMWJXXFri9mkxaCs=
X-Received: by 2002:a05:6820:162b:b0:676:7c9d:29ca with SMTP id 006d021491bc7-679c470ed7fmr5824085eaf.56.1771913653634;
        Mon, 23 Feb 2026 22:14:13 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:8ac2:4fdd:a742:61b8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679c56dbde9sm7895306eaf.11.2026.02.23.22.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:14:13 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Kush Kulshrestha <kush.kulshrestha.5@gmail.com>
Subject: [PATCH v2 4/8] Bluetooth: btusb: Add new VID/PID 13d3/3580 for MT7902
Date: Tue, 24 Feb 2026 00:13:21 -0600
Message-ID: <20260224061325.20189-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224061325.20189-1-sean.wang@kernel.org>
References: <20260224061325.20189-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_221414_855764_361AC9D7 
X-CRM114-Status: UNSURE (   9.94  )
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

Add VID 13d3 & PID 3580 for MediaTek MT7902 USB Bluetooth chip.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=03 Lev=01 Prnt=01 Port=02 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=13d3 ProdID=3580 Rev= 1.00
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

Co-developed-by: Kush Kulshrestha <kush.kulshrestha.5@gmail.com>
Signed-off-by: Kush Kulshrestha <kush.kulshrestha.5@gmail.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: newly added
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 94554097191d..3a45b16c6b08 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -674,6 +674,8 @@ static const struct usb_device_id quirks_table[] = {
 	/* MediaTek MT7902 Bluetooth devices */
 	{ USB_DEVICE(0x13d3, 0x3579), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3580), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	/* MediaTek MT7922 Bluetooth devices */
 	{ USB_DEVICE(0x13d3, 0x3585), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
-- 
2.43.0


