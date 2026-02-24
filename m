Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC45BEFB806
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 06:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jc+Zbpdps3NV1O+TlQTpIhdV1pVsPxYo95sUPq5BXkI=; b=F97HZcUG9j6fQQVZcdM+bSJKdJ
	XCGB74GfgXE/oMq6wZrqrQWFR5XNDf+v6/mJRB9ftdsupyKx0xkB4bGratF/JwYgbq6rlDdvmtVgU
	qDnSIz2z4fiaKEuR0jg9s34MIfy2cuQmj2NZQhge9rTOQkQWZrECy5nRu+QZ8TlJo1LU99hyxqAAh
	nxKcQdDjeDmn4bHweBV6FmL/wBMrXGe51ytJbDGnzSfwgy1rLxgOrDXt/iVofb0hf4KB2hEa1JGG5
	18HdOcpYLMxPLuCSKV4u52xJAUCjCwS3jV2Mea9glgRZRanVmkjCBMaIV1DvfUc//KaAHY0lms4MS
	5fOrClMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulgj-00000001W7v-0CLX;
	Tue, 24 Feb 2026 06:14:29 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulgh-00000001W6s-2NEI
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 06:14:28 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d1890f7ee4so3181023a34.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 22:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771913666; x=1772518466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jc+Zbpdps3NV1O+TlQTpIhdV1pVsPxYo95sUPq5BXkI=;
        b=k4i6gWRWy54N8HivIFWDmVJaCh08Do8aLjHfmqYPde8UCZ6eJJVMpOkX1rW8wG4MBR
         DWX+WI2GpCTMV9C5qfMTtd/sOtg0jP1YgrVTzOTHCDzm9jtUXk59Gwr/3TjlpGjNG1TC
         Gwsxn4CkLYXfihMhcllIikGjx6PmdmYOkXnmWqXCHYxpDl9z/k8D5iodoGmwgXr2D/Od
         XmWRDoBv0nvWs170iv4qfNkQ1ZW1MqC7nIg0MYnrTw9CGN6cL4r2jOrzknIhcG9mtiCr
         zi4pQA/Vx2fDfGIrLqDkkmWSpqmAkTv2qbEe7LiuvsLoDwljMJvV3JYI552iMjSDt8ot
         KLEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfI3EZRLtwVCgH4BYIyfq3tWHF5fHcvVODRm5hpK1HPhXg0GGn55S+pl5yL/CHy4skaz7CuEmYQTHR9yVcIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTwQURO8VsToAp+yMMwIyUFz/64/H8+XYx2+jUnc24o+57zIOa
	/EkNrDSMDyxRmrR+M0HG63YqOaMSoTE0rsOsB7Vx3e84Pt47EyfxeKDA
X-Gm-Gg: AZuq6aLjxp50hb/FalkiFHDDRMpFTNc0++yWDKoJAPnJzx/POubumJamSLbCPI1BLL+
	fDmIbfGh2C640HLzXLTqpklv93rANffJken+W/EsEAjBuz/KJYAueKJUR1rAA6idcvZhfD4YMio
	KPfwVLogki+FDUzErLsuXvLOf+0bAiUk/760fr3so4rXvT0RdOel7ieSu2HXZCBBK4+kmzppEFz
	++kSR4adTK/KE8R1YLYu1NYzpo0KZVhznZb/gvCxQ/PodWFmqf9Mh6sQ53kSIpaZ3AzJTcDR5zc
	bcTESP8Kz/vzHyojDye7uQoVjx7eWgL+P//7//Kh3bwWGB6iKrxRu7I4gBD6XkQ+PMv7V3aVr0J
	D9gllelFcoiEoizvZ3qYqlFOqv23kZRJGl0v0eyfu76xYBPpLe7JEA/Zp4TuQ2x4dwzuJE7K9T6
	2cB9k8zfYJOIGsnfodEn0hERQVYbXBLRA1nRhfAio/Jp0jII1DVZiF7S2IXrHXvnEP166mCWaQ5
	w==
X-Received: by 2002:a4a:ee88:0:b0:679:9844:698a with SMTP id 006d021491bc7-679c46e947fmr5857920eaf.55.1771913666519;
        Mon, 23 Feb 2026 22:14:26 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:8ac2:4fdd:a742:61b8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679c56dbde9sm7895306eaf.11.2026.02.23.22.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:14:26 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Kush Kulshrestha <kush.kulshrestha.5@gmail.com>
Subject: [PATCH v2 6/8] Bluetooth: btusb: Add new VID/PID 13d3/3596 for MT7902
Date: Tue, 24 Feb 2026 00:13:23 -0600
Message-ID: <20260224061325.20189-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224061325.20189-1-sean.wang@kernel.org>
References: <20260224061325.20189-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_221427_611833_745D3348 
X-CRM114-Status: GOOD (  10.43  )
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

Add VID 13d3 & PID 3596 for MediaTek MT7902 USB Bluetooth chip.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=07 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=13d3 ProdID=3596 Rev= 1.00
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
I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
I:  If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
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
index 0f1bd9b5d296..4e8bf032d35e 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -678,6 +678,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3594), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3596), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	/* MediaTek MT7922 Bluetooth devices */
 	{ USB_DEVICE(0x13d3, 0x3585), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
-- 
2.43.0


