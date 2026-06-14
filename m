Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D7ACD98D2
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 14:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VF5JvBVv/f2k00WYR7qhvysu0ETf5EAfbIzLFMSsbxA=; b=QHu+upwxzE4uBQG3QrzagDOyfX
	/XEyN5fVuKpQ3uViXW3kAUfjFkZmv5plQ7H2iKq3W6HUOInraVeLrz6NuHnsVfBbPW56X4jk4ejEl
	9urdct+v2U5NJ0LIFB7OpDIRVTmbaaYVRldce2XZnvyqES65Ni0MuCWvmqhlxPni1a2IvTBy2cOrR
	mrVAHaUJCQ2eU6ZDumInFcNUb/znkwu3XtKfkPpACv6BnSoFB6W1leiBPleEdXBGiU44YeKyMYAtN
	CAiS9G1OCWvjoJcSwaxN+t0VEyYoyCZWAf6gfMCkAeKqTIWidVd/occdChtB4Qp4T9seOhht203ec
	b7/Xav8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYlaJ-0000000D4FK-1sU3;
	Sun, 14 Jun 2026 14:13:11 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYlaH-0000000D4Eu-0zHl
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 14:13:10 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so4478683a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 07:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781446386; x=1782051186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VF5JvBVv/f2k00WYR7qhvysu0ETf5EAfbIzLFMSsbxA=;
        b=l2jyCh9Gj9aNOOSdbT5I4vu0VwaX4sRqftSAcD6UD5r7IzsKv4UiF3Kdy29pDAwpsD
         t2i2oN2/dpWhuOKIJjVQaR6RkpVUXNW2Wv/LzAuFY94lt2zjGIPs1YTnNkKuaNZPy01c
         BG63hE7Ta9BnffP71QvTncyhpnAojUuLIu4ys/M06l2JRTosOOK9xzPbwUNnT+XFTZtX
         oGsOcyk3laeWE0POZjV8qQq9FfIZQYeYrotFoFWZtlsHGtMBFLb4HNHLRNo85GkI+jUT
         VFc2fGAA+UqRNbPp5OtQlRhxPw3LeyAAGVSKFI5rdWMoMqrFcbYlR91BmnEVXNUbPmrw
         CXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781446386; x=1782051186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF5JvBVv/f2k00WYR7qhvysu0ETf5EAfbIzLFMSsbxA=;
        b=l2zDgWkBk4nhlqXefJsf1mv8Pa0hZJKcflyYpOHmsWULQBWCEHu58YNsJIcX18jlK5
         EktnDooSahs4Duqk3l0gAggL07dnt8Dph8dWGa9KiThXqV8/3YQd9j79ihwow8UJdZ9L
         vD+SDAOIMhw7L8emAwtnte+4Wn1pkGkpLNiQKjJ8U10dLW9TrO/FhAjY35BBQkRCzegI
         jqX+saqrVkThQQu8LshyldI+78i3IimmoXN7B9+2e/Lz7GPvNwB8hdXSYMOA9VYsjK2K
         hCeAE6jANk0RCEfGGEnJv00L98G9T24UWB4vmt8oSwIE1O9Pn+yHOx4jBsKhoVL/brsR
         gYrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9uD9yBWtq7cwLQ1I2dGEZ4rloz5E+QLJHBH+LbM06x+Qs2qHd6HpdZAaTNA6kxweGOqP6SG4oYoQQDf7z1Ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYQRsSoooo3l5qMJx63sCQKAnEFLZeMyqDovq9b7i3jz01afr4
	VFqgOoVKYw0B7k2StMxiK/LL1zx3CSeQ5Lct15xDXVOoRqNTVb+/1xEQ
X-Gm-Gg: Acq92OHKecs7YFrTUYEd3cZdBkOJX/osHMkx3mQuxN46bCg4xMbXb58kxSfNf4EF6Vg
	ZtqmKeHqa2wLyTM/QSiQL3g8NgVwh5FSjX5opPP8Um3CI5srHDWjsOMjunUX33yRuKsxItoYKw3
	C6UyrAAsKk3p8CBaPrOX5f0CweGMDBsEYehxgKPnz21chA32rkWOB6xsBBME8MScNJzaEFJZi6B
	KnmaKBu8Evg+ZkKF7FnzEacQkS8m3qRE8quLf8RnRU0Fm9eax4bt/Vbi7f1y2sI2a9h7Us9XTzG
	2Du/k7YB6jV02LmbrXXyovnSx7pUZnZs7D/xm9pl+18FH5zBZvsCgTZSP64raJc0R4gcX76Ft3p
	gXPjgAzSALHWZxKvc8R6vmDCd60j7vIlKGUmHYJdbLdvj/1a2AUfOypBzF3lDXhVHyeltjneNK6
	3KFsZaJHq/hKXH19csVstO1YK36aLEg7BqCpVK
X-Received: by 2002:a17:907:3f04:b0:bec:52f4:28f3 with SMTP id a640c23a62f3a-bfe2aef6ee0mr526862766b.44.1781446386268;
        Sun, 14 Jun 2026 07:13:06 -0700 (PDT)
Received: from home-pc.localdomain ([185.77.216.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c01ee8286c9sm37474066b.5.2026.06.14.07.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 07:13:05 -0700 (PDT)
From: Kirill Shubin <kirill.kz.902@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Sean Wang <sean.wang@kernel.org>,
	Kirill Shubin <kirill.kz.902@gmail.com>
Subject: [PATCH RESEND] Bluetooth: btusb: Add new VID/PID 0x0489/0xe156 for MT7902
Date: Sun, 14 Jun 2026 17:12:58 +0300
Message-ID: <20260614141258.1011-1-kirill.kz.902@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_071309_293203_8A61F06C 
X-CRM114-Status: UNSURE (   9.93  )
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
Resend of the patch originally posted on 2026-05-04 [1], which has
received no maintainer feedback for ~6 weeks. No functional changes;
only rebased onto the current bluetooth-next (the quirks_table layout
shifted in the meantime). CI passed on the original posting
(CheckPatch/BuildKernel/Sparse, patchwork series 1089463).

[1] https://lore.kernel.org/linux-bluetooth/20260504190353.9358-1-sean.wang@kernel.org/
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 08c0a99..7f14ce9 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -679,6 +679,8 @@ static const struct usb_device_id quirks_table[] = {
 	{ USB_DEVICE(0x13d3, 0x3606), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	/* MediaTek MT7902 Bluetooth devices */
+	{ USB_DEVICE(0x0489, 0xe156), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0e8d, 0x1ede), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3579), .driver_info = BTUSB_MEDIATEK |
-- 
2.39.5


