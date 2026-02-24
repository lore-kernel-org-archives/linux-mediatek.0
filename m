Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E639EFB806
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 06:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUF4zYwzw3l5eL7X34yaprIHZ+/TkclTpkQhDDhb93M=; b=IRpKlIOh28Hf9KmKc/JfBK/eeS
	3LVhI/pkLngEVNAzf4EGL0I6bKzv5VpM+Orw9WjOu68x37AfXero8xn3J4yOEDv+HcW6VTMt1Kpke
	7UbVDLrWYmF5kncL95gXcLQWQDcTFJ1Oi/QL5rmi0tt22AWKh5OyiejYJyvrPcEjjNYL47J8fhQrJ
	hJxOx/R7PNix43XnheVYaFFKvslOQysCFEuqv0IJbTQ5Uup8liQKIbXnPQ1XjTAYb2Ef76DLGlkZI
	POXvcW1ZS2/3U9bWOCW8Tn9ZWNOgCDqOjtGgjTwyQvuXMn5PuQXCvv7ABq8+SdP2vOgKvgiJOMyIr
	FSU3MqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulgQ-00000001W2i-3OWD;
	Tue, 24 Feb 2026 06:14:10 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulgO-00000001W2L-0OeL
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 06:14:09 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d4c1d2123dso5119973a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 22:14:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771913647; x=1772518447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QUF4zYwzw3l5eL7X34yaprIHZ+/TkclTpkQhDDhb93M=;
        b=vsfLGfLWoHZAGaPX7Ttd4T81MmpErqN7+VX7MqBQeM7Fc+PIxHvr16JEYICUbaIXHL
         TeDbsg1ZZoWaVYE8SRsyaKjF0GXbwDXQXRKNvgyIALmyUmi1+MePCHPlSoQBhnZDrQFV
         j5qKO8IsQ/32fd5M3knn5RuVZOOLa9UBK2Dj0Fz4d0nbW5+AVtRl/WpTk/bdwWgaGFYz
         QaR2+a4b5DiwKc9bPynhCRXgositzYsRzTAr3+5KTUneXtjv81LhOWRocqxNDHt8e1J+
         7TCUH8Y8N3PjNStdi0hnTfKAzc3bnJki4Xa45a3bORg1T6RQE9JUZDVGgKQPUrz6NGOY
         khaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe7nb9fg24AAoYQMadMyhYLtqG1cgidP47F9jijO77IjUfZDfMA4cc/9rTN5htfejwTmvM6dR8izt8bnaLjw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6vdu764T5deaV7Wn7ucLK3Yun3gsgUSmj4aD1Y/YDKjlSu6KT
	+1Cfv8Iq+ubUpzScKwl5jCod5vxWJ2e1Zu5zLcO1s/pWhI5C/Glr5uRf
X-Gm-Gg: AZuq6aJQITWGvRJD7dwgtdfnnFG8JbEIyrQCe0B33bqbAJFDtDobK/EI3qMbkXm2aED
	IRmZGGpMuvCEck3k9ghlEmGT+blLhqafGSrImbxrQP0CexjTBcTgJ//Nf8pwGc3/d4h1tZdJCvy
	aL3K0Jz7SKjZsud1t5aqotTOmpWTRDx17b8tzaJcq1A89WLjqp6QoPJis21hK2rJlbfGzdE/Zl9
	W7taGakgKqJmbX41Mb9LAwbDnymDe6kmcHwlFV2hdQwmD4tZb7hndzkkrOLRrhSyDZVFZkWIo/x
	QstAvrfzDZHDqg8KmCZP+8lcCUChsnJyksxkdz2yT1BgGCCFAD6FhsMwVEzBLrFRHGArnCEGb6F
	14avyAHqmq66DllEsJqsqvXHaB4xPZ1Gr7y5deZ3m1WTrv0uf8N9Ywov2Wo1CohGqcN95eFefB/
	igd+xicBcakye97N1PBjdBmh2EgxJc5+q1ou76g7WswcrkjB2KY8k/fcw76ysEAPs=
X-Received: by 2002:a05:6820:468b:b0:673:fc01:a1d1 with SMTP id 006d021491bc7-679c44a7106mr4590922eaf.16.1771913647001;
        Mon, 23 Feb 2026 22:14:07 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:8ac2:4fdd:a742:61b8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679c56dbde9sm7895306eaf.11.2026.02.23.22.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:14:06 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 3/8] Bluetooth: btusb: Add new VID/PID 13d3/3579 for MT7902
Date: Tue, 24 Feb 2026 00:13:20 -0600
Message-ID: <20260224061325.20189-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224061325.20189-1-sean.wang@kernel.org>
References: <20260224061325.20189-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_221408_141156_7A1F9FD8 
X-CRM114-Status: GOOD (  12.45  )
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

Add VID 13d3 & PID 3579 for MediaTek MT7902 USB Bluetooth chip.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=01 Lev=01 Prnt=01 Port=09 Cnt=04 Dev#=  7 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=13d3 ProdID=3579 Rev= 1.00
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

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2:
1. Update the commit message with the correct VID/PID.
2. Add clear comments specifying which device the VID/PID corresponds to.
---
 drivers/bluetooth/btusb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index d58e7e4557b9..94554097191d 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -671,7 +671,9 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3606), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
-
+	/* MediaTek MT7902 Bluetooth devices */
+	{ USB_DEVICE(0x13d3, 0x3579), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	/* MediaTek MT7922 Bluetooth devices */
 	{ USB_DEVICE(0x13d3, 0x3585), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
-- 
2.43.0


