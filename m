Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACB3E9A05A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 19:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=La+aWbMATMluSKFWFaMvl61r2uBPiwHLmJhaoS4H630=; b=Pg4EoO12SOA+6M3RN9NakeeKWk
	Jx65FIYlNnQwmdK3kbFB0t8mj8xB2QJKvN3ZqbkNUIHciwSjOzbqbjqZbVkI3daCN99LkqIo9bmDi
	EtzNnI1Wz2uheoVLzAQh8Og9lg/orFcOVzVl4RX47KI7rZyWb9dUORecFixGbWK6dv/bqj2i/CVwj
	6frvaqHZhESHzMKKE5xsUsaeuBYps9XMQRPv4zvurSforTYp7EYGAxUohpmj2m7eizyZ1v3qO4lwr
	YzguPzSGB9M8YXK9rN0YTBi8oLEQfk3DgQMT9zaMXrnfPhea2/gElWlDvhpdyXHb5sPKVnyELEnjV
	MmsqahoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9Qx-0000000Bovb-43NV;
	Thu, 19 Feb 2026 19:11:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9Qv-0000000BotI-46ff
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 19:11:31 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-436e87589e8so1314476f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 11:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771528288; x=1772133088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=La+aWbMATMluSKFWFaMvl61r2uBPiwHLmJhaoS4H630=;
        b=acn7Hn45kosl9bX5VwG+yjp0NjGNBsNKouaGs2IayCUMpNi5dwylFHDx3AKxpb/uy2
         HfdXTe74r0gWjKs6mZ2/zGPFMyedHgMigQi070JHoTh1wGCgGkCE2n+gRxy5BqjQCqPa
         CKY8HI6V0q6OJbghwTRLWXc0CJLem1buBdUhYcKGxsK3kH5nui+MS4QLKzYrI5FkWxb/
         U0NYN7RsFd+Yp1F7mh7iioWNIyiYC4CyZxkFgA9tc/L9nSu3Vag5fCP0oJb3W8jB2PWt
         2wsJYwimqRXwjWlRIbRFnNlU5bR8aGxv365Ixy0c1mfZf2JE7PhV9oPaEHeOglFZHwGq
         aPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771528288; x=1772133088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=La+aWbMATMluSKFWFaMvl61r2uBPiwHLmJhaoS4H630=;
        b=IDOjG6rmrxcDktayYEXPhmwh+D1kqbEi0E2Yeul46xOOBCax9esbe9shUArVfeNdcA
         9zqgbMBlBLCTVA5IUt2ffx9TE4y7OVo1lbaoxr9+d3ZwLoB8Xm1VdN5sKZ7emr6v3Co2
         PicyA9ECqrUh144FHvkyUBpwbv6sQ+tSRFxF3Y4RoPCz4aMUNRmAApyQyeoGtZanXYSg
         ItTP2VHWR7fvISmssOLYvZ1YskLW3iiK+Fm6oAC16QZ/rzM6MjjQFJhn5QVX+9qlXXKv
         9Gd22lOooJPKpD3PVWbVs4e1r6jJUMDwYx7oVnCn6xI2J8Qc6XYW/ugFnj9QxugHD4YY
         bd2A==
X-Forwarded-Encrypted: i=1; AJvYcCXdv6VBxyOLh7GDrWxPSgOWQIpc0lH9f6TV/Z7vVirPAI9xvpzcZXvikwJsbs++x9XYrl8FRwE5rur/rBby2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx5hYeKTXcEUXu6kry8gfRBjl5ODnVTv/cyLnWk0Apg5Iax3N6
	nuPiT3v5OXHkAaoPg6gQmYBJ135q4RUfRBIcDe+4qNhxSyPhuuhT76w=
X-Gm-Gg: AZuq6aKT/udGaQ9sci558oYafb7A6uFQmv4IJFlQpYu2koc40+9w8Pv+1kjUxlDt/k0
	4JWYZ4PLwCF7TLpbz6R98xrIKc3oZesbZneWn8du/vt1VdmDdxnnbZoI0a51HPpIdgmkE19IkNj
	T8VTV3vZ2Gq90FfCmRVef5bThpcOurtwEHSeI77t/+irf4v8jKWkcM9SNMWtDFtk5Lre6mwiOy/
	+4ZRO3N9rQkLIet/TyCoj5UmkoogxCjF0bku+h31mxnc5w2xve5oUi0XAvoECZIrgD3tJ/otuo4
	KeHwCtaLWVdBf7yqJa4gVkfChTknbs43eIlW6o7WYG6RyBZ6gYse8Uau8hDmvpnBBclXILVoigE
	Fs9rXEGbpS80Qb6iQV1g+Bh+RZc2eZjDfmHpqlyEy9MkKrFz+8dcP3D1rvBZrG5fY9ZJIfANP90
	KAou9hv7VyIc4U8ESicyb+Qy6ITWhbvrQk76ET0RlYJQdYpGxtDRbFPa8Sc0JL2rdOe/l0kuk5f
	+Y=
X-Received: by 2002:a05:6000:2307:b0:437:75c1:5793 with SMTP id ffacd0b85a97d-437978c99fbmr37483846f8f.3.1771528287521;
        Thu, 19 Feb 2026 11:11:27 -0800 (PST)
Received: from archlinux.v.cablecom.net (77-56-128-136.dclient.hispeed.ch. [77.56.128.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad0166sm51696809f8f.35.2026.02.19.11.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 11:11:27 -0800 (PST)
From: Dylan Eray <dylan.eray6@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: luiz.dentz@gmail.com,
	sean.wang@mediatek.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dylan Eray <dylan.eray6@gmail.com>
Subject: [PATCH] Bluetooth: btusb: Add Lite-On 04ca:3807 for MediaTek MT7921
Date: Thu, 19 Feb 2026 20:11:02 +0100
Message-ID: <20260219191102.64722-1-dylan.eray6@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_111130_025633_3452EFF9 
X-CRM114-Status: GOOD (  10.03  )
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


