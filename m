Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50DBEDF142
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Feb 2026 08:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OJhZ6X3qHQLlGKjG9LB5k56TNXFVKGNDz+IqQMuGJ24=; b=0klWPvMSD6FDe1dBJ62MO+15a8
	GMKvHEvcMG8EMdtdIMwd1hcKzQqgqBD4sFcJyiKz/Q9b3I3vIcKzQv0ZjuyIx96BlKhI97kYkXR9t
	SJFLyl5oVcB51peHfJx+zOUBfnBxSgVAkMdk+Wt9n+z1Vb79PXPK1W5MHI37dofD8eom+8EuEPoU+
	JbxyetHT5YBDRGAyWWDtZC/u8JQxW2wqoB3S2yVmNXmg8DF0snyiWv/wL7mItPNQfDL7Qyp5qdQ/L
	40bvRMPXNoSdquBLKttclC+aMkHWRcI4sO5Y72yMCu9R1lm0+Q3j2x2eKW/2OK1jRtyguCE33KHZ3
	dBdSJBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrB0Q-00000004OrD-1mKp;
	Sat, 14 Feb 2026 08:27:58 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrB0O-00000004Oqs-2YVG
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Feb 2026 08:27:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ab46931cf1so13533255ad.0
        for <linux-mediatek@lists.infradead.org>; Sat, 14 Feb 2026 00:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771057675; x=1771662475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OJhZ6X3qHQLlGKjG9LB5k56TNXFVKGNDz+IqQMuGJ24=;
        b=Dr4IuVzjmw9QlXnN4PngXm+oNB8IDqxKz28oKyG+zEaad9BGngbSzOpIv6I7/CIBZJ
         jj0IgU2rYIMd/WHdtEXM8UKioM6owDdvbHINxJXawwZpOs1i2W5NHi+q+YTlVbJS7hr9
         UW6NXii3OjhOHVJSj8L7/eUVSHH9juN7QZQ5dUGKjPIPCUV8j7FYDlCTwW5EkPIXwUw7
         yAlgcp9AuE6Tnju5OhEsvQh0JjlL2f5/6MoPejRlqBBCOKxFrm3adsz8RRpbNfvlDHGy
         I/qphuW5z1knXbT8ldhCZuwhdZIAN/LghWLztzXZoP2etYbgiRqJJMkj6PiXTmPY3OqQ
         QtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771057675; x=1771662475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJhZ6X3qHQLlGKjG9LB5k56TNXFVKGNDz+IqQMuGJ24=;
        b=tVKqAcLGbYVgvPFz4oPK10dGIplKkG2Lu81FwKzgvynRfN7fwBUrdhrXWSCytD5a+0
         sj+UC+K+VF3nz7itrtQU1xxx2apjCInNZMH7+HFyUX+o23noWQD0gURJ0lLyGxEi4Rhj
         uRZ54siO+72CuK40yvqycoDRRMQYHpDAkb9awxoiN89Jk+C3Ib54WibqRhAj0O4r0QGu
         GhrJl4V+tJkNA9ar9X8zMExUr/H60/GeFqWNRDNUCnJlhSqMyyk6iBzt1VSMAthWiTI3
         Eq1gsKk2L3srrZ9BC8z+VTHH8kvR0ZhIakg5SFUCCZhrcrU+fXF3+910CrBVxxd9KN+4
         5BGg==
X-Forwarded-Encrypted: i=1; AJvYcCVkzHvmPzA97lyux1c56R03oWcDIJF47eSdmx4LnhU5cVKcDvM+ayUc29k/rDtGFX1ZbIN0fEhiNCG8af4S+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+HRyCqC0hLojIvOY289ZaJhBIa3bn5pY2I3EojlDWJfGRCBru
	RPqVFgEfCeVWHmiUnnZUA1hBNS0ZHoQjvuwIMz2INHSlWVHcAngxqlri
X-Gm-Gg: AZuq6aK+qQqbXS4zyWOku25/KKlaZYyrGFD54oqFbuSAgSHJ1GviKBVitHbhz+EPXuu
	+NVuq8/446m9by9b5mcjV77mINSN9rUAQrvzuO4AnJxdgeWO0tl3g7/QU5vU0cN6Kh5a8ZUhWRb
	JxvpNu4SS9eLPrWhLQVnHfZJTmPG/jmKEDP2bLbaRVOTRTY3CpR8GxN2BFN5qw1nMmz0xjQMhJY
	fbb7lpfGWE9Fcg3EZ0See0Pr2raZA5c25U4oAI4jvGkxfVvdSi9SNnHOUBZnPHL0ivTm5t0I/FE
	CH/Zx47ySXYAmCyUsVmtfHdC7cU1zJjVEnVmC61o1el18epB+veFlnUMwbsOyAzBmfVJVXxd7IE
	tgS+kfDjvZyhenQ46KoAPjvGDvbl93Ibf0nkR2vdl1IFI4CdJ2t7Zq3XtEEKw1y5hwT8YFvf86W
	4u/DeCwRxO1O1vPh/jmOnuKLKnNlyn6b+dHiuCK/zDS5Aaxtm+
X-Received: by 2002:a17:902:f547:b0:2aa:d5b1:194f with SMTP id d9443c01a7336-2acba495a44mr28702715ad.30.1771057675271;
        Sat, 14 Feb 2026 00:27:55 -0800 (PST)
Received: from kush-pc.lan ([157.48.94.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5d3asm13412975ad.51.2026.02.14.00.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 00:27:54 -0800 (PST)
From: OnlineLearningTutorials <kush.kulshrestha5@gmail.com>
X-Google-Original-From: OnlineLearningTutorials <kush.kulshrestha.5@gmail.com>
To: luiz.dentz@gmail.com,
	marcel@holtmann.org
Cc: kush.kulshrestha.5@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: btusb: Add support for MediaTek MT7902
Date: Sat, 14 Feb 2026 13:57:38 +0530
Message-ID: <20260214082738.139047-1-kush.kulshrestha.5@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_002756_653952_EFB6B5DE 
X-CRM114-Status: GOOD (  10.12  )
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

This patch adds USB IDs for the AzureWave/MediaTek MT7902 Bluetooth
module.
The device IDs included are:
- 13d3:3579
- 13d3:3580
- 13d3:3594
- 13d3:3596

Signed-off-by: OnlineLearningTutorials <kush.kulshrestha.5@gmail.com>
---
 drivers/bluetooth/btmtk.c |  1 +
 drivers/bluetooth/btusb.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index a8c520dc09e1..b793947dd920 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1323,6 +1323,7 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 	case 0x7668:
 		fwname = FIRMWARE_MT7668;
 		break;
+	case 0x7902:
 	case 0x7922:
 	case 0x7925:
 	case 0x7961:
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index fcec8e589e81..13a2aa13b9f4 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -629,6 +629,16 @@ static const struct usb_device_id quirks_table[] = {
 	/* Additional MediaTek MT7668 Bluetooth devices */
 	{ USB_DEVICE(0x043e, 0x3109), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+
+	/* Additional MediaTek MT7902 Bluetooth devices */
+	{ USB_DEVICE(0x13d3, 0x3579), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3580), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3594), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3596), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 
 	/* Additional MediaTek MT7920 Bluetooth devices */
 	{ USB_DEVICE(0x0489, 0xe134), .driver_info = BTUSB_MEDIATEK |
-- 
2.51.0


