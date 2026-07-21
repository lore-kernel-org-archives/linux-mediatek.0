Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1C5C4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=; b=ZP3SWpkwKpqULB/oS6lVJ/iTrl
	GPjafFzUmYLe8jr/VTA4A0v8zkH+HkB2WxDI++HvSBvXWryRIn5R1jutf5C5Oq0QRX8rWY4ilVx6k
	o6GKHR+8EIdaCNZlc+IPo7gdtv1o+Q553qopvNakCX8IMP8cQua9DuP0INzr7r87OkZ0Azv8az50C
	B+rrZOCzRgbVFs9Sep2siEG4A4GSYlG89NA/ZRwhz8/ETK5K+heBj6cdLt4LFKHbx7sk04+MKPiwL
	b2PcD2Lrg3fkDFTi+dKAkXTIR1nBhyPliwFrPxt25AC0BN7dcWTXp7VtJzIOWqFNWVRU5rL2vKlf4
	153/l+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Nb-00000008aEN-0gvZ;
	Tue, 21 Jul 2026 06:55:03 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NY-00000008aAN-2ESA
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:01 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ceae1ed204so89263915ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 23:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616900; x=1785221700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=CPSlwAHEnwCH2TZmzjvDm/D+iSPSxHarSeWlPl74XPxk66Z6SW/NwxXQeWItbpW3iH
         NhmcS3JfZRXWO6IzfZiEQVwhBz/YwDC4m/gFiAhGWL2oYlhsSc4ywgfQz0V1r/V6EZ/7
         8iLJGcIdRSXuzgMOQ7Fkt7sx1DoI9mtalBbDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616900; x=1785221700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=C3t4gFhabQLx6FpUhLXDz1Nr4XUQx7cu92zm6STz+34sOYfn2nBrO+4NWvgEKvPsPM
         sMBMM5VF0kDyPAh0mnG3Z/itbZ/FI9LyKeFIoiWQ4zoI4rQdr1IkOwTx+hxrXGevT8Bx
         ONEQBvsadBE+QEPzY0wUv7vp1u7p95lpZJw8U77/N+Bc4Su2gKN6gLx8cjuTkD5/ledw
         AYQbXNgBzJW6RzTNEPzOFG/Zv9cNyx/rF69jdd4Q4B1D1PHk74+scfN/Rk+n63niAfGo
         tWSDh2fRk3w1NOMcNzCxBskWevN4070Pen5R3t8fvWpP4hHQWPIciRwnhSxYk7OsoEU7
         ecoA==
X-Forwarded-Encrypted: i=1; AHgh+RpbHWfj4i0ePSKQ+2ga4ozEgJwC5L1Hk7c0AJAyAuvdDa3z/FC5v/kCgKpxel5XPZMRcqfbAqvGwBHFsukL7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV6vr4SXZBmRo0PaTBHUr/SSzalER3kyksvW50x5CQRbnpi1ho
	hJo0NOC33qxK77Mtqp3cqcxwHYYHVq26jlgLB2bKJbnOD42u56WbBlBCr1wDul289w==
X-Gm-Gg: AfdE7ckg9w7Acci1qzQp4t2gh8M24wO6dv9lLnnXLSA+Xj47S9CFX45FV7g741s9MfK
	XbblpiTiMdTkJMUn+jmSTWFi0CtM8bX/hT/Hm4YlkMUydUIK4RQ0BK0MBLSSnOYkkHvGa7A277f
	Nb0m4HUgmtfxoEEX/S2ZFpD1+2qUBfZdWfZcNwkvnWol6e0ktYp8VXktXmr6b4PK0rGaG0ROf0H
	o5ZZwwglvWy9B7UZ3R/G2aJ5PTTz8rKv4jE/v4cgM1gsVwbpOOWuyqHey9JvEQSmrEBP2PLU8Tu
	7p4RnoK0zS22ghtiB5NwAoRvC8r/H9Lv8iAPc8cAUTFb4h7Ksa4WJwj614UsdmzQLlSH1sUHJEs
	TSuIawRV8hQRkmtY1v5w82ljFP+WoM/1bh5MfNq98W9fWEHJ2/JDj6HQZ/h2rm2b1ET18d1O75W
	KSGUmnPPcLLTV5GtYsT42t5m0NPm7+6yyKAtrfsEhlg8FZ7KPSPubronlFuHc=
X-Received: by 2002:a17:903:1a90:b0:2cc:6b7a:dfcb with SMTP id d9443c01a7336-2cf349cc789mr186191295ad.33.1784616899938;
        Mon, 20 Jul 2026 23:54:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:59 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v6 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Tue, 21 Jul 2026 14:54:00 +0800
Message-ID: <20260721065413.2306137-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235500_586808_70490C6C 
X-CRM114-Status: GOOD (  15.83  )
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

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Also rewrite this section into the standard error handling pattern:

    if (error) {
        # handle error
        return error;
    }

    # do more work
    return 0;

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Rewrite into standard error handling pattern

Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 715f26f05a31..8f8624a0d36a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1875,6 +1875,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2006,14 +2007,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
-		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
-
-		return 0;
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret < 0) {
+		hub_disconnect(intf);
+		return ret;
 	}
 
-	hub_disconnect(intf);
-	return -ENODEV;
+	onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
+
+	return 0;
 }
 
 static int
-- 
2.55.0.229.g6434b31f56-goog


