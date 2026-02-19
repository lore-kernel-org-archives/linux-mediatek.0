Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E119E9A05F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 19:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SWGz+B8eMT0H/TO7oSEQ8rrfEO9SmYPAxbyblFO9GZo=; b=H+vLZRHZgbWmUoWUQtpDu+ultW
	PyZOOlH8k8HJ2UswFyG/h7WMoEelDydhQEnysZegT1PTrHWVIUD6bVgWXDcO4hav43qkT4gjbzr7Y
	CzsAQ3L7OloJmfbuWIKTQulDsNV6lxk0EoM+ZYn+5ycnPXA6n0r2cOJTqhd2OY2gEE7fjzyeUWeZF
	aMJWA1tZEgKZF8BUmEUtyaxHowZ5Ew2uNvFMyP0x+xzt3kH4xUezibO8bPhasGrMjTxDJ+Pe6E8OP
	M3MXyiqJMdSt3D2L59FfKaBH9jhcVMtZdxddTw7HKEwAh4q1BlaecYHRyrKDLjNgKIeBFC3rdlpcN
	jvZ82OeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9lj-0000000BqqM-3r86;
	Thu, 19 Feb 2026 19:32:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9lh-0000000BqpY-2vPP
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 19:32:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4376acce52eso838933f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 11:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771529576; x=1772134376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SWGz+B8eMT0H/TO7oSEQ8rrfEO9SmYPAxbyblFO9GZo=;
        b=HfHiurHNp0LBNH87s86davL7t/wJrVC219UI7kGorU7EQWQsoAJNsDyjb85O5WQ6wb
         8uX472F0JGVvWxk2M9TCKc//TduJ2N6X/+5V6JloRjBXFgIsr8nqE5AC5UHp0OtuBNMv
         p5c2QqzQT9P0V4+Be4cLmqbe97FtVJ0bbjB6MxIuWOCU+xVeX01Ekg08oXtuGaNEezTg
         nBTCwuT2leNwu4t/I5fqMppMblVmMC9dF+eynremNEtVKTk4TYY/ml13phMtRL5bsBDT
         zwxAH4EdUd8Q1VauOqXJaTvNEcPsYfcovivEjI6PKlBex9nZb4TrLaCdEsNi13jHBxbw
         S3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771529576; x=1772134376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWGz+B8eMT0H/TO7oSEQ8rrfEO9SmYPAxbyblFO9GZo=;
        b=QkrLZ+Zq45ECK4cBwjuRO/TDEIwYKfoJebIfkWCV7S28/OCUXiNZp+KDWJqgarDr2m
         IzpTz3Vv0kj8R7PS/KBo9X69Iw0+tXhjTKxAQyTuRz48INzgCicpMRkXbIy2P7JcqTtX
         Jpa8Q9SFVmX8LLfivqyMSYJkyM0l8jdPrMoI5nQqqUP4l3PDTkf/fL43rzjW67fcjDFi
         YWE3USVfilgupohaHieYfH6ZNmY5P1eKSTaxdAbJJaN5e9e9TzDJSyd2kHPVIgntXkZ/
         kI8eOYQeuGWHEd3zI+w/eU0DTtBJ8/ispJWBBw22SNOcY1Zh84WF211Ia7rcfMe5JYPq
         0+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVQLWBMHsSjIwMDd+39basLl/twV5Y8wYy4Yj7PH7AlgNiyK1HWDhjXb1+mZstHMS+6/iKt1XrlSu8qqvT3Vw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2seo0ehkQ7mFOUBpVo8JAiFCxA5ttUdpMwim25j8hChE9UbMT
	pnkYZ8YsarpHO+rXualFiebqGD1iU0Kn4lYW2fRKLsvwpVvvJfLq27I=
X-Gm-Gg: AZuq6aLMihWoiQ5/o3Q7uKaCV0BeKnhX7nzt2Yg1vIHlVJgYTd+JRfnToPXCXl/T3sF
	CgJiZ83KeOZOldLT35VdGX1L/ljBcD666BNO5Ag3LJIOMkPFe5gX1reTOm7NINJwPChBl8Ci6uX
	AGOebpXLSxpUYrBj3dyKsHr554ktVwGL+od6t6yb24Zc7Us+GIrQ/rzazOU74578cRcqmbjOeLD
	dqt2HDDZ+4eOFVSj5pKREPEYzPG1rvf6Equ8qxNuzFzF28MeqLejVZD7rNVrtr9Gq7LN5dM204p
	80nCVBQLQUs4PRlKLfZVKEkIoDJWf+b7uwYjDKqJg7NLcB+L9xatVW9UFKcmxO58rWWOEpuRLis
	6y+cvsIzogsR15CZYiYI60EoSiiA9jo+fgGsYswHRKmbksYy0mGCV6Rbjaf+1FCAmbaKU20KEA3
	onet6G6r79F603ykgOjqrCTF9VBC/FmLm3Q0nU1nvu+0NQyCRw40b5d1z8TrckXy85d/VahGkiD
	rY=
X-Received: by 2002:a5d:5d8a:0:b0:437:6c07:998f with SMTP id ffacd0b85a97d-43958e4b8e3mr12040212f8f.45.1771529575675;
        Thu, 19 Feb 2026 11:32:55 -0800 (PST)
Received: from archlinux.v.cablecom.net (77-56-128-136.dclient.hispeed.ch. [77.56.128.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac800esm53981412f8f.27.2026.02.19.11.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 11:32:55 -0800 (PST)
From: Dylan Eray <dylan.eray6@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: luiz.dentz@gmail.com,
	sean.wang@mediatek.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pmenzel@molgen.mpg.de,
	Dylan Eray <dylan.eray6@gmail.com>
Subject: [PATCH v2] Bluetooth: btusb: Add Lite-On 04ca:3807 for MediaTek MT7921
Date: Thu, 19 Feb 2026 20:32:09 +0100
Message-ID: <20260219193209.69937-1-dylan.eray6@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_113257_753815_67C55952 
X-CRM114-Status: GOOD (  10.73  )
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

Add USB device ID (04ca:3807) for a Lite-On Wireless_Device containing
a MediaTek MT7921 (MT7920) Bluetooth chipset found in Acer laptops.

Without this entry, btusb binds via the generic USB class-based wildcard
match but never sets the BTUSB_MEDIATEK flag. This means btmtk never
triggers firmware loading, and the driver sends a raw HCI Reset that
the uninitialized chip cannot respond to, resulting in:

  Bluetooth: hci0: Opcode 0x0c03 failed: -110

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below:

T:  Bus=03 Lev=01 Prnt=01 Port=09 Cnt=01 Dev#=5 Spd=480 MxCh=0
P:  Vendor=04ca ProdID=3807 Rev=1.00
S:  Manufacturer=MediaTek Inc.
S:  Product=Wireless_Device
S:  SerialNumber=000000000
C:  #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
I:  If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
I:  If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
I:  If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Dylan Eray <dylan.eray6@gmail.com>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index fcec8e5..fd637cf 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -705,6 +705,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x04ca, 0x3804), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x04ca, 0x3807), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x04ca, 0x38e4), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3568), .driver_info = BTUSB_MEDIATEK |
-- 
2.53.0


