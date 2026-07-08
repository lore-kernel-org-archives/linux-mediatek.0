Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64D6C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dg8dUhD3q+CJyCSEW+eoODBKi7tHbn/E8jcu9sHuzyo=; b=ik0RZBJOaBE6Pl
	4TbC0xz6IGYK1RvJxW1x5pA0+AXvdP9QH6tbxMxiT1F1b5BmsZn/ufCJgxUyKg/0CvXRCf2+qQP5L
	rUTqyTXOUIAIKRv/aasdbGpi5KRtxFdwhv7Z05TMwbGIIDfjCloYONshT6dg1fOTGQ/0oaFrSyqbI
	oTNmLr66Q5nUx+LnnirHM8OrgsNwUzaOeiODNrke3PtDm6IzmFu7LHb2FGdkQZ5NE7kqBa6XOhJic
	Thh2k5XPkyFGOSKTKaykDubm2XpJLXYm2hDQanIF32h5OrkLBkxCLAqILRHF/YRUl/cykJNSWIRa8
	f3y4n/ebVeG1FGyFgwpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQHz-0000000GzRE-2lUJ;
	Wed, 08 Jul 2026 11:18:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQHy-0000000GzPU-0Rh5
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 11:18:03 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493b966dd74so2011525e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509479; x=1784114279; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dg8dUhD3q+CJyCSEW+eoODBKi7tHbn/E8jcu9sHuzyo=;
        b=jM0qQOHtd+EqQgETCDiLMabjAljDPzYJXjiKHtmSAFox8OEU3sYBX3TUkGwBvKyql0
         OUm/arFI1OolNxCfEh23OeVKLulcJhH4hEVlAgCckfjAM4QrdaxQl/nT7tX9bpss1no1
         npTA5pDcuj06UKq6CON6VJjQVZt/tZaBgylY43c9imf0t/c3EOgMstBhWqTifetzlSIe
         lJhubhz/0bw5ALx+6o9vn89st6wq190A+e17CgjqtrsDVdQqzwKWR9cjszMqx5zVHlez
         fCSmcXIgNju5jQb0g6Hn1bSvHYs6K4k5PTlUG5THSfeyz6paprWhC1zJ+INtGDWOdVcr
         Xsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509479; x=1784114279;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dg8dUhD3q+CJyCSEW+eoODBKi7tHbn/E8jcu9sHuzyo=;
        b=DBJCOgF7D+nsKlL8HRCB3oox23n8GJDVaOLRdxMon4bWrb2lDcBBX+i5Ld6mTJV3OT
         zcyiCkfveR1MM0fm+8A8SBRI9sj6CPsqg10TQH8zBHd4f0RcuSQr8FSBWfQVK3xqAlEo
         vqsdkpxZaodtqBEi0PIOo0b+StV0WxaRxUP9XngyTDKAoQWKteJzs3iHKVtC0NUBLyac
         kba1AWMYipo4/QFSF9v3xAP4sJDmvDj1yvES84uQoJT8RtIe0cT8wG000kqPqqFf9PEk
         hWZQHhZtzm0shpQV5L9yKqhDZobaNYteWTq2HGFr1E7NWtrg3V32XhKmqsX4HvgrO7oY
         dXOw==
X-Forwarded-Encrypted: i=1; AHgh+RrL+HeKmaDqOWudya6o5Z5ZZP2vWH8ov8MpiL3k2jJtn/yiW1oyFXtl9XqCsbQ+Q11N+pM8NQVCZ+bJfRraLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV8nRpr87MR0Ia3q8BKfrigfT2e9aGTh+MFvii4aT8XGq61bfH
	8VQeAffHKYTajuoZGRKW4OwdwDp+rzpyoB3WjL6ntv8mJcgLt+ySulZRHAhkBL08hwg=
