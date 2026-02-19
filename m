Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33EAC531EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 23:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FrHlSkp37yYjUZdmhoLkWWfswktOZSb++6lxqz9IBM=; b=PNXy+BSYkM+6NYUx3xp140FL4I
	MUaLjZiZYSURG2kN93XZDl9/65nlKHPVA9iEbgWV86dUPj/KLJkMIj1ElqCRUHGTaicirV3GOoaF8
	PhfYp4qiO1Bvo+m2pO3aQeUfOQpR15x6eGBr3ZKeUrw+acfJkzZJC5KMy9groqKWyrBp9iw6YBALA
	0+6BQj1puRNBPCnnCww/KJ59S3tNo0fJ5ytersa8Eyl9iLYz5m6Sjl8SOOKlX0IELDsQOxc7t6gJ1
	X5JC6aYDHPHMGsTfrhJ/m/qTZiSLT7CG1P4hPieWiu+0rP9fJW3ncnwHwhaPxmRpWUoxkji3zCT5c
	e4H2e2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtDGB-0000000CRz5-3EBQ;
	Thu, 19 Feb 2026 23:16:39 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtDG9-0000000CRwx-0qY1
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 23:16:38 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-413d8b8e98aso675937fac.3
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 15:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771542996; x=1772147796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2FrHlSkp37yYjUZdmhoLkWWfswktOZSb++6lxqz9IBM=;
        b=QZDc547UCTPjCBr/Y3Sucsp3yk7ZFn2rvegq9Wjgr/GX3tuuRSVA3bvXqPM9QD9qu/
         GASKlQBccMHl3BDiSHo9ibpkt3w2hwG94yDRHkp2p6sC7ZhsMVZCzzU9v+y6T3uZbEM6
         kGhFM0RKESoWjZTnPp4r+RQU/BPl/+rFrINOcT8MSnglViAiE+Jg5OKvSbRfXh/JT3ur
         dioKwUuMkQ1vm/jH5+BORBovcPquptrdCVlTt3YFt80Vm5CA5q0sfetLES7cyhoZeItr
         MIW9kNGr/4CyK1PUV/bb4G+FzOG0fsU76WB7uW4jU7T2tgIMKWWy1LsKIK1H1H4W4acS
         Dt2w==
X-Forwarded-Encrypted: i=1; AJvYcCWq46L9Ei2sBHc4XkJAr6nwUT+iIM4DeNggWJtzR6U8aHSgZi1xTOedpabFUoYFlP/aw/kMWg5l3A4EzRGe8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBYvx0M4wQOrHPCztcakT2y08VkI2qqYCCY+egLCT5317qQqJI
	LMWOz+il/mZpcpMCaEcsoHSrqol1kIEcAmf2PSKkyTayiDhqtfV1pj8jlkjJ+g==
X-Gm-Gg: AZuq6aLnHyO3zZ4ruTNnrg9nwdCVK0LmTq+/K1zbtVJtwK2vv4u5nFLIzxLhWSJ/oYD
	7kFmXibTdMBRR+uzeVBOItPFCA4D5bIbisMnnET9a7du2ujM2D88wyQs4URxdFsa7JXlD4LOBSg
	ChaQaAJm5/ZxKXNMdW/Yg1XVpq2xEh90CeEWt4SDF/NMQBInbGzd9l5pdaCYb0sCBpbrMVmbL2J
	Ye4j8saWsecx+WH4FumqnbYEomVFAsBg1DnOiJNCw0t8DBKhbK7kOJk3t7hy3dYpWlWA/ktHpwD
	cAXYpwtMTsI3h1txsn4lH9SEtyYAc50xkH7/RBzHi8vv2el9uOf//vEdhqt6LnBORIKBlrpOyZY
	WvSNn9md3OP0XeCLkC0J8plCuO4+W4g3q9ldp+gr9ouM0j57Aw/D4xPLu3S26pVaZpMo0Y67jn+
	oac+m/kIKi//b/pu0AtbTtQ6UcX3FScytDj/W6iuyutCQnc1Q=
X-Received: by 2002:a05:6870:b529:b0:40b:77e0:7cb with SMTP id 586e51a60fabf-40ef3c10326mr11053198fac.19.1771542996041;
        Thu, 19 Feb 2026 15:16:36 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm26719644fac.1.2026.02.19.15.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 15:16:35 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 3/4] Bluetooth: btusb: Add new VID/PID 13d3/3579 for MT7902
Date: Thu, 19 Feb 2026 17:16:23 -0600
Message-ID: <20260219231624.8226-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219231624.8226-1-sean.wang@kernel.org>
References: <20260219231624.8226-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_151637_243505_874EFC97 
X-CRM114-Status: GOOD (  11.23  )
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

Add VID 13d3 & PID 3633 for MediaTek MT7922 USB Bluetooth chip.

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
 drivers/bluetooth/btusb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 247d6aff5e79..c8c50daec967 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -671,7 +671,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3606), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
-
+	{ USB_DEVICE(0x13d3, 0x3579), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	/* MediaTek MT7922 Bluetooth devices */
 	{ USB_DEVICE(0x13d3, 0x3585), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
-- 
2.43.0


