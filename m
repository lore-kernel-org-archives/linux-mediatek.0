Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC495EFB806
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 06:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBi0KV4tHa8KBD7kEKQpz1gga08zIPx2odpRduDjg3g=; b=sjKPAJRZGgrn5Drvxdm/3h5dpf
	YOupTxJ0UPeIs18Ow2ABvCGMVzggzYwN+UbWj/Ciw0XksPxvSMgrC1GiBaIvwZ64BJuC46hZJ7jCp
	dvgZtW6wjZ17xCX1XruXrsVoUV2hKFndprOmRpeqFURAeJhTbrfeeZfwy/PX6WYATVhHh8/OERa2F
	+LZvre7dtc+Svc/F/6GnCWkxfjnjKzWrf4EPTC5O6rLUlMgNRoieu9koWJfaaeWMgy7B0Wkv6m/Nw
	A2o80BddHgwzwLjSqVIdhcBn2AtYAr4Pe+Xp8hHJqTCq+bUfXtQcW+OdG5gjMh5sr9hKRRQuRUKof
	IgBW1bAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulgd-00000001W68-3N4e;
	Tue, 24 Feb 2026 06:14:23 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulga-00000001W5R-3MMb
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 06:14:21 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-677bb1c3a9dso1375486eaf.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 22:14:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771913660; x=1772518460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DBi0KV4tHa8KBD7kEKQpz1gga08zIPx2odpRduDjg3g=;
        b=aZE9jsP8dUD8JS4bDRMknC9ugWENgdV6wPEo95JSTzlM12z6H2T+CTVLUSI+DO/wgk
         Qkc1P1IzeLi9b6Qtcl70ptqSA3qjb3um+ctBh9KEicxUGRYMUqQEKoYVisi9nGcgg0fy
         lz0tWnUluN46FzUvAWyXVRvcvhD72YH3/9sImePR1WNpYUpR9e37JPoLcS9xnZtHSlgo
         Lcg7XM16ivqS+HkIp+wFRF9k9ZGxiIq+juEm1ZQjdWcrSyJk11eKIS9C6gciAXw3dQfF
         VRwGjALTWLpYYDB0N1/awmdFLc717zEEclP5+KeUIdq1BxVNcypcZkr+jfYULXlFWa5C
         qMTw==
X-Forwarded-Encrypted: i=1; AJvYcCUizYVhG3Cp3ZjeA/AdvLG520DMC7zAhZRUhFBzL8XDpMipcgtXa6Lwvcmf1NKxyi/uNy2d1e9NdVq3pll9IA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuA0+964/kOUkbwBAiOT7cCnMAe+StDpdIgBHPUIgQCpRxRBqL
	V+8MldIvmwqbOspwVSaqfHB9MMSBKnM8Q64Luq9uLQmJGx3egMRyv8H31ryRlw==
X-Gm-Gg: AZuq6aKkbEWN5lq36MnXACE64pEuk1Q7rtRp1/HcpN7Olb0Ko2FI+bWDNbyT01PdUN2
	4/HIDoJRVYUsW2oLF2d2PKa7Lb5nUfi9hNHSNd7Xv5ZD+VX/9NUjT97MdNo0VU7oiTZmIt1srKJ
	q387USLzR2BwAAC3ACvEJZ55C0WebXoNSjL+SqxMhnosRfmHYyn1ijQgYRWhMytZ+lVNhLfduJE
	btm10vMrF51hlxvKRYc/ZkjG/2Tc6MTkDYhqTdxOPGLeA6NUltqvBif0fTNSBMFwVYK+zfRww4y
	CfQtoMuIKS+vTyEQoqSiCJ7uy5Naz3wMZJLuwKOSulRNJDvaj1K+IXq/jMn380WaUTFczmnVGU3
	ChYdFSuVgy6npSDaJbOn64iLXthQ0iK7HizLM4yiCBezxG3QptDrVQXW8Vn3Eb+lDQWU3brNqWk
	S+qvhbMChL2F9w3LUD7yWTMdjG97OmgOrtZYCAfVx/l/yJd+0tyCOb64gApspIiFY=
X-Received: by 2002:a4a:e7d3:0:b0:679:dcb5:b848 with SMTP id 006d021491bc7-679dcb5c59amr953575eaf.63.1771913659653;
        Mon, 23 Feb 2026 22:14:19 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:8ac2:4fdd:a742:61b8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679c56dbde9sm7895306eaf.11.2026.02.23.22.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:14:18 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Kush Kulshrestha <kush.kulshrestha.5@gmail.com>
Subject: [PATCH v2 5/8] Bluetooth: btusb: Add new VID/PID 13d3/3594 for MT7902
Date: Tue, 24 Feb 2026 00:13:22 -0600
Message-ID: <20260224061325.20189-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224061325.20189-1-sean.wang@kernel.org>
References: <20260224061325.20189-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_221420_844790_701F8DE9 
X-CRM114-Status: GOOD (  10.19  )
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

Add VID 13d3 & PID 3594 for MediaTek MT7902 USB Bluetooth chip.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T: Bus=03 Lev=01 Prnt=01 Port=02 Cnt=01 Dev#= 3 Spd=480 MxCh= 0
D: Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs= 1
P: Vendor=13d3 ProdID=3594 Rev= 1.00
S: Manufacturer=MediaTek Inc.
S: Product=Wireless_Device
S: SerialNumber=000000000
C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
A: FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=81(I) Atr=03(Int.) MxPS= 16 Ivl=125us
E: Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E: Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 0 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 0 Ivl=1ms
I: If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 9 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 9 Ivl=1ms
I: If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 17 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 17 Ivl=1ms
I: If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 25 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 25 Ivl=1ms
I: If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 33 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 33 Ivl=1ms
I: If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 49 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 49 Ivl=1ms
I: If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 63 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 63 Ivl=1ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E: Ad=8a(I) Atr=03(Int.) MxPS= 64 Ivl=125us
E: Ad=0a(O) Atr=03(Int.) MxPS= 64 Ivl=125us
I: If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E: Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E: Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us

Co-developed-by: Kush Kulshrestha <kush.kulshrestha.5@gmail.com>
Signed-off-by: Kush Kulshrestha <kush.kulshrestha.5@gmail.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>

---
v2: newly added
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 3a45b16c6b08..0f1bd9b5d296 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -676,6 +676,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3580), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3594), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	/* MediaTek MT7922 Bluetooth devices */
 	{ USB_DEVICE(0x13d3, 0x3585), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
-- 
2.43.0


