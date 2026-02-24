Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC842EFB806
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 06:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iff0nX3eVlq1aXN5uKCYb/BBxBzq+NNIR/1dGHBeD1Q=; b=1GyalZmY845/XiVFz6CiX1vwl0
	8kMhC42VtCQs2SOaGoPNhm9RfKOI9UUkka94Mk5eG73OSwwvXdkDrFzCnRIgqo1fJe+AtikryBKDa
	nZJtSOWKimdy7HKeBoLMRmP+Rj4OSyh1cWN+Ou8FRCyEIkeSN8vDJJM558beLECLwSR1qAkT1y9Xd
	f89K3dQgnrHKjczSoqTAkacLKJT8erbIdNcRCIBQRrX/fLHHYJ+L9e6Xs1H3waDW3c8CaxNKfjwRU
	qlL4rOmSNuTI7/3ecALNybMi7oYmjFRVHFp5F3CFxFA3NLXMqL59Lqd0ls6lSCC7o7+kev/Lji3j1
	tZCvXM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulgn-00000001W9K-1ETr;
	Tue, 24 Feb 2026 06:14:33 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulgk-00000001W8L-3xf3
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 06:14:31 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-679aebf4e56so3007121eaf.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 22:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771913670; x=1772518470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iff0nX3eVlq1aXN5uKCYb/BBxBzq+NNIR/1dGHBeD1Q=;
        b=injZxWCmz4qZKaVCOKilQwjijfOJJLiAKnDYPX3mvx8i2pUBHTMwVLoxj+ADY8OVYU
         uvHoM0V61xaaSD45cukR4o1lmUXbr8wFBDpeOxSAsfszXecynN2Qab6+1ZZEDQykCmRx
         NwLqLGpaPgU0J/4cd290jP9gpgHNPJOpgQSsYcVWsVl1wE6kBv99/Xc8M9fFQTHyu5G4
         2Tem5PJ5fn1FXPrAavOLxo9Eb+ghlMTrXBvPtHdzakS2x0ejE1TpgMWofcjq3rbz98VB
         kXVJjVvrgj2ICToft0CY7MefIKlS+Rsr5PfioXj4FqGrTRRO3A7cPQx/UYh6o3Z31cSB
         MAeg==
X-Forwarded-Encrypted: i=1; AJvYcCX4ImN/9j/ZZ6hPdpxNkuVi/G2YO45YZQqTWb9uM8WRp9SzMCHcIjcqhf38hNYunIxx2N5TrPRmzyXpVNUrVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOGuSv4/asvA1nx8CDn9AjUO0n1vaSTurDkTHYRY4JxTJza+qj
	7gnC4mRRJkv/2gGXz1Qzuqe0RN0O/E72ynbC6uQWwJaazgsOTMlQPazV
X-Gm-Gg: AZuq6aKnfsQNW92L3/owI2zrbajUErW1yO8c1NKAtRCJUV77zH2rby67TdgSk/QTihm
	P5biBnoOyw1IqFAMXK+NHFIcx5PKZSxmVc9PCSR7042V3qMTZ9ZylhjtQNWOP3nBVNZnmDlSY1s
	XrzQpiu0piDOh0iaj10EvAAsmXAkdYxXzGTqtGVcIqkffdZ83uhSLOWYQliIHN7deg44HpCB4SM
	e28GHE3JSD25IdweJOj9pxBBHOVrAGUnb7eYHqJJ5FYor1zwaa4ZjTLPPGRRT/Yk2MlUDYSIb2O
	nb71a2Zdcu5xlm1Etk61AFn/S/LEHSJneWu0nTp/P94pSZxQiW8S46+SHCpeMPfGNkzFGYPQDJI
	ukz4u2zDR6Z2ZNObeaTeT8QRhkPbUOqNrnHtpszCD0Zg4pjoqTqpu15lXO0unffu47R/7gm23xk
	E4wf++hkQlFsUI+L9HaQ4vLBT9KEbaCObIAUahPp0YnIKky+1zaZbaa2LC1VaWSeg=
X-Received: by 2002:a05:6820:221e:b0:679:c369:9ef0 with SMTP id 006d021491bc7-679c4259c8amr6083665eaf.15.1771913669779;
        Mon, 23 Feb 2026 22:14:29 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:8ac2:4fdd:a742:61b8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679c56dbde9sm7895306eaf.11.2026.02.23.22.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:14:28 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: [PATCH v2 7/8] Bluetooth: btusb: Add new VID/PID 0e8d/1ede for MT7902
Date: Tue, 24 Feb 2026 00:13:24 -0600
Message-ID: <20260224061325.20189-7-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224061325.20189-1-sean.wang@kernel.org>
References: <20260224061325.20189-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_221430_986364_7E5BEDAB 
X-CRM114-Status: GOOD (  10.32  )
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

Add VID 0e8d & PID 1ede for MediaTek MT7902 USB Bluetooth chip.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=01 Lev=01 Prnt=01 Port=05 Cnt=02 Dev#=  4 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=0e8d ProdID=1ede Rev= 1.00
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

Co-developed-by: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Signed-off-by: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: newly added
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 4e8bf032d35e..a5e44887a5b5 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -672,6 +672,8 @@ static const struct usb_device_id quirks_table[] = {
 	{ USB_DEVICE(0x13d3, 0x3606), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	/* MediaTek MT7902 Bluetooth devices */
+	{ USB_DEVICE(0x0e8d, 0x1ede), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3579), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3580), .driver_info = BTUSB_MEDIATEK |
-- 
2.43.0


