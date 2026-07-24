Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDE6C531FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 08:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=; b=Jmnhyyzk+a8WrnfAhPG8onm1yY
	/5bHFkmSIX8AGK/zcDX8dK4oBOwJaodR4Z2Kc1l5So2y0KxSMhRUHx6t5N8BTvWFePt5UApnnXNUE
	vORZXVqoyG5ko/0De2l/6MQYtpuYB9yFhuFhJIw7scP0gNef/oufB5R5YHpsBcMxC5zPsOOpEm4y7
	MfDto+BSaP/gb7P1mVkXhjQ98g7vsSTZNEpsb1D/eyF4JXPLkE/6RSCzTvsIJSAuKjNkEbOUDNRDX
	93axgxkjesu6g/zednip/WjEFG4/aEukRjA/zXOGaW9InW1GyY4kZA/x63X4ThH90D8wdQyjDuV3I
	MwBJw1rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWj-0000000FrAH-2VxC;
	Fri, 24 Jul 2026 08:45:05 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWV-0000000FqwQ-1kh3
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 08:44:52 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso152986a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 01:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882690; x=1785487490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=;
        b=XAYNGjVCbMe2jRP6DCStPhh3BrJ4CP8BU07pqRUN5cJpYOz2xxfpCUYG15Y956QzOI
         Mr0RCTR8Zzl/48Pl/zQrDybB4VPWnCbgcOFp5e90SsjK8VL3hLNuVhgVwX3Bl3IFzQxG
         UeNrLULJ03iVJibaD0KYBUYxZ2VEnb481GU2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882690; x=1785487490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=;
        b=InQI1Qg5z8QRAZg+TVasRIekdUimDLwVdiHZgvoMYUgyv3KzOkyZ8AGTgb/HOVhozt
         0dNBtGuNMuc7CxmsgWWtH3oF+OUnj1bqBh+50aitKgG2RsJZjYv0KmAgV/dcEYF4VbBv
         4XI8fDVrorY9edVLMzX+YG9FY1Vk+Q1c5hm5wUwmBKfPfQCoZrPMHy29z5txQ3EJ+aX+
         fuLQpXUveBBCJ4kzz6PyLxud1DCxvLsVjXiN8zjySp9jfoInJU/bpSNvCuvmOkFruHCn
         Fs2GqkuKCk5aefqKCbPHQMhC9I3pwIvfM5qwxjpB86NToMvHdQXC99KOBKxONUUJD1VD
         1CZg==
X-Forwarded-Encrypted: i=1; AHgh+RqEouWURQXZaFjxDBUBzeiihvSzE7UkU587wn/igEzy9dZvaoHxXAMy9uZYYcp9zyuLavLuPsU97/4GRSa/7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxByRI+a0uxGe9SKxjOdmsGjBYgdcwXN4niDhUuDF9BvNhRHFJ
	n7t+IAiryfVl9KNhL9PtgHP7HZJaKwu/4G4r3/hbS8QLmZsmuhwR4cEjrqO4ZXCaKQ==
X-Gm-Gg: AR+sD13jGCr1zSS/1MBYYafqV7z3sUAC0kEKR9Vh3ziV4zzIgo9avTrKOHF7u2K9b5R
	CBDG1NU7Rjwby9b1qGfEELYrKENlvgFC+Fcofq/jkay6Qwt7b7YYDh36HL2W98P5RMfMwbqSDHc
	RANyqp97ZzFVpRZf8L8L6HI4lPJvC5DAhkyVVasHDYHtRfoV4ssoVNQmTv+s6Axg2IcAY/yJjhc
	y/u3gH2R+8239y7R+h0LXv8GMKMIhjzNtJAxoRVJrcl/fNDPpKxTKOxcRG4TFl46Mj1m+ZbCyYj
	AwSkSOTq9BArcETF6HZTFGG6+O43QLhWy/mMOHfUi5/lCirXEmQVpAczE5ea9Germ5t730CveJn
	8PLG7jkgbvSkESLjVqhCBZTakz1kOb2yLp/Ep3Kzo2V29QQR4rPvJW7Ny92vRJLWP+15m6CzoqH
	xwj2qDgfEGm6kxw4GLaxXoUsHb01SP+ZZWgZpAB10gaBX6tTaGyEIg4CkW+0o=
X-Received: by 2002:a17:90b:2750:b0:381:5ab5:b667 with SMTP id 98e67ed59e1d1-38ec6637d1amr6239942a91.31.1784882690591;
        Fri, 24 Jul 2026 01:44:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:49 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Fri, 24 Jul 2026 16:43:18 +0800
Message-ID: <20260724084328.3943997-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014451_467663_6681F2FF 
X-CRM114-Status: GOOD (  11.64  )
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

There are still some instances in the USB hub driver where port power is
directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.

Switch these instances over to usb_hub_set_port_power() so that only one
unified function to do this exists. This makes adding external power
control with the power sequencing API easier and consistently applied.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 6671b5e45191..a5c5038e1604 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -976,11 +976,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
 		dev_dbg(hub->intfdev, "trying to enable port power on "
 				"non-switchable hub\n");
 	for (port1 = 1; port1 <= hub->hdev->maxchild; port1++)
-		if (test_bit(port1, hub->power_bits))
-			set_port_feature(hub->hdev, port1, USB_PORT_FEAT_POWER);
-		else
-			usb_clear_port_feature(hub->hdev, port1,
-						USB_PORT_FEAT_POWER);
+		usb_hub_set_port_power(hub->hdev, hub, port1,
+				       test_bit(port1, hub->power_bits));
 	if (do_delay)
 		msleep(hub_power_on_good_delay(hub));
 }
@@ -5437,7 +5434,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.229.g6434b31f56-goog