X-Gm-Gg: AfdE7ck2CKgJ8kF03PItZ7X2H+Q3vANwZhyyY/6IdWCWbM84u76sY0ewQUOqyBt+0LQ
	GpvDO3QhHMWN+nEDyCEm7JLNw9mNKgqXD+l9GJnc8Zp4u12LuIK61fXOKPtYBXF2N+iz3bLXzlN
	DSaULBcaS1fH+M2g5yCCsrqjjjoXgkHDBOBp4bClCY8yEmEfdVQhVnYgKDFd9pKy6apnBHGunD1
	uvclGGwuTJb1gygsI/Bzyrbx6jWoKDlXo7GQHhoaK12VN2f2qj4m7v1hjeyg2EriIkg447loI8W
	RWpzkEvFi6FQ9pfBpkQQbz8+OVj3a8OfjEFpQxwGn1n4i27Y7SwD9heHTSAFncHNeBUs9oWsB/f
	Z3dlEiMJOJHWqtNeJZmfI/PNmJU2Ad1yiG3ue7ipRD2c+iIJLu5u2D9JowCL6QmoALbFHQIOFBy
	r+YXoOoDvwgknedjmBKpUc1erPs9L4XVnGPM9YLRS/R/OvkA+sFR0kfQ+Ti9K6XyC5tAWtolXfO
	LOdLwP8xHLs+oOMsw==
X-Received: by 2002:a05:600c:548f:b0:493:df44:2342 with SMTP id 5b1f17b1804b1-493e6831661mr22461155e9.5.1783509479276;
        Wed, 08 Jul 2026 04:17:59 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa (host-79-16-115-126.retail.telecomitalia.it. [79.16.115.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm37867694f8f.31.2026.07.08.04.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:58 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/2] Stabilize serial line numbers on MediaTek Genio boards
Date: Wed, 08 Jul 2026 13:17:39 +0200
Message-Id: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCQAyE4auUPBtYF1qLVxEf0jhbI2UrGytC6
 d3d6uMPM99KjmJwOjcrFbzNbc41joeG9C55BNutNsUQu3AKPatKnYBHZJt5f8vEMpk4nNGmqLE
 f2pQ6qsSzINnnx1+u//ZleEBfu0nb9gVf1o/ngAAAAA==
X-Change-ID: 20260708-ccaione-genio-serial-aliases-e5f2c28b5ff6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041802_152475_6F45DCDC 
X-CRM114-Status: GOOD (  12.29  )
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

On the MediaTek Genio boards only serial0 is aliased in DT, so every
other enabled UART gets a first-free ttyS line number from the 8250
core at probe time. Line numbers are handed out in probe order, and
probe order is not deterministic once a UART defers on its clocks, so
the console UART can lose ttyS0 to another port.

This was observed on the Genio 700 EVK running the Ubuntu 26.04 generic
kernel: uart0 (the debug console) deferred waiting for its clocks while
uart1 probed first and claimed ttyS0. With console=ttyS0 on the kernel
command line the console then pointed at the wrong UART, and the boot
looked like it had hung on the serial console. The failure is
intermittent and depends purely on probe timing.

Pin the line numbers explicitly instead:

 - Patch 1 aliases every enabled UART on the affected Genio boards
   (mt8365-evk, the mt8390 and mt8395 Genio commons, and the Grinn
   Genio SBC), so DT expresses the intended serial<N> -> ttyS<N>
   mapping.

 - Patch 2 makes the 8250_mtk driver read that alias with
   of_alias_get_id() and seed uart.port.line before registering the
   port, so the 8250 core reserves the requested ttyS slot instead of
   falling back to first-free.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (2):
      arm64: dts: mediatek: alias all enabled serial ports on Genio boards
      serial: 8250_mtk: honor DT serial aliases

 arch/arm64/boot/dts/mediatek/mt8365-evk.dts              | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi    | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi | 2 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi    | 1 +
 drivers/tty/serial/8250/8250_mtk.c                       | 7 ++++++-
 5 files changed, 13 insertions(+), 1 deletion(-)
---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20260708-ccaione-genio-serial-aliases-e5f2c28b5ff6

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


