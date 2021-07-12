Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D94C11F66
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 07:33:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 640B261947
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 07:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 640B261947
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLiRh3BZokTq0tD/ybMxmdH7OTSnsQomNgHAZDO326w=; b=QmeiGzz09YLu5Z
	Ia7wHfI76BPGpaTrbry9foMOfjkKNO+1PZ0hKw0WszTJExhFR5/I1PeLY9gaI/PZbFbf5o6xXGE1E
	qw8YFYRoQgq+eHl84vkLN44O2FAu/D5cb6jTfPJUVI4tvDAsi79Fs5mPWrL7QBhSXxyvRWh8xjDTD
	2+WjDoHrDZ2KmzUbCZLbzykVJBnwkBCkOI3isr0CRxd9VEnSAFu5aOrrmUV9kro8hcptHbU0Co/nu
	+Pu6iE/awlRaplbJ9mrGblsZvsHCmn/BP6U+7WeojBMHlZyKje0SOaI0HCpyOSxNrjN1Ap9x5TSWz
	PnlMzXRyN1d4JtRwZr4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2qR0-006NVP-07; Mon, 12 Jul 2021 07:32:58 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2qQw-006NT9-Tg
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 07:32:56 +0000
Received: by mail-qt1-x82f.google.com with SMTP id c9so9220249qte.6
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Jul 2021 00:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7516QFKCbONFu1K4UM0Mfb3rZBvmchK7pEHlv8tiP/s=;
 b=mszEFKbKWeSyvVifSeriXR9rZ/pP1xKlJ1f9aqWHLsS9QilBHOzMbxSVcxTYO/ORTX
 fKW3ZRa2hH9EoQETxAARImaA5+BbHDOQcsTyfTd8PiOZyCi4oo17USOvj1Dhu/ECKj4C
 7JokpZHgNdsGD5h3SkvSfmsAZ94tNbr1DYbNcCLc+PHMkllsCaRrEa5A3BcMUs1HfziK
 64rckuHCtvBWsAZfMhIiT8cA61vvdAI+81JcE6hRnYqzEJmERECBFI8sb+kYvNF30WW8
 l+Sxfj7224hfw66/kMH9fhkjt34rtKmufNox/qCDdf/KQ2x1fK4Fmpz5ud6EOHKOFlG1
 Md6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7516QFKCbONFu1K4UM0Mfb3rZBvmchK7pEHlv8tiP/s=;
 b=nSaODtxwznV1xvdT0TeKkNYcvm5IvBXxk201/cP8DBEooFX7oA8lVzF05BtlzEbGPG
 8k4DyAUz+r9BhrqVpU8jq+4SHBACIu0aB2pJHHJGlLeuKZpVyferg3Mfy2r6gPfIn+8l
 cCNGykJR4IPpJbHHchhqgUwgaSKGScUaYi/96erqmWiGXmVAuo7W4krXObuvjFHa+L69
 xjiTbX4vl6li1ftPPbQUUBrz2BzYWJLtu2l5ZlN9Jt/bxsg6VmYg76LpZucb7ROySMzm
 0LlyZ7Qhixd+00iGzPU+6Z9/BBfoTZ2r45p9o925ZHlvKn7jyPzMbCShEkmImbnvejGw
 ZX1A==
X-Gm-Message-State: AOAM533n/qaJS5/SK70GrmQ0jWEWphbeaBQFuVsAY/lNKlG8y/9X02O1
 qnhK9d0kSUFr9K9xGENVn98=
X-Google-Smtp-Source: ABdhPJztwwA6gBbpAgnr9bsX/jzhs+KGYK2+qzRHsVjmFIVLg5t6C11wlA9R8SRUWkhQNIzXIiaSgQ==
X-Received: by 2002:ac8:74b:: with SMTP id k11mr19647039qth.19.1626075171270; 
 Mon, 12 Jul 2021 00:32:51 -0700 (PDT)
Received: from localhost.localdomain ([194.110.112.30])
 by smtp.gmail.com with ESMTPSA id o18sm1654750qko.63.2021.07.12.00.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 00:32:50 -0700 (PDT)
From: Forest Crossman <cyrozap@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 matthias.bgg@gmail.com
Cc: Forest Crossman <cyrozap@gmail.com>, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] Bluetooth: btusb: Add support for LG LGSBWAC92/TWCM-K505D
Date: Mon, 12 Jul 2021 02:32:20 -0500
Message-Id: <20210712073220.200414-1-cyrozap@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20201021030521.1121268-1-cyrozap@gmail.com>
References: <20201021030521.1121268-1-cyrozap@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_003255_004709_E342F876 
X-CRM114-Status: GOOD (  16.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The LG LGSBWAC92/TWCM-K505D/EAT64454801/EAT64454802 (it goes by many
names) is a combo WiFi/Bluetooth module that's used in several models of
LG TVs. It uses the MediaTek MT7668AUN, which is already supported in
btusb, but this device has a non-MediaTek VID:PID pair so to get it to
work we just need to add it to the list of devices to probe.

Device from /sys/kernel/debug/usb/devices:

T:  Bus=09 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#=  6 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=043e ProdID=3109 Rev= 1.00
S:  Manufacturer=MediaTek Inc.
S:  Product=Wireless_Device
S:  SerialNumber=000000000
C:* #Ifs= 3 Cfg#= 1 Atr=a0 MxPwr=100mA
A:  FirstIf#= 0 IfCount= 2 Cls=e0(wlcon) Sub=01 Prot=01
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
I:* If#= 2 Alt= 0 #EPs= 8 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=08(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=06(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=07(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=09(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: Forest Crossman <cyrozap@gmail.com>
---

Changes from v2:
 - Specify device with USB_DEVICE again, to match the other "Additional
   MediaTek Bluetooth devices".
 - Add BTUSB_WIDEBAND_SPEECH and BTUSB_VALID_LE_STATES flags to the
   driver_info, since this device would otherwise have them applied were
   it not for the non-MediaTek vendor ID.

Changes from v1:
 - Added /sys/kernel/debug/usb/devices info.
 - Specify device with USB_DEVICE_AND_INTERFACE_INFO instead of just
   USB_DEVICE.

---
 drivers/bluetooth/btusb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a9855a2dd561..d644e704a460 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -410,6 +410,11 @@ static const struct usb_device_id blacklist_table[] = {
 	/* Additional MediaTek MT7615E Bluetooth devices */
 	{ USB_DEVICE(0x13d3, 0x3560), .driver_info = BTUSB_MEDIATEK},
 
+	/* Additional MediaTek MT7668 Bluetooth devices */
+	{ USB_DEVICE(0x043e, 0x3109), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH |
+						     BTUSB_VALID_LE_STATES },
+
 	/* Additional MediaTek MT7921 Bluetooth devices */
 	{ USB_DEVICE(0x04ca, 0x3802), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH |
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
